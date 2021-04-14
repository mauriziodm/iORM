object TecniciForm: TTecniciForm
  Left = 551
  Top = 246
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '(Tecnici)'
  ClientHeight = 807
  ClientWidth = 705
  Color = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ClientArea: TPanel
    Left = 0
    Top = 68
    Width = 686
    Height = 725
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object PanelGruppo5: TPanel
      Left = 0
      Top = 533
      Width = 686
      Height = 67
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      object LabelGruppo5: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 67
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
      end
      object RichEdit4: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'Assegna automaticamente il seguente REGISTRO al documento a cui ' +
            'fa rif. l'#39'intervento')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Zoom = 100
      end
      object DbeRegistro: TcxDBComboBox
        Left = 140
        Top = 32
        Cursor = crHandPoint
        DataBinding.DataField = 'REGISTRO'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnInitPopup = DbeRegistroPropertiesInitPopup
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 73
      end
    end
    object PanelGruppo4: TPanel
      Left = 0
      Top = 436
      Width = 686
      Height = 87
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object LabelGruppo4: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 87
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
      end
      object Label13: TLabel
        Left = 135
        Top = 36
        Width = 62
        Height = 12
        Caption = 'Magazzino 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 135
        Top = 60
        Width = 62
        Height = 12
        Caption = 'Magazzino 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 382
        Top = 47
        Width = 229
        Height = 12
        Caption = '(NB: Premi "Canc" sulla tastiera per azzerare)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape30: TShape
        Left = 367
        Top = 29
        Width = 1
        Height = 50
      end
      object Shape31: TShape
        Left = 368
        Top = 53
        Width = 8
        Height = 1
      end
      object Shape32: TShape
        Left = 359
        Top = 29
        Width = 8
        Height = 1
      end
      object Shape33: TShape
        Left = 359
        Top = 78
        Width = 8
        Height = 1
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 81
        Top = 3
        Caption = 'Assegna automaticamente il seguente MAGAZZINO al documento'
        DataBinding.DataField = 'ASSEGNAMAGAZZINO'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
      end
      object dbeMagazzino1: TcxDBLookupComboBox
        Left = 203
        Top = 33
        Cursor = crHandPoint
        AutoSize = False
        DataBinding.DataField = 'CODICEMAGAZZINO1'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.ClearKey = 46
        Properties.DropDownSizeable = True
        Properties.DropDownWidth = 300
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'CODICE'
        Properties.ListColumns = <
          item
            Caption = 'Codice'
            Fixed = True
            HeaderAlignment = taCenter
            SortOrder = soAscending
            Width = 65
            FieldName = 'CODICE'
          end
          item
            Caption = 'Descrizione'
            HeaderAlignment = taCenter
            Width = 150
            FieldName = 'DESCRIZIONE'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = SourceMag
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Height = 20
        Width = 150
      end
      object dbeMagazzino2: TcxDBLookupComboBox
        Left = 203
        Top = 57
        Cursor = crHandPoint
        AutoSize = False
        DataBinding.DataField = 'CODICEMAGAZZINO2'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.ClearKey = 46
        Properties.DropDownSizeable = True
        Properties.DropDownWidth = 300
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'CODICE'
        Properties.ListColumns = <
          item
            Caption = 'Codice'
            Fixed = True
            HeaderAlignment = taCenter
            SortOrder = soAscending
            Width = 65
            FieldName = 'CODICE'
          end
          item
            Caption = 'Descrizione'
            HeaderAlignment = taCenter
            Width = 150
            FieldName = 'DESCRIZIONE'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = SourceMag
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 20
        Width = 150
      end
    end
    object PanelGruppo1: TPanel
      Left = 0
      Top = 2
      Width = 686
      Height = 105
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
        Height = 105
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
        ExplicitHeight = 63
      end
      object LabelSoprannome: TLabel
        Left = 110
        Top = 35
        Width = 63
        Height = 12
        Caption = 'Nome/Titolo'
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
      object Label11: TLabel
        Left = 505
        Top = 35
        Width = 31
        Height = 12
        Caption = 'Colore'
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
        Left = 322
        Top = 35
        Width = 35
        Height = 12
        Caption = 'Gruppo'
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
      object SBAnnullaColore: TSpeedButton
        Left = 545
        Top = 8
        Width = 121
        Height = 20
        Caption = 'Annulla selezione colore'
        Enabled = False
        Flat = True
        OnClick = SBAnnullaColoreClick
      end
      object Label16: TLabel
        Left = 392
        Top = 62
        Width = 145
        Height = 12
        Caption = 'Operatore correlato (mobile)'
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
        Left = 110
        Top = 62
        Width = 94
        Height = 12
        Caption = 'Google calendar ID'
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
      object RichEdit3: TRichEdit
        Tag = -1
        Left = 83
        Top = 5
        Width = 406
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
          'Dati per la visualizzazione sull'#39'agenda')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Zoom = 100
      end
      object eSoprannome: TDBEdit
        Left = 180
        Top = 31
        Width = 121
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'RESOURCENAME'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object eColore: TcxDBColorComboBox
        Left = 545
        Top = 30
        DataBinding.DataField = 'RESOURCECOLOR'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.CustomColors = <>
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlack
        Style.TransparentBorder = False
        Style.ButtonStyle = btsUltraFlat
        Style.PopupBorderStyle = epbsDefault
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 121
      end
      object eGruppo: TcxDBComboBox
        Left = 361
        Top = 29
        DataBinding.DataField = 'GRUPPO'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Sorted = True
        Properties.OnInitPopup = cxDBComboBox1PropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 123
      end
      object eOperatoreCorrelato: TcxDBComboBox
        Left = 544
        Top = 57
        DataBinding.DataField = 'OPERATORECORRELATO'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Sorted = True
        Properties.OnInitPopup = eOperatoreCorrelatoPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 123
      end
      object eGoogleCalendarID: TDBEdit
        Left = 210
        Top = 58
        Width = 166
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'GCAL_CALENDAR_ID'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object eAbilitato: TcxDBCheckBox
        Left = 105
        Top = 83
        Caption = 'Abilitato/Visibile/Selezionabile'
        DataBinding.DataField = 'ABILITATO'
        DataBinding.DataSource = SourceTecnici
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
      end
    end
    object PanelGruppo3: TPanel
      Left = 0
      Top = 313
      Width = 686
      Height = 113
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object LabelGruppo3: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 113
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
        ExplicitHeight = 138
      end
      object Label5: TLabel
        Left = 110
        Top = 35
        Width = 400
        Height = 21
        AutoSize = False
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
      object Label6: TLabel
        Left = 445
        Top = 35
        Width = 58
        Height = 21
        AutoSize = False
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
      object Label7: TLabel
        Left = 110
        Top = 59
        Width = 150
        Height = 21
        AutoSize = False
        Caption = 'Altro telefono'
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
        Top = 83
        Width = 150
        Height = 21
        AutoSize = False
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
        Top = 5
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
          'Recapiti telefonici e E-mail')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Zoom = 100
      end
      object DBEdit6: TDBEdit
        Left = 246
        Top = 35
        Width = 170
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'TELEFONO'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 496
        Top = 35
        Width = 170
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CELLULARE'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 246
        Top = 59
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'ALTROTELEFONO'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 246
        Top = 83
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'EMAIL'
        DataSource = SourceTecnici
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
    object PanelGruppo2: TPanel
      Left = 0
      Top = 117
      Width = 686
      Height = 186
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object LabelGruppo2: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 186
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
      object Label4: TLabel
        Left = 110
        Top = 35
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Cognome e nome'
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
        Top = 83
        Width = 400
        Height = 21
        AutoSize = False
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
      object Label2: TLabel
        Left = 110
        Top = 107
        Width = 187
        Height = 21
        AutoSize = False
        Caption = 'CAP,   Citt'#224',   Provincia'
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
        Top = 132
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Estremi doc. di qualifica'
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
      object Label10: TLabel
        Left = 110
        Top = 59
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Ragione Sociale'
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
        Top = 156
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Codice operatore manut.'
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
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 5
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
          'Dati anagrafici')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Zoom = 100
      end
      object DBEdit1: TDBEdit
        Left = 246
        Top = 35
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOME'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 246
        Top = 83
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'INDIRIZZO'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 246
        Top = 107
        Width = 70
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CAP'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 319
        Top = 107
        Width = 290
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CITTA'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 612
        Top = 107
        Width = 54
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'PROVINCIA'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 246
        Top = 131
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'ESTREMIDOCQUALIFICA'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 246
        Top = 59
        Width = 420
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'RAGIONESOCIALE'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit12: TDBEdit
        Left = 246
        Top = 155
        Width = 200
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'IMPTERM_MANUT_CODICEOPERATORE'
        DataSource = SourceTecnici
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
    end
    object GridList: TcxGrid
      Left = 0
      Top = 604
      Width = 686
      Height = 58
      TabOrder = 5
      LookAndFeel.NativeStyle = False
      object tvDiBa: TcxGridTableView
        DragMode = dmAutomatic
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragFocusing = dfDragDrop
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.Background = DM1.tvDisBackground
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        object tvDiBaMOVMAG: TcxGridColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          MinWidth = 23
          Width = 23
          IsCaptionAssigned = True
        end
        object tvDiBaCODICEMAGAZZINO: TcxGridColumn
          Caption = 'M'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Width = 19
        end
        object tvDiBaCODICEMAGAZZINO2: TcxGridColumn
          Caption = 'M2'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Width = 19
        end
        object tvDiBaCODICEARTICOLO: TcxGridColumn
          Caption = 'Cod.reale'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          MinWidth = 0
          Styles.Content = DM1.tvGCDetailContent_DatiDoc
          Styles.Header = DM1.tvDisHeader
          Width = 60
        end
        object tvDiBaCODICEARTICOLOSTM: TcxGridColumn
          Caption = 'Codice'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaDESCRIZIONE: TcxGridColumn
          Caption = 'Descrizione'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.MaxLength = 5000
          HeaderAlignmentHorz = taCenter
          MinWidth = 290
          Width = 290
        end
        object tvDiBaPREZZOUNITARIO: TcxGridColumn
          Caption = 'Prz.unit.'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          MinWidth = 61
          Width = 61
        end
        object tvDiBaPREZZOUNITARIOIVACOMPRESA: TcxGridColumn
          Caption = 'P.U.IVA comp.'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 61
          Width = 61
        end
        object tvDiBaPRZUNITNETTO: TcxGridColumn
          Caption = 'Prz.Un.Netto'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
        end
        object tvDiBaUNITADIMISURA: TcxGridColumn
          Caption = 'UM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          MinWidth = 25
          Width = 25
        end
        object tvDiBaQTA: TcxGridColumn
          Caption = 'Qt'#224
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          HeaderAlignmentHorz = taCenter
          MinWidth = 32
          Width = 32
        end
        object tvDiBaQTAINEVASIONE: TcxGridColumn
          Tag = -1
          Caption = 'In ev.'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          HeaderAlignmentHorz = taCenter
          Styles.Content = DM1.tvAnotherContent1Bold
          Width = 40
        end
        object tvDiBaQTAEVASA: TcxGridColumn
          Tag = -1
          Caption = 'Q.Ev'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          HeaderAlignmentHorz = taCenter
          Styles.Content = DM1.tvAnotherContent2
          Width = 35
        end
        object tvDiBaQTADAEVADERE: TcxGridColumn
          Tag = -1
          Caption = 'Q.D.E.'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          HeaderAlignmentHorz = taCenter
          Styles.Content = DM1.tvAnotherContent2
          Width = 35
        end
        object tvDiBaSCONTORIGO: TcxGridColumn
          Caption = 'S1'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 25
          Width = 25
        end
        object tvDiBaSCONTORIGO2: TcxGridColumn
          Caption = 'S2'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 25
          Width = 25
        end
        object tvDiBaSCONTORIGO3: TcxGridColumn
          Caption = 'S3'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 25
          Width = 25
        end
        object tvDiBaIMPORTORIGO: TcxGridColumn
          Caption = 'Importo'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaIMPORTORIGOIVACOMPRESA: TcxGridColumn
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaCODICEIVA: TcxGridColumn
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaDESCRIZIONEIVA: TcxGridColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaALIQUOTAIVA: TcxGridColumn
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaNOTERIGO: TcxGridColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
        end
        object tvDiBaPREZZOACQUISTOARTICOLO: TcxGridColumn
          Caption = 'Costo unit.'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Width = 65
        end
        object tvDiBaMARGINE: TcxGridColumn
          Caption = 'M.%'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-,0'
          HeaderAlignmentHorz = taCenter
          MinWidth = 40
          Width = 40
        end
        object tvDiBaIMPORTOMARGINE: TcxGridColumn
          Caption = 'Margine'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          MinWidth = 50
          Width = 50
        end
        object tvDiBaPRZUNITOPERA: TcxGridColumn
          Caption = 'Prz.Opera'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 70
          Width = 70
        end
        object tvDiBaQTAOPERA: TcxGridColumn
          Caption = 'Qta.opera'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 70
          Width = 70
        end
        object tvDiBaIMPORTOOPERA: TcxGridColumn
          Caption = 'Importo opera'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 70
          Width = 70
        end
        object tvDiBaIMPORTOCOMPONENTI: TcxGridColumn
          Caption = 'Im.Componenti'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 70
          Width = 70
        end
        object tvDiBaSELEZIONATO: TcxGridColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          MinWidth = 64
        end
        object tvDiBaMINUTIPREVISTI: TcxGridColumn
          Caption = 'MP'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          MinWidth = 64
          Options.Filtering = False
          Options.IncSearch = False
          Options.FilteringMRUItemsList = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
        end
        object tvDiBaSOTTOCANTIERE1: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 1'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 90
          Options.Filtering = False
          Options.IncSearch = False
          Options.FilteringMRUItemsList = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 90
        end
        object tvDiBaSOTTOCANTIERE2: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 2'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 90
          Options.Filtering = False
          Options.IncSearch = False
          Options.FilteringMRUItemsList = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 90
        end
        object tvDiBaSOTTOCANTIERE3: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 3'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 90
          Options.Filtering = False
          Options.IncSearch = False
          Options.FilteringMRUItemsList = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 90
        end
        object tvDiBaSOTTOCANTIERE4: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 4'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaSOTTOCANTIERE5: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 5'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            'GAS'
            'IDRO'
            'TERMO')
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaSOTTOCANTIERE6: TcxGridColumn
          Tag = -1
          Caption = 'Sottocantiere 6'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaS3RIF: TcxGridColumn
          Tag = -1
          Caption = 'Rif.'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3UBICAZIONE: TcxGridColumn
          Tag = -1
          Caption = 'Ubicazione'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3COMPONENTE: TcxGridColumn
          Tag = -1
          Caption = 'Componente'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3MATERIALE: TcxGridColumn
          Tag = -1
          Caption = 'Materiale'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3QTA: TcxGridColumn
          Tag = -1
          Caption = 'Qta'#39' Dich.'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3DIAMETRO: TcxGridColumn
          Tag = -1
          Caption = 'Diametro'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3LUNGHEZZA: TcxGridColumn
          Tag = -1
          Caption = 'Lunghezza'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3INSTALLAZIONE: TcxGridColumn
          Tag = -1
          Caption = 'Installazione'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3CERTIFICAZIONE: TcxGridColumn
          Tag = -1
          Caption = 'Certificazione'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3VENTILAZIONE: TcxGridColumn
          Tag = -1
          Caption = 'Ventilazione'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3SCARICO: TcxGridColumn
          Tag = -1
          Caption = 'Scarico'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3TIPO: TcxGridColumn
          Tag = -1
          Caption = 'Tipo'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3MODELLO: TcxGridColumn
          Tag = -1
          Caption = 'Modello'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3PORTATATERMICA: TcxGridColumn
          Tag = -1
          Caption = 'Portata termica'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3TIPOCOLLEGAMENTO: TcxGridColumn
          Tag = -1
          Caption = 'Tipo collegamento'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3INSTALLATOINSTALLABILE: TcxGridColumn
          Tag = -1
          Caption = 'Instalato/Installabile'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaS3MATERIALEAPPARECCHIO: TcxGridColumn
          Tag = -1
          Caption = 'Mat/App'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDiBaTIPO1: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 1'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTIPO2: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 2'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTIPO3: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 3'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTIPO4: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 4'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTIPO5: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 5'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTIPO6: TcxGridColumn
          Tag = -1
          Caption = 'Tipo 6'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvDiBaTODELETE: TcxGridColumn
          DataBinding.ValueType = 'Boolean'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Visible = False
          Width = 30
        end
        object tvDiBaGC_COSTONETTOUNITARIO_MOD: TcxGridColumn
          Caption = 'Costo netto unitario MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvDiBaGC_COSTONETTOUNITARIO: TcxGridColumn
          Caption = 'Costo netto unitario'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Visible = False
          VisibleForCustomization = False
          Width = 70
        end
        object tvDiBaGC_RICARICO_MOD: TcxGridColumn
          Caption = 'Ricarico MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvDiBaGC_RICARICO: TcxGridColumn
          Caption = 'Ricarico'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
        end
        object tvDiBaGC_QTA_MOD: TcxGridColumn
          Caption = 'Qta MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvDiBaGC_QTA: TcxGridColumn
          Caption = 'Qta'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
        end
        object tvDiBaGC_DESCRIZIONE_MOD: TcxGridColumn
          Caption = 'Descrizione MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvDiBaGC_DESCRIZIONE: TcxGridColumn
          Caption = 'Descrizione'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.MaxLength = 5000
          Properties.WantReturns = False
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 290
        end
        object tvDiBaGUID: TcxGridColumn
          Caption = 'GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
        object tvDiBaGUID_REF: TcxGridColumn
          Caption = 'Ref. GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
        object tvDiBaGUID_ANCESTOR: TcxGridColumn
          Caption = 'Anc. GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
        object tvDiBaORDER: TcxGridColumn
          Tag = 1
          Caption = 'Ord'
          DataBinding.ValueType = 'Float'
        end
        object tvDiBaIDAPPARECCHIO: TcxGridColumn
          Caption = 'Apparecchio'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'Tipo'
              SortOrder = soAscending
              Width = 110
              FieldName = 'TIPOAPPARECCHIO'
            end
            item
              Caption = 'Apparecchio'
              SortOrder = soAscending
              Width = 300
              FieldName = 'COMPUTED_APPARECCHIO_FULL'
            end
            item
              Caption = 'Costruito'
              Width = 60
              FieldName = 'ANNOCOSTRUZIONE'
            end
            item
              Caption = 'Installato'
              Width = 70
              FieldName = 'DATAINSTALLAZIONE'
            end
            item
              Caption = 'Collaudo'
              Width = 70
              FieldName = 'DATACOLLAUDO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListOptions.CaseInsensitive = True
          HeaderAlignmentHorz = taCenter
          Width = 250
        end
        object tvDiBaIDOPIMPEGNO: TcxGridColumn
          Caption = 'Id Op imp.'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
        end
      end
      object cvTot: TcxGridCardView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        LayoutDirection = ldVertical
        OptionsCustomize.RowFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.CaptionSeparator = #0
        OptionsView.CardBorderWidth = 1
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 300
        Styles.Selection = DM1.tvSelected
        Styles.StyleSheet = DM1.cvEnabledStyleSheet
        object cvTotCOMPONENTI: TcxGridCardViewRow
          Caption = 'Costo componenti'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
          Properties.ReadOnly = True
          Position.BeginsLayer = True
        end
        object cvTotMARGINE: TcxGridCardViewRow
          Caption = 'Ricarico %'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00%;-,0.00%'
          Properties.ReadOnly = True
          Position.BeginsLayer = True
        end
        object cvTotIMPORTOMARGINE: TcxGridCardViewRow
          Caption = 'Importo ricarico'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Position.BeginsLayer = True
        end
        object cvTotTOTALECOMPONENTI: TcxGridCardViewRow
          Caption = 'Tot. componenti'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
          Properties.ReadOnly = True
          Position.BeginsLayer = True
          Styles.Content = DM1.cvEnContentBold
          Styles.Caption = DM1.cvEnContentBold
        end
        object cvTotPRZUNITOPERA: TcxGridCardViewRow
          Caption = 'Prezzo orario mano d'#39'opera'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
          Properties.ReadOnly = True
          Position.BeginsLayer = True
        end
        object cvTotQTAOPERA: TcxGridCardViewRow
          Caption = 'Minuti'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
          Properties.ReadOnly = False
          Position.BeginsLayer = True
        end
        object cvTotIMPORTOOPERA: TcxGridCardViewRow
          Caption = 'Tot. manodopera'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
          Properties.ReadOnly = True
          Position.BeginsLayer = True
          Styles.Content = DM1.cvEnContentBold
          Styles.Caption = DM1.cvEnContentBold
        end
        object cvTotTOTALE: TcxGridCardViewRow
          Caption = 'TOTALE'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
          Properties.ReadOnly = True
          CaptionAlignmentHorz = taRightJustify
          Position.BeginsLayer = True
          Styles.Content = DM1.cvEnContentRed
          Styles.Caption = DM1.cvEnContentRed
        end
      end
      object tvOre: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        object tvOreCODDIPENDENTE: TcxGridColumn
          Caption = 'Cod. dip.'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object tvOreDESCRIZDIPENDENTE: TcxGridColumn
          Caption = 'Dipendente'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object tvOreQTA: TcxGridColumn
          Caption = 'Ore'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DecimalPlaces = 6
          Properties.DisplayFormat = '0.######;-0.######'
          HeaderAlignmentHorz = taCenter
          Width = 40
        end
        object tvOreNOTE: TcxGridColumn
          Caption = 'Note'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 250
        end
        object tvOreSOTTOCANTIERE1: TcxGridColumn
          Caption = 'Sottocant. 1'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            'pROVA1'
            'pROVA2')
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvOreSOTTOCANTIERE2: TcxGridColumn
          Caption = 'Sottocant. 2'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvOreSOTTOCANTIERE3: TcxGridColumn
          Caption = 'Sottocant. 3'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvOreTIPOORE1: TcxGridColumn
          Caption = 'Tipo 1'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'DESCRIZIONE'
          Properties.ListColumns = <
            item
              Caption = 'Descrizione'
              HeaderAlignment = taCenter
              SortOrder = soAscending
              FieldName = 'DESCRIZIONE'
            end>
          HeaderAlignmentHorz = taCenter
        end
        object tvOreTIPOORE2: TcxGridColumn
          Caption = 'Tipo 2'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'DESCRIZIONE'
          Properties.ListColumns = <
            item
              Caption = 'Descrizione'
              HeaderAlignment = taCenter
              SortOrder = soAscending
              FieldName = 'DESCRIZIONE'
            end>
          HeaderAlignmentHorz = taCenter
        end
        object tvOreTIPOORE3: TcxGridColumn
          Caption = 'Tipo 3'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'DESCRIZIONE'
          Properties.ListColumns = <
            item
              Caption = 'Descrizione'
              HeaderAlignment = taCenter
              SortOrder = soAscending
              FieldName = 'DESCRIZIONE'
            end>
          HeaderAlignmentHorz = taCenter
        end
        object tvOrePRZUNITVEND: TcxGridColumn
          Caption = 'Prz.un.vend.'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 65
        end
        object tvOreIMPORTOVEND: TcxGridColumn
          Caption = 'Importo vend.'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object tvOreCOSTOORARIO: TcxGridColumn
          Caption = 'Costo ora'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 65
        end
        object tvOreIMPORTOCOSTOORARIO: TcxGridColumn
          Caption = 'Importo costo'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object tvOreOPERAINDEX: TcxGridColumn
          Caption = 'Categoria manodopera'
          DataBinding.ValueType = 'Smallint'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.ReadOnly = True
          Width = 200
        end
        object tvOreGC_COSTONETTOUNITARIO_MOD: TcxGridColumn
          Caption = 'Costo netto unitario MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvOreGC_COSTONETTOUNITARIO: TcxGridColumn
          Caption = 'Costo netto unitario'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 70
        end
        object tvOreGC_RICARICO_MOD: TcxGridColumn
          Caption = 'Ricarico MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvOreGC_RICARICO: TcxGridColumn
          Caption = 'Ricarico'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
        end
        object tvOreGC_QTA_MOD: TcxGridColumn
          Caption = 'Qta MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvOreGC_QTA: TcxGridColumn
          Caption = 'Qta'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          RepositoryItem = DM1.EdPropQta
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
        end
        object tvOreGC_DESCRIZIONE_MOD: TcxGridColumn
          Caption = 'Descrizione MOD'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'T'
          Properties.ValueUnchecked = 'F'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 30
        end
        object tvOreGC_DESCRIZIONE: TcxGridColumn
          Caption = 'Descrizione'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.MaxLength = 1000
          Properties.WantReturns = False
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 290
        end
        object tvOreGUID: TcxGridColumn
          Caption = 'GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
        object tvOreGUID_REF: TcxGridColumn
          Caption = 'Ref. GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
        object tvOreGUID_ANCESTOR: TcxGridColumn
          Caption = 'Anc. GUID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 100
        end
      end
      object tvList: TcxGridDBTableView
        OnDblClick = tvListDblClick
        OnKeyUp = tvListKeyUp
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCustomDrawCell = tvListCustomDrawCell
        DataController.DataSource = SourceTecnici
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.FocusRect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 25
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        OnCustomDrawGroupCell = tvListCustomDrawGroupCell
        object tvListABILITATO: TcxGridDBColumn
          DataBinding.FieldName = 'ABILITATO'
          OnGetDisplayText = tvListABILITATOGetDisplayText
          SortIndex = 0
          SortOrder = soDescending
          Width = 30
          IsCaptionAssigned = True
        end
        object tvListRESOURCEID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'RESOURCEID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 48
        end
        object tvListRESOURCENAME: TcxGridDBColumn
          Caption = 'Nome in agenda'
          DataBinding.FieldName = 'RESOURCENAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          SortIndex = 1
          SortOrder = soAscending
          Width = 114
        end
        object tvListNOME: TcxGridDBColumn
          Caption = 'Nome completo'
          DataBinding.FieldName = 'NOME'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 208
        end
        object tvListRAGIONESOCIALE: TcxGridDBColumn
          Caption = 'Ragione sociale'
          DataBinding.FieldName = 'RAGIONESOCIALE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 208
        end
        object tvListGRUPPO: TcxGridDBColumn
          Caption = 'Gruppo'
          DataBinding.FieldName = 'GRUPPO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
      end
      object lvList: TcxGridLevel
        GridView = tvList
        Options.DetailFrameColor = 10066329
        Options.DetailTabsPosition = dtpTop
        Options.TabsForEmptyDetails = False
        Styles.Tab = DM1.Tab
        Styles.TabsBackground = DM1.TabsBackground
      end
    end
  end
  object ClientTopPanel: TbmpPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 68
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object RxSpeedButtonUscita: TSpeedButton
      Left = 2
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Torna alla PAGINA PRECEDENTE'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonUscitaClick
    end
    object RxSpeedModifica: TSpeedButton
      Left = 112
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Attiva / disattiva MODALITA'#39' MODIFICA'
      AllowAllUp = True
      GroupIndex = 1
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedModificaClick
    end
    object RxSpeedButtonNuovo: TSpeedButton
      Left = 162
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Inserimento NUOVA CATEGORIA'
      AllowAllUp = True
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonNuovoClick
    end
    object RxSpeedButtonElimina: TSpeedButton
      Left = 212
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Cancella la categoria dall'#39'archivio'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonEliminaClick
    end
    object RxSpeedButtonTrova: TSpeedButton
      Left = 262
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Attiva / disattiva la MODALITA'#39' RICERCA'
      AllowAllUp = True
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonTrovaClick
    end
    object RxSpeedButtonStampa: TSpeedButton
      Left = 362
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Accede al MENU'#39' DI STAMPA'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonResetQuery: TSpeedButton
      Left = 312
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonVisualizza: TSpeedButton
      Left = 512
      Top = 2
      Width = 49
      Height = 42
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonVisualizzaClick
    end
    object RxSpeedButtonHelp: TSpeedButton
      Left = 62
      Top = 2
      Width = 49
      Height = 42
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonHelpClick
    end
    object RxSpeedButtonFax: TSpeedButton
      Left = 412
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonMail: TSpeedButton
      Left = 462
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
  end
  object QryTecnici: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    ColumnAttributes.Strings = (
      'TECNICI.RESOURCEID=REQUIRED')
    DeleteSQL.Strings = (
      'DELETE FROM TECNICI'
      'WHERE'
      'RESOURCEID = :OLD_RESOURCEID ')
    EditSQL.Strings = (
      'UPDATE TECNICI SET'
      '      ResourceID = :ResourceID ,'
      '      ResourceName = :ResourceName ,'
      '      Nome = :Nome ,'
      '      Indirizzo = :Indirizzo ,'
      '      Citta = :Citta ,'
      '      CAP = :CAP ,'
      '      Provincia = :Provincia ,'
      '      Telefono = :Telefono ,'
      '      Cellulare = :Cellulare ,'
      '      AltroTelefono = :AltroTelefono ,'
      '      EMail = :EMail,'
      '      ResourceColor = :ResourceColor,'
      '      EstremiDocQualifica = :EstremiDocQualifica,'
      
        '      IMPTERM_MANUT_CODICEOPERATORE = :IMPTERM_MANUT_CODICEOPERA' +
        'TORE,'
      '      GRUPPO = :GRUPPO,'
      '      RAGIONESOCIALE = :RAGIONESOCIALE,'
      '      ASSEGNAMAGAZZINO = :ASSEGNAMAGAZZINO,'
      '      CODICEMAGAZZINO1 = :CODICEMAGAZZINO1,'
      '      CODICEMAGAZZINO2 = :CODICEMAGAZZINO2,'
      '      REGISTRO = :REGISTRO,'
      '      GCAL_CALENDAR_ID = :GCAL_CALENDAR_ID,'
      '      OperatoreCorrelato = :OperatoreCorrelato,'
      '      Abilitato = :Abilitato'
      'WHERE'
      'RESOURCEID = :OLD_RESOURCEID '
      '')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO TECNICI'
      '('
      '      ResourceID,'
      '      ResourceName,'
      '      Nome,'
      '      Indirizzo,'
      '      Citta,'
      '      CAP,'
      '      Provincia,'
      '      Telefono,'
      '      Cellulare,'
      '      AltroTelefono,'
      '      EMail,'
      '      ResourceColor,'
      '      EstremiDocQualifica,'
      '      IMPTERM_MANUT_CODICEOPERATORE,'
      '      GRUPPO,'
      '      RAGIONESOCIALE,'
      '      ASSEGNAMAGAZZINO,'
      '      CODICEMAGAZZINO1,'
      '      CODICEMAGAZZINO2,'
      '      REGISTRO,'
      '      GCAL_CALENDAR_ID,'
      '      OperatoreCorrelato,'
      '      Abilitato'
      ')'
      'VALUES'
      '('
      '      :ResourceID,'
      '      :ResourceName,'
      '      :Nome,'
      '      :Indirizzo,'
      '      :Citta,'
      '      :CAP,'
      '      :Provincia,'
      '      :Telefono,'
      '      :Cellulare,'
      '      :AltroTelefono,'
      '      :EMail,'
      '      :ResourceColor,'
      '      :EstremiDocQualifica,'
      '      :IMPTERM_MANUT_CODICEOPERATORE,'
      '      :GRUPPO,'
      '      :RAGIONESOCIALE,'
      '      :ASSEGNAMAGAZZINO,'
      '      :CODICEMAGAZZINO1,'
      '      :CODICEMAGAZZINO2,'
      '      :REGISTRO,'
      '      :GCAL_CALENDAR_ID,'
      '      :OperatoreCorrelato,'
      '      :Abilitato'
      ')'
      '')
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforeDelete = QryTecniciBeforeDelete
    BeforePost = QryTecniciBeforePost
    SQL.Strings = (
      'SELECT *'
      'FROM TECNICI'
      'ORDER BY NOME'
      '')
    Left = 586
    Top = 2
    object QryTecniciRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
      Origin = 'TECNICI.RESOURCEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryTecniciRESOURCENAME: TStringField
      FieldName = 'RESOURCENAME'
      Origin = 'TECNICI.RESOURCENAME'
      Size = 255
    end
    object QryTecniciNOME: TStringField
      FieldName = 'NOME'
      Origin = 'TECNICI.NOME'
      Size = 60
    end
    object QryTecniciINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Origin = 'TECNICI.INDIRIZZO'
      Size = 40
    end
    object QryTecniciCITTA: TStringField
      FieldName = 'CITTA'
      Origin = 'TECNICI.CITTA'
      Size = 25
    end
    object QryTecniciCAP: TStringField
      FieldName = 'CAP'
      Origin = 'TECNICI.CAP'
      Size = 5
    end
    object QryTecniciPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Origin = 'TECNICI.PROVINCIA'
      Size = 3
    end
    object QryTecniciTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Origin = 'TECNICI.TELEFONO'
      Size = 30
    end
    object QryTecniciCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Origin = 'TECNICI.CELLULARE'
      Size = 30
    end
    object QryTecniciALTROTELEFONO: TStringField
      FieldName = 'ALTROTELEFONO'
      Origin = 'TECNICI.ALTROTELEFONO'
      Size = 30
    end
    object QryTecniciEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'TECNICI.EMAIL'
      Size = 60
    end
    object QryTecniciRESOURCECOLOR: TIntegerField
      FieldName = 'RESOURCECOLOR'
      Origin = 'TECNICI.RESOURCECOLOR'
    end
    object QryTecniciESTREMIDOCQUALIFICA: TStringField
      FieldName = 'ESTREMIDOCQUALIFICA'
      Origin = 'TECNICI.ESTREMIDOCQUALIFICA'
      Size = 60
    end
    object QryTecniciGRUPPO: TStringField
      FieldName = 'GRUPPO'
      Origin = 'TECNICI.GRUPPO'
    end
    object QryTecniciRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Origin = 'TECNICI.RAGIONESOCIALE'
      Size = 60
    end
    object QryTecniciIMPTERM_MANUT_CODICEOPERATORE: TStringField
      FieldName = 'IMPTERM_MANUT_CODICEOPERATORE'
      Origin = 'TECNICI.IMPTERM_MANUT_CODICEOPERATORE'
    end
    object QryTecniciASSEGNAMAGAZZINO: TStringField
      FieldName = 'ASSEGNAMAGAZZINO'
      Origin = 'TECNICI.ASSEGNAMAGAZZINO'
      Size = 1
    end
    object QryTecniciCODICEMAGAZZINO1: TIntegerField
      FieldName = 'CODICEMAGAZZINO1'
      Origin = 'TECNICI.CODICEMAGAZZINO1'
    end
    object QryTecniciCODICEMAGAZZINO2: TIntegerField
      FieldName = 'CODICEMAGAZZINO2'
      Origin = 'TECNICI.CODICEMAGAZZINO2'
    end
    object QryTecniciREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = 'TECNICI.REGISTRO'
      Size = 5
    end
    object QryTecniciGCAL_CALENDAR_ID: TStringField
      FieldName = 'GCAL_CALENDAR_ID'
      Origin = 'TECNICI.GCAL_CALENDAR_ID'
      Size = 60
    end
    object QryTecniciOPERATORECORRELATO: TStringField
      FieldName = 'OPERATORECORRELATO'
      Origin = 'TECNICI.OPERATORECORRELATO'
      Size = 10
    end
    object QryTecniciABILITATO: TStringField
      FieldName = 'ABILITATO'
      Origin = 'TECNICI.ABILITATO'
      FixedChar = True
      Size = 1
    end
  end
  object SourceTecnici: TDataSource
    AutoEdit = False
    DataSet = QryTecnici
    Left = 614
    Top = 2
  end
  object QryMag: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CODICE, DESCRIZIONE FROM ANAGMAGA')
    Left = 226
    Top = 34
    object QryMagCODICE: TIntegerField
      Alignment = taCenter
      FieldName = 'CODICE'
      Required = True
    end
    object QryMagDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
    end
  end
  object SourceMag: TDataSource
    AutoEdit = False
    DataSet = QryMag
    Left = 254
    Top = 34
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
