inherited ViewModel: TViewModel
  OldCreateOrder = True
  object ModelMasterPresenter: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TModelMaster'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 64
    Top = 96
  end
  object ModelDetailPresenter: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = ModelMasterPresenter
    MasterPropertyName = 'Details'
    TypeName = 'TModelDetail'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 64
    Top = 160
  end
end
