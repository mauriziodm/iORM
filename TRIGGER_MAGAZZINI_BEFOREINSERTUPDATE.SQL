CREATE TRIGGER MAGAZZINI_BEFOREINSERTUPDATE FOR MAGAZZINI
ACTIVE BEFORE INSERT OR UPDATE
AS

  DECLARE VARIABLE loc_DataChiusuraGenerale TIMESTAMP;
  DECLARE VARIABLE loc_CodMag INTEGER;

  /* Query che ricava la data di chiusura generale del magazzino */
  DECLARE ANAGMAGA CURSOR FOR (SELECT COALESCE(DATACHIUSURAGENERALE,'01/01/1900') FROM ANAGMAGA WHERE CODICE = :loc_CodMag);

BEGIN

  /* Mette il codice magazzino nella variabile locale (se non faccio così mi da un errore) */
  loc_CodMag = NEW.CODICEMAGAZZINO;

  /* Prima di tutto ricava la data di chiusura generale del magazzino relativo */
  OPEN ANAGMAGA;
  FETCH ANAGMAGA INTO :loc_DataChiusuraGenerale;
  CLOSE ANAGMAGA;

  /* Se il magazzino non è stato trovato solleva una eccezione */
  IF (ROW_COUNT = 0) THEN EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Trigger MAGAZZINI_BEFOREINSERTUPDATE: Codice magazzino non trovato.';

  /* Si assicura che la data di chiusura non sia nulla oppure precedente alla data di chiusura */
  /* generale del relativo magazzino, se il relativo non esiste ritorna un errore              */
  /* NB: La nuova data di chiiusura richiesta non deve essere precedente nemmeno alla data di  */
  /*     chiusura precedente la modifica del record stesso (chiusura specifica dell'articolo   */
  /*     ovviamente solo in caso di UPDATE perchè in INSERT non ha senso.		       */	
  IF (NEW.DATACHIUSURA IS NULL) THEN NEW.DATACHIUSURA = loc_DataChiusuraGenerale;
  ELSE IF (NEW.DATACHIUSURA < loc_DataChiusuraGenerale) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Trigger MAGAZZINI_BEFOREINSERTUPDATE: La data di chiusura richiesta è precedente la data di chiusura generale.';
  ELSE IF (UPDATING AND OLD.DATACHIUSURA IS NOT NULL AND NEW.DATACHIUSURA < OLD.DATACHIUSURA) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Trigger MAGAZZINI_BEFOREINSERTUPDATE: La data di chiusura richiesta è precedente la data di chiusura esistente.';


END
