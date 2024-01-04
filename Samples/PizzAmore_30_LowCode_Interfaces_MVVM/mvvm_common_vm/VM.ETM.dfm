object VM_ETM: TVM_ETM
  Height = 480
  Width = 640
  object BS_ETM: TioModelPresenterMaster
    AsDefault = True
    TypeName = 'TEtmRepository'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 64
    Top = 56
  end
  object acBack: TioVMActionBSCloseQuery
    Name = 'acBack'
    TargetBindSource = BS_ETM
    Left = 232
    Top = 56
  end
  object acEtmRevertToVersion: TioVMActionBS_ETM_RevertToBindSource
    Name = 'acEtmRevertToVersion'
    TargetBindSource = BS_ETM
    AutoExec_OnETMfor_AfterRevert = doRefresh
    AutoExec_OnTargetBS_AfterRevert = doReload
    AutoExec_Persist_AfterRevert = True
    Left = 232
    Top = 136
  end
end
