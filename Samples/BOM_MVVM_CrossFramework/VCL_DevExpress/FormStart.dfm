object StartForm: TStartForm
  Left = 0
  Top = 0
  Caption = 'StartForm'
  ClientHeight = 564
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    Color = 16244682
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      895
      55)
    object ProductDetailLayout: TcxRadioGroup
      Left = 626
      Top = 4
      Anchors = [akTop, akRight]
      Caption = 'Product detail layout'
      ParentFont = False
      Properties.Columns = 3
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'No details'
          Value = 'None'
        end
        item
          Caption = 'Vertical'
          Value = 'Vertical'
        end
        item
          Caption = 'Horizontal'
          Value = 'Horizontal'
        end>
      Properties.OnChange = cxRadioGroupProductsPropertiesChange
      ItemIndex = 1
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'McSkin'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      Height = 46
      Width = 262
    end
    object ViewsLayout: TcxRadioGroup
      Left = 8
      Top = 4
      Caption = 'Views layout'
      ParentFont = False
      Properties.Columns = 3
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'Windows'
          Value = 'Windows'
        end
        item
          Caption = 'Pages'
          Value = 'Pages'
        end>
      Properties.OnChange = ViewsLayoutPropertiesChange
      ItemIndex = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'McSkin'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
      Height = 46
      Width = 185
    end
  end
  object SQLIteConn: TioSQLiteConnectionDef
    OnAfterRegister = SQLIteConnAfterRegister
    AutoCreateDatabase = True
    Database = 'BOM.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 152
    Top = 80
  end
  object WindowsVCProvider: TioViewContextProvider
    OnRelease = WindowsVCProviderioOnRelease
    OnRequest = WindowsVCProviderioOnRequest
    RegisterAsDefault = True
    Left = 152
    Top = 136
  end
  object PagesVCProviders: TioViewContextProvider
    OnRelease = PagesVCProvidersioOnRelease
    OnRequest = PagesVCProvidersioOnRequest
    RegisterAsDefault = False
    Left = 152
    Top = 192
  end
  object ioVCL1: TioVCL
    Left = 152
    Top = 256
  end
end
