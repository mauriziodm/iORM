inherited ViewPizzaList: TViewPizzaList
  inherited PanelTop: TPanel
    inherited LabelTitle: TLabel
      Caption = 'Pizzas'
      ExplicitWidth = 47
    end
  end
  object CtrlGridPizzas: TDBCtrlGrid [2]
    Left = 0
    Top = 40
    Width = 800
    Height = 441
    Align = alClient
    DataSource = SourceMaster
    PanelHeight = 110
    PanelWidth = 783
    TabOrder = 3
    RowCount = 4
    SelectedColor = 13828095
    ShowFocus = False
    OnDblClick = CtrlGridPizzasDblClick
    object DBTextName: TDBText
      Left = 99
      Top = 20
      Width = 259
      Height = 25
      DataField = 'Name'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = CtrlGridPizzasDblClick
    end
    object DBTextPrice: TDBText
      Left = 99
      Top = 51
      Width = 259
      Height = 25
      DataField = 'Price'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnDblClick = CtrlGridPizzasDblClick
    end
    object DBImage: TDBImage
      Left = 7
      Top = 7
      Width = 80
      Height = 80
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Image'
      DataSource = SourceMaster
      Proportional = True
      Stretch = True
      TabOrder = 0
      OnDblClick = CtrlGridPizzasDblClick
    end
  end
  inherited PanelWhere: TPanel
    object Label1: TLabel
      Left = 8
      Top = 7
      Width = 17
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 98
      Top = 7
      Width = 51
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 37
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Caption = 'From price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 179
      Top = 37
      Width = 58
      Height = 21
      Alignment = taRightJustify
      Caption = 'to price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEditWhereID: TDBEdit
      Left = 43
      Top = 7
      Width = 40
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'ID'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEditWhereName: TDBEdit
      Left = 155
      Top = 6
      Width = 582
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'Name'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEditWhereFromPrice: TDBEdit
      Left = 94
      Top = 37
      Width = 80
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'FromPrice'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEditWhereToPrice: TDBEdit
      Left = 241
      Top = 37
      Width = 80
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'ToPrice'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object BSMasterPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BSMasterImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  inherited BSWhere: TioModelDataSet
    object BSWhereID: TIntegerField
      FieldName = 'ID'
    end
    object BSWhereName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSWhereFromPrice: TCurrencyField
      FieldName = 'FromPrice'
    end
    object BSWhereToPrice: TCurrencyField
      FieldName = 'ToPrice'
    end
  end
end
