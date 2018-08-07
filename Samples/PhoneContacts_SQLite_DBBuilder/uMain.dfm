object BuilderForm: TBuilderForm
  Left = 0
  Top = 0
  Caption = 'DB Builder Form SQLite'
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
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Database'
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
    Top = 51
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
    Top = 82
    Width = 186
    Height = 25
    Caption = 'Generate Only CreateDB Script'
    TabOrder = 2
    OnClick = GenerateScriptButtonClick
  end
  object DatabaseEdit: TEdit
    Left = 8
    Top = 24
    Width = 178
    Height = 21
    TabOrder = 3
    Text = '.\PIPPO.db'
  end
  object CopyScriptButton: TButton
    Left = 8
    Top = 536
    Width = 186
    Height = 25
    Caption = 'Copy Script'
    TabOrder = 4
    OnClick = CopyScriptButtonClick
  end
  object ioVCL1: TioVCL
    Left = 344
    Top = 96
  end
end
