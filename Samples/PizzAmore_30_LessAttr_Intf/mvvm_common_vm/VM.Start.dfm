object VMStart: TVMStart
  Height = 480
  Width = 640
  object acQuit: TioVMAction
    Name = 'acQuit'
    OnExecute = acQuitExecute
    Left = 48
    Top = 32
  end
  object acShowCustomers: TioVMAction
    Name = 'acShowCustomers'
    OnExecute = acShowCustomersExecute
    Left = 48
    Top = 144
  end
  object acShowOrders: TioVMAction
    Name = 'acShowOrders'
    OnExecute = acShowOrdersExecute
    Left = 48
    Top = 88
  end
  object acShowPizzas: TioVMAction
    Name = 'acShowPizzas'
    OnExecute = acShowPizzasExecute
    Left = 48
    Top = 200
  end
end
