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
    Left = 192
    Top = 112
  end
  object acRevert: TioVMActionBSPersistenceRevertOrDelete
    TargetBindSource = BSMaster
    Left = 192
    Top = 176
  end
  object ioVMAction1: TioVMAction
    Name = 'ioVMAction1'
    Left = 304
    Top = 224
  end
  object acBack: TioVMActionBSCloseQuery
    TargetBindSource = BSMaster
    Left = 192
    Top = 56
  end
end
