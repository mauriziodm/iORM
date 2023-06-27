object PizzasForm: TPizzasForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 560
  ClientWidth = 380
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object ButtonSelect: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Align = alRight
      Caption = 'Select'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonSelectClick
      ExplicitTop = -6
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Align = alLeft
      Caption = 'Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonBackClick
    end
    object LabelTitle: TLabel
      Left = 166
      Top = 7
      Width = 47
      Height = 21
      Caption = 'Pizzas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 520
    Width = 380
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonAdd: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Align = alRight
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonAddClick
      ExplicitLeft = 264
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Align = alLeft
      Caption = 'Delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonDeleteClick
      ExplicitLeft = 8
    end
  end
  object PanelWhere: TPanel
    Left = 0
    Top = 441
    Width = 380
    Height = 79
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      380
      79)
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
    object ButtonSearch: TSpeedButton
      Left = 326
      Top = 0
      Width = 50
      Height = 45
      Anchors = [akTop, akRight]
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = ButtonSearchClick
      ExplicitLeft = 334
    end
    object ButtonClear: TSpeedButton
      Left = 326
      Top = 49
      Width = 50
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Clear'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = ButtonClearClick
      ExplicitLeft = 334
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
      Width = 166
      Height = 25
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
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 40
    Width = 380
    Height = 401
    Align = alClient
    DataSource = SourcePizzas
    PanelHeight = 100
    PanelWidth = 363
    TabOrder = 2
    RowCount = 4
    SelectedColor = 13828095
    ShowFocus = False
    OnDblClick = ButtonSelectClick
    object DBTextName: TDBText
      Left = 99
      Top = 20
      Width = 259
      Height = 25
      DataField = 'Name'
      DataSource = SourcePizzas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = ButtonSelectClick
    end
    object DBTextPrice: TDBText
      Left = 99
      Top = 51
      Width = 259
      Height = 25
      DataField = 'Price'
      DataSource = SourcePizzas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnDblClick = ButtonSelectClick
    end
    object DBImage: TDBImage
      Left = 7
      Top = 7
      Width = 80
      Height = 80
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Image'
      DataSource = SourcePizzas
      Proportional = True
      Stretch = True
      TabOrder = 0
      OnDblClick = ButtonSelectClick
    end
  end
  object DSPizzas: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 80
    Top = 176
    object DSPizzasName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSPizzasPrice: TCurrencyField
      FieldName = 'Price'
    end
    object DSPizzasImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object SourcePizzas: TDataSource
    DataSet = DSPizzas
    Left = 80
    Top = 240
  end
  object DSWhere: TioDataSetMaster
    AsDefault = False
    TypeName = 'TWherePizza'
    LoadType = ltCreate
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    WhereBuilderFor = DSPizzas
    Left = 71
    Top = 393
    object DSWhereID: TIntegerField
      FieldName = 'ID'
    end
    object DSWhereName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSWhereFromPrice: TCurrencyField
      FieldName = 'FromPrice'
    end
    object DSWhereToPrice: TCurrencyField
      FieldName = 'ToPrice'
    end
  end
  object SourceWhere: TDataSource
    DataSet = DSWhere
    Left = 136
    Top = 393
  end
end
