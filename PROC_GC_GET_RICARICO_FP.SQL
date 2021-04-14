CREATE PROCEDURE GC_GET_RICARICO_FP (IN_PREZZO DECIMAL(10,4), IN_LISTINO SMALLINT)
  RETURNS (OUTVAR DECIMAL(10,4))
AS
  DECLARE VARIABLE loc_alprezzo DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico4 DOUBLE PRECISION;
  DECLARE C CURSOR FOR (SELECT COALESCE(ALPREZZO,0), COALESCE(RICARICO1,0), COALESCE(RICARICO2,0), COALESCE(RICARICO3,0), COALESCE(RICARICO4,0) FROM RICARICHI ORDER BY ALPREZZO);
BEGIN

  OPEN C;

  WHILE (1 = 1) DO
  BEGIN
    FETCH C INTO :loc_alprezzo, :loc_ricarico1, :loc_ricarico2, :loc_ricarico3, :loc_ricarico4;
    /* Se il prezzo del rigo corrente è minore o uguale al limite di prezzo della fascia corrente... */
    /* Oppure se siamo arrivati alla fine dei records */
    IF ((IN_PREZZO <= :loc_alprezzo) OR (ROW_COUNT = 0)) THEN LEAVE;
  END  

  CLOSE C;

  /* Se listino 1 */
  IF (IN_LISTINO = 1) THEN BEGIN 
    OUTVAR = :loc_ricarico1;
    SUSPEND;
    EXIT;
  END

  /* Se listino 2 */
  IF (IN_LISTINO = 2) THEN BEGIN 
    OUTVAR = :loc_ricarico2;
    SUSPEND;
    EXIT;
  END

  /* Se listino 3 */
  IF (IN_LISTINO = 3) THEN BEGIN 
    OUTVAR = :loc_ricarico3;
    SUSPEND;
    EXIT;
  END

  /* Se listino 4 */
  IF (IN_LISTINO = 4) THEN BEGIN 
    OUTVAR = :loc_ricarico4;
    SUSPEND;
    EXIT;
  END

  /* Se listino non trovato */
  OUTVAR = 0;
  SUSPEND;
  EXIT;

END
