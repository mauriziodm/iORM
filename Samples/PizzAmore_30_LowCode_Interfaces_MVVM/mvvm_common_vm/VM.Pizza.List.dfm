inherited VMPizzaList: TVMPizzaList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IPizza'
  end
  inherited acBack: TioVMActionBSCloseQuery
    TargetBindSource = nil
  end
  inherited acSelectCurrent: TioVMActionBSSelectCurrent
    Action_CloseQueryAction = nil
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'IWherePizza'
  end
  inherited acAppend: TioVMActionBSAppend
    OnNewInstanceAsInterface = acAppendNewInstanceAsInterface
  end
end
