inherited PersonViewModel: TPersonViewModel
  OldCreateOrder = True
  Height = 203
  Width = 189
  object PersonModelPresenter: TioModelPresenter
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
    MasterPresenter = PersonModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 88
  end
end
