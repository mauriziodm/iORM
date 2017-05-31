inherited OrderVM: TOrderVM
  OldCreateOrder = True
  object MPOrder: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TOrder'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 40
    Top = 24
  end
end
