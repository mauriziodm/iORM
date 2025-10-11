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
  object acBack: TioVMActionBSCloseQuery
    TargetBindSource = BSMaster
    OnUpdateScope = usGlobal
    Left = 144
    Top = 112
  end
  object acShowOrSelect: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    Action_SelectCurrentAction = acSelectCurrent
    ShowMode = smBSCurrent
    TargetBindSource = BSMaster
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 144
    Top = 304
  end
  object acSelectCurrent: TioVMActionBSSelectCurrent
    TargetBindSource = BSMaster
    Action_CloseQueryAction = acBack
    Left = 144
    Top = 240
  end
  object BSWhere: TioModelPresenterMaster
    AsDefault = False
    LoadType = ltCreate
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    WhereBuilderFor = BSMaster
    Left = 320
    Top = 48
  end
  object acBuildWhere: TioVMActionBSBuildWhere
    TargetBindSource = BSWhere
    Left = 392
    Top = 48
  end
  object acClearWhere: TioVMActionBSClearWhere
    TargetBindSource = BSWhere
    AutoExec_Where_OnTargetBS = True
    Left = 392
    Top = 112
  end
  object acAppend: TioVMActionBSAppend
    Action_ShowOrSelectAction = acShowOrSelect
    TargetBindSource = BSMaster
    EntityTypeName = 'IOrder'
    Left = 144
    Top = 48
  end
  object acDelete: TioVMActionBSDelete
    TargetBindSource = BSMaster
    Left = 144
    Top = 176
  end
end
