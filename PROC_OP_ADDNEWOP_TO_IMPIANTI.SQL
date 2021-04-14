SET TERM ^ ;

CREATE PROCEDURE OP_ADDNEWOP_TO_IMPIANTI (IDOP VARCHAR(25), TIPOIMPIANTO VARCHAR(20), TIPOAPPARECCHIO VARCHAR(30))
AS

  /* Dati dell'OP */
  DECLARE IDPRATICA INTEGER;
  DECLARE IDAPPARECCHIO INTEGER;

BEGIN

  /* Inizializzazione */
  TIPOAPPARECCHIO = COALESCE(TIPOAPPARECCHIO,'');

  /* Se è una OP generica per impianto */
  IF (TIPOAPPARECCHIO='') THEN BEGIN

    /* ============================================================================= */
    /* Se è una OP GENERICA PER IMPIANTO */
    /* ============================================================================= */
    /* Se è una OP generica per impianto aggiunge la nuova senza specificare l'apparecchio */
    FOR SELECT P.ID FROM PRATICHE P 
        WHERE P.TIPO='A' 
          AND P.TIPOIMPIANTO=:TIPOIMPIANTO 
          AND NOT EXISTS(SELECT OP.ID FROM OPPRATICA OP WHERE OP.IDPRATICA=P.ID AND OP.IDOP=:IDOP AND COALESCE(OP.IDAPPARECCHIOPRAT,0)=0)
    INTO :IDPRATICA
    DO BEGIN
  
      EXECUTE PROCEDURE OP_PRATAPP_ADD (IDPRATICA, NULL, IDOP);
  
    END
    /* ============================================================================= */

  /* Altrimenti è una OP specifica per apparecchio */
  END ELSE BEGIN

    /* ============================================================================= */
    /* Se è una OP SPECIFICA PER APPARECCHIO */
    /* ============================================================================= */
    /* Se è una OP specifica per apparecchioaggiunge la nuova OP agli apparecchio idonei */
    FOR SELECT PA.ID, PA.IDPRATICA FROM PRATAPPARECCHI PA 
        WHERE PA.TIPOIMPIANTO=:TIPOIMPIANTO 
          AND PA.TIPOAPPARECCHIO=:TIPOAPPARECCHIO 
          AND NOT EXISTS(SELECT OP.ID FROM OPPRATICA OP WHERE OP.IDPRATICA=PA.IDPRATICA AND OP.IDOP=:IDOP AND OP.IDAPPARECCHIOPRAT=PA.ID)
    INTO :IDAPPARECCHIO, :IDPRATICA
    DO BEGIN
  
      EXECUTE PROCEDURE OP_PRATAPP_ADD (IDPRATICA, IDAPPARECCHIO, IDOP);
  
    END
    /* ============================================================================= */

  END

  /* Exit */
  EXIT;

END^

SET TERM ; ^
