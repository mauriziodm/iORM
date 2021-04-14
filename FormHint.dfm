object HintForm: THintForm
  Left = 627
  Top = 814
  BorderStyle = bsNone
  Caption = 'HintForm'
  ClientHeight = 135
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Background: TImage
    Left = 0
    Top = 0
    Width = 279
    Height = 135
    Align = alClient
  end
  object PLeft: TImage
    Left = 8
    Top = 8
    Width = 20
    Height = 20
    AutoSize = True
    Transparent = True
  end
  object PRight: TImage
    Left = 32
    Top = 8
    Width = 20
    Height = 20
    AutoSize = True
    Transparent = True
  end
  object PTop: TImage
    Left = 56
    Top = 8
    Width = 20
    Height = 20
    AutoSize = True
    Transparent = True
  end
  object PBottom: TImage
    Left = 80
    Top = 8
    Width = 20
    Height = 20
    AutoSize = True
    Transparent = True
  end
  object Riempimento: TLabel
    Left = 16
    Top = 96
    Width = 61
    Height = 13
    AutoSize = False
    Caption = 'Riempimento'
    Color = clAqua
    ParentColor = False
  end
  object HintMemo: TMemo
    Left = 14
    Top = 45
    Width = 250
    Height = 36
    Hint = 'HintMemo'
    TabStop = False
    BorderStyle = bsNone
    Color = clAqua
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo1')
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
