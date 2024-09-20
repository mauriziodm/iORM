inherited ViewOrder: TViewOrder
  OnCreate = UniFrameCreate
  TextHeight = 15
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
