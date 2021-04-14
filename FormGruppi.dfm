object GruppiForm: TGruppiForm
  Left = 474
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'GruppiForm'
  ClientHeight = 699
  ClientWidth = 764
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
    Width = 704
    Height = 591
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PanelGruppo1: TPanel
      Left = 0
      Top = 0
      Width = 686
      Height = 90
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelGruppo1: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 88
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = 16250871
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Grid1: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
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
        object tvList1: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo1
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object tvList1DESCRIZIONE: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList1: TcxGridLevel
          GridView = tvList1
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato1: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 47
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        ParentBackground = False
        TabOrder = 0
        Visible = False
        object LabelSelezionato1: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 47
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag1: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 1
        Visible = False
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Style = bsClear
          Pen.Color = 2856447
        end
        object Label1: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label10: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione1: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice1: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 11
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'Codice1'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit1: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit2: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit3: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit4: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
      end
    end
    object PanelGruppo2: TPanel
      Left = 0
      Top = 100
      Width = 686
      Height = 90
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object LabelGruppo2: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 90
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
      object Grid2: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGridTableView1: TcxGridTableView
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
          object cxGridColumn1: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 23
            Width = 23
            IsCaptionAssigned = True
          end
          object cxGridColumn2: TcxGridColumn
            Caption = 'M'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn3: TcxGridColumn
            Caption = 'M2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn4: TcxGridColumn
            Caption = 'Cod.reale'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Styles.Content = DM1.tvGCDetailContent_DatiDoc
            Styles.Header = DM1.tvDisHeader
            Width = 60
          end
          object cxGridColumn5: TcxGridColumn
            Caption = 'Codice'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object cxGridColumn6: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            HeaderAlignmentHorz = taCenter
            MinWidth = 290
            Width = 290
          end
          object cxGridColumn7: TcxGridColumn
            Caption = 'Prz.unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 61
            Width = 61
          end
          object cxGridColumn8: TcxGridColumn
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
          object cxGridColumn9: TcxGridColumn
            Caption = 'Prz.Un.Netto'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
          object cxGridColumn10: TcxGridColumn
            Caption = 'UM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn11: TcxGridColumn
            Caption = 'Qt'#224
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            MinWidth = 32
            Width = 32
          end
          object cxGridColumn12: TcxGridColumn
            Tag = -1
            Caption = 'In ev.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent1Bold
            Width = 40
          end
          object cxGridColumn13: TcxGridColumn
            Tag = -1
            Caption = 'Q.Ev'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn14: TcxGridColumn
            Tag = -1
            Caption = 'Q.D.E.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn15: TcxGridColumn
            Caption = 'S1'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn16: TcxGridColumn
            Caption = 'S2'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn17: TcxGridColumn
            Caption = 'S3'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn18: TcxGridColumn
            Caption = 'Importo'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn19: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn20: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn21: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn22: TcxGridColumn
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn23: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn24: TcxGridColumn
            Caption = 'Costo unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 65
            Width = 65
          end
          object cxGridColumn25: TcxGridColumn
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
          object cxGridColumn26: TcxGridColumn
            Caption = 'Margine'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Width = 50
          end
          object cxGridColumn27: TcxGridColumn
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
          object cxGridColumn28: TcxGridColumn
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
          object cxGridColumn29: TcxGridColumn
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
          object cxGridColumn30: TcxGridColumn
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
          object cxGridColumn31: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            MinWidth = 64
          end
          object cxGridColumn32: TcxGridColumn
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
          object cxGridColumn33: TcxGridColumn
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
          object cxGridColumn34: TcxGridColumn
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
          object cxGridColumn35: TcxGridColumn
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
          object cxGridColumn36: TcxGridColumn
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
          object cxGridColumn37: TcxGridColumn
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
          object cxGridColumn38: TcxGridColumn
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
          object cxGridColumn39: TcxGridColumn
            Tag = -1
            Caption = 'Rif.'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn40: TcxGridColumn
            Tag = -1
            Caption = 'Ubicazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn41: TcxGridColumn
            Tag = -1
            Caption = 'Componente'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn42: TcxGridColumn
            Tag = -1
            Caption = 'Materiale'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn43: TcxGridColumn
            Tag = -1
            Caption = 'Qta'#39' Dich.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn44: TcxGridColumn
            Tag = -1
            Caption = 'Diametro'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn45: TcxGridColumn
            Tag = -1
            Caption = 'Lunghezza'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn46: TcxGridColumn
            Tag = -1
            Caption = 'Installazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn47: TcxGridColumn
            Tag = -1
            Caption = 'Certificazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn48: TcxGridColumn
            Tag = -1
            Caption = 'Ventilazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn49: TcxGridColumn
            Tag = -1
            Caption = 'Scarico'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn50: TcxGridColumn
            Tag = -1
            Caption = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn51: TcxGridColumn
            Tag = -1
            Caption = 'Modello'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn52: TcxGridColumn
            Tag = -1
            Caption = 'Portata termica'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn53: TcxGridColumn
            Tag = -1
            Caption = 'Tipo collegamento'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn54: TcxGridColumn
            Tag = -1
            Caption = 'Instalato/Installabile'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn55: TcxGridColumn
            Tag = -1
            Caption = 'Mat/App'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn56: TcxGridColumn
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
          object cxGridColumn57: TcxGridColumn
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
          object cxGridColumn58: TcxGridColumn
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
          object cxGridColumn59: TcxGridColumn
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
          object cxGridColumn60: TcxGridColumn
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
          object cxGridColumn61: TcxGridColumn
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
          object cxGridColumn62: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 30
          end
          object cxGridColumn63: TcxGridColumn
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
          object cxGridColumn64: TcxGridColumn
            Caption = 'Costo netto unitario'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGridColumn65: TcxGridColumn
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
          object cxGridColumn66: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn67: TcxGridColumn
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
          object cxGridColumn68: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn69: TcxGridColumn
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
          object cxGridColumn70: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn71: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn72: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn73: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn74: TcxGridColumn
            Tag = 1
            Caption = 'Ord'
            DataBinding.ValueType = 'Float'
          end
          object cxGridColumn75: TcxGridColumn
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
          object cxGridColumn76: TcxGridColumn
            Caption = 'Id Op imp.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridCardView1: TcxGridCardView
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
          object cxGridCardViewRow1: TcxGridCardViewRow
            Caption = 'Costo componenti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow2: TcxGridCardViewRow
            Caption = 'Ricarico %'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00%;-,0.00%'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow3: TcxGridCardViewRow
            Caption = 'Importo ricarico'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow4: TcxGridCardViewRow
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
          object cxGridCardViewRow5: TcxGridCardViewRow
            Caption = 'Prezzo orario mano d'#39'opera'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow6: TcxGridCardViewRow
            Caption = 'Minuti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
            Properties.ReadOnly = False
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow7: TcxGridCardViewRow
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
          object cxGridCardViewRow8: TcxGridCardViewRow
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
        object cxGridTableView2: TcxGridTableView
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
          object cxGridColumn77: TcxGridColumn
            Caption = 'Cod. dip.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 150
          end
          object cxGridColumn78: TcxGridColumn
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
          object cxGridColumn79: TcxGridColumn
            Caption = 'Ore'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 6
            Properties.DisplayFormat = '0.######;-0.######'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object cxGridColumn80: TcxGridColumn
            Caption = 'Note'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
          end
          object cxGridColumn81: TcxGridColumn
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
          object cxGridColumn82: TcxGridColumn
            Caption = 'Sottocant. 2'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn83: TcxGridColumn
            Caption = 'Sottocant. 3'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn84: TcxGridColumn
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
          object cxGridColumn85: TcxGridColumn
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
          object cxGridColumn86: TcxGridColumn
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
          object cxGridColumn87: TcxGridColumn
            Caption = 'Prz.un.vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn88: TcxGridColumn
            Caption = 'Importo vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn89: TcxGridColumn
            Caption = 'Costo ora'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn90: TcxGridColumn
            Caption = 'Importo costo'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn91: TcxGridColumn
            Caption = 'Categoria manodopera'
            DataBinding.ValueType = 'Smallint'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Width = 200
          end
          object cxGridColumn92: TcxGridColumn
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
          object cxGridColumn93: TcxGridColumn
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
          object cxGridColumn94: TcxGridColumn
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
          object cxGridColumn95: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn96: TcxGridColumn
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
          object cxGridColumn97: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn98: TcxGridColumn
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
          object cxGridColumn99: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 1000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn100: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn101: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn102: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
        end
        object tvList2: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo2
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList2: TcxGridLevel
          GridView = tvList2
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato2: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 52
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        TabOrder = 0
        Visible = False
        object LabelSelezionato2: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 52
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag2: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 1
        Visible = False
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Color = 13822463
          Pen.Color = 2856447
        end
        object Label2: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 17
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label13: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione2: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice2: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'Codice1'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit5: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit6: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit7: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit8: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
      end
    end
    object PanelGruppo3: TPanel
      Left = 0
      Top = 200
      Width = 686
      Height = 90
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object LabelGruppo3: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 90
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
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
      object Grid3: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGridTableView3: TcxGridTableView
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
          object cxGridColumn103: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 23
            Width = 23
            IsCaptionAssigned = True
          end
          object cxGridColumn104: TcxGridColumn
            Caption = 'M'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn105: TcxGridColumn
            Caption = 'M2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn106: TcxGridColumn
            Caption = 'Cod.reale'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Styles.Content = DM1.tvGCDetailContent_DatiDoc
            Styles.Header = DM1.tvDisHeader
            Width = 60
          end
          object cxGridColumn107: TcxGridColumn
            Caption = 'Codice'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object cxGridColumn108: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            HeaderAlignmentHorz = taCenter
            MinWidth = 290
            Width = 290
          end
          object cxGridColumn109: TcxGridColumn
            Caption = 'Prz.unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 61
            Width = 61
          end
          object cxGridColumn110: TcxGridColumn
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
          object cxGridColumn111: TcxGridColumn
            Caption = 'Prz.Un.Netto'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
          object cxGridColumn112: TcxGridColumn
            Caption = 'UM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn113: TcxGridColumn
            Caption = 'Qt'#224
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            MinWidth = 32
            Width = 32
          end
          object cxGridColumn114: TcxGridColumn
            Tag = -1
            Caption = 'In ev.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent1Bold
            Width = 40
          end
          object cxGridColumn115: TcxGridColumn
            Tag = -1
            Caption = 'Q.Ev'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn116: TcxGridColumn
            Tag = -1
            Caption = 'Q.D.E.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn117: TcxGridColumn
            Caption = 'S1'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn118: TcxGridColumn
            Caption = 'S2'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn119: TcxGridColumn
            Caption = 'S3'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn120: TcxGridColumn
            Caption = 'Importo'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn121: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn122: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn123: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn124: TcxGridColumn
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn125: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn126: TcxGridColumn
            Caption = 'Costo unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 65
            Width = 65
          end
          object cxGridColumn127: TcxGridColumn
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
          object cxGridColumn128: TcxGridColumn
            Caption = 'Margine'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Width = 50
          end
          object cxGridColumn129: TcxGridColumn
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
          object cxGridColumn130: TcxGridColumn
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
          object cxGridColumn131: TcxGridColumn
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
          object cxGridColumn132: TcxGridColumn
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
          object cxGridColumn133: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            MinWidth = 64
          end
          object cxGridColumn134: TcxGridColumn
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
          object cxGridColumn135: TcxGridColumn
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
          object cxGridColumn136: TcxGridColumn
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
          object cxGridColumn137: TcxGridColumn
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
          object cxGridColumn138: TcxGridColumn
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
          object cxGridColumn139: TcxGridColumn
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
          object cxGridColumn140: TcxGridColumn
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
          object cxGridColumn141: TcxGridColumn
            Tag = -1
            Caption = 'Rif.'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn142: TcxGridColumn
            Tag = -1
            Caption = 'Ubicazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn143: TcxGridColumn
            Tag = -1
            Caption = 'Componente'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn144: TcxGridColumn
            Tag = -1
            Caption = 'Materiale'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn145: TcxGridColumn
            Tag = -1
            Caption = 'Qta'#39' Dich.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn146: TcxGridColumn
            Tag = -1
            Caption = 'Diametro'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn147: TcxGridColumn
            Tag = -1
            Caption = 'Lunghezza'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn148: TcxGridColumn
            Tag = -1
            Caption = 'Installazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn149: TcxGridColumn
            Tag = -1
            Caption = 'Certificazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn150: TcxGridColumn
            Tag = -1
            Caption = 'Ventilazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn151: TcxGridColumn
            Tag = -1
            Caption = 'Scarico'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn152: TcxGridColumn
            Tag = -1
            Caption = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn153: TcxGridColumn
            Tag = -1
            Caption = 'Modello'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn154: TcxGridColumn
            Tag = -1
            Caption = 'Portata termica'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn155: TcxGridColumn
            Tag = -1
            Caption = 'Tipo collegamento'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn156: TcxGridColumn
            Tag = -1
            Caption = 'Instalato/Installabile'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn157: TcxGridColumn
            Tag = -1
            Caption = 'Mat/App'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn158: TcxGridColumn
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
          object cxGridColumn159: TcxGridColumn
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
          object cxGridColumn160: TcxGridColumn
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
          object cxGridColumn161: TcxGridColumn
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
          object cxGridColumn162: TcxGridColumn
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
          object cxGridColumn163: TcxGridColumn
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
          object cxGridColumn164: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 30
          end
          object cxGridColumn165: TcxGridColumn
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
          object cxGridColumn166: TcxGridColumn
            Caption = 'Costo netto unitario'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGridColumn167: TcxGridColumn
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
          object cxGridColumn168: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn169: TcxGridColumn
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
          object cxGridColumn170: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn171: TcxGridColumn
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
          object cxGridColumn172: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn173: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn174: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn175: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn176: TcxGridColumn
            Tag = 1
            Caption = 'Ord'
            DataBinding.ValueType = 'Float'
          end
          object cxGridColumn177: TcxGridColumn
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
          object cxGridColumn178: TcxGridColumn
            Caption = 'Id Op imp.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridCardView2: TcxGridCardView
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
          object cxGridCardViewRow9: TcxGridCardViewRow
            Caption = 'Costo componenti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow10: TcxGridCardViewRow
            Caption = 'Ricarico %'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00%;-,0.00%'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow11: TcxGridCardViewRow
            Caption = 'Importo ricarico'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow12: TcxGridCardViewRow
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
          object cxGridCardViewRow13: TcxGridCardViewRow
            Caption = 'Prezzo orario mano d'#39'opera'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow14: TcxGridCardViewRow
            Caption = 'Minuti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
            Properties.ReadOnly = False
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow15: TcxGridCardViewRow
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
          object cxGridCardViewRow16: TcxGridCardViewRow
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
        object cxGridTableView4: TcxGridTableView
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
          object cxGridColumn179: TcxGridColumn
            Caption = 'Cod. dip.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 150
          end
          object cxGridColumn180: TcxGridColumn
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
          object cxGridColumn181: TcxGridColumn
            Caption = 'Ore'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 6
            Properties.DisplayFormat = '0.######;-0.######'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object cxGridColumn182: TcxGridColumn
            Caption = 'Note'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
          end
          object cxGridColumn183: TcxGridColumn
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
          object cxGridColumn184: TcxGridColumn
            Caption = 'Sottocant. 2'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn185: TcxGridColumn
            Caption = 'Sottocant. 3'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn186: TcxGridColumn
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
          object cxGridColumn187: TcxGridColumn
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
          object cxGridColumn188: TcxGridColumn
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
          object cxGridColumn189: TcxGridColumn
            Caption = 'Prz.un.vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn190: TcxGridColumn
            Caption = 'Importo vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn191: TcxGridColumn
            Caption = 'Costo ora'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn192: TcxGridColumn
            Caption = 'Importo costo'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn193: TcxGridColumn
            Caption = 'Categoria manodopera'
            DataBinding.ValueType = 'Smallint'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Width = 200
          end
          object cxGridColumn194: TcxGridColumn
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
          object cxGridColumn195: TcxGridColumn
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
          object cxGridColumn196: TcxGridColumn
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
          object cxGridColumn197: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn198: TcxGridColumn
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
          object cxGridColumn199: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn200: TcxGridColumn
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
          object cxGridColumn201: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 1000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn202: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn203: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn204: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
        end
        object tvList3: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo3
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList3: TcxGridLevel
          GridView = tvList3
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato3: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 52
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        TabOrder = 1
        Visible = False
        object LabelSelezionato3: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 52
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag3: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 0
        Visible = False
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Color = 13822463
          Pen.Color = 2856447
        end
        object Label5: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 17
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label9: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label14: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label15: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione3: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice3: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'Codice1'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit10: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit11: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit12: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
      end
    end
    object PanelGruppo5: TPanel
      Left = 0
      Top = 400
      Width = 686
      Height = 90
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object LabelGruppo5: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 90
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '5'
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
      object Grid5: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGridTableView7: TcxGridTableView
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
          object cxGridColumn307: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 23
            Width = 23
            IsCaptionAssigned = True
          end
          object cxGridColumn308: TcxGridColumn
            Caption = 'M'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn309: TcxGridColumn
            Caption = 'M2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn310: TcxGridColumn
            Caption = 'Cod.reale'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Styles.Content = DM1.tvGCDetailContent_DatiDoc
            Styles.Header = DM1.tvDisHeader
            Width = 60
          end
          object cxGridColumn311: TcxGridColumn
            Caption = 'Codice'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object cxGridColumn312: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            HeaderAlignmentHorz = taCenter
            MinWidth = 290
            Width = 290
          end
          object cxGridColumn313: TcxGridColumn
            Caption = 'Prz.unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 61
            Width = 61
          end
          object cxGridColumn314: TcxGridColumn
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
          object cxGridColumn315: TcxGridColumn
            Caption = 'Prz.Un.Netto'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
          object cxGridColumn316: TcxGridColumn
            Caption = 'UM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn317: TcxGridColumn
            Caption = 'Qt'#224
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            MinWidth = 32
            Width = 32
          end
          object cxGridColumn318: TcxGridColumn
            Tag = -1
            Caption = 'In ev.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent1Bold
            Width = 40
          end
          object cxGridColumn319: TcxGridColumn
            Tag = -1
            Caption = 'Q.Ev'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn320: TcxGridColumn
            Tag = -1
            Caption = 'Q.D.E.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn321: TcxGridColumn
            Caption = 'S1'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn322: TcxGridColumn
            Caption = 'S2'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn323: TcxGridColumn
            Caption = 'S3'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn324: TcxGridColumn
            Caption = 'Importo'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn325: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn326: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn327: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn328: TcxGridColumn
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn329: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn330: TcxGridColumn
            Caption = 'Costo unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 65
            Width = 65
          end
          object cxGridColumn331: TcxGridColumn
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
          object cxGridColumn332: TcxGridColumn
            Caption = 'Margine'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Width = 50
          end
          object cxGridColumn333: TcxGridColumn
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
          object cxGridColumn334: TcxGridColumn
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
          object cxGridColumn335: TcxGridColumn
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
          object cxGridColumn336: TcxGridColumn
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
          object cxGridColumn337: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            MinWidth = 64
          end
          object cxGridColumn338: TcxGridColumn
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
          object cxGridColumn339: TcxGridColumn
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
          object cxGridColumn340: TcxGridColumn
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
          object cxGridColumn341: TcxGridColumn
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
          object cxGridColumn342: TcxGridColumn
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
          object cxGridColumn343: TcxGridColumn
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
          object cxGridColumn344: TcxGridColumn
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
          object cxGridColumn345: TcxGridColumn
            Tag = -1
            Caption = 'Rif.'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn346: TcxGridColumn
            Tag = -1
            Caption = 'Ubicazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn347: TcxGridColumn
            Tag = -1
            Caption = 'Componente'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn348: TcxGridColumn
            Tag = -1
            Caption = 'Materiale'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn349: TcxGridColumn
            Tag = -1
            Caption = 'Qta'#39' Dich.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn350: TcxGridColumn
            Tag = -1
            Caption = 'Diametro'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn351: TcxGridColumn
            Tag = -1
            Caption = 'Lunghezza'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn352: TcxGridColumn
            Tag = -1
            Caption = 'Installazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn353: TcxGridColumn
            Tag = -1
            Caption = 'Certificazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn354: TcxGridColumn
            Tag = -1
            Caption = 'Ventilazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn355: TcxGridColumn
            Tag = -1
            Caption = 'Scarico'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn356: TcxGridColumn
            Tag = -1
            Caption = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn357: TcxGridColumn
            Tag = -1
            Caption = 'Modello'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn358: TcxGridColumn
            Tag = -1
            Caption = 'Portata termica'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn359: TcxGridColumn
            Tag = -1
            Caption = 'Tipo collegamento'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn360: TcxGridColumn
            Tag = -1
            Caption = 'Instalato/Installabile'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn361: TcxGridColumn
            Tag = -1
            Caption = 'Mat/App'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn362: TcxGridColumn
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
          object cxGridColumn363: TcxGridColumn
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
          object cxGridColumn364: TcxGridColumn
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
          object cxGridColumn365: TcxGridColumn
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
          object cxGridColumn366: TcxGridColumn
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
          object cxGridColumn367: TcxGridColumn
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
          object cxGridColumn368: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 30
          end
          object cxGridColumn369: TcxGridColumn
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
          object cxGridColumn370: TcxGridColumn
            Caption = 'Costo netto unitario'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGridColumn371: TcxGridColumn
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
          object cxGridColumn372: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn373: TcxGridColumn
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
          object cxGridColumn374: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn375: TcxGridColumn
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
          object cxGridColumn376: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn377: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn378: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn379: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn380: TcxGridColumn
            Tag = 1
            Caption = 'Ord'
            DataBinding.ValueType = 'Float'
          end
          object cxGridColumn381: TcxGridColumn
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
          object cxGridColumn382: TcxGridColumn
            Caption = 'Id Op imp.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridCardView4: TcxGridCardView
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
          object cxGridCardViewRow25: TcxGridCardViewRow
            Caption = 'Costo componenti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow26: TcxGridCardViewRow
            Caption = 'Ricarico %'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00%;-,0.00%'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow27: TcxGridCardViewRow
            Caption = 'Importo ricarico'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow28: TcxGridCardViewRow
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
          object cxGridCardViewRow29: TcxGridCardViewRow
            Caption = 'Prezzo orario mano d'#39'opera'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow30: TcxGridCardViewRow
            Caption = 'Minuti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
            Properties.ReadOnly = False
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow31: TcxGridCardViewRow
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
          object cxGridCardViewRow32: TcxGridCardViewRow
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
        object cxGridTableView8: TcxGridTableView
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
          object cxGridColumn383: TcxGridColumn
            Caption = 'Cod. dip.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 150
          end
          object cxGridColumn384: TcxGridColumn
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
          object cxGridColumn385: TcxGridColumn
            Caption = 'Ore'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 6
            Properties.DisplayFormat = '0.######;-0.######'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object cxGridColumn386: TcxGridColumn
            Caption = 'Note'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
          end
          object cxGridColumn387: TcxGridColumn
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
          object cxGridColumn388: TcxGridColumn
            Caption = 'Sottocant. 2'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn389: TcxGridColumn
            Caption = 'Sottocant. 3'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn390: TcxGridColumn
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
          object cxGridColumn391: TcxGridColumn
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
          object cxGridColumn392: TcxGridColumn
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
          object cxGridColumn393: TcxGridColumn
            Caption = 'Prz.un.vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn394: TcxGridColumn
            Caption = 'Importo vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn395: TcxGridColumn
            Caption = 'Costo ora'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn396: TcxGridColumn
            Caption = 'Importo costo'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn397: TcxGridColumn
            Caption = 'Categoria manodopera'
            DataBinding.ValueType = 'Smallint'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Width = 200
          end
          object cxGridColumn398: TcxGridColumn
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
          object cxGridColumn399: TcxGridColumn
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
          object cxGridColumn400: TcxGridColumn
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
          object cxGridColumn401: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn402: TcxGridColumn
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
          object cxGridColumn403: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn404: TcxGridColumn
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
          object cxGridColumn405: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 1000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn406: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn407: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn408: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
        end
        object tvList5: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo5
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList5: TcxGridLevel
          GridView = tvList5
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato5: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 52
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        TabOrder = 0
        Visible = False
        object LabelSelezionato5: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 52
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag5: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 1
        Visible = False
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Color = 13822463
          Pen.Color = 2856447
        end
        object Label25: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 17
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label26: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label27: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label28: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label29: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione5: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice5: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'CODICE5'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit21: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit22: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit23: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit24: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
      end
    end
    object PanelGruppo6: TPanel
      Left = 0
      Top = 500
      Width = 686
      Height = 90
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      object LabelGruppo6: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 90
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '6'
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
      object Grid6: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGridTableView9: TcxGridTableView
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
          object cxGridColumn409: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 23
            Width = 23
            IsCaptionAssigned = True
          end
          object cxGridColumn410: TcxGridColumn
            Caption = 'M'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn411: TcxGridColumn
            Caption = 'M2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn412: TcxGridColumn
            Caption = 'Cod.reale'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Styles.Content = DM1.tvGCDetailContent_DatiDoc
            Styles.Header = DM1.tvDisHeader
            Width = 60
          end
          object cxGridColumn413: TcxGridColumn
            Caption = 'Codice'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object cxGridColumn414: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            HeaderAlignmentHorz = taCenter
            MinWidth = 290
            Width = 290
          end
          object cxGridColumn415: TcxGridColumn
            Caption = 'Prz.unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 61
            Width = 61
          end
          object cxGridColumn416: TcxGridColumn
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
          object cxGridColumn417: TcxGridColumn
            Caption = 'Prz.Un.Netto'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
          object cxGridColumn418: TcxGridColumn
            Caption = 'UM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn419: TcxGridColumn
            Caption = 'Qt'#224
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            MinWidth = 32
            Width = 32
          end
          object cxGridColumn420: TcxGridColumn
            Tag = -1
            Caption = 'In ev.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent1Bold
            Width = 40
          end
          object cxGridColumn421: TcxGridColumn
            Tag = -1
            Caption = 'Q.Ev'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn422: TcxGridColumn
            Tag = -1
            Caption = 'Q.D.E.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn423: TcxGridColumn
            Caption = 'S1'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn424: TcxGridColumn
            Caption = 'S2'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn425: TcxGridColumn
            Caption = 'S3'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn426: TcxGridColumn
            Caption = 'Importo'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn427: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn428: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn429: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn430: TcxGridColumn
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn431: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn432: TcxGridColumn
            Caption = 'Costo unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 65
            Width = 65
          end
          object cxGridColumn433: TcxGridColumn
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
          object cxGridColumn434: TcxGridColumn
            Caption = 'Margine'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Width = 50
          end
          object cxGridColumn435: TcxGridColumn
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
          object cxGridColumn436: TcxGridColumn
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
          object cxGridColumn437: TcxGridColumn
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
          object cxGridColumn438: TcxGridColumn
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
          object cxGridColumn439: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            MinWidth = 64
          end
          object cxGridColumn440: TcxGridColumn
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
          object cxGridColumn441: TcxGridColumn
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
          object cxGridColumn442: TcxGridColumn
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
          object cxGridColumn443: TcxGridColumn
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
          object cxGridColumn444: TcxGridColumn
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
          object cxGridColumn445: TcxGridColumn
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
          object cxGridColumn446: TcxGridColumn
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
          object cxGridColumn447: TcxGridColumn
            Tag = -1
            Caption = 'Rif.'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn448: TcxGridColumn
            Tag = -1
            Caption = 'Ubicazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn449: TcxGridColumn
            Tag = -1
            Caption = 'Componente'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn450: TcxGridColumn
            Tag = -1
            Caption = 'Materiale'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn451: TcxGridColumn
            Tag = -1
            Caption = 'Qta'#39' Dich.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn452: TcxGridColumn
            Tag = -1
            Caption = 'Diametro'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn453: TcxGridColumn
            Tag = -1
            Caption = 'Lunghezza'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn454: TcxGridColumn
            Tag = -1
            Caption = 'Installazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn455: TcxGridColumn
            Tag = -1
            Caption = 'Certificazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn456: TcxGridColumn
            Tag = -1
            Caption = 'Ventilazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn457: TcxGridColumn
            Tag = -1
            Caption = 'Scarico'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn458: TcxGridColumn
            Tag = -1
            Caption = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn459: TcxGridColumn
            Tag = -1
            Caption = 'Modello'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn460: TcxGridColumn
            Tag = -1
            Caption = 'Portata termica'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn461: TcxGridColumn
            Tag = -1
            Caption = 'Tipo collegamento'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn462: TcxGridColumn
            Tag = -1
            Caption = 'Instalato/Installabile'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn463: TcxGridColumn
            Tag = -1
            Caption = 'Mat/App'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn464: TcxGridColumn
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
          object cxGridColumn465: TcxGridColumn
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
          object cxGridColumn466: TcxGridColumn
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
          object cxGridColumn467: TcxGridColumn
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
          object cxGridColumn468: TcxGridColumn
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
          object cxGridColumn469: TcxGridColumn
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
          object cxGridColumn470: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 30
          end
          object cxGridColumn471: TcxGridColumn
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
          object cxGridColumn472: TcxGridColumn
            Caption = 'Costo netto unitario'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGridColumn473: TcxGridColumn
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
          object cxGridColumn474: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn475: TcxGridColumn
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
          object cxGridColumn476: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn477: TcxGridColumn
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
          object cxGridColumn478: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn479: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn480: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn481: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn482: TcxGridColumn
            Tag = 1
            Caption = 'Ord'
            DataBinding.ValueType = 'Float'
          end
          object cxGridColumn483: TcxGridColumn
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
          object cxGridColumn484: TcxGridColumn
            Caption = 'Id Op imp.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridCardView5: TcxGridCardView
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
          object cxGridCardViewRow33: TcxGridCardViewRow
            Caption = 'Costo componenti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow34: TcxGridCardViewRow
            Caption = 'Ricarico %'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00%;-,0.00%'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow35: TcxGridCardViewRow
            Caption = 'Importo ricarico'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow36: TcxGridCardViewRow
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
          object cxGridCardViewRow37: TcxGridCardViewRow
            Caption = 'Prezzo orario mano d'#39'opera'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow38: TcxGridCardViewRow
            Caption = 'Minuti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
            Properties.ReadOnly = False
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow39: TcxGridCardViewRow
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
          object cxGridCardViewRow40: TcxGridCardViewRow
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
        object cxGridTableView10: TcxGridTableView
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
          object cxGridColumn485: TcxGridColumn
            Caption = 'Cod. dip.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 150
          end
          object cxGridColumn486: TcxGridColumn
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
          object cxGridColumn487: TcxGridColumn
            Caption = 'Ore'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 6
            Properties.DisplayFormat = '0.######;-0.######'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object cxGridColumn488: TcxGridColumn
            Caption = 'Note'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
          end
          object cxGridColumn489: TcxGridColumn
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
          object cxGridColumn490: TcxGridColumn
            Caption = 'Sottocant. 2'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn491: TcxGridColumn
            Caption = 'Sottocant. 3'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn492: TcxGridColumn
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
          object cxGridColumn493: TcxGridColumn
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
          object cxGridColumn494: TcxGridColumn
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
          object cxGridColumn495: TcxGridColumn
            Caption = 'Prz.un.vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn496: TcxGridColumn
            Caption = 'Importo vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn497: TcxGridColumn
            Caption = 'Costo ora'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn498: TcxGridColumn
            Caption = 'Importo costo'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn499: TcxGridColumn
            Caption = 'Categoria manodopera'
            DataBinding.ValueType = 'Smallint'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Width = 200
          end
          object cxGridColumn500: TcxGridColumn
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
          object cxGridColumn501: TcxGridColumn
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
          object cxGridColumn502: TcxGridColumn
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
          object cxGridColumn503: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn504: TcxGridColumn
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
          object cxGridColumn505: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn506: TcxGridColumn
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
          object cxGridColumn507: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 1000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn508: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn509: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn510: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
        end
        object tvList6: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo6
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList6: TcxGridLevel
          GridView = tvList6
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato6: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 52
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        TabOrder = 1
        Visible = False
        object LabelSelezionato6: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 52
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag6: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 0
        Visible = False
        object Shape6: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Color = 13822463
          Pen.Color = 2856447
        end
        object Label32: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 17
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label33: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label34: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label35: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label36: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione6: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice6: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'CODICE6'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit27: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit28: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit29: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit30: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
      end
    end
    object PanelGruppo4: TPanel
      Left = 0
      Top = 300
      Width = 686
      Height = 90
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      object LabelGruppo4: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 90
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '4'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = 16250871
        Font.Height = -96
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Grid4: TcxGrid
        Left = 107
        Top = 5
        Width = 544
        Height = 79
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object cxGridTableView5: TcxGridTableView
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
          object cxGridColumn205: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 23
            Width = 23
            IsCaptionAssigned = True
          end
          object cxGridColumn206: TcxGridColumn
            Caption = 'M'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn207: TcxGridColumn
            Caption = 'M2'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Width = 19
          end
          object cxGridColumn208: TcxGridColumn
            Caption = 'Cod.reale'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            MinWidth = 0
            Styles.Content = DM1.tvGCDetailContent_DatiDoc
            Styles.Header = DM1.tvDisHeader
            Width = 60
          end
          object cxGridColumn209: TcxGridColumn
            Caption = 'Codice'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 90
          end
          object cxGridColumn210: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            HeaderAlignmentHorz = taCenter
            MinWidth = 290
            Width = 290
          end
          object cxGridColumn211: TcxGridColumn
            Caption = 'Prz.unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 61
            Width = 61
          end
          object cxGridColumn212: TcxGridColumn
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
          object cxGridColumn213: TcxGridColumn
            Caption = 'Prz.Un.Netto'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
          end
          object cxGridColumn214: TcxGridColumn
            Caption = 'UM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn215: TcxGridColumn
            Caption = 'Qt'#224
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            MinWidth = 32
            Width = 32
          end
          object cxGridColumn216: TcxGridColumn
            Tag = -1
            Caption = 'In ev.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent1Bold
            Width = 40
          end
          object cxGridColumn217: TcxGridColumn
            Tag = -1
            Caption = 'Q.Ev'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn218: TcxGridColumn
            Tag = -1
            Caption = 'Q.D.E.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            HeaderAlignmentHorz = taCenter
            Styles.Content = DM1.tvAnotherContent2
            Width = 35
          end
          object cxGridColumn219: TcxGridColumn
            Caption = 'S1'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn220: TcxGridColumn
            Caption = 'S2'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn221: TcxGridColumn
            Caption = 'S3'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 25
            Width = 25
          end
          object cxGridColumn222: TcxGridColumn
            Caption = 'Importo'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn223: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn224: TcxGridColumn
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn225: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn226: TcxGridColumn
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn227: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
          end
          object cxGridColumn228: TcxGridColumn
            Caption = 'Costo unit.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 65
            Width = 65
          end
          object cxGridColumn229: TcxGridColumn
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
          object cxGridColumn230: TcxGridColumn
            Caption = 'Margine'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Width = 50
          end
          object cxGridColumn231: TcxGridColumn
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
          object cxGridColumn232: TcxGridColumn
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
          object cxGridColumn233: TcxGridColumn
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
          object cxGridColumn234: TcxGridColumn
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
          object cxGridColumn235: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            MinWidth = 64
          end
          object cxGridColumn236: TcxGridColumn
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
          object cxGridColumn237: TcxGridColumn
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
          object cxGridColumn238: TcxGridColumn
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
          object cxGridColumn239: TcxGridColumn
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
          object cxGridColumn240: TcxGridColumn
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
          object cxGridColumn241: TcxGridColumn
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
          object cxGridColumn242: TcxGridColumn
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
          object cxGridColumn243: TcxGridColumn
            Tag = -1
            Caption = 'Rif.'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn244: TcxGridColumn
            Tag = -1
            Caption = 'Ubicazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn245: TcxGridColumn
            Tag = -1
            Caption = 'Componente'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn246: TcxGridColumn
            Tag = -1
            Caption = 'Materiale'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn247: TcxGridColumn
            Tag = -1
            Caption = 'Qta'#39' Dich.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn248: TcxGridColumn
            Tag = -1
            Caption = 'Diametro'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn249: TcxGridColumn
            Tag = -1
            Caption = 'Lunghezza'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn250: TcxGridColumn
            Tag = -1
            Caption = 'Installazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn251: TcxGridColumn
            Tag = -1
            Caption = 'Certificazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn252: TcxGridColumn
            Tag = -1
            Caption = 'Ventilazione'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn253: TcxGridColumn
            Tag = -1
            Caption = 'Scarico'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn254: TcxGridColumn
            Tag = -1
            Caption = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn255: TcxGridColumn
            Tag = -1
            Caption = 'Modello'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn256: TcxGridColumn
            Tag = -1
            Caption = 'Portata termica'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn257: TcxGridColumn
            Tag = -1
            Caption = 'Tipo collegamento'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn258: TcxGridColumn
            Tag = -1
            Caption = 'Instalato/Installabile'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn259: TcxGridColumn
            Tag = -1
            Caption = 'Mat/App'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColumn260: TcxGridColumn
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
          object cxGridColumn261: TcxGridColumn
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
          object cxGridColumn262: TcxGridColumn
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
          object cxGridColumn263: TcxGridColumn
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
          object cxGridColumn264: TcxGridColumn
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
          object cxGridColumn265: TcxGridColumn
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
          object cxGridColumn266: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 30
          end
          object cxGridColumn267: TcxGridColumn
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
          object cxGridColumn268: TcxGridColumn
            Caption = 'Costo netto unitario'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            VisibleForCustomization = False
            Width = 70
          end
          object cxGridColumn269: TcxGridColumn
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
          object cxGridColumn270: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn271: TcxGridColumn
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
          object cxGridColumn272: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn273: TcxGridColumn
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
          object cxGridColumn274: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 5000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn275: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn276: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn277: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn278: TcxGridColumn
            Tag = 1
            Caption = 'Ord'
            DataBinding.ValueType = 'Float'
          end
          object cxGridColumn279: TcxGridColumn
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
          object cxGridColumn280: TcxGridColumn
            Caption = 'Id Op imp.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridCardView3: TcxGridCardView
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
          object cxGridCardViewRow17: TcxGridCardViewRow
            Caption = 'Costo componenti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow18: TcxGridCardViewRow
            Caption = 'Ricarico %'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00%;-,0.00%'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow19: TcxGridCardViewRow
            Caption = 'Importo ricarico'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow20: TcxGridCardViewRow
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
          object cxGridCardViewRow21: TcxGridCardViewRow
            Caption = 'Prezzo orario mano d'#39'opera'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
            Properties.ReadOnly = True
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow22: TcxGridCardViewRow
            Caption = 'Minuti'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0"'#39'"; -,0"'#39'"'
            Properties.ReadOnly = False
            Position.BeginsLayer = True
          end
          object cxGridCardViewRow23: TcxGridCardViewRow
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
          object cxGridCardViewRow24: TcxGridCardViewRow
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
        object cxGridTableView6: TcxGridTableView
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
          object cxGridColumn281: TcxGridColumn
            Caption = 'Cod. dip.'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 150
          end
          object cxGridColumn282: TcxGridColumn
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
          object cxGridColumn283: TcxGridColumn
            Caption = 'Ore'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 6
            Properties.DisplayFormat = '0.######;-0.######'
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object cxGridColumn284: TcxGridColumn
            Caption = 'Note'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
          end
          object cxGridColumn285: TcxGridColumn
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
          object cxGridColumn286: TcxGridColumn
            Caption = 'Sottocant. 2'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn287: TcxGridColumn
            Caption = 'Sottocant. 3'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            HeaderAlignmentHorz = taCenter
            Width = 70
          end
          object cxGridColumn288: TcxGridColumn
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
          object cxGridColumn289: TcxGridColumn
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
          object cxGridColumn290: TcxGridColumn
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
          object cxGridColumn291: TcxGridColumn
            Caption = 'Prz.un.vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn292: TcxGridColumn
            Caption = 'Importo vend.'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn293: TcxGridColumn
            Caption = 'Costo ora'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGridColumn294: TcxGridColumn
            Caption = 'Importo costo'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGridColumn295: TcxGridColumn
            Caption = 'Categoria manodopera'
            DataBinding.ValueType = 'Smallint'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Width = 200
          end
          object cxGridColumn296: TcxGridColumn
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
          object cxGridColumn297: TcxGridColumn
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
          object cxGridColumn298: TcxGridColumn
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
          object cxGridColumn299: TcxGridColumn
            Caption = 'Ricarico'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn300: TcxGridColumn
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
          object cxGridColumn301: TcxGridColumn
            Caption = 'Qta'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            RepositoryItem = DM1.EdPropQta
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
          object cxGridColumn302: TcxGridColumn
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
          object cxGridColumn303: TcxGridColumn
            Caption = 'Descrizione'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.MaxLength = 1000
            Properties.WantReturns = False
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 290
          end
          object cxGridColumn304: TcxGridColumn
            Caption = 'GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn305: TcxGridColumn
            Caption = 'Ref. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
          object cxGridColumn306: TcxGridColumn
            Caption = 'Anc. GUID'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
            Width = 100
          end
        end
        object tvList4: TcxGridDBTableView
          OnDblClick = tvList1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = SourceGruppo4
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
          OptionsView.Header = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
        end
        object lvList4: TcxGridLevel
          GridView = tvList4
          Options.DetailFrameColor = 10066329
          Options.DetailTabsPosition = dtpTop
          Options.TabsForEmptyDetails = False
          Styles.Tab = DM1.Tab
          Styles.TabsBackground = DM1.TabsBackground
        end
      end
      object PanelSelezionato4: TPanel
        Left = 120
        Top = 66
        Width = 282
        Height = 47
        BevelOuter = bvNone
        Color = 10987431
        Padding.Left = 36
        TabOrder = 0
        Visible = False
        object LabelSelezionato4: TLabel
          Left = 36
          Top = 0
          Width = 246
          Height = 47
          Align = alClient
          Caption = '- - -'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15329769
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 0
          ExplicitWidth = 28
          ExplicitHeight = 22
        end
      end
      object PanelAnag4: TPanel
        Left = 242
        Top = 5
        Width = 264
        Height = 79
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 1
        Visible = False
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 264
          Height = 79
          Align = alClient
          Brush.Style = bsClear
          Pen.Color = 2856447
        end
        object Label18: TLabel
          Left = 10
          Top = 16
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione '
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 10
          Top = 38
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Descrizione breve'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 10
          Top = 60
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Sconti di acquisto'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 151
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 205
          Top = 60
          Width = 7
          Height = 15
          AutoSize = False
          Caption = '+'
          Color = 3223857
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Descrizione4: TDBEdit
          Left = 105
          Top = 15
          Width = 154
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'Descrizione'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object Codice4: TDBEdit
          Tag = -1
          Left = 209
          Top = 1
          Width = 50
          Height = 11
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'CODICE4'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = 11184810
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit15: TDBEdit
          Left = 105
          Top = 37
          Width = 50
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'DESCBREVE'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit16: TDBEdit
          Left = 105
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO1'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit17: TDBEdit
          Left = 159
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO2'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
        object DBEdit18: TDBEdit
          Left = 213
          Top = 59
          Width = 45
          Height = 16
          Cursor = crIBeam
          AutoSize = False
          Color = 16250871
          Ctl3D = False
          DataField = 'SCONTODIACQUISTO3'
          DataSource = SourceGruppo4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnEnter = Descrizione1Enter
          OnExit = Descrizione1Exit
        end
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
    object RxSpeedButtonResetQuery: TSpeedButton
      Left = 312
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Azzera i filtri di ricerca'
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
      Hint = 'Visualizza / Apri'
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
    object RxSpeedButtonUscita: TSpeedButton
      Left = 2
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Pagina precedenre'
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
      Hint = 'Modifica'
      AllowAllUp = True
      GroupIndex = 1
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
      Hint = 'Nuovo / Aggiungi'
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
      Hint = 'Elimina / Cancella'
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
      Hint = 'Esegui la ricerca / Trova'
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
      Hint = 'Stampa'
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
    object RxSpeedButtonHelp: TSpeedButton
      Left = 62
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
  object QryGruppo1: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI')
    FieldOptions = []
    Left = 642
    Top = 90
    object QryGruppo1CODICE1: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object QryGruppo1CODICE2: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object QryGruppo1CODICE3: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object QryGruppo1CODICE4: TIntegerField
      FieldName = 'CODICE4'
    end
    object QryGruppo1CODICE5: TIntegerField
      FieldName = 'CODICE5'
    end
    object QryGruppo1CODICE6: TIntegerField
      FieldName = 'CODICE6'
    end
    object QryGruppo1DESCRIZIONE: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object QryGruppo1SINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QryGruppo1DESCBREVE: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object QryGruppo1SCONTODIACQUISTO1: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo1SCONTODIACQUISTO2: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo1SCONTODIACQUISTO3: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo1: TDataSource
    AutoEdit = False
    DataSet = QryGruppo1
    Left = 670
    Top = 90
  end
  object QryGruppo3: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI'
      '')
    FieldOptions = []
    Left = 642
    Top = 273
    object QryGruppo3CODICE1: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object QryGruppo3CODICE2: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object QryGruppo3CODICE3: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object QryGruppo3CODICE4: TIntegerField
      FieldName = 'CODICE4'
    end
    object QryGruppo3CODICE5: TIntegerField
      FieldName = 'CODICE5'
    end
    object QryGruppo3CODICE6: TIntegerField
      FieldName = 'CODICE6'
    end
    object QryGruppo3DESCRIZIONE: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object QryGruppo3SINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QryGruppo3DESCBREVE: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object QryGruppo3SCONTODIACQUISTO1: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo3SCONTODIACQUISTO2: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo3SCONTODIACQUISTO3: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo3: TDataSource
    AutoEdit = False
    DataSet = QryGruppo3
    Left = 670
    Top = 273
  end
  object QryGruppo2: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI'
      '')
    FieldOptions = []
    Left = 642
    Top = 181
    object QryGruppo2CODICE1: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object QryGruppo2CODICE2: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object QryGruppo2CODICE3: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object QryGruppo2CODICE4: TIntegerField
      FieldName = 'CODICE4'
    end
    object QryGruppo2CODICE5: TIntegerField
      FieldName = 'CODICE5'
    end
    object QryGruppo2CODICE6: TIntegerField
      FieldName = 'CODICE6'
    end
    object QryGruppo2DESCRIZIONE: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object QryGruppo2SINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QryGruppo2DESCBREVE: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object QryGruppo2SCONTODIACQUISTO1: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo2SCONTODIACQUISTO2: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object QryGruppo2SCONTODIACQUISTO3: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo2: TDataSource
    AutoEdit = False
    DataSet = QryGruppo2
    Left = 670
    Top = 181
  end
  object QryGruppo4: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI'
      '')
    FieldOptions = []
    Left = 642
    Top = 385
    object IntegerField1: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'CODICE4'
    end
    object IntegerField5: TIntegerField
      FieldName = 'CODICE5'
    end
    object IntegerField6: TIntegerField
      FieldName = 'CODICE6'
    end
    object StringField1: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object IBOFloatField1: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField2: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField3: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo4: TDataSource
    AutoEdit = False
    DataSet = QryGruppo4
    Left = 670
    Top = 385
  end
  object QryGruppo5: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI'
      '')
    FieldOptions = []
    Left = 642
    Top = 481
    object IntegerField7: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'CODICE4'
    end
    object IntegerField11: TIntegerField
      FieldName = 'CODICE5'
    end
    object IntegerField12: TIntegerField
      FieldName = 'CODICE6'
    end
    object StringField4: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object IBOFloatField4: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField5: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField6: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo5: TDataSource
    AutoEdit = False
    DataSet = QryGruppo5
    Left = 670
    Top = 481
  end
  object QryGruppo6: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM GRUPPI'
      'WHERE'
      'CODICE1=:OLD_CODICE1'
      'AND CODICE2=:OLD_CODICE2'
      'AND CODICE3=:OLD_CODICE3'
      'AND CODICE4=:OLD_CODICE4'
      'AND CODICE5=:OLD_CODICE5'
      'AND CODICE6=:OLD_CODICE6'
      '')
    EditSQL.Strings = (
      'UPDATE GRUPPI SET'
      '   CODICE1 = :CODICE1,'
      '   CODICE2 = :CODICE2,'
      '   CODICE3 = :CODICE3,'
      '   CODICE4 = :CODICE4,'
      '   CODICE5 = :CODICE5,'
      '   CODICE6 = :CODICE6,'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   SINCHRO = :SINCHRO,'
      '   DESCBREVE = :DESCBREVE,'
      '   SCONTODIACQUISTO1 = :SCONTODIACQUISTO1,'
      '   SCONTODIACQUISTO2 = :SCONTODIACQUISTO2,'
      '   SCONTODIACQUISTO3 = :SCONTODIACQUISTO3'
      'WHERE'
      '           CODICE1 = :OLD_CODICE1'
      'AND   CODICE2 = :OLD_CODICE2'
      'AND   CODICE3 = :OLD_CODICE3'
      'AND   CODICE4 = :OLD_CODICE4'
      'AND   CODICE5 = :OLD_CODICE5'
      'AND   CODICE6 = :OLD_CODICE6')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO GRUPPI'
      
        '   (CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, DESCRI' +
        'ZIONE, SINCHRO, DESCBREVE, SCONTODIACQUISTO1, SCONTODIACQUISTO2,' +
        ' SCONTODIACQUISTO3)'
      'VALUES'
      
        '   (:CODICE1, :CODICE2, :CODICE3, :CODICE4, :CODICE5, :CODICE6, ' +
        ':DESCRIZIONE, :SINCHRO, :DESCBREVE, :SCONTODIACQUISTO1, :SCONTOD' +
        'IACQUISTO2, :SCONTODIACQUISTO3)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforePost = QryGruppo1BeforePost
    SQL.Strings = (
      'SELECT * FROM GRUPPI'
      '')
    FieldOptions = []
    Left = 642
    Top = 585
    object IntegerField13: TIntegerField
      FieldName = 'CODICE1'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'CODICE2'
      Required = True
    end
    object IntegerField15: TIntegerField
      FieldName = 'CODICE3'
      Required = True
    end
    object IntegerField16: TIntegerField
      FieldName = 'CODICE4'
    end
    object IntegerField17: TIntegerField
      FieldName = 'CODICE5'
    end
    object IntegerField18: TIntegerField
      FieldName = 'CODICE6'
    end
    object StringField7: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'DESCBREVE'
      Size = 6
    end
    object IBOFloatField7: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO1'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField8: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO2'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
    object IBOFloatField9: TIBOFloatField
      Alignment = taCenter
      FieldName = 'SCONTODIACQUISTO3'
      DisplayFormat = ',0.##%;-,0.##%'
      EditFormat = ',0.##;-,0.##'
    end
  end
  object SourceGruppo6: TDataSource
    AutoEdit = False
    DataSet = QryGruppo6
    Left = 670
    Top = 585
  end
end
