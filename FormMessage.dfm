object MessageForm: TMessageForm
  Left = 675
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 206
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Cornice: TBevel
    Left = 8
    Top = 10
    Width = 377
    Height = 120
    Shape = bsFrame
  end
  object BtnSi: TButton
    Left = 8
    Top = 170
    Width = 75
    Height = 25
    Caption = 'SI'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 6
    ParentFont = False
    TabOrder = 0
  end
  object BtnNO: TButton
    Left = 86
    Top = 170
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'NO'
    ModalResult = 7
    TabOrder = 1
  end
  object BtnAnnulla: TButton
    Left = 309
    Top = 170
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Annulla'
    ModalResult = 2
    TabOrder = 2
  end
  object Msg: TMemo
    Left = 12
    Top = 20
    Width = 368
    Height = 100
    TabStop = False
    Alignment = taCenter
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Msg')
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object BtnOK: TButton
    Left = 163
    Top = 170
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
  end
  object Note: TMemo
    Left = 12
    Top = 130
    Width = 368
    Height = 30
    TabStop = False
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    Lines.Strings = (
      'Note')
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
end
