object VMBaseForForm: TVMBaseForForm
  Height = 480
  Width = 640
  object BSMaster: TioModelPresenterMaster
    AsDefault = True
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 48
  end
  object acPersist: TioVMActionBSPersistencePersist
    Name = 'acPersist'
    TargetBindSource = BSMaster
    Left = 192
    Top = 112
  end
  object acBack: TioVMActionBSCloseQuery
    Name = 'acBack'
    OnUpdateScope = usGlobal
    TargetBindSource = BSMaster
    Left = 192
    Top = 48
  end
  object acRevert: TioVMActionBSPersistenceRevertOrDelete
    Name = 'acRevert'
    Action_CloseQueryAction = acBack
    TargetBindSource = BSMaster
    Left = 192
    Top = 184
  end
  object acShowETM: TioVMActionBSShowOrSelect
    Name = 'acShowETM'
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'TEtmRepository'
    ShowMode = smEntityTypeNameAsETM
    TargetBindSource = BSMaster
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 336
    Top = 48
  end
end
