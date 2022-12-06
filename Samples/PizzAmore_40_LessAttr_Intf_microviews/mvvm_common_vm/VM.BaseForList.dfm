object VMBaseForList: TVMBaseForList
  OnViewPairing = ioViewModelViewPairing
  Height = 480
  Width = 640
  object BSMaster: TioModelPresenterMaster
    AsDefault = True
    Paging.CurrentPageOfFormat = '%d/%d'
    OnReceiveSelectionCloneObject = False
    OnReceiveSelectionFreeObject = False
    Left = 56
    Top = 48
  end
  object acShowOrSelect: TioVMAction
    Name = 'acShowOrSelect'
    OnExecute = acShowOrSelectExecute
    OnUpdate = acShowOrSelectUpdate
    Left = 192
    Top = 112
  end
  object acAdd: TioVMAction
    Name = 'acAdd'
    OnExecute = acAddExecute
    Left = 192
    Top = 176
  end
  object acDelete: TioVMActionBSPersistenceDelete
    TargetBindSource = BSMaster
    Left = 192
    Top = 240
  end
  object acBack: TioVMActionBSCloseQuery
    OnUpdateScope = usGlobalDisableIfChilds
    TargetBindSource = BSMaster
    Left = 192
    Top = 48
  end
end
