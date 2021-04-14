object ConfirmForm: TConfirmForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 275
  ClientWidth = 494
  Color = 15527664
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    494
    275)
  PixelsPerInch = 96
  TextHeight = 13
  object eTitle: TLabel
    Left = 26
    Top = 12
    Width = 91
    Height = 30
    Caption = 'Conferma'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 12
    Top = 56
    Width = 468
    Height = 1
    Anchors = [akLeft, akTop, akRight]
    Brush.Style = bsClear
    Pen.Color = clBtnFace
    ExplicitWidth = 453
  end
  object eTypeShape: TShape
    Left = 26
    Top = 151
    Width = 440
    Height = 42
    Anchors = [akLeft, akRight, akBottom]
    Pen.Color = clBtnFace
    ExplicitTop = 202
    ExplicitWidth = 425
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 212
    Width = 494
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      494
      63)
    object ButtonConfirm: TcxButton
      Left = 390
      Top = 12
      Width = 95
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Conferma'
      Colors.Default = 151293
      Colors.Hot = 151293
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      ModalResult = 1
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonCancel: TcxButton
      Left = 7
      Top = 12
      Width = 95
      Height = 41
      Caption = 'Annulla'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      ModalResult = 2
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object eType: TcxTextEdit
    Left = 26
    Top = 151
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.UseLeftAlignmentOnEditing = False
    Properties.OnChange = eTypePropertiesChange
    Style.BorderColor = clBtnFace
    Style.BorderStyle = ebsNone
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.TextColor = 234
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    TabOrder = 0
    TextHint = 'digita qui il testo'
    OnKeyPress = eTypeKeyPress
    Height = 42
    Width = 440
  end
  object eMessage: TcxRichEdit
    Left = 26
    Top = 72
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentColor = True
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.ReadOnly = True
    Lines.Strings = (
      'eMessage')
    Style.BorderStyle = ebsNone
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.IsFontAssigned = True
    TabOrder = 2
    Height = 57
    Width = 440
  end
  object TimerConfirm: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerConfirmTimer
    Left = 296
    Top = 8
  end
  object TimerCancel: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerCancelTimer
    Left = 384
    Top = 8
  end
end
