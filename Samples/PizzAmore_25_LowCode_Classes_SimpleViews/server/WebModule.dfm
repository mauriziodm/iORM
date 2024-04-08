object MyWebModule: TMyWebModule
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <>
  Height = 230
  Width = 415
  object FirebirdConn: TioFirebirdConnectionDef
    AsDefault = True
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
end
