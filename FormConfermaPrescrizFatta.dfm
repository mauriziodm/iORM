object ConfermaPrescrizFattaForm: TConfermaPrescrizFattaForm
  Left = 58
  Top = 259
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = ' Conferma'
  ClientHeight = 137
  ClientWidth = 632
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    632
    137)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 61
    Width = 31
    Height = 16
    Caption = 'Data'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 177
    Top = 61
    Width = 31
    Height = 16
    Caption = 'Nota'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 321
    Top = 110
    Width = 78
    Height = 16
    Caption = 'Confermi ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Conferma prescrizione risolta'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold, fsItalic]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Height = 27
    Width = 627
    AnchorX = 322
  end
  object fData: TcxDateEdit
    Left = 46
    Top = 58
    AutoSize = False
    EditValue = 0d
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.DateButtons = []
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.PostPopupValueOnTab = True
    Properties.ShowTime = False
    Properties.UseLeftAlignmentOnEditing = False
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
    TabOrder = 1
    Height = 23
    Width = 120
  end
  object fNota: TcxTextEdit
    Left = 213
    Top = 58
    ParentFont = False
    Properties.MaxLength = 60
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 405
  end
  object BtnSI: TBitBtn
    Left = 410
    Top = 103
    Width = 100
    Height = 30
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
    TabOrder = 3
    OnClick = BtnSIClick
  end
  object BtnNO: TBitBtn
    Left = 517
    Top = 103
    Width = 100
    Height = 30
    Cancel = True
    Caption = '&No'
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
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = BtnNOClick
  end
end
