inherited VMCustomer: TVMCustomer
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  object acNew: TioVMAction
    Name = 'acNew'
    OnExecute = acNewExecute
    Left = 192
    Top = 248
  end
end
