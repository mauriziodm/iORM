object UniServerModule: TUniServerModule
  TempFolder = 'temp\'
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv23
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1, sslvTLSv1_2]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 480
  Width = 640
  object SQLiteConn: TioSQLiteConnectionDef
    AsDefault = True
    AutoCreateDB.Enabled = True
    Database = 'PizzAmore_30_mvvm_unigui.db'
    DatabaseStdFolder = sfDocuments
    Persistent = False
    Pooled = False
    OnAfterCreateOrAlterDB = SQLiteConnAfterCreateOrAlterDB
    Left = 108
    Top = 24
  end
  object ioUniGUI1: TioUniGUI
    Left = 32
    Top = 24
  end
end
