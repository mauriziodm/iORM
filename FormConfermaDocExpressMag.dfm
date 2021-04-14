object ConfermaDocExpressMagForm: TConfermaDocExpressMagForm
  Left = 12
  Top = 124
  BorderStyle = bsNone
  Caption = 'ConfermaDocExpressMagForm'
  ClientHeight = 694
  ClientWidth = 850
  Color = 8421631
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  DesignSize = (
    850
    694)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 40
    Width = 847
    Height = 116
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Conferma!'
    Font.Charset = ANSI_CHARSET
    Font.Color = 108
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object LabelDocumento: TLabel
    Left = 1
    Top = 208
    Width = 847
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Documento'
    Font.Charset = ANSI_CHARSET
    Font.Color = 108
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object LabelCliente: TLabel
    Left = 1
    Top = 272
    Width = 847
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = 108
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object LabelCantiere: TLabel
    Left = 1
    Top = 336
    Width = 847
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Cantiere / Impianto'
    Font.Charset = ANSI_CHARSET
    Font.Color = 108
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object PanelYesNo: TPanel
    Left = 136
    Top = 458
    Width = 579
    Height = 196
    Anchors = [akLeft]
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object ModelButton: TcxButton
      Left = 1
      Top = 1
      Width = 273
      Height = 193
      Caption = 'SI'
      LookAndFeel.Kind = lfOffice11
      ModalResult = 6
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = 4194304
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      OnClick = ModelButtonClick
    end
    object cxButton1: TcxButton
      Left = 305
      Top = 1
      Width = 273
      Height = 193
      Caption = 'NO'
      LookAndFeel.Kind = lfOffice11
      ModalResult = 7
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = 4194304
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      OnClick = cxButton1Click
    end
  end
end
