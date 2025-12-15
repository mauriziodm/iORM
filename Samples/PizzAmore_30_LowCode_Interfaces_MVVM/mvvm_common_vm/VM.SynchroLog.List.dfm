inherited VMSynchroLogList: TVMSynchroLogList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'TioEtmSynchroStrategy_LogItem'
    AsyncLoad = True
    AsyncPersist = True
  end
  inherited BSWhere: TioModelPresenterMaster
    LoadType = ltManual
  end
  object BS_ETM: TioModelPresenterDetail
    MasterBindSource = BSMaster
    MasterPropertyName = 'EtmTimeslotsSrv'
    Left = 56
    Top = 392
  end
  object acShowTimeSlot: TioVMActionBSShowOrSelect
    ShowMode = smBSCurrent
    TargetBindSource = BS_ETM
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 144
    Top = 392
  end
end
