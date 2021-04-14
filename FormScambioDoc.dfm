object ScambioDocForm: TScambioDocForm
  Left = 1125
  Top = 133
  ParentCustomHint = False
  BorderStyle = bsNone
  Caption = 'ScambioDocForm'
  ClientHeight = 633
  ClientWidth = 146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TeletrasportoPanel: TPanel
    Left = 0
    Top = 0
    Width = 146
    Height = 633
    ParentCustomHint = False
    Align = alClient
    BevelOuter = bvNone
    Caption = 'TeletrasportoPanel'
    Color = clGreen
    ParentBackground = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    DesignSize = (
      146
      633)
    object ImageBottomFixed: TImage
      Left = 0
      Top = 528
      Width = 146
      Height = 105
      ParentCustomHint = False
      Align = alBottom
      AutoSize = True
      ParentShowHint = False
      ShowHint = False
      ExplicitTop = 320
    end
    object ImageStretched: TImage
      Left = 0
      Top = 105
      Width = 146
      Height = 423
      ParentCustomHint = False
      Align = alClient
      ParentShowHint = False
      ShowHint = False
      Stretch = True
      ExplicitLeft = -67
      ExplicitTop = 99
      ExplicitHeight = 215
    end
    object ImageTopFixed: TImage
      Left = 0
      Top = 0
      Width = 146
      Height = 105
      ParentCustomHint = False
      Align = alTop
      AutoSize = True
      ParentShowHint = False
      ShowHint = False
    end
    object SBChiudiTeletrasporto: TSpeedButtonRollOver
      Left = 10
      Top = 548
      Width = 69
      Height = 63
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      OnClick = SBChiudiTeletrasportoClick
      ExplicitTop = 340
    end
    object SendLV: TListView
      Left = 2
      Top = 123
      Width = 92
      Height = 139
      BorderStyle = bsNone
      Color = 1532927
      Columns = <>
      Ctl3D = False
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FlatScrollBars = True
      HotTrackStyles = [htHandPoint]
      IconOptions.AutoArrange = True
      MultiSelect = True
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenuSend
      ShowHint = False
      TabOrder = 0
      OnAdvancedCustomDraw = SendLVAdvancedCustomDraw
      OnDragOver = SendLVDragOver
      OnKeyUp = ReceiveLVKeyUp
    end
    object ReceiveLV: TListView
      Left = 2
      Top = 296
      Width = 92
      Height = 206
      CustomHint = BalloonHint
      Anchors = [akLeft, akTop, akBottom]
      BorderStyle = bsNone
      Color = 1532927
      Columns = <>
      Ctl3D = False
      DoubleBuffered = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FlatScrollBars = True
      HotTrackStyles = [htHandPoint]
      IconOptions.AutoArrange = True
      MultiSelect = True
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenuReceive
      ShowHint = False
      TabOrder = 1
      OnAdvancedCustomDraw = ReceiveLVAdvancedCustomDraw
      OnKeyUp = ReceiveLVKeyUp
      OnMouseDown = ReceiveLVMouseDown
      OnMouseMove = ReceiveLVMouseMove
    end
    object SBInviaDocumento: TButton
      Left = 16
      Top = 211
      Width = 75
      Height = 19
      Caption = 'Invia Doc.'
      TabOrder = 2
      Visible = False
      OnClick = SBInviaDocumentoClick
    end
    object SBRiceviDocumento: TButton
      Left = 16
      Top = 225
      Width = 75
      Height = 19
      Caption = 'Ricevi Doc.'
      TabOrder = 3
      Visible = False
      OnClick = SBRiceviDocumentoClick
    end
    object SBRefreshFTP: TButton
      Left = 16
      Top = 250
      Width = 75
      Height = 19
      Caption = 'Refresh'
      TabOrder = 4
      Visible = False
      OnClick = SBRefreshFTPClick
    end
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    OnDisconnected = IdFTP1Disconnected
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    Host = 'www.levantesw.it'
    Passive = True
    ConnectTimeout = 0
    Password = 'tappami652'
    TransferType = ftBinary
    Username = 'trasferimento'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 16
    Top = 8
  end
  object CloseTimer: TTimer
    Enabled = False
    OnTimer = CloseTimerTimer
    Left = 8
    Top = 48
  end
  object AutoRefresh: TTimer
    Enabled = False
    Interval = 0
    OnTimer = AutoRefreshTimer
    Left = 40
    Top = 48
  end
  object ZLB1: TZLBArchive
    CompressionLevel = fcMaximum
    Left = 16
    Top = 96
  end
  object PopupMenuSend: TPopupMenu
    Left = 56
    Top = 152
    object Refresh2: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
    object Eliminavociselezionate1: TMenuItem
      Caption = 'Elimina voci selezionate'
      OnClick = Eliminavociselezionate1Click
    end
  end
  object PopupMenuReceive: TPopupMenu
    Left = 48
    Top = 312
    object Refresh1: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
    object Eliminavociselezionate2: TMenuItem
      Caption = 'Elimina/Nascondi voci selezionate'
      OnClick = Eliminavociselezionate2Click
    end
  end
  object BalloonHint: TBalloonHint
    Style = bhsStandard
    Delay = 0
    HideAfter = 5000
    Left = 32
    Top = 376
  end
end
