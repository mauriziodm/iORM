inherited ViewModelMain: TViewModelMain
  OldCreateOrder = True
  Height = 185
  Width = 193
  object PersonsModelPresenter: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IPerson'
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
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = PersonsModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 80
  end
end
