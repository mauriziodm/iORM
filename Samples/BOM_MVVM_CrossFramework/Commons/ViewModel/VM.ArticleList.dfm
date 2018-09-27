inherited ArticleListVM: TArticleListVM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  object MPArticleList: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBase'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 96
    Top = 32
  end
  object MPFilters: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = False
    AutoPersist = False
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TArticleListFilter'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 96
    Top = 104
  end
end
