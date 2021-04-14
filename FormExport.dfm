inherited ExportForm: TExportForm
  Left = 179
  Top = 160
  Caption = 'ExportForm'
  ClientHeight = 815
  ClientWidth = 728
  OnResize = FormResize
  ExplicitWidth = 728
  ExplicitHeight = 815
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    object cxGrid1: TcxGrid
      Left = 288
      Top = 64
      Width = 250
      Height = 200
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited ClientArea: TScrollBox
    Height = 669
    ExplicitHeight = 669
    object PageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 686
      Height = 669
      Align = alClient
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabGenerico
      Properties.CustomButtons.Buttons = <>
      Properties.NavigatorPosition = npLeftBottom
      Properties.Style = 9
      Properties.TabSlants.Positions = [spLeft, spRight]
      LookAndFeel.Kind = lfOffice11
      TabSlants.Positions = [spLeft, spRight]
      ClientRectBottom = 669
      ClientRectRight = 686
      ClientRectTop = 19
      object TabGenerico: TcxTabSheet
        Caption = 'Filtri di esportazione programmabili'
        ImageIndex = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 686
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          Color = 16765650
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            686
            50)
          object Label68: TLabel
            Left = 6
            Top = 19
            Width = 89
            Height = 12
            Caption = 'Tipo esportazione'
            Color = clGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object ComboTipoEsportazione: TcxComboBox
            Left = 100
            Top = 15
            ParentFont = False
            Properties.OnInitPopup = TipoEsportazionePropertiesInitPopup
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
            TabOrder = 0
            Width = 300
          end
          object Button1: TButton
            Left = 520
            Top = 12
            Width = 150
            Height = 25
            Cursor = crHandPoint
            Anchors = [akTop, akRight]
            Caption = 'Esporta'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Button1Click
          end
        end
        object G: TcxGrid
          Left = 0
          Top = 50
          Width = 686
          Height = 600
          Align = alClient
          BorderStyle = cxcbsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object tvG: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = SourceQry
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
          end
          object lvG: TcxGridLevel
            GridView = tvG
          end
        end
      end
      object TabMulti: TcxTabSheet
        Caption = 'TeamSystem - Multi'
        ImageIndex = 1
        DesignSize = (
          686
          650)
        object PanelModo: TPanel
          Left = 0
          Top = 15
          Width = 686
          Height = 184
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          DesignSize = (
            686
            184)
          object LabelModo: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 184
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '1'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -96
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
            ExplicitHeight = 109
          end
          object Label1: TLabel
            Left = 112
            Top = 45
            Width = 48
            Height = 13
            Caption = 'Dalla data'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 112
            Top = 75
            Width = 41
            Height = 13
            Caption = 'alla data'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LabelLastExport: TLabel
            Left = 75
            Top = 164
            Width = 602
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = '- - -'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object RichEdit1: TRichEdit
            Tag = -1
            Left = 83
            Top = 6
            Width = 575
            Height = 24
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Esporta verso Multi (TeamSystem)')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object MultiDallaData: TcxDateEdit
            Tag = -1
            Left = 166
            Top = 40
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Height = 23
            Width = 120
          end
          object MultiAllaData: TcxDateEdit
            Tag = -1
            Left = 166
            Top = 69
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.ButtonStyle = btsUltraFlat
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 23
            Width = 120
          end
          object MultiEsportaFatture: TcxCheckBox
            Left = 107
            Top = 114
            Caption = 'Esporta fatture di vendita'
            ParentFont = False
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 186
          end
          object MultiEsportaPrimanota: TcxCheckBox
            Left = 107
            Top = 133
            Caption = 'Esporta primanota'
            ParentFont = False
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Width = 186
          end
          object Panel12: TPanel
            Left = 563
            Top = 8
            Width = 116
            Height = 28
            Anchors = [akRight, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clSilver
            ParentBackground = False
            TabOrder = 5
            object IniziaFatturazione: TSpeedButton
              Left = 1
              Top = 2
              Width = 112
              Height = 23
              Cursor = crHandPoint
              Caption = 'Esporta'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = IniziaFatturazioneClick
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 219
          Width = 686
          Height = 105
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          DesignSize = (
            686
            105)
          object Label16: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 105
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '2'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -96
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
            ExplicitHeight = 109
          end
          object RichEdit5: TRichEdit
            Tag = -1
            Left = 83
            Top = 6
            Width = 575
            Height = 24
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Altri parametri')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object MultiSoloNonEsportati: TcxCheckBox
            Left = 107
            Top = 41
            Caption = 
              'Esporta solo documenti non marcati come esportati precedentement' +
              'e'
            ParentFont = False
            State = cbsChecked
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 502
          end
          object MultiMarcaDocEsportati: TcxCheckBox
            Left = 107
            Top = 62
            Caption = 'Marca i documenti come "esportati"'
            ParentFont = False
            State = cbsChecked
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Width = 502
          end
          object MultiNoExportCI1IfZero: TcxCheckBox
            Left = 426
            Top = 81
            Anchors = [akTop, akRight]
            Caption = 'Non esportare imponibili = 0 per codice IVA 1'
            ParentFont = False
            Properties.Alignment = taRightJustify
            Properties.ValueChecked = 'T'
            Properties.ValueUnchecked = 'F'
            State = cbsGrayed
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Width = 251
          end
        end
      end
      object TabECommerce: TcxTabSheet
        Caption = 'e-Commerce'
        ImageIndex = 2
        DesignSize = (
          686
          650)
        object Panel3: TPanel
          Left = 0
          Top = 17
          Width = 686
          Height = 503
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          DesignSize = (
            686
            503)
          object Label6: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 503
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '1'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -96
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
            ExplicitHeight = 109
          end
          object RichEdit3: TRichEdit
            Tag = -1
            Left = 83
            Top = 6
            Width = 575
            Height = 24
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Importa da e-commerce')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 83
            Top = 461
            Width = 116
            Height = 28
            Anchors = [akLeft, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clSilver
            ParentBackground = False
            TabOrder = 1
            object SpeedButton4: TSpeedButton
              Left = 1
              Top = 2
              Width = 112
              Height = 23
              Cursor = crHandPoint
              Caption = 'Anteprima'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton4Click
            end
          end
          object Panel6: TPanel
            Left = 556
            Top = 461
            Width = 116
            Height = 28
            Anchors = [akRight, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clSilver
            ParentBackground = False
            TabOrder = 2
            object SpeedButton5: TSpeedButton
              Left = 1
              Top = 2
              Width = 112
              Height = 23
              Cursor = crHandPoint
              Caption = 'Importa'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton5Click
            end
          end
          object GridEC: TcxGrid
            Left = 83
            Top = 36
            Width = 589
            Height = 416
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = cxcbsNone
            TabOrder = 3
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameWidth = 1
            object tvEC: TcxGridTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GridLines = glVertical
              OptionsView.GroupByBox = False
              Styles.StyleSheet = DM1.MasterTableViewStyleSheet
              object tvECIndex: TcxGridColumn
                Caption = 'Index'
                DataBinding.ValueType = 'Integer'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                MinWidth = 60
                Options.HorzSizing = False
                Width = 60
              end
              object tvECDesc: TcxGridColumn
                Caption = 'Descrizione'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 100
              end
              object tvECWhere: TcxGridColumn
                Caption = 'Where'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 100
              end
              object tvECDetailsWhere: TcxGridColumn
                Caption = 'Det. where'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 100
              end
            end
            object lvEC: TcxGridLevel
              GridView = tvEC
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 534
          Width = 686
          Height = 109
          Anchors = [akLeft, akRight, akBottom]
          BevelOuter = bvNone
          Color = 14737632
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          DesignSize = (
            686
            109)
          object Label9: TLabel
            Left = 0
            Top = 0
            Width = 69
            Height = 109
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            Caption = '2'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -96
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label10: TLabel
            Left = 112
            Top = 47
            Width = 61
            Height = 13
            Caption = 'Nome server'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 112
            Top = 80
            Width = 75
            Height = 13
            Caption = 'Nome database'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 435
            Top = 47
            Width = 62
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Nome utente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 435
            Top = 80
            Width = 46
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Password'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object RichEdit4: TRichEdit
            Tag = -1
            Left = 83
            Top = 12
            Width = 575
            Height = 24
            TabStop = False
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Parametri')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object ecNomeServer: TcxTextEdit
            Tag = -1
            Left = 199
            Top = 42
            AutoSize = False
            ParentFont = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Height = 23
            Width = 216
          end
          object ecNomeDatabase: TcxTextEdit
            Tag = -1
            Left = 199
            Top = 75
            AutoSize = False
            ParentFont = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Height = 23
            Width = 216
          end
          object ecNomeUtente: TcxTextEdit
            Tag = -1
            Left = 522
            Top = 42
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 23
            Width = 150
          end
          object ecPassword: TcxTextEdit
            Tag = -1
            Left = 522
            Top = 75
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.EchoMode = eemPassword
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsSingle
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Height = 23
            Width = 150
          end
          object ecEsportazioneMulti: TcxCheckBox
            Left = 195
            Top = 14
            Caption = 'Contestuale esportazione verso TeamSystem - Multi'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 5
            Width = 315
          end
        end
      end
    end
  end
  object Qry: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    FieldOptions = []
    Left = 504
    Top = 256
  end
  object SourceQry: TDataSource
    AutoEdit = False
    DataSet = Qry
    Left = 533
    Top = 256
  end
  object QryMulti: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT T.*, C.TIPOPERSONA, C.RAGIONESOCIALE, C.COGNOME, C.NOME, ' +
        'C.ESTERO, C.ESTERO_CODICE, C.ESTERO_DESCRIZIONE, C.ESTERO_SIGLA,' +
        ' COALESCE(CAU.EXPORT_CONTO,'#39#39') AS CAUSALE_EXPORT_CONTO'
      'FROM PRVORDCL T'
      'LEFT JOIN CLIENTI C ON (C.CODICE = T.CODICECLIENTE)'
      'LEFT JOIN CAUSALI CAU ON (CAU.DESCRIZIONE = T.CAUSALE)')
    FieldOptions = []
    Left = 512
    Top = 312
    object QryMultiTIPODOCUMENTO: TStringField
      FieldName = 'TIPODOCUMENTO'
      Required = True
      Size = 25
    end
    object QryMultiREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 5
    end
    object QryMultiNUMORDPREV: TIntegerField
      FieldName = 'NUMORDPREV'
      Required = True
    end
    object QryMultiDATADOCUMENTO: TDateTimeField
      FieldName = 'DATADOCUMENTO'
      Required = True
    end
    object QryMultiCODICECLIENTE: TIntegerField
      FieldName = 'CODICECLIENTE'
    end
    object QryMultiSELEZIONATO: TStringField
      FieldName = 'SELEZIONATO'
      Size = 1
    end
    object QryMultiSCONTOALIQUOTA1: TIBOFloatField
      FieldName = 'SCONTOALIQUOTA1'
    end
    object QryMultiSCONTOALIQUOTA2: TIBOFloatField
      FieldName = 'SCONTOALIQUOTA2'
    end
    object QryMultiSCONTOALIQUOTA3: TIBOFloatField
      FieldName = 'SCONTOALIQUOTA3'
    end
    object QryMultiSCONTOALIQUOTA4: TIBOFloatField
      FieldName = 'SCONTOALIQUOTA4'
    end
    object QryMultiTOTALEMARGINE: TIBOFloatField
      FieldName = 'TOTALEMARGINE'
    end
    object QryMultiTOTALERIGHI1: TIBOFloatField
      FieldName = 'TOTALERIGHI1'
    end
    object QryMultiTOTALERIGHI2: TIBOFloatField
      FieldName = 'TOTALERIGHI2'
    end
    object QryMultiTOTALERIGHI3: TIBOFloatField
      FieldName = 'TOTALERIGHI3'
    end
    object QryMultiTOTALERIGHI4: TIBOFloatField
      FieldName = 'TOTALERIGHI4'
    end
    object QryMultiIMPORTOIVA1: TIBOFloatField
      FieldName = 'IMPORTOIVA1'
    end
    object QryMultiIMPORTOIVA2: TIBOFloatField
      FieldName = 'IMPORTOIVA2'
    end
    object QryMultiIMPORTOIVA3: TIBOFloatField
      FieldName = 'IMPORTOIVA3'
    end
    object QryMultiIMPORTOIVA4: TIBOFloatField
      FieldName = 'IMPORTOIVA4'
    end
    object QryMultiTOTALEIMPONIBILE1: TIBOFloatField
      FieldName = 'TOTALEIMPONIBILE1'
    end
    object QryMultiTOTALEIMPONIBILE2: TIBOFloatField
      FieldName = 'TOTALEIMPONIBILE2'
    end
    object QryMultiTOTALEIMPONIBILE3: TIBOFloatField
      FieldName = 'TOTALEIMPONIBILE3'
    end
    object QryMultiTOTALEIMPONIBILE4: TIBOFloatField
      FieldName = 'TOTALEIMPONIBILE4'
    end
    object QryMultiTOTALEDOCUMENTO: TIBOFloatField
      FieldName = 'TOTALEDOCUMENTO'
    end
    object QryMultiCAUSALE: TStringField
      FieldName = 'CAUSALE'
      Size = 40
    end
    object QryMultiSEGNOOPERAZIONE: TStringField
      FieldName = 'SEGNOOPERAZIONE'
      Size = 1
    end
    object QryMultiDAFATTURARE: TStringField
      FieldName = 'DAFATTURARE'
      Size = 1
    end
    object QryMultiCAUSALECANTIERE: TStringField
      FieldName = 'CAUSALECANTIERE'
      Size = 15
    end
    object QryMultiSEGNOOPERAZIONECANTIERE: TStringField
      FieldName = 'SEGNOOPERAZIONECANTIERE'
      Size = 1
    end
    object QryMultiTRASPORTOACURA: TStringField
      FieldName = 'TRASPORTOACURA'
      Size = 15
    end
    object QryMultiDATIVETTORE: TStringField
      FieldName = 'DATIVETTORE'
      Size = 50
    end
    object QryMultiLISTINO: TSmallintField
      FieldName = 'LISTINO'
    end
    object QryMultiPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryMultiPAGAMENTO: TIntegerField
      FieldName = 'PAGAMENTO'
    end
    object QryMultiINDIRIZZODESTMERCI: TStringField
      FieldName = 'INDIRIZZODESTMERCI'
      Size = 80
    end
    object QryMultiNUMCIVICODESTMERCI: TStringField
      FieldName = 'NUMCIVICODESTMERCI'
      Size = 10
    end
    object QryMultiCAPDESTMERCI: TStringField
      FieldName = 'CAPDESTMERCI'
      Size = 5
    end
    object QryMultiCODICEISTATCOMUNEDESTMERCI: TStringField
      FieldName = 'CODICEISTATCOMUNEDESTMERCI'
      Size = 10
    end
    object QryMultiCITTADESTMERCI: TStringField
      FieldName = 'CITTADESTMERCI'
      Size = 60
    end
    object QryMultiPROVINCIADESTMERCI: TStringField
      FieldName = 'PROVINCIADESTMERCI'
      Size = 3
    end
    object QryMultiCODICEIVA1: TIntegerField
      FieldName = 'CODICEIVA1'
    end
    object QryMultiCODICEIVA2: TIntegerField
      FieldName = 'CODICEIVA2'
    end
    object QryMultiCODICEIVA3: TIntegerField
      FieldName = 'CODICEIVA3'
    end
    object QryMultiCODICEIVA4: TIntegerField
      FieldName = 'CODICEIVA4'
    end
    object QryMultiPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object QryMultiPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object QryMultiDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryMultiDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object QryMultiDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object QryMultiSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QryMultiSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QryMultiSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QryMultiARGOMENTO: TStringField
      FieldName = 'ARGOMENTO'
      Size = 60
    end
    object QryMultiAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QryMultiAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QryMultiAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QryMultiAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QryMultiABBUONO: TIBOFloatField
      FieldName = 'ABBUONO'
    end
    object QryMultiTOTALEDAPAGARE: TIBOFloatField
      FieldName = 'TOTALEDAPAGARE'
    end
    object QryMultiNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QryMultiMESSAGGI: TMemoField
      FieldName = 'MESSAGGI'
      BlobType = ftMemo
    end
    object QryMultiCODICEDESTMERCI: TIntegerField
      FieldName = 'CODICEDESTMERCI'
    end
    object QryMultiRAGSOCCLI: TStringField
      FieldName = 'RAGSOCCLI'
      Size = 60
    end
    object QryMultiINDIRIZZOCLI: TStringField
      FieldName = 'INDIRIZZOCLI'
      Size = 80
    end
    object QryMultiNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      Size = 10
    end
    object QryMultiCODICEISTATCOMUNECLI: TStringField
      FieldName = 'CODICEISTATCOMUNECLI'
      Size = 10
    end
    object QryMultiCITTACLI: TStringField
      FieldName = 'CITTACLI'
      Size = 60
    end
    object QryMultiCAPCLI: TStringField
      FieldName = 'CAPCLI'
      Size = 5
    end
    object QryMultiPROVINCIACLI: TStringField
      FieldName = 'PROVINCIACLI'
      Size = 3
    end
    object QryMultiPARTITAIVACLI: TStringField
      FieldName = 'PARTITAIVACLI'
      Size = 16
    end
    object QryMultiCODICEFISCALECLI: TStringField
      FieldName = 'CODICEFISCALECLI'
      Size = 16
    end
    object QryMultiABI: TStringField
      FieldName = 'ABI'
      Size = 10
    end
    object QryMultiCAB: TStringField
      FieldName = 'CAB'
      Size = 10
    end
    object QryMultiDATASCAD1: TDateTimeField
      FieldName = 'DATASCAD1'
    end
    object QryMultiDATASCAD2: TDateTimeField
      FieldName = 'DATASCAD2'
    end
    object QryMultiDATASCAD3: TDateTimeField
      FieldName = 'DATASCAD3'
    end
    object QryMultiDATASCAD4: TDateTimeField
      FieldName = 'DATASCAD4'
    end
    object QryMultiDATASCAD5: TDateTimeField
      FieldName = 'DATASCAD5'
    end
    object QryMultiIMPORTOSCAD1: TIBOFloatField
      FieldName = 'IMPORTOSCAD1'
    end
    object QryMultiIMPORTOSCAD2: TIBOFloatField
      FieldName = 'IMPORTOSCAD2'
    end
    object QryMultiIMPORTOSCAD3: TIBOFloatField
      FieldName = 'IMPORTOSCAD3'
    end
    object QryMultiIMPORTOSCAD4: TIBOFloatField
      FieldName = 'IMPORTOSCAD4'
    end
    object QryMultiIMPORTOSCAD5: TIBOFloatField
      FieldName = 'IMPORTOSCAD5'
    end
    object QryMultiRAGSOCDESTMERCI: TStringField
      FieldName = 'RAGSOCDESTMERCI'
      Size = 60
    end
    object QryMultiDATATRASP: TStringField
      FieldName = 'DATATRASP'
      Size = 10
    end
    object QryMultiORATRASP: TStringField
      FieldName = 'ORATRASP'
      Size = 5
    end
    object QryMultiCODICESUBSOGG: TIntegerField
      FieldName = 'CODICESUBSOGG'
    end
    object QryMultiSUBSOGGCAMPO1: TStringField
      FieldName = 'SUBSOGGCAMPO1'
      Size = 30
    end
    object QryMultiSUBSOGGCAMPO2: TStringField
      FieldName = 'SUBSOGGCAMPO2'
      Size = 30
    end
    object QryMultiSUBSOGGCAMPO3: TStringField
      FieldName = 'SUBSOGGCAMPO3'
      Size = 30
    end
    object QryMultiTIPODOCUMENTOESTESO: TStringField
      FieldName = 'TIPODOCUMENTOESTESO'
      Size = 25
    end
    object QryMultiCODICEMAGAZZINO: TSmallintField
      FieldName = 'CODICEMAGAZZINO'
    end
    object QryMultiMESECOMPETENZA: TSmallintField
      FieldName = 'MESECOMPETENZA'
    end
    object QryMultiOPERATORE: TStringField
      FieldName = 'OPERATORE'
      Size = 10
    end
    object QryMultiVALIDITADOCUMENTO: TStringField
      FieldName = 'VALIDITADOCUMENTO'
      Size = 10
    end
    object QryMultiCONSEGNA: TStringField
      FieldName = 'CONSEGNA'
    end
    object QryMultiNUMCOLLI: TStringField
      FieldName = 'NUMCOLLI'
      Size = 6
    end
    object QryMultiASPETTOESTERIOREBENI: TStringField
      FieldName = 'ASPETTOESTERIOREBENI'
      Size = 30
    end
    object QryMultiPORTO: TStringField
      FieldName = 'PORTO'
    end
    object QryMultiSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QryMultiTOTALEMERCE: TIBOFloatField
      FieldName = 'TOTALEMERCE'
    end
    object QryMultiTOTALESCONTI: TIBOFloatField
      FieldName = 'TOTALESCONTI'
    end
    object QryMultiTOTALENETTOMERCE: TIBOFloatField
      FieldName = 'TOTALENETTOMERCE'
    end
    object QryMultiSPESE: TIBOFloatField
      FieldName = 'SPESE'
    end
    object QryMultiTOTALEIMPONIBILE: TIBOFloatField
      FieldName = 'TOTALEIMPONIBILE'
    end
    object QryMultiTOTALEIVA: TIBOFloatField
      FieldName = 'TOTALEIVA'
    end
    object QryMultiPRZUNITOPERA: TIBOFloatField
      FieldName = 'PRZUNITOPERA'
    end
    object QryMultiCODICEIVAFORZATA: TIntegerField
      FieldName = 'CODICEIVAFORZATA'
    end
    object QryMultiDESCRIZIONEIVAFORZATA: TStringField
      FieldName = 'DESCRIZIONEIVAFORZATA'
      Size = 40
    end
    object QryMultiALIQUOTAIVAFORZATA: TIBOFloatField
      FieldName = 'ALIQUOTAIVAFORZATA'
    end
    object QryMultiSTARTMEMO: TMemoField
      FieldName = 'STARTMEMO'
      BlobType = ftMemo
    end
    object QryMultiENDMEMO: TMemoField
      FieldName = 'ENDMEMO'
      BlobType = ftMemo
    end
    object QryMultiVALIDITAGG: TSmallintField
      FieldName = 'VALIDITAGG'
    end
    object QryMultiVALIDITADATA: TDateTimeField
      FieldName = 'VALIDITADATA'
    end
    object QryMultiCONSEGNAGG: TSmallintField
      FieldName = 'CONSEGNAGG'
    end
    object QryMultiCONSEGNADATA: TDateTimeField
      FieldName = 'CONSEGNADATA'
    end
    object QryMultiCONSEGNATO: TStringField
      FieldName = 'CONSEGNATO'
      Size = 1
    end
    object QryMultiRITACCPERC: TIBOFloatField
      FieldName = 'RITACCPERC'
    end
    object QryMultiRITACC: TIBOFloatField
      FieldName = 'RITACC'
    end
    object QryMultiORDINECHIUSO: TStringField
      FieldName = 'ORDINECHIUSO'
      Size = 1
    end
    object QryMultiRITACCPERCIMPONIBILE: TIBOFloatField
      FieldName = 'RITACCPERCIMPONIBILE'
    end
    object QryMultiBARCODE: TStringField
      FieldName = 'BARCODE'
    end
    object QryMultiRIFSOGG1_CODICE: TIntegerField
      FieldName = 'RIFSOGG1_CODICE'
    end
    object QryMultiRIFSOGG1_TIPO: TStringField
      FieldName = 'RIFSOGG1_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG1_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG1_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG2_CODICE: TIntegerField
      FieldName = 'RIFSOGG2_CODICE'
    end
    object QryMultiRIFSOGG2_TIPO: TStringField
      FieldName = 'RIFSOGG2_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG2_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG2_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG3_CODICE: TIntegerField
      FieldName = 'RIFSOGG3_CODICE'
    end
    object QryMultiRIFSOGG3_TIPO: TStringField
      FieldName = 'RIFSOGG3_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG3_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG3_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG4_CODICE: TIntegerField
      FieldName = 'RIFSOGG4_CODICE'
    end
    object QryMultiRIFSOGG4_TIPO: TStringField
      FieldName = 'RIFSOGG4_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG4_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG4_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG5_CODICE: TIntegerField
      FieldName = 'RIFSOGG5_CODICE'
    end
    object QryMultiRIFSOGG5_TIPO: TStringField
      FieldName = 'RIFSOGG5_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG5_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG5_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG6_CODICE: TIntegerField
      FieldName = 'RIFSOGG6_CODICE'
    end
    object QryMultiRIFSOGG6_TIPO: TStringField
      FieldName = 'RIFSOGG6_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG6_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG6_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG7_CODICE: TIntegerField
      FieldName = 'RIFSOGG7_CODICE'
    end
    object QryMultiRIFSOGG7_TIPO: TStringField
      FieldName = 'RIFSOGG7_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG7_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG7_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG8_CODICE: TIntegerField
      FieldName = 'RIFSOGG8_CODICE'
    end
    object QryMultiRIFSOGG8_TIPO: TStringField
      FieldName = 'RIFSOGG8_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG8_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG8_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG9_CODICE: TIntegerField
      FieldName = 'RIFSOGG9_CODICE'
    end
    object QryMultiRIFSOGG9_TIPO: TStringField
      FieldName = 'RIFSOGG9_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG9_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG9_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiRIFSOGG10_CODICE: TIntegerField
      FieldName = 'RIFSOGG10_CODICE'
    end
    object QryMultiRIFSOGG10_TIPO: TStringField
      FieldName = 'RIFSOGG10_TIPO'
      Size = 10
    end
    object QryMultiRIFSOGG10_RAGIONESOCIALE: TStringField
      FieldName = 'RIFSOGG10_RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiPRZUNITOPERA1: TIBOFloatField
      FieldName = 'PRZUNITOPERA1'
    end
    object QryMultiPRZUNITOPERA2: TIBOFloatField
      FieldName = 'PRZUNITOPERA2'
    end
    object QryMultiPRZUNITOPERA3: TIBOFloatField
      FieldName = 'PRZUNITOPERA3'
    end
    object QryMultiPRZUNITOPERA4: TIBOFloatField
      FieldName = 'PRZUNITOPERA4'
    end
    object QryMultiSTMPREF: TBlobField
      FieldName = 'STMPREF'
      Size = 8
    end
    object QryMultiEXPORTED: TStringField
      FieldName = 'EXPORTED'
      Size = 1
    end
    object QryMultiPROTOCOLLO: TIntegerField
      FieldName = 'PROTOCOLLO'
    end
    object QryMultiRITACCSUPERCIMP: TStringField
      FieldName = 'RITACCSUPERCIMP'
      Size = 1
    end
    object QryMultiRITACCSUIMPORTOIMP: TStringField
      FieldName = 'RITACCSUIMPORTOIMP'
      Size = 1
    end
    object QryMultiRITACCIMPONIBILE: TIBOFloatField
      FieldName = 'RITACCIMPONIBILE'
    end
    object QryMultiCODICEMAGAZZINO2: TSmallintField
      FieldName = 'CODICEMAGAZZINO2'
    end
    object QryMultiRIFDOC_TIPO: TStringField
      FieldName = 'RIFDOC_TIPO'
      Size = 25
    end
    object QryMultiRIFDOC_NUM: TIntegerField
      FieldName = 'RIFDOC_NUM'
    end
    object QryMultiRIFDOC_REG: TStringField
      FieldName = 'RIFDOC_REG'
      Size = 5
    end
    object QryMultiRIFDOC_DATA: TDateTimeField
      FieldName = 'RIFDOC_DATA'
    end
    object QryMultiRIFDOC_CORRISPNOPAG: TStringField
      FieldName = 'RIFDOC_CORRISPNOPAG'
      Size = 1
    end
    object QryMultiALIQUOTAIVA1: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA1'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA1'
      Lookup = True
    end
    object QryMultiALIQUOTAIVA2: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA2'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA2'
      Lookup = True
    end
    object QryMultiALIQUOTAIVA3: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA3'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA3'
      Lookup = True
    end
    object QryMultiALIQUOTAIVA4: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA4'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA4'
      Lookup = True
    end
    object QryMultiTIPOPERSONA: TStringField
      FieldName = 'TIPOPERSONA'
      Size = 1
    end
    object QryMultiESTERO: TStringField
      FieldName = 'ESTERO'
      Size = 1
    end
    object QryMultiESTERO_CODICE: TStringField
      FieldName = 'ESTERO_CODICE'
      Size = 60
    end
    object QryMultiESTERO_DESCRIZIONE: TStringField
      FieldName = 'ESTERO_DESCRIZIONE'
      Size = 40
    end
    object QryMultiESTERO_SIGLA: TStringField
      FieldName = 'ESTERO_SIGLA'
      Size = 3
    end
    object QryMultiBOLLOIMPORTO: TIBOFloatField
      FieldName = 'BOLLOIMPORTO'
    end
    object QryMultiRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiCOGNOME: TStringField
      FieldName = 'COGNOME'
      Size = 50
    end
    object QryMultiNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryMultiCAUSALE_EXPORT_CONTO: TStringField
      FieldName = 'CAUSALE_EXPORT_CONTO'
      ReadOnly = True
      Size = 10
    end
  end
  object QryMultiPrimanota: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT P.*, C.TIPOPERSONA, C.RAGIONESOCIALE, C.COGNOME, C.NOME, ' +
        'C.ESTERO, C.ESTERO_CODICE, C.ESTERO_DESCRIZIONE, C.ESTERO_SIGLA,'
      
        '  C.INDIRIZZO, C.NUMCIVICO, C.CAP, C.CITTA, C.PROVINCIA, C.CODIC' +
        'EFISCALE, C.PARTITAIVA, B.EXPORT_CONTO AS BANCA_CONTO, C.CLIENTE' +
        'FORNITORE'
      'FROM PRIMANOT P'
      'LEFT JOIN CLIENTI C ON (C.CODICE = P.CLIENTE)'
      'RIGHT OUTER JOIN BANCHE B ON (B.DESCBREVE = P.DESCFUORI)')
    FieldOptions = []
    Left = 512
    Top = 360
    object QryMultiPrimanotaCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QryMultiPrimanotaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object QryMultiPrimanotaDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryMultiPrimanotaCASSAENTRATE: TIBOFloatField
      FieldName = 'CASSAENTRATE'
    end
    object QryMultiPrimanotaCASSAUSCITE: TIBOFloatField
      FieldName = 'CASSAUSCITE'
    end
    object QryMultiPrimanotaFUORIENTRATE: TIBOFloatField
      FieldName = 'FUORIENTRATE'
    end
    object QryMultiPrimanotaFUORIUSCITE: TIBOFloatField
      FieldName = 'FUORIUSCITE'
    end
    object QryMultiPrimanotaDESCFUORI: TStringField
      FieldName = 'DESCFUORI'
    end
    object QryMultiPrimanotaABBUONIATTIVI: TIBOFloatField
      FieldName = 'ABBUONIATTIVI'
    end
    object QryMultiPrimanotaABBUONIPASSIVI: TIBOFloatField
      FieldName = 'ABBUONIPASSIVI'
    end
    object QryMultiPrimanotaNOTE: TStringField
      FieldName = 'NOTE'
      Size = 60
    end
    object QryMultiPrimanotaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QryMultiPrimanotaPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryMultiPrimanotaPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object QryMultiPrimanotaPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object QryMultiPrimanotaDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryMultiPrimanotaDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object QryMultiPrimanotaDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object QryMultiPrimanotaSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QryMultiPrimanotaSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QryMultiPrimanotaSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QryMultiPrimanotaAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QryMultiPrimanotaAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QryMultiPrimanotaAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QryMultiPrimanotaAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QryMultiPrimanotaTIPOPERSONA: TStringField
      FieldName = 'TIPOPERSONA'
      FixedChar = True
      Size = 1
    end
    object QryMultiPrimanotaRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QryMultiPrimanotaCOGNOME: TStringField
      FieldName = 'COGNOME'
      Size = 50
    end
    object QryMultiPrimanotaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QryMultiPrimanotaESTERO: TStringField
      FieldName = 'ESTERO'
      FixedChar = True
      Size = 1
    end
    object QryMultiPrimanotaESTERO_CODICE: TStringField
      FieldName = 'ESTERO_CODICE'
      Size = 60
    end
    object QryMultiPrimanotaESTERO_DESCRIZIONE: TStringField
      FieldName = 'ESTERO_DESCRIZIONE'
      Size = 40
    end
    object QryMultiPrimanotaESTERO_SIGLA: TStringField
      FieldName = 'ESTERO_SIGLA'
      Size = 3
    end
    object QryMultiPrimanotaEXPORTED: TStringField
      FieldName = 'EXPORTED'
      FixedChar = True
      Size = 1
    end
    object QryMultiPrimanotaINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 80
    end
    object QryMultiPrimanotaNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QryMultiPrimanotaCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object QryMultiPrimanotaCITTA: TStringField
      FieldName = 'CITTA'
      Size = 60
    end
    object QryMultiPrimanotaPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object QryMultiPrimanotaCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Size = 16
    end
    object QryMultiPrimanotaPARTITAIVA: TStringField
      FieldName = 'PARTITAIVA'
      Size = 16
    end
    object QryMultiPrimanotaBANCA_CONTO: TStringField
      FieldName = 'BANCA_CONTO'
      Size = 10
    end
    object QryMultiPrimanotaCLIENTEFORNITORE: TStringField
      FieldName = 'CLIENTEFORNITORE'
      Size = 10
    end
  end
end
