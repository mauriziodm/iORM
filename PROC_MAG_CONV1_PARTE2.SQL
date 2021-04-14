SET TERM ^ ;

CREATE PROCEDURE MAG_CONV1_PARTE2
AS

  /* Variabile appoggio */
  DECLARE VARIABLE loc_CodiceArticolo VARCHAR(25);
  DECLARE VARIABLE loc_CodiceMagazzino INTEGER;
  DECLARE VARIABLE loc_Giacenza DECIMAL(10,4);
  DECLARE VARIABLE loc_Impegnato DECIMAL(10,4);
  DECLARE VARIABLE loc_Ordinato DECIMAL(10,4);

BEGIN

  /* Prima di tutto verifica se il resto della procedura deve essere eseguito */
  /* in pratica verifica se è presente il record marcatore lasciato dalla     */
  /* procedure che ha gestito la prima parte della conversione nella tabelle  */
  /* MAGAZZIN_TEMP, marcatore che indica che la prima parte della conversione */
  /* è stata eseguita completamente e correttamente e che quindi anche la     */
  /* parte (questa) deve essere eseguita.				      */
  IF (NOT EXISTS(SELECT CODICEARTICOLO FROM MAGAZZINI_TEMP WHERE CODICEARTICOLO = 'CONVERSIONE' AND CODICEMAGAZZINO = 999999)) THEN EXIT;

  /* Svuota la tabella MAGAZZINI */
  DELETE FROM MAGAZZINI;

  /* Cicla per tutti i record contenuti in MAGAZZINI_TEMP e ne riporta le giacenze contenute */
  /* come giacenze degli articoli con il nuovo metodo di calcolo delle giacenze */
  /* in pratica forza le giacenze in modo che siano identiche a quelle, precedentemente salvate */
  /* dalla prima parte della conversione */
  /* Ovviamente evita il record marcatore */
  FOR SELECT CODICEARTICOLO, CODICEMAGAZZINO, GIACENZA, IMPEGNATO, ORDINATO FROM MAGAZZINI_TEMP WHERE CODICEMAGAZZINO <> 999999 AND CODICEARTICOLO <> 'CONVERSIONE'
  INTO :loc_CodiceArticolo, :loc_CodiceMagazzino, :loc_Giacenza, :loc_Impegnato, :loc_Ordinato
  DO BEGIN

    /* Imposta la giacenza */
    /* NB: La data richiesta è volutamente al futuro */
    EXECUTE PROCEDURE MAG_SET_GIACENZA_ARTICOLO 'Convers.', :loc_CodiceArticolo, :loc_CodiceMagazzino, :loc_Giacenza, :loc_Impegnato, :loc_Ordinato, '01/01/2900', 'F', 'F';

  END

  /* Svuota la tabella MAGAZZINI_TEMP */
  DELETE FROM MAGAZZINI_TEMP;

  Exit;

END^

SET TERM ; ^
