object MicroMaterialView: TMicroMaterialView
  Left = 0
  Top = 0
  Width = 451
  Height = 100
  Align = alClient
  TabOrder = 0
  ExplicitHeight = 305
  DesignSize = (
    451
    100)
  object ClientArea: TPanel
    Left = 3
    Top = 4
    Width = 445
    Height = 93
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = 16768443
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 298
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 445
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 388
      object cxDBLabel2: TcxDBLabel
        Left = 0
        Top = 0
        Align = alLeft
        DataBinding.DataField = 'Code'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        Height = 32
        Width = 89
        AnchorY = 16
      end
      object ButtonShow: TcxButton
        Left = 388
        Top = 0
        Width = 57
        Height = 32
        Align = alRight
        Caption = 'Show'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'McSkin'
        TabOrder = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 331
      end
      object cxDBLabel1: TcxDBLabel
        Left = 89
        Top = 0
        Align = alClient
        DataBinding.DataField = 'Description'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        ExplicitWidth = 191
        Height = 32
        Width = 248
        AnchorY = 16
      end
      object cxDBLabel4: TcxDBLabel
        Left = 337
        Top = 0
        Align = alRight
        DataBinding.DataField = 'UM'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        ExplicitLeft = 280
        Height = 32
        Width = 51
        AnchorX = 363
        AnchorY = 16
      end
    end
    object ButtonPost: TcxButton
      Left = 388
      Top = 32
      Width = 57
      Height = 61
      Align = alRight
      Caption = 'Post'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 331
      ExplicitHeight = 62
    end
    object PanelProcessCost: TPanel
      Left = 323
      Top = 32
      Width = 65
      Height = 61
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      ExplicitLeft = 266
      ExplicitHeight = 62
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 65
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Qty'
        ExplicitWidth = 18
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 1
        Top = 19
        AutoSize = False
        DataBinding.DataField = 'Qty'
        DataBinding.DataSource = DSItem
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'McSkin'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'McSkin'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'McSkin'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'McSkin'
        TabOrder = 0
        Height = 39
        Width = 58
      end
    end
    object PanelMaterialCost: TPanel
      Left = 130
      Top = 32
      Width = 65
      Height = 61
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      ExplicitHeight = 62
    end
    object PanelTime: TPanel
      Left = 65
      Top = 32
      Width = 65
      Height = 61
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 4
      ExplicitHeight = 62
    end
    object PanelCost: TPanel
      Left = 0
      Top = 32
      Width = 65
      Height = 61
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 5
      ExplicitHeight = 62
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 65
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Cost'
        ExplicitWidth = 22
      end
      object cxDBLabel3: TcxDBLabel
        Left = 0
        Top = 13
        Align = alClient
        DataBinding.DataField = 'Cost'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        ExplicitHeight = 49
        Height = 48
        Width = 65
        AnchorX = 33
        AnchorY = 37
      end
    end
    object Panel2: TPanel
      Left = 195
      Top = 32
      Width = 65
      Height = 61
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 6
      ExplicitHeight = 62
    end
  end
  object MicroVMBridge: TioViewModelBridge
    Left = 35
    Top = 28
  end
  object MDSItem: TioModelDataSet
    ViewModelBridge = MicroVMBridge
    ModelPresenter = 'MPBOMItem'
    Left = 109
    Top = 12
    object MDSItemQty: TFloatField
      FieldName = 'Qty'
    end
  end
  object MDSArticle: TioModelDataSet
    ViewModelBridge = MicroVMBridge
    ModelPresenter = 'MPBOMArticle'
    Left = 197
    Top = 12
    object MDSArticleCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSArticleDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object MDSArticleUM: TStringField
      FieldName = 'UM'
      Size = 10
    end
    object MDSArticleCost: TCurrencyField
      FieldName = 'Cost'
    end
  end
  object DSItem: TDataSource
    DataSet = MDSItem
    Left = 108
    Top = 52
  end
  object DSArticle: TDataSource
    DataSet = MDSArticle
    Left = 196
    Top = 52
  end
end
