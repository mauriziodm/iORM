SET TERM ^ ;

CREATE PROCEDURE MAG_CONV1_PARTE1
AS

BEGIN

  /* Prima di tutto verifica se questa conversione debba essere effettuata oppure no */
  /* per verificare ciò verifica la presenza o meno della stored procedure  MAG_GET_GIACENZE */
  /* e se non è attualmente presente significa che questo database ha bisogno della conversione */
  /* del magazzino. */
  IF (EXISTS(SELECT RDB$PROCEDURE_NAME FROM RDB$PROCEDURES WHERE RDB$PROCEDURE_NAME = 'MAG_GET_GIACENZE')) THEN EXIT;

  /* Per continuare però il database non  deve essere di una versione ante 408 (magazzino statico) */
  /* verifica questo in base alla presenza o meno della vista MAG_ART */
  IF (NOT EXISTS(SELECT RDB$RELATION_NAME FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = 'MAG_ART')) THEN EXIT;

  /* Svuota la tabella MAGAZZINI_TEMP */
  DELETE FROM MAGAZZINI_TEMP;

  /* Copia le giacenze attuali di tutti gli articoli e tutti i magazzini presenti */
  /* (prima della ristrutturazione) nella tabella MAGAZZINI_TEMP. Successivamente */
  /* (dopo la ritrutturazione) usera queste giacenze appena salvate per ripristinare */
  /* le stesse giacenze a fine operazione */
  INSERT INTO MAGAZZINI_TEMP (CODICEARTICOLO, CODICEMAGAZZINO, GIACENZA, IMPEGNATO, ORDINATO)
  SELECT MA.CODICEARTICOLO, MA.CODICEMAGAZZINO, SUM(MA.GIACENZA), SUM(MA.IMPEGNATO), SUM(MA.ORDINATO)
  FROM MAG_ART MA
  GROUP BY MA.CODICEARTICOLO, MA.CODICEMAGAZZINO;

  /* Esegue anche un'altra stored procedure che si assicura che il campo MovMag */
  /* dei righi dei documenti siano uguali al relativo campo nella rispettiva    */
  /* testata.                                                                   */
  EXECUTE PROCEDURE MAG_CHECK_MOVMAG;

  /* Inserisce nella tabella MAGAZZINI un record marcatore che poi indicherà alla */
  /* procedure che gestisce la 2° parte della conversione che deve essere eseguita */
  /* in quanto la prima parte (questa) è stata eseguita tutta e correttamente     */
  INSERT INTO MAGAZZINI_TEMP (CODICEARTICOLO, CODICEMAGAZZINO) VALUES ('CONVERSIONE', 999999);

  Exit;

END^

SET TERM ; ^



