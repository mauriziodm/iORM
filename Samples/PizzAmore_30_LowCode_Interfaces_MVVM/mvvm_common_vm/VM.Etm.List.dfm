inherited VMEtmList: TVMEtmList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'TEtmTimeSlot'
  end
  inherited BSWhere: TioModelPresenterMaster
    LoadType = ltManual
  end
  object acEtmRevertToDB: TioVMActionBS_ETM_RevertToBindSource
    TargetBindSource = BSMaster
    AutoExec_OnETMfor_AfterRevert = doRefresh
    AutoExec_OnTargetBS_AfterRevert = doReload
    AutoExec_Persist_AfterRevert = True
    Left = 392
    Top = 296
  end
  object acEtmRevertToObj: TioVMActionBS_ETM_RevertToObject
    Action_ShowOrSelectAction = acShowRevertedObj
    TargetBindSource = BSMaster
    Left = 392
    Top = 352
  end
  object acShowRevertedObj: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    ShowMode = smBSCurrent
    TargetBindSource = BSMaster
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 392
    Top = 408
  end
end
