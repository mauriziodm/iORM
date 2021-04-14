object SubSoggForm: TSubSoggForm
  Left = 559
  Top = 299
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '(SubSogg)'
  ClientHeight = 676
  ClientWidth = 718
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
    Height = 586
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PanelCategoria: TPanel
      Left = 0
      Top = 6
      Width = 686
      Height = 104
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelTitolo1: TLabel
        Left = 0
        Top = 67
        Width = 680
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Label Titolo 1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        Visible = False
      end
      object LabelTitolo2: TLabel
        Left = 0
        Top = 84
        Width = 680
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Label Titolo 2'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        Visible = False
      end
      object LabelCampo1: TLabel
        Left = 6
        Top = 1
        Width = 100
        Height = 14
        AutoSize = False
        Caption = 'Jolly '
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LabelCampo2: TLabel
        Left = 6
        Top = 17
        Width = 100
        Height = 14
        AutoSize = False
        Caption = 'Jolly '
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LabelCampo3: TLabel
        Left = 6
        Top = 33
        Width = 100
        Height = 14
        AutoSize = False
        Caption = 'Jolly '
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LabelCampo4: TLabel
        Left = 6
        Top = 49
        Width = 100
        Height = 14
        AutoSize = False
        Caption = 'Jolly '
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object DBECampo1: TDBEdit
        Left = 109
        Top = 1
        Width = 571
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'Campo1'
        DataSource = SourceSubSogg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnEnter = DBECampo1Enter
        OnExit = DBECampo1Exit
      end
      object DBECampo2: TDBEdit
        Left = 109
        Top = 17
        Width = 571
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'Campo2'
        DataSource = SourceSubSogg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnEnter = DBECampo1Enter
        OnExit = DBECampo1Exit
      end
      object DBECampo3: TDBEdit
        Left = 109
        Top = 33
        Width = 571
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'Campo3'
        DataSource = SourceSubSogg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnEnter = DBECampo1Enter
        OnExit = DBECampo1Exit
      end
      object DBECampo4: TDBEdit
        Left = 109
        Top = 49
        Width = 571
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'Campo4'
        DataSource = SourceSubSogg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnEnter = DBECampo1Enter
        OnExit = DBECampo1Exit
      end
    end
    object GridList: TcxGrid
      Left = 0
      Top = 451
      Width = 686
      Height = 135
      TabOrder = 1
      LookAndFeel.NativeStyle = False
      object tvDiBa: TcxGridTableView
        DragMode = dmAutomatic
        Navigator.Buttons.CustomButtons = <>
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
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
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
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
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
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
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
          Options.FilteringMRUItemsList = False
          Options.IncSearch = False
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
        DataController.DataSource = SourceSubSogg
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.FocusRect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        object tvListCampo1: TcxGridDBColumn
          DataBinding.FieldName = 'Campo1'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object tvListCampo2: TcxGridDBColumn
          DataBinding.FieldName = 'Campo2'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object tvListCampo3: TcxGridDBColumn
          DataBinding.FieldName = 'Campo3'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object tvListCampo4: TcxGridDBColumn
          DataBinding.FieldName = 'Campo4'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
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
    Color = clGray
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
  object QuerySubSogg: TIBOQuery
    CachedUpdates = True
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'delete from subsogg'
      'where'
      '  Codice = :OLD_Codice'
      '')
    EditSQL.Strings = (
      'update subsogg'
      'set'
      '  Codice = :Codice,'
      '  CodiceSoggetto = :CodiceSoggetto,'
      '  Campo1 = :Campo1,'
      '  Campo2 = :Campo2,'
      '  Campo3 = :Campo3,'
      '  Campo4 = :Campo4,'
      '  Sinchro = :Sinchro'
      'where'
      '  Codice = :OLD_Codice')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'insert into subsogg'
      
        '  (Codice, CodiceSoggetto, Campo1, Campo2, Campo3, Campo4, Sinch' +
        'ro)'
      'values'
      
        '  (:Codice, :CodiceSoggetto, :Campo1, :Campo2, :Campo3, :Campo4,' +
        ' :Sinchro)'
      '')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QuerySubSoggBeforePost
    SQL.Strings = (
      'SELECT *'
      'FROM SUBSOGG'
      '')
    FieldOptions = []
    Left = 586
    Top = 2
    object QuerySubSoggCodice: TIntegerField
      FieldName = 'Codice'
    end
    object QuerySubSoggCodiceSoggetto: TIntegerField
      FieldName = 'CodiceSoggetto'
    end
    object QuerySubSoggCampo1: TStringField
      FieldName = 'Campo1'
      Size = 30
    end
    object QuerySubSoggCampo2: TStringField
      FieldName = 'Campo2'
      Size = 30
    end
    object QuerySubSoggCampo3: TStringField
      FieldName = 'Campo3'
      Size = 30
    end
    object QuerySubSoggCampo4: TDateField
      FieldName = 'Campo4'
    end
    object QuerySubSoggSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
  end
  object SourceSubSogg: TDataSource
    AutoEdit = False
    DataSet = QuerySubSogg
    Left = 614
    Top = 2
  end
end
