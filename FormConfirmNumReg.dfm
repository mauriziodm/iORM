object ConfirmNumRegFE: TConfirmNumRegFE
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conferma'
  ClientHeight = 455
  ClientWidth = 494
  Color = 15527664
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    494
    455)
  PixelsPerInch = 96
  TextHeight = 13
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
  object eTitle: TLabel
    Left = 26
    Top = 12
    Width = 281
    Height = 30
    Caption = 'Conferma numero documento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 206
    Width = 494
    Height = 249
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      494
      249)
    object eTypeShape: TShape
      Left = 81
      Top = 134
      Width = 194
      Height = 42
      Pen.Color = 7177099
    end
    object Shape2: TShape
      Left = 82
      Top = 46
      Width = 324
      Height = 42
      Brush.Style = bsClear
      Pen.Color = 7177099
    end
    object Label1: TLabel
      Left = 82
      Top = 19
      Width = 324
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'N'#176' documento nel file XML'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4802889
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape3: TShape
      Left = 281
      Top = 134
      Width = 125
      Height = 42
      Pen.Color = 7177099
    end
    object Label2: TLabel
      Left = 82
      Top = 107
      Width = 193
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'N'#176' documento Levante'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4802889
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 282
      Top = 107
      Width = 124
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4802889
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonConfirm: TcxButton
      Left = 385
      Top = 199
      Width = 95
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = 'Conferma'
      Colors.Default = 43008
      Colors.Hot = 43008
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      ModalResult = 1
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonCancel: TcxButton
      Left = 7
      Top = 199
      Width = 95
      Height = 41
      Anchors = [akLeft, akBottom]
      Caption = 'Annulla'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      ModalResult = 2
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object eNumero: TcxTextEdit
      Left = 82
      Top = 134
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 9
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = eNumeroPropertiesChange
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
      OnKeyPress = eNumeroKeyPress
      Height = 42
      Width = 194
    end
    object eNumeroXML: TcxTextEdit
      Left = 82
      Top = 46
      TabStop = False
      AutoSize = False
      ParentColor = True
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.BorderColor = clBtnFace
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.TextColor = clBlack
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 4
      TextHint = 'digita qui il testo'
      Height = 42
      Width = 324
    end
    object eRegistro: TcxTextEdit
      Left = 281
      Top = 134
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 5
      Properties.UseLeftAlignmentOnEditing = False
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
      TabOrder = 1
      Height = 42
      Width = 125
    end
  end
  object eMessage: TcxRichEdit
    Left = 26
    Top = 84
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.Alignment = taCenter
    Properties.ReadOnly = True
    Lines.Strings = (
      'Levante usa diversi modi per cercare di suddividere il numero '
      'e l'#39'eventuale registro del documento.'
      '   '
      
        'Nel caso il risultato non sia corretto puoi correggere qui sotto' +
        '.')
    Style.BorderStyle = ebsNone
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 95
    Width = 440
  end
end
