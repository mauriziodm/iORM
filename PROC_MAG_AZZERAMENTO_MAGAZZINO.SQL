CREATE PROCEDURE MAG_AZZERAMENTO_MAGAZZINO (IN_UTENTE VARCHAR(10), IN_COD_MAG INTEGER, IN_DATA_RICHIESTA TIMESTAMP)
AS

  /* Variabile appoggio */
  DECLARE VARIABLE loc_DataChiusuraGenerale TIMESTAMP;

  /* Query che ricava la data di chiusura generale del magazzino (ANAGMAGA) */
  DECLARE ANAGMAGA CURSOR FOR (SELECT AM.DATACHIUSURAGENERALE FROM ANAGMAGA AM WHERE AM.CODICE = :IN_COD_MAG);

BEGIN

  /* Ovviamente la data di chiusura richiesta non può essere nulla */
  IF (IN_DATA_RICHIESTA IS NULL) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_AZZERAMENTO_MAGAZZINO: La data di azzeramento richiesta è NULL.';

  /* Ricava la data di chiusura generale del magazzino */
  OPEN ANAGMAGA;
  FETCH ANAGMAGA INTO :loc_DataChiusuraGenerale;
  CLOSE ANAGMAGA;

  /* Se il magazzino non è stato trovato ritorna un errore ed esce */
  IF (ROW_COUNT = 0) THEN EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Procedure MAG_AZZERAMENTO_MAGAZZINO: Codice magazzino non trovato in ANAGMAGA.';

  /* La data per la quale si richiede di impostare le giacenze deve necessariamente essere successiva	*/
  /* o uguale alla data della chiusura 									*/
  IF (IN_DATA_RICHIESTA < loc_DataChiusuraGenerale) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_AZZERAMENTO_MAGAZZINO: La data richiesta non può essere antecedente alla data di chiusura.';

  /* Procede con l'eliminazione di tutti i record di chiusura dalla tabella MAGAZZINI 	*/
  /* relativi al magazzino di cui si è richiesto l'azzeramento e che hanno la data di   */
  /* chiusura specifica dell'articolo (MAGAZZINI) <= della data richiesta (quelli con   */
  /* data successiva invece rimangono).	Elimino anche le chiusure con data coincidente  */
  /* a quella richiesta perchè si intende azzerare la situazione al primo istante del   */
  /* giorno desiderato e la chiusura rappresenta appunto la giacenza precedente a questo*/
  /* momento.										*/				
  DELETE FROM MAGAZZINI MAG WHERE MAG.DATACHIUSURA <= :IN_DATA_RICHIESTA;

  /* Imposta la nuova data di chiusura generale e altre info nel record nel magazzino (ANAGMAGA) */
  UPDATE ANAGMAGA AM SET
    AM.DATACHIUSURAGENERALE = :IN_DATA_RICHIESTA,
    AM.DATAORAULTIMACHIUSURA = CURRENT_TIMESTAMP,
    AM.UTENTEULTIMACHIUSURA = :IN_UTENTE,
    AM.NOTECHIUSURA = 'Azzeramento magazzino.'
  WHERE AM.CODICE = :IN_COD_MAG;

END


