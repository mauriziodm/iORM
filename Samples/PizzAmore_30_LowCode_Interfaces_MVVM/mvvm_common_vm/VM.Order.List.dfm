inherited VMOrderList: TVMOrderList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'IWhereOrder'
    AfterReceiveSelectionInterface = BSWhereAfterSelectionInterface
  end
  inherited acBuildWhere: TioVMActionBSBuildWhere
    Action_PersistAction = acWherePersist
  end
  object acWhereShowHistory: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'IWhereOrder'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSWhere
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 392
    Top = 240
  end
  object acWherePersist: TioVMActionBSPersistencePersist
    TargetBindSource = BSWhere
    Left = 392
    Top = 176
  end
end
