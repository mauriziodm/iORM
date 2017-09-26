inherited ViewModelMain: TViewModelMain
  OldCreateOrder = True
  Height = 469
  Width = 471
  object ActionList1: TActionList
    Left = 48
    Top = 24
    object acLoadData: TAction
      OnExecute = acLoadDataExecute
      OnUpdate = acLoadDataUpdate
    end
    object acClearData: TAction
      OnExecute = acClearDataExecute
      OnUpdate = acClearDataUpdate
    end
    object acSerializeToJSON: TAction
      Caption = 'Serialize to memo'
      OnExecute = acSerializeToJSONExecute
      OnUpdate = acSerializeToJSONUpdate
    end
    object acDeserializeFromJSON: TAction
      Caption = 'Deserialize from memo'
      OnExecute = acDeserializeFromJSONExecute
      OnUpdate = acDeserializeFromJSONUpdate
    end
    object acClearJSON: TAction
      Caption = 'Clear memo'
      OnExecute = acClearJSONExecute
      OnUpdate = acClearJSONUpdate
    end
    object acSaveJSONtoFile: TAction
      Caption = 'Save JSON to file'
      OnExecute = acSaveJSONtoFileExecute
      OnUpdate = acClearJSONUpdate
    end
    object acLoadJSONfromFile: TAction
      Caption = 'Load JSON from file'
      OnExecute = acLoadJSONfromFileExecute
      OnUpdate = acLoadJSONfromFileUpdate
    end
    object acEditPerson: TAction
      Caption = 'Edit'
      OnExecute = acEditPersonExecute
      OnUpdate = acClearDataUpdate
    end
    object acTerminate: TAction
      Caption = 'acTerminate'
      OnExecute = acTerminateExecute
    end
    object acRefresh: TAction
      Caption = 'acRefresh'
      OnExecute = acRefreshExecute
      OnUpdate = acRefreshUpdate
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 48
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    Left = 48
    Top = 136
  end
  object PersonsModelPresenter: TioModelPresenter
    AsDefault = True
    Async = True
    AutoLoadData = True
    AutoPersist = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IPerson'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 208
    Top = 24
  end
  object PhonesModelPresenter: TioModelPresenter
    AsDefault = False
    Async = True
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = PersonsModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 208
    Top = 88
  end
end
