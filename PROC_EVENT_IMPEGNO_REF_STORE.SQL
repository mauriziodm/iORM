SET TERM ^ ;

CREATE PROCEDURE EVENT_IMPEGNO_REF_STORE (IN_MASTER_ID INTEGER, IN_EVENT_ID VARCHAR(60), IN_EVENT_CALENDARID VARCHAR(60))
AS

  DECLARE PREC_EVENT_ID VARCHAR(60);
  DECLARE PREC_EVENT_CALENDARID VARCHAR(60);


BEGIN

  /* Se esiste già un riferimento a un Task relativo all'impegno ne carica i dati per poi vedere se è da cambiare */
  SELECT EVENT_ID, EVENT_CALID FROM IMPEGNI_GCAL WHERE MASTER_ID = :IN_MASTER_ID 
  INTO :PREC_EVENT_ID, :PREC_EVENT_CALENDARID;

  /* Se non trova nulla lo crea nuovo */
  IF (ROW_COUNT = 0) THEN BEGIN
    INSERT INTO IMPEGNI_GCAL (MASTER_ID, EVENT_ID, EVENT_CALID)
    VALUES (:IN_MASTER_ID, :IN_EVENT_ID, :IN_EVENT_CALENDARID);
    EXIT;
  END

  /* Se arriva qui allora il riferimento c'era già e allora controlla se i dati
     sono da aggiornare oppure no e se bisogna aggiornarli li aggiorna altrimenti no */
  IF (PREC_EVENT_ID <> IN_EVENT_ID   OR   PREC_EVENT_CALENDARID <> IN_EVENT_CALENDARID) THEN BEGIN
    UPDATE IMPEGNI_GCAL SET
    EVENT_ID = :IN_EVENT_ID,
    EVENT_CALID = :IN_EVENT_CALENDARID
    WHERE MASTER_ID = :IN_MASTER_ID;
  END

  /* Exit */
  EXIT;

END^

SET TERM ; ^
