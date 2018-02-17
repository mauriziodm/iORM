object StartForm: TStartForm
  Left = 0
  Top = 0
  ClientHeight = 593
  ClientWidth = 384
  Caption = 'Phone contacts'
  TitleButtons = <>
  OnCreate = UnimFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object FormsVCProvider: TioViewContextProvider
    OnRelease = FormsVCProviderRelease
    OnRequest = FormsVCProviderRequest
    RegisterAsDefault = True
    Left = 152
    Top = 160
  end
  object ioVCL1: TioVCL
    Left = 152
    Top = 232
  end
end
