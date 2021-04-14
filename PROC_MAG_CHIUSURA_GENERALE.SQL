CREATE PROCEDURE MAG_CHIUSURA_GENERALE (IN_UTENTE VARCHAR(10), IN_COD_MAG INTEGER, IN_DATA_RICHIESTA TIMESTAMP)
AS

  /* Variabile appoggio */
  DECLARE VARIABLE loc_DataChiusuraPrecedente TIMESTAMP;
  DECLARE VARIABLE loc_CodiceArticolo VARCHAR(25);

  /* Query che legge la data di chiusura generale precedente nel magazzino richiesto */
  DECLARE ANAGMAGA CURSOR FOR (SELECT AM.DATACHIUSURAGENERALE FROM ANAGMAGA AM WHERE AM.CODICE = :IN_COD_MAG); 

BEGIN

  /* Ovviamente la data di chiusura richiesta non può essere nulla */
  IF (IN_DATA_RICHIESTA IS NULL) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_CHIUSURA_GENERALE: La data di chiusura richiesta è NULL.';
  
  /* Prima di tutto ricava la data di chiusura precedente nell'archivio ANAGMAGA in modo da */
  /* poter verificare che non sia antecedente ad una eventuale precedente chiusura.         */
  OPEN ANAGMAGA;
  FETCH ANAGMAGA INTO :loc_DataChiusuraPrecedente;
  CLOSE ANAGMAGA;

  /* Se il magazzino a cui sto cercando di fare la chiusura nemmeno esiste ovviamente */
  /* ritorna un errore e ferma tutto.						      */
  IF (ROW_COUNT = 0) THEN EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Procedure MAG_CHIUSURA_GENERALE: Codice magazzino non trovato in ANAGMAGA.';

  /* Verifica che la data di chiusura richiesta non sia antecedente (o uguale) a quella di una eventuale chiusura precedente */
  IF (IN_DATA_RICHIESTA <= loc_DataChiusuraPrecedente) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_CHIUSURA_GENERALE: La data di chiusura richiesta è antecedente a quella già presente.';

  /* Cicla per tutti gli articoli dell'archivio articoli ed effettua la chiusura per ciascuno di loro */
  FOR SELECT ART.CODICEARTICOLO FROM ARTICOLI ART WHERE TRIM(ART.CODICEARTICOLO) <> '' AND ART.ABILITAMOVMAG <> 'F'
  INTO :loc_CodiceArticolo
  DO BEGIN

    /* Effettua la chiusura dell'articolo corrente */
    EXECUTE PROCEDURE MAG_CHIUSURA_ARTICOLO :IN_UTENTE, :loc_CodiceArticolo, :IN_COD_MAG, :IN_DATA_RICHIESTA, 'T';

  END

  /* Se tutto è andato bene aggiorna il record del magazzino (ANAGMAGA) con la nuova data di chiusura */
  UPDATE ANAGMAGA AM SET
    AM.DATACHIUSURAGENERALE = :IN_DATA_RICHIESTA,
    AM.DATAORAULTIMACHIUSURA = CURRENT_TIMESTAMP,
    AM.UTENTEULTIMACHIUSURA = :IN_UTENTE,
    AM.NOTECHIUSURA = 'Chiusura generale.'
  WHERE AM.CODICE = :IN_COD_MAG;

END


