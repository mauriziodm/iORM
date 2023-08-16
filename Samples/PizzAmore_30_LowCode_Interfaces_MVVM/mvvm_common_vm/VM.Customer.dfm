inherited VMCustomer: TVMCustomer
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  inherited acBack: TioVMActionBSCloseQuery [1]
  end
  inherited acPersist: TioVMActionBSPersistencePersist [2]
  end
  inherited acRevert: TioVMActionBSPersistenceRevertOrDelete [3]
  end
end
