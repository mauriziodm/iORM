inherited ProductViewModel: TProductViewModel
  object MPBOMItemList: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = MPArticle
    MasterPropertyName = 'BOMItems'
    TypeName = 'IBOMItem'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 192
    Top = 104
  end
end
