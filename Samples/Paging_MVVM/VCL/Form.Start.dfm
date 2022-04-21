object StartForm: TStartForm
  Left = 0
  Top = 0
  Caption = 'Paging MVVM - VCL'
  ClientHeight = 546
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 14211288
    ParentBackground = False
    TabOrder = 0
    object ButtonCreateItems: TSpeedButton
      Left = 638
      Top = 9
      Width = 77
      Height = 23
      Caption = 'Create items'
      OnClick = ButtonCreateItemsClick
    end
    object ButtonShowViews: TSpeedButton
      Left = 740
      Top = 9
      Width = 77
      Height = 23
      Caption = 'Create views'
      OnClick = ButtonShowViewsClick
    end
    object EditItemsToBeCreated: TLabeledEdit
      Left = 511
      Top = 11
      Width = 121
      Height = 21
      EditLabel.Width = 498
      EditLabel.Height = 13
      EditLabel.Caption = 
        'To create sample data type how many items you want to create the' +
        'n click on the "Create items" button '
      LabelPosition = lpLeft
      TabOrder = 0
      Text = ''
    end
  end
  object ScrollBoxClientArea: TScrollBox
    Left = 0
    Top = 41
    Width = 827
    Height = 505
    Align = alClient
    AutoSize = True
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object ioVCL1: TioVCL
    Left = 120
    Top = 64
  end
  object SQLiteConn: TioSQLiteConnectionDef
    AutoCreateDB.Enabled = True
    Database = 'PagingArticles.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 120
    Top = 128
  end
  object VCProvider: TioViewContextProvider
    OnAfterRequest = VCProviderAfterRequest
    OnRequest = VCProviderRequest
    RegisterAsDefault = True
    Left = 120
    Top = 184
  end
end
