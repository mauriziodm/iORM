CREATE PROCEDURE MAG_GET_GIACENZE_DETTAGLIO (IN_COD_ART VARCHAR(25), IN_DATA_RICHIESTA TIMESTAMP)

  RETURNS (CODICEARTICOLO VARCHAR(25), 
           CODICEMAGAZZINO INTEGER,
           DESCRIZIONE VARCHAR(20),
           TIPO CHAR(1),
           GIACENZA DECIMAL(10,4),
           IMPEGNATO DECIMAL(10,4),
           ORDINATO DECIMAL(10,4),
           DISPONIBILE DECIMAL(10,4),
           DATACHIUSURAGENERALE TIMESTAMP,
           DATACHIUSURAARTICOLO TIMESTAMP,
           PRIMA_DELLA_CHIUSURA CHAR(1)
          )

AS

  /* Dichiara alcune varibili appoggio */
  DECLARE VARIABLE loc_NascondiChiusure CHAR(1) DEFAULT 'F'; 

  /* Ricava il parametro che indice se bisogna nascondere i dati di chiusura oppure no */
  DECLARE PROGRESS CURSOR FOR
    (
      SELECT FIRST 1 MAG_NASCONDI_CHIUSURE
      FROM PROGRESS
    );

BEGIN

  /* Defaultizzazione */
  CODICEARTICOLO = IN_COD_ART;

  /* Ricava dai parametri e progressivi il parametro che indica se nascondere le chiusure */
  /* e quindi ritornare una giacenza complessiva per magazzino oppure se ritornare  i dati suddivisi */
  /* in chiusura e movimenti successivi */
  OPEN PROGRESS;
  FETCH PROGRESS INTO :loc_NascondiChiusure;
  CLOSE PROGRESS; 

  /* Cicla per tutti i magazzini presenti ed esegue le interrogazioni successive */
  FOR SELECT AM.CODICE, AM.DESCRIZIONE, AM.DATACHIUSURAGENERALE FROM ANAGMAGA AM
  INTO :CODICEMAGAZZINO, :DESCRIZIONE, :DATACHIUSURAGENERALE
  DO BEGIN


    /* Se NON dobbiamo nascondere le chiusure ritorna i dettagli separati delle chiusure stesse e dei movimenti successivi */
    IF (loc_NascondiChiusure = 'F') THEN BEGIN


      /* ---------- CHIUSURA ---------- */
      /* Chiama la procedure che ritorna le giacenze per il magazzino corrente */
      EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :CODICEMAGAZZINO, :IN_DATA_RICHIESTA, 'T', 'F' RETURNING_VALUES :GIACENZA, :IMPEGNATO, :ORDINATO, :DATACHIUSURAARTICOLO, :PRIMA_DELLA_CHIUSURA ;
      /* Imposta anche alcuni altri risultati da ritornare */
      TIPO = 'C';
      DISPONIBILE = GIACENZA - IMPEGNATO;
      /* Ritorna i dati */
      SUSPEND;
      /* ---------- CHIUSURA ---------- */



      /* ---------- MOVIMENTI ---------- */
      /* Chiama la procedure che ritorna le giacenze per il magazzino corrente */
      EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :CODICEMAGAZZINO, :IN_DATA_RICHIESTA, 'F', 'T' RETURNING_VALUES :GIACENZA, :IMPEGNATO, :ORDINATO, :DATACHIUSURAARTICOLO, :PRIMA_DELLA_CHIUSURA ;
      /* Imposta anche alcuni altri risultati da ritornare */
      TIPO = 'M';
      DISPONIBILE = GIACENZA - IMPEGNATO;
      /* Ritorna i dati */
      SUSPEND;
      /* ---------- MOVIMENTI ---------- */


    /* Se invece dobbiamo nascondere le chiusure ritorna la somma delle chiusure stesse e dei movimenti */
    /* successivi senza possiblità di vederne i rispettivi dettagli				 */
    END ELSE BEGIN


      /* ---------- CHIUSURE + MOVIMENTI ---------- */
      /* Chiama la procedure che ritorna le giacenze per il magazzino corrente */
      EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :CODICEMAGAZZINO, :IN_DATA_RICHIESTA, 'T', 'T' RETURNING_VALUES :GIACENZA, :IMPEGNATO, :ORDINATO, :DATACHIUSURAARTICOLO, :PRIMA_DELLA_CHIUSURA ;
      /* Imposta anche alcuni altri risultati da ritornare */
      TIPO = 'A';
      DISPONIBILE = GIACENZA - IMPEGNATO;
      /* Ritorna i dati */
      SUSPEND;
      /* ---------- CHIUSURE + MOVIMENTI ---------- */


    END

  END

  EXIT;

END

