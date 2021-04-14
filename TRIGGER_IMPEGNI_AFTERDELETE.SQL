CREATE TRIGGER IMPEGNI_AFTERDELETE FOR IMPEGNI
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN

  /* Elimina le OP relative al documento eliminato */
  DELETE FROM OPIMPEGNO OPI
  WHERE OPI.IDIMPEGNO = OLD.ID;

  /* Elimina gli allegati relativi al documento eliminato */
  DELETE FROM ALLEGATI_MANUT AM
  WHERE AM.IDIMPEGNO = OLD.MASTER_ID;

  /* Elimina il riferimento reciproco tra l'impegno e l'eventuale task */
  DELETE FROM IMPEGNI_TASKS IT
  WHERE IT.MASTER_ID = OLD.MASTER_ID;

  /* Elimina il riferimento reciproco tra l'impegno e l'eventuale evento di google calendar */
  DELETE FROM IMPEGNI_GCAL IGC
  WHERE IGC.MASTER_ID = OLD.MASTER_ID;

END
