object tiovmac: Ttiovmac
  Height = 410
  Width = 542
  object MPCustomer: TioModelPresenterDetail
    TypeOfCollection = tcSingleObject
    Left = 72
    Top = 48
  end
  object acSelectCustomer: TioVMAction
    Name = 'acSelectCustomer'
    OnExecute = acSelectCustomerExecute
    Left = 208
    Top = 48
  end
  object acShowCustomer: TioVMAction
    Name = 'acShowCustomer'
    Caption = 'Show'
    OnExecute = acShowCustomerExecute
    Left = 208
    Top = 112
  end
end
