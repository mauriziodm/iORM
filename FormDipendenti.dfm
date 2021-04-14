inherited DipendentiForm: TDipendentiForm
  Left = 37
  Top = 181
  Caption = 'DipendentiForm'
  ClientHeight = 1098
  ClientWidth = 770
  ExplicitWidth = 770
  ExplicitHeight = 1098
  DesignSize = (
    770
    1098)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 1021
    VertScrollBar.Range = 900
    ExplicitHeight = 1021
    object PanelGruppo4: TPanel [0]
      Left = 0
      Top = 713
      Width = 669
      Height = 129
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object Label32: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 129
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '4'
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
        ExplicitHeight = 137
      end
      object Label33: TLabel
        Left = 110
        Top = 53
        Width = 49
        Height = 12
        Caption = 'Tipo ore 1'
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
      object Label34: TLabel
        Left = 110
        Top = 78
        Width = 49
        Height = 12
        Caption = 'Tipo ore 2'
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
      object Label35: TLabel
        Left = 110
        Top = 103
        Width = 49
        Height = 12
        Caption = 'Tipo ore 3'
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
      object RichEdit5: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
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
          'Tipi ore')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbeTipoOre1: TcxDBComboBox
        Left = 246
        Top = 47
        DataBinding.DataField = 'TIPOORE1'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnInitPopup = dbeTipoOre1PropertiesInitPopup
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 195
      end
      object dbeTipoOre2: TcxDBComboBox
        Left = 246
        Top = 72
        DataBinding.DataField = 'TIPOORE2'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnInitPopup = dbeTipoOre2PropertiesInitPopup
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 195
      end
      object dbeTipoOre3: TcxDBComboBox
        Left = 246
        Top = 97
        DataBinding.DataField = 'TIPOORE3'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnInitPopup = dbeTipoOre3PropertiesInitPopup
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 195
      end
    end
    object PanelGruppo5: TPanel [1]
      Left = 0
      Top = 852
      Width = 669
      Height = 118
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      object Label14: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 118
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '5'
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
        ExplicitHeight = 137
      end
      object RichEdit3: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
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
          'Note'
          '')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBMemo1: TDBMemo
        Left = 246
        Top = 51
        Width = 414
        Height = 60
        Color = 16250871
        DataField = 'NOTE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object PanelGruppo3: TPanel [2]
      Left = 0
      Top = 438
      Width = 669
      Height = 265
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object Label16: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 265
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
      end
      object Label17: TLabel
        Left = 110
        Top = 53
        Width = 69
        Height = 12
        Caption = 'Ore contratto'
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
      object Label18: TLabel
        Left = 110
        Top = 77
        Width = 45
        Height = 12
        Caption = 'Ore ferie'
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
      object Label19: TLabel
        Left = 110
        Top = 101
        Width = 65
        Height = 12
        Caption = 'Ore permessi'
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
      object Label20: TLabel
        Left = 110
        Top = 141
        Width = 60
        Height = 12
        Caption = 'Costo orario'
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
      object Label21: TLabel
        Left = 334
        Top = 141
        Width = 118
        Height = 12
        Caption = 'Prezzo di vendita orario'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label22: TLabel
        Left = 542
        Top = 141
        Width = 39
        Height = 12
        Caption = 'Ricarico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label23: TLabel
        Left = 643
        Top = 141
        Width = 14
        Height = 13
        Caption = '%'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label24: TLabel
        Left = 110
        Top = 165
        Width = 127
        Height = 12
        Caption = 'Costo orario straordinario'
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
      object Label25: TLabel
        Left = 334
        Top = 165
        Width = 118
        Height = 12
        Caption = 'Prezzo di vendita orario'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label26: TLabel
        Left = 542
        Top = 165
        Width = 39
        Height = 12
        Caption = 'Ricarico'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label27: TLabel
        Left = 643
        Top = 165
        Width = 14
        Height = 13
        Caption = '%'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label28: TLabel
        Left = 110
        Top = 189
        Width = 107
        Height = 12
        Caption = 'Costo orario permessi'
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
        Left = 110
        Top = 213
        Width = 87
        Height = 12
        Caption = 'Costo orario ferie'
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
      object Label30: TLabel
        Left = 110
        Top = 237
        Width = 109
        Height = 12
        Caption = 'Costo orario trasferte'
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
      object RichEdit4: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
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
          'Parametri')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit12: TDBEdit
        Left = 246
        Top = 51
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'HCONTRATTO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 246
        Top = 75
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'HFERIE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit14: TDBEdit
        Left = 246
        Top = 99
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'HPERMESSI'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit15: TDBEdit
        Left = 246
        Top = 139
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COSTOORARIO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit16: TDBEdit
        Left = 462
        Top = 139
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'PRZVENDORARIO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object DBEdit17: TDBEdit
        Tag = -1
        Left = 590
        Top = 139
        Width = 51
        Height = 21
        Cursor = crIBeam
        TabStop = False
        AutoSize = False
        Color = 14737632
        Ctl3D = False
        DataField = 'RICARICO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Visible = False
      end
      object DBEdit18: TDBEdit
        Left = 246
        Top = 163
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COSTOSTR'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit19: TDBEdit
        Left = 462
        Top = 163
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'PRZVENDORARIOSTR'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object DBEdit20: TDBEdit
        Tag = -1
        Left = 590
        Top = 163
        Width = 51
        Height = 21
        Cursor = crIBeam
        TabStop = False
        AutoSize = False
        Color = 14737632
        Ctl3D = False
        DataField = 'RICARICOSTR'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Visible = False
      end
      object DBEdit21: TDBEdit
        Left = 246
        Top = 187
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COSTOPERMESSI'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit22: TDBEdit
        Left = 246
        Top = 211
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COSTOFERIE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit23: TDBEdit
        Left = 246
        Top = 235
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COSTOTRASFERTE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
      end
      object DbeTipoManodopera: TcxDBRadioGroup
        Left = 314
        Top = 8
        Caption = ' Tipo di manodopera '
        DataBinding.DataField = 'OPERAINDEX'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Columns = 2
        Properties.DefaultValue = 0
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Value = 0
          end
          item
            Value = 1
          end
          item
            Value = 2
          end
          item
            Value = 3
          end
          item
            Value = 4
          end>
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        Height = 73
        Width = 351
      end
    end
    object PanelGruppo1: TPanel [3]
      Left = 0
      Top = 0
      Width = 669
      Height = 281
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 281
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
        Top = 53
        Width = 45
        Height = 12
        Caption = 'Cognome'
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
        Top = 77
        Width = 28
        Height = 12
        Caption = 'Nome'
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
      object Label2: TLabel
        Left = 110
        Top = 101
        Width = 43
        Height = 12
        Caption = 'Indirizzo'
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
        Left = 110
        Top = 125
        Width = 40
        Height = 12
        Caption = 'Localit'#224
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
        Top = 149
        Width = 46
        Height = 12
        Caption = 'Provincia'
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
        Top = 173
        Width = 21
        Height = 12
        Caption = 'CAP'
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
      object Label7: TLabel
        Left = 110
        Top = 197
        Width = 75
        Height = 12
        Caption = 'Data di nascita'
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
        Left = 110
        Top = 221
        Width = 81
        Height = 12
        Caption = 'Luogo di nascita'
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
      object Label9: TLabel
        Left = 110
        Top = 245
        Width = 69
        Height = 12
        Caption = 'Codice Fiscale'
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
      object Label15: TLabel
        Left = 558
        Top = 101
        Width = 12
        Height = 12
        Caption = 'N'#176
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
        DataField = 'CODICE'
        DataSource = DS
      end
      object Label31: TLabel
        Left = 312
        Top = 24
        Width = 329
        Height = 12
        Caption = 
          'NB: Se disattivato  non sar'#224' visibile  per i rapportini e i docu' +
          'menti'
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
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
        Width = 152
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
          'Dati anagrafici')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBECognome: TDBEdit
        Left = 246
        Top = 51
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'COGNOME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBENome: TDBEdit
        Left = 246
        Top = 75
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 246
        Top = 99
        Width = 300
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'INDIRIZZO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 246
        Top = 123
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CITTA'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit4: TDBEdit
        Left = 246
        Top = 147
        Width = 40
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'PROVINCIA'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit5: TDBEdit
        Left = 246
        Top = 171
        Width = 60
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CAP'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit6: TDBEdit
        Left = 246
        Top = 195
        Width = 200
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'DATANASCITA'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit7: TDBEdit
        Left = 246
        Top = 219
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'LUOGONASCITA'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
      end
      object DBEdit1: TDBEdit
        Left = 246
        Top = 243
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CODICEFISCALE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit11: TDBEdit
        Left = 574
        Top = 99
        Width = 83
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NUMCIVICO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 241
        Top = 20
        Caption = 'Attivo'
        DataBinding.DataField = 'ENABLED'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 11
        Width = 65
      end
    end
    object PanelGruppo2: TPanel [4]
      Left = 0
      Top = 291
      Width = 669
      Height = 137
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object Label10: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 137
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
      end
      object Label11: TLabel
        Left = 110
        Top = 53
        Width = 44
        Height = 12
        Caption = 'Telefono'
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
        Left = 110
        Top = 77
        Width = 43
        Height = 12
        Caption = 'Cellulare'
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
        Left = 110
        Top = 101
        Width = 31
        Height = 12
        Caption = 'E-mail'
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
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
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
          'Recapiti')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 246
        Top = 51
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'TELEFONO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 246
        Top = 75
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CELLULARE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 246
        Top = 99
        Width = 300
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'EMAIL'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
    end
    inherited PanelGriglia: TPanel
      Top = 921
      Height = 100
      TabOrder = 5
      ExplicitTop = 921
      ExplicitHeight = 100
      inherited GridList: TcxGrid
        Height = 100
        ExplicitHeight = 100
        inherited tvList: TcxGridDBTableView
          DataController.DetailKeyFieldNames = 'CODICE'
          DataController.KeyFieldNames = 'CODICE'
          OptionsCustomize.ColumnSorting = False
          OptionsData.DeletingConfirmation = False
          OptionsSelection.MultiSelect = False
          OptionsView.DataRowHeight = 25
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          object tvListENABLED: TcxGridDBColumn
            DataBinding.FieldName = 'ENABLED'
            OnGetDisplayText = tvListENABLEDGetDisplayText
            SortIndex = 0
            SortOrder = soDescending
            Width = 30
            IsCaptionAssigned = True
          end
          object tvListCODICE: TcxGridDBColumn
            Caption = 'Cod.'
            DataBinding.FieldName = 'CODICE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object tvListNOME: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            SortIndex = 1
            SortOrder = soAscending
          end
          object tvListCOGNOME: TcxGridDBColumn
            Caption = 'Cognome'
            DataBinding.FieldName = 'COGNOME'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            SortIndex = 2
            SortOrder = soAscending
          end
          object tvListCITTA: TcxGridDBColumn
            Caption = 'Citt'#224
            DataBinding.FieldName = 'CITTA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
          end
          object tvListINDIRIZZO: TcxGridDBColumn
            Caption = 'Indirizzo'
            DataBinding.FieldName = 'INDIRIZZO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
          end
          object tvListNUMCIVICO: TcxGridDBColumn
            Caption = 'N'#176
            DataBinding.FieldName = 'NUMCIVICO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
          end
          object tvListCAP: TcxGridDBColumn
            DataBinding.FieldName = 'CAP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListPROVINCIA: TcxGridDBColumn
            Caption = 'Prov.'
            DataBinding.FieldName = 'PROVINCIA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object tvListTELEFONO: TcxGridDBColumn
            Caption = 'Telefono'
            DataBinding.FieldName = 'TELEFONO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListCELLULARE: TcxGridDBColumn
            Caption = 'Cellulare'
            DataBinding.FieldName = 'CELLULARE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListCODICEFISCALE: TcxGridDBColumn
            Caption = 'Codice Fiscale'
            DataBinding.FieldName = 'CODICEFISCALE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListDATANASCITA: TcxGridDBColumn
            Caption = 'Data nasc.'
            DataBinding.FieldName = 'DATANASCITA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListLUOGONASCITA: TcxGridDBColumn
            Caption = 'Luogo nasc.'
            DataBinding.FieldName = 'LUOGONASCITA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListEMAIL: TcxGridDBColumn
            Caption = 'E-mail'
            DataBinding.FieldName = 'EMAIL'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListNOTE: TcxGridDBColumn
            Caption = 'Note'
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
        end
      end
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM DIPENDENTI'
      'WHERE CODICE = :OLD_CODICE'
      '')
    EditSQL.Strings = (
      'UPDATE DIPENDENTI SET'
      ''
      '      Codice = :Codice ,'
      '      Cognome  = :Cognome  ,'
      '      Nome  = :Nome  ,'
      '      Indirizzo  = :Indirizzo  ,'
      '      NumCivico  = :NumCivico  ,'
      '      Citta  = :Citta  ,'
      '      CAP  = :CAP  ,'
      '      Provincia = :Provincia ,'
      '      Telefono  = :Telefono  ,'
      '      Cellulare = :Cellulare ,'
      '      COdiceFiscale = :COdiceFiscale ,'
      '      DataNascita = :DataNascita ,'
      '      LuogoNascita = :LuogoNascita ,'
      '      EMail = :EMail ,'
      '      Note = :Note ,'
      '      HContratto = :HContratto ,'
      '      HFerie = :HFerie ,'
      '      HPermessi = :HPermessi ,'
      '      CostoOrario = :CostoOrario ,'
      '      PrzVendOrario = :PrzVendOrario ,'
      '      CostoStr = :CostoStr ,'
      '      PrzVendOrarioStr = :PrzVendOrarioStr ,'
      '      COSTOPERMESSI = :COSTOPERMESSI,'
      '      COSTOFERIE = :COSTOFERIE,'
      '      COSTOTRASFERTE = :COSTOTRASFERTE,'
      '      OPERAINDEX = :OPERAINDEX,'
      '      ENABLED = :ENABLED,'
      '      TIPOORE1 = :TIPOORE1,'
      '      TIPOORE2 = :TIPOORE2,'
      '      TIPOORE3 = :TIPOORE3'
      ''
      'WHERE CODICE = :OLD_CODICE'
      '')
    BeforeDelete = QBeforeDelete
    BeforePost = QBeforePost
    OnCalcFields = QCalcFields
    OnNewRecord = QNewRecord
    SQL.Strings = (
      'SELECT * FROM DIPENDENTI')
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QCOGNOME: TStringField
      FieldName = 'COGNOME'
      Size = 40
    end
    object QNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 40
    end
    object QNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QCITTA: TStringField
      FieldName = 'CITTA'
      Size = 25
    end
    object QCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object QPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object QTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
    object QCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Size = 30
    end
    object QCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Size = 16
    end
    object QDATANASCITA: TDateTimeField
      FieldName = 'DATANASCITA'
      EditMask = '!99/99/9999;1;_'
    end
    object QLUOGONASCITA: TStringField
      FieldName = 'LUOGONASCITA'
      Size = 30
    end
    object QEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object QNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QHCONTRATTO: TIBOFloatField
      FieldName = 'HCONTRATTO'
    end
    object QHFERIE: TIBOFloatField
      FieldName = 'HFERIE'
    end
    object QHPERMESSI: TIBOFloatField
      FieldName = 'HPERMESSI'
    end
    object QCOSTOORARIO: TIBOFloatField
      FieldName = 'COSTOORARIO'
      currency = True
    end
    object QPRZVENDORARIO: TIBOFloatField
      FieldName = 'PRZVENDORARIO'
      currency = True
    end
    object QCOSTOSTR: TIBOFloatField
      FieldName = 'COSTOSTR'
      currency = True
    end
    object QPRZVENDORARIOSTR: TIBOFloatField
      FieldName = 'PRZVENDORARIOSTR'
      currency = True
    end
    object QRICARICOSTR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RICARICOSTR'
      Calculated = True
    end
    object QRICARICO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RICARICO'
      Calculated = True
    end
    object QCOSTOPERMESSI: TIBOFloatField
      FieldName = 'COSTOPERMESSI'
      currency = True
    end
    object QCOSTOFERIE: TIBOFloatField
      FieldName = 'COSTOFERIE'
      currency = True
    end
    object QCOSTOTRASFERTE: TIBOFloatField
      FieldName = 'COSTOTRASFERTE'
      currency = True
    end
    object QOPERAINDEX: TIntegerField
      FieldName = 'OPERAINDEX'
    end
    object QENABLED: TStringField
      FieldName = 'ENABLED'
      FixedChar = True
      Size = 1
    end
    object QTIPOORE1: TStringField
      FieldName = 'TIPOORE1'
    end
    object QTIPOORE2: TStringField
      FieldName = 'TIPOORE2'
    end
    object QTIPOORE3: TStringField
      FieldName = 'TIPOORE3'
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 43088.946112071760000000
      AssignedFormatValues = []
      BuiltInReportLink = True
    end
  end
  object ImageList1: TImageList
    Left = 104
    Top = 24
    Bitmap = {
      494C010101000300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800000000000000000000000000000000000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080000000
      0000808080008080800080808000000000000000000000000000000000000000
      0000000000008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000000000000000
      0000000000008080800080808000808080000000000000000000000000000000
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000000000000000
      0000000000000000000080808000808080008080800000000000000000000000
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000000000000000
      0000000000000000000000000000808080008080800080808000000000000000
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000000000000000
      0000000000000000000000000000000000008080800080808000808080000000
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800000000000000000000000000000000000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E007000000000000
      C3C300000000000087F100000000000083F900000000000011F8000000000000
      38FC0000000000003C7C0000000000003E3C0000000000003F1C000000000000
      3F880000000000009FC10000000000008FE1000000000000C3C3000000000000
      E007000000000000F81F00000000000000000000000000000000000000000000
      000000000000}
  end
end
