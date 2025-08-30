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
    TargetBindSource = BSMaster
    Left = 120
    Top = 112
  end
  object acBack: TioVMActionBSCloseQuery
    TargetBindSource = BSMaster
    OnUpdateScope = usGlobal
    Left = 120
    Top = 48
  end
  object acRevert: TioVMActionBSPersistenceRevertOrDelete
    Action_CloseQueryAction = acBack
    TargetBindSource = BSMaster
    Left = 120
    Top = 176
  end
  object acShowETM: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'TEtmTimeSlot'
    ShowMode = smEntityTypeNameAsETM
    TargetBindSource = BSMaster
    VVMTypeAlias = 'LIST'
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 120
    Top = 240
  end
end
