object QtaArticoloForm: TQtaArticoloForm
  Left = 14
  Top = 480
  BorderStyle = bsDialog
  Caption = 'Quantit'#224' articolo'
  ClientHeight = 319
  ClientWidth = 559
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 231
    Top = 76
    Width = 98
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Qt'#224
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 89
    Top = 380
    Width = 118
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Prezzo unitario'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object Label3: TLabel
    Left = 206
    Top = 380
    Width = 68
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sconto 1'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object Label4: TLabel
    Left = 273
    Top = 380
    Width = 68
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sconto 2'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object Label5: TLabel
    Left = 340
    Top = 380
    Width = 68
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sconto 3'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object Label6: TLabel
    Left = 159
    Top = 20
    Width = 379
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descrizione'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label7: TLabel
    Left = 21
    Top = 20
    Width = 139
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Codice'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = 16762566
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object fUM: TLabel
    Left = 163
    Top = 92
    Width = 58
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Pz'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 228
    Top = 136
    Width = 105
    Height = 33
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
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
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object fPrezzoUnitario: TcxCurrencyEdit
    Left = 88
    Top = 392
    ParentFont = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Visible = False
    Width = 120
  end
  object fQta: TcxCurrencyEdit
    Left = 230
    Top = 88
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 4
    Properties.UseLeftAlignmentOnEditing = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    OnKeyPress = fQtaKeyPress
    Width = 100
  end
  object fSconto1: TcxCurrencyEdit
    Left = 205
    Top = 392
    ParentFont = False
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 2
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Visible = False
    Width = 70
  end
  object fSconto2: TcxCurrencyEdit
    Left = 272
    Top = 392
    ParentFont = False
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 2
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Visible = False
    Width = 70
  end
  object fSconto3: TcxCurrencyEdit
    Left = 339
    Top = 392
    ParentFont = False
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 2
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Visible = False
    Width = 70
  end
  object fDescrizione: TcxTextEdit
    Left = 158
    Top = 32
    ParentColor = True
    ParentFont = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Width = 381
  end
  object fCodice: TcxTextEdit
    Left = 21
    Top = 32
    ParentColor = True
    ParentFont = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Width = 140
  end
  object eNote: TcxMemo
    Left = 22
    Top = 192
    TabStop = False
    Lines.Strings = (
      '')
    ParentFont = False
    Properties.ReadOnly = True
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsNone
    Style.Color = 16757683
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
    Height = 105
    Width = 517
  end
  object EvitaFalsiInvio: TTimer
    Enabled = False
    Interval = 100
    Left = 64
    Top = 80
  end
  object Qry: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'P_CODICEARTICOLO'
        ParamType = ptInput
      end>
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT A.DATAULTMOD_COSTO, A.DATAULTMOD_VENDITA, A.DATAULTMOD_LI' +
        'STINO'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=-1 AND Codice3=-1 AND Codice4=-1 AND Codice5=-1' +
        ' AND Codice6=-1) AS VARCHAR(150)) AS GRUPPO1'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=-1 AND Codice4=-1 A' +
        'ND Codice5=-1 AND Codice6=-1) AS VARCHAR(150)) AS GRUPPO2'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND' +
        ' Codice4=-1 AND Codice5=-1 AND Codice6=-1) AS VARCHAR(150)) AS G' +
        'RUPPO3'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND' +
        ' Codice4=A.CodiceGruppo4 AND Codice5=-1 AND Codice6=-1) AS VARCH' +
        'AR(150)) AS GRUPPO4'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND' +
        ' Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6' +
        '=-1) AS VARCHAR(150)) AS GRUPPO5'
      
        ' ,CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGru' +
        'ppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND' +
        ' Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6' +
        '=A.CodiceGruppo6) AS VARCHAR(150)) AS GRUPPO6'
      'FROM ARTICOLI A'
      'WHERE A.CODICEARTICOLO = :P_CODICEARTICOLO')
    FieldOptions = []
    Left = 56
    Top = 128
    object QryDATAULTMOD_COSTO: TDateTimeField
      FieldName = 'DATAULTMOD_COSTO'
    end
    object QryDATAULTMOD_VENDITA: TDateTimeField
      FieldName = 'DATAULTMOD_VENDITA'
    end
    object QryDATAULTMOD_LISTINO: TDateTimeField
      FieldName = 'DATAULTMOD_LISTINO'
    end
    object QryGRUPPO1: TStringField
      FieldName = 'GRUPPO1'
      ReadOnly = True
      Size = 150
    end
    object QryGRUPPO2: TStringField
      FieldName = 'GRUPPO2'
      ReadOnly = True
      Size = 150
    end
    object QryGRUPPO3: TStringField
      FieldName = 'GRUPPO3'
      ReadOnly = True
      Size = 150
    end
    object QryGRUPPO4: TStringField
      FieldName = 'GRUPPO4'
      ReadOnly = True
      Size = 150
    end
    object QryGRUPPO5: TStringField
      FieldName = 'GRUPPO5'
      ReadOnly = True
      Size = 150
    end
    object QryGRUPPO6: TStringField
      FieldName = 'GRUPPO6'
      ReadOnly = True
      Size = 150
    end
  end
end
