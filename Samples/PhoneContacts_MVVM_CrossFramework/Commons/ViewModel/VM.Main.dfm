inherited ViewModelMain: TViewModelMain
  OldCreateOrder = True
  Height = 185
  Width = 193
  object PersonsModelPresenter: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IPerson'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 24
  end
  object PhonesModelPresenter: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
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
