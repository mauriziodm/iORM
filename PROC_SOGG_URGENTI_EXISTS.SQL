SET TERM ^ ;

/* Questa SP ritorna True se c'è almeno una chiamata/appuntamento urgente per l'impianto specificato */

CREATE PROCEDURE SOGG_URGENTI_EXISTS (IN_ID INTEGER)
  RETURNS (OUTVAL CHAR(1))
AS
BEGIN

  IF (EXISTS(SELECT I.ID FROM IMPEGNI I WHERE I.CLIENTE=:IN_ID AND I.TIPOIMPEGNO<>'Intervento' AND I.URGENTE='T'))
    THEN OUTVAL = 'T';
    ELSE OUTVAL = 'F';

  SUSPEND;
  EXIT;

END^

SET TERM ; ^


