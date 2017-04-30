inherited ViewModel: TViewModel
  OldCreateOrder = True
  object SQLiteConn: TioSQLiteConnectionDef
    AutoCreateDatabase = True
    Database = 'DataSetTest.DB'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 64
    Top = 32
  end
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
