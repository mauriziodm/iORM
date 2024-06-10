object OrderListForm: TOrderListForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 560
  ClientWidth = 611
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
    Width = 611
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 607
    object ButtonSelect: TSpeedButton
      Left = 561
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
      Left = 279
      Top = 8
      Width = 50
      Height = 21
      Caption = 'Orders'
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
    Width = 611
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 519
    ExplicitWidth = 607
    object ButtonAdd: TSpeedButton
      Left = 561
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
      ExplicitLeft = 473
      ExplicitTop = 3
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
    Width = 611
    Height = 384
    Align = alClient
    DataSource = SourceOrders
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
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OrderDate'
        Title.Alignment = taCenter
        Title.Caption = 'Date'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer.Name'
        Title.Alignment = taCenter
        Title.Caption = 'Customer'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GrandTotal'
        Title.Caption = 'Grand total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OrderState'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end>
  end
  object PanelWhere: TPanel
    Left = 0
    Top = 424
    Width = 611
    Height = 96
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 423
    ExplicitWidth = 607
    DesignSize = (
      611
      96)
    object Label1: TLabel
      Left = 9
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
      Left = 335
      Top = 7
      Width = 79
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'From date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 121
      Top = 7
      Width = 54
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonSearch: TSpeedButton
      Left = 561
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
    end
    object ButtonClear: TSpeedButton
      Left = 561
      Top = 68
      Width = 50
      Height = 25
      Action = acClearWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 351
      Top = 39
      Width = 63
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'To date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = -5
      Top = 41
      Width = 51
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Note'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 334
      Top = 6
      Width = 1
      Height = 89
      Pen.Color = clGray
    end
    object ButtonHistory: TSpeedButton
      Left = 561
      Top = 44
      Width = 50
      Height = 25
      Action = acWhereShowHistory
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 129
      Top = 41
      Width = 86
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cust.name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 9
      Top = 73
      Width = 86
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pizza name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 351
      Top = 73
      Width = 63
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
      Left = 54
      Top = 7
      Width = 61
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'OrderID'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEditWhereFromDate: TDBEdit
      Left = 423
      Top = 6
      Width = 114
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'FromDate'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEditWhereToDate: TDBEdit
      Left = 423
      Top = 39
      Width = 114
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'ToDate'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBComboBoxWhereOrderState: TDBComboBox
      Left = 183
      Top = 4
      Width = 138
      Height = 29
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'OrderState'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      Sorted = True
      TabOrder = 1
    end
    object DBEditWhereNote: TDBEdit
      Left = 54
      Top = 41
      Width = 69
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'Note'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEditWhereCustName: TDBEdit
      Left = 221
      Top = 39
      Width = 100
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'CustomerName'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEditWherePizzaName: TDBEdit
      Left = 110
      Top = 72
      Width = 211
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      DataField = 'PizzaName'
      DataSource = SourceWhere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEditWhereIngredient: TDBEdit
      Left = 423
      Top = 73
      Width = 114
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
      TabOrder = 7
    end
  end
  object DSOrders: TioDataSetMaster
    AsDefault = True
    TypeName = 'TOrder'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 10
    Left = 56
    Top = 112
    object DSOrdersID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
    end
    object DSOrdersOrderDate: TDateField
      Alignment = taCenter
      FieldName = 'OrderDate'
    end
    object DSOrdersCustomerName: TStringField
      FieldName = 'Customer.Name'
      Size = 100
    end
    object DSOrdersGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
    object DSOrdersOrderState: TStringField
      Alignment = taCenter
      FieldName = 'OrderState'
      Size = 100
    end
  end
  object SourceOrders: TDataSource
    DataSet = DSOrders
    Left = 56
    Top = 168
  end
  object ActionList1: TActionList
    Left = 184
    Top = 112
    object acDelete: TioBSPersistenceDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Delete'
      TargetBindSource = DSOrders
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSOrders
      OnUpdateScope = usGlobal
    end
    object acShowOrSelect: TioBSShowOrSelect
      Category = 'iORM-BS'
      Caption = 'Select'
      Action_ParentCloseQueryAction = acBack
      ShowMode = smBSCurrent
      TargetBindSource = DSOrders
      ViewContextBy = vcByDefaultViewContextProvider
    end
    object acAdd: TioBSPersistenceAppend
      Category = 'iORM-BSPersistence'
      Caption = 'Add'
      Action_ShowOrSelectAction = acShowOrSelect
      TargetBindSource = DSOrders
    end
    object acWherePersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSWhere
    end
    object acWhereShowHistory: TioBSShowOrSelect
      Category = 'iORM-BS'
      Caption = 'History'
      ShowMode = smBSTypeNameAsSelector
      TargetBindSource = DSWhere
      ViewContextBy = vcByDefaultViewContextProvider
    end
    object acBuildWhere: TioBSBuildWhere
      Category = 'iORM - BS - WhereBuilder'
      Caption = 'Search'
      TargetBindSource = DSWhere
      Action_PersistAction = acWherePersist
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
    TypeName = 'TWhereOrder'
    LoadType = ltCreate
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    WhereBuilderFor = DSOrders
    AfterSelectionObject = DSWhereAfterSelectionObject
    OnReceiveSelectionFreeObject = False
    Left = 175
    Top = 360
    object DSWhereOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object DSWhereOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object DSWhereNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object DSWhereFromDate: TDateField
      Alignment = taCenter
      FieldName = 'FromDate'
    end
    object DSWhereToDate: TDateField
      Alignment = taCenter
      FieldName = 'ToDate'
    end
    object DSWhereCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 100
    end
    object DSWherePizzaName: TStringField
      FieldName = 'PizzaName'
      Size = 100
    end
    object DSWhereIngredientName: TStringField
      FieldName = 'IngredientName'
      Size = 50
    end
  end
  object SourceWhere: TDataSource
    DataSet = DSWhere
    Left = 248
    Top = 360
  end
end
