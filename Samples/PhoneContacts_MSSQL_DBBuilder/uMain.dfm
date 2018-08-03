object BuilderForm: TBuilderForm
  Left = 0
  Top = 0
  Caption = 'DB Builder Form'
  ClientHeight = 579
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Server Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 49
    Height = 13
    Caption = 'UserName'
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 46
    Height = 13
    Caption = 'Password'
  end
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
  object CreateDBButton: TButton
    Left = 8
    Top = 201
    Width = 186
    Height = 25
    Caption = 'Create DB'
    TabOrder = 0
    OnClick = CreateDBButtonClick
  end
  object Memo1: TMemo
    Left = 200
    Top = 40
    Width = 553
    Height = 531
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object GenerateScriptButton: TButton
    Left = 8
    Top = 232
    Width = 186
    Height = 25
    Caption = 'Generate Only CreateDB Script'
    TabOrder = 2
    OnClick = GenerateScriptButtonClick
  end
  object ServerEdit: TEdit
    Left = 8
    Top = 25
    Width = 178
    Height = 21
    TabOrder = 3
    Text = 'VWMARMOTTA\SQLEXPRESS'
  end
  object DatabaseEdit: TEdit
    Left = 8
    Top = 65
    Width = 178
    Height = 21
    TabOrder = 4
    Text = 'PIPPO'
  end
  object UserNameEdit: TEdit
    Left = 8
    Top = 113
    Width = 178
    Height = 21
    TabOrder = 5
    Text = 'sa'
  end
  object PasswordEdit: TEdit
    Left = 8
    Top = 161
    Width = 178
    Height = 21
    PasswordChar = '*'
    TabOrder = 6
    Text = 'Daniela73'
  end
  object CopyScriptButton: TButton
    Left = 8
    Top = 536
    Width = 186
    Height = 25
    Caption = 'Copy Script'
    TabOrder = 7
    OnClick = CopyScriptButtonClick
  end
  object ioVCL1: TioVCL
    Left = 128
    Top = 104
  end
end
