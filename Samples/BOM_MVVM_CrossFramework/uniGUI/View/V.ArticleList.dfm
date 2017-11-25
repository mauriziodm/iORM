object ArticleListView: TArticleListView
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object PanelTools: TUniPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 37
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 14585439
    DesignSize = (
      451
      37)
    object ButtonNewMaterial: TUniButton
      Left = 177
      Top = 7
      Width = 85
      Height = 25
      Hint = ''
      Caption = 'New material'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      TabOrder = 1
    end
    object ButtonNewProcess: TUniButton
      Left = 268
      Top = 7
      Width = 85
      Height = 25
      Hint = ''
      Caption = 'New process'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      TabOrder = 2
    end
    object ButtonNewProduct: TUniButton
      Left = 359
      Top = 7
      Width = 85
      Height = 25
      Hint = ''
      Caption = 'New product'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      TabOrder = 3
    end
    object ButtonRefresh: TUniButton
      Left = 3
      Top = 6
      Width = 64
      Height = 25
      Hint = ''
      Caption = 'Refresh'
      ParentFont = False
      Font.Color = clGreen
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
    end
  end
  object PanelFilters: TUniPanel
    Left = 0
    Top = 223
    Width = 451
    Height = 82
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    Color = 14585439
    DesignSize = (
      451
      82)
    object RadioButtonFilterAll: TUniRadioButton
      Left = 14
      Top = 17
      Width = 92
      Height = 17
      Hint = ''
      Caption = 'All'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 1
      Group = 1000
    end
    object RadioButtonFilterMaterials: TUniRadioButton
      Left = 14
      Top = 47
      Width = 92
      Height = 17
      Hint = ''
      Caption = 'Materials'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 2
      Group = 1000
    end
    object RadioButtonFilterProcesses: TUniRadioButton
      Left = 109
      Top = 17
      Width = 92
      Height = 17
      Hint = ''
      Caption = 'Processes'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 3
      Group = 1000
    end
    object RadioButtonFilterProducts: TUniRadioButton
      Left = 109
      Top = 47
      Width = 92
      Height = 17
      Hint = ''
      Caption = 'Products'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 4
      Group = 1000
    end
    object UniLabel1: TUniLabel
      Left = 227
      Top = 15
      Width = 31
      Height = 17
      Hint = ''
      Caption = 'Code'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 5
    end
    object UniLabel2: TUniLabel
      Left = 309
      Top = 15
      Width = 66
      Height = 17
      Hint = ''
      Caption = 'Description'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 6
    end
    object ButtonSearch: TUniButton
      Left = 378
      Top = 6
      Width = 64
      Height = 68
      Hint = ''
      Caption = 'Find'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 7
    end
    object DBEditFilterCode: TUniDBEdit
      Left = 224
      Top = 35
      Width = 81
      Height = 24
      Hint = ''
      DataField = 'Code'
      DataSource = DSFilters
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 8
    end
    object DBEditFilterDescription: TUniDBEdit
      Left = 309
      Top = 35
      Width = 63
      Height = 24
      Hint = ''
      DataField = 'Description'
      DataSource = DSFilters
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 9
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 37
    Width = 451
    Height = 186
    Hint = ''
    DataSource = DSArticleList
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    ForceFit = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    ParentFont = False
    TabOrder = 2
    OnBodyDblClick = UniDBGrid1BodyDblClick
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'ID'
        Width = 25
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
      end
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 70
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
      end
      item
        FieldName = 'Description'
        Title.Caption = 'Description'
        Width = 190
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Expanded = True
      end
      item
        FieldName = 'UM'
        Title.Caption = 'UM'
        Width = 20
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
      end
      item
        FieldName = 'ArticleType'
        Title.Caption = 'ArticleType'
        Width = 59
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
        ReadOnly = True
      end
      item
        FieldName = 'CreationDateTime'
        Title.Caption = 'CreationDateTime'
        Width = 85
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
      end>
  end
  object VMBridge: TioViewModelBridge
    DI_VMInterface = 'IArticleListVM'
    Left = 88
    Top = 96
  end
  object MDSArticleList: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPArticleList'
    Left = 88
    Top = 152
    object MDSArticleListID: TIntegerField
      FieldName = 'ID'
    end
    object MDSArticleListCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSArticleListDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object MDSArticleListUM: TStringField
      FieldName = 'UM'
      Size = 10
    end
    object MDSArticleListCreationDateTime: TDateTimeField
      FieldName = 'CreationDateTime'
    end
    object MDSArticleListArticleType: TStringField
      FieldName = 'ArticleType'
      ReadOnly = True
      Size = 40
    end
  end
  object MDSFilters: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPFilters'
    Left = 88
    Top = 208
    object MDSFiltersCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSFiltersDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
  end
  object DSArticleList: TDataSource
    DataSet = MDSArticleList
    Left = 176
    Top = 152
  end
  object DSFilters: TDataSource
    DataSet = MDSFilters
    Left = 176
    Top = 208
  end
end
