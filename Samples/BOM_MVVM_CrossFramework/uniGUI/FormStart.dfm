object StartForm: TStartForm
  Left = 0
  Top = 0
  ClientHeight = 509
  ClientWidth = 767
  Caption = 'StartForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTools: TUniPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 55
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 14585439
  end
  object VCProvider: TioViewContextProvider
    OnRelease = VCProviderRelease
    OnRequest = VCProviderRequest
    RegisterAsDefault = True
    Left = 144
    Top = 96
  end
  object ioVCL1: TioVCL
    Left = 144
    Top = 152
  end
end
