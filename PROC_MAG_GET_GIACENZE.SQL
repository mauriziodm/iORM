SET TERM ^ ;

CREATE PROCEDURE MAG_GET_GIACENZE (IN_COD_ART VARCHAR(25), IN_COD_MAG INTEGER, IN_DATA_RICHIESTA TIMESTAMP, USE_CHIUSURE CHAR(1) DEFAULT 'T', USE_MOVIMENTI CHAR(1) DEFAULT 'T', MAG1_ONLY CHAR(1) DEFAULT 'F', MAG2_INVERTED CHAR(1) DEFAULT 'T')
  RETURNS (OUT_GIACENZA DECIMAL(10,4), OUT_IMPEGNATO DECIMAL(10,4), OUT_ORDINATO DECIMAL(10,4), OUT_DATACHIUSURA TIMESTAMP, OUT_PRIMA_DELLA_CHIUSURA CHAR(1))
AS

  DECLARE VARIABLE loc_Mag2_giacenza DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_giacenza DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_impegnato DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_ordinato DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_AbilitaMovMag CHAR(1) DEFAULT 'T';	

  /* Query che prende dalla tabella ANAGMAGA la data della chiusura generale del magazzino richiesto */
  DECLARE ANAGMAGA CURSOR FOR
    (
      SELECT DATACHIUSURAGENERALE
      FROM ANAGMAGA
      WHERE CODICE = :IN_COD_MAG
    );

  /* Query che caricherà la data di chiusura dell'articolo se esiste */
  DECLARE CHIUSURA CURSOR FOR
    (
      SELECT GIACENZA, IMPEGNATO, ORDINATO, DATACHIUSURA 
      FROM MAGAZZINI
      WHERE CODICEMAGAZZINO = :IN_COD_MAG 
        AND CODICEARTICOLO = :IN_COD_ART 
        AND DATACHIUSURA >= :OUT_DATACHIUSURA
    );

  /* Query che preleverà i movimenti dai righi dei documenti */
  /* NB: In fondo alla query forza l'utilizzo di un PLAN con l'indice MAG_RIGHIPRV perchè altrimenti lui ne usava un altro ed era molto più lento */
  DECLARE MOVIMENTI CURSOR FOR
    (
      SELECT SUM(R1.COMPUTED_MAG_QTA), SUM(R1.COMPUTED_MAG_IMP), SUM(R1.COMPUTED_MAG_ORD)
      FROM RIGHIPRV R1
      WHERE R1.CODICEARTICOLO = :IN_COD_ART 
        AND R1.CODICEMAGAZZINO = :IN_COD_MAG 
        AND R1.DATADOCUMENTO BETWEEN :OUT_DATACHIUSURA AND :IN_DATA_RICHIESTA
      PLAN (R1 INDEX (MAG_RIGHIPRV))
    );

  /* Query che preleverà i movimenti dai righi dei documenti relativamente al MAGAZZINO2 */
  DECLARE MOVIMENTI2 CURSOR FOR
    (
      SELECT SUM(R2.COMPUTED_MAG_QTA2)
      FROM RIGHIPRV R2
      WHERE R2.CODICEARTICOLO = :IN_COD_ART 
        AND R2.CODICEMAGAZZINO2 = :IN_COD_MAG 
        AND R2.DATADOCUMENTO BETWEEN :OUT_DATACHIUSURA AND :IN_DATA_RICHIESTA
      PLAN (R2 INDEX (MAG2_RIGHIPRV))
    );

  /* Query che ricava il flag ABILITAMOVMAG dell'articolo */
  DECLARE ARTICOLI CURSOR FOR (SELECT COALESCE(ABILITAMOVMAG,'T') FROM ARTICOLI WHERE CODICEARTICOLO = :IN_COD_ART);

BEGIN

  /* Defaultizzazione parametri */
  IN_DATA_RICHIESTA = COALESCE(IN_DATA_RICHIESTA,'12/31/2900');
  OUT_PRIMA_DELLA_CHIUSURA = 'F';

  /* Ricava il flag che indica se l'articolo è abilitato ai movimenti di magazzino */
  /* e se non lo è fa in modo che ritorni sempre 0 come giacenze e 		   */	
  /* OUT_PRIMA_DELLA_CHIUSURA ritorni 'N'.					   */
  OPEN ARTICOLI;
  FETCH ARTICOLI INTO :loc_AbilitaMovMag;
  CLOSE ARTICOLI;

  /* Se l'articolo non è movimentabile ritorna tutti zeri */
  IF (loc_AbilitaMovMag = 'F') THEN BEGIN
    OUT_GIACENZA = 0;    
    OUT_IMPEGNATO = 0;    
    OUT_ORDINATO = 0;  
    OUT_DATACHIUSURA = '01/01/1900';
    OUT_PRIMA_DELLA_CHIUSURA = 'N';
    SUSPEND;
    EXIT;
  END 

  /* Ricava la data di chiusura generale dalla tabella ANAGMAGA */
  OPEN ANAGMAGA;
  FETCH ANAGMAGA INTO :OUT_DATACHIUSURA;
  CLOSE ANAGMAGA;

  /* Cerca se c'è una chiusura per l'articolo e per il magazzino richiesti con data compresa entro la data di chiusura generale 	*/
  /* e la da richiesta dall'utente.													*/
  /* NB: Se ne trova una significa che questa ha sicuramente una data successiva o uguale alla data di chiusura generale (DATACHIUSURA>=:IN_DATA_CHIUSURA_GENERALE */
  /*     per cui se la trova ne assegna la data senza necessità di verificare la date. */
  OPEN CHIUSURA;
  FETCH CHIUSURA INTO :loc_ch_giacenza, :loc_ch_impegnato, :loc_ch_ordinato, :OUT_DATACHIUSURA;
  CLOSE CHIUSURA;

  /* Se l'apposito parametro dice che non dobbiamo tenere conto delle giacenze della chiusura azzera le variabili */
  /* locali con le giacenze della eventuale chiusura. Faccio così perchè cmq. la query qui sopra devo comunque    */
  /* eseguirla perchè potrebbe esserci una data di chiusura di cui devo cmq. tenere conto.			  */
  IF (USE_CHIUSURE = 'F' OR ROW_COUNT = 0) THEN BEGIN
    loc_ch_giacenza = 0;  
    loc_ch_impegnato = 0;  
    loc_ch_ordinato = 0;  
  END

  /* Apre la query che calcola le giacenze in base all'eventuale dato di chiusura e ai movimenti entrandi compresi nell'intervallo di date */
  /*  compreso tra la più recente tra la data di chiusura generale o quella specifica dell'articolo e la data alla quale si richiede la giacenza */
  /*  NB: Solo se l'apposito parametro dice che dobbiamo tenere conto dei movimenti dei documenti */
  IF (USE_MOVIMENTI = 'T') THEN BEGIN

    /* Movimenti magazzino 1 */
    OPEN MOVIMENTI;
    FETCH MOVIMENTI INTO :OUT_GIACENZA, :OUT_IMPEGNATO, :OUT_ORDINATO;
    CLOSE MOVIMENTI;

    /* Movimenti magazzino2 */
    IF (MAG1_ONLY = 'F') THEN BEGIN
      OPEN MOVIMENTI2;
      FETCH MOVIMENTI2 INTO :loc_Mag2_giacenza;
      CLOSE MOVIMENTI2;
      // Inversione della giacenza del MAG2 se abilitata
      // NB: Mag2 è già invertito di suo quindi
      IF (MAG2_INVERTED = 'F') THEN loc_Mag2_giacenza = 0 - loc_Mag2_giacenza;
    END ELSE loc_Mag2_giacenza = 0;

  END

  /* Somma i dati di chiusura con i dati dei movimenti */
  OUT_GIACENZA  = COALESCE(OUT_GIACENZA,0)  + COALESCE(loc_Mag2_giacenza,0) + loc_ch_giacenza;
  OUT_IMPEGNATO = COALESCE(OUT_IMPEGNATO,0) + loc_ch_impegnato;
  OUT_ORDINATO  = COALESCE(OUT_ORDINATO,0)  + loc_ch_ordinato;

  /* Imposta il flag che indica se la data richiesta è precedente alla chiusura quindi non attendibile (per eventuali segnalazioni) */
  IF (IN_DATA_RICHIESTA < OUT_DATACHIUSURA)
    THEN OUT_PRIMA_DELLA_CHIUSURA = 'T';
    ELSE OUT_PRIMA_DELLA_CHIUSURA = 'F';

  SUSPEND;
  EXIT;

END^

SET TERM ; ^


