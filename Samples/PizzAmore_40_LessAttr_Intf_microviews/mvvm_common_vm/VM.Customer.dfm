inherited VMCustomer: TVMCustomer
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IGenericCustomer'
  end
  object acDelete: TioVMAction
    Name = 'acDelete'
    OnExecute = acDeleteExecute
    Left = 440
    Top = 128
  end
end
