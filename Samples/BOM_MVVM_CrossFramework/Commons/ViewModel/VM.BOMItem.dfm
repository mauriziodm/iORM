inherited BOMItemVM: TBOMItemVM
  OldCreateOrder = True
  object MPBOMItem: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBOMItem'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 136
    Top = 16
  end
  object MPBOMArticle: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = False
    AutoPersist = True
    AutoPost = True
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = MPBOMItem
    MasterPropertyName = 'Article'
    TypeName = 'IBase'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 136
    Top = 72
  end
end
