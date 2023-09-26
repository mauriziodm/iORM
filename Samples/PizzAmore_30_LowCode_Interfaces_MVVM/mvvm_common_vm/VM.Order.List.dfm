inherited VMOrderList: TVMOrderList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
  end
  inherited acAdd: TioVMActionBSPersistenceAppend
    EntityTypeName = 'IOrder'
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'IWhereOrder'
    AfterSelectionInterface = BSWhereAfterSelectionInterface
  end
  inherited acBuildWhere: TioVMActionBSBuildWhere
    Action_PersistAction = acWherePersist
  end
  object acWhereShowHistory: TioVMActionBSShowOrSelect
    Name = 'acWhereShowHistory'
    Action_ParentCloseQueryAction = acBack
    ShowMode = smBSTypeNameAsSelector
    TargetBindSource = BSWhere
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 320
    Top = 304
  end
  object acWherePersist: TioVMActionBSPersistencePersist
    Name = 'acWherePersist'
    TargetBindSource = BSWhere
    Left = 320
    Top = 240
  end
end
