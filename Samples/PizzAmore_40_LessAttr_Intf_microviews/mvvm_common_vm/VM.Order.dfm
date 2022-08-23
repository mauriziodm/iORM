inherited VMOrder: TVMOrder
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    OnSelectionObject = MPMasterSelectionObject
  end
  object MPCustomer: TioModelPresenterDetail
    MasterBindSource = MPMaster
    MasterPropertyName = 'Customer'
    Left = 56
    Top = 104
  end
  object MPRows: TioModelPresenterDetail
    MasterBindSource = MPMaster
    MasterPropertyName = 'Rows'
    Left = 56
    Top = 168
  end
  object acDeleteRow: TioVMAction
    Name = 'acDeleteRow'
    OnExecute = acDeleteRowExecute
    Left = 328
    Top = 48
  end
  object acShowPizzaSelector: TioVMAction
    Name = 'acShowPizzaSelector'
    OnExecute = acShowPizzaSelectorExecute
    Left = 328
    Top = 176
  end
  object acShowCustomerSelector: TioVMAction
    Name = 'acShowCustomerSelector'
    OnExecute = acShowCustomerSelectorExecute
    Left = 328
    Top = 112
  end
end
