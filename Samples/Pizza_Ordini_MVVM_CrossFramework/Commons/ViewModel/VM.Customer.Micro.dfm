inherited CustomerMicroVM: TCustomerMicroVM
  OldCreateOrder = True
  object MPCustomer: TioModelPresenter
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TCustomer'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 56
    Top = 40
  end
end
