inherited ArticleViewModel: TArticleViewModel
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  object MPArticle: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBase'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 192
    Top = 24
  end
end
