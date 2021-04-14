CREATE PROCEDURE GC_TRACK_DOC (IN_TIPO_DOC VARCHAR(25), IN_GUID_REF VARCHAR(40))
  RETURNS (OUTVAR VARCHAR(65))
AS
  DECLARE VARIABLE loc_tipodocumento VARCHAR(25);
  DECLARE VARIABLE loc_numordprev INTEGER;
  DECLARE VARIABLE loc_registro VARCHAR(5);
  DECLARE VARIABLE loc_datadoc TIMESTAMP;
  DECLARE VARIABLE loc_ragsoccli VARCHAR(10);
BEGIN
  /* inizializzazione */
  OUTVAR = '';

  /* Solo se esiste un rigo del documento cercato con lo stesso GUID_REF */
  IF (EXISTS(SELECT 'ESISTE' FROM RIGHIPRV EX WHERE EX.TIPODOCUMENTO=:IN_TIPO_DOC AND EX.GUID_REF=:IN_GUID_REF))
  THEN BEGIN
    SELECT FIRST 1 DISTINCT R.TIPODOCUMENTO, R.NUMORDPREV, R.REGISTRO, CAST(R.DATADOCUMENTO AS VARCHAR(20)), (SELECT SUBSTRING(C.RAGIONESOCIALE FROM 1 FOR 10) AS RAGIONESOCIALE FROM CLIENTI C WHERE C.CODICE=R.CODICECLIENTE)
    FROM RIGHIPRV R
    WHERE R.TIPODOCUMENTO=:IN_TIPO_DOC AND R.GUID_REF=:IN_GUID_REF
    INTO :loc_tipodocumento ,:loc_numordprev, :loc_registro, :loc_datadoc, :loc_ragsoccli;

    /* Costruisce il valore da ritornare */
    IF (IN_TIPO_DOC<>'Bolla_entr' AND IN_TIPO_DOC<>'Fatt.acqui' AND IN_TIPO_DOC<>'Ord.fornit') THEN BEGIN
      OUTVAR = :loc_tipodocumento || ' ' || :loc_numordprev || ' ' || :loc_registro || ' ' || :loc_datadoc;
    END ELSE BEGIN
      OUTVAR = :loc_tipodocumento || ' ' || :loc_numordprev || ' ' || :loc_registro || ' ' || :loc_datadoc || ' ' || :loc_ragsoccli;
    END

  END

  SUSPEND;
  EXIT;
END