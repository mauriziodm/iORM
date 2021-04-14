object ImportaArcBaseForm: TImportaArcBaseForm
  Left = 828
  Top = 167
  Caption = 'Importazione archivi base'
  ClientHeight = 397
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BtnStart: TButton
    Left = 200
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object DBArcBase: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PATH=c:\winproject\levantedev\prova\prova.gdb'
      'CHARACTER SET=ISO8859_1'
      'FORCED WRITES=TRUE')
    Isolation = tiCommitted
    Left = 16
    Top = 16
    SavedPassword = '.JuMbLe.01.5A22462E0E2D'
  end
  object QDest: TIBOTable
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    FieldOptions = []
    Left = 384
    Top = 16
  end
  object QSourceTableList: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DBArcBase
    SQL.Strings = (
      'SELECT DISTINCT(RDB$RELATION_NAME)'
      'FROM RDB$RELATIONS'
      'WHERE NOT (UPPER(RDB$RELATION_NAME) LIKE '#39'RDB$%'#39')')
    Left = 88
    Top = 80
  end
  object QSource: TIBOTable
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DBArcBase
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    FieldOptions = []
    Left = 88
    Top = 16
  end
end
