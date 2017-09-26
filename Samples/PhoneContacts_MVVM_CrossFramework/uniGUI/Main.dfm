object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 581
  ClientWidth = 440
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FormsVCProvider: TioViewContextProvider
    OnRelease = FormsVCProviderioOnRelease
    OnRequest = FormsVCProviderioOnRequest
    RegisterAsDefault = True
    Left = 152
    Top = 160
  end
end
