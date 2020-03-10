inherited ProductViewModel: TProductViewModel
  object MPBOMItemList: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = MPArticle
    MasterPropertyName = 'BOMItems'
    TypeName = 'IBOMItem'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    ioOnReceiveSelectionAutoEdit = False
    ioOnReceiveSelectionAutoPost = False
    ioOnReceiveSelectionAutoPersist = False
    ioPropagateEdit = False
    ioPropagatePost = False
    ioPropagatePersist = False
    Left = 192
    Top = 104
  end
end
