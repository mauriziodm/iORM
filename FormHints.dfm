object HintsForm: THintsForm
  Left = 401
  Top = 658
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Hints editor'
  ClientHeight = 259
  ClientWidth = 267
  Color = 13347761
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 250
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Component Owner'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 46
    Width = 250
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Component Name'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object LabelMessage: TLabel
    Left = 8
    Top = 84
    Width = 250
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Hint Message'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object HintMemo: TMemo
    Left = 8
    Top = 97
    Width = 250
    Height = 127
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 132
    Top = 229
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 54
    Top = 229
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object EditOwner: TEdit
    Left = 8
    Top = 21
    Width = 250
    Height = 19
    TabStop = False
    AutoSize = False
    Color = 13948116
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
    Text = 'EditOwner'
  end
  object EditName: TEdit
    Left = 8
    Top = 59
    Width = 250
    Height = 19
    TabStop = False
    AutoSize = False
    Color = 13948116
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 4
    Text = 'EditName'
  end
end
