inherited ArticleListVM: TArticleListVM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  object MPArticleList: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IBase'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 96
    Top = 32
  end
  object ActionList1: TActionList
    Left = 216
    Top = 32
    object acBack: TAction
      OnExecute = acBackExecute
    end
    object acFilterAll: TAction
      Checked = True
      GroupIndex = 1000
      OnExecute = acFilterAllExecute
    end
    object acFilterMaterial: TAction
      GroupIndex = 1000
      OnExecute = acFilterMaterialExecute
    end
    object acFilterProcess: TAction
      Caption = 'acFilterProcess'
      GroupIndex = 1000
      OnExecute = acFilterProcessExecute
    end
    object acFilterProduct: TAction
      Caption = 'acFilterProduct'
      GroupIndex = 1000
      OnExecute = acFilterProductExecute
    end
    object acApplyFilters: TAction
      OnExecute = acApplyFiltersExecute
    end
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
