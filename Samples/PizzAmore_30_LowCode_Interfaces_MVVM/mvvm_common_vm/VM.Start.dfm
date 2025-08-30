object VMStart: TVMStart
  Height = 480
  Width = 640
  object acQuit: TioVMActionBSCloseQuery
    OnExecuteAction = eaTerminateApplication
    OnUpdateScope = usGlobal
    Left = 48
    Top = 32
  end
  object acShowOrders: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'IOrder'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 32
  end
  object acShowCustomers: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'ICustomer'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 96
  end
  object acShowPizzas: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'IPizza'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 160
  end
  object acShowIngredients: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'IIngredient'
    ShowMode = smEntityTypeName
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 224
  end
  object acShowSynchroLog: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acQuit
    EntityTypeName = 'TioEtmSynchroStrategy_LogItem'
    ShowMode = smEntityTypeName
    VVMTypeAlias = 'LIST'
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 192
    Top = 296
  end
  object acIOrmVersion: TioVMAction
    OnExecute = acIOrmVersionExecute
    Left = 432
    Top = 360
  end
end
