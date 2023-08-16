inherited VMPizzaList: TVMPizzaList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IPizza'
  end
  inherited acBack: TioVMActionBSCloseQuery
    TargetBindSource = nil
  end
  inherited acAdd: TioVMActionBSPersistenceAppend
    EntityTypeName = 'IPizza'
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'IWherePizza'
  end
end
