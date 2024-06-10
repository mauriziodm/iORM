object PizzaForm: TPizzaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 562
  ClientWidth = 490
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 61
    Width = 55
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 101
    Width = 55
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 140
    Width = 55
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 255
    Top = 61
    Width = 55
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonLoadImage: TSpeedButton
    Left = 455
    Top = 61
    Width = 30
    Height = 30
    Action = acLoadImage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 204
    Width = 57
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Ingreds'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonAddIngredient: TSpeedButton
    Left = 8
    Top = 234
    Width = 60
    Height = 22
    Action = acShowIngredientSelector
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ButtonDeleteIngredient: TSpeedButton
    Left = 8
    Top = 491
    Width = 60
    Height = 22
    Action = acDeleteIngredient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 486
    DesignSize = (
      490
      40)
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 15
    end
    object LabelTitle: TLabel
      Left = 96
      Top = 7
      Width = 287
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Pizza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 291
    end
    object ButtonETM: TSpeedButton
      Left = 430
      Top = 0
      Width = 60
      Height = 40
      Action = acShowETM
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 358
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 522
    Width = 490
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 521
    ExplicitWidth = 486
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevertOrDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
    object ButtonPersist: TSpeedButton
      Left = 440
      Top = 0
      Width = 50
      Height = 40
      Action = acPersist
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
  end
  object DBEditID: TDBEdit
    Left = 74
    Top = 61
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditName: TDBEdit
    Left = 74
    Top = 101
    Width = 236
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Name'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditPrice: TDBEdit
    Left = 74
    Top = 140
    Width = 95
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Price'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBImage: TDBImage
    Left = 320
    Top = 61
    Width = 129
    Height = 124
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Image'
    DataSource = SourcePizza
    Stretch = True
    TabOrder = 5
  end
  object GridCustomers: TDBGrid
    Left = 74
    Top = 199
    Width = 408
    Height = 314
    DataSource = SourceIngredients
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Ingredient.Name'
        Title.Alignment = taCenter
        Title.Caption = 'Ingredient'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 241
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ingredient.UnitOfMeasure'
        Title.Alignment = taCenter
        Title.Caption = 'UM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qty'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end>
  end
  object DSPizza: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    OrderBy = '[TPizza.Name]'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 120
    Top = 312
    object DSPizzaID: TIntegerField
      FieldName = 'ID'
    end
    object DSPizzaName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSPizzaPrice: TCurrencyField
      FieldName = 'Price'
    end
    object DSPizzaImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object SourcePizza: TDataSource
    DataSet = DSPizza
    Left = 120
    Top = 368
  end
  object ActionList1: TActionList
    Left = 371
    Top = 312
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSPizza
    end
    object acRevertOrDelete: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      Action_CloseQueryAction = acBack
      TargetBindSource = DSPizza
    end
    object acLoadImage: TAction
      Caption = '...'
      OnExecute = acLoadImageExecute
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSPizza
      OnUpdateScope = usGlobal
    end
    object acShowETM: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Timeline'
      Action_ParentCloseQueryAction = acBack
      EntityTypeName = 'TEtmRepository'
      ShowMode = smEntityTypeNameAsETM
      TargetBindSource = DSPizza
      ViewContextBy = vcByDefaultViewContextProvider
      VVMTypeAlias = 'LIST'
    end
    object acShowIngredientSelector: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Add'
      Action_ParentCloseQueryAction = acBack
      EntityTypeName = 'TIngredient'
      ShowMode = smEntityTypeNameAsSelector
      TargetBindSource = DSIngredients
      ViewContextBy = vcByDefaultViewContextProvider
      VVMTypeAlias = 'LIST'
    end
    object acDeleteIngredient: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = SourceIngredients
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 368
    Top = 376
  end
  object DSIngredients: TioDataSetDetail
    AsDefault = False
    MasterBindSource = DSPizza
    MasterPropertyName = 'Ingredients'
    OnReceiveSelectionFreeObject = False
    OnSelectionObject = DSIngredientsSelectionObject
    Left = 216
    Top = 312
    object DSIngredientsIngredientName: TStringField
      FieldName = 'Ingredient.Name'
      Size = 100
    end
    object DSIngredientsIngredientUnitOfMeasure: TStringField
      FieldName = 'Ingredient.UnitOfMeasure'
      Size = 10
    end
    object DSIngredientsQty: TFloatField
      FieldName = 'Qty'
    end
  end
  object SourceIngredients: TDataSource
    DataSet = DSIngredients
    Left = 216
    Top = 368
  end
end
