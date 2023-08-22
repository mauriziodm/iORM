inherited VMCustomer: TVMCustomer
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  object BS_ETM: TioModelPresenterMaster
    AsDefault = False
    TypeName = 'TEtmRepository'
    ETMfor = BSMaster
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 344
    Top = 48
  end
  object AcEtmRevertToVersion: TioVMActionBS_ETM_RevertToBindSource
    Name = 'AcEtmRevertToVersion'
    AutoExec_OnETMfor_AfterRevert = doRefresh
    AutoExec_OnTargetBS_AfterRevert = doReload
    AutoExec_Persist_AfterRevert = True
    TargetBindSource = BS_ETM
    Left = 472
    Top = 48
  end
end
