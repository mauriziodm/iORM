inherited ViewOrder: TViewOrder
  OnCreate = UniFrameCreate
  inherited PanelTop: TUniPanel
    inherited LabelTitle: TUniLabel
      Caption = 'Order'
    end
  end
  inherited PanelBottom: TUniPanel
    object DBEditGrandTotal: TUniDBEdit
      Left = 301
      Top = 3
      Width = 116
      Height = 28
      Hint = ''
      DataField = 'GrandTotal'
      DataSource = BSSource
      ParentFont = False
      Font.Height = -19
      TabOrder = 3
      BorderStyle = ubsNone
    end
    object UniLabel6: TUniLabel
      Left = 190
      Top = 4
      Width = 91
      Height = 21
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Grand total'
      ParentFont = False
      Font.Color = clNavy
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 4
    end
  end
  object PanelPizzas: TUniPanel [2]
    Left = 450
    Top = 40
    Width = 350
    Height = 520
    Hint = ''
    Align = alRight
    TabOrder = 2
    Caption = ''
  end
  object UniLabel1: TUniLabel [3]
    Left = 5
    Top = 57
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Order'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 3
  end
  object DBEditID: TUniDBEdit [4]
    Left = 92
    Top = 57
    Width = 30
    Height = 25
    Hint = ''
    DataField = 'ID'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 4
    BorderStyle = ubsNone
  end
  object UniLabel2: TUniLabel [5]
    Left = 220
    Top = 57
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Status'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 6
  end
  object DBEditDate: TUniDBEdit [6]
    Left = 140
    Top = 57
    Width = 100
    Height = 25
    Hint = ''
    DataField = 'OrderDate'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 5
    BorderStyle = ubsNone
  end
  object LabelNote: TUniLabel [7]
    Left = 5
    Top = 88
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Note'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 7
  end
  object DBEditNote: TUniDBEdit [8]
    Left = 92
    Top = 88
    Width = 325
    Height = 25
    Hint = ''
    DataField = 'Note'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 8
    BorderStyle = ubsNone
  end
  object UniLabel3: TUniLabel [9]
    Left = 5
    Top = 136
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Customer'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 9
  end
  object DBEditCustID: TUniDBEdit [10]
    Left = 92
    Top = 136
    Width = 30
    Height = 25
    Hint = ''
    DataField = 'ID'
    DataSource = SourceCustomer
    ParentFont = False
    Font.Height = -16
    TabOrder = 10
    BorderStyle = ubsNone
  end
  object DBEditCustName: TUniDBEdit [11]
    Left = 128
    Top = 136
    Width = 261
    Height = 25
    Hint = ''
    DataField = 'Name'
    DataSource = SourceCustomer
    ParentFont = False
    Font.Height = -16
    TabOrder = 11
    BorderStyle = ubsNone
  end
  object ButtonSelectCustomer: TUniSpeedButton [12]
    Left = 392
    Top = 136
    Width = 25
    Height = 25
    Action = acShowCustomerSelector
    ParentFont = False
    Font.Height = -16
    Font.Style = [fsBold]
    ParentColor = False
    TabOrder = 12
  end
  object UniLabel4: TUniLabel [13]
    Left = 5
    Top = 168
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Address'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 13
  end
  object DBEditCustAddress: TUniDBEdit [14]
    Left = 92
    Top = 168
    Width = 325
    Height = 25
    Hint = ''
    DataField = 'FullAddress'
    DataSource = SourceCustomer
    ParentFont = False
    Font.Height = -16
    TabOrder = 14
    BorderStyle = ubsNone
  end
  object UniLabel5: TUniLabel [15]
    Left = 5
    Top = 200
    Width = 75
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Phone'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 15
  end
  object DBEditCustPhone: TUniDBEdit [16]
    Left = 92
    Top = 200
    Width = 325
    Height = 25
    Hint = ''
    DataField = 'PhoneNumber'
    DataSource = SourceCustomer
    ParentFont = False
    Font.Height = -16
    TabOrder = 16
    BorderStyle = ubsNone
  end
  object GridCustomers: TUniDBGrid [17]
    Left = 0
    Top = 240
    Width = 417
    Height = 273
    Hint = ''
    BodyRTL = False
    DataSource = SourceRows
    WebOptions.PageSize = 50
    WebOptions.RetainCursorOnSort = True
    LoadMask.Message = 'Loading data...'
    BufferedStore.Enabled = True
    BorderStyle = ubsNone
    Font.Height = -13
    ParentFont = False
    TabOrder = 17
    Columns = <
      item
        FieldName = 'Description'
        Title.Alignment = taCenter
        Title.Caption = 'Description'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 180
        Alignment = taCenter
      end
      item
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = 'Price'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 80
        Alignment = taCenter
      end
      item
        FieldName = 'Qty'
        Title.Alignment = taCenter
        Title.Caption = 'Qty'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 30
      end
      item
        FieldName = 'RowTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 80
      end>
  end
  object DBComboBoxOrderState: TUniDBComboBox [18]
    Left = 301
    Top = 55
    Width = 116
    Height = 29
    Hint = ''
    DataField = 'OrderState'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 18
    IconItems = <>
  end
  inherited BSSource: TDataSource
    Left = 232
    Top = 328
  end
  inherited ActionList1: TActionList
    Left = 336
    Top = 312
    object acDeleteRow: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete row'
      Enabled = True
      Visible = True
      VMActionName = 'acDeleteRow'
    end
    object acShowCustomerSelector: TioViewAction
      Category = 'iORM-MVVM'
      Caption = '...'
      Enabled = True
      Visible = True
      VMActionName = 'acShowCustomerSelector'
    end
  end
  inherited BSMaster: TioModelDataSet
    Left = 144
    Top = 328
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSMasterGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
  end
  inherited VMBridge: TioViewModelBridge
    Left = 338
    Top = 370
  end
  object VCProviderOrder: TioViewContextProvider
    AsDefault = False
    OnAfterRequest = VCProviderOrderAfterRequest
    OnRequest = VCProviderOrderRequest
    Left = 341
    Top = 434
  end
  object BSCustomer: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSCustomer'
    Left = 140
    Top = 386
    object BSCustomerID: TIntegerField
      FieldName = 'ID'
    end
    object BSCustomerName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object BSCustomerFullAddress: TStringField
      FieldName = 'FullAddress'
      Size = 250
    end
    object BSCustomerPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 250
    end
  end
  object SourceCustomer: TDataSource
    DataSet = BSCustomer
    Left = 230
    Top = 386
  end
  object BSRows: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSRows'
    Left = 140
    Top = 442
    object BSRowsDescription: TStringField
      FieldName = 'Description'
      Size = 250
    end
    object BSRowsPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BSRowsQty: TIntegerField
      FieldName = 'Qty'
    end
    object BSRowsRowTotal: TCurrencyField
      FieldName = 'RowTotal'
    end
  end
  object SourceRows: TDataSource
    DataSet = BSRows
    Left = 230
    Top = 442
  end
end
