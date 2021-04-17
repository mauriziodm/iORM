object DM1: TDM1
  OldCreateOrder = True
  OnCreate = DM1Create
  Height = 815
  Width = 1060
  object TableAliquoteIVA: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    ColumnAttributes.Strings = (
      'ALIQIVA.CODICEIVA=REQUIRED')
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforeDelete = TableAliquoteIVABeforeDelete
    BeforePost = TableAliquoteIVABeforePost
    TableName = 'ALIQIVA'
    Left = 59
    Top = 61
    object TableAliquoteIVACODICEIVA: TIntegerField
      Alignment = taCenter
      FieldName = 'CODICEIVA'
      Origin = 'ALIQIVA.CODICEIVA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TableAliquoteIVADESCRIZIONEIVA: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRIZIONEIVA'
      Origin = 'ALIQIVA.DESCRIZIONEIVA'
      Size = 40
    end
    object TableAliquoteIVAALIQUOTAIVA: TIBOFloatField
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'ALIQUOTAIVA'
      Origin = 'ALIQIVA.ALIQUOTAIVA'
    end
    object TableAliquoteIVASINCHRO: TStringField
      FieldName = 'SINCHRO'
      Origin = 'ALIQIVA.SINCHRO'
      Size = 1
    end
    object TableAliquoteIVAEXPORT_CODICE: TStringField
      FieldName = 'EXPORT_CODICE'
      Origin = 'ALIQIVA.EXPORT_CODICE'
      Size = 10
    end
    object TableAliquoteIVAPA_NATURA: TStringField
      FieldName = 'PA_NATURA'
      Origin = 'ALIQIVA.PA_NATURA'
      FixedChar = True
      Size = 4
    end
    object TableAliquoteIVABOLLOAUTOMATICO: TStringField
      FieldName = 'BOLLOAUTOMATICO'
      Origin = 'ALIQIVA.BOLLOAUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object TableAliquoteIVAENABLED: TStringField
      FieldName = 'ENABLED'
      FixedChar = True
      Size = 1
    end
  end
  object SourceAliquoteIVA: TDataSource
    DataSet = TableAliquoteIVA
    Left = 88
    Top = 61
  end
  object TableProgressivi: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    IB_Transaction = TransProgressivi
    PessimisticLocking = True
    RecordCountAccurate = True
    TableName = 'PROGRESS'
    Left = 251
    Top = 218
    object TableProgressiviINDEXFIELD: TIntegerField
      FieldName = 'INDEXFIELD'
      Required = True
    end
    object TableProgressiviProgArt: TIntegerField
      FieldName = 'ProgArt'
    end
    object TableProgressiviMsgPreventivi: TStringField
      FieldName = 'MsgPreventivi'
      Size = 1000
    end
    object TableProgressiviMsgOrdini: TStringField
      FieldName = 'MsgOrdini'
      Size = 1000
    end
    object TableProgressiviMsgOrdiniFornitori: TStringField
      FieldName = 'MsgOrdiniFornitori'
      Size = 1000
    end
    object TableProgressiviMsgSAL: TStringField
      FieldName = 'MsgSAL'
      Size = 1000
    end
    object TableProgressiviMsgDDT: TStringField
      FieldName = 'MsgDDT'
      Size = 1000
    end
    object TableProgressiviMsgFatture: TStringField
      FieldName = 'MsgFatture'
      Size = 1000
    end
    object TableProgressiviMsgNoteAccredito: TStringField
      FieldName = 'MsgNoteAccredito'
      Size = 1000
    end
    object TableProgressiviMsgBolleEntrata: TStringField
      FieldName = 'MsgBolleEntrata'
      Size = 1000
    end
    object TableProgressiviMsgFattureAcquisto: TStringField
      FieldName = 'MsgFattureAcquisto'
      Size = 1000
    end
    object TableProgressiviMsgRicevuteFiscali: TStringField
      FieldName = 'MsgRicevuteFiscali'
      Size = 1000
    end
    object TableProgressiviMsgBuoniConsegna: TStringField
      FieldName = 'MsgBuoniConsegna'
      Size = 1000
    end
    object TableProgressiviCopiePreventivi: TSmallintField
      FieldName = 'CopiePreventivi'
    end
    object TableProgressiviCopieOrdini: TSmallintField
      FieldName = 'CopieOrdini'
    end
    object TableProgressiviCopieOrdForn: TSmallintField
      FieldName = 'CopieOrdForn'
    end
    object TableProgressiviCopieSAL: TSmallintField
      FieldName = 'CopieSAL'
    end
    object TableProgressiviCopieDDT: TSmallintField
      FieldName = 'CopieDDT'
    end
    object TableProgressiviCopieFatture: TSmallintField
      FieldName = 'CopieFatture'
    end
    object TableProgressiviCopieNoteAccredito: TSmallintField
      FieldName = 'CopieNoteAccredito'
    end
    object TableProgressiviCopieBolleEntrata: TSmallintField
      FieldName = 'CopieBolleEntrata'
    end
    object TableProgressiviCopieFattAcquisto: TSmallintField
      FieldName = 'CopieFattAcquisto'
    end
    object TableProgressiviCopieRicFisc: TSmallintField
      FieldName = 'CopieRicFisc'
    end
    object TableProgressiviCopieBuonoConsegna: TSmallintField
      FieldName = 'CopieBuonoConsegna'
    end
    object TableProgressiviENABLEPROGART: TStringField
      FieldName = 'ENABLEPROGART'
      Size = 1
    end
    object TableProgressiviVERSIONEARCBASE: TIntegerField
      FieldName = 'VERSIONEARCBASE'
    end
    object TableProgressiviCODICEOPERA: TStringField
      FieldName = 'CODICEOPERA'
      Size = 15
    end
    object TableProgressiviDESCRIZIONEOPERA: TStringField
      FieldName = 'DESCRIZIONEOPERA'
      Size = 45
    end
    object TableProgressiviUMOPERA: TStringField
      Alignment = taCenter
      FieldName = 'UMOPERA'
      Size = 2
    end
    object TableProgressiviPRZUNITOPERA1: TIBOFloatField
      FieldName = 'PRZUNITOPERA1'
      currency = True
    end
    object TableProgressiviPRZUNITOPERA2: TIBOFloatField
      FieldName = 'PRZUNITOPERA2'
      currency = True
    end
    object TableProgressiviPRZUNITOPERA3: TIBOFloatField
      FieldName = 'PRZUNITOPERA3'
      currency = True
    end
    object TableProgressiviPRZUNITOPERA4: TIBOFloatField
      FieldName = 'PRZUNITOPERA4'
      currency = True
    end
    object TableProgressiviDEFAULTABILITAMOVMAG: TStringField
      FieldName = 'DEFAULTABILITAMOVMAG'
      Size = 1
    end
    object TableProgressiviDEFAULTSOLOARTPREFERITI: TStringField
      FieldName = 'DEFAULTSOLOARTPREFERITI'
      Size = 1
    end
    object TableProgressiviSTARTPREVENTIVO: TBlobField
      FieldName = 'STARTPREVENTIVO'
      Size = 8
    end
    object TableProgressiviENDPREVENTIVO: TBlobField
      FieldName = 'ENDPREVENTIVO'
      Size = 8
    end
    object TableProgressiviABILITASTARTPREVENTIVO: TStringField
      FieldName = 'ABILITASTARTPREVENTIVO'
      Size = 1
    end
    object TableProgressiviABILITAENDPREVENTIVO: TStringField
      FieldName = 'ABILITAENDPREVENTIVO'
      Size = 1
    end
    object TableProgressiviEVIDENZIACONSEGNAENTRO: TSmallintField
      FieldName = 'EVIDENZIACONSEGNAENTRO'
    end
    object TableProgressiviTIPOCALCOLOLISTINIARTICOLI: TStringField
      FieldName = 'TIPOCALCOLOLISTINIARTICOLI'
      Size = 1
    end
    object TableProgressiviPROGARTDESTINATION: TStringField
      FieldName = 'PROGARTDESTINATION'
    end
    object TableProgressiviULTPRZACQ_BOLLEENTR: TStringField
      FieldName = 'ULTPRZACQ_BOLLEENTR'
      Size = 1
    end
    object TableProgressiviULTPRZACQ_FATTACQUI: TStringField
      FieldName = 'ULTPRZACQ_FATTACQUI'
      Size = 1
    end
    object TableProgressiviSCONTOSOGGNELRIGO: TStringField
      FieldName = 'SCONTOSOGGNELRIGO'
      Size = 1
    end
    object TableProgressiviTESTOEMAIL: TMemoField
      FieldName = 'TESTOEMAIL'
      BlobType = ftMemo
    end
    object TableProgressiviGENERAZAUTOMATICAPRIMANOTA: TStringField
      FieldName = 'GENERAZAUTOMATICAPRIMANOTA'
      Size = 1
    end
    object TableProgressiviRICARICOLISTINO1: TIBOFloatField
      FieldName = 'RICARICOLISTINO1'
    end
    object TableProgressiviRICARICOLISTINO2: TIBOFloatField
      FieldName = 'RICARICOLISTINO2'
    end
    object TableProgressiviRICARICOLISTINO3: TIBOFloatField
      FieldName = 'RICARICOLISTINO3'
    end
    object TableProgressiviRICARICOLISTINO4: TIBOFloatField
      FieldName = 'RICARICOLISTINO4'
    end
    object TableProgressiviALTRIDOCINELENCOSEPARATO: TStringField
      FieldName = 'ALTRIDOCINELENCOSEPARATO'
      Size = 1
    end
    object TableProgressiviSCONTOBASEACQ: TIBOFloatField
      FieldName = 'SCONTOBASEACQ'
    end
    object TableProgressiviARCO_CARICAGRUPPI: TStringField
      FieldName = 'ARCO_CARICAGRUPPI'
      Size = 1
    end
    object TableProgressiviARCO_BARCODE: TStringField
      FieldName = 'ARCO_BARCODE'
      Size = 1
    end
    object TableProgressiviMAG_ORDINATONELDISPONIBILE: TStringField
      FieldName = 'MAG_ORDINATONELDISPONIBILE'
      Size = 1
    end
    object TableProgressiviSTESSANUMERAZFATTNOTECRED: TStringField
      FieldName = 'STESSANUMERAZFATTNOTECRED'
      Size = 1
    end
    object TableProgressiviBCL_CONSIDERA_SC1: TStringField
      FieldName = 'BCL_CONSIDERA_SC1'
      Size = 1
    end
    object TableProgressiviBCL_CONSIDERA_SC2: TStringField
      FieldName = 'BCL_CONSIDERA_SC2'
      Size = 1
    end
    object TableProgressiviBCL_CONSIDERA_SC3: TStringField
      FieldName = 'BCL_CONSIDERA_SC3'
      Size = 1
    end
    object TableProgressiviRICARICHIPERFASCEPREZZO: TStringField
      FieldName = 'RICARICHIPERFASCEPREZZO'
      Size = 1
    end
    object TableProgressiviDBVER: TIntegerField
      FieldName = 'DBVER'
    end
    object TableProgressiviMSGCOMMESSA: TStringField
      FieldName = 'MSGCOMMESSA'
      Size = 1000
    end
    object TableProgressiviMSGCARICOCANTIERE: TStringField
      FieldName = 'MSGCARICOCANTIERE'
      Size = 1000
    end
    object TableProgressiviMSGSCARICOCANTIERE: TStringField
      FieldName = 'MSGSCARICOCANTIERE'
      Size = 1000
    end
    object TableProgressiviMSGCONTO: TStringField
      FieldName = 'MSGCONTO'
      Size = 1000
    end
    object TableProgressiviCOPIECOMMESSA: TSmallintField
      FieldName = 'COPIECOMMESSA'
    end
    object TableProgressiviCOPIECARICOCANTIERE: TSmallintField
      FieldName = 'COPIECARICOCANTIERE'
    end
    object TableProgressiviCOPIESCARICOCANTIERE: TSmallintField
      FieldName = 'COPIESCARICOCANTIERE'
    end
    object TableProgressiviCOPIEESTRATTOCONTO: TSmallintField
      FieldName = 'COPIEESTRATTOCONTO'
    end
    object TableProgressiviASCIISTARTDOCBARCODE: TIntegerField
      FieldName = 'ASCIISTARTDOCBARCODE'
    end
    object TableProgressiviPSWD_FIDO: TStringField
      FieldName = 'PSWD_FIDO'
    end
    object TableProgressiviPROGARTPRECODICE: TStringField
      FieldName = 'PROGARTPRECODICE'
      Size = 5
    end
    object TableProgressiviRICERCAARTICOLOSURIGODOC: TStringField
      FieldName = 'RICERCAARTICOLOSURIGODOC'
      Size = 1
    end
    object TableProgressiviSTAMPABARCODEDOCUMENTI: TStringField
      FieldName = 'STAMPABARCODEDOCUMENTI'
      Size = 1
    end
    object TableProgressiviRICART_CODICEPRINC: TStringField
      FieldName = 'RICART_CODICEPRINC'
      Size = 1
    end
    object TableProgressiviRICART_CODICEFORN: TStringField
      FieldName = 'RICART_CODICEFORN'
      Size = 1
    end
    object TableProgressiviRICART_BARCODE: TStringField
      FieldName = 'RICART_BARCODE'
      Size = 1
    end
    object TableProgressiviRICART_CODAGG: TStringField
      FieldName = 'RICART_CODAGG'
      Size = 1
    end
    object TableProgressiviRICART_LISTFORN: TStringField
      FieldName = 'RICART_LISTFORN'
      Size = 1
    end
    object TableProgressiviRICDOC_PRATICA1: TStringField
      FieldName = 'RICDOC_PRATICA1'
      Size = 1
    end
    object TableProgressiviRICDOC_PRATICA2: TStringField
      FieldName = 'RICDOC_PRATICA2'
      Size = 1
    end
    object TableProgressiviRICDOC_PRATICA3: TStringField
      FieldName = 'RICDOC_PRATICA3'
      Size = 1
    end
    object TableProgressiviTIPO1: TStringField
      FieldName = 'TIPO1'
    end
    object TableProgressiviTIPO2: TStringField
      FieldName = 'TIPO2'
    end
    object TableProgressiviTIPO3: TStringField
      FieldName = 'TIPO3'
    end
    object TableProgressiviTIPO4: TStringField
      FieldName = 'TIPO4'
    end
    object TableProgressiviTIPO5: TStringField
      FieldName = 'TIPO5'
    end
    object TableProgressiviTIPO6: TStringField
      FieldName = 'TIPO6'
    end
    object TableProgressiviDEFAULTLABELPRINTERNAME: TStringField
      FieldName = 'DEFAULTLABELPRINTERNAME'
      Size = 30
    end
    object TableProgressiviDEFAULTLABELFILENAME: TStringField
      FieldName = 'DEFAULTLABELFILENAME'
      Size = 50
    end
    object TableProgressiviDEFAULTLABELOPERATOREFILENAME: TStringField
      FieldName = 'DEFAULTLABELOPERATOREFILENAME'
      Size = 50
    end
    object TableProgressiviCODICEOPERA_2: TStringField
      FieldName = 'CODICEOPERA_2'
      Size = 15
    end
    object TableProgressiviDESCRIZIONEOPERA_2: TStringField
      FieldName = 'DESCRIZIONEOPERA_2'
      Size = 45
    end
    object TableProgressiviPRZUNITOPERA1_2: TIBOFloatField
      FieldName = 'PRZUNITOPERA1_2'
      currency = True
    end
    object TableProgressiviCODICEOPERA_3: TStringField
      FieldName = 'CODICEOPERA_3'
      Size = 15
    end
    object TableProgressiviDESCRIZIONEOPERA_3: TStringField
      FieldName = 'DESCRIZIONEOPERA_3'
      Size = 45
    end
    object TableProgressiviPRZUNITOPERA1_3: TIBOFloatField
      FieldName = 'PRZUNITOPERA1_3'
      currency = True
    end
    object TableProgressiviCODICEOPERA_4: TStringField
      FieldName = 'CODICEOPERA_4'
      Size = 15
    end
    object TableProgressiviDESCRIZIONEOPERA_4: TStringField
      FieldName = 'DESCRIZIONEOPERA_4'
      Size = 45
    end
    object TableProgressiviPRZUNITOPERA1_4: TIBOFloatField
      FieldName = 'PRZUNITOPERA1_4'
      currency = True
    end
    object TableProgressiviCODICEOPERA_5: TStringField
      FieldName = 'CODICEOPERA_5'
      Size = 15
    end
    object TableProgressiviDESCRIZIONEOPERA_5: TStringField
      FieldName = 'DESCRIZIONEOPERA_5'
      Size = 45
    end
    object TableProgressiviPRZUNITOPERA1_5: TIBOFloatField
      FieldName = 'PRZUNITOPERA1_5'
      currency = True
    end
    object TableProgressiviSECONDIATTESAEMAIL: TIntegerField
      DefaultExpression = '6'
      FieldName = 'SECONDIATTESAEMAIL'
      OnGetText = TableProgressiviSECONDIATTESAEMAILGetText
    end
    object TableProgressiviQRYARTTUTTIMAG: TStringField
      FieldName = 'QRYARTTUTTIMAG'
      Size = 1
    end
    object TableProgressiviDOCGESTARTFORNSECONDARI: TStringField
      FieldName = 'DOCGESTARTFORNSECONDARI'
      Size = 1
    end
    object TableProgressiviDOCCOLONNAIMPEXP: TStringField
      FieldName = 'DOCCOLONNAIMPEXP'
      Size = 1
    end
    object TableProgressiviFILTRADOCPERALTRISOGGETTI: TStringField
      FieldName = 'FILTRADOCPERALTRISOGGETTI'
      Size = 1
    end
    object TableProgressiviFL_LOGO_INTESTAZIONE: TStringField
      FieldName = 'FL_LOGO_INTESTAZIONE'
      Size = 1
    end
    object TableProgressiviFL_TITOLO: TStringField
      FieldName = 'FL_TITOLO'
      Size = 1
    end
    object TableProgressiviFL_LABEL_APPUNTAMENTO: TStringField
      FieldName = 'FL_LABEL_APPUNTAMENTO'
      Size = 30
    end
    object TableProgressiviFL_LABEL_CHIAMATA: TStringField
      FieldName = 'FL_LABEL_CHIAMATA'
      Size = 30
    end
    object TableProgressiviFL_LABEL_CLIENTE: TStringField
      FieldName = 'FL_LABEL_CLIENTE'
      Size = 30
    end
    object TableProgressiviFL_LABEL_RICHIEDENTE: TStringField
      FieldName = 'FL_LABEL_RICHIEDENTE'
      Size = 30
    end
    object TableProgressiviFL_LABEL_LUOGO: TStringField
      FieldName = 'FL_LABEL_LUOGO'
      Size = 30
    end
    object TableProgressiviFL_LABEL_MOTIVO: TStringField
      FieldName = 'FL_LABEL_MOTIVO'
      Size = 30
    end
    object TableProgressiviFL_LABEL_NOTE: TStringField
      FieldName = 'FL_LABEL_NOTE'
      Size = 30
    end
    object TableProgressiviFL_DATI_PRESCRIZIONI: TStringField
      FieldName = 'FL_DATI_PRESCRIZIONI'
      Size = 1
    end
    object TableProgressiviFL_DATI_CHIAMATA: TStringField
      FieldName = 'FL_DATI_CHIAMATA'
      Size = 1
    end
    object TableProgressiviFL_DATI_APPUNTAMENTO: TStringField
      FieldName = 'FL_DATI_APPUNTAMENTO'
      Size = 1
    end
    object TableProgressiviFL_DATI_SOGGETTO: TStringField
      FieldName = 'FL_DATI_SOGGETTO'
      Size = 1
    end
    object TableProgressiviFL_DATI_SOGGETTO_NOTE: TStringField
      FieldName = 'FL_DATI_SOGGETTO_NOTE'
      Size = 1
    end
    object TableProgressiviFL_DATI_INTESTAZFATTURA: TStringField
      FieldName = 'FL_DATI_INTESTAZFATTURA'
      Size = 1
    end
    object TableProgressiviFL_DATI_IMPIANTO: TStringField
      FieldName = 'FL_DATI_IMPIANTO'
      Size = 1
    end
    object TableProgressiviFL_DATI_ABBONAMENTO: TStringField
      FieldName = 'FL_DATI_ABBONAMENTO'
      Size = 1
    end
    object TableProgressiviFL_DATI_IMMOBILE: TStringField
      FieldName = 'FL_DATI_IMMOBILE'
      Size = 1
    end
    object TableProgressiviFL_DATI_RESPIMP: TStringField
      FieldName = 'FL_DATI_RESPIMP'
      Size = 1
    end
    object TableProgressiviFL_DATI_PROP_UT_AMM: TStringField
      FieldName = 'FL_DATI_PROP_UT_AMM'
      Size = 1
    end
    object TableProgressiviFL_DATI_PROPRIETARIO: TStringField
      FieldName = 'FL_DATI_PROPRIETARIO'
      Size = 1
    end
    object TableProgressiviFL_DATI_UTENTE: TStringField
      FieldName = 'FL_DATI_UTENTE'
      Size = 1
    end
    object TableProgressiviFL_DATI_INSTALLATORE: TStringField
      FieldName = 'FL_DATI_INSTALLATORE'
      Size = 1
    end
    object TableProgressiviFL_DATI_IMPIANTO_NOTE: TStringField
      FieldName = 'FL_DATI_IMPIANTO_NOTE'
      Size = 1
    end
    object TableProgressiviFL_DATI_APPARECCHI: TStringField
      FieldName = 'FL_DATI_APPARECCHI'
      Size = 1
    end
    object TableProgressiviFL_DATI_APPARECCHI_SEPARATI: TStringField
      FieldName = 'FL_DATI_APPARECCHI_SEPARATI'
      Size = 1
    end
    object TableProgressiviFL_DATI_OP: TStringField
      FieldName = 'FL_DATI_OP'
      Size = 1
    end
    object TableProgressiviFL_DATI_OP_SOLODAFARE: TStringField
      FieldName = 'FL_DATI_OP_SOLODAFARE'
      Size = 1
    end
    object TableProgressiviFL_DATI_PRECEDENTI: TStringField
      FieldName = 'FL_DATI_PRECEDENTI'
      Size = 1
    end
    object TableProgressiviFL_DATI_NUMULTINTERV: TIntegerField
      FieldName = 'FL_DATI_NUMULTINTERV'
    end
    object TableProgressiviFL_DATI_RAPPINT: TStringField
      FieldName = 'FL_DATI_RAPPINT'
      Size = 1
    end
    object TableProgressiviFL_DATI_RAPPINT_NUMRIGHEDATAORA: TIntegerField
      FieldName = 'FL_DATI_RAPPINT_NUMRIGHEDATAORA'
    end
    object TableProgressiviFL_DATI_RAPPINT_ALTEZZARELAZINT: TIntegerField
      FieldName = 'FL_DATI_RAPPINT_ALTEZZARELAZINT'
    end
    object TableProgressiviFL_DATI_RAPPINT_STATO: TStringField
      FieldName = 'FL_DATI_RAPPINT_STATO'
      Size = 1
    end
    object TableProgressiviFL_DATI_MERCE: TStringField
      FieldName = 'FL_DATI_MERCE'
      Size = 1
    end
    object TableProgressiviFL_DATI_ALTRESPESE: TStringField
      FieldName = 'FL_DATI_ALTRESPESE'
      Size = 1
    end
    object TableProgressiviFL_DATI_FIRME: TStringField
      FieldName = 'FL_DATI_FIRME'
      Size = 1
    end
    object TableProgressiviFL_DATI_RICHIEDENTE: TStringField
      FieldName = 'FL_DATI_RICHIEDENTE'
      FixedChar = True
      Size = 1
    end
    object TableProgressiviFL_LOGO_PIEDE: TStringField
      FieldName = 'FL_LOGO_PIEDE'
      Size = 1
    end
    object TableProgressiviFL_COPIE: TIntegerField
      FieldName = 'FL_COPIE'
    end
    object TableProgressiviFL_MESSAGGIO: TMemoField
      FieldName = 'FL_MESSAGGIO'
      BlobType = ftMemo
      Size = 1000
    end
    object TableProgressiviFL_MESSAGGIO_ALTEZZA: TIntegerField
      FieldName = 'FL_MESSAGGIO_ALTEZZA'
    end
    object TableProgressiviDEFAULTALLEGATIFGPRINTERNAME: TStringField
      FieldName = 'DEFAULTALLEGATIFGPRINTERNAME'
      Size = 30
    end
    object TableProgressiviSCONTOLISTINO1: TIBOFloatField
      FieldName = 'SCONTOLISTINO1'
    end
    object TableProgressiviSCONTOLISTINO2: TIBOFloatField
      FieldName = 'SCONTOLISTINO2'
    end
    object TableProgressiviSCONTOLISTINO3: TIBOFloatField
      FieldName = 'SCONTOLISTINO3'
    end
    object TableProgressiviSCONTOLISTINO4: TIBOFloatField
      FieldName = 'SCONTOLISTINO4'
    end
    object TableProgressiviDEFAULTALLEGATIFGCOPIE: TSmallintField
      FieldName = 'DEFAULTALLEGATIFGCOPIE'
    end
    object TableProgressiviCOSTOUNITOPERA1: TIBOFloatField
      FieldName = 'COSTOUNITOPERA1'
      currency = True
    end
    object TableProgressiviCOSTOUNITOPERA1_2: TIBOFloatField
      FieldName = 'COSTOUNITOPERA1_2'
      currency = True
    end
    object TableProgressiviCOSTOUNITOPERA1_3: TIBOFloatField
      FieldName = 'COSTOUNITOPERA1_3'
      currency = True
    end
    object TableProgressiviCOSTOUNITOPERA1_4: TIBOFloatField
      FieldName = 'COSTOUNITOPERA1_4'
      currency = True
    end
    object TableProgressiviCOSTOUNITOPERA1_5: TIBOFloatField
      FieldName = 'COSTOUNITOPERA1_5'
      currency = True
    end
  end
  object SourceProgressivi: TDataSource
    AutoEdit = False
    DataSet = TableProgressivi
    Left = 280
    Top = 218
  end
  object TableDatiAzienda: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    OnCalcFields = TableDatiAziendaCalcFields
    TableName = 'DATIAZIE'
    Left = 59
    Top = 224
    object TableDatiAziendaRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Origin = 'DATIAZIE.RAGIONESOCIALE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object TableDatiAziendaSETTORE: TStringField
      FieldName = 'SETTORE'
      Origin = 'DATIAZIE.SETTORE'
      Size = 50
    end
    object TableDatiAziendaINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Origin = 'DATIAZIE.INDIRIZZO'
      Size = 50
    end
    object TableDatiAziendaPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Origin = 'DATIAZIE.PROVINCIA'
      Size = 3
    end
    object TableDatiAziendaTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Origin = 'DATIAZIE.TELEFONO'
      Size = 50
    end
    object TableDatiAziendaP_IVA: TStringField
      FieldName = 'P_IVA'
      Origin = 'DATIAZIE.P_IVA'
      Size = 11
    end
    object TableDatiAziendaCAP: TStringField
      FieldName = 'CAP'
      Origin = 'DATIAZIE.CAP'
      Size = 5
    end
    object TableDatiAziendaREGALBOARTIGIANIDI: TStringField
      FieldName = 'REGALBOARTIGIANIDI'
      Origin = 'DATIAZIE.REGALBOARTIGIANIDI'
      Size = 30
    end
    object TableDatiAziendaNUMREGALBOARTIGIANI: TStringField
      FieldName = 'NUMREGALBOARTIGIANI'
      Origin = 'DATIAZIE.NUMREGALBOARTIGIANI'
    end
    object TableDatiAziendaREGREGISTRODITTEDI: TStringField
      FieldName = 'REGREGISTRODITTEDI'
      Origin = 'DATIAZIE.REGREGISTRODITTEDI'
      Size = 30
    end
    object TableDatiAziendaNUMREGREGISTRODITTE: TStringField
      FieldName = 'NUMREGREGISTRODITTE'
      Origin = 'DATIAZIE.NUMREGREGISTRODITTE'
    end
    object TableDatiAziendaFAX: TStringField
      FieldName = 'FAX'
      Origin = 'DATIAZIE.FAX'
      Size = 50
    end
    object TableDatiAziendaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'DATIAZIE.EMAIL'
      Size = 50
    end
    object TableDatiAziendaNATOCITTA: TStringField
      FieldName = 'NATOCITTA'
      Origin = 'DATIAZIE.NATOCITTA'
      Size = 50
    end
    object TableDatiAziendaNATOPROV: TStringField
      FieldName = 'NATOPROV'
      Origin = 'DATIAZIE.NATOPROV'
      Size = 3
    end
    object TableDatiAziendaNATOIL: TDateTimeField
      FieldName = 'NATOIL'
      Origin = 'DATIAZIE.NATOIL'
      EditMask = '!99/99/\1\900;1;_'
    end
    object TableDatiAziendaRESIDENTECITTA: TStringField
      FieldName = 'RESIDENTECITTA'
      Origin = 'DATIAZIE.RESIDENTECITTA'
      Size = 50
    end
    object TableDatiAziendaRESIDENTEINDIRIZZO: TStringField
      FieldName = 'RESIDENTEINDIRIZZO'
      Origin = 'DATIAZIE.RESIDENTEINDIRIZZO'
      Size = 50
    end
    object TableDatiAziendaRESIDENTEPROV: TStringField
      FieldName = 'RESIDENTEPROV'
      Origin = 'DATIAZIE.RESIDENTEPROV'
      Size = 3
    end
    object TableDatiAziendaCITTA: TStringField
      FieldName = 'CITTA'
      Origin = 'DATIAZIE.CITTA'
      Size = 50
    end
    object TableDatiAziendaNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Origin = 'DATIAZIE.NUMCIVICO'
      Size = 10
    end
    object TableDatiAziendaRESIDENTENUMCIVICO: TStringField
      FieldName = 'RESIDENTENUMCIVICO'
      Origin = 'DATIAZIE.RESIDENTENUMCIVICO'
      Size = 10
    end
    object TableDatiAziendaRTNOME: TStringField
      FieldName = 'RTNOME'
      Origin = 'DATIAZIE.RTNOME'
      Size = 50
    end
    object TableDatiAziendaRTNATOCITTA: TStringField
      FieldName = 'RTNATOCITTA'
      Origin = 'DATIAZIE.RTNATOCITTA'
      Size = 50
    end
    object TableDatiAziendaRTNATOPROV: TStringField
      FieldName = 'RTNATOPROV'
      Origin = 'DATIAZIE.RTNATOPROV'
      Size = 3
    end
    object TableDatiAziendaRTNATOIL: TDateTimeField
      FieldName = 'RTNATOIL'
      Origin = 'DATIAZIE.RTNATOIL'
    end
    object TableDatiAziendaRTRESIDENTECITTA: TStringField
      FieldName = 'RTRESIDENTECITTA'
      Origin = 'DATIAZIE.RTRESIDENTECITTA'
      Size = 50
    end
    object TableDatiAziendaRTRESIDENTEINDIRIZZO: TStringField
      FieldName = 'RTRESIDENTEINDIRIZZO'
      Origin = 'DATIAZIE.RTRESIDENTEINDIRIZZO'
      Size = 50
    end
    object TableDatiAziendaRTRESIDENTENUMCIVICO: TStringField
      FieldName = 'RTRESIDENTENUMCIVICO'
      Origin = 'DATIAZIE.RTRESIDENTENUMCIVICO'
      Size = 10
    end
    object TableDatiAziendaRTRESIDENTEPROV: TStringField
      FieldName = 'RTRESIDENTEPROV'
      Origin = 'DATIAZIE.RTRESIDENTEPROV'
      Size = 3
    end
    object TableDatiAziendaCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Origin = 'DATIAZIE.CELLULARE'
      Size = 50
    end
    object TableDatiAziendaCA_PID: TStringField
      FieldName = 'CA_PID'
      Origin = 'DATIAZIE.CA_PID'
      Size = 25
    end
    object TableDatiAziendaCA_CODICEATTIVAZIONE: TStringField
      FieldName = 'CA_CODICEATTIVAZIONE'
      Origin = 'DATIAZIE.CA_CODICEATTIVAZIONE'
      Size = 50
    end
    object TableDatiAziendaRTQUALIFICA: TStringField
      FieldName = 'RTQUALIFICA'
      Origin = 'DATIAZIE.RTQUALIFICA'
      Size = 100
    end
    object TableDatiAziendaRTESTREMIISCRIZIONEALBO: TStringField
      FieldName = 'RTESTREMIISCRIZIONEALBO'
      Origin = 'DATIAZIE.RTESTREMIISCRIZIONEALBO'
      Size = 100
    end
    object TableDatiAziendaCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Origin = 'DATIAZIE.CODICEFISCALE'
      Size = 16
    end
    object TableDatiAziendaTITOLARENOME: TStringField
      FieldName = 'TITOLARENOME'
      Origin = 'DATIAZIE.TITOLARENOME'
      Size = 50
    end
    object TableDatiAziendaTITOLARECOGNOME: TStringField
      FieldName = 'TITOLARECOGNOME'
      Origin = 'DATIAZIE.TITOLARECOGNOME'
      Size = 50
    end
    object TableDatiAziendaNAZIONESIGLA: TStringField
      FieldName = 'NAZIONESIGLA'
      Origin = 'DATIAZIE.NAZIONESIGLA'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaTIPOPERSONA: TStringField
      FieldName = 'TIPOPERSONA'
      Origin = 'DATIAZIE.TIPOPERSONA'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaCOD_EORI: TStringField
      FieldName = 'COD_EORI'
      Origin = 'DATIAZIE.COD_EORI'
      Size = 17
    end
    object TableDatiAziendaREGIMEFISCALESIGLA: TStringField
      FieldName = 'REGIMEFISCALESIGLA'
      Origin = 'DATIAZIE.REGIMEFISCALESIGLA'
      FixedChar = True
      Size = 4
    end
    object TableDatiAziendaREA_UFFICIO: TStringField
      FieldName = 'REA_UFFICIO'
      Origin = 'DATIAZIE.REA_UFFICIO'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaREA_NUMERO: TStringField
      FieldName = 'REA_NUMERO'
      Origin = 'DATIAZIE.REA_NUMERO'
    end
    object TableDatiAziendaREA_CAPITALESOCIALE: TIBOFloatField
      FieldName = 'REA_CAPITALESOCIALE'
      Origin = 'DATIAZIE.REA_CAPITALESOCIALE'
    end
    object TableDatiAziendaREA_SOCIOUNICOSIGLA: TStringField
      FieldName = 'REA_SOCIOUNICOSIGLA'
      Origin = 'DATIAZIE.REA_SOCIOUNICOSIGLA'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaREA_STATOLIQUIDAZIONESIGLA: TStringField
      FieldName = 'REA_STATOLIQUIDAZIONESIGLA'
      Origin = 'DATIAZIE.REA_STATOLIQUIDAZIONESIGLA'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaDATITRASMIT_EMAIL: TStringField
      FieldName = 'DATITRASMIT_EMAIL'
      Origin = 'DATIAZIE.DATITRASMIT_EMAIL'
      Size = 256
    end
    object TableDatiAziendaDATITRASMIT_ENABLED: TStringField
      FieldName = 'DATITRASMIT_ENABLED'
      Origin = 'DATIAZIE.DATITRASMIT_ENABLED'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaDATITRASMIT_IDPAESE: TStringField
      FieldName = 'DATITRASMIT_IDPAESE'
      Origin = 'DATIAZIE.DATITRASMIT_IDPAESE'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaDATITRASMIT_IDCODICE: TStringField
      FieldName = 'DATITRASMIT_IDCODICE'
      Origin = 'DATIAZIE.DATITRASMIT_IDCODICE'
      Size = 28
    end
    object TableDatiAziendaDATITRASMIT_TELEFONO: TStringField
      FieldName = 'DATITRASMIT_TELEFONO'
      Origin = 'DATIAZIE.DATITRASMIT_TELEFONO'
      Size = 12
    end
    object TableDatiAziendaTERZOINT_ENABLED: TStringField
      FieldName = 'TERZOINT_ENABLED'
      Origin = 'DATIAZIE.TERZOINT_ENABLED'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaTERZOINT_IDPAESE: TStringField
      FieldName = 'TERZOINT_IDPAESE'
      Origin = 'DATIAZIE.TERZOINT_IDPAESE'
      FixedChar = True
      Size = 2
    end
    object TableDatiAziendaTERZOINT_IDCODICE: TStringField
      FieldName = 'TERZOINT_IDCODICE'
      Origin = 'DATIAZIE.TERZOINT_IDCODICE'
      Size = 28
    end
    object TableDatiAziendaTERZOINT_CODICEFISCALE: TStringField
      FieldName = 'TERZOINT_CODICEFISCALE'
      Origin = 'DATIAZIE.TERZOINT_CODICEFISCALE'
      Size = 16
    end
    object TableDatiAziendaTERZOINT_TIPOPERSONA: TStringField
      FieldName = 'TERZOINT_TIPOPERSONA'
      Origin = 'DATIAZIE.TERZOINT_TIPOPERSONA'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaTERZOINT_DENOMINAZIONE: TStringField
      FieldName = 'TERZOINT_DENOMINAZIONE'
      Origin = 'DATIAZIE.TERZOINT_DENOMINAZIONE'
      Size = 80
    end
    object TableDatiAziendaTERZOINT_NOME: TStringField
      FieldName = 'TERZOINT_NOME'
      Origin = 'DATIAZIE.TERZOINT_NOME'
      Size = 60
    end
    object TableDatiAziendaTERZOINT_COGNOME: TStringField
      FieldName = 'TERZOINT_COGNOME'
      Origin = 'DATIAZIE.TERZOINT_COGNOME'
      Size = 60
    end
    object TableDatiAziendaTERZOINT_TITOLO: TStringField
      FieldName = 'TERZOINT_TITOLO'
      Origin = 'DATIAZIE.TERZOINT_TITOLO'
      Size = 10
    end
    object TableDatiAziendaTERZOINT_CODEORI: TStringField
      FieldName = 'TERZOINT_CODEORI'
      Origin = 'DATIAZIE.TERZOINT_CODEORI'
      Size = 17
    end
    object TableDatiAziendaRTSETDEFAULTPROGETTOREDATTODA: TStringField
      FieldName = 'RTSETDEFAULTPROGETTOREDATTODA'
      Origin = 'DATIAZIE.RTSETDEFAULTPROGETTOREDATTODA'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaEXPORT_CODICEDITTA: TStringField
      FieldName = 'EXPORT_CODICEDITTA'
      Origin = 'DATIAZIE.EXPORT_CODICEDITTA'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOCLIENTI: TStringField
      FieldName = 'EXPORT_CONTOCLIENTI'
      Origin = 'DATIAZIE.EXPORT_CONTOCLIENTI'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOCASSA: TStringField
      FieldName = 'EXPORT_CONTOCASSA'
      Origin = 'DATIAZIE.EXPORT_CONTOCASSA'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTORICAVOCOSTO: TStringField
      FieldName = 'EXPORT_CONTORICAVOCOSTO'
      Origin = 'DATIAZIE.EXPORT_CONTORICAVOCOSTO'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTORICAVOCOSTORITACC: TStringField
      FieldName = 'EXPORT_CONTORICAVOCOSTORITACC'
      Origin = 'DATIAZIE.EXPORT_CONTORICAVOCOSTORITACC'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOSPESE: TStringField
      FieldName = 'EXPORT_CONTOSPESE'
      Origin = 'DATIAZIE.EXPORT_CONTOSPESE'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOBOLLO: TStringField
      FieldName = 'EXPORT_CONTOBOLLO'
      Origin = 'DATIAZIE.EXPORT_CONTOBOLLO'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOABBUONIATTIVI: TStringField
      FieldName = 'EXPORT_CONTOABBUONIATTIVI'
      Origin = 'DATIAZIE.EXPORT_CONTOABBUONIATTIVI'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CONTOABBUONIPASSIVI: TStringField
      FieldName = 'EXPORT_CONTOABBUONIPASSIVI'
      Origin = 'DATIAZIE.EXPORT_CONTOABBUONIPASSIVI'
      Size = 10
    end
    object TableDatiAziendaEXPORT_CODICECAUSALEPRIMANOTA: TStringField
      FieldName = 'EXPORT_CODICECAUSALEPRIMANOTA'
      Origin = 'DATIAZIE.EXPORT_CODICECAUSALEPRIMANOTA'
      Size = 10
    end
    object TableDatiAziendaEXPORT_DESCCAUSALEPRIMANOTA: TStringField
      FieldName = 'EXPORT_DESCCAUSALEPRIMANOTA'
      Origin = 'DATIAZIE.EXPORT_DESCCAUSALEPRIMANOTA'
      Size = 30
    end
    object TableDatiAziendaEXPORT_NONESPORTACI1SEZERO: TStringField
      FieldName = 'EXPORT_NONESPORTACI1SEZERO'
      Origin = 'DATIAZIE.EXPORT_NONESPORTACI1SEZERO'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaEXPORT_ULTIMAEXP: TDateTimeField
      FieldName = 'EXPORT_ULTIMAEXP'
      Origin = 'DATIAZIE.EXPORT_ULTIMAEXP'
    end
    object TableDatiAziendaEXPORT_ULTIMAEXP_DAL: TDateTimeField
      FieldName = 'EXPORT_ULTIMAEXP_DAL'
      Origin = 'DATIAZIE.EXPORT_ULTIMAEXP_DAL'
    end
    object TableDatiAziendaEXPORT_ULTIMAEXP_AL: TDateTimeField
      FieldName = 'EXPORT_ULTIMAEXP_AL'
      Origin = 'DATIAZIE.EXPORT_ULTIMAEXP_AL'
    end
    object TableDatiAziendaEXPORT_ULTIMAEXP_FATTURE: TStringField
      FieldName = 'EXPORT_ULTIMAEXP_FATTURE'
      Origin = 'DATIAZIE.EXPORT_ULTIMAEXP_FATTURE'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaEXPORT_ULTIMAEXP_PRIMANOTA: TStringField
      FieldName = 'EXPORT_ULTIMAEXP_PRIMANOTA'
      Origin = 'DATIAZIE.EXPORT_ULTIMAEXP_PRIMANOTA'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaEXPORT_EXPORTEDFILEPATH: TStringField
      FieldName = 'EXPORT_EXPORTEDFILEPATH'
      Origin = 'DATIAZIE.EXPORT_EXPORTEDFILEPATH'
      Size = 100
    end
    object TableDatiAziendaEXPORT_CONTOCLIENTIESTERO: TStringField
      FieldName = 'EXPORT_CONTOCLIENTIESTERO'
      Origin = 'DATIAZIE.EXPORT_CONTOCLIENTIESTERO'
      Size = 10
    end
    object TableDatiAziendaEXPORT_SOTTOCONTORICAVOCOSTO: TStringField
      FieldName = 'EXPORT_SOTTOCONTORICAVOCOSTO'
      Origin = 'DATIAZIE.EXPORT_SOTTOCONTORICAVOCOSTO'
      Size = 10
    end
    object TableDatiAziendaEXPORT_SOTTOCONTORICCOSTORITACC: TStringField
      FieldName = 'EXPORT_SOTTOCONTORICCOSTORITACC'
      Origin = 'DATIAZIE.EXPORT_SOTTOCONTORICCOSTORITACC'
      Size = 10
    end
    object TableDatiAziendaTITOLARECOGNOMENOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITOLARECOGNOMENOME'
      Size = 110
      Calculated = True
    end
    object TableDatiAziendaFE_ENABLED: TStringField
      FieldName = 'FE_ENABLED'
      Origin = 'DATIAZIE.FE_ENABLED'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaFE_PROVIDERID: TStringField
      FieldName = 'FE_PROVIDERID'
      Origin = 'DATIAZIE.FE_PROVIDERID'
      Size = 30
    end
    object TableDatiAziendaFE_USERNAME: TStringField
      FieldName = 'FE_USERNAME'
      Origin = 'DATIAZIE.FE_USERNAME'
      Size = 30
    end
    object TableDatiAziendaFE_PASSWORD: TStringField
      FieldName = 'FE_PASSWORD'
      Origin = 'DATIAZIE.FE_PASSWORD'
      Size = 30
    end
    object TableDatiAziendaFE_COMPANYID: TStringField
      FieldName = 'FE_COMPANYID'
      Origin = 'DATIAZIE.FE_COMPANYID'
      Size = 30
    end
    object TableDatiAziendaFE_ENABLESENDSALESINV: TStringField
      FieldName = 'FE_ENABLESENDSALESINV'
      Origin = 'DATIAZIE.FE_ENABLESENDSALESINV'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaFE_ENABLERECEIVESALESNOT: TStringField
      FieldName = 'FE_ENABLERECEIVESALESNOT'
      Origin = 'DATIAZIE.FE_ENABLERECEIVESALESNOT'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaFE_ENABLERECEIVEPURCHASEINV: TStringField
      FieldName = 'FE_ENABLERECEIVEPURCHASEINV'
      Origin = 'DATIAZIE.FE_ENABLERECEIVEPURCHASEINV'
      FixedChar = True
      Size = 1
    end
    object TableDatiAziendaFE_BASEURLWS: TStringField
      FieldName = 'FE_BASEURLWS'
      Origin = 'DATIAZIE.FE_BASEURLWS'
      Size = 250
    end
    object TableDatiAziendaFE_BASEURLAUTH: TStringField
      FieldName = 'FE_BASEURLAUTH'
      Origin = 'DATIAZIE.FE_BASEURLAUTH'
      Size = 250
    end
    object TableDatiAziendaFE_PURCHASEINVDAYSBEFORE: TIntegerField
      FieldName = 'FE_PURCHASEINVDAYSBEFORE'
      Origin = 'DATIAZIE.FE_PURCHASEINVDAYSBEFORE'
    end
    object TableDatiAziendaFE_CODICEDESTINATARIO: TStringField
      FieldName = 'FE_CODICEDESTINATARIO'
      Size = 7
    end
  end
  object SourceDatiAzienda: TDataSource
    AutoEdit = False
    DataSet = TableDatiAzienda
    Left = 88
    Top = 224
  end
  object TableTesti: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    TableName = 'TESTI'
    Left = 251
    Top = 112
    object TableTestiCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object TableTestiDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object TableTestiCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = TableTestiCLIENTEChange
    end
    object TableTestiPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object TableTestiNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object TableTestiARGOMENTO: TStringField
      FieldName = 'ARGOMENTO'
      Size = 60
    end
    object TableTestiPROVENIENZA: TStringField
      FieldName = 'PROVENIENZA'
      Size = 60
    end
    object TableTestiPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object TableTestiPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object TableTestiDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object TableTestiDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object TableTestiDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object TableTestiSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object TableTestiSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object TableTestiSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object TableTestiOGGETTO: TStringField
      FieldName = 'OGGETTO'
      Size = 60
    end
    object TableTestiRAGSOCCLI: TStringField
      FieldName = 'RAGSOCCLI'
      Size = 60
    end
    object TableTestiINDIRIZZOCLI: TStringField
      FieldName = 'INDIRIZZOCLI'
      Size = 40
    end
    object TableTestiNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      Size = 10
    end
    object TableTestiCITTACLI: TStringField
      FieldName = 'CITTACLI'
      Size = 25
    end
    object TableTestiCAPCLI: TStringField
      FieldName = 'CAPCLI'
      Size = 5
    end
    object TableTestiPROVINCIACLI: TStringField
      FieldName = 'PROVINCIACLI'
      Size = 2
    end
    object TableTestiDESCPRATICA1: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA1'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'PRATICA'
      Size = 60
      Lookup = True
    end
    object TableTestiDESCPRATICA2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA2'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'PRATICA2'
      Size = 60
      Lookup = True
    end
    object TableTestiDESCPRATICA3: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA3'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'DATAPRATICA3'
      Size = 60
      Lookup = True
    end
    object TableTestiTEXTFILE: TBlobField
      FieldName = 'TEXTFILE'
      Size = 8
    end
  end
  object SourceTesti: TDataSource
    AutoEdit = False
    DataSet = TableTesti
    Left = 280
    Top = 112
  end
  object OpenDialog1: TOpenDialog
    Ctl3D = False
    Left = 24
    Top = 501
  end
  object SaveDialog1: TSaveDialog
    Left = 752
    Top = 10
  end
  object TableContatti: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    TableName = 'CONTATTI'
    Left = 59
    Top = 168
    object TableContattiTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object TableContattiCodice: TIntegerField
      FieldName = 'Codice'
    end
    object TableContattiData: TDateField
      FieldName = 'Data'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableContattiCliente: TIntegerField
      FieldName = 'Cliente'
      OnChange = TableContattiClienteChange
    end
    object TableContattiOggetto: TStringField
      FieldName = 'Oggetto'
      Size = 60
    end
    object TableContattiParlatoDi: TMemoField
      FieldName = 'ParlatoDi'
      BlobType = ftMemo
      Size = 8
    end
    object TableContattiPratica: TIntegerField
      FieldName = 'Pratica'
    end
    object TableContattiPratica2: TIntegerField
      FieldName = 'Pratica2'
    end
    object TableContattiPratica3: TIntegerField
      FieldName = 'Pratica3'
    end
    object TableContattiNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object TableContattiArgomento: TStringField
      FieldName = 'Argomento'
      Size = 60
    end
    object TableContattiProvenienza: TStringField
      FieldName = 'Provenienza'
      Size = 60
    end
    object TableContattiDataPratica1: TDateField
      FieldName = 'DataPratica1'
    end
    object TableContattiDataPratica2: TDateField
      FieldName = 'DataPratica2'
    end
    object TableContattiDataPratica3: TDateField
      FieldName = 'DataPratica3'
    end
    object TableContattiDescPratica1: TStringField
      FieldKind = fkLookup
      FieldName = 'DescPratica1'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice;DataApertura'
      LookupResultField = 'Descrizione'
      KeyFields = 'Pratica;DataPratica1'
      Size = 60
      Lookup = True
    end
    object TableContattiDescPratica2: TStringField
      FieldKind = fkLookup
      FieldName = 'DescPratica2'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice;DataApertura'
      LookupResultField = 'Descrizione'
      KeyFields = 'Pratica2;DataPratica2'
      Size = 60
      Lookup = True
    end
    object TableContattiDescPratica3: TStringField
      FieldKind = fkLookup
      FieldName = 'DescPratica3'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice;DataApertura'
      LookupResultField = 'Descrizione'
      KeyFields = 'Pratica3;DataPratica3'
      Size = 60
      Lookup = True
    end
    object TableContattiStatoDescrizione: TStringField
      FieldName = 'StatoDescrizione'
      Size = 10
    end
    object TableContattiStatoForeground: TStringField
      FieldName = 'StatoForeground'
      Size = 10
    end
    object TableContattiStatoBackground: TStringField
      FieldName = 'StatoBackground'
      Size = 10
    end
    object TableContattiRagSocCli: TStringField
      FieldName = 'RagSocCli'
      Size = 60
    end
    object TableContattiIndirizzoCli: TStringField
      FieldName = 'IndirizzoCli'
      Size = 40
    end
    object TableContattiCittaCli: TStringField
      FieldName = 'CittaCli'
      Size = 25
    end
    object TableContattiNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      Size = 10
    end
    object TableContattiCAPCli: TStringField
      FieldName = 'CAPCli'
      Size = 5
    end
    object TableContattiProvinciaCli: TStringField
      FieldName = 'ProvinciaCli'
      Size = 3
    end
    object TableContattiMezzo: TStringField
      FieldName = 'Mezzo'
      Size = 10
    end
    object TableContattiPeriodicita: TSmallintField
      FieldName = 'Periodicita'
    end
    object TableContattiContattoSuccessivo: TIntegerField
      FieldName = 'ContattoSuccessivo'
    end
    object TableContattiContattoPrecedente: TIntegerField
      FieldName = 'ContattoPrecedente'
    end
    object TableContattiAnticipoAllarme: TSmallintField
      FieldName = 'AnticipoAllarme'
    end
    object TableContattiDataSuccessivo: TDateField
      FieldName = 'DataSuccessivo'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableContattiDataPrecedente: TDateField
      FieldName = 'DataPrecedente'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableContattiAllarme: TStringField
      FieldName = 'Allarme'
      Size = 1
    end
    object TableContattiORA: TStringField
      FieldName = 'ORA'
      Size = 8
    end
  end
  object SourceContatti: TDataSource
    AutoEdit = False
    DataSet = TableContatti
    Left = 88
    Top = 168
  end
  object TableConformita: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = TableConformitaBeforePost
    TableName = 'CONFORM'
    Left = 251
    Top = 329
    object TableConformitaCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object TableConformitaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = TableConformitaCLIENTEChange
    end
    object TableConformitaDATA: TDateTimeField
      FieldName = 'DATA'
      OnValidate = TableConformitaDATAValidate
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaNUOVOIMPIANTO: TStringField
      FieldName = 'NUOVOIMPIANTO'
      Size = 1
    end
    object TableConformitaTRASFORMAZIONE: TStringField
      FieldName = 'TRASFORMAZIONE'
      Size = 1
    end
    object TableConformitaAMPLIAMENTO: TStringField
      FieldName = 'AMPLIAMENTO'
      Size = 1
    end
    object TableConformitaMANUTSTRAORDINARIA: TStringField
      FieldName = 'MANUTSTRAORDINARIA'
      Size = 1
    end
    object TableConformitaALTRO: TStringField
      FieldName = 'ALTRO'
      Size = 1
    end
    object TableConformitaTXTALTRO: TStringField
      FieldName = 'TXTALTRO'
      Size = 100
    end
    object TableConformitaCOMMISSIONATODA: TStringField
      FieldName = 'COMMISSIONATODA'
      Size = 150
    end
    object TableConformitaNELCOMUNEDI: TStringField
      FieldName = 'NELCOMUNEDI'
      Size = 25
    end
    object TableConformitaPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object TableConformitaVIA: TStringField
      FieldName = 'VIA'
      Size = 40
    end
    object TableConformitaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object TableConformitaSCALA: TStringField
      FieldName = 'SCALA'
      Size = 10
    end
    object TableConformitaPIANO: TStringField
      FieldName = 'PIANO'
      Size = 30
    end
    object TableConformitaINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 60
    end
    object TableConformitaDIPROPRIETADI: TStringField
      FieldName = 'DIPROPRIETADI'
      Size = 150
    end
    object TableConformitaRISPETTATOPROGETTO: TStringField
      FieldName = 'RISPETTATOPROGETTO'
      Size = 1
    end
    object TableConformitaSEGUITONORMATECNICA: TStringField
      FieldName = 'SEGUITONORMATECNICA'
      Size = 1
    end
    object TableConformitaINSTALLATOCOMPONENTI: TStringField
      FieldName = 'INSTALLATOCOMPONENTI'
      Size = 1
    end
    object TableConformitaALLEGATOCOPIACERTIFICATO: TStringField
      FieldName = 'ALLEGATOCOPIACERTIFICATO'
      Size = 1
    end
    object TableConformitaCONTROLLATOIMPIANTO: TStringField
      FieldName = 'CONTROLLATOIMPIANTO'
      Size = 1
    end
    object TableConformitaALLEGATOPROGETTO: TStringField
      FieldName = 'ALLEGATOPROGETTO'
      Size = 1
    end
    object TableConformitaALLEGATORELAZIONE: TStringField
      FieldName = 'ALLEGATORELAZIONE'
      Size = 1
    end
    object TableConformitaALLEGATOSCHEMA: TStringField
      FieldName = 'ALLEGATOSCHEMA'
      Size = 1
    end
    object TableConformitaALLEGATORIFCONFORMITA: TStringField
      FieldName = 'ALLEGATORIFCONFORMITA'
      Size = 1
    end
    object TableConformitaNORMATECNICA: TStringField
      FieldName = 'NORMATECNICA'
      Size = 200
    end
    object TableConformitaALLEGATIFACOLTATIVI: TStringField
      FieldName = 'ALLEGATIFACOLTATIVI'
      Size = 250
    end
    object TableConformitaUSOINDUSTRIALE: TStringField
      FieldName = 'USOINDUSTRIALE'
      Size = 1
    end
    object TableConformitaUSOCIVILE: TStringField
      FieldName = 'USOCIVILE'
      Size = 1
    end
    object TableConformitaUSOCOMMERCIO: TStringField
      FieldName = 'USOCOMMERCIO'
      Size = 1
    end
    object TableConformitaALTRIUSI: TStringField
      FieldName = 'ALTRIUSI'
      Size = 1
    end
    object TableConformitaNOTE: TStringField
      FieldName = 'NOTE'
      Size = 60
    end
    object TableConformitaPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object TableConformitaPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object TableConformitaPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object TableConformitaDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaOGGETTO: TStringField
      FieldName = 'OGGETTO'
      Size = 100
    end
    object TableConformitaSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object TableConformitaSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object TableConformitaSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object TableConformitaILSOTTOSCRITTO: TStringField
      FieldName = 'ILSOTTOSCRITTO'
      Size = 50
    end
    object TableConformitaRAGSOCCLI: TStringField
      FieldName = 'RAGSOCCLI'
      Size = 60
    end
    object TableConformitaINDIRIZZOCLI: TStringField
      FieldName = 'INDIRIZZOCLI'
      Size = 40
    end
    object TableConformitaCITTACLI: TStringField
      FieldName = 'CITTACLI'
      Size = 25
    end
    object TableConformitaCAPCLI: TStringField
      FieldName = 'CAPCLI'
      Size = 5
    end
    object TableConformitaPROVINCIACLI: TStringField
      FieldName = 'PROVINCIACLI'
      Size = 3
    end
    object TableConformitaMATIDONEIAMBIENT: TStringField
      FieldName = 'MATIDONEIAMBIENT'
      Size = 1
    end
    object TableConformitaCOMPIMPESISTENTE: TStringField
      FieldName = 'COMPIMPESISTENTE'
      Size = 1
    end
    object TableConformitaRISPONDENTENORME: TStringField
      FieldName = 'RISPONDENTENORME'
      Size = 1
    end
    object TableConformitaCONFORMEART7: TStringField
      FieldName = 'CONFORMEART7'
      Size = 1
    end
    object TableConformitaALLEGATI: TStringField
      FieldName = 'ALLEGATI'
      Size = 1
    end
    object TableConformitaNATOCITTA: TStringField
      FieldName = 'NATOCITTA'
      Size = 50
    end
    object TableConformitaNATOPROV: TStringField
      FieldName = 'NATOPROV'
      Size = 3
    end
    object TableConformitaNATOIL: TDateTimeField
      FieldName = 'NATOIL'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaRESIDENTECITTA: TStringField
      FieldName = 'RESIDENTECITTA'
      Size = 50
    end
    object TableConformitaRESIDENTEINDIRIZZO: TStringField
      FieldName = 'RESIDENTEINDIRIZZO'
      Size = 50
    end
    object TableConformitaRESIDENTEPROV: TStringField
      FieldName = 'RESIDENTEPROV'
      Size = 3
    end
    object TableConformitaPRIMACCCODICESOGG: TIntegerField
      FieldName = 'PRIMACCCODICESOGG'
      OnChange = TableConformitaPrimAccCodiceSoggChange
    end
    object TableConformitaPRIMACCNUMCALDAIE: TSmallintField
      FieldName = 'PRIMACCNUMCALDAIE'
    end
    object TableConformitaPRIMACCDATA: TDateTimeField
      FieldName = 'PRIMACCDATA'
      EditMask = '!99/99/\2\000;1;_'
    end
    object TableConformitaDESCPRATICA1: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA1'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'PRATICA'
      Size = 60
      Lookup = True
    end
    object TableConformitaDESCPRATICA2: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA2'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'PRATICA2'
      Size = 60
      Lookup = True
    end
    object TableConformitaDESCPRATICA3: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCPRATICA3'
      LookupDataSet = TablePratiche
      LookupKeyFields = 'Codice'
      LookupResultField = 'Descrizione'
      KeyFields = 'PRATICA3'
      Size = 60
      Lookup = True
    end
    object TableConformitaRIFDOCUMFISCALE: TStringField
      FieldName = 'RIFDOCUMFISCALE'
      Size = 5000
    end
    object TableConformitaPRIMACCDATICALDAIA: TBlobField
      FieldName = 'PRIMACCDATICALDAIA'
      BlobType = ftMemo
      Size = 8
    end
    object TableConformitaFOGLIO: TStringField
      FieldName = 'FOGLIO'
      Size = 10
    end
    object TableConformitaPARTICELLA: TStringField
      FieldName = 'PARTICELLA'
      Size = 25
    end
    object TableConformitaSUB: TStringField
      FieldName = 'SUB'
      Size = 50
    end
    object TableConformitaS1QAPROGIMPGAS: TStringField
      FieldName = 'S1QAPROGIMPGAS'
      Size = 1
    end
    object TableConformitaS1QAPROGIMPGASRIF: TStringField
      FieldName = 'S1QAPROGIMPGASRIF'
      Size = 100
    end
    object TableConformitaS1QAPROGCAMINO: TStringField
      FieldName = 'S1QAPROGCAMINO'
      Size = 1
    end
    object TableConformitaS1QAPROGCAMINORIF: TStringField
      FieldName = 'S1QAPROGCAMINORIF'
      Size = 100
    end
    object TableConformitaS1QAPROGPREVINC: TStringField
      FieldName = 'S1QAPROGPREVINC'
      Size = 1
    end
    object TableConformitaS1QAPROGPREVINCRIF: TStringField
      FieldName = 'S1QAPROGPREVINCRIF'
      Size = 100
    end
    object TableConformitaS1QBDICHGASPREC: TStringField
      FieldName = 'S1QBDICHGASPREC'
      Size = 1
    end
    object TableConformitaS1QBDICHGASPRECNUM: TStringField
      FieldName = 'S1QBDICHGASPRECNUM'
      Size = 10
    end
    object TableConformitaS1QBDICHGASPRECDATA: TDateTimeField
      FieldName = 'S1QBDICHGASPRECDATA'
    end
    object TableConformitaS1QBDICHGASPRECDITTA: TStringField
      FieldName = 'S1QBDICHGASPRECDITTA'
      Size = 30
    end
    object TableConformitaS1QBDICCAMINOPREC: TStringField
      FieldName = 'S1QBDICCAMINOPREC'
      Size = 1
    end
    object TableConformitaS1QBDICCAMINOPRECNUM: TStringField
      FieldName = 'S1QBDICCAMINOPRECNUM'
      Size = 10
    end
    object TableConformitaS1QBDICCAMINOPRECDATA: TDateTimeField
      FieldName = 'S1QBDICCAMINOPRECDATA'
    end
    object TableConformitaS1QBDICCAMINOPRECDITTA: TStringField
      FieldName = 'S1QBDICCAMINOPRECDITTA'
      Size = 30
    end
    object TableConformitaS1QCPROGIMPINTGAS: TStringField
      FieldName = 'S1QCPROGIMPINTGAS'
      Size = 1
    end
    object TableConformitaS1QCPROGIMPINTGASRIF: TStringField
      FieldName = 'S1QCPROGIMPINTGASRIF'
      Size = 30
    end
    object TableConformitaS1QCCPI: TStringField
      FieldName = 'S1QCCPI'
      Size = 1
    end
    object TableConformitaS1QCCPIRIF: TStringField
      FieldName = 'S1QCCPIRIF'
      Size = 30
    end
    object TableConformitaS1QCRELTEC: TStringField
      FieldName = 'S1QCRELTEC'
      Size = 1
    end
    object TableConformitaS1QCRELTECRIF: TStringField
      FieldName = 'S1QCRELTECRIF'
      Size = 30
    end
    object TableConformitaS1QCALL2: TStringField
      FieldName = 'S1QCALL2'
      Size = 1
    end
    object TableConformitaS1QCALL2RIF: TStringField
      FieldName = 'S1QCALL2RIF'
      Size = 30
    end
    object TableConformitaS2QAQN: TIBOFloatField
      FieldName = 'S2QAQN'
    end
    object TableConformitaS2QANUOVOIMPGAS: TStringField
      FieldName = 'S2QANUOVOIMPGAS'
      Size = 1
    end
    object TableConformitaS2QAMODIMPESIST: TStringField
      FieldName = 'S2QAMODIMPESIST'
      Size = 1
    end
    object TableConformitaS2QAINSTAPPGAS: TStringField
      FieldName = 'S2QAINSTAPPGAS'
      Size = 1
    end
    object TableConformitaS2QAINSTTRATTOTUBO: TStringField
      FieldName = 'S2QAINSTTRATTOTUBO'
      Size = 1
    end
    object TableConformitaS2QAINSTPZSPEC: TStringField
      FieldName = 'S2QAINSTPZSPEC'
      Size = 1
    end
    object TableConformitaS2QACOLLEGAPPCANNAFUM: TStringField
      FieldName = 'S2QACOLLEGAPPCANNAFUM'
      Size = 1
    end
    object TableConformitaS2QAREALAPVENT: TStringField
      FieldName = 'S2QAREALAPVENT'
      Size = 1
    end
    object TableConformitaS2QAREALAPAERAZ: TStringField
      FieldName = 'S2QAREALAPAERAZ'
      Size = 1
    end
    object TableConformitaS2QACAMINOSINGOLO: TStringField
      FieldName = 'S2QACAMINOSINGOLO'
      Size = 1
    end
    object TableConformitaS2QACANNACOLLETTIVA: TStringField
      FieldName = 'S2QACANNACOLLETTIVA'
      Size = 1
    end
    object TableConformitaS2QACANNACOLLRAMIF: TStringField
      FieldName = 'S2QACANNACOLLRAMIF'
      Size = 1
    end
    object TableConformitaS2QAALTRO: TStringField
      FieldName = 'S2QAALTRO'
      Size = 1
    end
    object TableConformitaS2QAALTRODESC: TStringField
      FieldName = 'S2QAALTRODESC'
      Size = 30
    end
    object TableConformitaS2QBAPPCOLLKW: TStringField
      FieldName = 'S2QBAPPCOLLKW'
      Size = 1
    end
    object TableConformitaS2QBAPPCOLLKWTOT: TIBOFloatField
      FieldName = 'S2QBAPPCOLLKWTOT'
      OnChange = TableConformitaS2QBAPPCOLLKWTOTChange
    end
    object TableConformitaS2QBSOLOPRED: TStringField
      FieldName = 'S2QBSOLOPRED'
      Size = 1
    end
    object TableConformitaS2QBSOLOPREDKWTOT: TIBOFloatField
      FieldName = 'S2QBSOLOPREDKWTOT'
      OnChange = TableConformitaS2QBAPPCOLLKWTOTChange
    end
    object TableConformitaS2QBCOLLEGAMENTODI: TStringField
      FieldName = 'S2QBCOLLEGAMENTODI'
      Size = 1
    end
    object TableConformitaS2QBCOLLEGAMENTODIDESC: TStringField
      FieldName = 'S2QBCOLLEGAMENTODIDESC'
      Size = 30
    end
    object TableConformitaS2QBSOSTITUZIONEDI: TStringField
      FieldName = 'S2QBSOSTITUZIONEDI'
      Size = 1
    end
    object TableConformitaS2QBSOSTITUZIONEDIDESC: TStringField
      FieldName = 'S2QBSOSTITUZIONEDIDESC'
      Size = 30
    end
    object TableConformitaS2QBADEGNORMA: TStringField
      FieldName = 'S2QBADEGNORMA'
      Size = 1
    end
    object TableConformitaS2QBADEGNORMADESC: TStringField
      FieldName = 'S2QBADEGNORMADESC'
      Size = 10
    end
    object TableConformitaS2QBALTRO: TStringField
      FieldName = 'S2QBALTRO'
      Size = 1
    end
    object TableConformitaS2QBALTRODESC: TStringField
      FieldName = 'S2QBALTRODESC'
      Size = 30
    end
    object TableConformitaS2QCESECCONFPROG: TStringField
      FieldName = 'S2QCESECCONFPROG'
      Size = 1
    end
    object TableConformitaS2QCESECCURAINST: TStringField
      FieldName = 'S2QCESECCURAINST'
      Size = 1
    end
    object TableConformitaS3QAAPPCE: TStringField
      FieldName = 'S3QAAPPCE'
      Size = 1
    end
    object TableConformitaS3QAAPVENTEFF1: TStringField
      FieldName = 'S3QAAPVENTEFF1'
      Size = 1
    end
    object TableConformitaS3QAAPVENTEFF1CM: TIBOFloatField
      FieldName = 'S3QAAPVENTEFF1CM'
    end
    object TableConformitaS3QAAPVENTEFF1NOTA: TStringField
      FieldName = 'S3QAAPVENTEFF1NOTA'
      Size = 60
    end
    object TableConformitaS3QAAPVENTEFF2: TStringField
      FieldName = 'S3QAAPVENTEFF2'
      Size = 1
    end
    object TableConformitaS3QAAPVENTEFF2CM: TIBOFloatField
      FieldName = 'S3QAAPVENTEFF2CM'
    end
    object TableConformitaS3QAAPVENTEFF2NOTA: TStringField
      FieldName = 'S3QAAPVENTEFF2NOTA'
      Size = 60
    end
    object TableConformitaS3QACONTMANCFIAMMA: TStringField
      FieldName = 'S3QACONTMANCFIAMMA'
      Size = 1
    end
    object TableConformitaS3QBUNI: TStringField
      FieldName = 'S3QBUNI'
      Size = 1
    end
    object TableConformitaS3QBUNIDESC: TStringField
      FieldName = 'S3QBUNIDESC'
      Size = 30
    end
    object TableConformitaS3QBDM120496: TStringField
      FieldName = 'S3QBDM120496'
      Size = 1
    end
    object TableConformitaS3QBALTRO: TStringField
      FieldName = 'S3QBALTRO'
      Size = 1
    end
    object TableConformitaS3QBALTRODESC: TStringField
      FieldName = 'S3QBALTRODESC'
      Size = 30
    end
    object TableConformitaS3QBNOTE: TStringField
      FieldName = 'S3QBNOTE'
      Size = 60
    end
    object TableConformitaS4TENUTATUBGAS: TStringField
      FieldName = 'S4TENUTATUBGAS'
      Size = 1
    end
    object TableConformitaS4TENUTATUBGASA: TStringField
      FieldName = 'S4TENUTATUBGASA'
    end
    object TableConformitaS4TENUTACAMINO: TStringField
      FieldName = 'S4TENUTACAMINO'
      Size = 1
    end
    object TableConformitaS4TENUTACAMINOA: TStringField
      FieldName = 'S4TENUTACAMINOA'
    end
    object TableConformitaS4NOTE: TStringField
      FieldName = 'S4NOTE'
      Size = 60
    end
    object TableConformitaS4ALLOBBDATA: TDateTimeField
      FieldName = 'S4ALLOBBDATA'
    end
    object TableConformitaS2QBBGIMAGE: TBlobField
      FieldName = 'S2QBBGIMAGE'
      Size = 8
    end
    object TableConformitaRIFMODEL_CODICE: TIntegerField
      FieldName = 'RIFMODEL_CODICE'
    end
    object TableConformitaDESCMODELLO: TStringField
      FieldName = 'DESCMODELLO'
      Size = 100
    end
    object TableConformitaDESCIMPIANTO: TBlobField
      FieldName = 'DESCIMPIANTO'
      Size = 8
    end
    object TableConformitaSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object TableConformitaS4NOTETENUTACAMINO: TStringField
      FieldName = 'S4NOTETENUTACAMINO'
      Size = 60
    end
    object TableConformitaS3QACONTMANCFIAMMANOTA: TStringField
      FieldName = 'S3QACONTMANCFIAMMANOTA'
      Size = 60
    end
    object TableConformitaS1QADICHCONFMODB: TStringField
      FieldName = 'S1QADICHCONFMODB'
      Size = 1
    end
    object TableConformitaS1QADICHCONFMODD: TStringField
      FieldName = 'S1QADICHCONFMODD'
      Size = 1
    end
    object TableConformitaCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object TableConformitaCOMMITCODICE: TIntegerField
      FieldName = 'COMMITCODICE'
      OnChange = TableConformitaCOMMITCODICEChange
    end
    object TableConformitaCOMMITDENOMINAZIONE: TStringField
      FieldName = 'COMMITDENOMINAZIONE'
      Size = 60
    end
    object TableConformitaCOMMITINDIRIZZO: TStringField
      FieldName = 'COMMITINDIRIZZO'
      Size = 40
    end
    object TableConformitaCOMMITNUMCIVICO: TStringField
      FieldName = 'COMMITNUMCIVICO'
      Size = 10
    end
    object TableConformitaCOMMITSCALA: TStringField
      FieldName = 'COMMITSCALA'
      Size = 10
    end
    object TableConformitaCOMMITPIANO: TStringField
      FieldName = 'COMMITPIANO'
      Size = 5
    end
    object TableConformitaCOMMITINTERNO: TStringField
      FieldName = 'COMMITINTERNO'
      Size = 7
    end
    object TableConformitaCOMMITCAP: TStringField
      FieldName = 'COMMITCAP'
      Size = 5
    end
    object TableConformitaCOMMITLOCALITA: TStringField
      FieldName = 'COMMITLOCALITA'
      Size = 25
    end
    object TableConformitaCOMMITPROVINCIA: TStringField
      FieldName = 'COMMITPROVINCIA'
      Size = 3
    end
    object TableConformitaCOMMITTELEFONO: TStringField
      FieldName = 'COMMITTELEFONO'
      Size = 30
    end
    object TableConformitaCOMMITPIVA: TStringField
      FieldName = 'COMMITPIVA'
      Size = 16
    end
    object TableConformitaCOMMITCODICEFISCALE: TStringField
      FieldName = 'COMMITCODICEFISCALE'
      Size = 16
    end
    object TableConformitaPROPCODICE: TIntegerField
      FieldName = 'PROPCODICE'
      OnChange = TableConformitaPROPCODICEChange
    end
    object TableConformitaPROPDENOMINAZIONE: TStringField
      FieldName = 'PROPDENOMINAZIONE'
      Size = 60
    end
    object TableConformitaPROPINDIRIZZO: TStringField
      FieldName = 'PROPINDIRIZZO'
      Size = 40
    end
    object TableConformitaPROPNUMCIVICO: TStringField
      FieldName = 'PROPNUMCIVICO'
      Size = 10
    end
    object TableConformitaPROPSCALA: TStringField
      FieldName = 'PROPSCALA'
      Size = 10
    end
    object TableConformitaPROPPIANO: TStringField
      FieldName = 'PROPPIANO'
      Size = 5
    end
    object TableConformitaPROPINTERNO: TStringField
      FieldName = 'PROPINTERNO'
      Size = 7
    end
    object TableConformitaPROPCAP: TStringField
      FieldName = 'PROPCAP'
      Size = 5
    end
    object TableConformitaPROPLOCALITA: TStringField
      FieldName = 'PROPLOCALITA'
      Size = 25
    end
    object TableConformitaPROPPROVINCIA: TStringField
      FieldName = 'PROPPROVINCIA'
      Size = 3
    end
    object TableConformitaPROPTELEFONO: TStringField
      FieldName = 'PROPTELEFONO'
      Size = 30
    end
    object TableConformitaPROPPIVA: TStringField
      FieldName = 'PROPPIVA'
      Size = 16
    end
    object TableConformitaPROPCODICEFISCALE: TStringField
      FieldName = 'PROPCODICEFISCALE'
      Size = 16
    end
    object TableConformitaIMMOBCODICE: TIntegerField
      FieldName = 'IMMOBCODICE'
      OnChange = TableConformitaIMMOBCODICEChange
    end
    object TableConformitaIMPIANTOINSERVIZIO: TStringField
      FieldName = 'IMPIANTOINSERVIZIO'
      Size = 1
    end
    object TableConformitaSOSTITUZAPPARECCHIOINSTALLATO: TStringField
      FieldName = 'SOSTITUZAPPARECCHIOINSTALLATO'
      Size = 1
    end
    object TableConformitaSOCGASCODICE: TIntegerField
      FieldName = 'SOCGASCODICE'
    end
    object TableConformitaNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      Size = 10
    end
    object TableConformitaCODFORNGAS: TStringField
      FieldName = 'CODFORNGAS'
      Size = 40
    end
    object TableConformitaRESPTECNICO: TStringField
      FieldName = 'RESPTECNICO'
      Size = 50
    end
    object TableConformitaCOMMITALLEGOBBLIG: TStringField
      FieldName = 'COMMITALLEGOBBLIG'
      OnChange = TableConformitaCOMMITALLEGOBBLIGChange
      Size = 60
    end
    object TableConformitaNOTERELTIPMAT: TMemoField
      FieldName = 'NOTERELTIPMAT'
      BlobType = ftMemo
    end
    object TableConformitaPROGETTOREDATTODA: TStringField
      FieldName = 'PROGETTOREDATTODA'
      Size = 200
    end
    object TableConformitaTERMOTIPMAT_UNI: TStringField
      FieldName = 'TERMOTIPMAT_UNI'
      Size = 1
    end
    object TableConformitaTERMOTIPMAT_UNIDESC: TStringField
      FieldName = 'TERMOTIPMAT_UNIDESC'
      Size = 30
    end
    object TableConformitaTERMOTIPMAT_ALTRO: TStringField
      FieldName = 'TERMOTIPMAT_ALTRO'
      Size = 1
    end
    object TableConformitaTERMOTIPMAT_ALTRODESC: TStringField
      FieldName = 'TERMOTIPMAT_ALTRODESC'
      Size = 30
    end
    object TableConformitaIDROTIPMAT_UNI: TStringField
      FieldName = 'IDROTIPMAT_UNI'
      Size = 1
    end
    object TableConformitaIDROTIPMAT_UNIDESC: TStringField
      FieldName = 'IDROTIPMAT_UNIDESC'
      Size = 30
    end
    object TableConformitaIDROTIPMAT_ALTRO: TStringField
      FieldName = 'IDROTIPMAT_ALTRO'
      Size = 1
    end
    object TableConformitaIDROTIPMAT_ALTRODESC: TStringField
      FieldName = 'IDROTIPMAT_ALTRODESC'
      Size = 30
    end
    object TableConformitaTERMOTIPAPP_CE: TStringField
      FieldName = 'TERMOTIPAPP_CE'
      Size = 1
    end
    object TableConformitaIDROTIPAPP_CE: TStringField
      FieldName = 'IDROTIPAPP_CE'
      Size = 1
    end
    object TableConformitaALLEGATOATTMATNONORM: TStringField
      FieldName = 'ALLEGATOATTMATNONORM'
      Size = 1
    end
    object TableConformitaTERMOBACKGIMAGE: TBlobField
      FieldName = 'TERMOBACKGIMAGE'
      Size = 8
    end
    object TableConformitaIDROBACKGIMAGE: TBlobField
      FieldName = 'IDROBACKGIMAGE'
      Size = 8
    end
    object TableConformitaCOMPLETAMENTEREALIZZATODITTA: TStringField
      FieldName = 'COMPLETAMENTEREALIZZATODITTA'
      FixedChar = True
      Size = 1
    end
    object TableConformitaPRESENTITUTTEDICHCONFALTREDITTE: TStringField
      FieldName = 'PRESENTITUTTEDICHCONFALTREDITTE'
      FixedChar = True
      Size = 1
    end
    object TableConformitaNORMAVERIFICATENUTA: TStringField
      FieldName = 'NORMAVERIFICATENUTA'
      Size = 80
    end
    object TableConformitaRAPPTECNICOCOMPATIBILITA11CIG: TStringField
      FieldName = 'RAPPTECNICOCOMPATIBILITA11CIG'
      FixedChar = True
      Size = 1
    end
    object TableConformitaDICHPROGETTISTAPREVENZINCENDI: TStringField
      FieldName = 'DICHPROGETTISTAPREVENZINCENDI'
      FixedChar = True
      Size = 1
    end
  end
  object SourceConformita: TDataSource
    AutoEdit = False
    DataSet = TableConformita
    Left = 280
    Top = 329
  end
  object TimerSmartKey: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerSmartKeyTimer
    Left = 102
    Top = 12
  end
  object TableStatiDocumenti: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = TableStatiDocumentiBeforePost
    TableName = 'STATI'
    Left = 251
    Top = 160
    object TableStatiDocumentiDescrizione: TStringField
      FieldName = 'Descrizione'
      Size = 10
    end
    object TableStatiDocumentiTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
    end
    object TableStatiDocumentiForeground: TStringField
      FieldName = 'Foreground'
      Size = 10
    end
    object TableStatiDocumentiBackground: TStringField
      FieldName = 'Background'
      Size = 10
    end
    object TableStatiDocumentiNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object TableStatiDocumentiSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
  end
  object SourceStatiDocumenti: TDataSource
    AutoEdit = False
    DataSet = TableStatiDocumenti
    Left = 280
    Top = 160
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 160
    Top = 506
  end
  object DBAzienda: TIBODatabase
    CacheStatementHandles = False
    LoginPrompt = True
    SQLDialect = 1
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PATH=c:\delphi\projects\levante\prova\prova.gdb'
      'CHARACTER SET=ISO8859_1'
      'FORCED WRITES=TRUE'
      'SQL DIALECT=1')
    AfterConnect = DBAziendaAfterConnect
    BeforeDisconnect = DBAziendaBeforeDisconnect
    OnError = DBGeneraleError
    Isolation = tiCommitted
    DriverName = ''
    Left = 392
    Top = 56
    SavedPassword = '.JuMbLe.01.5A22462E0E2D'
  end
  object DBGenerale: TIBODatabase
    AliasName = 'FE_TIPODOCUMENTO'
    CacheStatementHandles = False
    LoginPrompt = True
    SQLDialect = 1
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PATH=c:\delphi\projects\levante\levgen.gdb'
      'CHARACTER SET=ISO8859_1'
      'FORCED WRITES=TRUE'
      'SQL DIALECT=1')
    AfterConnect = DBGeneraleAfterConnect
    OnError = DBGeneraleError
    Isolation = tiCommitted
    DriverName = ''
    Left = 392
    Top = 8
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object QueryDocSel: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    IB_Transaction = TransDocSel
    PessimisticLocking = True
    RecordCountAccurate = True
    Left = 59
    Top = 112
  end
  object SourceQueryDocSel: TDataSource
    AutoEdit = False
    DataSet = QueryDocSel
    Left = 88
    Top = 112
  end
  object IB_SessionProps1: TIB_SessionProps
    AllowDefaultConnection = True
    AllowDefaultTransaction = True
    BusyCursor = -17
    CheckForReservedTokens = False
    StoreActive = False
    TimerInterval = 5000
    UseCursor = False
    YieldCursor = -19
    EditingColor = clYellow
    InsertingColor = clLime
    DeletingColor = clRed
    SearchingColor = clAqua
    ReadOnlyColor = clSilver
    SelectedColor = clNavy
    InvalidColor = clNone
    PreparedColor = clGrayText
    BrowsingColor = clSilver
    Left = 392
    Top = 112
  end
  object GridsStyleRepository: TcxStyleRepository
    Left = 521
    Top = 64
    PixelsPerInch = 96
    object tvGridHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 33023
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clBlack
    end
    object tvGrayContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15132390
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvSelected: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16762594
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16037544
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clBlack
    end
    object tvGridGroupRow: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16507099
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvContentEvenModifica: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14286847
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object tvContentOddModifica: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 9830399
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object tvBackgroundModifica: TcxStyle
      AssignedValues = [svColor]
      Color = 15794175
    end
    object TabsBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 16250871
    end
    object Tab: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8388863
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clBlack
    end
    object tvDisBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object tvDisContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = 12698049
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11711154
    end
    object tvDisHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13882323
      Font.Charset = ANSI_CHARSET
      Font.Color = 15329769
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clWhite
    end
    object cvEnBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 16772332
    end
    object cvEnContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7864319
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 15420
    end
    object cvEnContentBold: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15329769
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
    end
    object cvEnContentRed: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16250871
      Font.Charset = ANSI_CHARSET
      Font.Color = 223
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 223
    end
    object cvDisBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 15461355
    end
    object cvDisContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = 12698049
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 12698049
    end
    object cvDisContentBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = 12698049
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = 12698049
    end
    object cvDisContentRed: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = 12698049
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 12698049
    end
    object PrintBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object PrintContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object PrintContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15987699
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object PrintGridHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16768991
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clBlue
    end
    object PrintGroup: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16768991
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvAnotherContent1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12049407
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 9803157
    end
    object tvAnotherContent1Bold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12706047
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object AgDateCalendarContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14544639
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object AgDateCalendarHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 2856447
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object tvGroupFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12698049
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clBlack
    end
    object tvAnotherContent2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15266815
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvGCDetailContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14348796
      Font.Charset = ANSI_CHARSET
      Font.Color = 1219034
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 1219034
    end
    object tvGCDetailFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14348796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1219034
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 1219034
    end
    object tvGCDetailGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10345207
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1219034
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 1219034
    end
    object tvGCDetailColumnHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14348796
      Font.Charset = ANSI_CHARSET
      Font.Color = 1219034
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 1219034
    end
    object tvGCDetailSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16752591
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvGCDetailBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14348796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1219034
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 1219034
    end
    object tvStampaGCBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvStampaGCGridHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16768991
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clBlue
    end
    object tvStampaGCGroup: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16768991
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvStampaGCContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clBlack
    end
    object tvStampaGCFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvStampaGCDetBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16250871
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object tvStampaGCDetGridHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clGray
    end
    object tvStampaGCDetGroup: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clGray
    end
    object tvStampaGCDetContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16250871
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object tvStampaGCDetFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16250871
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clGray
    end
    object tvInfoUtiliBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16119285
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object tvInfoUtiliContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16119285
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object tvInfoUtiliHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14079702
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 7500402
    end
    object tvInfoUtiliContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object AgContentImpianto: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11184895
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object AgContentNoImpianto: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10354687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object AgContentGenerico: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15461355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object tvGCDetailContent_Costo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12189695
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clOlive
    end
    object tvGCDetailHeader_Costo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 57311
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clOlive
    end
    object tvGCDetailContent_Qta: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14671871
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clMaroon
    end
    object tvGCDetailHeader_Qta: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6711039
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object tvGCDetailContent_Ricarico: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14024661
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clGreen
    end
    object tvGCDetailHeader_Ricarico: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 55040
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = 25600
    end
    object tvGCDetailContent_Vendita: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769505
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = clNavy
    end
    object tvGCDetailHeader_Vendita: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16750487
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object tvGCDetailContent_DatiDoc: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clGray
    end
    object tvGCDetailHeader_DatiDoc: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13750737
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clGray
    end
    object tvGCDetailContent_Costo_Bold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12189695
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clOlive
    end
    object tvGCDetailContent_Ricarico_Bold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14024661
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object tvGCDetailContent_Vendita_Bold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769505
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object tvGroupSummary: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16037544
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object tvGridFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      TextColor = clGray
    end
    object tvArtDetail_Selection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16756952
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_Background: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_Content: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_Footer: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_Group: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_GroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16756952
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvArtDetail_Header: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16769520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object cvEnCardBorder: TcxStyle
      AssignedValues = [svColor]
      Color = 52428
    end
    object cvEnCardCaptionRow: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3145727
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 15420
    end
    object cvEnCardCategoryRow: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3145727
      TextColor = 15420
    end
    object cvEnCardCategorySeparator: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10354687
      TextColor = 15420
    end
    object cvEnCardRowCapdion: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3145727
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 15420
    end
    object cvEnCardSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7864319
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      TextColor = 15420
    end
    object cvEnCardProtocollo: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12320767
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Terminal'
      Font.Style = [fsBold]
      TextColor = 38293
    end
    object tvArtDetail_ContentHighlight: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766442
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = 11731033
    end
    object tvGridBandHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 33023
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = 14965
    end
    object tvStampaGCGridBandHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15724527
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsItalic]
      TextColor = clGray
    end
    object tvGCDetailContent_Qta_Bold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14671871
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object MasterTableViewStyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = tvBackground
      Styles.Content = tvContent
      Styles.ContentEven = tvContentEven
      Styles.ContentOdd = tvContentOdd
      Styles.Footer = tvBackground
      Styles.Group = tvGridGroupRow
      Styles.GroupByBox = tvGroupByBox
      Styles.Header = tvGridHeader
      Styles.Selection = tvSelected
      BuiltIn = True
    end
    object tvDisableStyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = tvDisBackground
      Styles.Content = tvDisContent
      Styles.Header = tvDisHeader
      BuiltIn = True
    end
    object cvEnabledStyleSheet: TcxGridCardViewStyleSheet
      Styles.Background = cvEnBackground
      Styles.Content = cvEnContent
      Styles.CaptionRow = cvEnCardCaptionRow
      Styles.CardBorder = cvEnCardBorder
      Styles.CategoryRow = cvEnCardCategoryRow
      Styles.CategorySeparator = cvEnCardCategorySeparator
      Styles.RowCaption = cvEnCardRowCapdion
      Styles.Selection = cvEnCardProtocollo
      BuiltIn = True
    end
    object cvDisabledStyleSheet: TcxGridCardViewStyleSheet
      Styles.Background = cvDisBackground
      Styles.Content = cvDisContent
      BuiltIn = True
    end
    object PrintStyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = PrintBackground
      Styles.ContentEven = PrintContentEven
      Styles.ContentOdd = PrintContentOdd
      Styles.Footer = PrintBackground
      Styles.Group = PrintGroup
      Styles.Header = PrintGridHeader
      BuiltIn = True
    end
    object tvAnotherStyleSheet: TcxGridTableViewStyleSheet
      Styles.Content = tvAnotherContent1
      BuiltIn = True
    end
    object tvGCDetail: TcxGridTableViewStyleSheet
      Styles.Background = tvGCDetailBackground
      Styles.Content = tvGCDetailContent
      Styles.Footer = tvGCDetailFooter
      Styles.Group = tvGCDetailGroupByBox
      Styles.GroupByBox = tvGCDetailGroupByBox
      Styles.Header = tvGCDetailColumnHeader
      Styles.Selection = tvGCDetailSelection
      BuiltIn = True
    end
    object tvGCMaster: TcxGridTableViewStyleSheet
      Styles.Background = tvBackground
      Styles.Content = tvContent
      Styles.Footer = tvBackground
      Styles.Group = tvGridGroupRow
      Styles.GroupByBox = tvGroupByBox
      Styles.Header = tvGridHeader
      Styles.Selection = tvSelected
      BuiltIn = True
    end
    object tvStampaGC: TcxGridTableViewStyleSheet
      Styles.Background = tvStampaGCBackground
      Styles.Content = tvStampaGCContent
      Styles.Footer = tvStampaGCFooter
      Styles.Group = tvStampaGCGroup
      Styles.GroupByBox = tvStampaGCGroup
      Styles.Header = tvStampaGCGridHeader
      BuiltIn = True
    end
    object tvStampaGCDet: TcxGridTableViewStyleSheet
      Styles.Background = tvStampaGCDetBackground
      Styles.Content = tvStampaGCDetContent
      Styles.Footer = tvStampaGCDetFooter
      Styles.Group = tvStampaGCDetGroup
      Styles.GroupByBox = tvStampaGCDetGroup
      Styles.Header = tvStampaGCDetGridHeader
      BuiltIn = True
    end
    object tvInfoUtili: TcxGridTableViewStyleSheet
      Styles.Background = tvInfoUtiliBackground
      Styles.Content = tvInfoUtiliContent
      Styles.ContentEven = tvInfoUtiliContent
      Styles.ContentOdd = tvInfoUtiliContentEven
      Styles.Header = tvInfoUtiliHeader
      BuiltIn = True
    end
    object tvArtDetail: TcxGridTableViewStyleSheet
      Styles.Background = tvArtDetail_Background
      Styles.Content = tvArtDetail_Content
      Styles.Footer = tvArtDetail_Footer
      Styles.Group = tvArtDetail_Group
      Styles.GroupByBox = tvArtDetail_GroupByBox
      Styles.Header = tvArtDetail_Header
      Styles.Selection = tvArtDetail_Selection
      BuiltIn = True
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnShowHint = ApplicationEvents1ShowHint
    Left = 392
    Top = 296
  end
  object cxEditRepository1: TcxEditRepository
    Left = 520
    Top = 248
    PixelsPerInch = 96
    object EdPropQtaOpera: TcxEditRepositoryMaskItem
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '!90:00;1;_'
      Properties.MaxLength = 0
      Properties.OnValidate = EdPropQtaOperaPropertiesValidate
    end
    object EdPropQtaOld: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taCenter
    end
    object EdPropQta: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taCenter
      Properties.DecimalPlaces = 6
      Properties.DisplayFormat = '0.######;-0.######'
    end
    object EdPropFilterDateEdit: TcxEditRepositoryDateItem
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
    end
    object EdPropPARegimeFiscale: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPARegimeFiscalePropertiesInitPopup
    end
    object EdPropPASocioUnico: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPASocioUnicoPropertiesInitPopup
    end
    object EdPropPAStatoLiquidazione: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPAStatoLiquidazionePropertiesInitPopup
    end
    object EdPropPANaturaIVA: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 800
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPANaturaIVAPropertiesInitPopup
    end
    object EdPropPACondizioniPagamento: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPACondizioniPagamentoPropertiesInitPopup
    end
    object EdPropPAModalitaPagamento: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPAModalitaPagamentoPropertiesInitPopup
    end
    object EdPropPARitAccCausalePag: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPARitAccCausalePagPropertiesInitPopup
    end
    object EdPropCodiceIVA: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'CODICEIVA'
      Properties.ListColumns = <
        item
          Caption = 'Codice'
          HeaderAlignment = taCenter
          Width = 40
          FieldName = 'CODICEIVA'
        end
        item
          Caption = 'Descrizione'
          Width = 250
          FieldName = 'DESCRIZIONEIVA'
        end
        item
          Caption = 'Natura (fattura elettronica PA)'
          Width = 210
          FieldName = 'PA_NATURA'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = SourceAliquoteIVA
    end
    object EdPropPAEsigibilitaIVA: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPAEsigibilitaIVAPropertiesInitPopup
    end
    object EdPropPATipoDocumento: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownRows = 20
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 600
      Properties.KeyFieldNames = 'VALORE'
      Properties.ListColumns = <
        item
          FieldName = 'VALORE_DESCRIZIONE'
        end>
      Properties.OnInitPopup = EdPropPATipoDocumentoPropertiesInitPopup
    end
    object EdPropDocRowType: TcxEditRepositoryComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        ''
        'Bene significat_'
        'Bene non significat_'
        'Non calcolare_'
        'TC_Rigo_'
        'TC_Totale')
    end
    object EdPropCheckBox: TcxEditRepositoryCheckBoxItem
      Properties.Alignment = taCenter
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
    end
    object EdPropImporto: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
    end
    object EdPropMarginePerc: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taCenter
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = '0.%;-0.%'
    end
    object EdPropImportoMicroPrz: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
    end
    object EdPropResponseTypeFE: TcxEditRepositoryImageComboBoxItem
      Properties.Images = ImagesFE
      Properties.ImmediateDropDownWhenKeyPressed = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Sconosciuto'
          Value = 'rtUnknown'
        end
        item
          Description = 'Pronta per l'#39'invio (XML generato)'
          ImageIndex = 1
          Value = 'rtReadyToSend'
        end
        item
          Description = 'Errore del servizio'
          ImageIndex = 0
          Value = 'rtException'
        end
        item
          Description = 'Inviata al provider'
          ImageIndex = 2
          Value = 'rtAcceptedByProvider'
        end
        item
          Description = 'Scartata dal provider'
          ImageIndex = 4
          Value = 'rtRejectedByProvider'
        end
        item
          Description = 'Ricevuta di consegna (SDI)'
          ImageIndex = 3
          Value = 'rtSDIMessageRC'
        end
        item
          Description = 'Ricevuta di consegna PA (SDI)'
          ImageIndex = 7
          Value = 'rtSDIMessageRC_PA'
        end
        item
          Description = 'Notifica di scarto (SDI)'
          ImageIndex = 4
          Value = 'rtSDIMessageNS'
        end
        item
          Description = 'Notifica di mancata consegna (SDI)'
          ImageIndex = 5
          Value = 'rtSDIMessageMC'
        end
        item
          Description = 'Notifica di mancata consegna PA (SDI)'
          ImageIndex = 6
          Value = 'rtSDIMessageMC_PA'
        end
        item
          Description = 'Notifica esito fattura accettata (SDI)'
          ImageIndex = 3
          Value = 'rtSDIMessageNEAccepted'
        end
        item
          Description = 'Notifica esito fattura rifiutata (SDI)'
          ImageIndex = 4
          Value = 'rtSDIMessageNERejected'
        end
        item
          Description = 'Notifica di metadati (SDI)'
          ImageIndex = 12
          Value = 'rtSDIMessageMT'
        end
        item
          Description = 'Notifica di esito cessionario/committente (SDI)'
          ImageIndex = 9
          Value = 'rtSDIMessageEC'
        end
        item
          Description = 'Notifica di scarto esito cessionario/committende (SDI)'
          ImageIndex = 10
          Value = 'rtSDIMessageSE'
        end
        item
          Description = 'Notifica decorrenza termini (SDI)'
          ImageIndex = 3
          Value = 'rtSDIMessageDT'
        end
        item
          Description = 'Attestaz. avvenuta trasm.ne con imp.t'#224' recapito (SDI)'
          ImageIndex = 5
          Value = 'rtSDIMessageAT'
        end
        item
          Description = 'Ricevuto dal provider'
          ImageIndex = 8
          Value = 'rtReceivedFromProvider'
        end>
      Properties.ReadOnly = True
      Properties.ShowDescriptions = False
    end
    object EdPropTimingIndexFE: TcxEditRepositoryImageComboBoxItem
      Properties.Images = ImageFETiming
      Properties.ImmediateDropDownWhenKeyPressed = False
      Properties.Items = <
        item
          Value = 0
        end
        item
          Description = 'Warning'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Alarm'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'Disaster'
          ImageIndex = 3
          Value = 3
        end>
      Properties.ReadOnly = True
      Properties.ShowDescriptions = False
    end
  end
  object ImgListStatiDoc: TImageList
    Width = 10
    Left = 360
    Top = 464
    Bitmap = {
      494C01010A000C0004000A001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000028000000300000000100200000000000001E
      00000000000000000000000000000000000000000000CEC6BD00A5A59C008484
      7B006B6B6B006B6B6B00848484008C8C8C009C9C9C00EFEFEF0000000000CEC6
      BD00A5A59C0084847B006B6B6B006B6B6B00848484008C8C8C009C9C9C00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00CECEB500F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00C6C6BD00A5A5A5009494940094949400C67B7B00CECE
      B500F7F7EF00F7F7EF00F7F7EF00F7F7EF00C6C6BD00A5A5A500949494009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEBD00F7F7EF007B7B
      7B00BDBDBD00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00D6CE
      BD00F7F7EF007B7B7B00BDBDBD00F7F7EF00FFFFF700FFFFFF00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00DECEC600F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00DECE
      C600F7F7EF00F7F7EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00DECEBD00F7F7EF007B7B
      7B007B7B7B007B7B7B007B7B7B00BDBDBD00FFFFFF0073737300C67B7B00DECE
      BD00F7F7EF007B7B7B007B7B7B004242BD003939C600A5A5C600FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEBD00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00D6CE
      BD00F7F7EF00F7F7EF00EFEFEF002121FF001818FF00ADADFF00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6D6BD00F7F7EF007B7B
      7B007B7B7B007B7B7B007B7B7B00BDBDBD00FFFFFF0073737300C67B7B00D6D6
      BD00F7F7EF007B7B7B006B6B94000808F7000808F7006B6BDE00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEBD00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00D6CE
      BD00F7F7EF00F7F7EF008484F7001818FF001818FF007373FF00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEBD00F7F7EF007B7B
      7B007B7B7B007B7B7B00BDBDBD00FFFFFF00FFFFFF0073737300C67B7B00D6CE
      BD00F7F7EF00737384002929D6001010EF001818F7005A5AFF00FFFFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEC600F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00D6CE
      C600F7F7EF00A5A5F7003131FF004A4AFF003131FF004242FF00EFEFFF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00D6CEBD00F7F7EF00F7F7
      EF00F7F7EF00F7F7EF00FFFFF700FFFFFF00FFFFFF0073737300C67B7B00D6CE
      BD00EFEFEF005252F7003131FF009494F7004A4AFF003131FF00B5B5FF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B7B00E7C6C600426B8400F7F7
      EF00426B8400F7F7EF00FFFFF700426B8400FFFFFF0073737300C67B7B00E7C6
      C6002942B5002929FF001018DE00E7E7EF007B7BFF000810E7008484FF007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CECE00C67B7B00C67B7B00316B
      940094ADBD006B7B8C006B94AD00BDB5BD005A849C00A5A5A500E7CECE00C67B
      7B003921D6000810EF005A6BD6006B7B8C00526BBD002929F7001829E7009C9C
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF004A9CBD004ABDD600316B
      94003984A5004ABDD6004ABDD6006B6B84005A849C00D6D6D600EFEFEF004A9C
      BD002152EF001029CE00397BAD004ABDD6004AB5D6002121DE001010EF008484
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEE7EF00D6E7E700B5CEDE00E7EFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEE7EF00D6E7E7007384EF002929FF004A52
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6EFFF006B73FF00737B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0000000000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0000000000089C3900089C3900109C420010A54200BDEF
      DE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00089C390010A5420018A542006BC68C00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00D6EFFF00DEF7FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF0018A5420018A54A0021A5520073C69400EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF007BA5
      D60000429C00427BC600EFEFEF00EFEFEF00EFEFEF00EFEFEF00089C3900089C
      3900109C420010A54200BDEFDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00B5BDF700BDCEF700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF0021A54A0042B56B0031AD5A0031AD5A0084D6
      A500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00739C
      CE000042AD00185ABD00EFEFEF00EFEFEF00EFEFEF00EFEFEF00089C390010A5
      420018A542006BC68C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00D6EFFF00BDCEFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00D6F7F700D6F7F70063C68C0042B563004AB5
      6B00B5E7D600EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00ADCE
      EF00004AB500004ABD00D6F7FF00EFEFEF00EFEFEF00EFEFEF0018A5420018A5
      4A0021A5520073C69400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00A5ADF700BDCEFF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D6EFFF00DEF7FF00EFEFEF00EFEFEF008CD6AD0052B5
      73006BC68C00DEF7F700EFEFEF00EFEFEF00D6EFF700739CD60073A5D6007BAD
      DE00004ABD00004AC6007BB5EF00ADD6F700ADD6F700B5DEFF0021A54A0042B5
      6B0031AD5A0031AD5A0084D6A500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00D6EFFF006B6BF700949CFF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5BDF700BDCEF700EFEFEF00EFEFEF00EFEFEF00B5E7
      CE0063BD8400A5DEC600EFEFEF00EFEFEF00B5DEEF000042AD00004AB500004A
      BD000052CE000052D6000052DE00005AE700005AEF000063F700D6F7F700D6F7
      F70063C68C0042B563004AB56B00B5E7D600EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0094A5FF005252F7008494FF00D6F7FF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D6EFFF00BDCEFF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00B5E7D6007BC69C00DEFFF700EFEFEF00EFEFEF00C6E7F700ADCEEF00ADD6
      EF005294E7000052DE00186BE70073ADF70073ADFF007BBDFF00EFEFEF00EFEF
      EF00EFEFEF008CD6AD0052B573006BC68C00DEF7F700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D6F7FF005252FF004242FF005A63FF00CEE7FF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00A5ADF700BDCEFF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00BDE7D600B5E7CE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00B5DEF700005AE700005AEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5E7CE0063BD8400A5DEC600EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00ADC6FF003939FF003131FF003139FF009CAD
      FF001010FF00EFEFEF00EFEFEF00D6EFFF006B6BF700949CFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00C6EFDE00CEF7EF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF001873F7000063F700ADD6FF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00B5E7D6007BC69C00DEFFF700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009CADFF002121FF002121FF001818
      FF000808FF00EFEFEF00EFEFEF00EFEFEF0094A5FF005252F7008494FF00D6F7
      FF00EFEFEF00EFEFEF00EFEFEF00C6E7DE00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0073ADFF000063FF0073B5FF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00BDE7D600B5E7CE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6EFFF003131FF001010FF000808
      FF000000FF00EFEFEF00EFEFEF00EFEFEF00D6F7FF005252FF004242FF005A63
      FF00CEE7FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C6EFDE00CEF7EF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0094A5FF000808FF000000FF000000
      FF000000FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00ADC6FF003939FF003131
      FF003139FF009CADFF001010FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C6E7DE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009CADFF002121
      FF002121FF001818FF000808FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6EFFF003131
      FF001010FF000808FF000000FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0094A5FF000808
      FF000000FF000000FF000000FF00EFEFEF0000000000EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0000000000EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0000000000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00949484004A29080073634A00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF009C9484005A311000846B4A00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00B5E7E700ADDE
      DE00C6EFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00A59C8C006B3910008C734A00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008CC6C600087B7B00007B7B000084
      8400008C8C00189C9C00B5EFEF00EFEFEF00D6E7E700CEDEDE00C6DEDE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00AD9C8C007342180094735200EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF008CC6C60000737300007B7B001894940031A5
      A500089C9C00009C9C0008A5A500B5EFEF00848484007B7B7B00737373006B6B
      6B00636363005A5A5A00525252004A4A4A009CADAD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00ADA58C0084521800A57B5200EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF0018848400007B7B0031A5A500EFEFEF00EFEF
      EF00D6F7F70008A5A50000ADAD0052CECE00BDCECE00ADB5BD009CADAD00848C
      8C007B848400737B7B00737373006B737300ADBDBD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0031735200639C7B0073AD8C0073B5940073BD9400EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00B5AD8C00945A1800AD845200EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5E7E700007B7B00008484009CDEDE00EFEFEF00EFEF
      EF00EFEFEF0063CECE0000B5B50008BDBD00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0000521800005A2100006B2100007B290000842900ADE7CE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDAD8C00A5632100B58C5A00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00ADDEDE0000848400008C8C00ADE7E700EFEFEF00EFEF
      EF00EFEFEF0073D6D60000B5B50000BDBD00ADBDBD00636363005A5A5A006363
      63006B7373006B6B6B00636B6B005A636300636B6B00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00ADD6C60073B58C0073BD940073BD940073C69400D6F7EF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00C6B58C00B56B2100C6945A00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5E7E700008C8C00009494009CDEDE00EFEFEF00EFEF
      EF00EFEFEF0063D6D60000BDBD0008CECE00C6D6D6007B848400737B7B005252
      52004242420039393900313131002121210029292900EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00D6DEC600CEB59400D6CEAD00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF0018A5A500009C9C0031BDBD00EFEFEF00EFEF
      EF00D6F7FF0008C6C60000C6C60042DEDE00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEDEC600D6BD9400DECEAD00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF008CDEDE0000A5A50000ADAD0018BDBD0031CE
      CE0008C6C60000C6C60008D6D600B5F7F700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00DEBD9400DE842900E7A56300EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008CDEDE0008B5B50000BDBD0000C6
      C60000CECE0018D6D600B5F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7DECE00E7C69400E7D6AD00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00B5F7F700ADEF
      EF00C6F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00424D3E000000000000003E000000
      2800000028000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0080200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080200802000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080200802000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object QryLabArt: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'CODICEUTENTE'
        ParamType = ptInput
      end>
    IB_Connection = DBAzienda
    RecordCountAccurate = True
    Unidirectional = True
    SQL.Strings = (
      'SELECT * FROM LABART')
    Left = 123
    Top = 344
    object QryLabArtCODICESTAZIONE: TStringField
      FieldName = 'CODICESTAZIONE'
      Required = True
      Size = 4
    end
    object QryLabArtPROGRIGO: TIntegerField
      FieldName = 'PROGRIGO'
      Required = True
    end
    object QryLabArtCODICEARTICOLO: TStringField
      FieldName = 'CODICEARTICOLO'
      Size = 25
    end
    object QryLabArtDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 45
    end
    object QryLabArtDESCRIZIONE2: TStringField
      FieldName = 'DESCRIZIONE2'
      Size = 45
    end
    object QryLabArtDESCRIZIONE3: TStringField
      FieldName = 'DESCRIZIONE3'
      Size = 45
    end
    object QryLabArtDESCRIZIONE4: TStringField
      FieldName = 'DESCRIZIONE4'
      Size = 45
    end
    object QryLabArtDESCRIZIONE5: TStringField
      FieldName = 'DESCRIZIONE5'
      Size = 45
    end
    object QryLabArtUNITADIMISURA: TStringField
      FieldName = 'UNITADIMISURA'
      Size = 2
    end
    object QryLabArtPREZZODIVENDITA: TIBOFloatField
      FieldName = 'PREZZODIVENDITA'
      currency = True
    end
    object QryLabArtPREZZODIVENDITA2: TIBOFloatField
      FieldName = 'PREZZODIVENDITA2'
      currency = True
    end
    object QryLabArtPREZZODIVENDITA3: TIBOFloatField
      FieldName = 'PREZZODIVENDITA3'
      currency = True
    end
    object QryLabArtPREZZODIVENDITA4: TIBOFloatField
      FieldName = 'PREZZODIVENDITA4'
      currency = True
    end
    object QryLabArtPRZVENDIVACOMP1: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP1'
      currency = True
    end
    object QryLabArtPRZVENDIVACOMP2: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP2'
      currency = True
    end
    object QryLabArtPRZVENDIVACOMP3: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP3'
      currency = True
    end
    object QryLabArtPRZVENDIVACOMP4: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP4'
      currency = True
    end
    object QryLabArtBARCODE: TStringField
      FieldName = 'BARCODE'
    end
    object QryLabArtMARCA: TStringField
      FieldName = 'MARCA'
    end
    object QryLabArtTIPODOCUMENTO: TStringField
      FieldName = 'TIPODOCUMENTO'
      Size = 25
    end
    object QryLabArtREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 5
    end
    object QryLabArtNUMORDPREV: TIntegerField
      FieldName = 'NUMORDPREV'
    end
    object QryLabArtDATADOCUMENTO: TDateTimeField
      FieldName = 'DATADOCUMENTO'
    end
    object QryLabArtCODICECLIENTE: TIntegerField
      FieldName = 'CODICECLIENTE'
    end
    object QryLabArtJOLLY1: TStringField
      FieldName = 'JOLLY1'
      Size = 100
    end
    object QryLabArtJOLLY2: TStringField
      FieldName = 'JOLLY2'
      Size = 100
    end
    object QryLabArtJOLLY3: TStringField
      FieldName = 'JOLLY3'
      Size = 100
    end
    object QryLabArtJOLLY4: TStringField
      FieldName = 'JOLLY4'
      Size = 100
    end
    object QryLabArtJOLLY5: TStringField
      FieldName = 'JOLLY5'
      Size = 100
    end
    object QryLabArtJOLLY6: TStringField
      FieldName = 'JOLLY6'
      Size = 100
    end
    object QryLabArtJOLLY7: TStringField
      FieldName = 'JOLLY7'
      Size = 100
    end
    object QryLabArtJOLLY8: TStringField
      FieldName = 'JOLLY8'
      Size = 100
    end
    object QryLabArtJOLLY9: TStringField
      FieldName = 'JOLLY9'
      Size = 100
    end
    object QryLabArtJOLLY10: TStringField
      FieldName = 'JOLLY10'
      Size = 100
    end
    object QryLabArtCODICEFORNITORE: TStringField
      FieldName = 'CODICEFORNITORE'
      Size = 25
    end
    object QryLabArtDESCRIZIONEFORNITORE: TStringField
      FieldName = 'DESCRIZIONEFORNITORE'
      Size = 45
    end
  end
  object QryLabSogg: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'CODICEUTENTE'
        ParamType = ptInput
      end>
    IB_Connection = DBAzienda
    RecordCountAccurate = True
    Unidirectional = True
    SQL.Strings = (
      'SELECT * FROM LABSOGG')
    Left = 123
    Top = 392
    object QryLabSoggCODICESTAZIONE: TStringField
      FieldName = 'CODICESTAZIONE'
      Required = True
      Size = 4
    end
    object QryLabSoggPROGRIGO: TIntegerField
      FieldName = 'PROGRIGO'
      Required = True
    end
    object QryLabSoggCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object QryLabSoggRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QryLabSoggINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 40
    end
    object QryLabSoggNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QryLabSoggCITTA: TStringField
      FieldName = 'CITTA'
      Size = 25
    end
    object QryLabSoggCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object QryLabSoggPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object QryLabSoggJOLLY1: TStringField
      FieldName = 'JOLLY1'
      Size = 100
    end
    object QryLabSoggJOLLY2: TStringField
      FieldName = 'JOLLY2'
      Size = 100
    end
    object QryLabSoggJOLLY3: TStringField
      FieldName = 'JOLLY3'
      Size = 100
    end
    object QryLabSoggJOLLY4: TStringField
      FieldName = 'JOLLY4'
      Size = 100
    end
    object QryLabSoggJOLLY5: TStringField
      FieldName = 'JOLLY5'
      Size = 100
    end
    object QryLabSoggJOLLY6: TStringField
      FieldName = 'JOLLY6'
      Size = 100
    end
    object QryLabSoggJOLLY7: TStringField
      FieldName = 'JOLLY7'
      Size = 100
    end
    object QryLabSoggJOLLY8: TStringField
      FieldName = 'JOLLY8'
      Size = 100
    end
    object QryLabSoggJOLLY9: TStringField
      FieldName = 'JOLLY9'
      Size = 100
    end
    object QryLabSoggJOLLY10: TStringField
      FieldName = 'JOLLY10'
      Size = 100
    end
  end
  object WizardStyleController: TcxEditStyleController
    Style.BorderStyle = ebsSingle
    Style.Color = 16250871
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.ButtonStyle = btsUltraFlat
    Style.IsFontAssigned = True
    Left = 552
    Top = 456
    PixelsPerInch = 96
  end
  object PivotGridStyleRepository: TcxStyleRepository
    Left = 521
    Top = 120
    PixelsPerInch = 96
    object GosOrePivotGridStyleSheet: TcxPivotGridStyleSheet
      Styles.Background = tvBackground
      Styles.ColumnHeader = tvGridHeader
      Styles.ColumnHeaderArea = tvGridGroupRow
      Styles.Content = tvContent
      Styles.DataHeaderArea = tvGridGroupRow
      Styles.FieldHeader = tvGridHeader
      Styles.FilterHeaderArea = tvGroupByBox
      Styles.RowHeader = tvGridHeader
      Styles.RowHeaderArea = tvGridGroupRow
      Styles.Selected = tvSelected
      BuiltIn = True
    end
  end
  object QryGruppoArcoSetImportazioneTerminata: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'UPDATE ARTICOLI SET'
      ''
      ' FLAGAPPENAIMPORTATO = '#39'F'#39
      ''
      'WHERE '
      ' FLAGAPPENAIMPORTATO = '#39'A'#39)
    Left = 320
    Top = 576
  end
  object QryGruppoArcoGruppi: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      
        'SELECT DISTINCT CODICEGRUPPO1,  CODICEGRUPPO2,  JOLLY8 AS DESCGR' +
        'UPPO1,  JOLLY9 AS DESCGRUPPO2'
      ''
      'FROM ARTICOLI'
      ''
      'WHERE'
      '  JOLLY10 = '#39'ARCO'#39
      '  AND FLAGAPPENAIMPORTATO = '#39'A'#39
      ''
      'ORDER BY CODICEGRUPPO1, CODICEGRUPPO2, JOLLY8, JOLLY9')
    Left = 320
    Top = 624
  end
  object QryGruppoArcoGroupPresent: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'SELECT COUNT(*) FROM GRUPPI'
      'WHERE'
      '          CODICE1 = :P_CODICE1'
      ' AND CODICE2 = :P_CODICE2'
      ' AND CODICE3 = -1'
      ' AND CODICE4 = -1'
      ' AND CODICE5 = -1'
      ' AND CODICE6 = -1')
    Left = 472
    Top = 576
  end
  object QryGruppoArcoInsertGruppo: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'INSERT INTO GRUPPI'
      '('
      ' CODICE1,'
      ' CODICE2,'
      ' CODICE3,'
      ' CODICE4,'
      ' CODICE5,'
      ' CODICE6,'
      ' DESCRIZIONE,'
      ' SINCHRO'
      ')'
      ''
      'VALUES'
      ''
      '('
      ' :P_CODICE1,'
      ' :P_CODICE2,'
      ' -1,'
      ' -1,'
      ' -1,'
      ' -1,'
      ' :P_DESCRIZIONE,'
      ' '#39'M'#39
      ')')
    Left = 472
    Top = 672
  end
  object QryGruppoArcoUpdateGruppo: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'UPDATE GRUPPI SET'
      ''
      ' CODICE1 = :P_CODICE1,'
      ' CODICE2 = :P_CODICE2,'
      ' CODICE3 = -1,'
      ' CODICE4 = -1,'
      ' CODICE5 = -1,'
      ' CODICE6 = -1,'
      ' DESCRIZIONE = :P_DESCRIZIONE'
      ''
      'WHERE'
      '          CODICE1 = :P_CODICE1'
      ' AND CODICE2 = :P_CODICE2'
      ' AND CODICE3 = -1'
      ' AND CODICE4 = -1'
      ' AND CODICE5 = -1'
      ' AND CODICE6 = -1')
    Left = 472
    Top = 720
  end
  object QryGruppoArcoGeneraBarcode: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'UPDATE ARTICOLI SET'
      ' BARCODE = :P_BARCODE'
      ''
      'WHERE'
      ' CODICEARTICOLO = :P_CODICEARTICOLO ')
    Left = 624
    Top = 624
  end
  object QryGruppoArcoListaArticoli: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'SELECT CODICEARTICOLO'
      ''
      'FROM ARTICOLI'
      ''
      'WHERE '
      ' JOLLY10 = '#39'ARCO'#39' '
      ' AND FLAGAPPENAIMPORTATO = '#39'A'#39)
    Left = 624
    Top = 576
  end
  object QryGruppoArcoCopiaGruppiDaJolly: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'UPDATE ARTICOLI A1 SET'
      ' A1.CODICEGRUPPO1 = :P_CODICEGRUPPO1,'
      ' A1.CODICEGRUPPO2 = :P_CODICEGRUPPO2'
      'WHERE'
      ' A1.CODICEARTICOLO = :P_CODICEARTICOLO'
      '')
    Left = 472
    Top = 624
  end
  object QryArticoloExist: TIB_Cursor
    IB_Connection = DBAzienda
    SQL.Strings = (
      'SELECT '
      ' COUNT(*) AS QUANTI'
      ''
      'FROM ARTICOLI'
      ''
      'WHERE CODICEARTICOLO = :P_CODART')
    Left = 48
    Top = 568
  end
  object ExcelSaveDialog: TSaveDialog
    Filter = 'Microsoft Excel (*.xls)|*.xls|Tutti i files|*.*'
    Left = 752
    Top = 64
  end
  object QryVendBancoSelCantieri: TIB_Cursor
    IB_Connection = DBAzienda
    IB_Transaction = TransVendBancoSelCantieri
    SQL.Strings = (
      
        'SELECT TIPO, CODICE, DATAAPERTURA, CLIENTE, RAGSOCCLI, DESCRIZIO' +
        'NE,'
      
        ' IMMOBCODICE, IMMOBLOCALITA, IMMOBPROVINCIA, IMMOBINDIRIZZO, IMM' +
        'OBCAP, IMMOBNUMCIVICO'
      'FROM PRATICHE'
      'WHERE TIPO = '#39'P'#39
      ' AND VISIBLETOEXPRESSMAG = '#39'T'#39
      'ORDER BY RAGSOCCLI, DESCRIZIONE')
    Left = 752
    Top = 216
  end
  object BandedGridsStyleRepository: TcxStyleRepository
    Left = 521
    Top = 8
    PixelsPerInch = 96
    object tvContentGrayArial8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clGray
    end
    object btvGCMaster: TcxGridBandedTableViewStyleSheet
      Styles.Background = tvBackground
      Styles.Content = tvContent
      Styles.Footer = tvGridFooter
      Styles.Group = tvGridGroupRow
      Styles.GroupByBox = tvGroupByBox
      Styles.GroupSummary = tvGroupSummary
      Styles.Header = tvGridHeader
      Styles.Selection = tvSelected
      Styles.BandHeader = tvGridBandHeader
      BuiltIn = True
    end
    object btvGCMasterStampa: TcxGridBandedTableViewStyleSheet
      Styles.Background = tvStampaGCBackground
      Styles.Content = tvStampaGCContent
      Styles.Footer = tvStampaGCFooter
      Styles.Group = tvStampaGCGroup
      Styles.GroupByBox = tvStampaGCGroup
      Styles.Header = tvStampaGCGridHeader
      Styles.BandHeader = tvStampaGCGridHeader
      BuiltIn = True
    end
    object btvArtDetail: TcxGridBandedTableViewStyleSheet
      Styles.Background = tvArtDetail_Background
      Styles.Content = tvArtDetail_Content
      Styles.Footer = tvArtDetail_Footer
      Styles.Group = tvArtDetail_Group
      Styles.GroupByBox = tvArtDetail_GroupByBox
      Styles.Header = tvArtDetail_Header
      Styles.Selection = tvArtDetail_Selection
      BuiltIn = True
    end
  end
  object IB_Transaction1: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 30
    Top = 112
  end
  object TransDocSel: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 30
    Top = 112
  end
  object TransProgressivi: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 214
    Top = 218
  end
  object TransVendBancoSelCantieri: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 722
    Top = 216
  end
  object TablePratiche: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    IB_Transaction = TransPratiche
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = TablePraticheBeforePost
    TableName = 'PRATICHE'
    Left = 58
    Top = 272
    object TablePraticheCodice: TIntegerField
      FieldName = 'Codice'
    end
    object TablePraticheDataApertura: TDateField
      FieldName = 'DataApertura'
    end
    object TablePraticheCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TablePraticheDataChiusura: TDateField
      FieldName = 'DataChiusura'
    end
    object TablePraticheDescrizione: TStringField
      FieldName = 'Descrizione'
      Size = 60
    end
    object TablePraticheNote: TStringField
      FieldName = 'Note'
      Size = 60
    end
    object TablePraticheArgomento: TStringField
      FieldName = 'Argomento'
      Size = 60
    end
    object TablePraticheProvenienza: TStringField
      FieldName = 'Provenienza'
      Size = 60
    end
    object TablePraticheStatoDescrizione: TStringField
      FieldName = 'StatoDescrizione'
      Size = 10
    end
    object TablePraticheStatoForeground: TStringField
      FieldName = 'StatoForeground'
      Size = 10
    end
    object TablePraticheStatoBackground: TStringField
      FieldName = 'StatoBackground'
      Size = 10
    end
    object TablePraticheAltriSoggetti: TStringField
      FieldName = 'AltriSoggetti'
      Size = 100
    end
    object TablePraticheSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
  end
  object SourcePratiche: TDataSource
    AutoEdit = False
    DataSet = TablePratiche
    Left = 88
    Top = 272
  end
  object TransPratiche: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 29
    Top = 272
  end
  object TxtSaveDialog: TSaveDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i files|*.*'
    Left = 752
    Top = 120
  end
  object TimerPollingAllegatiAlarm: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = TimerPollingAllegatiAlarmTimer
    Left = 728
    Top = 360
  end
  object SP_AllegatiAlarm: TIB_StoredProc
    IB_Connection = DBAzienda
    IB_Transaction = Trans_AllegatiAlarm
    SQL.Strings = (
      'EXECUTE PROCEDURE ALL_PING_ALARM')
    AutoDefineParams = False
    StoredProcForSelect = True
    StoredProcName = 'ALL_PING_ALARM'
    Left = 757
    Top = 360
  end
  object Trans_AllegatiAlarm: TIB_Transaction
    IB_Connection = DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 786
    Top = 360
  end
  object SP_CreaNuovoAllegatoFG: TIBOStoredProc
    Params = <
      item
        DataType = ftString
        Name = 'IN_TIPOALLEGATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_IDIMPEGNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_IDPRATAPP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_BRUCID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IN_DATAORAINIZIOINTERVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IN_DATAORAFINEINTERVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IN_COPIADATIPREC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_COPIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_IDNUOVOALLEGATO'
        ParamType = ptOutput
      end>
    StoredProcHasDML = True
    StoredProcName = 'ALLIMP_NUOVO_ALLEGATO_FG'
    IB_Connection = DBAzienda
    Left = 256
    Top = 8
  end
  object TableProgressivi2: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    IB_Transaction = TransProgressivi
    PessimisticLocking = True
    RecordCountAccurate = True
    AfterOpen = TableProgressivi2AfterOpen
    AfterPost = TableProgressivi2AfterPost
    TableName = 'PROGRESS2'
    Left = 251
    Top = 260
    object TableProgressivi2INDEXFIELD: TIntegerField
      FieldName = 'INDEXFIELD'
      Required = True
    end
    object TableProgressivi2SMTP_SERVER_FROM_NAME: TStringField
      FieldName = 'SMTP_SERVER_FROM_NAME'
      Size = 100
    end
    object TableProgressivi2SMTP_SERVER_FROM_EMAIL: TStringField
      FieldName = 'SMTP_SERVER_FROM_EMAIL'
      Size = 100
    end
    object TableProgressivi2SMTP_SERVER_ADDRESS: TStringField
      FieldName = 'SMTP_SERVER_ADDRESS'
      Size = 60
    end
    object TableProgressivi2SMTP_SERVER_PORT: TStringField
      FieldName = 'SMTP_SERVER_PORT'
      Size = 10
    end
    object TableProgressivi2SMTP_SERVER_SECURE: TStringField
      FieldName = 'SMTP_SERVER_SECURE'
      Size = 10
    end
    object TableProgressivi2SMTP_SERVER_USERNAME: TStringField
      FieldName = 'SMTP_SERVER_USERNAME'
      Size = 30
    end
    object TableProgressivi2SMTP_SERVER_PASSWORD: TStringField
      FieldName = 'SMTP_SERVER_PASSWORD'
      Size = 30
    end
    object TableProgressivi2SMS_SERVER_FROM: TStringField
      FieldName = 'SMS_SERVER_FROM'
      Size = 11
    end
    object TableProgressivi2SMS_SERVER_USERNAME: TStringField
      FieldName = 'SMS_SERVER_USERNAME'
      Size = 30
    end
    object TableProgressivi2SMS_SERVER_PASSWORD: TStringField
      FieldName = 'SMS_SERVER_PASSWORD'
      Size = 30
    end
    object TableProgressivi2SMS_SERVER_SOGLIA_AVVISO: TIntegerField
      FieldName = 'SMS_SERVER_SOGLIA_AVVISO'
    end
    object TableProgressivi2FAST_SELECTION_MODE: TStringField
      FieldName = 'FAST_SELECTION_MODE'
      Size = 1
    end
    object TableProgressivi2MANODOPERANEIPRECEDENTIIMPIANTO: TStringField
      FieldName = 'MANODOPERANEIPRECEDENTIIMPIANTO'
      Size = 1
    end
    object TableProgressivi2VISUALIZZAMSGPERSCAD: TStringField
      FieldName = 'VISUALIZZAMSGPERSCAD'
      Size = 1
    end
    object TableProgressivi2GOOGLE_USERNAME: TStringField
      FieldName = 'GOOGLE_USERNAME'
      Size = 100
    end
    object TableProgressivi2GOOGLE_PASSWORD: TStringField
      FieldName = 'GOOGLE_PASSWORD'
      Size = 30
    end
    object TableProgressivi2GOOGLE_TASKS_ENABLED: TStringField
      FieldName = 'GOOGLE_TASKS_ENABLED'
      Size = 1
    end
    object TableProgressivi2GOOGLE_TASKS_REFRESHTOKEN: TStringField
      FieldName = 'GOOGLE_TASKS_REFRESHTOKEN'
      Size = 200
    end
    object TableProgressivi2GOOGLE_CALENDAR_ENABLED: TStringField
      FieldName = 'GOOGLE_CALENDAR_ENABLED'
      Size = 1
    end
    object TableProgressivi2GOOGLE_CALENDAR_REFRESHTOKEN: TStringField
      FieldName = 'GOOGLE_CALENDAR_REFRESHTOKEN'
      Size = 200
    end
    object TableProgressivi2NUMDOCUNIVOCO_ENABLED: TStringField
      FieldName = 'NUMDOCUNIVOCO_ENABLED'
      Size = 1
    end
    object TableProgressivi2BOLLOVIRTUALEDEFAULT: TStringField
      FieldName = 'BOLLOVIRTUALEDEFAULT'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2BOLLOCODICEIVA: TIntegerField
      FieldName = 'BOLLOCODICEIVA'
    end
    object TableProgressivi2BOLLOVIRTUALEDICITURA: TStringField
      FieldName = 'BOLLOVIRTUALEDICITURA'
    end
    object TableProgressivi2BOLLODESCRIZIONEIVA: TStringField
      FieldKind = fkLookup
      FieldName = 'BOLLODESCRIZIONEIVA'
      LookupDataSet = TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'DESCRIZIONEIVA'
      KeyFields = 'BOLLOCODICEIVA'
      Size = 40
      Lookup = True
    end
    object TableProgressivi2BOLLOALIQUOTAIVA: TFloatField
      FieldKind = fkLookup
      FieldName = 'BOLLOALIQUOTAIVA'
      LookupDataSet = TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'BOLLOCODICEIVA'
      Lookup = True
    end
    object TableProgressivi2BOLLOAUTOMATICO: TStringField
      FieldName = 'BOLLOAUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2BOLLOAUTOMATICOIMPORTO: TIBOFloatField
      FieldName = 'BOLLOAUTOMATICOIMPORTO'
      currency = True
    end
    object TableProgressivi2BOLLOAUTOMATICOSOGLIA: TIBOFloatField
      FieldName = 'BOLLOAUTOMATICOSOGLIA'
      currency = True
    end
    object TableProgressivi2FE_SCADENZE: TStringField
      FieldName = 'FE_SCADENZE'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2BOLLOADDEBITAINFATTURA: TStringField
      FieldName = 'BOLLOADDEBITAINFATTURA'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_PROXVISITA_INBASEA: TStringField
      FieldName = 'PRM_PROXVISITA_INBASEA'
      Size = 30
    end
    object TableProgressivi2PRM_PROXVISITA_ADDPERIODSU: TStringField
      FieldName = 'PRM_PROXVISITA_ADDPERIODSU'
      Size = 30
    end
    object TableProgressivi2PRM_AUTODOC_OPFATTE: TStringField
      FieldName = 'PRM_AUTODOC_OPFATTE'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTODOC_RIFCONTRATTO: TStringField
      FieldName = 'PRM_AUTODOC_RIFCONTRATTO'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTODOC_DICITURA: TStringField
      FieldName = 'PRM_AUTODOC_DICITURA'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTODOC_DICITURATXT: TStringField
      FieldName = 'PRM_AUTODOC_DICITURATXT'
      Size = 255
    end
    object TableProgressivi2PRM_AUTOCLOSE_ENABLED: TStringField
      FieldName = 'PRM_AUTOCLOSE_ENABLED'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTOCLOSE_SOLOMANUT: TStringField
      FieldName = 'PRM_AUTOCLOSE_SOLOMANUT'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTOCLOSE_FATTURA: TStringField
      FieldName = 'PRM_AUTOCLOSE_FATTURA'
      FixedChar = True
      Size = 1
    end
    object TableProgressivi2PRM_AUTOCLOSE_SCAD: TStringField
      FieldName = 'PRM_AUTOCLOSE_SCAD'
      FixedChar = True
      Size = 1
    end
  end
  object SourceProgressivi2: TDataSource
    AutoEdit = False
    DataSet = TableProgressivi2
    Left = 280
    Top = 260
  end
  object TimerTransactionStatus: TTimer
    OnTimer = TimerTransactionStatusTimer
    Left = 400
    Top = 376
  end
  object IBOTable1: TIBOTable
    RecordCountAccurate = True
    Left = 168
    Top = 264
  end
  object cxLocalizer: TcxLocalizer
    Left = 400
    Top = 200
  end
  object ImagesFE: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 19923464
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000012121216262626302424242D0E0E
          0E11000000000000000000000000000000000000000000000000000000000000
          00000000000001010101414141519E9E9EC5CBCBCBFECCCCCCFFCCCCCCFFC9C9
          C9FB929292B73131313D00000000000000000000000000000000000000000000
          00000A0A0A0C8B8B8BAECCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFF75757592030303040000000000000000000000000202
          0203929292B7CCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFF797979970000000000000000000000004F4F
          4F63CCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF3131313D0000000000000000B1B1
          B1DDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF969696BB000000002222222BCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFC8C8C8FA0A0A0A0D3E3E3E4ECCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF2424242D42424252CCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF262626302A2A2A35CCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFE0F0F0F1302020203BABA
          BAE8CCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFA0A0A0C800000000000000006565
          657ECCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF4848485A00000000000000000707
          0709A4A4A4CDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFF8E8E8EB10101010100000000000000000000
          000014141419A1A1A1C9CCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFF8E8E8EB20A0A0A0C0000000000000000000000000000
          000000000000060606075C5C5C73B7B7B7E5CCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFAEAEAED94C4C4C5F02020202000000000000000000000000000000000000
          0000000000000000000000000000020202022B2B2B36424242523F3F3F4F2626
          262F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000020D1516031D2E30031C2B2D010A
          1011000000000000000000000000000000000000000000000000000000000000
          0000000000000001010106324D510E79BCC5129BF2FE129CF3FF129CF3FF129A
          EFFB0D70AEB704253A3D00000000000000000000000000000000000000000000
          000001070B0C0C6AA6AE129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF0A598B92000204040000000000000000000000000002
          03030D70AEB7129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF0B5C9097000000000000000000000000073D
          5E63129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF04253A3D00000000000000001087
          D3DD129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF0D72B2BB00000000031A292B129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF1299EEFA01080C0D06304A4E129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF031C2B2D06324E52129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF031D2E3004203335129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129BF2FE010C121300020303108E
          DDE8129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF0E7ABFC80000000000000000094D
          787E129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF0637565A00000000000000000106
          09090E7DC3CD129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF0C6CA9B10001010100000000000000000000
          0000020F18190E7BC0C9129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF0D6DAAB201070B0C0000000000000000000000000000
          0000000000000004070708466E73108CDAE5129CF3FF129CF3FF129CF3FF129C
          F3FF0F85CFD9073A5B5F00010202000000000000000000000000000000000000
          0000000000000000000000000000000102020421333606324E5206304B4F031D
          2D2F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000080E0316111F0730101D072D060B
          0311000000000000000000000000000000000000000000000000000000000000
          000000000000000100011D340C51467E1DC55BA226FE5BA326FF5BA326FF5AA0
          25FB41751BB71627093D00000000000000000000000000000000000000000000
          00000408020C3E6F1AAE5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF345D1692010301040000000000000000000000000102
          000341751BB75BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF36611697000000000000000000000000233F
          0F635BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF1627093D00000000000000004F8D
          21DD5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF43781CBB000000000F1B062B5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF59A025FA0508020D1C320C4E5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF101D072D1D340C525BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF111F0730132208355BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA226FE070C0313010200035394
          23E85BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF47801EC800000000000000002D51
          137E5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF203A0D5A00000000000000000306
          010949831FCD5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF3F711AB10001000100000000000000000000
          00000910041948801EC95BA326FF5BA326FF5BA326FF5BA326FF5BA326FF5BA3
          26FF5BA326FF5BA326FF40721BB20408020C0000000000000000000000000000
          00000000000002040107294A1173529222E55BA326FF5BA326FF5BA326FF5BA3
          26FF4D8B20D9223D0E5F01010002000000000000000000000000000000000000
          000000000000000000000000000001010002132308361D340C521C320C4F111E
          072F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000021216000428300004252D0002
          0E11000000000000000000000000000000000000000000000000000000000000
          00000000000000000101000743510012A3C50017D2FE0017D3FF0017D3FF0017
          D0FB001197B70005323D00000000000000000000000000000000000000000000
          000000010A0C001090AE0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF000D7992000003040000000000000000000000000000
          0203001197B70017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF000E7D970000000000000000000000000009
          52630017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0005323D00000000000000000014
          B7DD0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF00119BBB000000000004242B0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017CFFA00010B0D0007414E0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0004252D000744520017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0004283000052C350017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D2FE00021013000002030015
          C0E80017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0012A5C80000000000000000000B
          687E0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF00084A5A00000000000000000001
          07090012AACD0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF001092B10000010100000000000000000000
          0000000215190012A6C90017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF001093B200010A0C0000000000000000000000000000
          00000000000000010607000A5F730015BDE50017D3FF0017D3FF0017D3FF0017
          D3FF0014B4D900094F5F00000202000000000000000000000000000000000000
          00000000000000000000000000000000020200052D36000744520007414F0004
          272F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000004272F0007414F1D340C521323
          0836010100020000000000000000000000000000000000000000000000000000
          0000000000000000020200094F5F0014B4D90017D3FF0017D3FF5BA326FF5BA3
          26FF529222E5294A117302040107000000000000000000000000000000000000
          000000010A0C001093B20017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF48801EC9091004190000000000000000000000000000
          0101001092B10017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF49831FCD0306010900000000000000000008
          4A5A0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF2D51137E00000000000000000012
          A5C80017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF539423E801020003000210130017
          D2FE0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF13220835000428300017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF1D340C520004252D0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF1C320C4E00010B0D0017
          CFFA0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF5BA326FF0F1B062B000000000011
          9BBB0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF4F8D21DD00000000000000000005
          323D0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF5BA326FF233F0F6300000000000000000000
          0000000E7D970017D3FF0017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF5BA326FF41751BB70102000300000000000000000000
          000000000304000D79920017D3FF0017D3FF0017D3FF0017D3FF5BA326FF5BA3
          26FF5BA326FF5BA326FF3E6F1AAE0408020C0000000000000000000000000000
          000000000000000000000005323D001197B70017D0FB0017D3FF5BA326FF5BA2
          26FE467E1DC51D340C5100010001000000000000000000000000000000000000
          00000000000000000000000000000000000000020E110004252D111F0730080E
          0316000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000130000000E00000000000000000000
          0000000000000000000000000000000000000000000000000073000000E10000
          006600000012000000010000002B0000008300000046000000000D72B2BB0D72
          B2BB0D72B2BB0D72B2BB0D72B2BB0D72B2BB0D72B2BB063755DE000000FF0529
          40E70B5C90C80B5C90C8052940E7000000FF05304BE20C67A1C1129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF1197EBFF0B5C8FFF01060AFF0000
          00FF063756FF063756FF000000FF01060AFF094C77FF0F7FC6FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF108DDBFF0E7DC2FF073E60FF0106
          09FF000406FF000406FF010609FF073D5FFF0F7EC4FF108FDEFF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF1193E6F10B5788F60105
          08FF000000FF000000FF010508FF0B5D91FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF0E7ABEDD04253A6E01090EDE0000
          00FF000000FF000000FF000000FF062F49FF0E7DC2FF108DDBFF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF0D6EACB4052B437409486FF7000000FF0000
          00FF020D13F702111BFF000000FF000101FF0B5C8FFF1197EBFF129CF3FF129C
          F3FF129CF3FF129BF2FE0A53828808497278108CDAFD084267FF000000FF0317
          24FF06334EA1073654A7031724FF000000FF094B75FF129CF3FF129CF3FF129C
          F3FF1193E6F1073654590C69A4AC129CF3FF129CF3FF0D71B0FF073959FF0C68
          A2FF129BF2FF0B649BB5031824AA010D14FD0A5685FF129CF3FF129CF3FF0F84
          CED8062C45490F82CBD5129CF3FF129CF3FF129CF3FF1193E6FF108BD9FF108F
          DEFF129CF3FF129CF3FF0E7CC0E0052B44510F7EC4CE129CF3FF0B639AA20633
          4F531193E5F0129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF1196E9F5063A5A5E0A598B920A588990129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF0B61989F0E7DC2CC0E7D
          C2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7D
          C2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC0E7DC2CC000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000020D1516031D2E30031C2B2D010A
          1011000000000000000000000000000000000000000000000000000000000000
          0000000000000001010106324D510E79BCC5129BF2FE129CF3FF129CF3FF129A
          EFFB0D70AEB704253A3D00000000000000000000000000000000000000000000
          000001070B0C0C6AA6AE129CF3FF129CF3FF129CF3FF0F7FC5FF0E75B6FF129C
          F3FF129CF3FF129CF3FF0A598B92000204040000000000000000000000000002
          03030D70AEB7129CF3FF129CF3FF129CF3FF129CF3FF05283EFF010101FF129C
          F3FF129CF3FF129CF3FF129CF3FF0B5C9097000000000000000000000000073D
          5E63129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF0F7FC5FF0E75B6FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF04253A3D00000000000000001087
          D3DD129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF05283EFF010101FF129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF0D72B2BB00000000031A292B129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF073B5CFF010101FF0B58
          89FF129CF3FF129CF3FF129CF3FF129CF3FF1299EEFA01080C0D06304A4E129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF1089D5FF020B10FF0101
          01FF0C6298FF129CF3FF129CF3FF129CF3FF129CF3FF031C2B2D06324E52129C
          F3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF1089D5FF041E
          2FFF010101FF0D6BA7FF129CF3FF129CF3FF129CF3FF031D2E3004203335129C
          F3FF129CF3FF129CF3FF129CF3FF0C6298FF0C6298FF129CF3FF129CF3FF1089
          D5FF010101FF05283EFF129CF3FF129CF3FF129BF2FE010C121300020303108E
          DDE8129CF3FF129CF3FF129CF3FF020B10FF010101FF1192E4FF129CF3FF0F7F
          C5FF010101FF05283EFF129CF3FF129CF3FF0E7ABFC80000000000000000094D
          787E129CF3FF129CF3FF129CF3FF08456BFF010101FF03141FFF08456BFF020B
          10FF010101FF0C6298FF129CF3FF129CF3FF0637565A00000000000000000106
          09090E7DC3CD129CF3FF129CF3FF129CF3FF08456BFF020B10FF010101FF020B
          10FF0A4F7AFF129CF3FF129CF3FF0C6CA9B10001010100000000000000000000
          0000020F18190E7BC0C9129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF0D6DAAB201070B0C0000000000000000000000000000
          0000000000000004070708466E73108CDAE5129CF3FF129CF3FF129CF3FF129C
          F3FF0F85CFD9073A5B5F00010202000000000000000000000000000000000000
          0000000000000000000000000000000102020421333606324E5206304B4F031D
          2D2F000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000070000003F00000083000000A6000000A70000
          0087000000450000000900000000000000000000000000000000000000000000
          0000000000000000003A000000C5000000F7000000DB000000B8000000B70000
          00D9000000F7000000CE00000044000000000000000000000000000000000000
          000000000057000000EF000000B90000003C0000000700000000000000000000
          000600000039000000B4000000F3000000660000000000000000000000000000
          0036000000EE000000960000000800000000000000000000004C000000620000
          000200000000000000060000008E000000F30000004500000000000000050000
          00BF000000BE00000009000000000000000000000059000000F4000000FA0000
          007A000000020000000000000007000000B6000000CF00000009000000360000
          00F600000042000000000000000000000053000000F2000000FF000000FE0000
          00F90000007100000001000000000000003A000000F800000048000000760000
          00E1000000090000000000000053000000F1000000FD000000FE000000FE0000
          00FD000000F80000006D0000000100000006000000D80000008C000000970000
          00C3000000000000002C000000EF000000D80000007B000000F9000000FC0000
          0086000000D8000000F60000004100000000000000B7000000AD000000970000
          00C4000000000000000F000000480000000C0000002A000000F8000000FC0000
          003F0000000C000000470000001500000000000000B9000000AC000000730000
          00E40000000C0000000000000000000000000000002A000000F8000000FC0000
          003F00000000000000000000000000000008000000DC0000008A000000320000
          00F60000004B0000000000000000000000000000002A000000F8000000FC0000
          003F00000000000000000000000000000043000000F900000045000000040000
          00BA000000C90000000F00000000000000000000002A000000F8000000FC0000
          003F00000000000000000000000C000000C2000000C900000008000000000000
          0030000000EC000000AB00000010000000000000000D0000007A0000007E0000
          0017000000000000000D000000A4000000F20000003E00000000000000000000
          00000000004E000000EC000000CD000000520000000E00000000000000000000
          000D0000004E000000C9000000F10000005C0000000000000000000000000000
          0000000000000000002F000000B6000000F6000000E7000000C9000000C80000
          00E5000000F7000000BE00000039000000000000000000000000000000000000
          00000000000000000000000000030000003000000075000000990000009B0000
          0079000000350000000500000000000000000000000000000000}
      end>
  end
  object ImageFETiming: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 23069192
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000031B2A2C0F82CAD40E7ABEC7020F
          1819000000000000000000000000000000000000000000000000000000000000
          00000000000005273D4006345155063451550634515506345155063451550634
          5155063451550634515504203335000000000000000000000000000000000000
          000000000000094F7B81129CF3FF129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF129CF3FF073B5C6100000000000000000000000002121D1E0843
          696E0001020201050808108DDBE6129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF0F7FC5CF000101010001020209507C8201060A0A0A5382880318
          26280B6299A1000000000B6299A1129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF094C767C010609090B5E9299052D4649073F62670B639AA2031A
          292B094B747A000000000A56868D129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF0843696E000000000B5D9198010A0F100B6298A00B6299A10633
          5054052F494D000000000A56868D129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF0843696E000000000843696E041F31330B639AA20B6299A10636
          5559052C45480000000009507D83129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF073C5D62000000000741656A042235380B6299A10B6298A0041F
          313308486F750000000006355256129CF3FF129CF3FF129CF3FF129CF3FF129C
          F3FF129CF3FF031D2E30000000000B5C8F96010D13140B61989F0A5381870317
          23250C67A1A900000000000204040E7ABFC8129CF3FF129CF3FF129CF3FF129C
          F3FF0C669EA600000000010508080B6299A1052A4144073F626702121D1E0843
          686D00040707000000000000000001060909094E7B810E7FC7D10E7EC4CE0844
          6A6F00020303000000000000000000040707094F7B8101060A0A000000000000
          000000000000000000000000000000000000000101010D6DAAB20B61979E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000020404000102020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000004242C0013AFD40012A5C70002
          1519000000000000000000000000000000000000000000000000000000000000
          0000000000000006354000084655000846550008465500084655000846550008
          4655000846550008465500052C35000000000000000000000000000000000000
          000000000000000C6B810017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF000950610000000000000000000000000003191E000A
          5B6E00000202000107080015BEE60017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0013ABCF0000010100000202000C6C820001080A000C71880004
          2128000F85A100000000000F85A10017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF000B677C00010709000E7F9900073C4900095567000F86A20004
          242B000B657A00000000000D758D0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF000A5B6E00000000000E7E9800010E10000E84A0000F85A10008
          46540007404D00000000000D758D0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF000A5B6E00000000000A5B6E00052A33000F86A2000F85A10008
          4A5900063C4800000000000C6C830017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0009516200000000000A586A00052E38000F85A1000E84A00005
          2A33000B617500000000000847560017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0004283000000000000E7C9600021114000E849F000C70870003
          1F25000F8CA900000000000003040012A5C80017D3FF0017D3FF0017D3FF0017
          D3FF000F89A60000000000010708000F85A100063844000955670003191E000A
          5A6D00010607000000000000000000010709000C6B810013ACD10013ABCE000A
          5C6F00000203000000000000000000010607000C6B810001080A000000000000
          00000000000000000000000000000000000000000101001093B2000E839E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000304000002020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000215190016
          C7F10017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0016C7F100021519000000000009
          57690017D3FF0017D3FF0017D3FF0017D3FF0017D3FF000D758D000D758D0017
          D3FF0017D3FF0017D3FF0017D3FF0017D3FF0009566800000000000000000000
          02030012A9CC0017D3FF0017D3FF0017D3FF0017D3FF000C6C82000C6C820017
          D3FF0017D3FF0017D3FF0017D3FF0012A8CB0000020200000000000000000000
          00000006343F0017D2FE0017D3FF0017D3FF0017D3FF0017D3FF0017D3FF0017
          D3FF0017D3FF0017D3FF0017D2FE0006343F0000000000000000000000000000
          000000000000000E84A00017D3FF0017D3FF0017D3FF00084655000846550017
          D3FF0017D3FF0017D3FF000E849F000000000000000000000000000000000000
          000000000000000215190016C7F10017D3FF0017D3FF00084655000846550017
          D3FF0017D3FF0016C7F100021519000000000000000000000000000000000000
          00000000000000000000000A5A6D0017D3FF0017D3FF00084655000846550017
          D3FF0017D3FF000A596C00000000000000000000000000000000000000000000
          00000000000000000000000002020012A8CB0017D3FF00084655000846550017
          D3FF0012A7CA0000020200000000000000000000000000000000000000000000
          00000000000000000000000000000006343F0017D2FE0017D3FF0017D3FF0017
          D2FE0006333E0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000E849F0017D3FF0017D3FF000E
          839E000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000215190016C7F10015C5EE0002
          1216000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000A596C000A596B0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000202000002020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ZLB1: TZLBArchive
    Left = 24
    Top = 8
  end
  object TableCausaliLookup: TIBOTable
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    TableName = 'CAUSALI'
    Left = 251
    Top = 64
    object TableCausaliLookupDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
      Size = 40
    end
    object TableCausaliLookupPA_TIPODOCUMENTO: TStringField
      FieldName = 'PA_TIPODOCUMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object SourceCausaliLookup: TDataSource
    AutoEdit = False
    DataSet = TableCausaliLookup
    Left = 280
    Top = 64
  end
end
