SET TERM ^ ;

/* Questa SP ritorna True se c'è almeno una chiamata/appuntamento urgente per l'impianto specificato */

CREATE PROCEDURE SOGG_CHIAMATE_EXISTS (IN_ID INTEGER)
  RETURNS (OUTVAL CHAR(1))
AS
BEGIN

  /* Appuntamento preso */
  IF (EXISTS(SELECT I.ID FROM IMPEGNI I WHERE I.CLIENTE=:IN_ID AND I.TIPOIMPEGNO='Appuntamento')) THEN
  BEGIN
    OUTVAL = 'A';
    SUSPEND;
    EXIT;
  END

  /* Chiamata ricevuta */
  IF (EXISTS(SELECT I.ID FROM IMPEGNI I WHERE I.CLIENTE=:IN_ID AND I.TIPOIMPEGNO='Chiamata')) THEN
  BEGIN
    OUTVAL = 'T';
    SUSPEND;
    EXIT;
  END

  /* Altrimenti */
  OUTVAL = 'F';
  SUSPEND;
  EXIT;

END^

SET TERM ; ^


