object StartForm: TStartForm
  Left = 0
  Top = 0
  Caption = 'Phonebook MVVM VCL'
  ClientHeight = 472
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ioVCL1: TioVCL
    Left = 112
    Top = 48
  end
  object FormsVCProvider: TioViewContextProvider
    OnRelease = FormsVCProviderRelease
    OnRequest = FormsVCProviderioOnRequest
    RegisterAsDefault = True
    Left = 112
    Top = 176
  end
  object ioSQLiteConnectionDef1: TioSQLiteConnectionDef
    OnAfterRegister = SQLiteConnAfterRegister
    AutoCreateDB.ReferentialIntegrityConstraints = False
    Database = 'ContactsIntfMVVM.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 112
    Top = 112
  end
end
