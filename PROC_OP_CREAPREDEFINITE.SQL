SET TERM ^ ;

CREATE PROCEDURE OP_CREAPREDEFINITE
AS
  DECLARE CODICE VARCHAR(25);
  DECLARE ESISTE CHAR(1);
BEGIN

  /* ======================================================================================================== */
  /* RISCALDAMENTO */
  /* ======================================================================================================== */

  /* Riscaldamento - Manutenzione Ordinaria */
  CODICE = 'RSC.MO';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'MANUTENZIONE ORDINARIA', ';13:Riscaldamento', 365, 'A', 'Generatore di calore', 'Generatore di calore biomassa', 60, 'T', 'T', 'T');
  END

  /* Riscaldamento - Analisi fumi */
  CODICE = 'RSC.AF';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'ANALISI FUMI', ';13:Riscaldamento', 730, 'A', 'Generatore di calore', 'Generatore di calore biomassa', 60, 'T', 'T', 'T');
  END

  /* Riscaldamento - Controllo anodo */
  CODICE = 'RSC.CAN';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. ANODO (se presente)', ';13:Riscaldamento', 730, 'A', 'Generatore di calore', 'Generatore di calore biomassa', 60, 'T', 'T', 'T');
  END

  /* Riscaldamento - Controllo liquido inibitore */
  CODICE = 'RSC.CLI';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. LIQUIDO INIBITORE (se presente)', ';13:Riscaldamento', 730, 'I', NULL, 60, 'T', 'T', 'T');
  END

  /* Riscaldamento - Controllo filtro defangatore */
  CODICE = 'RSC.CFD';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. FILTRO DEFANGATORE (se presente)', ';13:Riscaldamento', 365, 'I', NULL, 60, 'T', 'T', 'T');
  END

  /* ======================================================================================================== */

  /* ======================================================================================================== */
  /* CENTRALE TERMICA */
  /* ======================================================================================================== */

  /* Centrali termiche - Manutenzione Ordinaria */
  CODICE = 'CNT.MO';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'MANUTENZIONE ORDINARIA', ';16:Centrale termica', 365, 'A', 'Generatore di calore', 'Generatore di calore biomassa', 60, 'T', 'T', 'T');
  END

  /* Centrali termiche - Analisi fumi */
  CODICE = 'CNT.AF';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'ANALISI FUMI', ';16:Centrale termica', 365, 'A', 'Generatore di calore', 'Generatore di calore biomassa', 60, 'T', 'T', 'T');
  END

  /* Centrali termiche - Controllo liquido inibitore */
  CODICE = 'CNT.CLI';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. LIQUIDO INIBITORE (se presente)', ';16:Centrale termica', 730, 'I', NULL, 60, 'T', 'T', 'T');
  END

  /* Centrali termiche - Controllo filtro defangatore */
  CODICE = 'CNT.CFD';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. FILTRO DEFANGATORE (se presente)', ';16:Centrale termica', 365, 'I', NULL, 60, 'T', 'T', 'T');
  END

  /* Centrali termiche - Controllo neutralizzatore acidità condensa */
  CODICE = 'CNT.CNAC';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. NEUTRALIZZATORE ACIDITA'' CONDENSA', ';16:Centrale termica', 365, 'I', NULL, 60, 'T', 'T', 'T');
  END

  /* ======================================================================================================== */

  /* ======================================================================================================== */
  /* CLIMATIZZAZIONE */
  /* ======================================================================================================== */

  /* Climatizzazione - Pulizia/Sanificazione monoblocco */
  CODICE = 'CLIMA.PSMON';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'PULIZIA/SANIFICAZIONE MONOBLOCCO', ';15:Climatizzazione', 365, 'A', 'Monoblocco', 60, 'T', 'T', 'T');
  END

  /* Climatizzazione - Pulizia/Sanificazione unità interna */
  CODICE = 'CLIMA.PSUI';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'PULIZIA/SANIFICAZIONE UNITA'' INTERNA', ';15:Climatizzazione', 365, 'A', 'Unità interna', 60, 'T', 'T', 'T');
  END

  /* Climatizzazione - Pulizia unità esterna */
  CODICE = 'CLIMA.PSUE';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'PULIZIA UNITA'' ESTERNA', ';15:Climatizzazione', 365, 'A', 'Unità esterna', 60, 'T', 'T', 'T');
  END

  /* Climatizzazione - Controllo refrigerante */
  CODICE = 'CLIMA.CR';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. REFRIGERANTE', ';15:Climatizzazione', 730, 'A', 'Unità esterna', 'Monoblocco', 60, 'T', 'T', 'T');
  END

  /* Climatizzazione - Controllo scarico condensa */
  CODICE = 'CLIMA.CSC';
  EXECUTE PROCEDURE OP_EXISTS :CODICE RETURNING_VALUES :ESISTE;
  IF (ESISTE = 'F') THEN BEGIN
    INSERT INTO OP (CODICE, DESCRIZIONE, TIPO, PERIODICITA, AGGNUOVOIMPIANTO, AUTOLOAD1, AUTOLOAD2, AUTOLOAD3, GG_AUTOSEL, SYSTEM, ADDEBITA, INABBONAMENTO)
    VALUES (:CODICE, 'CONTR. SCARICO CONDENSA (se presente)', ';15:Climatizzazione', 365, 'A', 'Unità esterna', 'Unità interna', 'Monoblocco', 60, 'T', 'T', 'T');
  END

  /* ======================================================================================================== */

  /* Fine lavori */
  EXIT;

END^

SET TERM ; ^


