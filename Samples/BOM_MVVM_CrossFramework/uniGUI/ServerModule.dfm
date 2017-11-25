object UniServerModule: TUniServerModule
  OldCreateOrder = False
  TempFolder = 'temp\'
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 189
  Width = 270
  object SQLIteConn: TioSQLiteConnectionDef
    OnAfterRegister = SQLIteConnAfterRegister
    AutoCreateDatabase = True
    Database = 'BOM.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 64
    Top = 40
  end
end
