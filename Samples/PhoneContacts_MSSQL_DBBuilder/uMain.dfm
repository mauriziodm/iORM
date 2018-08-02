object BuilderForm: TBuilderForm
  Left = 0
  Top = 0
  Caption = 'DB Builder Form'
  ClientHeight = 579
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CreateDBButton: TButton
    Left = 8
    Top = 32
    Width = 97
    Height = 25
    Caption = 'Create DB'
    TabOrder = 0
    OnClick = CreateDBButtonClick
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 530
    Height = 563
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ioVCL1: TioVCL
    Left = 168
    Top = 64
  end
end
