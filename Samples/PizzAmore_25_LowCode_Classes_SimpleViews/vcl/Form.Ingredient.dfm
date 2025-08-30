object IngredientForm: TIngredientForm
  Left = 0
  Top = 0
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 242
  ClientWidth = 450
  Color = clBtnFace
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
    Width = 130
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
    Width = 130
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
    Width = 130
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Unit of measure'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 446
    DesignSize = (
      450
      40)
    object LabelTitle: TLabel
      Left = 0
      Top = 7
      Width = 450
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Ingredient'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
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
    object ButtonETM: TSpeedButton
      Left = 380
      Top = 0
      Width = 70
      Height = 40
      Action = acShowETM
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 390
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 202
    Width = 450
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 201
    ExplicitWidth = 446
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 40
      Action = acRevertOrDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ButtonPersist: TSpeedButton
      Left = 380
      Top = 0
      Width = 70
      Height = 40
      Action = acPersist
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 400
    end
  end
  object DBEditID: TDBEdit
    Left = 154
    Top = 61
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourceIngredient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditName: TDBEdit
    Left = 154
    Top = 101
    Width = 250
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Name'
    DataSource = SourceIngredient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditUnitOfMeasure: TDBEdit
    Left = 154
    Top = 140
    Width = 95
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'UnitOfMeasure'
    DataSource = SourceIngredient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DSIngredient: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 272
    Top = 128
    object DSIngredientID: TIntegerField
      FieldName = 'ID'
    end
    object DSIngredientName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSIngredientUnitOfMeasure: TStringField
      FieldName = 'UnitOfMeasure'
      Size = 10
    end
  end
  object SourceIngredient: TDataSource
    DataSet = DSIngredient
    Left = 272
    Top = 184
  end
  object ActionList1: TActionList
    Left = 355
    Top = 128
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSIngredient
      OnUpdateScope = usGlobal
    end
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSIngredient
    end
    object acRevertOrDelete: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      Action_CloseQueryAction = acBack
      TargetBindSource = DSIngredient
    end
    object acShowETM: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Timeline'
      Action_ParentCloseQueryAction = acBack
      EntityTypeName = 'TEtmRepository'
      ShowMode = smEntityTypeNameAsETM
      TargetBindSource = DSIngredient
      ViewContextBy = vcByDefaultViewContextProvider
      VVMTypeAlias = 'LIST'
    end
  end
end
