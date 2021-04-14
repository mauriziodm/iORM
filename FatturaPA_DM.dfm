object FatturaPA: TFatturaPA
  OldCreateOrder = False
  Height = 372
  Width = 579
  object QrySogg: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CODICE'
        ParamType = ptInput
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT * FROM CLIENTI WHERE CODICE = :P_CODICE')
    Left = 32
    Top = 16
    object QrySoggCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QrySoggRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QrySoggINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 80
    end
    object QrySoggNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QrySoggSCALA: TStringField
      FieldName = 'SCALA'
      Size = 10
    end
    object QrySoggPIANO: TStringField
      FieldName = 'PIANO'
      Size = 5
    end
    object QrySoggINTERNO: TStringField
      FieldName = 'INTERNO'
      Size = 7
    end
    object QrySoggPALAZZO: TStringField
      FieldName = 'PALAZZO'
      Size = 30
    end
    object QrySoggCODICEISTATCOMUNE: TStringField
      FieldName = 'CODICEISTATCOMUNE'
      Size = 10
    end
    object QrySoggCITTA: TStringField
      FieldName = 'CITTA'
      Size = 60
    end
    object QrySoggCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object QrySoggPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object QrySoggTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
    object QrySoggFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object QrySoggCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Size = 30
    end
    object QrySoggCHIEDEREDI: TStringField
      FieldName = 'CHIEDEREDI'
      Size = 40
    end
    object QrySoggSCONTO: TSmallintField
      FieldName = 'SCONTO'
    end
    object QrySoggINDIRIZZODESTINAZMERCI: TStringField
      FieldName = 'INDIRIZZODESTINAZMERCI'
      Size = 80
    end
    object QrySoggNUMCIVICODESTINAZMERCI: TStringField
      FieldName = 'NUMCIVICODESTINAZMERCI'
      Size = 10
    end
    object QrySoggCODICEISTATCOMUNEDESTINAZMERCI: TStringField
      FieldName = 'CODICEISTATCOMUNEDESTINAZMERCI'
      Size = 10
    end
    object QrySoggCITTADESTINAZMERCI: TStringField
      FieldName = 'CITTADESTINAZMERCI'
      Size = 60
    end
    object QrySoggCAPDESTINAZMERCI: TStringField
      FieldName = 'CAPDESTINAZMERCI'
      Size = 5
    end
    object QrySoggPROVINCIADESTINAZMERCI: TStringField
      FieldName = 'PROVINCIADESTINAZMERCI'
      Size = 3
    end
    object QrySoggLISTINO: TSmallintField
      FieldName = 'LISTINO'
    end
    object QrySoggCONTOCORRENTE: TStringField
      FieldName = 'CONTOCORRENTE'
      Size = 40
    end
    object QrySoggPAGAMENTO: TIntegerField
      FieldName = 'PAGAMENTO'
    end
    object QrySoggCLIENTEFORNITORE: TStringField
      FieldName = 'CLIENTEFORNITORE'
      Size = 10
    end
    object QrySoggCODICEIVA: TIntegerField
      FieldName = 'CODICEIVA'
    end
    object QrySoggPARTITAIVA: TStringField
      FieldName = 'PARTITAIVA'
      Size = 16
    end
    object QrySoggCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Size = 16
    end
    object QrySoggSITOINTERNET: TStringField
      FieldName = 'SITOINTERNET'
      Size = 60
    end
    object QrySoggATTIVITASVOLTA: TStringField
      FieldName = 'ATTIVITASVOLTA'
      Size = 60
    end
    object QrySoggDATANASCITA: TDateTimeField
      FieldName = 'DATANASCITA'
    end
    object QrySoggLUOGONASCITA: TStringField
      FieldName = 'LUOGONASCITA'
      Size = 30
    end
    object QrySoggSESSO: TStringField
      FieldName = 'SESSO'
      Size = 1
    end
    object QrySoggTELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object QrySoggCATEGORIA1: TStringField
      FieldName = 'CATEGORIA1'
      Size = 30
    end
    object QrySoggCATEGORIA2: TStringField
      FieldName = 'CATEGORIA2'
      Size = 30
    end
    object QrySoggCATEGORIA3: TStringField
      FieldName = 'CATEGORIA3'
      Size = 30
    end
    object QrySoggCATEGORIA4: TStringField
      FieldName = 'CATEGORIA4'
      Size = 30
    end
    object QrySoggCATEGORIA5: TStringField
      FieldName = 'CATEGORIA5'
      Size = 30
    end
    object QrySoggJOLLY1: TStringField
      FieldName = 'JOLLY1'
      Size = 60
    end
    object QrySoggJOLLY2: TStringField
      FieldName = 'JOLLY2'
      Size = 60
    end
    object QrySoggJOLLY3: TStringField
      FieldName = 'JOLLY3'
      Size = 60
    end
    object QrySoggJOLLY4: TStringField
      FieldName = 'JOLLY4'
      Size = 60
    end
    object QrySoggJOLLY5: TStringField
      FieldName = 'JOLLY5'
      Size = 60
    end
    object QrySoggJOLLY6: TStringField
      FieldName = 'JOLLY6'
      Size = 60
    end
    object QrySoggJOLLY7: TStringField
      FieldName = 'JOLLY7'
      Size = 60
    end
    object QrySoggJOLLY8: TStringField
      FieldName = 'JOLLY8'
      Size = 60
    end
    object QrySoggJOLLY9: TStringField
      FieldName = 'JOLLY9'
      Size = 60
    end
    object QrySoggJOLLY10: TStringField
      FieldName = 'JOLLY10'
      Size = 60
    end
    object QrySoggJOLLY11: TStringField
      FieldName = 'JOLLY11'
      Size = 60
    end
    object QrySoggJOLLY12: TStringField
      FieldName = 'JOLLY12'
      Size = 60
    end
    object QrySoggJOLLY13: TStringField
      FieldName = 'JOLLY13'
      Size = 60
    end
    object QrySoggJOLLY14: TStringField
      FieldName = 'JOLLY14'
      Size = 60
    end
    object QrySoggJOLLY15: TStringField
      FieldName = 'JOLLY15'
      Size = 60
    end
    object QrySoggJOLLY16: TStringField
      FieldName = 'JOLLY16'
      Size = 60
    end
    object QrySoggJOLLY17: TStringField
      FieldName = 'JOLLY17'
      Size = 60
    end
    object QrySoggJOLLY18: TStringField
      FieldName = 'JOLLY18'
      Size = 60
    end
    object QrySoggJOLLY19: TStringField
      FieldName = 'JOLLY19'
      Size = 60
    end
    object QrySoggJOLLY20: TStringField
      FieldName = 'JOLLY20'
      Size = 60
    end
    object QrySoggJOLLY21: TStringField
      FieldName = 'JOLLY21'
      Size = 60
    end
    object QrySoggJOLLY22: TStringField
      FieldName = 'JOLLY22'
      Size = 60
    end
    object QrySoggJOLLY23: TStringField
      FieldName = 'JOLLY23'
      Size = 60
    end
    object QrySoggJOLLY24: TStringField
      FieldName = 'JOLLY24'
      Size = 60
    end
    object QrySoggJOLLY25: TStringField
      FieldName = 'JOLLY25'
      Size = 60
    end
    object QrySoggJOLLY26: TStringField
      FieldName = 'JOLLY26'
      Size = 60
    end
    object QrySoggJOLLY27: TStringField
      FieldName = 'JOLLY27'
      Size = 60
    end
    object QrySoggJOLLY28: TStringField
      FieldName = 'JOLLY28'
      Size = 60
    end
    object QrySoggJOLLY29: TStringField
      FieldName = 'JOLLY29'
      Size = 60
    end
    object QrySoggJOLLY30: TStringField
      FieldName = 'JOLLY30'
      Size = 60
    end
    object QrySoggJOLLY31: TStringField
      FieldName = 'JOLLY31'
      Size = 60
    end
    object QrySoggJOLLY32: TStringField
      FieldName = 'JOLLY32'
      Size = 60
    end
    object QrySoggJOLLY33: TStringField
      FieldName = 'JOLLY33'
      Size = 60
    end
    object QrySoggJOLLY34: TStringField
      FieldName = 'JOLLY34'
      Size = 60
    end
    object QrySoggJOLLY35: TStringField
      FieldName = 'JOLLY35'
      Size = 60
    end
    object QrySoggJOLLY36: TStringField
      FieldName = 'JOLLY36'
      Size = 60
    end
    object QrySoggJOLLY37: TStringField
      FieldName = 'JOLLY37'
      Size = 60
    end
    object QrySoggJOLLY38: TStringField
      FieldName = 'JOLLY38'
      Size = 60
    end
    object QrySoggJOLLY39: TStringField
      FieldName = 'JOLLY39'
      Size = 60
    end
    object QrySoggJOLLY40: TStringField
      FieldName = 'JOLLY40'
      Size = 60
    end
    object QrySoggJOLLY41: TStringField
      FieldName = 'JOLLY41'
      Size = 60
    end
    object QrySoggJOLLY42: TStringField
      FieldName = 'JOLLY42'
      Size = 60
    end
    object QrySoggJOLLY43: TStringField
      FieldName = 'JOLLY43'
      Size = 60
    end
    object QrySoggJOLLY44: TStringField
      FieldName = 'JOLLY44'
      Size = 60
    end
    object QrySoggJOLLY45: TStringField
      FieldName = 'JOLLY45'
      Size = 60
    end
    object QrySoggJOLLY46: TStringField
      FieldName = 'JOLLY46'
      Size = 60
    end
    object QrySoggJOLLY47: TStringField
      FieldName = 'JOLLY47'
      Size = 60
    end
    object QrySoggJOLLY48: TStringField
      FieldName = 'JOLLY48'
      Size = 60
    end
    object QrySoggJOLLY49: TStringField
      FieldName = 'JOLLY49'
      Size = 60
    end
    object QrySoggJOLLY50: TStringField
      FieldName = 'JOLLY50'
      Size = 60
    end
    object QrySoggNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
      Size = 1000
    end
    object QrySoggNOTEPRIVATE: TMemoField
      FieldName = 'NOTEPRIVATE'
      BlobType = ftMemo
      Size = 1000
    end
    object QrySoggCODICERIF: TIntegerField
      FieldName = 'CODICERIF'
    end
    object QrySoggRAGSOCRIF: TStringField
      FieldName = 'RAGSOCRIF'
      Size = 60
    end
    object QrySoggINDIRIZZORIF: TStringField
      FieldName = 'INDIRIZZORIF'
      Size = 40
    end
    object QrySoggNUMCIVICORIF: TStringField
      FieldName = 'NUMCIVICORIF'
      Size = 10
    end
    object QrySoggCITTARIF: TStringField
      FieldName = 'CITTARIF'
      Size = 25
    end
    object QrySoggCAPRIF: TStringField
      FieldName = 'CAPRIF'
      Size = 5
    end
    object QrySoggPROVINCIARIF: TStringField
      FieldName = 'PROVINCIARIF'
      Size = 3
    end
    object QrySoggTITOLO: TStringField
      FieldName = 'TITOLO'
      Size = 60
    end
    object QrySoggABI: TStringField
      FieldName = 'ABI'
      Size = 10
    end
    object QrySoggCAB: TStringField
      FieldName = 'CAB'
      Size = 10
    end
    object QrySoggCODICEDESTINAZMERCI: TIntegerField
      FieldName = 'CODICEDESTINAZMERCI'
    end
    object QrySoggRAGSOCDESTINAZMERCI: TStringField
      FieldName = 'RAGSOCDESTINAZMERCI'
      Size = 60
    end
    object QrySoggEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object QrySoggSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QrySoggSALTAMESE1: TStringField
      FieldName = 'SALTAMESE1'
      Size = 1
    end
    object QrySoggSALTAMESE2: TStringField
      FieldName = 'SALTAMESE2'
      Size = 1
    end
    object QrySoggSALTAMESE3: TStringField
      FieldName = 'SALTAMESE3'
      Size = 1
    end
    object QrySoggSALTAMESE4: TStringField
      FieldName = 'SALTAMESE4'
      Size = 1
    end
    object QrySoggSALTAMESE5: TStringField
      FieldName = 'SALTAMESE5'
      Size = 1
    end
    object QrySoggSALTAMESE6: TStringField
      FieldName = 'SALTAMESE6'
      Size = 1
    end
    object QrySoggSALTAMESE7: TStringField
      FieldName = 'SALTAMESE7'
      Size = 1
    end
    object QrySoggSALTAMESE8: TStringField
      FieldName = 'SALTAMESE8'
      Size = 1
    end
    object QrySoggSALTAMESE9: TStringField
      FieldName = 'SALTAMESE9'
      Size = 1
    end
    object QrySoggSALTAMESE10: TStringField
      FieldName = 'SALTAMESE10'
      Size = 1
    end
    object QrySoggSALTAMESE11: TStringField
      FieldName = 'SALTAMESE11'
      Size = 1
    end
    object QrySoggSALTAMESE12: TStringField
      FieldName = 'SALTAMESE12'
      Size = 1
    end
    object QrySoggSALTAMESESPOSTAALGIORNO: TIntegerField
      FieldName = 'SALTAMESESPOSTAALGIORNO'
    end
    object QrySoggSPOSTASCADALGIORNO: TIntegerField
      FieldName = 'SPOSTASCADALGIORNO'
    end
    object QrySoggADDEBITASPESE: TStringField
      FieldName = 'ADDEBITASPESE'
      Size = 1
    end
    object QrySoggCIN: TStringField
      FieldName = 'CIN'
      Size = 3
    end
    object QrySoggSPESEINCASSO: TIBOFloatField
      FieldName = 'SPESEINCASSO'
    end
    object QrySoggSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QrySoggSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QrySoggSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QrySoggFORNITORECONLISTINO: TStringField
      FieldName = 'FORNITORECONLISTINO'
      FixedChar = True
      Size = 1
    end
    object QrySoggIMPORTOFIDO: TIBOFloatField
      FieldName = 'IMPORTOFIDO'
    end
    object QrySoggAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QrySoggAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QrySoggAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QrySoggAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QrySoggRITACCPERC: TIBOFloatField
      FieldName = 'RITACCPERC'
    end
    object QrySoggCOM_SMS: TStringField
      FieldName = 'COM_SMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QrySoggCOM_EMAIL: TStringField
      FieldName = 'COM_EMAIL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QrySoggCOM_LETTERA: TStringField
      FieldName = 'COM_LETTERA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QrySoggESTERO: TStringField
      FieldName = 'ESTERO'
      FixedChar = True
      Size = 1
    end
    object QrySoggESTERO_CODICE: TStringField
      FieldName = 'ESTERO_CODICE'
      Size = 60
    end
    object QrySoggESTERO_DESCRIZIONE: TStringField
      FieldName = 'ESTERO_DESCRIZIONE'
      Size = 40
    end
    object QrySoggESTERO_SIGLA: TStringField
      FieldName = 'ESTERO_SIGLA'
      Size = 3
    end
    object QrySoggPA_CODICEDESTINATARIO: TStringField
      FieldName = 'PA_CODICEDESTINATARIO'
      Size = 7
    end
    object QrySoggPA_RIFAMMINISTRAZIONE: TStringField
      FieldName = 'PA_RIFAMMINISTRAZIONE'
    end
    object QrySoggNAZIONESIGLA: TStringField
      FieldName = 'NAZIONESIGLA'
      FixedChar = True
      Size = 2
    end
    object QrySoggNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QrySoggCOGNOME: TStringField
      FieldName = 'COGNOME'
      Size = 50
    end
    object QrySoggTIPOPERSONA: TStringField
      FieldName = 'TIPOPERSONA'
      FixedChar = True
      Size = 1
    end
    object QrySoggCODICEEORI: TStringField
      FieldName = 'CODICEEORI'
      Size = 17
    end
    object QrySoggESIGIBILITAIVA: TStringField
      FieldName = 'ESIGIBILITAIVA'
      FixedChar = True
      Size = 1
    end
    object QrySoggPEC: TStringField
      FieldName = 'PEC'
      Size = 60
    end
    object QrySoggESTERO_UE: TStringField
      FieldName = 'ESTERO_UE'
      FixedChar = True
      Size = 1
    end
    object QrySoggDISABILITACONTROLLOCODFISC: TStringField
      FieldName = 'DISABILITACONTROLLOCODFISC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QrySoggREGIMEFISCALESIGLA: TStringField
      FieldName = 'REGIMEFISCALESIGLA'
      FixedChar = True
      Size = 4
    end
  end
  object SD1: TSaveDialog
    DefaultExt = 'XML'
    Left = 112
    Top = 19
  end
  object QryCausali: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'P_DESCRIZIONE'
        ParamType = ptInput
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT PA_TIPODOCUMENTO FROM CAUSALI'
      'WHERE DESCRIZIONE = :P_DESCRIZIONE')
    Left = 32
    Top = 64
    object QryCausaliPA_TIPODOCUMENTO: TStringField
      FieldName = 'PA_TIPODOCUMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object QryScad: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'P_TIPODOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_NUMDOC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATADOC'
        ParamType = ptInput
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM SCADENZ S'
      'LEFT JOIN BANCHE B ON (B.ABI = S.ABI AND B.CAB = S.CAB)'
      'WHERE S.TIPODOC = :P_TIPODOC'
      'AND S.REGISTRO = :P_REGISTRO'
      'AND S.NUMDOC = :P_NUMDOC'
      'AND S.DATADOC = :P_DATADOC')
    Left = 32
    Top = 112
    object QryScadTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 10
    end
    object QryScadCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QryScadDATASCADENZA: TDateTimeField
      FieldName = 'DATASCADENZA'
      Required = True
    end
    object QryScadCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QryScadTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 25
    end
    object QryScadNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object QryScadREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 5
    end
    object QryScadDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryScadIMPORTO: TIBOFloatField
      FieldName = 'IMPORTO'
    end
    object QryScadIMPORTOPAGATO: TIBOFloatField
      FieldName = 'IMPORTOPAGATO'
    end
    object QryScadPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryScadNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object QryScadPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object QryScadPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object QryScadDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryScadDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object QryScadDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object QryScadRICEVUTABANCARIA: TStringField
      FieldName = 'RICEVUTABANCARIA'
      FixedChar = True
      Size = 1
    end
    object QryScadABI: TStringField
      FieldName = 'ABI'
      Size = 10
    end
    object QryScadCAB: TStringField
      FieldName = 'CAB'
      Size = 10
    end
    object QryScadPRESENTATA: TStringField
      FieldName = 'PRESENTATA'
      Size = 1
    end
    object QryScadPRESENTATABANCA: TStringField
      FieldName = 'PRESENTATABANCA'
    end
    object QryScadPARTITAIVACLI: TStringField
      FieldName = 'PARTITAIVACLI'
      Size = 16
    end
    object QryScadINSOLUTO: TStringField
      FieldName = 'INSOLUTO'
      FixedChar = True
      Size = 1
    end
    object QryScadSPESEPROTESTO: TIBOFloatField
      FieldName = 'SPESEPROTESTO'
    end
    object QryScadAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QryScadAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QryScadAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QryScadAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QryScadSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QryScadDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object QryScadIBAN: TStringField
      FieldName = 'IBAN'
      Size = 34
    end
    object QryScadPA_CONDIZIONIPAGAMENTOSIGLA: TStringField
      FieldName = 'PA_CONDIZIONIPAGAMENTOSIGLA'
      FixedChar = True
      Size = 4
    end
    object QryScadPA_MODALITAPAGAMENTOSICLA: TStringField
      FieldName = 'PA_MODALITAPAGAMENTOSICLA'
      FixedChar = True
      Size = 4
    end
    object QryScadABI_1: TStringField
      FieldName = 'ABI_1'
      Size = 10
    end
    object QryScadCAB_1: TStringField
      FieldName = 'CAB_1'
      Size = 10
    end
    object QryScadBANCA: TStringField
      FieldName = 'BANCA'
      Size = 100
    end
    object QryScadDESCBREVE: TStringField
      FieldName = 'DESCBREVE'
    end
    object QryScadMIABANCA: TStringField
      FieldName = 'MIABANCA'
      Size = 1
    end
    object QryScadSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QryScadBANCACODSIA: TStringField
      FieldName = 'BANCACODSIA'
      Size = 5
    end
    object QryScadBANCANOMESUPPORTO: TStringField
      FieldName = 'BANCANOMESUPPORTO'
    end
    object QryScadBANCACC: TStringField
      FieldName = 'BANCACC'
      Size = 12
    end
    object QryScadBANCACIN: TStringField
      FieldName = 'BANCACIN'
      Size = 1
    end
    object QryScadBANCABIC: TStringField
      FieldName = 'BANCABIC'
      Size = 11
    end
    object QryScadBANCAIBAN: TStringField
      FieldName = 'BANCAIBAN'
      Size = 34
    end
  end
end
