SET TERM ^ ;

CREATE PROCEDURE DISABLE_INDEX_MAGO (IN_DISABLE CHAR(1))
AS
BEGIN

  /* ----------------------------------------------------------------------------------------------------------------- */
  /* Se il parametro ricevuto = 'T' disabilita gli indici perchè rallenterebbero il processo di importazione del magno */
  /*  Se invece è diverso da 'T' li riabilita
  /* ----------------------------------------------------------------------------------------------------------------- */
  IF (IN_DISABLE = 'T') THEN BEGIN
    EXECUTE STATEMENT 'ALTER INDEX GUID_RIGHIPRV INACTIVE';
    EXECUTE STATEMENT 'ALTER INDEX GUID_REF_RIGHIPRV INACTIVE';
  END ELSE BEGIN
    EXECUTE STATEMENT 'ALTER INDEX GUID_RIGHIPRV ACTIVE';
    EXECUTE STATEMENT 'ALTER INDEX GUID_REF_RIGHIPRV ACTIVE';
  END

END^


SET TERM ; ^
