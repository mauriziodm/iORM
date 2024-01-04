inherited VMCustomer: TVMCustomer
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  object BS_ETM: TioModelPresenterMaster
    AsDefault = False
    TypeName = 'TEtmRepository'
    ETMfor = BSMaster
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 328
    Top = 128
  end
  object AcEtmRevertToVersion: TioVMActionBS_ETM_RevertToBindSource
    Name = 'AcEtmRevertToVersion'
    TargetBindSource = BS_ETM
    AutoExec_OnETMfor_AfterRevert = doRefresh
    AutoExec_OnTargetBS_AfterRevert = doReload
    AutoExec_Persist_AfterRevert = True
    Left = 472
    Top = 48
  end
end
