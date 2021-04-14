object FatturaImpegniForm: TFatturaImpegniForm
  Left = 353
  Top = 384
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = ' Conferma'
  ClientHeight = 221
  ClientWidth = 494
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    494
    221)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 64
    Top = 185
    Width = 205
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = 'Procedere con l'#39'operazione?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 95
    ExplicitTop = 202
  end
  object Label1: TLabel
    Left = 8
    Top = 87
    Width = 478
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Data di fatturazione'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDataUltimaFatturaEmessa: TLabel
    Left = 8
    Top = 138
    Width = 478
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Data ultima fattura emessa:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 9
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Chiusura automatica'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Height = 27
    Width = 478
    AnchorX = 247
  end
  object BtnSI: TBitBtn
    Left = 275
    Top = 179
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'SI'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    TabOrder = 1
    OnClick = BtnSIClick
  end
  object BtnAnnulla: TBitBtn
    Left = 381
    Top = 179
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Annulla'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BtnAnnullaClick
  end
  object eDataFatturazione: TcxDateEdit
    Left = 185
    Top = 109
    ParentFont = False
    Properties.DateButtons = [btnClear, btnToday]
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.WeekNumbers = True
    Properties.OnEditValueChanged = eDataFatturazionePropertiesEditValueChanged
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 33
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '(chiamate, appuntamenti e interventi)'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Height = 27
    Width = 478
    AnchorX = 247
  end
end
