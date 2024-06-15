object PizzaListForm: TPizzaListForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 658
  ClientWidth = 372
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
    Width = 372
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 368
    object ButtonSelect: TSpeedButton
      Left = 322
      Top = 0
      Width = 50
      Height = 40
      Action = acShowOrSelect
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
    Top = 618
    Width = 372
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 617
    ExplicitWidth = 368
    object ButtonAdd: TSpeedButton
      Left = 322
      Top = 0
      Width = 50
      Height = 40
      Action = acAdd
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 264
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
    end
  end
  object DBCtrlGridPizzas: TDBCtrlGrid
    Left = 0
    Top = 40
    Width = 372
    Height = 481
    Align = alClient
    DataSource = SourcePizzas
    PanelHeight = 96
    PanelWidth = 355
    TabOrder = 2
    RowCount = 5
    SelectedColor = 13828095
    ShowFocus = False
    ExplicitWidth = 368
    ExplicitHeight = 480
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
    end
  end
  object PanelWhere: TPanel
    Left = 0
    Top = 521
    Width = 372
    Height = 97
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 520
    ExplicitWidth = 368
    DesignSize = (
      372
      97)
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
      Left = 314
      Top = 0
      Width = 50
      Height = 45
      Action = acBuildWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 326
    end
    object ButtonClear: TSpeedButton
      Left = 314
      Top = 49
      Width = 50
      Height = 25
      Action = acClearWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 326
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
    object Label5: TLabel
      Left = 7
      Top = 69
      Width = 81
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ingred.'
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
    object DBEditWhereIngredient: TDBEdit
      Left = 94
      Top = 68
      Width = 226
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'IngredientName'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object DSPizzas: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    AsyncLoad = True
    AsyncPersist = True
    OrderBy = '[.Name] DESC'
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
  object ActionList1: TActionList
    Left = 192
    Top = 176
    object acDelete: TioBSPersistenceDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Delete'
      TargetBindSource = DSPizzas
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSPizzas
      OnUpdateScope = usGlobal
    end
    object acShowOrSelect: TioBSShowOrSelect
      Category = 'iORM-BS'
      Caption = 'Select'
      Action_ParentCloseQueryAction = acBack
      ShowMode = smBSCurrent
      TargetBindSource = DSPizzas
      ViewContextBy = vcByDefaultViewContextProvider
    end
    object acAdd: TioBSPersistenceAppend
      Category = 'iORM-BSPersistence'
      Caption = 'Add'
      Action_ShowOrSelectAction = acShowOrSelect
      TargetBindSource = DSPizzas
    end
    object acBuildWhere: TioBSBuildWhere
      Category = 'iORM - BS - WhereBuilder'
      Caption = 'Search'
      TargetBindSource = DSWhere
    end
    object acClearWhere: TioBSClearWhere
      Category = 'iORM - BS - WhereBuilder'
      Caption = 'Clear'
      TargetBindSource = DSWhere
      AutoExec_Where_OnTargetBS = True
    end
  end
  object DSWhere: TioDataSetMaster
    AsDefault = False
    TypeName = 'TWherePizza'
    LoadType = ltCreate
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    WhereBuilderFor = DSPizzas
    Left = 103
    Top = 481
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
    object DSWhereIngredientName: TStringField
      FieldName = 'IngredientName'
      Size = 100
    end
  end
  object SourceWhere: TDataSource
    DataSet = DSWhere
    Left = 176
    Top = 481
  end
  object ioViewModelBridge1: TioViewModelBridge
    Left = 50
    Top = 50
  end
end
