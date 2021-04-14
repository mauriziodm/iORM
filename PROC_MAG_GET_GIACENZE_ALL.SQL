CREATE PROCEDURE MAG_GET_GIACENZE_ALL (IN_COD_ART VARCHAR(25), IN_DATA_RICHIESTA TIMESTAMP, USE_CHIUSURE CHAR(1) DEFAULT 'T', USE_MOVIMENTI CHAR(1) DEFAULT 'T', MAG1_ONLY CHAR(1) DEFAULT 'F', MAG2_INVERTED CHAR(1) DEFAULT 'T')
  RETURNS (OUT_GIACENZA DECIMAL(10,4), OUT_IMPEGNATO DECIMAL(10,4), OUT_ORDINATO DECIMAL(10,4), OUT_PRIMA_DELLA_CHIUSURA CHAR(1))
AS

  DECLARE VARIABLE loc_CodMag INTEGER;
  DECLARE VARIABLE loc_DataChiusura TIMESTAMP;
  DECLARE VARIABLE loc_ch_giacenza DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_impegnato DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_ordinato DECIMAL(10,4) DEFAULT 0;
  DECLARE VARIABLE loc_ch_PrimaDellaChiusura CHAR(1) DEFAULT 'F';

BEGIN

  /* Defaultizzazione */
  OUT_GIACENZA = 0;
  OUT_IMPEGNATO = 0;
  OUT_ORDINATO = 0;
  OUT_PRIMA_DELLA_CHIUSURA = 'F';

  /* Imposta la query che ciclerà per tutti i magazzini presenti nell'azienda */
  /*  e richiederà la giacenza per ognuno di essi e poi ritornerà la giacenza */
  /*  complessiva di tutti i magazzini.					      */
  FOR SELECT AM.CODICE FROM ANAGMAGA AM
  INTO :loc_CodMag
  DO BEGIN

    /* Chiama la procedure che ritorna le giacenze per il magazzino corrente */
    EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :loc_CodMag, :IN_DATA_RICHIESTA, :USE_CHIUSURE, :USE_MOVIMENTI, :MAG1_ONLY, :MAG2_INVERTED  RETURNING_VALUES :loc_ch_giacenza, :loc_ch_impegnato, :loc_ch_ordinato, :loc_DataChiusura, :loc_ch_PrimaDellaChiusura;

    /* Somma le giacenze appena ottenute ai totali da ritornare */
    OUT_GIACENZA = OUT_GIACENZA + loc_ch_giacenza;
    OUT_IMPEGNATO = OUT_IMPEGNATO + loc_ch_impegnato;
    OUT_ORDINATO = OUT_ORDINATO + loc_ch_ordinato;

    /* Per quanto riguarda il flag che indica se la data richiesta è precedente alla data di chiusura */
    /* se la data richiesta è precedente ad almeno una data di chiusura anche di un solo magazzino    */
    /* ritorna 'T'.										      */
    IF (loc_ch_PrimaDellaChiusura = 'T' OR loc_ch_PrimaDellaChiusura = 'N') THEN OUT_PRIMA_DELLA_CHIUSURA = loc_ch_PrimaDellaChiusura;

  END

  /* Ritorna quanto ottenuto ed esce */
  SUSPEND;
  EXIT;

END


