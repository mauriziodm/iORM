object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'WiRL ContentTypes Server'
  ClientHeight = 202
  ClientWidth = 468
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 468
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 464
    object Label1: TLabel
      Left = 28
      Top = 17
      Width = 63
      Height = 13
      Caption = 'Port number:'
    end
    object StartButton: TButton
      Left = 16
      Top = 41
      Width = 75
      Height = 25
      Action = StartServerAction
      TabOrder = 0
    end
    object StopButton: TButton
      Left = 104
      Top = 41
      Width = 75
      Height = 25
      Action = StopServerAction
      TabOrder = 1
    end
    object PortNumberEdit: TEdit
      Left = 97
      Top = 14
      Width = 82
      Height = 21
      TabOrder = 2
      Text = '8080'
    end
  end
  object MainActionList: TActionList
    Left = 384
    Top = 24
    object StartServerAction: TAction
      Caption = 'Start Server'
      OnExecute = StartServerActionExecute
      OnUpdate = StartServerActionUpdate
    end
    object StopServerAction: TAction
      Caption = 'Stop Server'
      OnExecute = StopServerActionExecute
      OnUpdate = StopServerActionUpdate
    end
  end
  object ioEtmSynchroStrategy_Server1: TioEtmSynchroStrategy_Server
    Left = 264
    Top = 144
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
    Top = 142
  end
  object ioVCL1: TioVCL
    Left = 264
    Top = 80
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
    Left = 72
    Top = 80
  end
end
