SET TERM ^ ;

EXECUTE BLOCK
AS

  declare fGO_MODIFICA_RIGO char(1);
  
  declare fTIPODOCUMENTO varchar(25);
  declare fREGISTRO varchar(5);
  declare fNUMORDPREV integer;
  declare fDATADOCUMENTO date;
  declare fPROGRIGO integer;
  declare fPROGRIGO2 integer;
  declare fCODICEARTICOLO varchar(25);
  declare fCODICEARTICOLOSTM varchar(25);
  declare fSOTTOCANTIERE1 varchar(20);
  declare fSOTTOCANTIERE2 varchar(20);
  declare fSOTTOCANTIERE3 varchar(20);
  declare fSEGNOOPERAZIONECANTIERE char(1);
  declare fPRATICA integer;
  declare fDATAPRATICA1 date;
  declare fS3COMPONENTE varchar(30);
  declare fS3SEZIONE varchar(10);
  declare fCODICECONF integer;
  declare fRIFLETTER char(1);
  declare fTIPO smallint;
  declare fBITMAPFILENAME varchar(60);
  declare fBITMAPFILENAME2 varchar(60);
  declare fCODICEIVA integer;
  declare fALIQUOTAIVA decimal(15,4);
  
  /* Query che prende i dati della testata del documento */
  declare fTest_TIPODOCUMENTO varchar(25);
  declare fTest_REGISTRO varchar(5);
  declare fTest_NUMORDPREV integer;
  declare fTest_DATADOCUMENTO date;
  declare fTest_PRATICA integer;
  declare fTest_DATAPRATICA1 date;
  declare fTest_SEGNOOPERAZIONECANTIERE char(1);
  declare TESTATA cursor for
    (
      select T.TIPODOCUMENTO, T.REGISTRO, T.NUMORDPREV, T.DATADOCUMENTO, T.PRATICA, T.DATAPRATICA1, T.SEGNOOPERAZIONECANTIERE
      from PRVORDCL T
      where T.TIPODOCUMENTO = :fTIPODOCUMENTO
        and T.REGISTRO = :fREGISTRO
        and T.NUMORDPREV = :fNUMORDPREV
        and T.DATADOCUMENTO = :fDATADOCUMENTO
    );
    
  /* Query che preleva i dati dei simboli dello schema */
  declare fSchema_RIFLETTER char(1);
  declare fSchema_TIPO smallint;
  declare fSchema_BITMAPFILENAME varchar(60);
  declare fSchema_BITMAPFILENAME2 varchar(60);
  declare APP_SCHEMA cursor for
    (
      select A.RIFLETTER, A.TIPO, A.BITMAPFILENAME, A.BITMAPFILENAME2
      from APPARECCHI A
      where A.DESCRIZIONE = :fS3COMPONENTE
    );
    
  /* Variabili e query per la conversione dell'aliquota IVA dal 20% al 21%*/
  declare fIva_GO_CONVERSIONEIVA char(1);
  declare fIva_Updated_TIPODOCUMENTO varchar(25);
  declare fIva_Updated_REGISTRO varchar(5);
  declare fIva_Updated_NUMORDPREV integer;
  declare fIva_Updated_DATADOCUMENTO date;
  
BEGIN

  /* INizializza le variabili che contengono i dati identificativi dell'ultima
  testata documento che è stata aggiornata come IVA */
  /* NB: Devo inizializzarla altrimenti con i valori nulli scazza i confronti
  per il problema dei valori nulli */
  fIva_Updated_TIPODOCUMENTO = '';
  fIva_Updated_REGISTRO = '';
  fIva_Updated_NUMORDPREV = 0;
  fIva_Updated_DATADOCUMENTO = '01/01/1900';
  /* INizializza le variabili che contengono i dati identificativi dell'ultima
  testata documento che è stata letta per reperire i dati per alcune operazioni */
  /* NB: Devo inizializzarla altrimenti con i valori nulli scazza i confronti
  per il problema dei valori nulli */
  fTest_TIPODOCUMENTO = '';
  fTest_REGISTRO = '';
  fTest_NUMORDPREV = 0;
  fTest_DATAPRATICA1 = '01/01/1900';
          
  /* Determina se l'archivio necessita della conversione IVA dal 20 al 21 e imposta il relativvo flag */
  /* Se necessita di conversione modifica il COdiceIva 1 e lo mette al 21% e ricrea il 20% al codice 520 */
  /* Successivamente più sotto poi converte anche i documenti */
  fIva_GO_CONVERSIONEIVA = 'F';
  if (exists (select AI.CODICEIVA from ALIQIVA AI where AI.CODICEIVA = 1 and AI.ALIQUOTAIVA = 21)) then
  begin
    update ALIQIVA set DESCRIZIONEIVA = '22%', ALIQUOTAIVA = 22 where CODICEIVA = 1;
    insert into ALIQIVA (CODICEIVA,DESCRIZIONEIVA,ALIQUOTAIVA) values (1021, '21%', 21);
    fIva_GO_CONVERSIONEIVA = 'T';
  end

  /* Cicla per tutti i records di RIGHIPRV */
  for select R.TIPODOCUMENTO, R.REGISTRO, R.NUMORDPREV, R.DATADOCUMENTO, R.PROGRIGO, R.PROGRIGO2, R.CODICEARTICOLO, R.CODICEARTICOLOSTM,
             R.SOTTOCANTIERE1, R.SOTTOCANTIERE2, R.SOTTOCANTIERE3, R.SEGNOOPERAZIONECANTIERE, R.PRATICA, R.DATAPRATICA1,
             R.S3COMPONENTE, R.S3SEZIONE, R.CODICECONF, R.RIFLETTER, R.TIPO, R.BITMAPFILENAME, R.BITMAPFILENAME2, R.CODICEIVA, R.ALIQUOTAIVA
  from RIGHIPRV R
  order by R.TIPODOCUMENTO, R.REGISTRO, R.NUMORDPREV, R.DATADOCUMENTO
  into :fTIPODOCUMENTO, :fREGISTRO, :fNUMORDPREV, :fDATADOCUMENTO, :fPROGRIGO, :fPROGRIGO2, :fCODICEARTICOLO, :fCODICEARTICOLOSTM,
       :fSOTTOCANTIERE1, :fSOTTOCANTIERE2, :fSOTTOCANTIERE3, :fSEGNOOPERAZIONECANTIERE, :fPRATICA, :fDATAPRATICA1,
       :fS3COMPONENTE, :fS3SEZIONE, :fCODICECONF, :fRIFLETTER, :fTIPO, :fBITMAPFILENAME, :fBITMAPFILENAME2, :fCODICEIVA, :fALIQUOTAIVA
  do begin
  
    /* Inizializzazione */
    fGO_MODIFICA_RIGO = 'F';

    /* Se il rico corrente è un rigo orfano lo elimina subito e salta le operazioni successive */
    if (fTIPODOCUMENTO <> 'Giornale_cantiere' and fCODICECONF is null and not exists (SELECT 'ESISTE' FROM PRVORDCL T WHERE T.TIPODOCUMENTO=:fTIPODOCUMENTO AND T.REGISTRO=:fREGISTRO AND T.NUMORDPREV=:fNUMORDPREV AND T.DATADOCUMENTO=:fDATADOCUMENTO)) then
    begin
     delete from RIGHIPRV  where TIPODOCUMENTO = :fTIPODOCUMENTO and REGISTRO = :fREGISTRO and NUMORDPREV = :fNUMORDPREV and DATADOCUMENTO = :fDATADOCUMENTO and PROGRIGO = :fPROGRIGO and PROGRIGO2 = :fPROGRIGO2;
    end
    /* Se invece il rigo non è orfano di testata provvede ad aggiornarlo se necessario */
    else
    begin

      /* ------------------------------------------------------------------------------------------- */
      /* INIZIO BLOCCO DI ELABORAZIONE DEL RECORD
      /* ------------------------------------------------------------------------------------------- */

      /* ----------------------- INIZIO CONVERSIONE IVA AL 21% */
      if (fIva_GO_CONVERSIONEIVA = 'T') then
      begin
        /* Se il rigo attuale ha CodiceIva = 1 e Alituota IVA = 20 allora è da convertire */
        /* e imposta anche il flag che indica che la testata documento di cui fa parte è da convertire anch'essa */
        if (fCODICEIVA = 1 and fALIQUOTAIVA = 21) then
        begin
          fCODICEIVA = 1021;
          fGO_MODIFICA_RIGO = 'T';
          /* Se la testata relativa al rigo attuale non è già stata convertita come iva da qualche
          rigo precedente provvede a farlo */
          if (not (fTIPODOCUMENTO=fIva_Updated_TIPODOCUMENTO and fREGISTRO=fIva_Updated_REGISTRO and fNUMORDPREV=fIva_Updated_NUMORDPREV and fDATADOCUMENTO=fIva_Updated_DATADOCUMENTO)) then
          begin
            update PRVORDCL T set 
            T.CODICEIVA1 = case when (T.CODICEIVA1 = 1) then 1021 else T.CODICEIVA1 end,
            T.CODICEIVA2 = case when (T.CODICEIVA2 = 1) then 1021 else T.CODICEIVA2 end,
            T.CODICEIVA3 = case when (T.CODICEIVA3 = 1) then 1021 else T.CODICEIVA3 end,
            T.CODICEIVA4 = case when (T.CODICEIVA4 = 1) then 1021 else T.CODICEIVA4 end,
            T.CODICEIVAFORZATA = case when (T.CODICEIVAFORZATA = 1) then 1021 else T.CODICEIVAFORZATA end
            where T.TIPODOCUMENTO=:fIva_Updated_TIPODOCUMENTO and T.REGISTRO=:fIva_Updated_REGISTRO and T.NUMORDPREV=:fIva_Updated_NUMORDPREV and T.DATADOCUMENTO=:fIva_Updated_DATADOCUMENTO;
            /* Aggiorna le variabili che contengono il riferimento all'ultima testata documento
            convertita come IVA */
            fIva_Updated_TIPODOCUMENTO = fTIPODOCUMENTO;
            fIva_Updated_REGISTRO = fREGISTRO;
            fIva_Updated_NUMORDPREV = fNUMORDPREV;
            fIva_Updated_DATADOCUMENTO = fDATADOCUMENTO;
          end
        end
      end
      /* ----------------------- FINE CONVERSIONE IVA AL 21%
    
      /* Se CODICEARTICOLOSTM è nullo mentre invece il CODICEARTICOLO non lo è e non è nemmeno vuoto
      allora significa che si sta ristrutturando proveniendo da una versione che non aveva il campo
      CODICEARTICOLOSTM e quindi per sistemare le cose pone quest'ultimo campo allo stesso valore */
      if (fCODICEARTICOLOSTM is null and fCODICEARTICOLO is not null and fCODICEARTICOLO <> '') then
      begin
        fCODICEARTICOLOSTM = fCODICEARTICOLO;
        fGO_MODIFICA_RIGO = 'T';
      end

      /* Defaultizzazione sottocantieri nulli */
      if (fSOTTOCANTIERE1 is null or fSOTTOCANTIERE2 is null or fSOTTOCANTIERE3 is null) then
      begin
        fSOTTOCANTIERE1 = coalesce(:fSOTTOCANTIERE1, ''); 
        fSOTTOCANTIERE2 = coalesce(:fSOTTOCANTIERE2, ''); 
        fSOTTOCANTIERE3 = coalesce(:fSOTTOCANTIERE3, '');
        fGO_MODIFICA_RIGO = 'T';
      end

      /* Imposta il SEGNOOPERAZIONECANTIERE (per velocizzare il GC) e i riferimenti alla pratica direttamente
      sui righi se non ci sono */
      /* NB: Come si vede nel codice qui sotto esegue la query che ricava i dati della testata una sola volta per tutti i righi del documento */
      if (fSEGNOOPERAZIONECANTIERE is null or fPRATICA is null or fDATAPRATICA1 is null) then
      begin
        if (not (fTest_TIPODOCUMENTO=fTIPODOCUMENTO and fTest_REGISTRO=fREGISTRO and fTest_NUMORDPREV=fNUMORDPREV and fTest_DATAPRATICA1=fDATAPRATICA1)) then
        begin
          fTest_PRATICA = null;
          fTest_DATAPRATICA1 = null;
          fTest_SEGNOOPERAZIONECANTIERE = null;
          open  TESTATA;
          fetch TESTATA into :fTest_TIPODOCUMENTO, :fTest_REGISTRO, :fTest_NUMORDPREV, :fTest_DATADOCUMENTO, :fTest_PRATICA, :fTest_DATAPRATICA1, :fTest_SEGNOOPERAZIONECANTIERE;
          close TESTATA;
        end

        fPRATICA = :fTest_PRATICA;
        fDATAPRATICA1 = :fTest_DATAPRATICA1;
        fSEGNOOPERAZIONECANTIERE = :fTest_SEGNOOPERAZIONECANTIERE;
        fGO_MODIFICA_RIGO = 'T';
      end

      /* Copia i nomi delle Bitmap dei componenti dall'archivio somponenti
      ai righi dei documenti (disegno) questo perchè da una certa versione in
      avanti i nome delle Bitmap devono essere direttamente nei righi per permettere
      di modificare il nome del componente negli elenchi dei Materiali/Apparecchi */
      if (fCODICECONF is not null and fBITMAPFILENAME is null) then
      begin
        fSchema_RIFLETTER = null;  
        fSchema_TIPO = null;  
        fSchema_BITMAPFILENAME = null;  
        fSchema_BITMAPFILENAME2 = null;  
  
        open  APP_SCHEMA;
        fetch APP_SCHEMA into :fSchema_RIFLETTER, :fSchema_TIPO, :fSchema_BITMAPFILENAME, :fSchema_BITMAPFILENAME2;
        close APP_SCHEMA;

        fRIFLETTER = :fSchema_RIFLETTER;
        fTIPO = :fSchema_TIPO;
        fBITMAPFILENAME = :fSchema_BITMAPFILENAME;
        fBITMAPFILENAME2 = :fSchema_BITMAPFILENAME2;
        fGO_MODIFICA_RIGO = 'T';
      end
    
      /* Se ci sono dei righi del disegno della dichiarazione di conformità che hanno
      il campo S3SEZIONE nullo lo modifica per default in 'GAS' */
      if (fCODICECONF is not null and fS3SEZIONE is null) then
      begin
        fS3SEZIONE = 'GAS';
        fGO_MODIFICA_RIGO = 'T';
      end
      
      /*----------------------------------------------------------------*/
      if (fGO_MODIFICA_RIGO = 'T') then
      begin
        /* Aggiorna il rigo attuale */      
        update RIGHIPRV set
          CODICEIVA = :fCODICEIVA,

          CODICEARTICOLOSTM = :fCODICEARTICOLOSTM,

          SOTTOCANTIERE1 = :fSOTTOCANTIERE1, 
          SOTTOCANTIERE2 = :fSOTTOCANTIERE2,
          SOTTOCANTIERE3 = :fSOTTOCANTIERE3,

          PRATICA = :fPRATICA,
          DATAPRATICA1 = :fDATAPRATICA1,
          SEGNOOPERAZIONECANTIERE = :fSEGNOOPERAZIONECANTIERE,

          RIFLETTER = :fRIFLETTER,
          TIPO = :fTIPO,
          BITMAPFILENAME = :fBITMAPFILENAME,
          BITMAPFILENAME2 = :fBITMAPFILENAME2,

          S3SEZIONE = :fS3SEZIONE
        where TIPODOCUMENTO = :fTIPODOCUMENTO and REGISTRO = :fREGISTRO and NUMORDPREV = :fNUMORDPREV and DATADOCUMENTO = :fDATADOCUMENTO and PROGRIGO = :fPROGRIGO and PROGRIGO2 = :fPROGRIGO2;
      end
      /*----------------------------------------------------------------*/
      
      /* ------------------------------------------------------------------------------------------- */
      /* FINE BLOCCO DI ELABORAZIONE DEL RECORD
      /* ------------------------------------------------------------------------------------------- */

    end

  end   /* FOR SELECT */
  
  /* ------------------------------------------------------*/
  /* Se l'archivio deve essere convertito come IVA dal 20 al 21 verifica se l'utente aveva già
  inserito una aliquota al 21% con codice <> 1 e se ne trova la elimina e pone tutti i codici IVA
  dei documenti con tale COdiceIVA mettendoli al CodiceIVA 1 che ora è al 21% */
  if (fIva_GO_CONVERSIONEIVA = 'T') then
  begin
    for select CODICEIVA 
    from ALIQIVA 
    where CODICEIVA <> 1 and ALIQUOTAIVA = 22
    into :fCODICEIVA
    do begin

      update PRVORDCL T set
      T.CODICEIVA1 = case when (T.CODICEIVA1 = :fCODICEIVA) then 1 else T.CODICEIVA1 end,
      T.CODICEIVA2 = case when (T.CODICEIVA2 = :fCODICEIVA) then 1 else T.CODICEIVA2 end,
      T.CODICEIVA3 = case when (T.CODICEIVA3 = :fCODICEIVA) then 1 else T.CODICEIVA3 end,
      T.CODICEIVA4 = case when (T.CODICEIVA4 = :fCODICEIVA) then 1 else T.CODICEIVA4 end,
      T.CODICEIVAFORZATA = case when (T.CODICEIVAFORZATA = :fCODICEIVA) then 1 else T.CODICEIVAFORZATA end
      where not (T.CODICEIVA1 = :fCODICEIVA and T.CODICEIVA2 = :fCODICEIVA and T.CODICEIVA3 = :fCODICEIVA and T.CODICEIVA4 = :fCODICEIVA  and T.CODICEIVAFORZATA = :fCODICEIVA);
      
      update RIGHIPRV R set
      R.CODICEIVA = 1
      where R.CODICEIVA = :fCODICEIVA;
      
      delete from ALIQIVA where CODICEIVA = :fCODICEIVA;
    end
  end
  /* ------------------------------------------------------*/
  
  /* ------------------------------------------------------*/
  /* Se è stata fatta la conversione IVA deve anche ricalcolare
  i listini di vendita IVA compresa degli articoli che avevano
  l'IVA al 20% e ora al 21% */
  if (fIva_GO_CONVERSIONEIVA = 'T') then
  begin
    update ARTICOLI set
      PRZVENDIVACOMP1 = PREZZODIVENDITA  * 1.22,
      PRZVENDIVACOMP2 = PREZZODIVENDITA2 * 1.22,
      PRZVENDIVACOMP3 = PREZZODIVENDITA3 * 1.22,
      PRZVENDIVACOMP4 = PREZZODIVENDITA4 * 1.22
    where CODICEIVA = 1;
  end
  /* ------------------------------------------------------*/
  
  /* Esce */
  exit;
  
END^

SET TERM ; ^
