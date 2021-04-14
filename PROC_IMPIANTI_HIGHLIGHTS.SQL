SET TERM ^ ;

/* Questa SP ritorna il valore del campo HIGHLIGHTS della vista dell'elenco impianti */

CREATE PROCEDURE IMPIANTI_HIGHLIGHTS (IN_IDIMPIANTO INTEGER)
  RETURNS (OUTVAL VARCHAR(1000))
AS
  DECLARE VARIABLE loc_numapp INTEGER;
  DECLARE VARIABLE loc_currapp VARCHAR(200);
  DECLARE VARIABLE loc_currop VARCHAR(60);
  DECLARE VARIABLE loc_descop VARCHAR(1000);
  DECLARE VARIABLE loc_ultimointervento TIMESTAMP;
BEGIN

  /* Inizializzazione */
  OUTVAL = '';
  loc_currapp = '';
  loc_descop = '';

  /* Carica il numero degli apparecchi dell'impianto */
  SELECT COUNT(*) FROM PRATAPPARECCHI APP WHERE APP.IDPRATICA=:IN_IDIMPIANTO INTO :loc_numapp;
  loc_currapp = CASE
                  WHEN (loc_numapp = 0) THEN 'Nessun apparecchio'
                  WHEN (loc_numapp > 1) THEN 'Più apparecchi'
		END;
  
  /* Se c'è un solo apparecchi ne carica alcuni dati */
  IF (loc_numapp = 1) THEN BEGIN
    SELECT FIRST 1 APP.COSTRUTTORE || ' ' || APP.MODELLO || ' (' || APP.MATRICOLA || ')' FROM PRATAPPARECCHI APP WHERE APP.IDPRATICA = :IN_IDIMPIANTO INTO :loc_currapp;
  END

  /* Ricava  un riferimento all'ultimo intervento */
  SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.IDPRATICA=:IN_IDIMPIANTO INTO :loc_ultimointervento;

  /* Elenco OP effettuate nell'ultimo intervento */
  FOR SELECT DISTINCT OP.DESCRIZIONE
    FROM IMPEGNI I
    JOIN OPIMPEGNO OP ON (OP.IDIMPEGNO=I.ID)
    WHERE I.IDPRATICA=:IN_IDIMPIANTO
    AND I.DATAORAINTERVENTO=:loc_ultimointervento
    AND OP.EFFETTUATA='T'
  INTO :loc_currop
  DO BEGIN
    loc_descop = loc_descop || ' - ' || loc_currop;
  END

  /* Assebla il risultato da ritornare */
  OUTVAL = loc_currapp || LOWER(loc_descop);

  SUSPEND;
  EXIT;

END^

SET TERM ; ^


