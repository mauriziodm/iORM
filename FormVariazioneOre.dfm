object VariazioneOreForm: TVariazioneOreForm
  Left = 509
  Top = 455
  BorderStyle = bsSingle
  Caption = 'Variazione manodopera'
  ClientHeight = 383
  ClientWidth = 521
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 50
    Top = 61
    Width = 157
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo orario normale'
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
  object Label1: TLabel
    Left = 50
    Top = 125
    Width = 157
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo orario straordinario'
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
    Left = 50
    Top = 173
    Width = 157
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo orario permessi'
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
  object Label3: TLabel
    Left = 50
    Top = 221
    Width = 157
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo orario ferie'
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
  object Label4: TLabel
    Left = 50
    Top = 269
    Width = 157
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo orario trasferte'
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
  object Label5: TLabel
    Left = 10
    Top = 16
    Width = 501
    Height = 19
    Alignment = taCenter
    Caption = 
      'Variazione del costo orario delle righe di manodopera selezionat' +
      'e.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 213
    Top = 58
    Width = 10
    Height = 1
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object Shape2: TShape
    Left = 213
    Top = 308
    Width = 10
    Height = 1
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object Shape3: TShape
    Left = 222
    Top = 58
    Width = 1
    Height = 250
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object Shape4: TShape
    Left = 222
    Top = 177
    Width = 21
    Height = 1
    Brush.Color = clBlue
    Pen.Color = clBlue
  end
  object Label8: TLabel
    Left = 243
    Top = 193
    Width = 214
    Height = 16
    Alignment = taCenter
    Caption = 'NB: Se alcuni valori non saranno'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 243
    Top = 209
    Width = 186
    Height = 16
    Alignment = taCenter
    Caption = 'specificati verr'#224' utilizzato il '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 243
    Top = 225
    Width = 150
    Height = 16
    Alignment = taCenter
    Caption = '"costo orario normale".'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 242
    Top = 152
    Width = 247
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Richiama i dati del dipendente'
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
  object fCostoOrarioNormale: TcxCurrencyEdit
    Left = 49
    Top = 73
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
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
    TabOrder = 0
    Width = 159
  end
  object fCostoOrarioStraordinario: TcxCurrencyEdit
    Left = 49
    Top = 137
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
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
    TabOrder = 1
    Width = 159
  end
  object fCostoOrarioPermessi: TcxCurrencyEdit
    Left = 49
    Top = 185
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
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
    Width = 159
  end
  object fCostoOrarioFerie: TcxCurrencyEdit
    Left = 49
    Top = 233
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
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
    TabOrder = 3
    Width = 159
  end
  object fCostoOrarioTrasferte: TcxCurrencyEdit
    Left = 49
    Top = 281
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00;-,0.00'
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
    TabOrder = 4
    Width = 159
  end
  object ButtonOk: TBitBtn
    Left = 146
    Top = 337
    Width = 105
    Height = 33
    Caption = 'OK'
    Default = True
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
    TabOrder = 5
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TBitBtn
    Left = 264
    Top = 337
    Width = 105
    Height = 33
    Cancel = True
    Caption = 'Annulla'
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
    ModalResult = 2
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
  end
  object fRichiamaDipendente: TcxComboBox
    Left = 241
    Top = 164
    Cursor = crHandPoint
    ParentFont = False
    Properties.DropDownAutoWidth = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownWidth = 249
    Properties.Sorted = True
    Properties.OnEditValueChanged = fRichiamaDipendentePropertiesEditValueChanged
    Properties.OnInitPopup = fRichiamaDipendentePropertiesInitPopup
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.ButtonStyle = btsUltraFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Width = 249
  end
  object T: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    Isolation = tiConcurrency
    Left = 344
    Top = 72
  end
  object Q: TIBOQuery
    Params = <
      item
        DataType = ftFloat
        Name = 'P_COSTOORARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTOSTRAORDINARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTOPERMESSI'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTOFERIE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTOTRASFERTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TIPODOC'
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
      end
      item
        DataType = ftString
        Name = 'P_REGISTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_NUMRIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_NUMRIGO2'
        ParamType = ptInput
      end>
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    IB_Transaction = T
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'UPDATE RAPGIORNRIGHI SET'
      ''
      '  COSTOORARIO = :P_COSTOORARIO,'
      '  IMPORTOCOSTOORARIO = :P_COSTOORARIO * QTA,'
      ''
      '  COSTOSTRAORDINARIO = :P_COSTOSTRAORDINARIO,'
      
        '  IMPORTOSTRAORDINARIO = :P_COSTOSTRAORDINARIO * QTASTRAORDINARI' +
        'O,'
      ''
      '  COSTOPERMESSI = :P_COSTOPERMESSI,'
      '  IMPORTOPERMESSI = :P_COSTOPERMESSI * QTAPERMESSI,'
      ''
      '  COSTOFERIE = :P_COSTOFERIE,'
      '  IMPORTOFERIE = :P_COSTOFERIE * QTAFERIE,'
      ''
      '  COSTOTRASFERTE = :P_COSTOTRASFERTE,'
      '  IMPORTOTRASFERTE = :P_COSTOTRASFERTE * QTATRASFERTE'
      ''
      'WHERE'
      '  TIPODOC = :P_TIPODOC'
      '  AND NUMDOC = :P_NUMDOC'
      '  AND DATADOC = :P_DATADOC'
      '  AND REGISTRO = :P_REGISTRO'
      '  AND NUMRIGO = :P_NUMRIGO'
      '  AND NUMRIGO2 = :P_NUMRIGO2')
    FieldOptions = []
    Left = 312
    Top = 72
  end
end
