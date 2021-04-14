CREATE PROCEDURE GC_CALCOLA_COSTO_MEDIO_ARTICOLO (IN_COD_ART VARCHAR(25), IN_COD_CANT INTEGER, IN_DATA_CANT TIMESTAMP)
  RETURNS (OUTVAR DECIMAL(10,4))
AS
  DECLARE VARIABLE loc_totcosto DOUBLE PRECISION;
  DECLARE VARIABLE loc_totqta DOUBLE PRECISION;
  DECLARE VARIABLE loc_qta DOUBLE PRECISION;
  DECLARE VARIABLE loc_prezzoacquisto DOUBLE PRECISION;
BEGIN
  
  /* --------------------------------------- */
  /* CALCOLO COSTO MEDIO DAI RIGHI           */
  /* --------------------------------------- */
  /* Inizializzazione */
  loc_totqta = 0;
  loc_totcosto = 0;

  /* Esegue la query che preleverà i righidi carico dello stesso articolo e della stessa pratica */
  FOR SELECT
    CASE WHEN (R.GC_QTA_MOD='T') THEN COALESCE(R.GC_QTA,0) ELSE COALESCE(R.QTA,0) END,
    CASE WHEN (R.GC_COSTONETTOUNITARIO_MOD='T') THEN COALESCE(R.GC_COSTONETTOUNITARIO,0) ELSE COALESCE(R.PREZZOACQUISTOARTICOLO,0) END
  FROM RIGHIPRV R
  WHERE
    CODICEARTICOLO=:IN_COD_ART
    AND PRATICA=:IN_COD_CANT
    AND DATAPRATICA1=:IN_DATA_CANT
    AND SEGNOOPERAZIONECANTIERE = '+'
  INTO :loc_qta, :loc_prezzoacquisto
  DO BEGIN
    loc_totqta = loc_totqta + loc_qta;
    loc_totcosto = loc_totcosto + (loc_prezzoacquisto * loc_qta);
  END
    
  /* Se la Qta totale = 0 allora pone il costo medio a 0 */
  IF (loc_totqta = 0) THEN BEGIN
    OUTVAR = 0;
    SUSPEND;
    EXIT;
  /* Altrimenti lo calcola in base ai dati rilevati */
  END ELSE BEGIN
    OUTVAR = (loc_totcosto / loc_totqta);
    SUSPEND;
    EXIT;
  END
  /* --------------------------------------- */

END
