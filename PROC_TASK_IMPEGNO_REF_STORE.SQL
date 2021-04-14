SET TERM ^ ;

CREATE PROCEDURE TASK_IMPEGNO_REF_STORE (IN_MASTER_ID INTEGER, IN_TASK_ID VARCHAR(60), IN_TASK_LISTID VARCHAR(60))
AS

  DECLARE PREC_TASK_ID VARCHAR(60);
  DECLARE PREC_TASK_LISTID VARCHAR(60);


BEGIN

  /* Se esiste già un riferimento a un Task relativo all'impegno ne carica i dati per poi vedere se è da cambiare */
  SELECT TASK_ID, TASK_LISTID FROM IMPEGNI_TASKS WHERE MASTER_ID = :IN_MASTER_ID 
  INTO :PREC_TASK_ID, :PREC_TASK_LISTID;

  /* Se non trova nulla lo crea nuovo */
  IF (ROW_COUNT = 0) THEN BEGIN
    INSERT INTO IMPEGNI_TASKS (MASTER_ID, TASK_ID, TASK_LISTID)
    VALUES (:IN_MASTER_ID, :IN_TASK_ID, :IN_TASK_LISTID);
    EXIT;
  END

  /* Se arriva qui allora il riferimento c'era già e allora controlla se i dati
     sono da aggiornare oppure no e se bisogna aggiornarli li aggiorna altrimenti no */
  IF (PREC_TASK_ID <> IN_TASK_ID   OR   PREC_TASK_LISTID <> IN_TASK_LISTID) THEN BEGIN
    UPDATE IMPEGNI_TASKS SET
    TASK_ID = :IN_TASK_ID,
    TASK_LISTID = :IN_TASK_LISTID
    WHERE MASTER_ID = :IN_MASTER_ID;
  END

  /* Exit */
  EXIT;

END^

SET TERM ; ^
