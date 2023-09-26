inherited VMOrder: TVMOrder
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    OnSelectionInterface = MPMasterSelectionInterface
  end
  inherited acShowETM: TioVMActionBSShowOrSelect
    Left = 464
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
  object acShowCustomerSelector: TioVMActionBSShowOrSelect
    Name = 'acShowCustomerSelector'
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'ICustomer'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSCustomer
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 328
    Top = 112
  end
  object acShowPizzaSelector: TioVMActionBSShowOrSelect
    Name = 'acShowPizzaSelector'
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'IPizza'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSMaster
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 328
    Top = 176
  end
  object acDeleteRow: TioVMAction
    Name = 'acDeleteRow'
    BeforeExecute = acDeleteRowBeforeExecute
    Left = 328
    Top = 48
  end
end
