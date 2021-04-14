inherited EtichettaEnergeticaForm: TEtichettaEnergeticaForm
  Caption = 'EtichettaEnergeticaForm'
  OnResize = FormResize
  ExplicitWidth = 727
  ExplicitHeight = 704
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 686
      Height = 586
      Align = alClient
      TabOrder = 0
      OnDownloadComplete = WebBrowser1DownloadComplete
      OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
      OnNavigateComplete2 = WebBrowser1NavigateComplete2
      OnDocumentComplete = WebBrowser1DocumentComplete
      OnNavigateError = WebBrowser1NavigateError
      ExplicitLeft = 304
      ExplicitTop = 200
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000E6460000913C00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
