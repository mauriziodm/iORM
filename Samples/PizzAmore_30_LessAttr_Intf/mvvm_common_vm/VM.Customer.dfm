inherited VMCustomer: TVMCustomer
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
    LoadType = ltManual
  end
  object acNew: TioVMAction
    Name = 'acNew'
    OnExecute = acNewExecute
    Left = 208
    Top = 184
  end
end
