object EtichetteFastReportForm: TEtichetteFastReportForm
  Left = 0
  Top = 0
  Caption = 'EtichetteFastReportForm'
  ClientHeight = 302
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 232
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 1
    OnClick = Button2Click
  end
  object frxReport1: TfrxReport
    Version = '4.13.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41325.420459328700000000
    ReportOptions.LastChange = 41326.689630891210000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDatasetArticoli
        DataSetName = 'DatasetArticoli'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.333333333333300000
      ColumnPositions.Strings = (
        '0'
        '63,3333333333333'
        '126,666666666667')
      object MasterData1: TfrxMasterData
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 239.370233333333200000
        DataSet = frxDBDatasetArticoli
        DataSetName = 'DatasetArticoli'
        RowCount = 0
        object DatasetArticoliCODICEARTICOLO: TfrxMemoView
          Left = 15.118120000000000000
          Top = 7.559059999999999000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODICEARTICOLO'
          DataSet = frxDBDatasetArticoli
          DataSetName = 'DatasetArticoli'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DatasetArticoli."CODICEARTICOLO"]')
          ParentFont = False
        end
        object DatasetArticoliDESCRIZIONE: TfrxMemoView
          Left = 15.118120000000000000
          Top = 34.015770000000010000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESCRIZIONE'
          DataSet = frxDBDatasetArticoli
          DataSetName = 'DatasetArticoli'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DatasetArticoli."DESCRIZIONE"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetSoggetti: TfrxDBDataset
    UserName = 'DatasetSoggetti'
    CloseDataSource = True
    DataSet = QryLabSogg
    BCDToCurrency = False
    Left = 216
  end
  object QryLabSogg: TIBOQuery
    ColumnAttributes.Strings = (
      'LABSOGG.CODICESTAZIONE=REQUIRED'
      'LABSOGG.PROGRIGO=REQUIRED')
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    Unidirectional = True
    SQL.Strings = (
      'SELECT * FROM LABSOGG')
    FieldOptions = []
    Left = 244
    object QryLabSoggCODICESTAZIONE: TStringField
      FieldName = 'CODICESTAZIONE'
      Origin = 'LABSOGG.CODICESTAZIONE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object QryLabSoggPROGRIGO: TIntegerField
      FieldName = 'PROGRIGO'
      Origin = 'LABSOGG.PROGRIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLabSoggCODICE: TIntegerField
      FieldName = 'CODICE'
      Origin = 'LABSOGG.CODICE'
    end
    object QryLabSoggRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Origin = 'LABSOGG.RAGIONESOCIALE'
      Size = 60
    end
    object QryLabSoggINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Origin = 'LABSOGG.INDIRIZZO'
      Size = 40
    end
    object QryLabSoggNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Origin = 'LABSOGG.NUMCIVICO'
      Size = 10
    end
    object QryLabSoggCITTA: TStringField
      FieldName = 'CITTA'
      Origin = 'LABSOGG.CITTA'
      Size = 25
    end
    object QryLabSoggCAP: TStringField
      FieldName = 'CAP'
      Origin = 'LABSOGG.CAP'
      Size = 5
    end
    object QryLabSoggPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Origin = 'LABSOGG.PROVINCIA'
      Size = 3
    end
    object QryLabSoggJOLLY1: TStringField
      FieldName = 'JOLLY1'
      Origin = 'LABSOGG.JOLLY1'
      Size = 100
    end
    object QryLabSoggJOLLY2: TStringField
      FieldName = 'JOLLY2'
      Origin = 'LABSOGG.JOLLY2'
      Size = 100
    end
    object QryLabSoggJOLLY3: TStringField
      FieldName = 'JOLLY3'
      Origin = 'LABSOGG.JOLLY3'
      Size = 100
    end
    object QryLabSoggJOLLY4: TStringField
      FieldName = 'JOLLY4'
      Origin = 'LABSOGG.JOLLY4'
      Size = 100
    end
    object QryLabSoggJOLLY5: TStringField
      FieldName = 'JOLLY5'
      Origin = 'LABSOGG.JOLLY5'
      Size = 100
    end
    object QryLabSoggJOLLY6: TStringField
      FieldName = 'JOLLY6'
      Origin = 'LABSOGG.JOLLY6'
      Size = 100
    end
    object QryLabSoggJOLLY7: TStringField
      FieldName = 'JOLLY7'
      Origin = 'LABSOGG.JOLLY7'
      Size = 100
    end
    object QryLabSoggJOLLY8: TStringField
      FieldName = 'JOLLY8'
      Origin = 'LABSOGG.JOLLY8'
      Size = 100
    end
    object QryLabSoggJOLLY9: TStringField
      FieldName = 'JOLLY9'
      Origin = 'LABSOGG.JOLLY9'
      Size = 100
    end
    object QryLabSoggJOLLY10: TStringField
      FieldName = 'JOLLY10'
      Origin = 'LABSOGG.JOLLY10'
      Size = 100
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 32
    Top = 88
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 112
    Top = 88
  end
  object frxDBDatasetArticoli: TfrxDBDataset
    UserName = 'DatasetArticoli'
    CloseDataSource = True
    DataSet = QryLabArt
    BCDToCurrency = False
    Left = 216
    Top = 48
  end
  object QryLabArt: TIBOQuery
    ColumnAttributes.Strings = (
      'LABSOGG.CODICESTAZIONE=REQUIRED'
      'LABSOGG.PROGRIGO=REQUIRED'
      'LABART.CODICESTAZIONE=REQUIRED'
      'LABART.PROGRIGO=REQUIRED')
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    Unidirectional = True
    SQL.Strings = (
      'SELECT * FROM LABART')
    FieldOptions = []
    Left = 244
    Top = 48
    object QryLabArtCODICESTAZIONE: TStringField
      FieldName = 'CODICESTAZIONE'
      Origin = 'LABART.CODICESTAZIONE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object QryLabArtPROGRIGO: TIntegerField
      FieldName = 'PROGRIGO'
      Origin = 'LABART.PROGRIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLabArtCODICEARTICOLO: TStringField
      FieldName = 'CODICEARTICOLO'
      Origin = 'LABART.CODICEARTICOLO'
      Size = 25
    end
    object QryLabArtDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Origin = 'LABART.DESCRIZIONE'
      Size = 45
    end
    object QryLabArtDESCRIZIONE2: TStringField
      FieldName = 'DESCRIZIONE2'
      Origin = 'LABART.DESCRIZIONE2'
      Size = 45
    end
    object QryLabArtDESCRIZIONE3: TStringField
      FieldName = 'DESCRIZIONE3'
      Origin = 'LABART.DESCRIZIONE3'
      Size = 45
    end
    object QryLabArtDESCRIZIONE4: TStringField
      FieldName = 'DESCRIZIONE4'
      Origin = 'LABART.DESCRIZIONE4'
      Size = 45
    end
    object QryLabArtDESCRIZIONE5: TStringField
      FieldName = 'DESCRIZIONE5'
      Origin = 'LABART.DESCRIZIONE5'
      Size = 45
    end
    object QryLabArtUNITADIMISURA: TStringField
      FieldName = 'UNITADIMISURA'
      Origin = 'LABART.UNITADIMISURA'
      Size = 2
    end
    object QryLabArtPREZZODIVENDITA: TIBOFloatField
      FieldName = 'PREZZODIVENDITA'
      Origin = 'LABART.PREZZODIVENDITA'
    end
    object QryLabArtPREZZODIVENDITA2: TIBOFloatField
      FieldName = 'PREZZODIVENDITA2'
      Origin = 'LABART.PREZZODIVENDITA2'
    end
    object QryLabArtPREZZODIVENDITA3: TIBOFloatField
      FieldName = 'PREZZODIVENDITA3'
      Origin = 'LABART.PREZZODIVENDITA3'
    end
    object QryLabArtPREZZODIVENDITA4: TIBOFloatField
      FieldName = 'PREZZODIVENDITA4'
      Origin = 'LABART.PREZZODIVENDITA4'
    end
    object QryLabArtPRZVENDIVACOMP1: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP1'
      Origin = 'LABART.PRZVENDIVACOMP1'
    end
    object QryLabArtPRZVENDIVACOMP2: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP2'
      Origin = 'LABART.PRZVENDIVACOMP2'
    end
    object QryLabArtPRZVENDIVACOMP3: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP3'
      Origin = 'LABART.PRZVENDIVACOMP3'
    end
    object QryLabArtPRZVENDIVACOMP4: TIBOFloatField
      FieldName = 'PRZVENDIVACOMP4'
      Origin = 'LABART.PRZVENDIVACOMP4'
    end
    object QryLabArtBARCODE: TStringField
      FieldName = 'BARCODE'
      Origin = 'LABART.BARCODE'
    end
    object QryLabArtMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'LABART.MARCA'
    end
    object QryLabArtTIPODOCUMENTO: TStringField
      FieldName = 'TIPODOCUMENTO'
      Origin = 'LABART.TIPODOCUMENTO'
      Size = 25
    end
    object QryLabArtREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = 'LABART.REGISTRO'
      Size = 5
    end
    object QryLabArtNUMORDPREV: TIntegerField
      FieldName = 'NUMORDPREV'
      Origin = 'LABART.NUMORDPREV'
    end
    object QryLabArtDATADOCUMENTO: TDateTimeField
      FieldName = 'DATADOCUMENTO'
      Origin = 'LABART.DATADOCUMENTO'
    end
    object QryLabArtCODICECLIENTE: TIntegerField
      FieldName = 'CODICECLIENTE'
      Origin = 'LABART.CODICECLIENTE'
    end
    object QryLabArtJOLLY1: TStringField
      FieldName = 'JOLLY1'
      Origin = 'LABART.JOLLY1'
      Size = 100
    end
    object QryLabArtJOLLY2: TStringField
      FieldName = 'JOLLY2'
      Origin = 'LABART.JOLLY2'
      Size = 100
    end
    object QryLabArtJOLLY3: TStringField
      FieldName = 'JOLLY3'
      Origin = 'LABART.JOLLY3'
      Size = 100
    end
    object QryLabArtJOLLY4: TStringField
      FieldName = 'JOLLY4'
      Origin = 'LABART.JOLLY4'
      Size = 100
    end
    object QryLabArtJOLLY5: TStringField
      FieldName = 'JOLLY5'
      Origin = 'LABART.JOLLY5'
      Size = 100
    end
    object QryLabArtJOLLY6: TStringField
      FieldName = 'JOLLY6'
      Origin = 'LABART.JOLLY6'
      Size = 100
    end
    object QryLabArtJOLLY7: TStringField
      FieldName = 'JOLLY7'
      Origin = 'LABART.JOLLY7'
      Size = 100
    end
    object QryLabArtJOLLY8: TStringField
      FieldName = 'JOLLY8'
      Origin = 'LABART.JOLLY8'
      Size = 100
    end
    object QryLabArtJOLLY9: TStringField
      FieldName = 'JOLLY9'
      Origin = 'LABART.JOLLY9'
      Size = 100
    end
    object QryLabArtJOLLY10: TStringField
      FieldName = 'JOLLY10'
      Origin = 'LABART.JOLLY10'
      Size = 100
    end
    object QryLabArtCODICEFORNITORE: TStringField
      FieldName = 'CODICEFORNITORE'
      Origin = 'LABART.CODICEFORNITORE'
      Size = 25
    end
    object QryLabArtDESCRIZIONEFORNITORE: TStringField
      FieldName = 'DESCRIZIONEFORNITORE'
      Origin = 'LABART.DESCRIZIONEFORNITORE'
      Size = 45
    end
  end
end
