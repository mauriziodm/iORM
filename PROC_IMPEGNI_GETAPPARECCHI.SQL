SET TERM ^ ;

CREATE PROCEDURE IMPEGNI_GETAPPARECCHI (IN_IDIMPEGNO INTEGER)
  RETURNS (OUTVAL VARCHAR(255))
AS
  DECLARE VARIABLE loc_apparecchio VARCHAR(255);
  DECLARE VARIABLE loc_separator CHAR(1);
BEGIN

  OUTVAL = '';
  loc_separator = ''; 

  /* ============================================================================= */
  /* Costuirce l'elenco degli apparecchi dell'impegno stando attento a non superare i 255 caratteri */
  /* ============================================================================= */
  /* Se è una OP generica per impianto aggiunge la nuova senza specificare l'apparecchio */
  FOR SELECT DISTINCT COALESCE(PA.COSTRUTTORE,'') || ' ' || COALESCE(PA.MODELLO,'') || ' (' || COALESCE(PA.MATRICOLA,'') || ')' AS APPARECCHIO   
    FROM OPIMPEGNO OPI
    JOIN PRATAPPARECCHI PA ON (PA.ID = OPI.IDAPPARECCHIOPRAT)
    WHERE OPI.IDIMPEGNO = :IN_IDIMPEGNO
  INTO :loc_apparecchio 
  DO BEGIN

    IF (  (CHAR_LENGTH(OUTVAL) + CHAR_LENGTH(:loc_apparecchio) + CHAR_LENGTH(:loc_separator )) < 255  ) THEN
      OUTVAL = OUTVAL || loc_separator || :loc_apparecchio;  
    loc_separator = ', '; 

  END 
  /* ============================================================================= */

  SUSPEND;
  EXIT;

END^

SET TERM ; ^


