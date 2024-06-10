object IngredientListForm: TIngredientListForm
  Left = 0
  Top = 0
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 717
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 381
    object ButtonSelect: TSpeedButton
      Left = 335
      Top = 0
      Width = 50
      Height = 40
      Action = acSelectCurrent
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
      Left = 142
      Top = 7
      Width = 87
      Height = 21
      Caption = 'Ingredients'
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
    Top = 677
    Width = 385
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 676
    ExplicitWidth = 381
    object ButtonAdd: TSpeedButton
      Left = 335
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
  object GridCustomers: TDBGrid
    Left = 0
    Top = 40
    Width = 385
    Height = 637
    Align = alClient
    DataSource = SourceIngredients
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnitOfMeasure'
        Title.Alignment = taCenter
        Title.Caption = 'UM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end>
  end
  object SourceIngredients: TDataSource
    DataSet = DSIngredients
    Left = 56
    Top = 168
  end
  object ActionList1: TActionList
    Left = 183
    Top = 112
    object acDelete: TioBSPersistenceDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Delete'
      TargetBindSource = DSIngredients
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSIngredients
      OnUpdateScope = usGlobal
    end
    object acShowOrSelect: TioBSShowOrSelect
      Category = 'iORM-BS'
      Caption = 'Select'
      Action_ParentCloseQueryAction = acBack
      Action_SelectCurrentAction = acSelectCurrent
      ShowMode = smBSCurrent
      TargetBindSource = DSIngredients
      ViewContextBy = vcByDefaultViewContextProvider
    end
    object acAdd: TioBSPersistenceAppend
      Category = 'iORM-BSPersistence'
      Caption = 'Add'
      Action_ShowOrSelectAction = acShowOrSelect
      TargetBindSource = DSIngredients
    end
    object acSelectCurrent: TioBSSelectCurrent
      Category = 'iORM-BS'
      Caption = 'Select'
      TargetBindSource = DSIngredients
      Action_CloseQueryAction = acBack
    end
  end
  object DSIngredients: TioDataSetMaster
    AsDefault = True
    TypeName = 'TIngredient'
    AsyncLoad = True
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Left = 56
    Top = 112
    object DSIngredientsID: TIntegerField
      FieldName = 'ID'
    end
    object DSIngredientsName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSIngredientsUnitOfMeasure: TStringField
      FieldName = 'UnitOfMeasure'
      Size = 10
    end
  end
end
