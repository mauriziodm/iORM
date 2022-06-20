object ioDMVCServerTest: TioDMVCServerTest
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <>
  Height = 280
  Width = 415
  object SQLiteConn: TioSQLiteConnectionDef
    AutoCreateDB.Enabled = True
    Database = 'PizzAmore_20_vcl.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    OnAfterCreateOrAlterDB = SQLiteConnAfterCreateOrAlterDB
    Left = 112
    Top = 96
  end
  object ioVCL1: TioVCL
    Left = 112
    Top = 32
  end
end
