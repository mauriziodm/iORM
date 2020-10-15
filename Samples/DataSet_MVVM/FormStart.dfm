object StartForm: TStartForm
  Left = 0
  Top = 0
  Caption = 'iORM - DataSet - MVVM'
  ClientHeight = 151
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 201
    Height = 65
    Caption = 'New LiveBindings based view'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 79
    Width = 201
    Height = 65
    Caption = 'New DataSet based view'
    TabOrder = 1
    OnClick = Button2Click
  end
  object VCProvider: TioViewContextProvider
    OnRelease = VCProviderioOnRelease
    OnRequest = VCProviderioOnRequest
    RegisterAsDefault = True
    Left = 152
    Top = 88
  end
  object SQLiteConn: TioSQLiteConnectionDef
    AutoCreateDB.Enabled = True
    Database = '..\..\..\SamplesData\DataSetTest.DB'
    DatabaseStdFolder = sfUndefined
    DefaultConnection = True
    Persistent = False
    Pooled = False
    OnBeforeCreateOrAlterDB = SQLiteConnBeforeCreateOrAlterDB
    Left = 152
    Top = 16
  end
  object ioVCL1: TioVCL
    Left = 32
    Top = 56
  end
end
