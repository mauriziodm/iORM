inherited ModelBaseAllegatiForm: TModelBaseAllegatiForm
  Caption = 'ModelBaseAllegatiForm'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Width = 681
    Height = 141
    ExplicitWidth = 681
    ExplicitHeight = 141
  end
  object FormMainPanel: TPanel
    Left = 56
    Top = 232
    Width = 537
    Height = 369
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object PanelAllegati: TPanel
      Left = 0
      Top = 328
      Width = 537
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
    end
    object SplitterAllegati: TcxSplitter
      Left = 0
      Top = 320
      Width = 8
      Height = 8
      Cursor = crVSplit
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 10
      AlignSplitter = salBottom
      AutoPosition = False
      PositionAfterOpen = 165
      AutoSnap = True
      MinSize = 10
      ResizeUpdate = True
      Control = PanelAllegati
      Color = 16768991
      ParentColor = False
    end
  end
end
