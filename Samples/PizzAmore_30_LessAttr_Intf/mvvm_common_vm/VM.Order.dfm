inherited VMOrder: TVMOrder
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    OnSelectionInterface = MPMasterSelectionInterface
  end
  object BSCustomer: TioModelPresenterDetail
    AsDefault = False
    MasterBindSource = BSMaster
    MasterPropertyName = 'Customer'
    Left = 56
    Top = 112
  end
  object BSRows: TioModelPresenterDetail
    AsDefault = False
    MasterBindSource = BSMaster
    MasterPropertyName = 'Rows'
    Left = 56
    Top = 176
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
