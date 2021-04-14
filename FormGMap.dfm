object GmapForm: TGmapForm
  Left = 13
  Top = 10
  Align = alClient
  BorderStyle = bsNone
  Caption = 'GmapForm'
  ClientHeight = 423
  ClientWidth = 630
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  ExplicitWidth = 320
  ExplicitHeight = 240
  DesignSize = (
    630
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 137
    Align = alTop
    TabOrder = 0
    Visible = False
    DesignSize = (
      630
      137)
    object LabelAddress: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Address'
    end
    object LabelLatitude: TLabel
      Left = 8
      Top = 95
      Width = 38
      Height = 13
      Caption = 'Latitude'
    end
    object LabelLongitude: TLabel
      Left = 135
      Top = 91
      Width = 47
      Height = 13
      Caption = 'Longitude'
    end
    object ButtonGotoLocation: TButton
      Left = 262
      Top = 106
      Width = 99
      Height = 25
      Caption = 'Go to Location '
      TabOrder = 0
      OnClick = ButtonGotoLocationClick
    end
    object MemoAddress: TMemo
      Left = 6
      Top = 27
      Width = 512
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object ButtonGotoAddress: TButton
      Left = 524
      Top = 27
      Width = 99
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Go to Address'
      TabOrder = 2
      OnClick = ButtonGotoAddressClick
    end
    object Longitude: TEdit
      Left = 135
      Top = 110
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '-80.135694'
    end
    object Latitude: TEdit
      Left = 8
      Top = 110
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '25.767314'
    end
    object CheckBoxTraffic: TCheckBox
      Left = 383
      Top = 110
      Width = 58
      Height = 17
      Caption = 'Traffic'
      TabOrder = 5
      OnClick = CheckBoxTrafficClick
    end
    object CheckBoxBicycling: TCheckBox
      Left = 447
      Top = 110
      Width = 58
      Height = 17
      Caption = 'Bicycling'
      TabOrder = 6
      OnClick = CheckBoxBicyclingClick
    end
    object CheckBoxStreeView: TCheckBox
      Left = 520
      Top = 110
      Width = 97
      Height = 17
      Caption = 'Street View'
      TabOrder = 7
      OnClick = CheckBoxStreeViewClick
    end
    object ButtonClearMarkers: TButton
      Left = 634
      Top = 106
      Width = 101
      Height = 25
      Caption = 'Clear Markers'
      TabOrder = 8
      OnClick = ButtonClearMarkersClick
    end
    object Button1: TButton
      Left = 656
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Fit'
      TabOrder = 9
      OnClick = Button1Click
    end
  end
  object PanelMap: TPanel
    Left = 32
    Top = 152
    Width = 550
    Height = 115
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 550
      Height = 115
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C000000D8380000E30B00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 24
    Top = 144
  end
end
