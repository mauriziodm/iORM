inherited ViewModelMain: TViewModelMain
  OldCreateOrder = True
  Height = 219
  Width = 193
  object PersonsModelPresenter: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    OrderBy = '[TPerson.FirstName]'
    TypeName = 'TPerson'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 24
  end
  object PhonesModelPresenter: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = PersonsModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'TPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 80
  end
  object ActionList1: TActionList
    Left = 72
    Top = 144
    object acExit: TAction
      Text = 'acExit'
      OnExecute = acExitExecute
    end
  end
end
