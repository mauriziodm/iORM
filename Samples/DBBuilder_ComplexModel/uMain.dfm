object BuilderForm: TBuilderForm
  Left = 0
  Top = 0
  Caption = 'DB Builder Complex Model'
  ClientHeight = 667
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MessageLabel: TLabel
    Left = 208
    Top = 8
    Width = 7
    Height = 23
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 208
    Top = 37
    Width = 686
    Height = 622
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object CopyScriptButton: TButton
    Left = 708
    Top = 8
    Width = 186
    Height = 25
    Caption = 'Copy Script'
    TabOrder = 1
    OnClick = CopyScriptButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 194
    Height = 129
    Caption = 'SQLite'
    TabOrder = 2
    object Label2: TLabel
      Left = 7
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object CreateDBSQLiteButton: TButton
      Left = 7
      Top = 59
      Width = 170
      Height = 25
      Caption = 'Create SQLite DB'
      TabOrder = 0
      OnClick = CreateDBSQLiteButtonClick
    end
    object DatabaseSQLiteEdit: TEdit
      Left = 7
      Top = 32
      Width = 170
      Height = 21
      TabOrder = 1
      Text = 'C:\TEMP\IORM_TEST.DB'
    end
    object GenerateSQLiteScriptButton: TButton
      Left = 7
      Top = 90
      Width = 170
      Height = 25
      Caption = 'Only CreateDB SQLite Script'
      TabOrder = 2
      OnClick = GenerateSQLiteOnlyScriptButtonClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 143
    Width = 194
    Height = 258
    Caption = 'MSSQL'
    TabOrder = 3
    object Label1: TLabel
      Left = 7
      Top = 57
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label3: TLabel
      Left = 7
      Top = 104
      Width = 49
      Height = 13
      Caption = 'UserName'
    end
    object Label4: TLabel
      Left = 7
      Top = 147
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label5: TLabel
      Left = 7
      Top = 17
      Width = 62
      Height = 13
      Caption = 'Server Name'
    end
    object CreateDBMSSQLButton: TButton
      Left = 7
      Top = 224
      Width = 170
      Height = 25
      Caption = 'Create MSSQL DB'
      TabOrder = 0
      OnClick = CreateDBMSSQLButtonClick
    end
    object GenerateMSSQLScriptButton: TButton
      Left = 7
      Top = 193
      Width = 170
      Height = 25
      Caption = 'Only CreateDB MSSQL Script'
      TabOrder = 1
      OnClick = GenerateMSSQLScriptButtonClick
    end
    object DatabaseMSSQLEdit: TEdit
      Left = 7
      Top = 73
      Width = 170
      Height = 21
      TabOrder = 2
      Text = 'IORM_TEST'
    end
    object PasswordMSSQLEdit: TEdit
      Left = 7
      Top = 163
      Width = 170
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      Text = 'Daniela73'
    end
    object ServerMSSQLEdit: TEdit
      Left = 7
      Top = 33
      Width = 170
      Height = 21
      TabOrder = 4
      Text = 'VWMARMOTTA\SQLEXPRESS'
    end
    object UserNameMSSQLEdit: TEdit
      Left = 7
      Top = 121
      Width = 170
      Height = 21
      TabOrder = 5
      Text = 'sa'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 407
    Width = 194
    Height = 252
    Caption = 'FireBird'
    TabOrder = 4
    object Label6: TLabel
      Left = 7
      Top = 57
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label7: TLabel
      Left = 7
      Top = 100
      Width = 49
      Height = 13
      Caption = 'UserName'
    end
    object Label8: TLabel
      Left = 7
      Top = 143
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label9: TLabel
      Left = 7
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object CreateDBFBButton: TButton
      Left = 7
      Top = 216
      Width = 170
      Height = 25
      Caption = 'Create FB DB'
      TabOrder = 0
      OnClick = CreateDBFBButtonClick
    end
    object GeneraFBScriptButton: TButton
      Left = 7
      Top = 186
      Width = 170
      Height = 25
      Caption = 'Only CreateDB FB Script'
      TabOrder = 1
      OnClick = GeneraFBScriptButtonClick
    end
    object DatabaseFBEdit: TEdit
      Left = 7
      Top = 73
      Width = 170
      Height = 21
      TabOrder = 2
      Text = 'C:\TEMP\IORM_TEST.FDB'
    end
    object PasswordFBEdit: TEdit
      Left = 7
      Top = 159
      Width = 170
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      Text = 'masterkey'
    end
    object UserNameFBEdit: TEdit
      Left = 7
      Top = 117
      Width = 170
      Height = 21
      TabOrder = 4
      Text = 'SYSDBA'
    end
    object ServerFBEdit: TEdit
      Left = 7
      Top = 30
      Width = 170
      Height = 21
      TabOrder = 5
      Text = 'localhost'
    end
  end
  object ioVCL1: TioVCL
    Left = 344
    Top = 96
  end
end
