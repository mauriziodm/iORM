inherited ViewModelMain: TViewModelMain
  OldCreateOrder = True
  Height = 469
  Width = 471
  object PersonsModelPresenter: TioModelPresenter
    AsDefault = True
    Async = True
    AutoLoadData = True
    AutoPersist = True
    AutoPost = True
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
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = PersonsModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 208
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Left = 32
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 32
    Top = 88
  end
  object ActionList1: TActionList
    Left = 208
    Top = 160
    object acLoadData: TAction
      Text = 'Load from DB by code'
      OnExecute = acLoadDataExecute
    end
    object acClearData: TAction
      Text = 'Clear data'
      OnExecute = acClearDataExecute
      OnUpdate = acClearDataUpdate
    end
    object acSerializeToJSON: TAction
      Text = 'Serialize to JSON'
      OnExecute = acSerializeToJSONExecute
      OnUpdate = acSerializeToJSONUpdate
    end
    object acDeserializeFromJSON: TAction
      Text = 'Deserialize from JSON'
      OnExecute = acDeserializeFromJSONExecute
      OnUpdate = acDeserializeFromJSONUpdate
    end
    object acClearJSON: TAction
      Text = 'Clear JSON'
      OnExecute = acClearJSONExecute
      OnUpdate = acClearJSONUpdate
    end
    object acSaveJSONtoFile: TAction
      Text = 'Save JSON to file'
      OnExecute = acSaveJSONtoFileExecute
      OnUpdate = acDeserializeFromJSONUpdate
    end
    object acLoadJSONfromFile: TAction
      Text = 'Load JSON from file'
      OnExecute = acLoadJSONfromFileExecute
      OnUpdate = acLoadJSONfromFileUpdate
    end
    object acEditPerson: TAction
      Text = 'acEditPerson'
      OnExecute = acEditPersonExecute
      OnUpdate = acClearDataUpdate
    end
    object acTerminate: TAction
      Text = 'acTerminate'
      OnExecute = acTerminateExecute
    end
    object acRefresh: TAction
      Text = 'acRefresh'
      OnExecute = acRefreshExecute
      OnUpdate = acRefreshUpdate
    end
  end
end
