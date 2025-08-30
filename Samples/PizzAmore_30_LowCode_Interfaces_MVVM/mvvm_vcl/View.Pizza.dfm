inherited ViewPizza: TViewPizza
  inherited PanelMain: TPanel
    object Label1: TLabel [0]
      Left = 10
      Top = 61
      Width = 100
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
    object Label2: TLabel [1]
      Left = 10
      Top = 101
      Width = 100
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
    object Label3: TLabel [2]
      Left = 10
      Top = 164
      Width = 100
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
    object Label4: TLabel [3]
      Left = 530
      Top = 61
      Width = 100
      Height = 25
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Image'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 7
      Top = 236
      Width = 103
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ingredients'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonAddIngredient: TSpeedButton [5]
      Left = 56
      Top = 266
      Width = 60
      Height = 33
      Action = acShowIngredientSelector
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ButtonDeleteIngredient: TSpeedButton [6]
      Left = 56
      Top = 512
      Width = 60
      Height = 33
      Action = acDeleteIngredient
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited PanelTop: TPanel
      inherited LabelTitle: TLabel
        Caption = 'Pizza'
      end
    end
    object DBEditID: TDBEdit
      Left = 122
      Top = 61
      Width = 55
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'ID'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEditName: TDBEdit
      Left = 122
      Top = 101
      Width = 250
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Name'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEditPrice: TDBEdit
      Left = 122
      Top = 164
      Width = 95
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Price'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBImage: TDBImage
      Left = 640
      Top = 61
      Width = 130
      Height = 130
      Anchors = [akTop, akRight]
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Image'
      DataSource = SourceMaster
      Stretch = True
      TabOrder = 5
    end
    object GridCustomers: TDBGrid
      Left = 122
      Top = 231
      Width = 408
      Height = 314
      Anchors = [akLeft, akTop, akBottom]
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
  end
  inherited ActionList1: TActionList
    object acShowIngredientSelector: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Add'
      Enabled = True
      Visible = True
      VMActionName = 'acShowIngredientSelector'
    end
    object acDeleteIngredient: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDeleteIngredient'
    end
  end
  inherited BSMaster: TioModelDataSet
    object MDSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object MDSMasterName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object MDSMasterPrice: TCurrencyField
      FieldName = 'Price'
    end
    object MDSMasterImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object BSIngredients: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSIngredients'
    Left = 204
    Top = 336
    object BSIngredientsIngredientName: TStringField
      FieldName = 'Ingredient.Name'
      Size = 100
    end
    object BSIngredientsIngredientUnitOfMeasure: TStringField
      FieldName = 'Ingredient.UnitOfMeasure'
      Size = 10
    end
    object BSIngredientsQty: TFloatField
      FieldName = 'Qty'
    end
  end
  object SourceIngredients: TDataSource
    DataSet = BSIngredients
    Left = 286
    Top = 338
  end
end
