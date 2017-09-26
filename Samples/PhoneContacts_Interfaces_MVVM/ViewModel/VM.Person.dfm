inherited PersonViewModel: TPersonViewModel
  OldCreateOrder = True
  Height = 468
  Width = 496
  object PersonModelPresenter: TioModelPresenter
    AsDefault = True
    Async = True
    AutoLoadData = True
    AutoPersist = True
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
    MasterPresenter = PersonModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 208
    Top = 88
  end
end
