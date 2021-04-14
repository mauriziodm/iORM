SET TERM ^ ;

CREATE PROCEDURE ALLIMP_NUOVO_ALLEGATO_FG (in_TipoAllegato VARCHAR(60), in_IdImpegno INTEGER, in_IdPratApp INTEGER, in_BrucId INTEGER, in_DataOraInizioIntervento TIMESTAMP, in_DataOraFineIntervento TIMESTAMP, in_CopiaDatiPrec CHAR(1), in_Copie INTEGER)
RETURNS
(  out_IdNuovoAllegato INTEGER
)
AS

  /* ----- Dati dall'impegno ----- */

  declare Imp_IdPratica INTEGER;
  declare Imp_IdTecnico INTEGER;

  declare CursImpegni cursor for
  (
    SELECT IDPRATICA, RESOURCEID FROM IMPEGNI WHERE MASTER_ID = :in_IdImpegno
  );


  /* ----- Dati Dall'impianto ----- */
  declare Prat_CodiceCatasto VARCHAR(50);
  declare Prat_PotenzaNominaleMax DOUBLE PRECISION;

  declare Prat_CodiceIstatComuneImm VARCHAR(10);
  declare Prat_ComuneIMM VARCHAR(60);
  declare Prat_CAPImm VARCHAR(5);
  declare Prat_ZonaIMM VARCHAR(30);
  declare Prat_IndirizzoIMM VARCHAR(80);
  declare Prat_NumCivicoIMM VARCHAR(10);
  declare Prat_PianoIMM VARCHAR(10);
  declare Prat_InternoIMM VARCHAR(10);
  declare Prat_ScalaIMM VARCHAR(10);
  declare Prat_PalazzoIMM VARCHAR(30);
  declare Prat_ProvinciaIMM VARCHAR(3);

  declare Prat_CodiceCli INTEGER;
  declare Prat_RagSocCli VARCHAR(60);
  declare Prat_IndirizzoCli VARCHAR(80);
  declare Prat_NumCivicoCli VARCHAR(10);
  declare Prat_CapCli VARCHAR(5);
  declare Prat_CittaCli VARCHAR(60);
  declare Prat_ProvinciaCli VARCHAR(3);
  declare Prat_TelefonoCli VARCHAR(30);
  declare Prat_CellulareCli VARCHAR(30);
  declare Prat_CodiceFiscaleCli VARCHAR(16);

  declare Prat_CodiceRespImp INTEGER;
  declare Prat_RagSocRespImp VARCHAR(60);
  declare Prat_IndirizzoRespImp VARCHAR(80);
  declare Prat_NumCivicoRespImp VARCHAR(10);
  declare Prat_CapRespImp VARCHAR(5);
  declare Prat_CittaRespImp VARCHAR(60);
  declare Prat_ProvinciaRespImp VARCHAR(3);
  declare Prat_TelefonoRespImp VARCHAR(30);
  declare Prat_CellulareRespImp VARCHAR(30);
  declare Prat_CodiceFiscaleRespImp VARCHAR(16);
  declare Prat_InQualitaDiRespImp VARCHAR(20);
  declare Prat_CognomeRespImp VARCHAR(60);
  declare Prat_NomeRespImp VARCHAR(60);
  declare Prat_NaturaGiuridicaRespImp VARCHAR(60);
  declare Prat_PartitaIVARespImp VARCHAR(11);

  declare CursPratica cursor for
  (
    SELECT CODICECATASTO, CODICEISTATCOMUNEIMM, ComuneIMM, CAPImm, CAPImm, IndirizzoIMM, NumCivicoIMM, PianoIMM, InternoIMM, ScalaIMM, PalazzoIMM, ProvinciaIMM,
           Cliente, RagSocCli, IndirizzoCli, NumCivicoCli, CapCli, CittaCli, ProvinciaCli, TelefonoCli, CellulareCli, CodiceFiscaleCli,
           CodiceRespImp, RagSocRespImp, IndirizzoRespImp, NumCivicoRespImp, CapRespImp, CittaRespImp, ProvinciaRespImp, TelefonoRespImp, CellulareRespImp, CodiceFiscaleRespImp, InQualitaDiRespImp,
           CognomeRespImp, NomeRespImp, PartitaIVAREspImp, NaturaGiuridicaRespimp, PotenzaNominaleMax
    FROM PRATICHE WHERE ID = :Imp_IdPratica   
  );

  /* ----- Dati dall'apparecchio ----- */

  declare App_COSTRUTTORE VARCHAR(45);
  declare App_MODELLO VARCHAR(30);
  declare App_MATRICOLA VARCHAR(30);
  declare App_ANNOCOSTRUZIONE INTEGER;
  declare App_MARCAEFFICENERGETICA VARCHAR(10);
  declare App_POTENZATERMICA DOUBLE PRECISION;
  declare App_POTENZATERMICAFOCOLARE DOUBLE PRECISION;
  declare App_POTENZAFRIGORIFERA DOUBLE PRECISION;
  declare App_TIPOLOGIA VARCHAR(80);
  declare App_TIPOLOGIA2 VARCHAR(20);
  declare App_TIPOLOGIA2_ALTRO VARCHAR(20);
  declare App_UBICAZIONE VARCHAR(30);
  declare App_DATAINSTALLAZIONE TIMESTAMP;
  declare App_RISCALDAMENTO CHAR(1);
  declare App_RAFFRESCAMENTO CHAR(1);
  declare App_ACQUASANITARIA CHAR(1);
  declare App_CUCINA CHAR(1);
  declare App_FLUIDOTERMOVETTORE VARCHAR(15);
  declare App_TIPOCAMERA VARCHAR(80);
  declare App_TIPOTIRAGGIO VARCHAR(80);
  declare App_TIPOTIRAGGIO_ALTRO VARCHAR(20);
  declare App_COMBUSTIBILE VARCHAR(20);
  declare App_CombustibileAltro VARCHAR(20);
  declare App_VOLUMETRIARISC DOUBLE PRECISION;
  declare App_ProgressivoImpianto VARCHAR(3);
  declare App_ProgressivoImpiantoDi VARCHAR(3);
  declare App_MARCATURACE VARCHAR(10);
  declare App_PLACCACAMINO VARCHAR(10);
  declare App_MODEVACUAZFUMI VARCHAR(10);
  declare App_ARIACOMBURENTE VARCHAR(10);
  declare App_CONTRARIACOMBURENTE VARCHAR(10);
  declare App_CARICACOMBUSTIBILE VARCHAR(10);
  declare App_NUMCIRCUITI INTEGER;

  declare CursApparecchio cursor for
  (
    SELECT COSTRUTTORE, MODELLO, MATRICOLA, ANNOCOSTRUZIONE, MARCAEFFICENERGETICA, POTENZATERMICA, POTENZATERMICAFOCOLARE, POTENZAFRIGORIFERA,
           TIPOLOGIA, TIPOLOGIA2, TIPOLOGIA2_ALTRO, UBICAZIONE, DATAINSTALLAZIONE, RISCALDAMENTO, RAFFRESCAMENTO, ACQUASANITARIA, CUCINA, FLUIDOTERMOVETTORE, TIPOCAMERA, TIPOTIRAGGIO, TIPOTIRAGGIO_ALTRO,
           COMBUSTIBILE, CombustibileAltro, VOLUMETRIARISC, ProgressivoImpianto, ProgressivoImpiantoDi, MARCATURACE, PLACCACAMINO, MODEVACUAZFUMI, ARIACOMBURENTE, CONTRARIACOMBURENTE, CARICACOMBUSTIBILE, NUMCIRCUITI
    FROM PRATAPPARECCHI WHERE ID = :in_IdPratApp 
  );

  /* ----- Dati dall'eventuale apparecchio abbinato ----- */

  declare Bruc_ID INTEGER;
  declare Bruc_COSTRUTTORE VARCHAR(45);
  declare Bruc_MODELLO VARCHAR(30);
  declare Bruc_MATRICOLA VARCHAR(30);
  declare Bruc_ANNOCOSTRUZIONE INTEGER;
  declare Bruc_DATAINSTALLAZIONE TIMESTAMP;
  declare Bruc_POTENZATERMICA DOUBLE PRECISION;
  declare Bruc_POTENZATERMICA2 DOUBLE PRECISION;
  declare Bruc_TIPOLOGIA VARCHAR(80);

  declare CursBruciatore cursor for
  (
    SELECT FIRST 1 ID, COSTRUTTORE, MODELLO, MATRICOLA, ANNOCOSTRUZIONE, DATAINSTALLAZIONE, POTENZATERMICA, POTENZATERMICA2, TIPOLOGIA
    FROM PRATAPPARECCHI WHERE IDPRATICA = :Imp_IdPratica AND ID = :in_BrucId
  );

  /* ----- Dati del tecnico ----- */

  declare Tecnico_Nome VARCHAR(60);
  declare Tecnico_RagioneSociale VARCHAR(60);
  declare Tecnico_Indirizzo VARCHAR(100);
  declare Tecnico_Telefono VARCHAR(60);
  declare Tecnico_EstremiDocQualifica VARCHAR(60);

  declare CursTecnico cursor for
  (
    SELECT Nome, RagioneSociale, Indirizzo, Telefono, EstremiDocQualifica
    FROM TECNICI WHERE RESOURCEID = :Imp_IdTecnico
  );

  /* ----- Nuovo ID dell'allegato ----- */
  declare CursNuovoIdAllegato cursor for
  (
    SELECT GEN_ID(GEN_ID_ALLEGATIMANUT,1) FROM RDB$DATABASE  
  );

/* ========================================================================================================== */
BEGIN

  /* ----- Verifica i parametri ricevuti ----- */
  IF (:in_TipoAllegato IS NULL OR NOT (:in_TipoAllegato='F - impianti termici' OR :in_TipoAllegato='G - impianti termici' OR :in_TipoAllegato='RCEE1 - gruppi termici' OR :in_TipoAllegato='RCEE1B - gruppi termici a biomassa combustibile' OR :in_TipoAllegato='RCEE2 - gruppi frigo/pompe di calore')) THEN BEGIN
    EXCEPTION EX_GEN_PARAMETRO_NON_VALIDO 'Procedure ALLIMP_NUOVO_ALLEGATO_FG: Parametro in_TipoAllegato non valido.';
  END
  IF (:in_IdImpegno IS NULL OR :in_IdImpegno = 0) THEN BEGIN
    EXCEPTION EX_GEN_PARAMETRO_NON_VALIDO 'Procedure ALLIMP_NUOVO_ALLEGATO_FG: Parametro in_IdImpegno non valido.';
  END

  /* ----- RIcava i dati dell'impegno ----- */
  OPEN CursImpegni;
  FETCH CursImpegni INTO :Imp_IdPratica, :Imp_IdTecnico;
  CLOSE CursImpegni;
  IF (ROW_COUNT = 0) THEN EXCEPTION EX_GEN_RECORD_NON_TROVATO 'Procedure ALLIMP_NUOVO_ALLEGATO_FG: Impegno non trovato.';


  /* ----- RIcava i dati dell'impianto ----- */
  OPEN CursPratica;
  FETCH CursPratica INTO :Prat_CodiceCatasto, :Prat_CodiceIstatComuneImm, :Prat_ComuneIMM, :Prat_CAPImm, :Prat_CAPImm, :Prat_IndirizzoIMM, :Prat_NumCivicoIMM, :Prat_PianoIMM, :Prat_InternoIMM, :Prat_ScalaIMM, :Prat_PalazzoIMM, :Prat_ProvinciaIMM,
                         :Prat_CodiceCli, :Prat_RagSocCli, :Prat_IndirizzoCli, :Prat_NumCivicoCli, :Prat_CapCli, :Prat_CittaCli, :Prat_ProvinciaCli, :Prat_TelefonoCli, :Prat_CellulareCli, :Prat_CodiceFiscaleCli,
                         :Prat_CodiceRespImp, :Prat_RagSocRespImp, :Prat_IndirizzoRespImp, :Prat_NumCivicoRespImp, :Prat_CapRespImp, :Prat_CittaRespImp, :Prat_ProvinciaRespImp,
                         :Prat_TelefonoRespImp, :Prat_CellulareRespImp, :Prat_CodiceFiscaleRespImp, :Prat_InQualitaDiRespImp, :Prat_CognomeRespImp, :Prat_NomeRespImp, :Prat_PartitaIVAREspImp, :Prat_NaturaGiuridicaRespimp, :Prat_PotenzaNominaleMax;
  CLOSE CursPratica;


  /* ----- Ricava i dati dell'apparecchio ----- */
  OPEN CursApparecchio;
  FETCH CursApparecchio INTO :App_COSTRUTTORE, :App_MODELLO, :App_MATRICOLA, :App_ANNOCOSTRUZIONE, :App_MARCAEFFICENERGETICA, :App_POTENZATERMICA, :App_POTENZATERMICAFOCOLARE, :App_POTENZAFRIGORIFERA,
                             :App_TIPOLOGIA, :App_TIPOLOGIA2, :App_TIPOLOGIA2_ALTRO, :App_UBICAZIONE, :App_DATAINSTALLAZIONE, :App_RISCALDAMENTO, :App_RAFFRESCAMENTO, :App_ACQUASANITARIA, :App_CUCINA, :App_FLUIDOTERMOVETTORE, :App_TIPOCAMERA, :App_TIPOTIRAGGIO, :App_TIPOTIRAGGIO_ALTRO,
                             :App_COMBUSTIBILE, :App_CombustibileAltro, :App_VOLUMETRIARISC, :App_ProgressivoImpianto, :App_ProgressivoImpiantoDi,
                             :App_MARCATURACE, :App_PLACCACAMINO, :App_MODEVACUAZFUMI, :App_ARIACOMBURENTE, :App_CONTRARIACOMBURENTE, :App_CARICACOMBUSTIBILE, :App_NUMCIRCUITI;
  CLOSE CursApparecchio;


  /* ----- RIcava i dati dall'eventuale apparecchio abbinato ----- */
  IF (in_BrucId > 0) THEN BEGIN
    OPEN CursBruciatore;
    FETCH CursBruciatore INTO :Bruc_ID, :Bruc_COSTRUTTORE, :Bruc_MODELLO, :Bruc_MATRICOLA, :Bruc_ANNOCOSTRUZIONE, :Bruc_DATAINSTALLAZIONE, :Bruc_POTENZATERMICA, :Bruc_POTENZATERMICA2, :Bruc_TIPOLOGIA;
    CLOSE CursBruciatore;
  END


  /* ----- RIcava i dati del tecnico ----- */
  OPEN CursTecnico;
  FETCH CursTecnico INTO :Tecnico_Nome, :Tecnico_RagioneSociale, :Tecnico_Indirizzo, :Tecnico_Telefono, :Tecnico_EstremiDocQualifica;
  CLOSE CursTecnico;

  /* ----- Ricava l'ID del nuovo allegato ----- */
  OPEN CursNuovoIdAllegato;
  FETCH CursNuovoIdAllegato INTO :out_IdNuovoAllegato;
  CLOSE CursNuovoIdAllegato;

  /* ----- Creazione del nuovo allegato ----- */
  INSERT INTO ALLEGATI_MANUT (

      ID,
      TIPO,
      STATOAVANZAMENTO,
      COPIE,
      DATAORADAIMPEGNO,
      DATACONTROLLO,
      DATAORAARRIVO,
      DATAORAPARTENZA,
      IDIMPEGNO,
      CODICECATASTO,
      PotenzaNominaleMax,

      CodiceIstatComuneImm,
      COMUNEIMM,
      CAPIMM,
      ZONAIMM,
      INDIRIZZOIMM,
      NUMCIVICOIMM,
      PIANOIMM,
      INTERNOIMM,
      SCALAIMM,
      PALAZZOIMM,
      PROVINCIAIMM,

      CodiceRespImp,
      RagSocRespImp,
      IndirizzoRespImp,
      NumCivicoRespImp,
      CapRespImp,
      CittaRespImp,
      ProvinciaRespImp,
      TelefonoRespImp,
      CellulareRespImp,
      CodiceFiscaleRespImp,
      InQualitaDiRespImp,
      CognomeRespImp,
      NomeRespImp,
      PartitaIVARespimp,
      NaturaGiuridicaRespImp,

      PropCodice,
      PropDenominazione,
      PropIndirizzo,
      PropNumCivico,
      PropCAP,
      PropLocalita,
      PropProvincia,
      PropTelefono,
      PropCellulare,
      PropCodiceFiscale,

      GENCAL_ID,
      GENCAL_COSTRUTTORE,
      GENCAL_MODELLO,
      GENCAL_MATRICOLA,
      GENCAL_TIPOLOGIA,
      GENCAL_TIPOLOGIA2,
      GENCAL_TIPOLOGIA2_ALTRO,
      GENCAL_TIPOCAMERA,
      GENCAL_TIPOTIRAGGIO,
      GENCAL_TIPOTIRAGGIO_ALTRO,
      GENCAL_ANNOCOSTRUZIONE,
      GENCAL_POTENZATERMICAFOCOLARE,
      GENCAL_POTENZATERMICA,
      FRIGO_POTENZAFRIGORIFERA,
      GENCAL_MARCAEFFICENERGETICA,
      GENCAL_RISCALDAMENTO,
      FRIGO_RAFFRESCAMENTO,
      GENCAL_ACQUASANITARIA,
      GENCAL_CUCINA,
      GENCAL_COMBUSTIBILE,
      GENCAL_COMBUSTIBILEALTRO,
      GENCAL_UBICAZIONE,
      GENCAL_DATAINSTALLAZIONE,
      GENCAL_VOLUMETRIARISC,
      GENCAL_FLUIDOTERMOVETTORE,
      GENCAL_MARCATURACE,
      GENCAL_PLACCACAMINO,
      GENCAL_MODEVACUAZFUMI,
      GENCAL_ARIACOMBURENTE,
      GENCAL_CONTRARIACOMBURENTE,
      GENCAL_CARICACOMBUSTIBILE,
      FRIGO_NUMCIRCUITI,
      PAG,
      PAGDI,

      BRUC_ID,
      BRUC_COSTRUTTORE,
      BRUC_MODELLO,
      BRUC_MATRICOLA,
      BRUC_TIPOLOGIA,
      BRUC_ANNOCOSTRUZIONE,
      BRUC_DATAINSTALLAZIONE,
      BRUC_CAMPOFUNZIONAMENTO,
      BRUC_CAMPOFUNZIONAMENTO2,

      ANFUMI_EFFETTUATO,
      IMPPUOFUNZIONARE,

      TECNICO_RESOURCEID,
      TECNICO_NOMECOGNOME,
      TECNICO_RAGSOC,
      TECNICO_INDIRIZZO,
      TECNICO_TELEFONO,
      TECNICO_ESTREMIDOCQUALIFICA)

  VALUES (

      :out_IdNuovoAllegato,
      :in_TipoAllegato,
      10,
      :in_Copie, 
      'T',
      :in_DataOraInizioIntervento,
      :in_DataOraInizioIntervento,
      :in_DataOraFineIntervento,
      :in_IdImpegno,
      :Prat_CODICECATASTO,
      :Prat_PotenzaNominaleMax, 

      :Prat_CodiceIstatComuneImm,
      :Prat_ComuneIMM,
      :Prat_CAPImm,
      :Prat_ZonaIMM,
      :Prat_IndirizzoIMM,
      :Prat_NumCivicoIMM,
      :Prat_PianoIMM,
      :Prat_InternoIMM,
      :Prat_ScalaIMM,
      :Prat_PalazzoIMM,
      :Prat_ProvinciaIMM,

      :Prat_CodiceRespImp,
      :Prat_RagSocRespImp,
      :Prat_IndirizzoRespImp,
      :Prat_NumCivicoRespImp,
      :Prat_CapRespImp,
      :Prat_CittaRespImp,
      :Prat_ProvinciaRespImp,
      :Prat_TelefonoRespImp,
      :Prat_CellulareRespImp,
      :Prat_CodiceFiscaleRespImp,
      :Prat_InQualitaDiRespImp,
      :Prat_CognomeRespImp,
      :Prat_NomeRespImp,
      :Prat_PartitaIVARespImp,
      :Prat_NaturaGiuridicaRespImp,

      :Prat_CodiceCli,
      :Prat_RagSocCli,
      :Prat_IndirizzoCli,
      :Prat_NumCivicoCli,
      :Prat_CapCli,
      :Prat_CittaCli,
      :Prat_ProvinciaCli,
      :Prat_TelefonoCli,
      :Prat_CellulareCli,
      :Prat_CodiceFiscaleCli,

      :in_IdPratApp,
      :App_COSTRUTTORE,
      :App_MODELLO,
      :App_MATRICOLA,
      :App_TIPOLOGIA,
      :App_TIPOLOGIA2,
      :App_TIPOLOGIA2_ALTRO,
      :App_TIPOCAMERA,
      :App_TIPOTIRAGGIO,
      :App_TIPOTIRAGGIO_ALTRO,
      :App_ANNOCOSTRUZIONE,
      :App_POTENZATERMICAFOCOLARE,
      :App_POTENZATERMICA,
      :App_POTENZAFRIGORIFERA,
      :App_MARCAEFFICENERGETICA,
      :App_RISCALDAMENTO,
      :App_RAFFRESCAMENTO,
      :App_ACQUASANITARIA,
      :App_CUCINA,
      :App_COMBUSTIBILE,
      :App_CombustibileAltro,
      :App_UBICAZIONE,
      :App_DATAINSTALLAZIONE,
      :App_VOLUMETRIARISC,
      :App_FLUIDOTERMOVETTORE,
      :App_MARCATURACE, 
      :App_PLACCACAMINO, 
      :App_MODEVACUAZFUMI, 
      :App_ARIACOMBURENTE, 
      :App_CONTRARIACOMBURENTE, 
      :App_CARICACOMBUSTIBILE, 
      :App_NUMCIRCUITI, 
      :App_ProgressivoImpianto, 
      :App_ProgressivoImpiantoDi, 

      :Bruc_ID,
      :Bruc_COSTRUTTORE,
      :Bruc_MODELLO,
      :Bruc_MATRICOLA,
      :Bruc_TIPOLOGIA,
      :Bruc_ANNOCOSTRUZIONE,
      :Bruc_DATAINSTALLAZIONE,
      :Bruc_POTENZATERMICA,
      :Bruc_POTENZATERMICA2,

      NULL,
      NULL,

      :Imp_IdTecnico,
      :Tecnico_Nome,
      :Tecnico_RagioneSociale,
      :Tecnico_Indirizzo,
      :Tecnico_Telefono,
      :Tecnico_EstremiDocQualifica);

  /* Se richiesto copia i dati (checks) dall'allegato precedente */
  if (COALESCE(in_CopiaDatiPrec,'F') = 'T') then EXECUTE PROCEDURE ALLIMP_COPIA_DATI_ALLEGATI_FG(:out_IdNuovoAllegato, :in_IdPratApp);
  

  /* Fine ed uscita */
  Suspend;
  Exit;

END^

SET TERM ; ^

