object VMBaseForForm: TVMBaseForForm
  Height = 480
  Width = 640
  object BSMaster: TioModelPresenterMaster
    AsDefault = True
    LoadType = ltFromBSAsIs
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 48
  end
  object acPersist: TioVMActionBSPersistencePersist
    TargetBindSource = BSMaster
    Left = 192
    Top = 112
  end
  object acRevert: TioVMActionBSPersistenceRevertOrDelete
    TargetBindSource = BSMaster
    Left = 192
    Top = 176
  end
  object acBack: TioVMActionBSCloseQuery
    OnEditingAction = eaAutoPersist
    OnUpdateScope = usGlobal
    TargetBindSource = BSMaster
    Left = 192
    Top = 48
  end
end
