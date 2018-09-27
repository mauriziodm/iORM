inherited PersonViewModel: TPersonViewModel
  OldCreateOrder = True
  Height = 468
  Width = 496
  object PersonModelPresenter: TioModelPresenter
    AsDefault = True
    Async = True
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IPerson'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 208
    Top = 24
  end
  object PhonesModelPresenter: TioModelPresenter
    AsDefault = False
    Async = True
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
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
