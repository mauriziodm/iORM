inherited ArticleListVM: TArticleListVM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  object MPArticleList: TioModelPresenter
    Async = True
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBase'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 96
    Top = 32
  end
  object MPFilters: TioModelPresenter
    Async = False
    AutoLoadData = False
    AutoPersist = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TArticleListFilter'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 96
    Top = 104
  end
end
