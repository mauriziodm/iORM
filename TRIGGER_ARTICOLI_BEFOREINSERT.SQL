CREATE TRIGGER ARTICOLI_BEFOREINSERT FOR ARTICOLI
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN

  /* ============================================================= */
  /* PARTE AGGIORNAMENTO DATE ULTIME MODOFICHE                     */
  /* ------------------------------------------------------------- */
  
  /* Data ultima modifica generale */
  NEW.DATAULTMOD_CREAZIONE = CURRENT_TIMESTAMP;
  NEW.DATAULTMOD_GENERALE  = CURRENT_TIMESTAMP;
  NEW.DATAULTMOD_COSTO     = CURRENT_TIMESTAMP;
  NEW.DATAULTMOD_VENDITA   = CURRENT_TIMESTAMP;

  /* ============================================================= */

END
