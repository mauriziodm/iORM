object QtaArticoloGCForm: TQtaArticoloGCForm
  Left = 97
  Top = 123
  BorderStyle = bsSingle
  Caption = 'Dati articolo'
  ClientHeight = 282
  ClientWidth = 474
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 99
    Top = 173
    Width = 108
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
  object Label6: TLabel
    Left = 129
    Top = 20
    Width = 319
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
    Left = 22
    Top = 52
    Width = 108
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
  object Label8: TLabel
    Left = 22
    Top = 173
    Width = 78
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Unit'#224' di mis.'
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
  object Label9: TLabel
    Left = 263
    Top = 173
    Width = 118
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Costo unitario'
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
  object Label10: TLabel
    Left = 380
    Top = 173
    Width = 68
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ricarico %'
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
    Left = 22
    Top = 20
    Width = 108
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Data'
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
  object fQta: TcxCurrencyEdit
    Left = 98
    Top = 185
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
    TabOrder = 3
    Width = 110
  end
  object fCodice: TcxTextEdit
    Left = 21
    Top = 64
    ParentFont = False
    Properties.MaxLength = 25
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
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
    TabOrder = 0
    Width = 110
  end
  object fCostoUnitario: TcxCurrencyEdit
    Left = 262
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
    TabOrder = 4
    Width = 120
  end
  object fRicarico: TcxCurrencyEdit
    Left = 379
    Top = 185
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0%;-,0%'
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
    TabOrder = 5
    Width = 70
  end
  object fUM: TcxTextEdit
    Left = 21
    Top = 185
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.MaxLength = 2
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
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
    Height = 26
    Width = 80
  end
  object BitBtn2: TBitBtn
    Left = 243
    Top = 232
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
    TabOrder = 7
  end
  object fDescrizione: TcxMemo
    Left = 128
    Top = 32
    ParentFont = False
    Properties.MaxLength = 5000
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
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
    TabOrder = 1
    Height = 121
    Width = 321
  end
  object BitBtn1: TBitBtn
    Left = 123
    Top = 232
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
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object fData: TcxDateEdit
    Left = 21
    Top = 32
    ParentFont = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Width = 110
  end
end
