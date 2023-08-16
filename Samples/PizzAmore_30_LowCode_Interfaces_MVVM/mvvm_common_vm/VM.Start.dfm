object VMStart: TVMStart
  Height = 480
  Width = 640
  object acQuit: TioVMActionBSCloseQuery
    Name = 'acQuit'
    OnExecuteAction = eaTerminateApplication
    OnUpdateScope = usGlobal
    Left = 48
    Top = 32
  end
  object acShowOrders: TioVMActionBSShowOrSelect
    Name = 'acShowOrders'
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'IOrder'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 32
  end
  object acShowCustomers: TioVMActionBSShowOrSelect
    Name = 'acShowCustomers'
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'ICustomer'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 96
  end
  object acShowPizzas: TioVMActionBSShowOrSelect
    Name = 'acShowPizzas'
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'IPizza'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 160
  end
end
