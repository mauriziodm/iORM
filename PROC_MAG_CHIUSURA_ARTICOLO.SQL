CREATE PROCEDURE MAG_CHIUSURA_ARTICOLO (IN_UTENTE VARCHAR(10), IN_COD_ART VARCHAR(25), IN_COD_MAG INTEGER, IN_DATA_RICHIESTA TIMESTAMP, IS_CHIUSURA_GENERALE CHAR(1) DEFAULT 'F')
AS

  /* Variabile appoggio */
  DECLARE VARIABLE loc_GiornoPrima TIMESTAMP;
  DECLARE VARIABLE loc_DataChiusuraPrecedente TIMESTAMP;
  DECLARE VARIABLE loc_ch_PrimaDellaChiusura CHAR(1) DEFAULT 'F';

  /* Variabili che conterrano i valori da inserire nella chiusura e cioè */
  /* le giacenze risultanti al giorno precedente alla data di chiusura   */
  /* richiesta e che si vuole impostare                                  */
  DECLARE VARIABLE loc_GiacenzaChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_ImpegnatoChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_OrdinatoChiusura DECIMAL (10,4);
  DECLARE VARIABLE loc_DisponibileChiusura DECIMAL (10,4);

BEGIN

  /* Ovviamente la data di chiusura richiesta non può essere nulla */
  IF (IN_DATA_RICHIESTA IS NULL) THEN EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_CHIUSURA_ARTICOLO: La data di chiusura richiesta è NULL.';

  /* Calcola le giacenze il giorno prima della nuova data di chiusura richiesta */
  loc_GiornoPrima = IN_DATA_RICHIESTA - 1;

  /* Ricava le giacenze da inserire nella chiusura e cioè                */
  /* le giacenze risultanti al giorno precedente alla data di chiusura   */
  /* richiesta e che si vuole impostare                                  */
  EXECUTE PROCEDURE MAG_GET_GIACENZE :IN_COD_ART, :IN_COD_MAG, :loc_GiornoPrima, 'T', 'T' RETURNING_VALUES :loc_GiacenzaChiusura, :loc_ImpegnatoChiusura, :loc_OrdinatoChiusura, :loc_DataChiusuraPrecedente, :loc_ch_PrimaDellaChiusura; 

  /* Se l'articolo non è movimentabile ritorna un errore ed esce */
  /* NB: Se però siamo in una chiasura generale esce senza dare errore per non bloccare tutto *(/
  IF (loc_DataChiusuraPrecedente = 'N') THEN BEGIN
    IF (IS_CHIUSURA_GENERALE = 'T') THEN EXIT;
    ELSE EXCEPTION EX_ARTICOLO_NON_MOVIMENTABILE 'Procedure MAG_CHIUSURA_ARTICOLO: Articolo non movimentabile.';
  END;  

  /* Se la data di chiusura richiesta è antecedente alla data della eventuale chiusura precedente */
  /* ritorna un errore e impedisce l'operazione.						  */
  /* Se siamo all'interno di una chiusura generale invece esce immediatamente annullando quindi   */
  /* la chiusura di questo articolo ma senza ritornare aqlcun errore in modo da poter continuare  */
  /* con la chiusura generale.									  */
  IF (IN_DATA_RICHIESTA <= loc_DataChiusuraPrecedente) THEN BEGIN
    IF (IS_CHIUSURA_GENERALE = 'T') THEN EXIT;
    ELSE EXCEPTION EX_MAG_DATA_CHIUSURA_NON_VALIDA 'Procedure MAG_CHIUSURA_ARTICOLO: La data di chiusura richiesta è antecedente a quella già presente.';
  END

  /* Calcola il disponibile */
  loc_DisponibileChiusura = loc_GiacenzaChiusura - loc_ImpegnatoChiusura;

  /* A questo punto elimina il record relativo all'eventuale chiusura precedente e poi se	*/
  /* il parametro IN_DELETE_IF_ZERO = 'T' e le giacenze della chiusura che si sta effettuando   */
  /* sono tutte a zero il record non lo ricrea nemmeno perchè tanto sarebbe ininfluente e così	*/
  /* evitiamo di inserire migliaia di record inutili. Se invece il parametro IN_DELETE_IF_ZERO  */
  /* = 'F' oppure se le nuove guacenze di chiusura non sono tutte a zero crea un nuovo record	*/
  /* di chiusura con le nuove giacenze.								*/
  /* NB: Il parametro IN_DELETE_IF_ZERO viene impostato 'T' quando questa stored procedure	*/
  /* viene richiamata dalla stored procedure di chiusura  di tutto il magazzino mentre è a 'F'  */
  /* nel caso si sta eseguendo la chiusura di un singolo articolo.				*/

  DELETE FROM MAGAZZINI MAG WHERE MAG.CODICEARTICOLO = :IN_COD_ART AND MAG.CODICEMAGAZZINO = :IN_COD_MAG;

  IF (IS_CHIUSURA_GENERALE<>'T' OR loc_GiacenzaChiusura<>0 OR loc_ImpegnatoChiusura<>0 OR loc_OrdinatoChiusura=0) THEN BEGIN

    INSERT INTO MAGAZZINI
      (
        CODICEARTICOLO,
        CODICEMAGAZZINO,
        GIACENZA,
        IMPEGNATO,
        ORDINATO,
        DISPONIBILE,
        DATACHIUSURA,
        NOTECHIUSURA,
        DATAORAULTMOD,
        UTENTEULTMOD
      )
    VALUES 
      (
        :IN_COD_ART,
        :IN_COD_MAG,
        :loc_GiacenzaChiusura,
        :loc_ImpegnatoChiusura,
        :loc_OrdinatoChiusura,
        :loc_DisponibileChiusura,
        :IN_DATA_RICHIESTA,
        'Chiusura (IS_CHIUSURA_GENERALE = ' || :IS_CHIUSURA_GENERALE || ')',
        CURRENT_TIMESTAMP,
        :IN_UTENTE
      );

  END

END

