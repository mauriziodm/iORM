object UniServerModule: TUniServerModule
  Left = 0
  Top = 0
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object SQLiteConn: TioSQLiteConnectionDef
    AsDefault = True
    AutoCreateDB.Enabled = True
    Database = 'PizzAmore_30_mvvm_unigui.db'
    DatabaseStdFolder = sfDocuments
    Persistent = False
    Pooled = False
    AfterCreateOrAlterDB = SQLiteConnAfterCreateOrAlterDB
    Left = 108
    Top = 24
  end
  object ioUniGUI1: TioUniGUI
    Left = 32
    Top = 24
  end
end
