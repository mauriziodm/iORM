object OrderForm: TOrderForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 562
  ClientWidth = 784
  Color = clWhite
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
  object Label1: TLabel
    Left = 5
    Top = 57
    Width = 75
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Order'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 88
    Width = 75
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Note'
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
    Width = 784
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Back'
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      784
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
    end
    object LabelTitle: TLabel
      Left = 56
      Top = 7
      Width = 681
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 481
    end
    object ButtonAdd: TSpeedButton
      Left = 734
      Top = 0
      Width = 50
      Height = 40
      Action = acSelectPizza
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 712
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 522
    Width = 784
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevert
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
      Left = 734
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
      ExplicitTop = 8
    end
    object Label6: TLabel
      Left = 206
      Top = 9
      Width = 96
      Height = 25
      AutoSize = False
      Caption = 'Grand total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 51
      Top = 0
      Width = 116
      Height = 40
      Action = acAddCustomPizza
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBEditGrandTotal: TDBEdit
      Left = 310
      Top = 7
      Width = 90
      Height = 25
      TabStop = False
      BorderStyle = bsNone
      DataField = 'GrandTotal'
      DataSource = SourceOrder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object PanelPizzas: TPanel
    Left = 434
    Top = 40
    Width = 350
    Height = 482
    Align = alRight
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 2
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 0
      Top = 0
      Width = 350
      Height = 482
      Align = alClient
      AllowDelete = False
      AllowInsert = False
      DataSource = SourcePizzas
      PanelHeight = 96
      PanelWidth = 333
      TabOrder = 0
      RowCount = 5
      SelectedColor = 13828095
      ShowFocus = False
      OnDblClick = DBCtrlGrid1DblClick
      object DBTextName: TDBText
        Left = 99
        Top = 20
        Width = 222
        Height = 25
        DataField = 'Name'
        DataSource = SourcePizzas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnDblClick = DBCtrlGrid1DblClick
      end
      object DBTextPrice: TDBText
        Left = 99
        Top = 51
        Width = 198
        Height = 25
        DataField = 'Price'
        DataSource = SourcePizzas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnDblClick = DBCtrlGrid1DblClick
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
        OnDblClick = DBCtrlGrid1DblClick
      end
    end
  end
  object DBEditID: TDBEdit
    Left = 92
    Top = 57
    Width = 30
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourceOrder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditDate: TDBEdit
    Left = 140
    Top = 57
    Width = 100
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'OrderDate'
    DataSource = SourceOrder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEditNote: TDBEdit
    Left = 92
    Top = 88
    Width = 325
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Note'
    DataSource = SourceOrder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  inline MicroViewCustomer1: TMicroViewCustomer
    Left = 0
    Top = 128
    Width = 430
    Height = 100
    Color = 16056308
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    ExplicitTop = 128
    inherited DSCustomer: TioDataSetDetail
      AsDefault = False
      MasterBindSource = DSOrder
      MasterPropertyName = 'Customer'
      Left = 275
    end
  end
  object ScrollBoxRows: TScrollBox
    Left = -8
    Top = 234
    Width = 430
    Height = 282
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    BorderStyle = bsNone
    Color = clMenu
    Ctl3D = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 7
  end
  object DSPizzas: TioDataSetMaster
    AsDefault = False
    TypeName = 'IPizza'
    SelectorFor = DSOrder
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 584
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
    AutoEdit = False
    DataSet = DSPizzas
    Left = 584
    Top = 240
  end
  object DSOrder: TioDataSetMaster
    AsDefault = True
    TypeName = 'IOrder'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    OnSelectionInterface = DSOrderSelectionInterface
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 312
    object DSOrderID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
    end
    object DSOrderOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object DSOrderNote: TStringField
      FieldName = 'Note'
      Size = 250
    end
    object DSOrderGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
  end
  object SourceOrder: TDataSource
    DataSet = DSOrder
    Left = 144
    Top = 312
  end
  object ActionList1: TActionList
    Left = 248
    Top = 312
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSOrder
    end
    object acRevert: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      TargetBindSource = DSOrder
    end
    object acSelectPizza: TioBSSelectCurrent
      Category = 'iORM-BS'
      Caption = 'Add'
      OnExecute = acSelectPizzaExecute
      TargetBindSource = DSPizzas
    end
    object acAddCustomPizza: TAction
      Caption = 'Add custom pizza'
      OnExecute = acAddCustomPizzaExecute
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      OnUpdateScope = usGlobal
      TargetBindSource = DSOrder
    end
  end
  object VCProviderOrderRows: TioViewContextProvider
    AsDefault = False
    OnAfterRequest = VCProviderOrderRowsAfterRequest
    OnRequest = VCProviderOrderRowsRequest
    Left = 253
    Top = 370
  end
  object DSRows: TioDataSetDetail
    MasterBindSource = DSOrder
    MasterPropertyName = 'Rows'
    AfterOpen = DSRowsAfterOpen
    Left = 56
    Top = 370
  end
end
