object ConversioneSoggettiForm: TConversioneSoggettiForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conversione soggetti'
  ClientHeight = 485
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 113
    Width = 44
    Height = 16
    Caption = 'CODICE'
    FocusControl = eCodice
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 192
    Width = 102
    Height = 16
    Caption = 'RAGIONESOCIALE'
    FocusControl = eRagioneSociale
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 256
    Width = 245
    Height = 16
    Caption = 'COGNOME O RAG. SOC. PERSONE FISICHE'
    FocusControl = eCognome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 488
    Top = 256
    Width = 34
    Height = 16
    Caption = 'NOME'
    FocusControl = eNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 352
    Top = 320
    Width = 71
    Height = 16
    Caption = 'PARTITAIVA'
    FocusControl = ePartitaIVA
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 32
    Top = 320
    Width = 92
    Height = 16
    Caption = 'CODICEFISCALE'
    FocusControl = eCodiceFiscale
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTipoPersona: TLabel
    Left = 189
    Top = 113
    Width = 74
    Height = 14
    AutoSize = False
    Caption = 'Tipo persona'
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object LabelProgression: TLabel
    Left = 464
    Top = 129
    Width = 225
    Height = 23
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Record 0/0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 238
    Top = 32
    Width = 248
    Height = 33
    Caption = 'Conversione soggetti'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object eCodice: TcxDBSpinEdit
    Left = 32
    Top = 129
    DataBinding.DataField = 'CODICE'
    DataBinding.DataSource = DataSource1
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 121
  end
  object eRagioneSociale: TcxDBTextEdit
    Left = 32
    Top = 208
    DataBinding.DataField = 'RAGIONESOCIALE'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 657
  end
  object eCognome: TcxDBTextEdit
    Left = 32
    Top = 272
    DataBinding.DataField = 'COGNOME'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 450
  end
  object eNome: TcxDBTextEdit
    Left = 488
    Top = 272
    DataBinding.DataField = 'NOME'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 201
  end
  object ePartitaIVA: TcxDBTextEdit
    Left = 352
    Top = 336
    DataBinding.DataField = 'PARTITAIVA'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 5
    Width = 337
  end
  object eCodiceFiscale: TcxDBTextEdit
    Left = 32
    Top = 336
    DataBinding.DataField = 'CODICEFISCALE'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 305
  end
  object eTipoPersona: TcxDBRadioGroup
    Left = 181
    Top = 128
    Cursor = crHandPoint
    DataBinding.DataField = 'TIPOPERSONA'
    DataBinding.DataSource = DataSource1
    ParentFont = False
    Properties.Columns = 2
    Properties.DefaultValue = ''
    Properties.Items = <
      item
        Caption = 'Fisica'
        Value = 'F'
      end
      item
        Caption = 'Giuridica'
        Value = 'G'
      end>
    Properties.OnChange = eTipoPersonaPropertiesChange
    Style.BorderStyle = ebsUltraFlat
    Style.Edges = []
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 24
    Width = 242
  end
  object btnStart: TBitBtn
    Left = 238
    Top = 408
    Width = 200
    Height = 41
    Caption = 'Avvia l'#39'operazione'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 7
    OnClick = btnStartClick
  end
  object btnAnnulla: TBitBtn
    Left = 32
    Top = 408
    Width = 200
    Height = 41
    Caption = 'Annulla/Interrompi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 8
    OnClick = btnAnnullaClick
  end
  object btnNext: TBitBtn
    Left = 444
    Top = 408
    Width = 245
    Height = 41
    Caption = 'Conferma e vai al prossimo...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 9
    Visible = False
    OnClick = btnNextClick
  end
  object Qry: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    EditSQL.Strings = (
      'UPDATE CLIENTI SET'
      ' CODICE = :CODICE ,'
      ' RAGIONESOCIALE = :RAGIONESOCIALE ,'
      ' NOME = :NOME,'
      ' COGNOME = :COGNOME,'
      ' TIPOPERSONA = :TIPOPERSONA,'
      ' PARTITAIVA = :PARTITAIVA,'
      ' CODICEFISCALE = :CODICEFISCALE'
      ''
      'WHERE CODICE = :OLD_CODICE')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = ConvSoggTrans
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT CODICE, RAGIONESOCIALE, COGNOME, NOME, TIPOPERSONA, PARTI' +
        'TAIVA, CODICEFISCALE'
      'FROM CLIENTI'
      'WHERE CODICE > 0'
      'AND TIPOPERSONA <> '#39'F'#39' ')
    FieldOptions = []
    Left = 224
    Top = 8
    object QryCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QryRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QryCOGNOME: TStringField
      FieldName = 'COGNOME'
      Size = 50
    end
    object QryNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryTIPOPERSONA: TStringField
      FieldName = 'TIPOPERSONA'
      FixedChar = True
      Size = 1
    end
    object QryPARTITAIVA: TStringField
      FieldName = 'PARTITAIVA'
      Size = 16
    end
    object QryCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = Qry
    Left = 272
    Top = 8
  end
  object QryPrat: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_TIPOPERSONA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_RAGIONESOCIALE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_COGNOME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_CODICE'
        ParamType = ptInput
      end>
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    IB_Transaction = ConvSoggTrans
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'UPDATE PRATICHE SET'
      'NATURAGIURIDICARESPIMP = :P_TIPOPERSONA,'
      'RAGSOCRESPIMP = :P_RAGIONESOCIALE,'
      'COGNOMERESPIMP = :P_COGNOME,'
      'NOMERESPIMP = :P_NOME'
      'WHERE CODICERESPIMP = :P_CODICE')
    FieldOptions = []
    Left = 576
    Top = 32
  end
  object ConvSoggTrans: TIBOTransaction
    IB_Connection = DM1.DBAzienda
    Isolation = tiCommitted
    Left = 152
    Top = 8
  end
end
