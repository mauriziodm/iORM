SET TERM ^ ;

CREATE PROCEDURE IMPAPPSEL_GETSELECTED (IN_IDIMPEGNO INTEGER, IN_IDAPPARECCHIOPRAT INTEGER)
  RETURNS (OUTVAR CHAR(1))
AS
BEGIN

  /* Inizializzazione */
  OUTVAR = 'T';

  /* Se l'aparecchio (relativo all'impegno) viene trovato in questa tabella che è di esclusione */
  /*  significa che l'apparecchio non è selezionato */
  IF (EXISTS(SELECT IAS.IDIMPEGNO FROM IMPEGNI_APPSEL IAS WHERE  IAS.IDIMPEGNO=:IN_IDIMPEGNO AND IAS.IDAPPARECCHIOPRAT=:IN_IDAPPARECCHIOPRAT)) THEN BEGIN
    OUTVAR = 'F';
  END

  /* Ritorna il valore ed esce */
  SUSPEND;
  EXIT;

END^

SET TERM ; ^
