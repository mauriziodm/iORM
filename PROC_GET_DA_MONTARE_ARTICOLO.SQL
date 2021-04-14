CREATE PROCEDURE GET_DA_MONTARE_ARTICOLO (IN_COD_ART VARCHAR(25), IN_COD_CANT INTEGER, IN_DATA_CANT TIMESTAMP, IN_TIPODOC VARCHAR(25), IN_NUMDOC INTEGER, IN_REGDOC VARCHAR(5), IN_DATADOC TIMESTAMP)
  RETURNS (OUTVAR DECIMAL(10,4))
AS
  DECLARE VARIABLE LocCurrQta DECIMAL(10,4);
  DECLARE VARIABLE LocAzioneCant CHAR(1);
  DECLARE VARIABLE LocCurrGcQta DECIMAL(10,4);
  DECLARE VARIABLE LocCurrGcQtaMod CHAR(1);
BEGIN
  /* Inizializzazione */
  OUTVAR = 0;
  /* Apre una query con l'elenco di tutti i righi che in qualche modo hanno a che fare 		*/
  /* con la giacenza e con il montato dell'articolo specificato e per il cantiere specificato 	*/
  FOR SELECT COALESCE(QTA,0), COALESCE(GC_QTA,0), COALESCE(GC_QTA_MOD,'F'), COALESCE(SEGNOOPERAZIONECANTIERE,'') FROM RIGHIPRV
    WHERE CODICEARTICOLO IS NOT NULL
      AND CODICEARTICOLO = :IN_COD_ART
      AND PRATICA = :IN_COD_CANT
      AND DATAPRATICA1 = :IN_DATA_CANT
      AND SEGNOOPERAZIONECANTIERE IS NOT NULL
      AND (SEGNOOPERAZIONECANTIERE = '+' OR SEGNOOPERAZIONECANTIERE = '-')
      AND NOT (TIPODOCUMENTO = :IN_TIPODOC AND NUMORDPREV = :IN_NUMDOC AND REGISTRO = :IN_REGDOC AND DATADOCUMENTO = :IN_DATADOC)
  INTO :LocCurrQta, :LocCurrGcQta, :LocCurrGcQtaMod, :LocAzioneCant
  DO BEGIN
    /* Se nel rigo del GC è stata specifica una Qta personalizzata usa quella */
    IF (LocCurrGcQtaMod = 'T') THEN LocCurrQta = LocCurrGcQta;
  
    /* In base al segno del rigo (azione di cantiere) somma o sottrae la Qta del rigo attuale	*/
    /* alla variabile OUTVAR così alla fine otterremo il residuo da Montare rispetto alla 	*/
    /* giacenza e in base a questo poi Levante segnalerà o meno se si è cercato di scaricare	*/
    /* più articoli di quanti si potrebbe 							*/
    /* NB: ORA NON CONSIDERA PIU' IL MONTATO MA SOLO LA NORMALE GIACENZA PERCHE' TANTO IL MONTATO*/
    /*     NON LO USA NESSUNO INOLTRE ORA VIENE USATO PER ALTRI MOTIVI (COME UN JOLLY)          */
    IF      (LocAzioneCant = '+') THEN OUTVAR = OUTVAR + LocCurrQta;
    ELSE IF (LocAzioneCant = '-') THEN OUTVAR = OUTVAR - LocCurrQta;
  END
  /* Ritorna il valore ottenuto ed esce */
  SUSPEND;
  EXIT;

END
