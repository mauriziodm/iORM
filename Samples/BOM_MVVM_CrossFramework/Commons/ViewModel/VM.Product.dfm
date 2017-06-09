inherited ProductViewModel: TProductViewModel
  object MPBOMItemList: TioModelPresenter
    Async = True
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = MPArticle
    MasterPropertyName = 'BOMItems'
    TypeName = 'IBOMItem'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 192
    Top = 96
  end
end
