CREATE PROCEDURE MAG_SET_GIACENZA_ARTICOLO (IN_UTENTE VARCHAR(10), IN_COD_ART VARCHAR(25), IN_COD_MAG INTEGER, IN_GIACENZA DECIMAL(10,4), IN_IMPEGNATO DECIMAL(10,4), IN_ORDINATO DECIMAL(10,4), IN_DATA_RICHIESTA TIMESTAMP, IN_EFFETTUA_CHIUSURA CHAR(1) DEFAULT 'F', IN_ESPONI_ERRORI CHAR(1) DEFAULT 'T')
AS

  /* Variabile appoggio */
  DECLARE VARIABLE loc_DataChiusuraGenerale TIMESTAMP;
  DECLARE VARIABLE loc_DataChiusuraArticolo TIMESTAMP;
  DECLARE VARIABLE loc_DataNuovaChiusuraArticolo TIMESTAMP;
  DECLARE VARIABLE loc_DataPrimaDellaChiusura CHAR(1);

  /* Variabili che conterrano i valori da inserire nella chiusura e cioè */
  /* le giacenze risultanti al giorno precedente alla data di chiusura   */
  /* richiesta e che si vuole impostare                                  */
  DECLARE VARIABLE loc_GiacenzaChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_ImpegnatoChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_OrdinatoChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_DisponibileChiusura DECIMAL (10,4);

  /* Query che ricava la data di chiusura generale del magazzino (ANAGMAGA) */
  DECLARE ANAGMAGA CURSOR FOR (SELECT AM.DATACHIUSURAGENERALE FROM ANAGMAGA AM WHERE AM.CODICE = :IN_COD_MAG);

BEGIN

  /* Defaultizzazione */
  IN_GIACENZA 	= COALESCE(IN_GIACENZA,0);
  IN_IMPEGNATO 	= COALESCE(IN_IMPEGNATO,0);
  IN_ORDINATO 	= COALESCE(IN_ORDINATO,0);

  /* Ovviamente la data di chiusura richiesta non può essere nulla */
  IF (IN_DATA_RICHIESTA IS NULL) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_SET_GIACENZA_ARTICOLO: La data di chiusura richiesta è NULL.';

  /* Ricava la data di chiusura generale del magazzino */
  OPEN ANAGMAGA;
  FETCH ANAGMAGA INTO :loc_DataChiusuraGenerale;
  CLOSE ANAGMAGA;

  /* Se il magazzino non è stato trovato ritorna un errore ed esce */
  IF (ROW_COUNT = 0) THEN BEGIN
    IF (IN_ESPONI_ERRORI='F') THEN EXIT;
    EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Procedure MAG_SET_GIACENZA_ARTICOLO: Codice magazzino non trovato in ANAGMAGA.';
  END

  /* Ricava le giacenze alla data richiesta considerando però solo i righi dei documenti e non  */
  /* l'eventuale chiusura. Inoltre ricava anche la data di chiusura più recente tra quella      */
  /* generale e l'eventuale chiusura specifica dell'articolo e del magazzino considerati.	*/
  EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :IN_COD_MAG, :IN_DATA_RICHIESTA, 'F', 'T' RETURNING_VALUES :loc_GiacenzaChiusura, :loc_ImpegnatoChiusura, :loc_OrdinatoChiusura, :loc_DataChiusuraArticolo, :loc_DataPrimaDellaChiusura;

  /* Se l'articolo non è movimentabile solleva una eccezione */
  IF (loc_DataPrimaDellaChiusura = 'N') THEN BEGIN
    IF (IN_ESPONI_ERRORI='F') THEN EXIT;
    EXCEPTION EX_ARTICOLO_NON_MOVIMENTABILE 'Procedure MAG_SET_GIACENZA_ARTICOLO: Articolo non movimentabile.';
  END

  /* La data per la quale si richiede di impostare le giacenze deve necessariamente essere successiva	*/
  /* o uguale alla data della chiusura più recente tra la generale e quella specifica dell'articolo (la */
  /* stored procedure MAG_GET_GIACENZE restituisce la più recente delle due).				*/
  IF (IN_DATA_RICHIESTA < loc_DataChiusuraArticolo) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_SET_GIACENZA_ARTICOLO: La data richiesta non può essere precedente la data di chiusura.';

  /* Ora calcola le quantità che è necessario mettere nel record di chiusura (MAGAZZINI) per ottenere	*/
  /* le giacenze volute alla data voluta.								*/  
  loc_GiacenzaChiusura    = IN_GIACENZA  - loc_GiacenzaChiusura;
  loc_ImpegnatoChiusura   = IN_IMPEGNATO - loc_ImpegnatoChiusura;
  loc_OrdinatoChiusura    = IN_ORDINATO  - loc_OrdinatoChiusura;
  loc_DisponibileChiusura = loc_GiacenzaChiusura - loc_ImpegnatoChiusura;

  /* Elimina l'eventuale record di chiusura precedente */
  DELETE FROM MAGAZZINI MAG WHERE MAG.CODICEARTICOLO = :IN_COD_ART AND MAG.CODICEMAGAZZINO = :IN_COD_MAG;

  /* Ricrea il record di chiusura (prima lo elimino e poi lo ricreo in modo da non dover ogni volta	*/
  /* verificare se esiste già oppure no) con i nuovi dati di chiusura sempre alla stessa data di 	*/
  /* chiusura precedente (la più recente tra quella generica e quella specifica dell'articolo).		*/
  /* Se poi il parametro IN_EFFETTUA_CHIUSURA indica che bisogna fare una chiusura specifica per 	*/
  /* l'articolo allora poi richiamerò l'apposita stored procedure.					*/ 
  /* NB: In questo caso il record lo crea anche se le giacenze sono tutte a zero in modo che rimanda una*/
  /* traccia dell'operazione eseguita (nella chiusura generale invece i record inutili non vengono	*/
  /* ricreati perchè tanto rimane traccia dell'operazione nella tabella ANAGMAGA quindi è inutile e 	*/
  /* dannoso creare record che non servono a nulla.							*/
  INSERT INTO MAGAZZINI
    (
      CODICEARTICOLO,
      CODICEMAGAZZINO,
      GIACENZA,
      IMPEGNATO,
      ORDINATO,
      DISPONIBILE,
      DATACHIUSURA,
      NOTECHIUSURA,
      DATAORAULTMOD,
      UTENTEULTMOD
    )
  VALUES 
    (
      :IN_COD_ART,
      :IN_COD_MAG,
      :loc_GiacenzaChiusura,
      :loc_ImpegnatoChiusura,
      :loc_OrdinatoChiusura,
      :loc_DisponibileChiusura,
      :loc_DataChiusuraArticolo,
      'Variazione giacenza articolo',
      CURRENT_TIMESTAMP,
      :IN_UTENTE
    );

  /* Se il parametro IN_EFFETTUA_CHIUSURA = 'T' significa che l'utente vuole proprio effettuare anche	*/
  /* una chiusura dell'articolo stesso alla data richiesta in modo che tutti i movimenti e le chiusure  */
  /* precedenti vengano ignorati.									*/
  IF (IN_EFFETTUA_CHIUSURA = 'T') THEN BEGIN

    /* Richiama la stored procedure che eseguirà la chiusura specifica dell'articolo */
    /* NB: L'ultimo parametro indica che non si tratta di una chiusura generale ma   */
    /* di una chiusura singola e specifica per l'articolo e il magazzino.  	     */
    EXECUTE PROCEDURE MAG_CHIUSURA_ARTICOLO :IN_UTENTE, :IN_COD_ART, :IN_COD_MAG, :IN_DATA_RICHIESTA, 'F';

  END

END


