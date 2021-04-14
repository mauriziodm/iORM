CREATE PROCEDURE GC_GET_RICARICO (IN_CODART VARCHAR(25), IN_PREZZO DECIMAL(10,4), IN_LISTINO SMALLINT)
  RETURNS (OUTVAR DECIMAL(10,4))
AS
  DECLARE VARIABLE loc_art_ricarico1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_art_ricarico2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_art_ricarico3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_art_ricarico4 DOUBLE PRECISION;

  DECLARE VARIABLE loc_par_ricarichi_fp CHAR(1);
  DECLARE VARIABLE loc_par_ricarico1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_par_ricarico2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_par_ricarico3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_par_ricarico4 DOUBLE PRECISION;

  DECLARE A CURSOR FOR (SELECT COALESCE(RICARICO,0), COALESCE(RICARICO2,0), COALESCE(RICARICO3,0), COALESCE(RICARICO4,0) FROM ARTICOLI WHERE CODICEARTICOLO = :IN_CODART);
  DECLARE P CURSOR FOR (SELECT FIRST 1 COALESCE(RICARICHIPERFASCEPREZZO,'F'), COALESCE(RICARICOLISTINO1,0), COALESCE(RICARICOLISTINO2,0), COALESCE(RICARICOLISTINO3,0), COALESCE(RICARICOLISTINO4,0) FROM PROGRESS);
BEGIN

  /* Prende i ricarichi dai parametri */
  OPEN P;
  FETCH P INTO loc_par_ricarichi_fp, :loc_par_ricarico1, :loc_par_ricarico2, :loc_par_ricarico3, :loc_par_ricarico4;
  CLOSE P;

  /* Trova l'articolo nell'archivio degli articoli se c'è */
  OPEN A;
  FETCH A INTO :loc_art_ricarico1, :loc_art_ricarico2, :loc_art_ricarico3, :loc_art_ricarico4;
  CLOSE A;

  /* Se siamo in modalità di ricarichi per fasce di prezzo */
  IF (:loc_par_ricarichi_fp = 'T') THEN
  BEGIN
    EXECUTE PROCEDURE GC_GET_RICARICO_FP IN_PREZZO, IN_LISTINO RETURNING_VALUES OUTVAR;
    SUSPEND;
    EXIT;
  END

  /* Se invece non siamo in modalità di ricarichi per fasce di prezzo
     e non sono stati trovati articoli nell'archivio articoli oppure
     se il codice fornito è nullo oppure vuoto */
  IF ((ROW_COUNT = 0) OR (IN_CODART IS NULL) OR (trim(IN_CODART) = '')) THEN
  BEGIN
    /* Se listino 1 */
    IF (IN_LISTINO = 1) THEN BEGIN 
      OUTVAR = :loc_par_ricarico1;
      SUSPEND;
      EXIT;
    END
    /* Se listino 2 */
    IF (IN_LISTINO = 2) THEN BEGIN 
      OUTVAR = :loc_par_ricarico2;
      SUSPEND;
      EXIT;
    END
    /* Se listino 3 */
    IF (IN_LISTINO = 3) THEN BEGIN 
      OUTVAR = :loc_par_ricarico3;
      SUSPEND;
      EXIT;
    END
    /* Se listino 4 */
    IF (IN_LISTINO = 4) THEN BEGIN 
      OUTVAR = :loc_par_ricarico4;
      SUSPEND;
      EXIT;
    END
  END

  /* Se invece non siamo in modalità di ricarichi per fasce di prezzo
     sono stati trovati articoli nell'archivio articoli */
  IF (ROW_COUNT > 0) THEN
  BEGIN
    /* Se listino 1 */
    IF (IN_LISTINO = 1) THEN BEGIN 
      OUTVAR = :loc_art_ricarico1;
      SUSPEND;
      EXIT;
    END
    /* Se listino 2 */
    IF (IN_LISTINO = 2) THEN BEGIN 
      OUTVAR = :loc_art_ricarico2;
      SUSPEND;
      EXIT;
    END
    /* Se listino 3 */
    IF (IN_LISTINO = 3) THEN BEGIN 
      OUTVAR = :loc_art_ricarico3;
      SUSPEND;
      EXIT;
    END
    /* Se listino 4 */
    IF (IN_LISTINO = 4) THEN BEGIN 
      OUTVAR = :loc_art_ricarico4;
      SUSPEND;
      EXIT;
    END
  END

  /* Se non ha trovato proprio nulla ritorna 0 */
  OUTVAR = 0;
  SUSPEND;
  EXIT;

END
