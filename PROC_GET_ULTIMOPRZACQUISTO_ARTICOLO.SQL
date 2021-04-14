CREATE PROCEDURE GET_ULTIMOPRZACQUISTO_ARTICOLO (IN_COD_ART VARCHAR(25))
  RETURNS (OUTVAR DECIMAL(10,4))
AS
  DECLARE VARIABLE loc_BolleEntr CHAR(1);
  DECLARE VARIABLE loc_FattAcqui CHAR(1);
  DECLARE VARIABLE loc_ImportoRigo DECIMAL(10,4);
  DECLARE VARIABLE loc_Qta DECIMAL(10,4);
  DECLARE P CURSOR FOR (SELECT FIRST 1 COALESCE(ULTPRZACQ_BOLLEENTR,'T'), COALESCE(ULTPRZACQ_FATTACQUI,'T') FROM PROGRESS);
  DECLARE A CURSOR FOR (SELECT FIRST 1 COALESCE(ULTIMOPRZACQUISTO,0) FROM ARTICOLI WHERE CODICEARTICOLO=:IN_COD_ART);
  DECLARE R CURSOR FOR (SELECT FIRST 1 COALESCE(IMPORTORIGO,0), COALESCE(QTA,0)	 FROM RIGHIPRV WHERE IMPORTORIGO<>0 AND IMPORTORIGO IS NOT NULL AND CODICEARTICOLO=:IN_COD_ART AND ((TIPODOCUMENTO='Bolla_entr' AND :loc_BolleEntr<>'F') OR (TIPODOCUMENTO='Fatt.acqui' AND :loc_FattAcqui<>'F')) ORDER BY DATADOCUMENTO DESC);
BEGIN
  /* Inizializzazione */
  OUTVAR = 0;

  /* Carica dai progressivi i parametri che indicano quali documenti considerare nel cercare l'ultimo prezzo di acquisto */
  OPEN P;
  FETCH P INTO :loc_BolleEntr, :loc_FattAcqui;
  CLOSE P;

  /* Cerca nei righi dei documenti di acquisto abilitati a tale scopo l'ultimo acquisto effettuato per l'articolo */
  OPEN R;
  FETCH R INTO :loc_ImportoRigo, :loc_Qta;
  CLOSE R;

  /* Se è stato trovato un rigo calcola l'ultimo costo da ritornare */
  IF (ROW_COUNT > 0) THEN BEGIN
    IF (loc_qta <> 0) THEN OUTVAR = loc_ImportoRigo / loc_qta;  
  END

  /* Se OUTVAR = 0 allora esegue la query che prende l'ultimo prezzo di acquisto dalla scheda anagrafica articolo */
  IF (OUTVAR = 0) THEN BEGIN
    OPEN A;
    FETCH A INTO :OUTVAR;
    CLOSE A;
  END

  /* Se a questo punto OUTVAR = 0 (potrebbe esserlo se non è stato trovato ne un rigo ne la scheda anagrafica dell'articolo */
  IF (OUTVAR IS NULL) THEN OUTVAR = 0;

  /* Ritorna il risultato ed esce */
  SUSPEND;
  EXIT;

END

