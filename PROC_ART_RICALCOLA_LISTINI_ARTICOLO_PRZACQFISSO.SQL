CREATE PROCEDURE ART_RICALC_LIST_ART_PRZACQFISSO (IN_COD_ART VARCHAR(25))
AS
  /* Variabili con i prezzi di listino costo */
  DECLARE VARIABLE loc_przlistino DOUBLE PRECISION;
  DECLARE VARIABLE loc_przlistinoivacomp DOUBLE PRECISION;
  DECLARE VARIABLE loc_costoreale DOUBLE PRECISION;
  DECLARE VARIABLE loc_costoperlistini DOUBLE PRECISION;
  DECLARE VARIABLE loc_tipoCalcoloListino CHAR(1);
  /* Variabili con i flags che indicano se usare il relativo sconto per il calcolo della base per il calcolo listini di vendita */
  DECLARE VARIABLE loc_bcUseSc1 CHAR(1);
  DECLARE VARIABLE loc_bcUseSc2 CHAR(1);
  DECLARE VARIABLE loc_bcUseSc3 CHAR(1);
  /* Variabili che contengono gli sconti da usare per il calcolo del costo reale */
  DECLARE VARIABLE loc_crsc1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_crsc2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_crsc3 DOUBLE PRECISION;
  /* Variabili con i ricarichi per il calcolo dei listini di vendita */
  DECLARE VARIABLE loc_ricarico1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricarico4 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricimp1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricimp2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricimp3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_ricimp4 DOUBLE PRECISION;
  /* Variabili con gli sconti per il calcolo dei listini di vendita */
  DECLARE VARIABLE loc_scvend1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_scvend2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_scvend3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_scvend4 DOUBLE PRECISION;
  /* Variabili con i prezzi di vendita dei listini */
  DECLARE VARIABLE loc_przvend1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvend2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvend3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvend4 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvendivacomp1 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvendivacomp2 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvendivacomp3 DOUBLE PRECISION;
  DECLARE VARIABLE loc_przvendivacomp4 DOUBLE PRECISION;
  /* Variabili per aliquota IVA */
  DECLARE VARIABLE loc_codiceIVA INTEGER;
  DECLARE VARIABLE loc_aliquotaIVA DOUBLE PRECISION;

  /* Cursore per prelevare i dati necessari dell'articolo */
  DECLARE C CURSOR FOR (SELECT FIRST 1 COALESCE(A.PREZZODILISTINO, 0)
                                     , COALESCE(A.COSTOREALE, 0)
                                     , COALESCE(A.BCL_CONSIDERA_SCONTO1, 'T')
                                     , COALESCE(A.BCL_CONSIDERA_SCONTO2, 'T')
                                     , COALESCE(A.BCL_CONSIDERA_SCONTO3, 'T')
                                     , COALESCE(A.RICARICO, 0)
                                     , COALESCE(A.RICARICO2, 0)
                                     , COALESCE(A.RICARICO3, 0)
                                     , COALESCE(A.RICARICO4, 0)
                                     , COALESCE(A.SCONTOLISTINO1, 0)
                                     , COALESCE(A.SCONTOLISTINO2, 0)
                                     , COALESCE(A.SCONTOLISTINO3, 0)
                                     , COALESCE(A.SCONTOLISTINO4, 0)
                                     , COALESCE(A.TIPOCALCOLOLISTINO, 'R')
                                     , COALESCE(A.CODICEIVA, 1)
                        FROM ARTICOLI A WHERE A.CODICEARTICOLO = :IN_COD_ART);

  /* Cursore per l'aliquota IVA */
  DECLARE I CURSOR FOR (SELECT FIRST 1 I.ALIQUOTAIVA FROM ALIQIVA I WHERE I.CODICEIVA=:loc_codiceIVA);

BEGIN

  /* Se il codice articolo da elaborare non è valido esce subito */
  IF (IN_COD_ART IS NULL OR IN_COD_ART='') THEN EXIT;

  /* Caricamento dati */
  OPEN C;
  FETCH C INTO :loc_przlistino,:loc_costoreale,   :loc_bcUseSc1,:loc_bcUseSc2,:loc_bcUseSc3,   :loc_ricarico1,:loc_ricarico2,:loc_ricarico3,:loc_ricarico4,   :loc_scvend1,:loc_scvend2,:loc_scvend3,:loc_scvend4,   :loc_tipoCalcoloListino,:loc_codiceIVA;
  CLOSE C;
  OPEN I;
  FETCH I INTO :loc_aliquotaIVA;
  CLOSE I;

  /* Calcola il prezzo di listino IVA compresa */
  loc_przlistinoivacomp = :loc_przlistino * (100+:loc_aliquotaIVA) / 100;

  /* Calcola lo sconto di acquisto */
  loc_crsc1 = 0;
  loc_crsc2 = 0;
  loc_crsc3 = 0;
  IF (:loc_przlistino <> 0) THEN loc_crsc1 = (:loc_przlistino - :loc_costoreale) * 100 / :loc_przlistino;




  /* Calcola il costo base per il calcolo dei listini di vendita */
  loc_costoperlistini = :loc_przlistino;
  IF (:loc_bcUseSc1='T') THEN loc_costoperlistini = :loc_costoperlistini * (100-:loc_crsc1) / 100;
  IF (:loc_bcUseSc2='T') THEN loc_costoperlistini = :loc_costoperlistini * (100-:loc_crsc2) / 100;
  IF (:loc_bcUseSc3='T') THEN loc_costoperlistini = :loc_costoperlistini * (100-:loc_crsc3) / 100;



  /* Calcolo listini di vendita con sconto da listino */
  IF (:loc_tipoCalcoloListino = 'S') THEN BEGIN
    /* Calcola il prezzo di vendita */
    loc_przvend1 = :loc_przlistino * (100-:loc_scvend1) / 100;
    loc_przvend2 = :loc_przlistino * (100-:loc_scvend2) / 100;
    loc_przvend3 = :loc_przlistino * (100-:loc_scvend3) / 100;
    loc_przvend4 = :loc_przlistino * (100-:loc_scvend4) / 100;
    /* Calcola il ricarico importo corrispondente */
    loc_ricimp1 = :loc_przvend1 - :loc_costoperlistini;
    loc_ricimp2 = :loc_przvend2 - :loc_costoperlistini;
    loc_ricimp3 = :loc_przvend3 - :loc_costoperlistini;
    loc_ricimp4 = :loc_przvend4 - :loc_costoperlistini;
    /* Calcola la percentuale di ricarico corrispondente */
    IF (:loc_costoperlistini <> 0) THEN BEGIN
      loc_ricarico1 = 100 * :loc_ricimp1 / :loc_costoperlistini;
      loc_ricarico2 = 100 * :loc_ricimp2 / :loc_costoperlistini;
      loc_ricarico3 = 100 * :loc_ricimp3 / :loc_costoperlistini;
      loc_ricarico4 = 100 * :loc_ricimp4 / :loc_costoperlistini;
    END
    IF (:loc_costoperlistini = 0) THEN BEGIN
      loc_ricarico1 = 0;
      loc_ricarico2 = 0;
      loc_ricarico3 = 0;
      loc_ricarico4 = 0;
    END
  END



  /* Calcolo listini di vendita con ricarico */
  IF (:loc_tipoCalcoloListino = 'R') THEN BEGIN
    /* Calcolo ricarico importo */
    loc_ricimp1 = :loc_costoperlistini * :loc_ricarico1 / 100;
    loc_ricimp2 = :loc_costoperlistini * :loc_ricarico2 / 100;
    loc_ricimp3 = :loc_costoperlistini * :loc_ricarico3 / 100;
    loc_ricimp4 = :loc_costoperlistini * :loc_ricarico4 / 100;
    /* Calcolo prezzo di vendita */
    loc_przvend1 = :loc_costoperlistini + :loc_ricimp1;
    loc_przvend2 = :loc_costoperlistini + :loc_ricimp2;
    loc_przvend3 = :loc_costoperlistini + :loc_ricimp3;
    loc_przvend4 = :loc_costoperlistini + :loc_ricimp4;
    /* Calcola sconti relativi */
    IF (:loc_przlistino <> 0) THEN BEGIN
      loc_scvend1 = 100 * (:loc_przlistino-:loc_przvend1) / :loc_przlistino;
      loc_scvend2 = 100 * (:loc_przlistino-:loc_przvend2) / :loc_przlistino;
      loc_scvend3 = 100 * (:loc_przlistino-:loc_przvend3) / :loc_przlistino;
      loc_scvend4 = 100 * (:loc_przlistino-:loc_przvend4) / :loc_przlistino;
    END
    IF (:loc_przlistino = 0) THEN BEGIN
      loc_scvend1 = 0;
      loc_scvend2 = 0;
      loc_scvend3 = 0;
      loc_scvend4 = 0;
    END
  END




  /* Calcolo prezzo di vendita IVA compresa */
  loc_przvendivacomp1 = :loc_przvend1 * (100+:loc_aliquotaIVA) / 100;
  loc_przvendivacomp2 = :loc_przvend2 * (100+:loc_aliquotaIVA) / 100;
  loc_przvendivacomp3 = :loc_przvend3 * (100+:loc_aliquotaIVA) / 100;
  loc_przvendivacomp4 = :loc_przvend4 * (100+:loc_aliquotaIVA) / 100;



  /* Aggiornamento dell'articolo con i dati elaborati */
  UPDATE ARTICOLI UA SET
     UA.PREZZODILISTINOIVACOMP = :loc_przlistinoivacomp
    ,UA.SCONTODIACQUISTO = :loc_crsc1
    ,UA.SCONTODIACQUISTO2 = :loc_crsc2
    ,UA.SCONTODIACQUISTO3 = :loc_crsc3
    ,UA.COSTOREALE = :loc_costoreale
    ,UA.ULTIMOPRZACQUISTO = :loc_costoperlistini
    ,UA.SCONTOLISTINO1 = :loc_scvend1
    ,UA.SCONTOLISTINO2 = :loc_scvend2
    ,UA.SCONTOLISTINO3 = :loc_scvend3
    ,UA.SCONTOLISTINO4 = :loc_scvend4
    ,UA.RICARICO  = :loc_ricarico1
    ,UA.RICARICO2 = :loc_ricarico2
    ,UA.RICARICO3 = :loc_ricarico3
    ,UA.RICARICO4 = :loc_ricarico4
    ,UA.IMPORTORICARICO  = :loc_ricimp1
    ,UA.IMPORTORICARICO2 = :loc_ricimp2
    ,UA.IMPORTORICARICO3 = :loc_ricimp3
    ,UA.IMPORTORICARICO4 = :loc_ricimp4
    ,UA.PREZZODIVENDITA  = :loc_przvend1
    ,UA.PREZZODIVENDITA2 = :loc_przvend2
    ,UA.PREZZODIVENDITA3 = :loc_przvend3
    ,UA.PREZZODIVENDITA4 = :loc_przvend4
    ,UA.PRZVENDIVACOMP1 = :loc_przvendivacomp1
    ,UA.PRZVENDIVACOMP2 = :loc_przvendivacomp2
    ,UA.PRZVENDIVACOMP3 = :loc_przvendivacomp3
    ,UA.PRZVENDIVACOMP4 = :loc_przvendivacomp4
  WHERE UA.CODICEARTICOLO = :IN_COD_ART;



END

