inherited EntiForm: TEntiForm
  Left = 549
  Top = 141
  Caption = 'EntiForm'
  ClientHeight = 912
  ClientWidth = 819
  ExplicitWidth = 819
  ExplicitHeight = 912
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 832
    ExplicitHeight = 832
    object Panel2: TPanel [0]
      Left = 0
      Top = 445
      Width = 669
      Height = 105
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object Label18: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 105
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitHeight = 203
      end
      object Label27: TLabel
        Left = 183
        Top = 52
        Width = 87
        Height = 12
        Caption = 'Modulo di stampa'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 183
        Top = 75
        Width = 130
        Height = 12
        Caption = 'Tracciato invio telematico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 85
        Top = 63
        Width = 77
        Height = 12
        Alignment = taRightJustify
        Caption = 'Allegato RCEE2'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape25: TShape
        Left = 173
        Top = 58
        Width = 1
        Height = 24
      end
      object Shape26: TShape
        Left = 174
        Top = 58
        Width = 5
        Height = 1
      end
      object Shape27: TShape
        Left = 174
        Top = 81
        Width = 5
        Height = 1
      end
      object Shape28: TShape
        Left = 168
        Top = 69
        Width = 5
        Height = 1
      end
      object RichEdit3: TRichEdit
        Tag = -1
        Left = 83
        Top = 8
        Width = 575
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Impostazioni allegati gruppi frigo/pompe di calore'
          ''
          '')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Zoom = 100
      end
      object dbeAllegatoRCEE2_ModuloStampa: TcxDBComboBox
        Left = 320
        Top = 49
        DataBinding.DataField = 'FRIGO_RCEE2_STMMOD_FILENAME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Properties.OnInitPopup = dbeAllegatoRCEE2_ModuloStampaPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 341
      end
      object cxDBComboBox10: TcxDBComboBox
        Left = 320
        Top = 72
        DataBinding.DataField = 'FRIGO_RCEE2_EXPORT_TRACCIATO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 341
      end
    end
    object PanelGruppo1: TPanel [1]
      Left = 0
      Top = 0
      Width = 669
      Height = 124
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 124
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 110
        Top = 45
        Width = 141
        Height = 12
        Caption = 'Denominazione ente (nome)'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 110
        Top = 69
        Width = 24
        Height = 12
        Caption = 'Note'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBText1: TDBText
        Left = 595
        Top = 6
        Width = 65
        Height = 17
        Alignment = taRightJustify
        DataField = 'ID'
        DataSource = DS
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 8
        Width = 510
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Identificazione ente')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Zoom = 100
      end
      object dbeDenominazione: TDBEdit
        Left = 260
        Top = 43
        Width = 400
        Height = 20
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object dbeNote: TDBEdit
        Left = 260
        Top = 67
        Width = 400
        Height = 45
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOTE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object Panel1: TPanel [2]
      Left = 0
      Top = 134
      Width = 669
      Height = 301
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object Label10: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 301
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '2'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitHeight = 203
      end
      object Label11: TLabel
        Left = 183
        Top = 162
        Width = 87
        Height = 12
        Caption = 'Modulo di stampa'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 183
        Top = 185
        Width = 130
        Height = 12
        Caption = 'Tracciato invio telematico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 110
        Top = 173
        Width = 52
        Height = 12
        Alignment = taRightJustify
        Caption = 'Allegato F'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape1: TShape
        Left = 173
        Top = 168
        Width = 1
        Height = 24
      end
      object Shape2: TShape
        Left = 174
        Top = 168
        Width = 5
        Height = 1
      end
      object Shape3: TShape
        Left = 174
        Top = 191
        Width = 5
        Height = 1
      end
      object Shape4: TShape
        Left = 168
        Top = 179
        Width = 5
        Height = 1
      end
      object Label2: TLabel
        Left = 183
        Top = 217
        Width = 87
        Height = 12
        Caption = 'Modulo di stampa'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 183
        Top = 240
        Width = 130
        Height = 12
        Caption = 'Tracciato invio telematico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 110
        Top = 228
        Width = 53
        Height = 12
        Alignment = taRightJustify
        Caption = 'Allegato G'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape5: TShape
        Left = 173
        Top = 223
        Width = 1
        Height = 24
      end
      object Shape6: TShape
        Left = 174
        Top = 223
        Width = 5
        Height = 1
      end
      object Shape7: TShape
        Left = 174
        Top = 246
        Width = 5
        Height = 1
      end
      object Shape8: TShape
        Left = 168
        Top = 234
        Width = 5
        Height = 1
      end
      object Label7: TLabel
        Left = 110
        Top = 272
        Width = 100
        Height = 12
        Caption = 'Codice manutentore'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 217
        Top = 272
        Width = 106
        Height = 12
        Caption = '(assegnato dall'#39'ente)'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 183
        Top = 52
        Width = 87
        Height = 12
        Caption = 'Modulo di stampa'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 183
        Top = 75
        Width = 130
        Height = 12
        Caption = 'Tracciato invio telematico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label14: TLabel
        Left = 85
        Top = 63
        Width = 77
        Height = 12
        Alignment = taRightJustify
        Caption = 'Allegato RCEE1'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape9: TShape
        Left = 173
        Top = 58
        Width = 1
        Height = 24
      end
      object Shape10: TShape
        Left = 174
        Top = 58
        Width = 5
        Height = 1
      end
      object Shape11: TShape
        Left = 174
        Top = 81
        Width = 5
        Height = 1
      end
      object Shape12: TShape
        Left = 168
        Top = 69
        Width = 5
        Height = 1
      end
      object Label15: TLabel
        Left = 183
        Top = 107
        Width = 87
        Height = 12
        Caption = 'Modulo di stampa'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 183
        Top = 130
        Width = 130
        Height = 12
        Caption = 'Tracciato invio telematico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 78
        Top = 118
        Width = 84
        Height = 12
        Alignment = taRightJustify
        Caption = 'Allegato RCEE1B'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape13: TShape
        Left = 173
        Top = 113
        Width = 1
        Height = 24
      end
      object Shape14: TShape
        Left = 174
        Top = 136
        Width = 5
        Height = 1
      end
      object Shape15: TShape
        Left = 168
        Top = 124
        Width = 5
        Height = 1
      end
      object Shape16: TShape
        Left = 174
        Top = 113
        Width = 5
        Height = 1
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 8
        Width = 575
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Impostazioni allegati impianti termici'
          '')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Zoom = 100
      end
      object dbeAllegatoF_ModuloStampa: TcxDBComboBox
        Left = 320
        Top = 159
        DataBinding.DataField = 'IMP_TERM_ALL_F_STMMOD_FILENAME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Properties.OnInitPopup = cxDBComboBox1PropertiesInitPopup
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 341
      end
      object cxDBComboBox2: TcxDBComboBox
        Left = 320
        Top = 182
        DataBinding.DataField = 'IMP_TERM_ALL_F_EXPORT_TRACCIATO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Items.Strings = (
          ''
          'SIENA - Allegato F/G - Impianti termici'
          'VANZOTECH - Allegato F/G - Impianti termici'
          'VESTASOFT - Allegato F - Impianti termici'
          'VESTASOFT - Allegato G - Impianti termici')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 341
      end
      object dbeAllegatoG_ModuloStampa: TcxDBComboBox
        Left = 320
        Top = 214
        DataBinding.DataField = 'IMP_TERM_ALL_G_STMMOD_FILENAME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Properties.OnInitPopup = cxDBComboBox3PropertiesInitPopup
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 341
      end
      object cxDBComboBox4: TcxDBComboBox
        Left = 320
        Top = 237
        DataBinding.DataField = 'IMP_TERM_ALL_G_EXPORT_TRACCIATO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Items.Strings = (
          ''
          'SIENA - Allegato F/G - Impianti termici'
          'VANZOTECH - Allegato F/G - Impianti termici'
          'VESTASOFT - Allegato F - Impianti termici'
          'VESTASOFT - Allegato G - Impianti termici')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 341
      end
      object DBEdit1: TDBEdit
        Left = 331
        Top = 270
        Width = 150
        Height = 20
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'IMP_TERM_MANUTENTORE_CODICE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object dbeAllegatoRCEE1_ModuloStampa: TcxDBComboBox
        Left = 320
        Top = 49
        DataBinding.DataField = 'TERM_RCEE1_STMMOD_FILENAME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Properties.OnInitPopup = dbeAllegatoRCEE1_ModuloStampaPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 341
      end
      object cxDBComboBox3: TcxDBComboBox
        Left = 320
        Top = 72
        DataBinding.DataField = 'TERM_RCEE1_EXPORT_TRACCIATO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Items.Strings = (
          ''
          'SIENA - Allegato F/G - Impianti termici'
          'VANZOTECH - Allegato F/G - Impianti termici'
          'VESTASOFT - Allegato F - Impianti termici'
          'VESTASOFT - Allegato G - Impianti termici')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 341
      end
      object dbeAllegatoRCEE1B_ModuloStampa: TcxDBComboBox
        Left = 320
        Top = 104
        DataBinding.DataField = 'TERM_RCEE1B_STMMOD_FILENAME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Properties.OnInitPopup = dbeAllegatoRCEE1B_ModuloStampaPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 341
      end
      object cxDBComboBox5: TcxDBComboBox
        Left = 320
        Top = 127
        DataBinding.DataField = 'TERM_RCEE1B_EXPORT_TRACCIATO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 341
      end
    end
    inherited PanelGriglia: TPanel
      Top = 706
      Height = 126
      ExplicitTop = 706
      ExplicitHeight = 126
      inherited GridList: TcxGrid
        Height = 114
        ExplicitHeight = 114
        inherited tvList: TcxGridDBTableView
          FilterRow.Visible = False
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Selection = nil
          object tvListID: TcxGridDBColumn
            Caption = 'Codice'
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 60
            Options.HorzSizing = False
            Width = 60
          end
          object tvListNOME: TcxGridDBColumn
            Caption = 'Nome ente / descrizione'
            DataBinding.FieldName = 'NOME'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            MinWidth = 350
            Options.HorzSizing = False
            SortIndex = 0
            SortOrder = soAscending
            Width = 350
          end
          object tvListNOTE: TcxGridDBColumn
            Caption = 'Note'
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
        end
      end
      inherited PanelFiltri: TPanel
        Top = 114
        Height = 12
        ExplicitTop = 114
        ExplicitHeight = 12
        inherited SubPanelFiltri: TPanel
          Height = 155
          ExplicitHeight = 155
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonStampa: TSpeedButton
      PopupMenu = MenuStampe
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM ENTI_X_ALLEGATI_MANUT'
      'WHERE'
      '   ID = :OLD_ID'
      '')
    EditSQL.Strings = (
      'UPDATE ENTI_X_ALLEGATI_MANUT SET'
      ''
      '  ID = :ID,'
      '  NOME = :NOME,'
      
        '  IMP_TERM_ALL_F_STMMOD_FILENAME = :IMP_TERM_ALL_F_STMMOD_FILENA' +
        'ME,'
      
        '  IMP_TERM_ALL_F_EXPORT_TRACCIATO = :IMP_TERM_ALL_F_EXPORT_TRACC' +
        'IATO,'
      
        '  IMP_TERM_ALL_G_STMMOD_FILENAME = :IMP_TERM_ALL_G_STMMOD_FILENA' +
        'ME,'
      
        '  IMP_TERM_ALL_G_EXPORT_TRACCIATO = :IMP_TERM_ALL_G_EXPORT_TRACC' +
        'IATO,'
      '  IMP_TERM_MANUTENTORE_CODICE = :IMP_TERM_MANUTENTORE_CODICE,'
      '  NOTE = :NOTE,'
      '  TERM_RCEE1_STMMOD_FILENAME = :TERM_RCEE1_STMMOD_FILENAME,'
      '  TERM_RCEE1_EXPORT_TRACCIATO = :TERM_RCEE1_EXPORT_TRACCIATO,'
      '  TERM_RCEE1B_STMMOD_FILENAME = :TERM_RCEE1B_STMMOD_FILENAME,'
      '  TERM_RCEE1B_EXPORT_TRACCIATO = :TERM_RCEE1B_EXPORT_TRACCIATO,'
      '  FRIGO_RCEE2_STMMOD_FILENAME = :FRIGO_RCEE2_STMMOD_FILENAME,'
      '  FRIGO_RCEE2_EXPORT_TRACCIATO = :FRIGO_RCEE2_EXPORT_TRACCIATO,'
      '  SCAMB_RCEE3_STMMOD_FILENAME = :SCAMB_RCEE3_STMMOD_FILENAME,'
      '  SCAMB_RCEE3_EXPORT_TRACCIATO = :SCAMB_RCEE3_EXPORT_TRACCIATO,'
      '  COGEN_RCEE4_STMMOD_FILENAME = :COGEN_RCEE4_STMMOD_FILENAME,'
      '  COGEN_RCEE4_EXPORT_TRACCIATO = :COGEN_RCEE4_EXPORT_TRACCIATO'
      ''
      'WHERE ID = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO ENTI_X_ALLEGATI_MANUT'
      '('
      '  ID,'
      '  NOME,'
      '  IMP_TERM_ALL_F_STMMOD_FILENAME,'
      '  IMP_TERM_ALL_F_EXPORT_TRACCIATO,'
      '  IMP_TERM_ALL_G_STMMOD_FILENAME,'
      '  IMP_TERM_ALL_G_EXPORT_TRACCIATO,'
      '  IMP_TERM_MANUTENTORE_CODICE,'
      '  NOTE,'
      '  TERM_RCEE1_STMMOD_FILENAME,'
      '  TERM_RCEE1_EXPORT_TRACCIATO,'
      '  TERM_RCEE1B_STMMOD_FILENAME,'
      '  TERM_RCEE1B_EXPORT_TRACCIATO,'
      '  FRIGO_RCEE2_STMMOD_FILENAME,'
      '  FRIGO_RCEE2_EXPORT_TRACCIATO,'
      '  SCAMB_RCEE3_STMMOD_FILENAME,'
      '  SCAMB_RCEE3_EXPORT_TRACCIATO,'
      '  COGEN_RCEE4_STMMOD_FILENAME,'
      '  COGEN_RCEE4_EXPORT_TRACCIATO'
      ')'
      'VALUES'
      '('
      '  :ID,'
      '  :NOME,'
      '  :IMP_TERM_ALL_F_STMMOD_FILENAME,'
      '  :IMP_TERM_ALL_F_EXPORT_TRACCIATO,'
      '  :IMP_TERM_ALL_G_STMMOD_FILENAME,'
      '  :IMP_TERM_ALL_G_EXPORT_TRACCIATO,'
      '  :IMP_TERM_MANUTENTORE_CODICE,'
      '  :NOTE,'
      '  :TERM_RCEE1_STMMOD_FILENAME,'
      '  :TERM_RCEE1_EXPORT_TRACCIATO,'
      '  :TERM_RCEE1B_STMMOD_FILENAME,'
      '  :TERM_RCEE1B_EXPORT_TRACCIATO,'
      '  :FRIGO_RCEE2_STMMOD_FILENAME,'
      '  :FRIGO_RCEE2_EXPORT_TRACCIATO,'
      '  :SCAMB_RCEE3_STMMOD_FILENAME,'
      '  :SCAMB_RCEE3_EXPORT_TRACCIATO,'
      '  :COGEN_RCEE4_STMMOD_FILENAME,'
      '  :COGEN_RCEE4_EXPORT_TRACCIATO'
      ')'
      '')
    PessimisticLocking = False
    BeforePost = QBeforePost
    SQL.Strings = (
      'SELECT * FROM ENTI_X_ALLEGATI_MANUT')
    object QID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QNOTE: TStringField
      FieldName = 'NOTE'
      Size = 255
    end
    object QIMP_TERM_ALL_F_STMMOD_FILENAME: TStringField
      FieldName = 'IMP_TERM_ALL_F_STMMOD_FILENAME'
      Size = 100
    end
    object QIMP_TERM_ALL_F_EXPORT_TRACCIATO: TStringField
      FieldName = 'IMP_TERM_ALL_F_EXPORT_TRACCIATO'
      Size = 100
    end
    object QIMP_TERM_ALL_G_STMMOD_FILENAME: TStringField
      FieldName = 'IMP_TERM_ALL_G_STMMOD_FILENAME'
      Size = 100
    end
    object QIMP_TERM_ALL_G_EXPORT_TRACCIATO: TStringField
      FieldName = 'IMP_TERM_ALL_G_EXPORT_TRACCIATO'
      Size = 100
    end
    object QIMP_TERM_MANUTENTORE_CODICE: TStringField
      FieldName = 'IMP_TERM_MANUTENTORE_CODICE'
    end
    object QTERM_RCEE1_STMMOD_FILENAME: TStringField
      FieldName = 'TERM_RCEE1_STMMOD_FILENAME'
      Size = 100
    end
    object QTERM_RCEE1_EXPORT_TRACCIATO: TStringField
      FieldName = 'TERM_RCEE1_EXPORT_TRACCIATO'
      Size = 100
    end
    object QTERM_RCEE1B_STMMOD_FILENAME: TStringField
      FieldName = 'TERM_RCEE1B_STMMOD_FILENAME'
      Size = 100
    end
    object QTERM_RCEE1B_EXPORT_TRACCIATO: TStringField
      FieldName = 'TERM_RCEE1B_EXPORT_TRACCIATO'
      Size = 100
    end
    object QFRIGO_RCEE2_STMMOD_FILENAME: TStringField
      FieldName = 'FRIGO_RCEE2_STMMOD_FILENAME'
      Size = 100
    end
    object QFRIGO_RCEE2_EXPORT_TRACCIATO: TStringField
      FieldName = 'FRIGO_RCEE2_EXPORT_TRACCIATO'
      Size = 100
    end
    object QSCAMB_RCEE3_STMMOD_FILENAME: TStringField
      FieldName = 'SCAMB_RCEE3_STMMOD_FILENAME'
      Size = 100
    end
    object QSCAMB_RCEE3_EXPORT_TRACCIATO: TStringField
      FieldName = 'SCAMB_RCEE3_EXPORT_TRACCIATO'
      Size = 100
    end
    object QCOGEN_RCEE4_STMMOD_FILENAME: TStringField
      FieldName = 'COGEN_RCEE4_STMMOD_FILENAME'
      Size = 100
    end
    object QCOGEN_RCEE4_EXPORT_TRACCIATO: TStringField
      FieldName = 'COGEN_RCEE4_EXPORT_TRACCIATO'
      Size = 100
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42422.923861145840000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object MenuStampe: TPopupMenu
    Left = 272
    Top = 33
    object RCEE1gruppitermici1: TMenuItem
      Caption = 'RCEE1   (gruppi termici)'
      object Anteprima3: TMenuItem
        Caption = 'Anteprima'
        OnClick = Anteprima3Click
      end
      object N1copia3: TMenuItem
        Tag = 1
        Caption = '1 copia'
        OnClick = Anteprima3Click
      end
      object N3copie3: TMenuItem
        Tag = 3
        Caption = '3 copie'
        OnClick = Anteprima3Click
      end
      object N6copie3: TMenuItem
        Tag = 6
        Caption = '6 copie'
        OnClick = Anteprima3Click
      end
      object N12copie3: TMenuItem
        Tag = 12
        Caption = '12 copie'
        OnClick = Anteprima3Click
      end
      object N24copie3: TMenuItem
        Tag = 24
        Caption = '24 copie'
        OnClick = Anteprima3Click
      end
      object N40copie1: TMenuItem
        Tag = 48
        Caption = '48 copie'
        OnClick = Anteprima3Click
      end
      object N96copie3: TMenuItem
        Tag = 96
        Caption = '96 copie'
        OnClick = Anteprima3Click
      end
    end
    object AllegatoFimpiantitermici1: TMenuItem
      Caption = 'Allegato F   (impianti termici)'
      object Anteprima2: TMenuItem
        Caption = 'Anteprima'
        OnClick = Anteprima2Click
      end
      object N1copia2: TMenuItem
        Tag = 1
        Caption = '1 copia'
        OnClick = Anteprima2Click
      end
      object N3copie2: TMenuItem
        Tag = 3
        Caption = '3 copie'
        OnClick = Anteprima2Click
      end
      object N6copie2: TMenuItem
        Tag = 6
        Caption = '6 copie'
        OnClick = Anteprima2Click
      end
      object N12copie2: TMenuItem
        Tag = 12
        Caption = '12 copie'
        OnClick = Anteprima2Click
      end
      object N24copie2: TMenuItem
        Tag = 24
        Caption = '24 copie'
        OnClick = Anteprima2Click
      end
      object N48copie2: TMenuItem
        Tag = 48
        Caption = '48 copie'
        OnClick = Anteprima2Click
      end
      object N96copie2: TMenuItem
        Tag = 96
        Caption = '96 copie'
        OnClick = Anteprima2Click
      end
    end
    object AllegatoGimpiantitermici1: TMenuItem
      Caption = 'Allegato G   (impianti termici)'
      object Anteprima1: TMenuItem
        Caption = 'Anteprima'
        OnClick = Anteprima1Click
      end
      object N1copia1: TMenuItem
        Tag = 1
        Caption = '1 copia'
        OnClick = Anteprima1Click
      end
      object N3copie1: TMenuItem
        Tag = 3
        Caption = '3 copie'
        OnClick = Anteprima1Click
      end
      object N6copie1: TMenuItem
        Tag = 6
        Caption = '6 copie'
        OnClick = Anteprima1Click
      end
      object N12copie1: TMenuItem
        Tag = 12
        Caption = '12 copie'
        OnClick = Anteprima1Click
      end
      object N24copie1: TMenuItem
        Tag = 24
        Caption = '24 copie'
        OnClick = Anteprima1Click
      end
      object N48copie1: TMenuItem
        Tag = 48
        Caption = '48 copie'
        OnClick = Anteprima1Click
      end
      object N96copie1: TMenuItem
        Tag = 96
        Caption = '96 copie'
        OnClick = Anteprima1Click
      end
    end
  end
  object ReportDesignerDialog1: TReportDesignerDialog
    BeforeExecuteScript = ReportDesignerDialog1BeforeExecuteScript
    LabelSettings.FirstLabel = 0
    LabelSettings.LabelCount = 0
    ShowFilterBeforePrint = False
    UseDataModules = False
    UseCurrentDatasets = False
    SaveLoadPrinterSetup = False
    ScriptsEnabled = True
    PrepareAutomatically = False
    PrintIfEmpty = True
    PrinterSettings.Copies = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    UsePrinterSettings = True
    UseModalPreview = False
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    Version = '1.59.0'
    SQLSettings.DelimiterType = delCustom
    UserSettings = [AllowSQLEdit, AllowDatasetEdit, AllowNewCalcFields, AllowBlockEdit, AllowScriptEdit]
    EditorSettings = [AutoEditAfterInsert, ShowDatafieldListbox, DatafieldsSorted]
    DefaultFileExtension = '.QR2'
    DefaultFileFilter = 'Reports|*.QR2'
    Left = 448
    Top = 9
  end
end
