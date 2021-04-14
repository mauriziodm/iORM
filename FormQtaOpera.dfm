object QtaOperaForm: TQtaOperaForm
  Left = 754
  Top = 528
  BorderStyle = bsDialog
  Caption = 'Manodopera'
  ClientHeight = 317
  ClientWidth = 470
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 188
    Top = 76
    Width = 98
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ore'
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
    Caption = 'Dipendente'
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
    Top = 20
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
  object Label2: TLabel
    Left = 22
    Top = 141
    Width = 426
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Note'
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
  object BitBtn1: TBitBtn
    Left = 184
    Top = 264
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
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object fQta: TcxCurrencyEdit
    Left = 187
    Top = 88
    EditValue = 1.000000000000000000
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
    TabOrder = 0
    Width = 100
  end
  object fDescrizione: TcxTextEdit
    Left = 128
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
    TabOrder = 4
    Width = 321
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
    TabOrder = 3
    Width = 110
  end
  object fNote: TcxMemo
    Left = 21
    Top = 153
    ParentFont = False
    Properties.WantReturns = False
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 89
    Width = 428
  end
end
