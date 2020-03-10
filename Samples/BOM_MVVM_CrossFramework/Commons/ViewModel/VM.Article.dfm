inherited ArticleViewModel: TArticleViewModel
  OldCreateOrder = True
  object MPArticle: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBase'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    ioOnReceiveSelectionAutoEdit = False
    ioOnReceiveSelectionAutoPost = False
    ioOnReceiveSelectionAutoPersist = False
    ioPropagateEdit = False
    ioPropagatePost = False
    ioPropagatePersist = False
    Left = 192
    Top = 24
  end
end
