CREATE TRIGGER COM_MESSAGGI_BEFOREINSERT FOR COM_MESSAGGI
ACTIVE BEFORE INSERT
AS
BEGIN

  /* ============================================================= */
  /* PARTE AGGIORNAMENTO DATE ULTIME MODOFICHE                     */
  /* ------------------------------------------------------------- */
  
  /* Data ultima modifica generale */
  NEW.DATAULTMOD_CREAZIONE = CURRENT_TIMESTAMP;
  NEW.DATAULTMOD_GENERALE  = CURRENT_TIMESTAMP;

  /* ============================================================= */

END
