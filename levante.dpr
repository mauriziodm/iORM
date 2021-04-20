program levante;



uses
  ShareMem,
  MidasLib, // Per evitare un AV nel caso ci fosse una DLL con versione non corretta (in questo modo linka anche la dll nell'eseguibile e va sempre bene)
  Forms,
  main in 'main.pas' {mainForm},
  DataModule1 in 'DataModule1.pas' {DM1: TDataModule1},
  SchedaArticoli1 in 'SchedaArticoli1.pas' {ArticoliForm},
  SchedaClienti in 'SchedaClienti.pas' {ClientiForm},
  SchedaProgressivi in 'SchedaProgressivi.pas' {ProgressiviForm},
  SchedaPreventiviOrdini in 'SchedaPreventiviOrdini.pas' {PreventiviOrdiniForm},
  PreventiviOrdiniReport in 'PreventiviOrdiniReport.pas' {QReportPreventiviOrdini},
  SchedaIntestazioneDocumenti in 'SchedaIntestazioneDocumenti.pas' {IntestazioneDocumentiForm},
  SchedaDatiAzienda in 'SchedaDatiAzienda.pas' {DatiAziendaForm},
  SchedaTesti in 'SchedaTesti.pas' {TestiForm},
  QRTesti in 'QRTesti.pas' {TestiQR: TQuickRep},
  FormScadenziario in 'FormScadenziario.pas' {ScadenzeForm},
  FormPagamenti in 'FormPagamenti.pas' {PagamentiForm},
  FormBanche in 'FormBanche.pas' {BancheForm},
  FormContatti in 'FormContatti.pas' {ContattiForm},
  FormExtPrg in 'FormExtPrg.pas' {ExtPrgForm},
  FormExtFile in 'FormExtFile.pas' {ExtFileForm},
  FormAnagCli in 'FormAnagCli.pas' {AnagCliForm},
  FormAnagArt in 'FormAnagArt.pas' {AnagArtForm},
  FormNetDir in 'FormNetDir.pas' {NetDirForm},
  FormAziende in 'FormAziende.pas' {AziendeForm},
  FormSplash in 'FormSplash.pas' {SplashForm},
  FormConformita in 'FormConformita.pas' {ConformitaForm},
  FormAbout in 'FormAbout.pas' {AboutForm},
  Smartkey in 'Smartkey.pas',
  FormSelezioneStato in 'FormSelezioneStato.pas' {SelezioneStatoForm},
  FormStatiOggetti in 'FormStatiOggetti.pas' {StatiOggettiForm},
  FormSelezioneCliente in 'FormSelezioneCliente.pas' {SelezioneClienteForm},
  FormAliquoteIVA in 'FormAliquoteIVA.pas' {AliquoteIVAForm},
  QRRicevuteFiscali in 'QRRicevuteFiscali.pas' {QReportRicevuteFiscali: TQuickRep},
  QRSchedaCliente in 'QRSchedaCliente.pas' {SchedaClienteQR: TQuickRep},
  FormCategoria1 in 'FormCategoria1.pas' {Categoria1Form},
  QRBusta in 'QRBusta.pas' {BustaQR: TQuickRep},
  QRCartIn in 'QRCartIn.pas' {CartaIntestataQR: TQuickRep},
  FormWait in 'FormWait.pas' {WaitForm},
  FormImportazione in 'FormImportazione.pas' {ImportazioneForm},
  FormPrimanota in 'FormPrimanota.pas' {PrimanotaForm},
  FormSecurity in 'FormSecurity.pas' {SecurityForm},
  FormBackup in 'FormBackup.pas' {BackupForm},
  FormSettaStampante in 'FormSettaStampante.pas' {SettaStampanteForm},
  FormHelp in 'FormHelp.pas' {HelpForm},
  FormSubSogg in 'FormSubSogg.pas' {SubSoggForm},
  QRElencoMateriale in 'QRElencoMateriale.pas' {ElencoMaterialeQR: TQuickRep},
  QRAutodichiarazione in 'QRAutodichiarazione.pas' {AutodichiarazioneQR: TQuickRep},
  QRDichiarazioneGas in 'QRDichiarazioneGas.pas' {DichiarazioneGasQR: TQuickRep},
  QRRichiestaPrimaAccensione in 'QRRichiestaPrimaAccensione.pas' {RichiestaPrimaAccensioneQR: TQuickRep},
  FormCausali in 'FormCausali.pas' {CausaliForm},
  FormAnagMaga in 'FormAnagMaga.pas' {AnagMagaForm},
  FormGruppi in 'FormGruppi.pas' {GruppiForm},
  FormFattDifferita in 'FormFattDifferita.pas' {FattDifferitaForm},
  FormCondVend in 'FormCondVend.pas' {CondVendForm},
  FormSynchro in 'FormSynchro.pas' {SynchroForm},
  FormArchivioBanche in 'FormArchivioBanche.pas' {ArchivioBancheForm},
  FormHints in 'FormHints.pas' {HintsForm},
  ThreadLev in 'ThreadLev.pas',
  FormHint in 'FormHint.pas' {HintForm},
  FormPagamRisc in 'FormPagamRisc.pas' {PagamRiscForm},
  FormPratica in 'FormPratica.pas' {PraticaForm},
  FrameStart in 'FrameStart.pas' {StartFrame: TFrame},
  FormMessage in 'FormMessage.pas' {MessageForm},
  UnitRistruttura in 'UnitRistruttura.pas',
  FormMultiregistro in 'FormMultiregistro.pas' {MultiregistroForm},
  FormSostArt in 'FormSostArt.pas' {SostArtForm},
  FormRiattivazione in 'FormRiattivazione.pas' {RiattivazioneForm},
  XMLDocumento in 'XMLDocumento.pas',
  UnitSaveXMLDocument in 'UnitSaveXMLDocument.pas',
  FormScambioDoc in 'FormScambioDoc.pas' {ScambioDocForm},
  FormCheckIn in 'FormCheckIn.pas' {ChekInForm},
  QRAppuntamento in 'QRAppuntamento.pas' {AppuntamentoQR: TQuickRep},
  QRAllegatoH in 'QRAllegatoH.pas' {AllegatoHQR: TQuickRep},
  QRRetroAllegatoH in 'QRRetroAllegatoH.pas' {RetroAllegatoHQR: TQuickRep},
  FormTecnici in 'FormTecnici.pas' {TecniciForm},
  FormPhotoArt in 'FormPhotoArt.pas' {PhotoArtForm},
  QRListino in 'QRListino.pas' {ListinoQR: TQuickRep},
  FormLevante in 'FormLevante.pas' {LevanteForm},
  FormLevanteListAnag in 'FormLevanteListAnag.pas' {LevanteListAnagForm},
  FormApparecchi in 'FormApparecchi.pas' {ApparecchiForm},
  FormLeftSide in 'FormLeftSide.pas' {LeftSideForm},
  FormModelBase in 'FormModelBase.pas' {ModelBaseForm},
  FormModelAnagrafica in 'FormModelAnagrafica.pas' {ModelAnagraficaForm},
  FormModelLista in 'FormModelLista.pas' {ModelListaForm},
  FormModelAnagraficaLista in 'FormModelAnagraficaLista.pas' {ModelAnagraficaListaForm},
  FormModelPannelliWizard in 'FormModelPannelliWizard.pas' {ModelPannelliWizardForm},
  FormAumentoListini in 'FormAumentoListini.pas' {AumentoListiniForm},
  FormPuzzleTools in 'FormPuzzleTools.pas' {PuzzleToolsForm},
  Bancolini_B31WIN32 in 'Bancolini_B31WIN32.pas',
  FormListaModelliConf in 'FormListaModelliConf.pas' {ListaModelliConfForm},
  FormModelWizard in 'FormModelWizard.pas' {ModelWizardForm},
  FormConformWizard in 'FormConformWizard.pas' {ConformWizardForm},
  FormImportaArcBase in 'FormImportaArcBase.pas' {ImportaArcBaseForm},
  ARAll4690S2QB in 'ARAll4690S2QB.pas' {All4690S2QBQR: TQuickRep},
  QRAll4690Pag3 in 'QRAll4690Pag3.pas' {All4690Pag3QR: TQuickRep},
  QRAll4690Pag1 in 'QRAll4690Pag1.pas' {All4690Pag1QR: TQuickRep},
  FormSocGas in 'FormSocGas.pas' {SocGasForm},
  FormStampaDichiarazione in 'FormStampaDichiarazione.pas' {StampaDichiarazioneForm},
  FormModificaMargini in 'FormModificaMargini.pas' {ModificaMarginiForm},
  FormQtaArticolo in 'FormQtaArticolo.pas' {QtaArticoloForm},
  UnitCambiaDefaultPrinter in 'UnitCambiaDefaultPrinter.pas',
  unExportRiba in 'unExportRiba.pas' {FormExportRIBA},
  UnitSystemDirs in 'UnitSystemDirs.pas',
  FormPuzzleToolsGas in 'FormPuzzleToolsGas.pas' {PuzzleToolsGasForm},
  FormPuzzleToolsTermo in 'FormPuzzleToolsTermo.pas' {PuzzleToolsTermoForm},
  FormPuzzleToolsIdro in 'FormPuzzleToolsIdro.pas' {PuzzleToolsIdroForm},
  QRGasDisegno in 'QRGasDisegno.pas' {GasDisegnoQR: TQuickRep},
  QRRelazioneTopologicaGas in 'QRRelazioneTopologicaGas.pas' {RelazioneTopologicaGasQR: TQuickRep},
  QRRelazioneTopologicaTermo in 'QRRelazioneTopologicaTermo.pas' {RelazioneTopologicaTermoQR: TQuickRep},
  QRRelazioneTopologicaIdro in 'QRRelazioneTopologicaIdro.pas' {RelazioneTopologicaIdroQR: TQuickRep},
  FormDipendenti in 'FormDipendenti.pas' {DipendentiForm},
  FormAutomezzi in 'FormAutomezzi.pas' {AutomezziForm},
  FormTipiOreDipendenti in 'FormTipiOreDipendenti.pas' {TipiOreDipendentiForm},
  FormTipiAltreSpese in 'FormTipiAltreSpese.pas' {TipiAltreSpeseForm},
  FormRappGiorn in 'FormRappGiorn.pas' {RappGiornForm},
  FormModelPivotDetail in 'FormModelPivotDetail.pas' {ModelPivotDetailForm},
  FormGosOrePivotDetail in 'FormGosOrePivotDetail.pas' {GosOrePivotDetailForm},
  FormGosSpesePivot in 'FormGosSpesePivot.pas' {GosSpesePivotForm},
  FormStampeCantieri in 'FormStampeCantieri.pas' {StampeCantieriForm},
  QRNoteDichiarazioneConformita in 'QRNoteDichiarazioneConformita.pas' {NoteDichiarazioneConformitaQR: TQuickRep},
  QRElencoMateriale_DM37 in 'QRElencoMateriale_DM37.pas' {ElencoMaterialeQR_DM37: TQuickRep},
  QRUltimiInterventiImpianto in 'QRUltimiInterventiImpianto.pas' {UltimiInterventiImpiantoQR: TQuickRep},
  FormChiusuraMagazzino in 'FormChiusuraMagazzino.pas' {ChiusuraMagazzinoForm},
  FormDatiRigo in 'FormDatiRigo.pas' {DatiRigoForm},
  FormQtaOpera in 'FormQtaOpera.pas' {QtaOperaForm},
  FormBeforeNewDoc in 'FormBeforeNewDoc.pas' {BeforeNewDocForm},
  FormSelezionaImpianto in 'FormSelezionaImpianto.pas' {SelezionaImpiantoForm},
  FormSelezionaPraticheImpianti in 'FormSelezionaPraticheImpianti.pas' {SelezionaPraticheImpiantiForm},
  ExtTerm_Zebex_Z2031 in 'ExtTerm_Zebex_Z2031.pas',
  FormVendBancoSeleCant in 'FormVendBancoSeleCant.pas' {VendBancoSeleCantForm},
  FormConfermaDocExpressMag in 'FormConfermaDocExpressMag.pas' {ConfermaDocExpressMagForm},
  FormPassword in 'FormPassword.pas' {PasswordForm},
  FormAgenti in 'FormAgenti.pas' {AgentiForm},
  FormTipiRighi in 'FormTipiRighi.pas' {TipiRighiForm},
  UnitFileRepository in 'UnitFileRepository.pas',
  FormRepository in 'FormRepository.pas' {RepositoryForm},
  FormModelPerTabPageControlPrincipale in 'FormModelPerTabPageControlPrincipale.pas' {ModelPerTabPageControlPrincipaleForm},
  FormTabPartitario in 'FormTabPartitario.pas' {TabPartitarioForm},
  FormTabGC in 'FormTabGC.pas' {TabGCForm},
  QRIndiceCategorie in 'QRIndiceCategorie.pas' {IndiceCategorieQR: TQuickRep},
  QRIndiceAlfabetico in 'QRIndiceAlfabetico.pas' {IndiceAlfabeticoQR: TQuickRep},
  QRIndiceFornitori in 'QRIndiceFornitori.pas' {IndiceFornitoriQR: TQuickRep},
  QRListinoNoBarCode in 'QRListinoNoBarCode.pas' {ListinoNoBarCodeQR: TQuickRep},
  FormGC_CreaFattura in 'FormGC_CreaFattura.pas' {GC_CreaFatturaForm},
  UnitRepositoryIniFile in 'UnitRepositoryIniFile.pas',
  FormTabResOrd in 'FormTabResOrd.pas' {TagResOrdForm},
  FormQtaArticoloGC in 'FormQtaArticoloGC.pas' {QtaArticoloGCForm},
  FormExport in 'FormExport.pas' {ExportForm},
  FormVariazioneOre in 'FormVariazioneOre.pas' {VariazioneOreForm},
  FormOperazioniPianificate in 'FormOperazioniPianificate.pas' {OperazioniPianificateForm},
  FormForzaGiacenzeMagazzino in 'FormForzaGiacenzeMagazzino.pas' {ForzaGiacenzeMagazzinoForm},
  FormAzzeramentoMagazzino in 'FormAzzeramentoMagazzino.pas' {AzzeramentoMagazzinoForm},
  FormAllegati in 'FormAllegati.pas' {AllegatiForm},
  FormFileAllegatoModificato in 'FormFileAllegatoModificato.pas' {FileAllegatoModificatoForm},
  FormModelBaseAllegati in 'FormModelBaseAllegati.pas' {ModelBaseAllegatiForm},
  FormAllegatiAlarm in 'FormAllegatiAlarm.pas' {AllegatiAlarmForm},
  FormAggiornaOp in 'FormAggiornaOp.pas' {AggiornaOpForm},
  FormAllegatiFG in 'FormAllegatiFG.pas' {AllegatiFGForm},
  FormConfermaAppuntamento in 'FormConfermaAppuntamento.pas' {ConfermaAppuntamentoForm},
  DataModuleStyles in 'DataModuleStyles.pas' {DMStyles: TDataModule},
  FormGMap in 'FormGMap.pas' {GmapForm},
  QRAllegatoGVanz in 'QRAllegatoGVanz.pas' {AllegatoGVanzQR: TQuickRep},
  QRModelAllegatiVanzo in 'QRModelAllegatiVanzo.pas' {ModelAllegatiVanzoQR: TQuickRep},
  QRAllegatoFVanz in 'QRAllegatoFVanz.pas' {AllegatoFVanzQR: TQuickRep},
  DataModule2 in 'DataModule2.pas' {DM2: TDataModule},
  FormConfermaPrescrizFatta in 'FormConfermaPrescrizFatta.pas' {ConfermaPrescrizFattaForm},
  FormTabImpianti in 'FormTabImpianti.pas' {TabImpiantiForm},
  FormSelezioneStradario in 'FormSelezioneStradario.pas' {SelezioneStradarioForm},
  FormLevanteFilterListAnag in 'FormLevanteFilterListAnag.pas' {LevanteFilterListAnagForm},
  FormEnti in 'FormEnti.pas' {EntiForm},
  FormExportAllegatiManut in 'FormExportAllegatiManut.pas' {ExportAllegatiManutForm},
  ModelFormBandListFilterAnag in 'ModelFormBandListFilterAnag.pas' {BandListFilterAnagFormModel},
  FormComunicazione in 'FormComunicazione.pas' {ComunicazioneForm},
  QRLettera in 'QRLettera.pas' {LetteraQR: TQuickRep},
  FormTabComunicazioni in 'FormTabComunicazioni.pas' {TabComunicazioniForm},
  FormTedoldi in 'FormTedoldi.pas' {TedoldiForm},
  FormComModelli in 'FormComModelli.pas' {ComModelliForm},
  FormComSegnaposto in 'FormComSegnaposto.pas' {ComSegnapostoForm},
  FormComRapportoFinale in 'FormComRapportoFinale.pas' {ComRapportoFinaleForm},
  FormMenuAggiungi in 'FormMenuAggiungi.pas' {MenuAggiungiForm},
  FormUpdateRepDownload in 'FormUpdateRepDownload.pas' {UpdateRepDownloadForm},
  FormAgendaSlide in 'FormAgendaSlide.pas' {AgendaSlideForm},
  LevGoogle in 'LevGoogle.pas',
  UnitGoogleTasks in 'UnitGoogleTasks.pas',
  FormGTask in 'FormGTask.pas' {GTaskForm},
  UnitGoogleCal in 'UnitGoogleCal.pas',
  FormGEvent in 'FormGEvent.pas' {GEventForm},
  DComCrypto in 'DComCrypto.pas',
  FormEtichetteFastReport in 'FormEtichetteFastReport.pas' {EtichetteFastReportForm},
  FormEtichetteBase in 'FormEtichetteBase.pas' {EtichetteBaseForm},
  FormEtichetteListImpostazioni in 'FormEtichetteListImpostazioni.pas' {EtichetteListImpostazioniForm},
  FormEtichetteListStampa in 'FormEtichetteListStampa.pas' {EtichetteListStampaForm},
  eCommerceImport_Savers in 'eCommerceImport_Savers.pas',
  eCommerceImport_Items in 'eCommerceImport_Items.pas',
  eCommerceImport_Loaders in 'eCommerceImport_Loaders.pas',
  eCommerceImport_Common in 'eCommerceImport_Common.pas',
  fatturapa_v11 in 'fatturapa_v11.pas',
  FatturaPA_DM in 'FatturaPA_DM.pas' {FatturaPA: TDataModule},
  QRDichiarazioneConformita in 'QRDichiarazioneConformita.pas' {DichiarazioneConformitaQR: TQuickRep},
  QRDIchiarazioneConformita4690 in 'QRDIchiarazioneConformita4690.pas' {DIchiarazioneConformita4690QR: TQuickRep},
  FormEtichettaEnergetica in 'FormEtichettaEnergetica.pas' {EtichettaEnergeticaForm},
  FormConversioneSoggetti in 'FormConversioneSoggetti.pas' {ConversioneSoggettiForm},
  FormBaseSetup in 'FormBaseSetup.pas' {BaseSetupForm},
  FormGMPivotDetail in 'FormGMPivotDetail.pas' {GMPivotDetailForm},
  FormDocPivotDetail in 'FormDocPivotDetail.pas' {DocPivotDetailForm},
  FrameChart in 'FrameChart.pas' {ChartFrame: TFrame},
  UnitTotaleACorpo in 'UnitTotaleACorpo.pas',
  UnitTotaleACorpo.Interfaces in 'UnitTotaleACorpo.Interfaces.pas',
  UnitTotaleACorpo.Factory in 'UnitTotaleACorpo.Factory.pas',
  USNCONTROLLO_CF_PI in 'USNCONTROLLO_CF_PI.PAS',
  UnitLevanteEInvoice in 'UnitLevanteEInvoice.pas',
  DDT.DocTypeItem in 'DDT.DocTypeItem.pas',
  DDT.MenuAddLink in 'DDT.MenuAddLink.pas',
  DDT.MenuAddLink.LDE in 'DDT.MenuAddLink.LDE.pas',
  DDT.Interfaces in 'DDT.Interfaces.pas',
  DDT.FilterLink in 'DDT.FilterLink.pas',
  DDT.FilterLink.LDE in 'DDT.FilterLink.LDE.pas',
  DDT.Factory in 'DDT.Factory.pas',
  DDT.WhereGenerator in 'DDT.WhereGenerator.pas',
  DDT.WhereGenerator.LDE in 'DDT.WhereGenerator.LDE.pas',
  DDT.DynamicDocTypes in 'DDT.DynamicDocTypes.pas',
  FormAssistenzeMobileMain in 'FormAssistenzeMobileMain.pas' {AssistenzeMobileMainForm},
  Levante.Version.LevGen in 'LevanteVersionCheck\Levante.Version.LevGen.pas',
  Levante.Version.InterfacesAndFactory in 'LevanteVersionCheck\Levante.Version.InterfacesAndFactory.pas',
  FormConfirm in 'FormConfirm.pas' {ConfirmForm},
  FormConfirmNumReg in 'FormConfirmNumReg.pas' {ConfirmNumRegFE},
  UnitCompression in 'UnitCompression.pas',
  FormImpegni in 'FormImpegni.pas' {ImpegnoForm},
  FormFatturaImpegni in 'FormFatturaImpegni.pas' {FatturaImpegniForm};

{$R *.RES}

begin
  // Visualizza la splashform
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;

//  Application.Initialize;
  Application.Title := 'Lev@nte';
  Application.CreateForm(TmainForm, mainForm);
//  Application.CreateForm(TConfirmNumRegFE, ConfirmNumRegFE);
  // Assolutamente prima di DM1
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TDM2, DM2);
  Application.CreateForm(TWaitForm, WaitForm);
  Application.CreateForm(THelpForm, HelpForm);
  Application.CreateForm(THintForm, HintForm);
  Application.CreateForm(TDMStyles, DMStyles);
  // Inizializzazione a nil
  MenuAggiungiForm          := nil;
  ClientiForm               := nil;
  PrimanotaForm             := nil;
  ScambioDocForm            := nil;
  MessageForm               := nil;
  TecniciForm               := nil;
  PhotoArtForm              := nil;
  CausaliForm               := nil;
  ApparecchiForm            := nil;
  AumentoListiniForm        := nil;
  PuzzleToolsForm           := nil;
  PuzzleToolsGasForm        := nil;
  PuzzleToolsTermoForm      := nil;
  PuzzleToolsIdroForm       := nil;
  ListaModelliConfForm      := nil;
  ImportaArcBaseForm        := nil;
  SocGasForm                := nil;
  StampaDichiarazioneForm   := nil;
  ModificaMarginiForm       := nil;
  QtaArticoloForm           := nil;
  FormExportRIBA            := nil;
  GasDisegnoQR              := nil;
  RelazioneTopologicaGasQR  := nil;
  RelazioneTopologicaTermoQR:= nil;
  RelazioneTopologicaIdroQR := nil;
  DipendentiForm            := nil;
  AutomezziForm             := nil;
  TipiOreDipendentiForm     := nil;
  TipiAltreSpeseForm        := nil;
  RappGiornForm             := nil;
  GosOrePivotDetailForm     := nil;
  GosSpesePivotForm         := nil;
  AziendeForm               := nil;
  StampeCantieriForm        := nil;
  UltimiInterventiImpiantoQR:= nil;
  ChiusuraMagazzinoForm     := nil;
  DatiRigoForm              := nil;
  QtaOperaForm              := nil;
  BeforeNewDocForm          := nil;
  SelezionaImpiantoForm     := nil;
  SelezionaPraticheImpiantiForm := nil;
  VendBancoSeleCantForm     := nil;
  ConfermaDocExpressMagForm := nil;
  PasswordForm              := nil;
  AgentiForm                := nil;
  TipiRighiForm             := nil;
  RepositoryForm            := nil;
  ModelPerTabPageControlPrincipaleForm := nil;
  TabPartitarioForm         := nil;
  NetDirForm                := nil;
  SecurityForm              := nil;
  TabGCForm                 := nil;
  IndiceCategorieQR         := nil;
  IndiceAlfabeticoQR        := nil;
  IndiceFornitoriQR         := nil;
  ListinoNoBarCodeQR        := nil;
  GC_CreaFatturaForm        := nil;
  TagResOrdForm             := nil;
  QtaArticoloGCForm         := nil;
  ExportForm                := nil;
  VariazioneOreForm         := nil;
  OperazioniPianificateForm := nil;
  ForzaGiacenzeMagazzinoForm:= nil;
  AzzeramentoMagazzinoForm  := nil;
  AllegatiForm              := nil;
  FileAllegatoModificatoForm:= nil;
  AllegatiAlarmForm         := nil;
  AggiornaOpForm            := nil;
  AllegatiFGForm            := nil;
  ConfermaAppuntamentoForm  := nil;
  GmapForm                  := nil;
  AllegatoGVanzQR           := nil;
  AllegatoFVanzQR           := nil;
  ConfermaPrescrizFattaForm := nil;
  TabImpiantiForm           := nil;
  SelezioneStradarioForm    := nil;
  EntiForm                  := nil;
  ExportAllegatiManutForm   := nil;
  BandListFilterAnagFormModel := nil;
  TabComunicazioniForm      := nil;
  ComModelliForm            := nil;
  ComunicazioneForm         := nil;
  TedoldiForm               := nil;
  ComSegnapostoForm         := nil;
  ComRapportoFinaleForm     := nil;
  UpdateRepDownloadForm     := nil;
  AgendaSlideForm           := nil;
  GTaskForm                 := nil;
  GEventForm                := nil;
  EtichetteFastReportForm   := nil;
  EtichetteListImpostazioniForm := nil;
  EtichetteListStampaForm   := nil;
  EtichettaEnergeticaForm   := nil;
  BaseSetupForm             := nil;
  GMPivotDetailForm         := nil;
  DocPivotDetailForm        := nil;
  AssistenzeMobileMainForm  := nil;
  ImpegnoForm               := nil;
  FatturaImpegniForm        := nil;
  ConfirmNumRegFE           := nil;

  //  Application.CreateForm(TIMpegnoAgendaForm, IMpegnoAgendaForm);
  Application.Run;
end.
