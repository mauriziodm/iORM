object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 592
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    730
    592)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 369
    Width = 126
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = 'Phone numbers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 64
    Height = 19
    Caption = 'Persons'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 37
    Width = 714
    Height = 311
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourceMaster
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 390
    Width = 714
    Height = 193
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DataSourceDetail
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 482
    Top = 11
    Width = 240
    Height = 25
    DataSource = DataSourceMaster
    TabOrder = 2
  end
  object DBNavigator2: TDBNavigator
    Left = 482
    Top = 364
    Width = 240
    Height = 25
    DataSource = DataSourceDetail
    TabOrder = 3
  end
  object MemTableMaster: TioMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    ioTypeName = 'TPerson'
    ioAutoLoadDataWhenActivated = True
    ioWhereStr.Strings = (
      '')
    Left = 32
    Top = 87
    object MemTableMasterPERSONS_ID: TIntegerField
      DisplayWidth = 16
      FieldName = 'PERSONS_ID'
    end
    object MemTableMasterPERSONS_FIRST_NAME: TStringField
      DisplayWidth = 49
      FieldName = 'PERSONS_FIRST_NAME'
      Size = 100
    end
    object MemTableMasterPERSONS_LAST_NAME: TStringField
      DisplayWidth = 48
      FieldKind = fkCalculated
      FieldName = 'PERSONS_LAST_NAME'
      Size = 100
      Calculated = True
    end
  end
  object DataSourceMaster: TDataSource
    DataSet = MemTableMaster
    Left = 128
    Top = 87
  end
  object MemTableDetail: TioMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'PHONES_PERSONID'
    MasterSource = DataSourceMaster
    MasterFields = 'PERSONS_ID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    ioTypeName = 'TPhoneNumber'
    ioAutoLoadDataWhenActivated = True
    Left = 32
    Top = 447
    object MemTableDetailPHONES_PERSONID: TIntegerField
      FieldName = 'PHONES_PERSONID'
      Visible = False
    end
    object MemTableDetailPHONES_PHONETYPE: TStringField
      DisplayWidth = 22
      FieldName = 'PHONES_PHONETYPE'
      Size = 100
    end
    object MemTableDetailPHONES_PHONENUMBER: TStringField
      DisplayWidth = 111
      FieldName = 'PHONES_PHONENUMBER'
      Size = 100
    end
  end
  object DataSourceDetail: TDataSource
    DataSet = MemTableDetail
    Left = 128
    Top = 447
  end
  object ioFMX1: TioFMX
    Left = 400
    Top = 104
  end
  object SQLiteConn: TioSQLiteConnectionDef
    OnAfterRegister = SQLiteConnAfterRegister
    AutoCreateDB.Enabled = True
    Database = '..\..\..\SamplesData\ContactsObjMemTable.db'
    DatabaseStdFolder = sfUndefined
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 280
    Top = 104
  end
end
