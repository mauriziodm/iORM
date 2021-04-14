object FormExportRIBA: TFormExportRIBA
  Left = 495
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Presentazione RI.BA. all'#39'incasso'
  ClientHeight = 451
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MemoCBI: TMemo
    Left = 320
    Top = 235
    Width = 41
    Height = 25
    TabStop = False
    Lines.Strings = (
      'Memo'
      'CBI')
    TabOrder = 4
    Visible = False
  end
  object GBDatiAzienda: TcxGroupBox
    Left = 16
    Top = 259
    Caption = ' Dati dell'#39'azienda creditrice '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 137
    Width = 457
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 89
      Height = 13
      Caption = 'Nome del creditore'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Indirizzo'
    end
    object Label3: TLabel
      Left = 24
      Top = 80
      Width = 37
      Height = 13
      Caption = 'Localit'#224
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 74
      Height = 13
      Caption = 'CAP - Provincia'
    end
    object eNomeCreditore: TcxTextEdit
      Tag = 24
      Left = 121
      Top = 29
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Text = '- - -'
      Height = 20
      Width = 200
    end
    object eIndirizzoCreditore: TcxTextEdit
      Tag = 24
      Left = 121
      Top = 53
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Text = '- - -'
      Height = 20
      Width = 200
    end
    object eLocalitaCreditore: TcxTextEdit
      Tag = 24
      Left = 121
      Top = 77
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Text = '- - -'
      Height = 20
      Width = 200
    end
    object eCapProvinciaCreditore: TcxTextEdit
      Tag = 24
      Left = 121
      Top = 103
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Text = '- - -'
      Height = 20
      Width = 200
    end
  end
  object SBCreaRiBaFIle: TcxButton
    Left = 112
    Top = 411
    Width = 169
    Height = 25
    Cursor = crHandPoint
    Caption = 'Crea file presentazione RI.BA.'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SBCreaRiBaFIleClick
  end
  object SBChiudi: TcxButton
    Left = 312
    Top = 411
    Width = 57
    Height = 25
    Cursor = crHandPoint
    Caption = 'Chiudi'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SBChiudiClick
  end
  object GBDatiBanca: TcxGroupBox
    Left = 16
    Top = 9
    Caption = ' Dati della banca '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 220
    Width = 457
    object Label5: TLabel
      Left = 24
      Top = 83
      Width = 53
      Height = 13
      Caption = 'Codice SIA'
    end
    object Label6: TLabel
      Left = 24
      Top = 107
      Width = 53
      Height = 13
      Caption = 'Codice ABI'
    end
    object Label7: TLabel
      Left = 24
      Top = 131
      Width = 57
      Height = 13
      Caption = 'Codice CAB'
    end
    object Label8: TLabel
      Left = 24
      Top = 155
      Width = 59
      Height = 13
      Caption = 'Numero C/C'
    end
    object Label9: TLabel
      Left = 24
      Top = 179
      Width = 72
      Height = 13
      Caption = 'Nome supporto'
    end
    object Label10: TLabel
      Left = 24
      Top = 32
      Width = 61
      Height = 13
      Caption = 'Nome banca'
    end
    object LabelNomeBreve: TLabel
      Left = 24
      Top = 59
      Width = 58
      Height = 13
      Caption = 'Nome breve'
    end
    object eCodiceSia: TcxTextEdit
      Tag = 5
      Left = 121
      Top = 80
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Text = '- - -'
      Height = 20
      Width = 50
    end
    object eCodiceAbi: TcxTextEdit
      Tag = 5
      Left = 121
      Top = 104
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Text = '- - -'
      Height = 20
      Width = 50
    end
    object eCodiceCab: TcxTextEdit
      Tag = 5
      Left = 121
      Top = 128
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Text = '- - -'
      Height = 20
      Width = 50
    end
    object eNumeroCC: TcxTextEdit
      Tag = 12
      Left = 121
      Top = 152
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Text = '- - -'
      Height = 20
      Width = 120
    end
    object eNomeSupporto: TcxTextEdit
      Tag = 20
      Left = 121
      Top = 176
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Text = '- - -'
      Height = 20
      Width = 200
    end
    object eNomeBanca: TcxComboBox
      Left = 121
      Top = 29
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = eNomeBancaPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Width = 330
    end
    object eNomeBreve: TcxTextEdit
      Tag = 5
      Left = 121
      Top = 56
      TabStop = False
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = 15724527
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Text = '- - -'
      Height = 20
      Width = 120
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 56
    Top = 403
  end
end
