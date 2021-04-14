object ForzaGiacenzeMagazzinoForm: TForzaGiacenzeMagazzinoForm
  Left = 478
  Top = 122
  BorderStyle = bsSingle
  Caption = 'Forza giacenze magazzino'
  ClientHeight = 500
  ClientWidth = 631
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    631
    500)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 10
    Top = 16
    Width = 608
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Forza giacenza magazzino'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelArticolo: TLabel
    Left = 10
    Top = 64
    Width = 608
    Height = 19
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Articolo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 104
    Width = 617
    Height = 18
    Anchors = [akLeft, akTop, akRight]
    Caption = 
      'Vorrei che alla data                                   le giance' +
      'nze di questo articolo risultassero cos'#236':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 213
    Width = 62
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Giacenza'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 144
    Top = 245
    Width = 68
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Impegnato'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 144
    Top = 277
    Width = 56
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Ordinato'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 236
    Top = 213
    Width = 16
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 236
    Top = 245
    Width = 16
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 236
    Top = 277
    Width = 16
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 144
    Top = 167
    Width = 70
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Magazzino'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 9
    Top = 336
    Width = 609
    Height = 36
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      '      Vorrei anche che i documenti precedenti alla data specific' +
      'ata non fossero pi'#249' considerati per il calcolo delle giacenze di' +
      ' magazzino di questo/i articolo/i.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label12: TLabel
    Left = 9
    Top = 376
    Width = 609
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      'NB: Mettendo la spunta su quest'#39'ultima opzione anche se si doves' +
      'se poi modificare o eliminare un documento con data precedente a' +
      ' quella specificata la giacenza rimarrebbe uguale; invece NON me' +
      'ttendo la spunta la giacenza terrebbe conto della modifica o eli' +
      'minazione del documento stesso.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
    WordWrap = True
  end
  object fGiacenza: TcxCurrencyEdit
    Left = 274
    Top = 209
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
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 110
  end
  object fImpegnato: TcxCurrencyEdit
    Left = 274
    Top = 241
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
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 110
  end
  object fOrdinato: TcxCurrencyEdit
    Left = 274
    Top = 273
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
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 110
  end
  object fData: TcxDateEdit
    Left = 151
    Top = 99
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 130
  end
  object BitBtn2: TBitBtn
    Left = 318
    Top = 448
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
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 198
    Top = 448
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
    OnClick = BitBtn1Click
  end
  object fMagazzino: TcxComboBox
    Left = 274
    Top = 164
    Cursor = crHandPoint
    ParentFont = False
    Properties.DropDownAutoWidth = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownWidth = 249
    Properties.ImmediatePost = True
    Properties.Sorted = True
    Properties.OnInitPopup = fMagazzinoPropertiesInitPopup
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.ButtonStyle = btsUltraFlat
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 249
  end
  object cxCheckBox1: TcxCheckBox
    Left = 4
    Top = 334
    Properties.Alignment = taRightJustify
    Properties.ImmediatePost = True
    Properties.OnEditValueChanged = cxCheckBox1PropertiesEditValueChanged
    TabOrder = 7
    Width = 22
  end
  object StoredProc1: TIBOStoredProc
    Params = <
      item
        DataType = ftString
        Name = 'IN_UTENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_COD_ART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_COD_MAG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IN_GIACENZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IN_IMPEGNATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IN_ORDINATO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IN_DATA_RICHIESTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_EFFETTUA_CHIUSURA'
        ParamType = ptInput
      end>
    StoredProcHasDML = True
    StoredProcName = 'MAG_SET_GIACENZA_ARTICOLO'
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    Left = 24
    Top = 168
  end
end
