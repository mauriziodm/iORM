CREATE TRIGGER ARTICOLI_BEFOREUPDATE FOR ARTICOLI
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN

  /* ============================================================= */
  /* PARTE AGGIORNAMENTO DATE ULTIME MODOFICHE                     */
  /* ------------------------------------------------------------- */
  
  /* Data ultima modifica generale */
  NEW.DATAULTMOD_GENERALE = CURRENT_TIMESTAMP;

  /* Data ultima modifica dei dati riguardanti il costo */
  IF (NEW.PREZZODILISTINO <> OLD.PREZZODILISTINO OR NEW.COSTOREALE <> OLD.COSTOREALE)
  THEN NEW.DATAULTMOD_COSTO = CURRENT_TIMESTAMP;

  /* Data ultima modifica dei dati riguardanti i prezzi di vendita */
  IF (NEW.ULTIMOPRZACQUISTO <> OLD.ULTIMOPRZACQUISTO 
   OR NEW.PREZZODIVENDITA  <> OLD.PREZZODIVENDITA
   OR NEW.PREZZODIVENDITA2 <> OLD.PREZZODIVENDITA2
   OR NEW.PREZZODIVENDITA3 <> OLD.PREZZODIVENDITA3
   OR NEW.PREZZODIVENDITA4 <> OLD.PREZZODIVENDITA4)
  THEN NEW.DATAULTMOD_VENDITA = CURRENT_TIMESTAMP;

  /* ============================================================= */

END
