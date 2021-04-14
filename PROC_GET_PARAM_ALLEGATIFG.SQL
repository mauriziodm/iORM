SET TERM ^ ;

CREATE PROCEDURE GET_PARAM_ALLEGATIFG (IN_IDPRATICA INTEGER)
RETURNS
(     DefaultAllegatiFGPrinterName VARCHAR(30),
      DefaultAllegatoFFileName VARCHAR(50),
      DefaultAllegatoGFileName VARCHAR(50),
      DefaultAllegatoRCEE1FileName VARCHAR(50),
      DefaultAllegatoRCEE1BFileName VARCHAR(50),
      DefaultAllegatoRCEE2FileName VARCHAR(50),
      DefaultAllegatoRCEE3FileName VARCHAR(50),
      DefaultAllegatoRCEE4FileName VARCHAR(50)
)
AS
  DECLARE ENTE_ID INTEGER;
BEGIN

  /* Prima di tutto prende i parametri generali */
  SELECT FIRST 1
      COALESCE(DefaultAllegatiFGPrinterName,'')
  FROM PROGRESS
  INTO :DefaultAllegatiFGPrinterName;

  /* Carica alcuni dati della pratica in particolare l'ID dell'Ente */
  SELECT COALESCE(ENTE_ID,0)
  FROM PRATICHE
  WHERE ID = :IN_IDPRATICA
  INTO :ENTE_ID;

  /* Carica i parametri da usare per gli allegati */
  SELECT 
    COALESCE(EAM.IMP_TERM_ALL_F_STMMOD_FILENAME, ''),
    COALESCE(EAM.IMP_TERM_ALL_G_STMMOD_FILENAME, ''),
    COALESCE(EAM.TERM_RCEE1_STMMOD_FILENAME, ''),
    COALESCE(EAM.TERM_RCEE1B_STMMOD_FILENAME, ''),
    COALESCE(EAM.FRIGO_RCEE2_STMMOD_FILENAME, ''),
    COALESCE(EAM.SCAMB_RCEE3_STMMOD_FILENAME, ''),
    COALESCE(EAM.COGEN_RCEE4_STMMOD_FILENAME, '')
  FROM ENTI_X_ALLEGATI_MANUT EAM
  WHERE EAM.ID = :ENTE_ID
  INTO :DefaultAllegatoFFileName,
       :DefaultAllegatoGFileName,
      DefaultAllegatoRCEE1FileName,
      DefaultAllegatoRCEE1BFileName,
      DefaultAllegatoRCEE2FileName,
      DefaultAllegatoRCEE3FileName,
      DefaultAllegatoRCEE4FileName;

  /* Ritorna il risultato ed esce */
  SUSPEND;
  EXIT;

END^

SET TERM ; ^


