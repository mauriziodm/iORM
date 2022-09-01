object VMBaseForForm: TVMBaseForForm
  OnViewPairing = ioViewModelViewPairing
  Height = 480
  Width = 640
  object MPMaster: TioModelPresenterMaster
    AsDefault = True
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 48
  end
  object acBack: TioVMAction
    Name = 'acBack'
    OnExecute = acBackExecute
    Left = 192
    Top = 48
  end
  object acPersist: TioVMActionBSPersistencePersist
    TargetBindSource = MPMaster
    Left = 192
    Top = 112
  end
  object acRevert: TioVMActionBSPersistenceRevertOrDelete
    TargetBindSource = MPMaster
    Left = 192
    Top = 176
  end
end
