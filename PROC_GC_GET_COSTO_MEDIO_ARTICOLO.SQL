CREATE PROCEDURE GC_GET_COSTO_MEDIO_ARTICOLO (IN_COD_ART VARCHAR(25), IN_COD_CANT INTEGER, IN_DATA_CANT TIMESTAMP)
  RETURNS (OUTVAR DECIMAL(10,4))
AS
BEGIN
  /* Inizializzazione */
  OUTVAR = 0;

  /* Se il costo medio per questo articolo esiste già lo prende dall'apposita tabella GC_COSTOMEDIO */
  IF (EXISTS(SELECT CM.CODICEARTICOLO FROM GC_COSTOMEDIO CM WHERE CM.PRATICA=:IN_COD_CANT AND CM.DATAPRATICA=:IN_DATA_CANT AND CM.CODICEARTICOLO=:IN_COD_ART))
  THEN BEGIN
    
    /* --------------------------------------- */
    /* COSTO MEDIO DA TABELLA GC_COSTOMEDIO    */
    /* --------------------------------------- */

    FOR SELECT FIRST 1 COALESCE(GC_COSTOMEDIO, 0) FROM GC_COSTOMEDIO WHERE PRATICA=:IN_COD_CANT AND DATAPRATICA=:IN_DATA_CANT AND CODICEARTICOLO=:IN_COD_ART
    INTO :OUTVAR
    DO BEGIN
      SUSPEND;
      EXIT;
    END

    /* --------------------------------------- */

  /* Se invece non esisteva lo calcola dai righi */
  END ELSE BEGIN
  
    /* --------------------------------------- */
    /* CALCOLO COSTO MEDIO DAI RIGHI           */
    /* --------------------------------------- */

    /* Esegue la procedura per il calcolo del costo medio */
    EXECUTE PROCEDURE GC_CALCOLA_COSTO_MEDIO_ARTICOLO (:IN_COD_ART, :IN_COD_CANT, :IN_DATA_CANT) RETURNING_VALUES :OUTVAR;

    /* Effettua il salvataggio del costo medio nell'apposita tabella GC_COSTOMEDIO */
    INSERT INTO GC_COSTOMEDIO
    (PRATICA, DATAPRATICA, CODICEARTICOLO, GC_COSTOMEDIO)
    VALUES
    (:IN_COD_CANT, :IN_DATA_CANT, :IN_COD_ART, :OUTVAR);

    SUSPEND;
    EXIT;
    /* --------------------------------------- */

  END

END
