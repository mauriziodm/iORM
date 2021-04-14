CREATE TRIGGER COM_MESSAGGI_BEFOREUPDATE FOR COM_MESSAGGI
ACTIVE BEFORE UPDATE
AS
BEGIN

  /* ============================================================= */
  /* PARTE AGGIORNAMENTO DATE ULTIME MODOFICHE                     */
  /* ------------------------------------------------------------- */
  
  /* Data ultima modifica generale */
  NEW.DATAULTMOD_GENERALE = CURRENT_TIMESTAMP;

  /* ============================================================= */

END
