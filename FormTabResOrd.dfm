inherited TagResOrdForm: TTagResOrdForm
  Left = 658
  Top = 304
  Caption = 'TagResOrdForm'
  ClientHeight = 562
  ClientWidth = 706
  Color = clWhite
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 706
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  object PanelResOrd: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 536
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      684
      536)
    object LabelResOrd: TLabel
      Left = 0
      Top = 0
      Width = 684
      Height = 25
      Align = alTop
      AutoSize = False
      Caption = ' Residuo ordini del'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object PanelFiltri: TPanel
      Left = 0
      Top = 456
      Width = 684
      Height = 80
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      OnResize = PanelFiltriResize
      object SubPanelFiltri: TPanel
        Left = 0
        Top = 0
        Width = 684
        Height = 80
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object SBFilterOpenClose: TSpeedButtonRollOver
          Left = 1
          Top = 3
          Width = 19
          Height = 27
          Cursor = crHandPoint
          OnClick = SBFilterOpenCloseClick
        end
        object ShapeDocDisp: TShape
          Left = 472
          Top = -8
          Width = 33
          Height = 25
          Brush.Color = 11796403
          Pen.Color = 21760
          Visible = False
        end
        object ShapeDocNonDisp: TShape
          Left = 512
          Top = -8
          Width = 33
          Height = 25
          Brush.Color = 12895485
          Pen.Color = 102
          Visible = False
        end
        object LabelFontDisp: TLabel
          Left = 483
          Top = -3
          Width = 9
          Height = 13
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 47872
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LabelFontNonDisp: TLabel
          Left = 523
          Top = -3
          Width = 9
          Height = 13
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3947775
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LabelFontDisabled: TLabel
          Left = 555
          Top = -3
          Width = 9
          Height = 13
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11908533
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object StaticText79: TStaticText
          Left = 30
          Top = 10
          Width = 330
          Height = 16
          AutoSize = False
          Caption = ' Trova'
          Color = 28895
          Font.Charset = ANSI_CHARSET
          Font.Color = 12902911
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          Transparent = False
        end
        object FilterTrova: TEdit
          Left = 66
          Top = 11
          Width = 293
          Height = 14
          Hint = 
            'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
            'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
          AutoSize = False
          BorderStyle = bsNone
          Color = 15266815
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnKeyPress = FilterTrovaKeyPress
        end
        object StaticText19: TStaticText
          Left = 0
          Top = 35
          Width = 144
          Height = 15
          AutoSize = False
          Caption = ' Codice'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          Transparent = False
        end
        object FilterCodice: TEdit
          Left = 40
          Top = 36
          Width = 103
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 15266815
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnKeyPress = FilterTrovaKeyPress
        end
        object StaticText18: TStaticText
          Left = 149
          Top = 35
          Width = 273
          Height = 15
          AutoSize = False
          Caption = ' Descrizione'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 9
          Transparent = False
        end
        object FilterDescrizione: TEdit
          Left = 215
          Top = 36
          Width = 206
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 15266815
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnKeyPress = FilterTrovaKeyPress
        end
        object StaticText1: TStaticText
          Left = 118
          Top = 55
          Width = 171
          Height = 15
          AutoSize = False
          Caption = ' Riferimento'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 10
          Transparent = False
        end
        object FilterRiferimento: TEdit
          Left = 184
          Top = 56
          Width = 104
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 15266815
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnKeyPress = FilterTrovaKeyPress
        end
        object StaticText2: TStaticText
          Left = 0
          Top = 55
          Width = 113
          Height = 15
          AutoSize = False
          Caption = ' N'#176' doc.'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 11
          Transparent = False
        end
        object FilterNumDoc: TEdit
          Left = 43
          Top = 56
          Width = 69
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 15266815
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnKeyPress = FilterTrovaKeyPress
        end
        object StaticText4: TStaticText
          Left = 294
          Top = 55
          Width = 221
          Height = 15
          AutoSize = False
          Caption = ' Destinazione'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 12
          Transparent = False
        end
        object FilterDestinazione: TcxComboBox
          Left = 366
          Top = 54
          AutoSize = False
          ParentFont = False
          Properties.Sorted = True
          Style.StyleController = DMStyles.cxEditStyleController_Filters
          TabOrder = 5
          OnKeyPress = FilterTrovaKeyPress
          Height = 17
          Width = 150
        end
        object StaticText3: TStaticText
          Left = 520
          Top = 55
          Width = 168
          Height = 15
          AutoSize = False
          Caption = ' Operatore'
          Color = 11064319
          Font.Charset = ANSI_CHARSET
          Font.Color = 25542
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 13
          Transparent = False
        end
        object FilterOperatore: TcxComboBox
          Left = 575
          Top = 54
          AutoSize = False
          ParentFont = False
          Properties.Sorted = True
          Style.StyleController = DMStyles.cxEditStyleController_Filters
          TabOrder = 6
          OnKeyPress = FilterTrovaKeyPress
          Height = 17
          Width = 109
        end
      end
    end
    object GridResOrd: TcxGrid
      Left = 0
      Top = 25
      Width = 684
      Height = 431
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailFrameColor = clBlack
      RootLevelOptions.DetailFrameWidth = 1
      object btvResOrd: TcxGridDBBandedTableView
        DragMode = dmAutomatic
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCustomDrawCell = btvResOrdCustomDrawCell
        OnCustomDrawPartBackground = btvResOrdCustomDrawPartBackground
        DataController.DataSource = SourceResOrd
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'COMMESSA_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'GIACENZA_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'MONTATO_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'FATTURATO_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DAFATTURARE_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'COMMESSA_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'CARICO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'SCARICO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'GIACENZA_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'MONTATO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'FATTURATO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DAFATTURARE_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'COMMESSA_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'GIACENZA_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'FATTURATO_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DAFATTURARE_GUADAGNOIMPORTO'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'COMMESSA_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'GIACENZA_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'MONTATO_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'FATTURATO_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'DAFATTURARE_IMPORTOACQ'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'COMMESSA_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'GIACENZA_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'MONTATO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'FATTURATO_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'DAFATTURARE_IMPORTOVEND'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'COMMESSA_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'GIACENZA_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'FATTURATO_GUADAGNOIMPORTO'
          end
          item
            Format = '#,0.00'
            Kind = skSum
            FieldName = 'DAFATTURARE_GUADAGNOIMPORTO'
          end>
        DataController.Summary.SummaryGroups = <>
        DateTimeHandling.Grouping = dtgByMonth
        FilterRow.InfoText = 'Clicca qui per definire un filtro'
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsCustomize.NestedBands = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.InvertSelect = False
        OptionsView.NoDataToDisplayInfoText = 'Nessun dato da visualizzare'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.FooterAutoHeight = True
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 49
        OptionsView.GroupRowStyle = grsOffice11
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.HeaderEndEllipsis = True
        OptionsView.FixedBandSeparatorColor = clBlack
        OptionsView.FixedBandSeparatorWidth = 1
        Styles.ContentEven = DM1.tvContentEven
        Styles.ContentOdd = DM1.tvContentOdd
        Styles.Group = DM1.PrintGroup
        Styles.StyleSheet = DM1.btvGCMaster
        OnCustomDrawColumnHeader = btvResOrdCustomDrawColumnHeader
        OnCustomDrawGroupCell = btvResOrdCustomDrawGroupCell
        Bands = <
          item
            Caption = 'Articolo'
          end
          item
            Caption = 'Quantit'#224
          end
          item
            Caption = 'Importi'
            Visible = False
            VisibleForCustomization = False
          end
          item
            Caption = 'Altro'
            Visible = False
            VisibleForCustomization = False
          end>
        object btvResOrdRAGSOC: TcxGridDBBandedColumn
          Caption = 'Fornitore'
          DataBinding.FieldName = 'RAGSOC'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 150
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object btvResOrdNUMDOC: TcxGridDBBandedColumn
          Caption = 'N'#176' doc.'
          DataBinding.FieldName = 'NUMDOC'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          OnGetDisplayText = btvResOrdNUMDOCGetDisplayText
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 80
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object btvResOrdDATADOC: TcxGridDBBandedColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DATADOC'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 80
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object btvResOrdCODICEARTICOLO: TcxGridDBBandedColumn
          Caption = 'Codice articolo'
          DataBinding.FieldName = 'CODICEARTICOLO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object btvResOrdDESCRIZIONE: TcxGridDBBandedColumn
          Caption = 'Descrizione'
          DataBinding.FieldName = 'DESCRIZIONE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object btvResOrdUM: TcxGridDBBandedColumn
          DataBinding.FieldName = 'UM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 20
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object btvResOrdQTA: TcxGridDBBandedColumn
          Caption = 'Ordinata'
          DataBinding.FieldName = 'QTA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDisplayText = btvResOrdQTAGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object btvResOrdQTAEASA: TcxGridDBBandedColumn
          Caption = 'Evasa'
          DataBinding.FieldName = 'QTAEASA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDisplayText = btvResOrdQTAGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object btvResOrdRESIDUO: TcxGridDBBandedColumn
          Caption = 'Residuo'
          DataBinding.FieldName = 'RESIDUO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnCustomDrawCell = btvResOrdRESIDUOCustomDrawCell
          OnGetDisplayText = btvResOrdQTAGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object btvResOrdGIACENZA: TcxGridDBBandedColumn
          Caption = 'Giacenza'
          DataBinding.FieldName = 'GIACENZA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDisplayText = btvResOrdQTAGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 30
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object btvResOrdPREZZUUNITARIO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PREZZUUNITARIO'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object btvResOrdSCONTORIGO1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SCONTORIGO1'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object btvResOrdSCONTORIGO2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SCONTORIGO2'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object btvResOrdSCONTORIGO3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SCONTORIGO3'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object btvResOrdIMPORTORIGO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'IMPORTORIGO'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 2
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object btvResOrdDATACONSEGNA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DATACONSEGNA'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object btvResOrdPROGRIGO: TcxGridDBBandedColumn
          Caption = 'Rigo'
          DataBinding.FieldName = 'PROGRIGO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 40
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object btvResOrdRIFERIMENTO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RIFERIMENTO'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object btvResOrdOPERATORE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'OPERATORE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object btvResOrdCODDESTMERCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CODDESTMERCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object btvResOrdRAGSOCMERCE1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RAGSOCMERCE1'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object btvResOrdRAGSOCMERCE2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RAGSOCMERCE2'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object btvResOrdINDIRIZZOMERCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'INDIRIZZOMERCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object btvResOrdCAPMERCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CAPMERCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object btvResOrdLOCALITAMERCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'LOCALITAMERCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object btvResOrdPROVINCIAMERCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PROVINCIAMERCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object btvResOrdDISPONIBILE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DISPONIBILE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object btvResOrdDOCDISP: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DOCDISP'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object btvResOrdFORGROUP: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FORGROUP'
          Visible = False
          GroupIndex = 0
          SortIndex = 0
          SortOrder = soDescending
          VisibleForCustomization = False
          Position.BandIndex = 3
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
      end
      object lvResOrd: TcxGridLevel
        Caption = 'Per articolo'
        GridView = btvResOrd
      end
    end
    object Panel20: TPanel
      Left = 645
      Top = 2
      Width = 28
      Height = 14
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = clWhite
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object SBCollapseGroups: TSpeedButton
        Left = 1
        Top = 1
        Width = 11
        Height = 11
        Cursor = crHandPoint
        Flat = True
        Glyph.Data = {
          36010000424D6A01000000000000B60000002800000009000000090000000100
          100003000000B400000000000000000000001000000000000000007C0000E003
          00001F0000000000000000008000008000000080800080000000800080008080
          0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
          0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
          FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
          00001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7F000000000000
          00000000FF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
          FF7F100000001F7C10001000100010001000100010001F7C0000}
        OnClick = SBCollapseGroupsClick
      end
      object SBExpandGroups: TSpeedButton
        Left = 16
        Top = 1
        Width = 11
        Height = 11
        Cursor = crHandPoint
        Flat = True
        Glyph.Data = {
          36010000424D6A01000000000000B60000002800000009000000090000000100
          100003000000B400000000000000000000001000000000000000007C0000E003
          00001F0000000000000000008000008000000080800080000000800080008080
          0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
          0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
          FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F1000
          00001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7F000000000000
          00000000FF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000
          FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
          FF7F100000001F7C10001000100010001000100010001F7C0000}
        OnClick = SBExpandGroupsClick
      end
    end
  end
  object SourceResOrd: TDataSource
    AutoEdit = False
    DataSet = CdsResOrd
    Left = 137
    Top = 88
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    Host = 'www.levantesw.it'
    Passive = True
    ConnectTimeout = 0
    Password = 'tappami652'
    Username = 'trasferimento'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 104
    Top = 136
  end
  object ZLB1: TZLBArchive
    Left = 168
    Top = 136
  end
  object CdsResOrd: TClientDataSet
    Aggregates = <>
    FileName = 'C:\WinProject\LevanteDev\Download\ResOrd.XML'
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'NUMDOC'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'DATADOC'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'PROGRIGO'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'RAGSOC'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODICEARTICOLO'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCRIZIONE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UM'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'QTA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'PREZZUUNITARIO'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO1'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO2'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO3'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'IMPORTORIGO'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'DATACONSEGNA'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'QTAEASA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'GIACENZA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'RIFERIMENTO'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OPERATORE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CODDESTMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'RAGSOCMERCE1'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RAGSOCMERCE2'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'INDIRIZZOMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAPMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOCALITAMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PROVINCIAMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    OnCalcFields = CdsResOrdCalcFields
    Left = 104
    Top = 88
    object CdsResOrdNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object CdsResOrdDATADOC: TDateField
      FieldName = 'DATADOC'
    end
    object CdsResOrdPROGRIGO: TIntegerField
      FieldName = 'PROGRIGO'
    end
    object CdsResOrdRAGSOC: TStringField
      FieldName = 'RAGSOC'
      Size = 60
    end
    object CdsResOrdCODICEARTICOLO: TStringField
      FieldName = 'CODICEARTICOLO'
      Size = 25
    end
    object CdsResOrdDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object CdsResOrdUM: TStringField
      FieldName = 'UM'
      Size = 2
    end
    object CdsResOrdQTA: TFloatField
      FieldName = 'QTA'
    end
    object CdsResOrdPREZZUUNITARIO: TFloatField
      FieldName = 'PREZZUUNITARIO'
    end
    object CdsResOrdSCONTORIGO1: TFloatField
      FieldName = 'SCONTORIGO1'
    end
    object CdsResOrdSCONTORIGO2: TFloatField
      FieldName = 'SCONTORIGO2'
    end
    object CdsResOrdSCONTORIGO3: TFloatField
      FieldName = 'SCONTORIGO3'
    end
    object CdsResOrdIMPORTORIGO: TFloatField
      FieldName = 'IMPORTORIGO'
    end
    object CdsResOrdDATACONSEGNA: TDateField
      FieldName = 'DATACONSEGNA'
    end
    object CdsResOrdQTAEASA: TFloatField
      FieldName = 'QTAEASA'
    end
    object CdsResOrdGIACENZA: TFloatField
      FieldName = 'GIACENZA'
    end
    object CdsResOrdRIFERIMENTO: TStringField
      FieldName = 'RIFERIMENTO'
      Size = 40
    end
    object CdsResOrdOPERATORE: TStringField
      FieldName = 'OPERATORE'
      Size = 40
    end
    object CdsResOrdCODDESTMERCE: TStringField
      FieldName = 'CODDESTMERCE'
      Size = 25
    end
    object CdsResOrdRAGSOCMERCE1: TStringField
      FieldName = 'RAGSOCMERCE1'
      Size = 40
    end
    object CdsResOrdRAGSOCMERCE2: TStringField
      FieldName = 'RAGSOCMERCE2'
      Size = 40
    end
    object CdsResOrdINDIRIZZOMERCE: TStringField
      FieldName = 'INDIRIZZOMERCE'
      Size = 40
    end
    object CdsResOrdCAPMERCE: TStringField
      FieldName = 'CAPMERCE'
      Size = 10
    end
    object CdsResOrdLOCALITAMERCE: TStringField
      FieldName = 'LOCALITAMERCE'
      Size = 40
    end
    object CdsResOrdPROVINCIAMERCE: TStringField
      FieldName = 'PROVINCIAMERCE'
      Size = 5
    end
    object CdsResOrdRESIDUO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RESIDUO'
      Calculated = True
    end
    object CdsResOrdDISPONIBILE: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'DISPONIBILE'
      Calculated = True
    end
    object CdsResOrdDOCDISP: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'DOCDISP'
      Calculated = True
    end
    object CdsResOrdFORGROUP: TStringField
      FieldKind = fkCalculated
      FieldName = 'FORGROUP'
      Size = 30
      Calculated = True
    end
  end
  object CdsDocDisp: TClientDataSet
    Aggregates = <>
    FileName = 'C:\WinProject\LevanteDev\Download\ResOrd.XML'
    FieldDefs = <
      item
        Name = 'NUMDOC'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'DATADOC'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'PROGRIGO'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'RAGSOC'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODICEARTICOLO'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCRIZIONE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UM'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'QTA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'PREZZUUNITARIO'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO1'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO2'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'SCONTORIGO3'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'IMPORTORIGO'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'DATACONSEGNA'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'QTAEASA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'GIACENZA'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'RIFERIMENTO'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OPERATORE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CODDESTMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'RAGSOCMERCE1'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'RAGSOCMERCE2'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'INDIRIZZOMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CAPMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOCALITAMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PROVINCIAMERCE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    OnCalcFields = CdsDocDispCalcFields
    Left = 168
    Top = 88
    object IntegerField1: TIntegerField
      FieldName = 'NUMDOC'
    end
    object DateField1: TDateField
      FieldName = 'DATADOC'
    end
    object IntegerField2: TIntegerField
      FieldName = 'PROGRIGO'
    end
    object StringField1: TStringField
      FieldName = 'RAGSOC'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'CODICEARTICOLO'
      Size = 25
    end
    object StringField3: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'UM'
      Size = 2
    end
    object FloatField1: TFloatField
      FieldName = 'QTA'
    end
    object FloatField2: TFloatField
      FieldName = 'PREZZUUNITARIO'
    end
    object FloatField3: TFloatField
      FieldName = 'SCONTORIGO1'
    end
    object FloatField4: TFloatField
      FieldName = 'SCONTORIGO2'
    end
    object FloatField5: TFloatField
      FieldName = 'SCONTORIGO3'
    end
    object FloatField6: TFloatField
      FieldName = 'IMPORTORIGO'
    end
    object DateField2: TDateField
      FieldName = 'DATACONSEGNA'
    end
    object FloatField7: TFloatField
      FieldName = 'QTAEASA'
    end
    object FloatField8: TFloatField
      FieldName = 'GIACENZA'
    end
    object StringField5: TStringField
      FieldName = 'RIFERIMENTO'
      Size = 40
    end
    object StringField6: TStringField
      FieldName = 'OPERATORE'
      Size = 40
    end
    object StringField7: TStringField
      FieldName = 'CODDESTMERCE'
      Size = 25
    end
    object StringField8: TStringField
      FieldName = 'RAGSOCMERCE1'
      Size = 40
    end
    object StringField9: TStringField
      FieldName = 'RAGSOCMERCE2'
      Size = 40
    end
    object StringField10: TStringField
      FieldName = 'INDIRIZZOMERCE'
      Size = 40
    end
    object StringField11: TStringField
      FieldName = 'CAPMERCE'
      Size = 10
    end
    object StringField12: TStringField
      FieldName = 'LOCALITAMERCE'
      Size = 40
    end
    object StringField13: TStringField
      FieldName = 'PROVINCIAMERCE'
      Size = 5
    end
    object FloatField9: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RESIDUO'
      Calculated = True
    end
    object BooleanField1: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'DISPONIBILE'
      Calculated = True
    end
  end
  object dxPrinter: TdxComponentPrinter
    CurrentLink = GridResOrdLink
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.Caption = 'Anteprima di Stampa'
    PreviewOptions.WindowState = wsMaximized
    Version = 0
    OnCustomDrawPageFooter = dxPrinterCustomDrawPageFooter
    OnCustomDrawPageHeader = dxPrinterCustomDrawPageHeader
    Left = 400
    Top = 120
    PixelsPerInch = 96
    object GridResOrdLink: TdxGridReportLink
      Active = True
      Component = GridResOrd
      DateFormat = 0
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 5000
      PrinterPage.GrayShading = True
      PrinterPage.Header = 5000
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clBlue
      PrinterPage.PageFooter.Font.Height = -8
      PrinterPage.PageFooter.Font.Name = 'Arial'
      PrinterPage.PageFooter.Font.Style = [fsItalic]
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlue
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Arial'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Giornale di Cantiere'
      ReportDocument.CreationDate = 44263.738936388890000000
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -13
      ReportTitle.Font.Name = 'Arial'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Mode = tmNone
      ReportTitle.Text = 'Residuo Ordini'
      TimeFormat = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsFormatting.GridLineColor = clNone
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      SupportedCustomDraw = True
      OnCustomDrawBandCell = GridResOrdLinkCustomDrawBandCell
      OnCustomDrawCell = GridResOrdLinkCustomDrawCell
      OnCustomDrawHeaderCell = GridResOrdLinkCustomDrawHeaderCell
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 377
    Top = 216
    object Scaricalultimoaggiornamentodelresiduoordini1: TMenuItem
      Caption = 'Scarica l'#39'ultimo aggiornamento del residuo ordini'
      OnClick = Scaricalultimoaggiornamentodelresiduoordini1Click
    end
  end
end
