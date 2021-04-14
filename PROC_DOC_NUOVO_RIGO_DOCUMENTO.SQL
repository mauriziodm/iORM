SET TERM ^ ;

CREATE PROCEDURE DOC_NUOVO_RIGO_DOCUMENTO (in_MainCodArt VARCHAR(25), in_StmCodArt VARCHAR(25), in_GeneraEccezioni CHAR(1) DEFAULT 'T')
RETURNS
(  CodiceArticolo VARCHAR(25)
  ,CodiceArticoloStm VARCHAR(25)
  ,Descrizione VARCHAR(2000)
  ,Descrizione2 VARCHAR(45)
  ,Descrizione3 VARCHAR(45)
  ,Descrizione4 VARCHAR(45)
  ,Descrizione5 VARCHAR(45)
  ,UnitaDiMisura VARCHAR(2)
  ,UltimoPrzAcquisto DECIMAL(12,4)
  ,QuantitaAutomatica NUMERIC(11,4)
  ,PrezzoDiVendita DECIMAL(12,4)
  ,PrezzoDiVendita2 DECIMAL(12,4)
  ,PrezzoDiVendita3 DECIMAL(12,4)
  ,PrezzoDiVendita4 DECIMAL(12,4)
  ,CodiceIVA INTEGER
  ,ScortaMinima NUMERIC(11,4)
  ,AbilitaMovMag CHAR(1)
  ,PrezzoDiListino DECIMAL(12,4)
  ,ScontoListino1 NUMERIC(11,4) 
  ,ScontoListino2 NUMERIC(11,4)
  ,ScontoListino3 NUMERIC(11,4)
  ,ScontoListino4 NUMERIC(11,4)
  ,ArticoloComposto CHAR(1)
  ,QtaOpera NUMERIC(11,4)
  ,Ricarico  NUMERIC(11,4)
  ,Ricarico2 NUMERIC(11,4)
  ,Ricarico3 NUMERIC(11,4)
  ,Ricarico4 NUMERIC(11,4)
  ,MinutiPrevisti INTEGER
  ,ScontoDiAcquisto  NUMERIC(11,4)
  ,ScontoDiAcquisto2 NUMERIC(11,4)
  ,ScontoDiAcquisto3 NUMERIC(11,4)
  ,CostoReale DECIMAL(12,4)
  ,TIPO1 VARCHAR(20)
  ,TIPO2 VARCHAR(20)
  ,TIPO3 VARCHAR(20)
  ,TIPO4 VARCHAR(20)
  ,TIPO5 VARCHAR(20)
  ,TIPO6 VARCHAR(20)
  ,CERTIFICAZIONE VARCHAR(30)
  ,POTENZA VARCHAR(10)
  ,INSTALLATO CHAR(1)
  ,INSTALLABILE CHAR(1)
  ,SISTVENTILAZIONE CHAR(1)
  ,SISTSCARICOCOMB CHAR(1)
  ,SISTCOLLEGELETTRICO CHAR(1)
  ,DICHGASTIPO VARCHAR(15)
  ,DICHGASNOTE VARCHAR(30)
  ,MARCA VARCHAR(20)
  ,FISSAPRZVEND CHAR(1)
)
AS

  /* Variabili appoggio che contengono gli eventuali dati specifici per fornitore */
  DECLARE VARIABLE FORN_CODART VARCHAR(25);  
  DECLARE VARIABLE FORN_DESCART VARCHAR(2000);  
  DECLARE VARIABLE FORN_PREZZODILISTINO DECIMAL(12,4);  
  DECLARE VARIABLE FORN_SCONTODIACQUISTO1 NUMERIC(11,4);  
  DECLARE VARIABLE FORN_SCONTODIACQUISTO2 NUMERIC(11,4);  
  DECLARE VARIABLE FORN_SCONTODIACQUISTO3 NUMERIC(11,4);  
  DECLARE VARIABLE FORN_COSTOUNITNETTO DECIMAL(12,4);  

  /* Altre variabili di appoggio */
  DECLARE VARIABLE PAR_DOCGESTARTFORNSECONDARI CHAR(1);

  /* Query che carica i dati dell'articolo in base al codice principale */
  DECLARE ARTICOLO CURSOR FOR
  (
    SELECT FIRST 1 A.CodiceArticolo, A.Descrizione, A.Descrizione2, A.Descrizione3, A.Descrizione4, A.Descrizione5, A.UnitaDiMisura, A.UltimoPrzAcquisto,
           A.QuantitaAutomatica, A.PrezzoDiVendita, A.PrezzoDiVendita2, A.PrezzoDiVendita3, A.PrezzoDiVendita4, A.CodiceIVA, A.ScortaMinima, A.AbilitaMovMag,
           A.PrezzoDiListino, A.ScontoListino1, A.ScontoListino2, A.ScontoListino3, A.ScontoListino4, A.ArticoloComposto, A.QtaOpera,
           A.Ricarico, A.Ricarico2, A.Ricarico3, A.Ricarico4, A.MinutiPrevisti, A.ScontoDiAcquisto, A.ScontoDiAcquisto2, A.ScontoDiAcquisto3, A.CostoReale,
           A.TIPO1, A.TIPO2, A.TIPO3, A.TIPO4, A.TIPO5, A.TIPO6, A.MARCA, A.FISSAPRZVEND,
 	   A.CERTIFICAZIONE, A.POTENZA, A.INSTALLATO, A.INSTALLABILE, A.SISTVENTILAZIONE, A.SISTSCARICOCOMB, A.SISTCOLLEGELETTRICO, A.DICHGASTIPO, A.DICHGASNOTE
    FROM Articoli A
    WHERE A.CODICEARTICOLO = :in_MainCodArt
  );

  /* Query che carica il codice, descrizione e prezzo del fornitore se viene specificato un codice */
  /* articolo fornitore presente nella gestione dei listini fornitori */
  DECLARE LISTFORN CURSOR FOR
  (
    SELECT FIRST 1 LF.CODICEARTICOLOFORNITORE, LF.DESCRIZIONEFORNITORE, LF.PREZZODILISTINO, LF.SCONTODIACQUISTO1, LF.SCONTODIACQUISTO2, LF.SCONTODIACQUISTO3, LF.PREZZODIACQUISTO
    FROM LISTFORN LF
    WHERE LF.CODICEARTICOLO = :in_MainCodArt AND LF.CODICEARTICOLOFORNITORE = :in_StmCodArt
  );

  /* Query che carica il valore del flag che abilita o meno la gestione degli articoli secondari di fornitori secondari */
  DECLARE PARAM CURSOR FOR
  (
    SELECT FIRST 1 PAR.DocGestArtFornSecondari FROM PROGRESS PAR
  );

BEGIN

  /* Verifica i parametri ricevuti */
  IF (:in_MainCodArt IS NULL OR :in_MainCodArt = '') THEN BEGIN
    IF (:in_GeneraEccezioni = 'T') THEN EXCEPTION EX_GEN_PARAMETRO_NON_VALIDO 'Procedure DOC_NUOVO_RIGO_DOCUMENTO: Parametro in_MainCodArt non valido.';
    EXIT;
  END

  /* Carica il paranetro che attiva o meno la gestione degli articoli secondari di fornitori secondari */
  OPEN PARAM;
  FETCH PARAM INTO :PAR_DOCGESTARTFORNSECONDARI;
  CLOSE PARAM;

  /* Esegue la query che ricaverà i dati dell'articolo */
  OPEN ARTICOLO;
  FETCH ARTICOLO INTO 
     :CodiceArticolo
    ,:Descrizione
    ,:Descrizione2
    ,:Descrizione3
    ,:Descrizione4
    ,:Descrizione5
    ,:UnitaDiMisura
    ,:UltimoPrzAcquisto
    ,:QuantitaAutomatica
    ,:PrezzoDiVendita
    ,:PrezzoDiVendita2
    ,:PrezzoDiVendita3
    ,:PrezzoDiVendita4
    ,:CodiceIVA
    ,:ScortaMinima
    ,:AbilitaMovMag
    ,:PrezzoDiListino
    ,:ScontoListino1
    ,:ScontoListino2
    ,:ScontoListino3
    ,:ScontoListino4
    ,:ArticoloComposto
    ,:QtaOpera
    ,:Ricarico
    ,:Ricarico2
    ,:Ricarico3
    ,:Ricarico4
    ,:MinutiPrevisti
    ,:ScontoDiAcquisto
    ,:ScontoDiAcquisto2
    ,:ScontoDiAcquisto3
    ,:CostoReale
    ,:TIPO1
    ,:TIPO2
    ,:TIPO3
    ,:TIPO4
    ,:TIPO5
    ,:TIPO6
    ,:MARCA
    ,:FISSAPRZVEND
    ,:CERTIFICAZIONE
    ,:POTENZA
    ,:INSTALLATO
    ,:INSTALLABILE
    ,:SISTVENTILAZIONE
    ,:SISTSCARICOCOMB
    ,:SISTCOLLEGELETTRICO
    ,:DICHGASTIPO
    ,:DICHGASNOTE;
  CLOSE ARTICOLO;

  /* Se l'articolo non è stato trovato */
  IF (ROW_COUNT = 0) THEN BEGIN
    IF (:in_GeneraEccezioni = 'T') THEN EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Procedure DOC_NUOVO_RIGO_DOCUMENTO: Articolo non trovato in ARTICOLI.';
    EXIT;
  END


  /* Se è abilitata la gestione degli articoli secondari di fornitori secondari... */
  IF (:PAR_DOCGESTARTFORNSECONDARI = 'T') THEN BEGIN

    /* Se è stato specificato un codice articolo fornitore esegue la query che ne troverà le relative informazioni */
    IF (:in_StmCodArt IS NOT NULL AND :in_StmCodArt <> '') THEN BEGIN
      /* Apre la query */
      OPEN LISTFORN;
      FETCH LISTFORN INTO :FORN_CODART, :FORN_DESCART, :FORN_PREZZODILISTINO, :FORN_SCONTODIACQUISTO1, :FORN_SCONTODIACQUISTO2, :FORN_SCONTODIACQUISTO3, :FORN_COSTOUNITNETTO;
      CLOSE LISTFORN; 
    END

    /* IN base alla situazione determina il CodiceArticoloStm da ritornare */
    IF (:FORN_CODART IS NOT NULL) THEN CodiceArticoloStm = :FORN_CODART;
    ELSE IF (:in_StmCodArt  IS NOT NULL) THEN CodiceArticoloStm = :in_StmCodArt;
    ELSE CodiceArticoloStm = :CodiceArticolo;

    /* In base alla situazione determina la Descrizione da ritornare */
    IF (:FORN_DESCART IS NOT NULL AND :FORN_DESCART <> '') THEN Descrizione = :FORN_DESCART; 

    IF (:FORN_COSTOUNITNETTO IS NOT NULL AND :FORN_COSTOUNITNETTO <> 0) THEN BEGIN
      PrezzoDiListino = :FORN_PREZZODILISTINO;
      ScontoDiAcquisto  = :FORN_SCONTODIACQUISTO1;
      ScontoDiAcquisto2 = :FORN_SCONTODIACQUISTO2;
      ScontoDiAcquisto3 = :FORN_SCONTODIACQUISTO3;
      UltimoPrzAcquisto = :FORN_COSTOUNITNETTO;
      CostoReale= :FORN_COSTOUNITNETTO;
    END

  /* Se invece non è attivata la gestione di articoli secondari di fornitori secondari */
  END ELSE CodiceArticoloStm = :CodiceArticolo;

  /* Ritorna i valori */
  SUSPEND;

END^

SET TERM ; ^

