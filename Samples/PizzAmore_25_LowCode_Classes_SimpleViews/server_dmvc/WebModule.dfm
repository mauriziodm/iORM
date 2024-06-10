object MyWebModule: TMyWebModule
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <>
  Height = 225
  Width = 415
  object FirebirdConn: TioFirebirdConnectionDef
    AsDefault = False
    Database = 'PizzAmore_25_LowCode_Classes_SimpleViews_Vcl.FDB'
    DatabaseStdFolder = sfDocuments
    OSAuthent = oaNo
    Password = 'masterkey'
    Persistent = False
    Pooled = False
    Port = 3050
    Protocol = pLocal
    SQLDialect = sqlDialect3
    UserName = 'SYSDBA'
    OnAfterCreateOrAlterDB = FirebirdConnAfterCreateOrAlterDB
    Left = 72
    Top = 24
  end
  object ioVCL1: TioVCL
    Left = 232
    Top = 48
  end
  object SQLiteConn: TioSQLiteConnectionDef
    AsDefault = True
    AutoCreateDB.Enabled = True
    Database = 'PizzAmore_25_LowCode_Classes_SimpleViews_Vcl.db'
    DatabaseStdFolder = sfDocuments
    Persistent = False
    Pooled = False
    OnAfterCreateOrAlterDB = FirebirdConnAfterCreateOrAlterDB
    Left = 72
    Top = 102
  end
  object ioEtmSynchroStrategy_Server1: TioEtmSynchroStrategy_Server
    Left = 232
    Top = 128
  end
end
