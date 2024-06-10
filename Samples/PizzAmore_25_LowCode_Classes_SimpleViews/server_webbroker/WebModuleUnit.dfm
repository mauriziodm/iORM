object WebModule2: TWebModule2
  Actions = <
    item
      Default = True
      Name = 'iORMHandler'
      PathInfo = '/'
      Producer = ioWebBrokerProducer1
    end>
  Height = 230
  Width = 415
  object ioWebBrokerProducer1: TioWebBrokerProducer
    Left = 224
    Top = 120
  end
  object ioVCL1: TioVCL
    Left = 232
    Top = 32
  end
  object SQLiteConn: TioSQLiteConnectionDef
    AsDefault = True
    AutoCreateDB.Enabled = True
    Database = 'PizzAmore_25_LowCode_Classes_SimpleViews_Vcl.db'
    DatabaseStdFolder = sfDocuments
    Persistent = False
    Pooled = False
    OnAfterCreateOrAlterDB = SQLiteConnAfterCreateOrAlterDB
    Left = 72
    Top = 102
  end
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
    OnAfterCreateOrAlterDB = SQLiteConnAfterCreateOrAlterDB
    Left = 72
    Top = 24
  end
  object ioEtmSynchroStrategy_Server1: TioEtmSynchroStrategy_Server
    Left = 312
    Top = 64
  end
end
