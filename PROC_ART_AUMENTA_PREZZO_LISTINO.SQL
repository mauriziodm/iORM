CREATE PROCEDURE ART_AUMENTA_PREZZO_LISTINO (IN_COD_ART VARCHAR(25), IN_PERC_AUMENTO DOUBLE PRECISION, IN_PRZACQFISSI CHAR(1))
AS
  DECLARE VARIABLE loc_przlist_old DOUBLE PRECISION;
  DECLARE VARIABLE loc_przlist_new DOUBLE PRECISION;
  DECLARE C CURSOR FOR (SELECT FIRST 1 A.PREZZODILISTINO FROM ARTICOLI A WHERE A.CODICEARTICOLO = :IN_COD_ART);

BEGIN

  /* Se il codice articolo da elaborare non è valido esce subito */
  IF (IN_COD_ART IS NULL OR IN_COD_ART='') THEN EXIT;

  /* Caricamento dati */
  OPEN C;
  FETCH C INTO :loc_przlist_old;
  CLOSE C;

  /* Calcola il nuovo prezzo di listino */  
  loc_przlist_new = :loc_przlist_old * (100+:IN_PERC_AUMENTO) / 100;

  /* Aggiorna l'articolo */
  UPDATE ARTICOLI UA SET UA.PREZZODILISTINO = :loc_przlist_new WHERE UA.CODICEARTICOLO = :IN_COD_ART;

  /* In base alle impostazioni esegue il ricalcolo ricalcolando gli sconti di acquisto oppure il PrezzoDiAcquistoreale */
  IF (IN_PRZACQFISSI = 'T') THEN BEGIN
    /* Ricalcola i listini di vendita e gli sconti di acquisto */
    EXECUTE PROCEDURE ART_RICALC_LIST_ART_PRZACQFISSO (:IN_COD_ART);
  END ELSE BEGIN
    /* Ricalcola i listini di vendita e i prezzi di acquisto */
    EXECUTE PROCEDURE ART_RICALCOLA_LISTINI_ARTICOLO (:IN_COD_ART);
  END 


END
