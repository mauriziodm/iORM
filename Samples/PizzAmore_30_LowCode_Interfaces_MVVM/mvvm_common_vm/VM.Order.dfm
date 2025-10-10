inherited VMOrder: TVMOrder
  OnViewPairing = ioViewModelViewPairing
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    AsyncLoad = True
    AsyncPersist = True
    OnReceiveSelectionInterface = MPMasterSelectionInterface
    AuthorizationContext = 'order'
  end
  inherited acShowETM: TioVMActionBSShowOrSelect
    Left = 328
    Top = 248
  end
  object BSCustomer: TioModelPresenterDetail
    MasterBindSource = BSMaster
    MasterPropertyName = 'Customer'
    Left = 56
    Top = 112
  end
  object BSRows: TioModelPresenterDetail
    MasterBindSource = BSMaster
    MasterPropertyName = 'Rows'
    Left = 56
    Top = 176
  end
  object acShowCustomerSelector: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'ICustomer'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSCustomer
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 328
    Top = 112
  end
  object acShowPizzaSelector: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'IPizza'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSMaster
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 328
    Top = 176
  end
  object acDeleteRow: TioVMActionBSDelete
    TargetBindSource = BSRows
    Left = 328
    Top = 48
  end
  object BSCustomers: TioModelPresenterMaster
    AsDefault = False
    TypeName = 'ICustomer'
    Paging.CurrentPageOfFormat = '%d/%d'
    OnReceiveSelectionInterface = MPMasterSelectionInterface
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 328
  end
end
