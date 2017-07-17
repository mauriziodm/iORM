object MicroMaterialView: TMicroMaterialView
  Left = 0
  Top = 0
  Width = 451
  Height = 103
  TabOrder = 0
  DesignSize = (
    451
    103)
  object ClientArea: TPanel
    Left = 3
    Top = 4
    Width = 445
    Height = 94
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = 16768443
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 93
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 445
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
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
      Height = 62
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
      ExplicitHeight = 61
    end
    object PanelProcessCost: TPanel
      Left = 323
      Top = 32
      Width = 65
      Height = 62
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      ExplicitHeight = 61
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
      Height = 62
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      ExplicitHeight = 61
    end
    object PanelTime: TPanel
      Left = 65
      Top = 32
      Width = 65
      Height = 62
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 4
      ExplicitHeight = 61
    end
    object PanelCost: TPanel
      Left = 0
      Top = 32
      Width = 65
      Height = 62
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 5
      ExplicitHeight = 61
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
        ExplicitHeight = 48
        Height = 49
        Width = 65
        AnchorX = 33
        AnchorY = 38
      end
    end
    object Panel2: TPanel
      Left = 195
      Top = 32
      Width = 65
      Height = 62
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 6
      ExplicitHeight = 61
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
