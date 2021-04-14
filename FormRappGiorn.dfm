inherited RappGiornForm: TRappGiornForm
  Left = 3
  Top = 2
  Caption = 'RappGiornForm'
  ClientHeight = 660
  ClientWidth = 762
  ExplicitWidth = 762
  ExplicitHeight = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    Color = clSilver
    ParentBackground = False
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedModifica: TSpeedButton
      OnClick = RxSpeedModificaClick
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Width = 53
      OnClick = RxSpeedButtonEliminaClick
      ExplicitWidth = 53
    end
  end
  inherited ClientArea: TScrollBox
    Height = 501
    ExplicitHeight = 501
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 200
      Width = 681
      Height = 231
      Cursor = crHandPoint
      Align = alClient
      Color = 15329769
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabDipendenti
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 9
      Properties.TabSlants.Positions = [spLeft, spRight]
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 231
      ClientRectRight = 681
      ClientRectTop = 19
      object TabDipendenti: TcxTabSheet
        Caption = ' Manodopera '
        ImageIndex = 0
        object PanelCorpoDoc: TPanel
          Left = 0
          Top = 0
          Width = 681
          Height = 212
          Align = alClient
          BevelOuter = bvNone
          Color = 15329769
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object GridOre: TcxGrid
            Left = 0
            Top = 0
            Width = 681
            Height = 212
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            PopupMenu = MenuElenchi
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clBlue
            RootLevelOptions.DetailFrameWidth = 1
            object tvOre: TcxGridTableView
              OnDblClick = tvOreDblClick
              OnKeyDown = tvOreKeyDown
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawPartBackground = tvOreCustomDrawPartBackground
              OnEditKeyDown = tvOreEditKeyDown
              OnEditValueChanged = tvOreEditValueChanged
              OnFocusedRecordChanged = tvOreFocusedRecordChanged
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Position = spFooter
                  Column = tvOreQTA
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = tvOreIMPORTOCOSTOORARIO
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = tvOreIMPORTOVEND
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Column = tvOreQTA
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOCOSTOORARIO
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOVEND
                end
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Column = tvOreQTASTRAORDINARIO
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOSTRAORDINARIO
                end
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Column = tvOreQTAPERMESSI
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOPERMESSI
                end
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Column = tvOreQTAFERIE
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOFERIE
                end
                item
                  Format = '#,0.#'
                  Kind = skSum
                  Column = tvOreQTATRASFERTE
                end
                item
                  Format = '#,0.00'
                  Kind = skSum
                  Column = tvOreIMPORTOTRASFERTE
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.CellAutoHeight = True
              OptionsView.Footer = True
              OptionsView.FooterAutoHeight = True
              OptionsView.GridLines = glVertical
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              Styles.StyleSheet = DM1.MasterTableViewStyleSheet
              OnCustomDrawColumnHeader = tvOreCustomDrawColumnHeader
              OnCustomDrawGroupCell = tvOreCustomDrawGroupCell
              object tvOreCODDIPENDENTE: TcxGridColumn
                Caption = 'Cod. dip.'
                DataBinding.ValueType = 'LargeInt'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object tvOreDESCRIZDIPENDENTE: TcxGridColumn
                Caption = 'Dipendente'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = tvOreDESCRIZDIPENDENTEPropertiesButtonClick
                HeaderAlignmentHorz = taCenter
                Width = 150
              end
              object tvOreCODCANTIERE: TcxGridColumn
                Caption = 'Cod. cant.'
                DataBinding.ValueType = 'LargeInt'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
              end
              object tvOreDATACANTIERE: TcxGridColumn
                Caption = 'Data cant.'
                DataBinding.ValueType = 'DateTime'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
              end
              object tvOreDESCRIZCANTIERE: TcxGridColumn
                Caption = 'Cantiere'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = tvOreDESCRIZCANTIEREPropertiesButtonClick
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 150
              end
              object tvOreDESCRIZSOGGETTO: TcxGridColumn
                Caption = 'Soggetto'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = tvOreDESCRIZSOGGETTOPropertiesButtonClick
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 150
              end
              object tvOreCOSTOORARIO: TcxGridColumn
                Caption = 'Costo ora'
                DataBinding.ValueType = 'Currency'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreQTA: TcxGridColumn
                Caption = 'Ore'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DecimalPlaces = 6
                Properties.DisplayFormat = '0.######;-0.######'
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 40
              end
              object tvOreIMPORTOCOSTOORARIO: TcxGridColumn
                Caption = 'Importo'
                DataBinding.ValueType = 'Currency'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Properties.ReadOnly = True
                Visible = False
                FooterAlignmentHorz = taRightJustify
                HeaderAlignmentHorz = taCenter
                Width = 79
              end
              object tvOreCODSOGGETTO: TcxGridColumn
                Caption = 'Cod. sogg.'
                DataBinding.ValueType = 'LargeInt'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
              end
              object tvOreNOTE: TcxGridColumn
                Caption = 'Note'
                PropertiesClassName = 'TcxMemoProperties'
                Properties.WantReturns = False
                HeaderAlignmentHorz = taCenter
                Width = 300
              end
              object tvOreTIPOORE1: TcxGridColumn
                Caption = 'Tipo ore 1'
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
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = STipoOre1
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPOORE2: TcxGridColumn
                Caption = 'Tipo ore 2'
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
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = STipoOre2
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPOORE3: TcxGridColumn
                Caption = 'Tipo ore 3'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.DropDownAutoSize = True
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'DESCRIZIONE'
                Properties.ListColumns = <
                  item
                    Caption = 'Descrizione'
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    FieldName = 'DESCRIZIONE'
                  end>
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = STipoOre3
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO1: TcxGridColumn
                Caption = 'Tipo 1'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO2: TcxGridColumn
                Caption = 'Tipo 2'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO3: TcxGridColumn
                Caption = 'Tipo 3'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO4: TcxGridColumn
                Caption = 'Tipo 4'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO5: TcxGridColumn
                Caption = 'Tipo 5'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreTIPO6: TcxGridColumn
                Caption = 'Tipo 6'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.Sorted = True
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOrePRZVEND: TcxGridColumn
                Caption = 'Prz. vend.'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                Width = 55
              end
              object tvOreIMPORTOVEND: TcxGridColumn
                Caption = 'Importo vend.'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Properties.ReadOnly = True
                Visible = False
                FooterAlignmentHorz = taRightJustify
                Width = 65
              end
              object tvOreCOSTOSTRAORDINARIO: TcxGridColumn
                Caption = 'Costo ora str.'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreQTASTRAORDINARIO: TcxGridColumn
                Caption = 'Ore str.'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '0.######;-0.######'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreIMPORTOSTRAORDINARIO: TcxGridColumn
                Caption = 'Importo str.'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreCOSTOPERMESSI: TcxGridColumn
                Caption = 'Costo ora permessi'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreQTAPERMESSI: TcxGridColumn
                Caption = 'Qta permessi'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '0.######;-0.######'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreIMPORTOPERMESSI: TcxGridColumn
                Caption = 'Importo permessi'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreCOSTOFERIE: TcxGridColumn
                Caption = 'Costo ora ferie'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreQTAFERIE: TcxGridColumn
                Caption = 'QtaFerie'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '0.######;-0.######'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreIMPORTOFERIE: TcxGridColumn
                Caption = 'Importo ferie'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreCOSTOTRASFERTE: TcxGridColumn
                Caption = 'Costo ora trasferte'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreQTATRASFERTE: TcxGridColumn
                Caption = 'Qta trasferte'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '0.######;-0.######'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreIMPORTOTRASFERTE: TcxGridColumn
                Caption = 'Importo trasferte'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 75
              end
              object tvOreOREBASE: TcxGridColumn
                Caption = 'Ore base'
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '0.######;-0.######'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 55
              end
              object tvOreSOTTOCANTIERE1: TcxGridColumn
                Caption = 'Sottocantiere 1'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.Sorted = True
                Properties.OnInitPopup = tvOreSOTTOCANTIERE1PropertiesInitPopup
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreSOTTOCANTIERE2: TcxGridColumn
                Caption = 'Sottocantiere 2'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.Sorted = True
                Properties.OnInitPopup = tvOreSOTTOCANTIERE2PropertiesInitPopup
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreSOTTOCANTIERE3: TcxGridColumn
                Caption = 'Sottocantiere 3'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.Sorted = True
                Properties.OnInitPopup = tvOreSOTTOCANTIERE3PropertiesInitPopup
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object tvOreOPERAINDEX: TcxGridColumn
                Caption = 'Cetegoria manodopera'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.ReadOnly = True
                OnGetDisplayText = tvOreOPERAINDEXGetDisplayText
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
                Properties.DisplayFormat = ' ,0.00;- ,0.00'
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 70
              end
              object tvOreGC_RICARICO_MOD: TcxGridColumn
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
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                RepositoryItem = DM1.EdPropQta
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
              end
              object tvOreGC_QTA_MOD: TcxGridColumn
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
                DataBinding.ValueType = 'Float'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                RepositoryItem = DM1.EdPropQta
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
              end
              object tvOreGC_DESCRIZIONE_MOD: TcxGridColumn
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
            object lvOre: TcxGridLevel
              GridView = tvOre
            end
          end
        end
      end
      object TabAltriCosti: TcxTabSheet
        Caption = 'Altri costi '
        ImageIndex = 1
        object GridSpese: TcxGrid
          Left = 0
          Top = 0
          Width = 681
          Height = 212
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          PopupMenu = MenuElenchi
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          RootLevelOptions.DetailFrameColor = clBlue
          RootLevelOptions.DetailFrameWidth = 1
          object tvSpese: TcxGridTableView
            OnDblClick = tvSpeseDblClick
            OnKeyDown = tvSpeseKeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCustomDrawPartBackground = tvOreCustomDrawPartBackground
            OnEditKeyDown = tvOreEditKeyDown
            OnFocusedRecordChanged = tvSpeseFocusedRecordChanged
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '#,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvSpeseIMPORTO
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,0.00'
                Kind = skSum
                Column = tvSpeseIMPORTO
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.CellAutoHeight = True
            OptionsView.Footer = True
            OptionsView.FooterAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvOreCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvOreCustomDrawGroupCell
            object tvSpeseCODAUTOMEZZO: TcxGridColumn
              Caption = 'Cod. autom.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 75
            end
            object tvSpeseDESCRIZDIPENDENTE: TcxGridColumn
              Caption = 'Dipendente'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = tvSpeseDESCRIZDIPENDENTEPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              Width = 138
            end
            object tvSpeseCODDIPENDENTE: TcxGridColumn
              Caption = 'Cod. dip.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ReadOnly = True
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 60
            end
            object tvSpeseCODCANTIERE: TcxGridColumn
              Caption = 'Cod. cant.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ReadOnly = True
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 60
            end
            object tvSpeseDATACANTIERE: TcxGridColumn
              Caption = 'Data cant.'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvSpeseDESCRIZCANTIERE: TcxGridColumn
              Caption = 'Cantiere'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = tvSpeseDESCRIZCANTIEREPropertiesButtonClick
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 150
            end
            object tvSpeseCODSOGGETTO: TcxGridColumn
              Caption = 'Cod. sogg.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ReadOnly = True
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 60
            end
            object tvSpeseDESCRIZSOGGETTO: TcxGridColumn
              Caption = 'Soggetto'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = tvSpeseDESCRIZSOGGETTOPropertiesButtonClick
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 150
            end
            object tvSpeseDESCRIZAUTOMEZZO: TcxGridColumn
              Caption = 'Automezzo'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = tvSpeseDESCRIZAUTOMEZZOPropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              Width = 132
            end
            object tvSpeseKM: TcxGridColumn
              Caption = 'KM'
              DataBinding.ValueType = 'Integer'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 31
            end
            object tvSpeseIMPORTO: TcxGridColumn
              Caption = 'Importo'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;,0.00'
              HeaderAlignmentHorz = taCenter
              Width = 55
            end
            object tvSpeseNOTE: TcxGridColumn
              Caption = 'Note'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.WantReturns = False
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object tvSpeseTIPOSPESA1: TcxGridColumn
              Caption = 'Tipo spesa 1'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'DESCRIZIONE'
              Properties.ListColumns = <
                item
                  Caption = 'Desctizione'
                  FieldName = 'DESCRIZIONE'
                end>
              Properties.ListOptions.CaseInsensitive = True
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = STipoSpese1
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPOSPESA2: TcxGridColumn
              Caption = 'Tipo spesa 2'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'DESCRIZIONE'
              Properties.ListColumns = <
                item
                  Caption = 'Descrizione'
                  FieldName = 'DESCRIZIONE'
                end>
              Properties.ListOptions.CaseInsensitive = True
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = STipoSpese2
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPOSPESA3: TcxGridColumn
              Caption = 'Tipo spesa 3'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownAutoSize = True
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'DESCRIZIONE'
              Properties.ListColumns = <
                item
                  Caption = 'Descrizione'
                  FieldName = 'DESCRIZIONE'
                end>
              Properties.ListOptions.CaseInsensitive = True
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = STipoSpese3
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO1: TcxGridColumn
              Caption = 'Tipo 1'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO2: TcxGridColumn
              Caption = 'Tipo 2'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO3: TcxGridColumn
              Caption = 'Tipo 3'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO4: TcxGridColumn
              Caption = 'Tipo 4'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO5: TcxGridColumn
              Caption = 'Tipo 5'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseTIPO6: TcxGridColumn
              Caption = 'Tipo 6'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.Sorted = True
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseSOTTOCANTIERE1: TcxGridColumn
              Caption = 'Sottocantiere 1'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.Sorted = True
              Properties.OnInitPopup = tvSpeseSOTTOCANTIERE1PropertiesInitPopup
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseSOTTOCANTIERE2: TcxGridColumn
              Caption = 'Sottocantiere 2'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.Sorted = True
              Properties.OnInitPopup = tvSpeseSOTTOCANTIERE2PropertiesInitPopup
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseSOTTOCANTIERE3: TcxGridColumn
              Caption = 'Sottocantiere 3'
              PropertiesClassName = 'TcxComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.Sorted = True
              Properties.OnInitPopup = tvSpeseSOTTOCANTIERE3PropertiesInitPopup
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSpeseGC_COSTONETTOUNITARIO_MOD: TcxGridColumn
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
            object tvSpeseGC_COSTONETTOUNITARIO: TcxGridColumn
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ' ,0.00;- ,0.00'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 70
            end
            object tvSpeseGC_RICARICO_MOD: TcxGridColumn
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
            object tvSpeseGC_RICARICO: TcxGridColumn
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              RepositoryItem = DM1.EdPropQta
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 40
            end
            object tvSpeseGC_QTA_MOD: TcxGridColumn
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
            object tvSpeseGC_QTA: TcxGridColumn
              DataBinding.ValueType = 'Float'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              RepositoryItem = DM1.EdPropQta
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 40
            end
            object tvSpeseGC_DESCRIZIONE_MOD: TcxGridColumn
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
            object tvSpeseGC_DESCRIZIONE: TcxGridColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.MaxLength = 1000
              Properties.WantReturns = False
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 290
            end
            object tvSpeseGUID: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 100
            end
            object tvSpeseGUID_REF: TcxGridColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 100
            end
            object tvSpeseGUID_ANCESTOR: TcxGridColumn
              Caption = 'Anc. GUID'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 100
            end
          end
          object lvSpese: TcxGridLevel
            GridView = tvSpese
          end
        end
      end
    end
    object PanelNumDataDocumento: TPanel
      Left = 0
      Top = 65
      Width = 681
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object PanelDestinatario: TPanel
        Left = 336
        Top = 0
        Width = 345
        Height = 89
        BevelOuter = bvNone
        Color = 15329769
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 1
        object Label27: TLabel
          Tag = -1
          Left = 6
          Top = 70
          Width = 35
          Height = 13
          AutoSize = False
          Caption = 'P.IVA:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object MittenteDestinatario: TLabel
          Left = 0
          Top = 0
          Width = 345
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' SOGGETTO'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object BitBtnCliente: TSpeedButtonRollOver
          Left = 321
          Top = 1
          Width = 14
          Height = 14
          Cursor = crHandPoint
          Enabled = False
          Glyph.Data = {
            860F0000424D860F0000000000003600000028000000460000000E0000000100
            200000000000500F000000000000000000000000000000000000E9E9E900E9E9
            E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
            CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
            E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
            BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
            AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
            D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
            B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
            D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
            E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
            E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
            F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
            E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
            BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
            B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
            D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
            EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
            E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
            EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
            D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
            FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
            DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
            B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
            FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
            E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
            F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
            D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
            EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
            FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
            DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
            FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
            E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
            FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
            BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
            F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
            EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
            EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
            D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
            FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
            C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
            FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
            FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
            F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
            ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
            D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
            FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
            E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
            FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
            FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
            FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
            F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
            AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
            E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
            F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
            FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
            FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
            FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
            FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
            AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
            F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
            EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
            EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
            FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
            FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
            FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
            AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
            FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
            DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
            FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
            EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
            EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
            FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
            BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
            E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
            FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
            F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
            EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
            E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
            FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
            BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
            FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
            FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
            FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
            FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
            E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
            F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
            B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
            FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
            DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
            E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
            E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
            F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
            E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
            B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
            E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
            D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
            E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
            E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
            E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
            FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
            D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
            AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
            D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900}
          OnClick = BitBtnClienteClick
        end
        object BitBtnEspandiCliente: TSpeedButtonRollOver
          Left = 304
          Top = 1
          Width = 14
          Height = 14
          Cursor = crHandPoint
          Glyph.Data = {
            860F0000424D860F0000000000003600000028000000460000000E0000000100
            200000000000500F000000000000000000000000000000000000E9E9E900E9E9
            E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
            CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
            E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
            BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
            AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
            D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
            B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
            D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
            E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
            E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
            F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
            E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
            BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
            B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
            D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
            EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
            E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
            EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
            D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
            FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
            DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
            B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
            FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
            E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
            F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
            D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
            EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
            FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
            DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
            FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
            E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
            FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
            BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
            5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
            EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
            EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
            6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
            D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
            6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
            C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
            5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
            F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
            F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
            EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
            D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
            FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
            E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
            6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
            FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
            FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
            E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
            AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
            EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
            F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
            6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
            FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
            FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
            EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
            AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
            E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
            EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
            E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
            FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
            FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
            DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
            AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
            EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
            DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
            5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
            EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
            EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
            6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
            BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
            6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
            E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
            5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
            FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
            F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
            DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
            E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
            4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
            BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
            4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
            FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
            FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
            FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
            E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
            F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
            B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
            FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
            DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
            E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
            E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
            F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
            E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
            B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
            E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
            D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
            E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
            E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
            E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
            FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
            D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
            AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
            D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900}
          OnClick = BitBtnEspandiClienteClick
        end
        object DBText1: TDBText
          Left = 6
          Top = 17
          Width = 36
          Height = 14
          Alignment = taCenter
          DataField = 'CODICECLIENTE'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = 10395294
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Tag = -1
          Left = 171
          Top = 70
          Width = 24
          Height = 13
          AutoSize = False
          Caption = 'C.F.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBERagSocCli: TDBEdit
          Left = 44
          Top = 17
          Width = 291
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'RAGSOCCLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 6
          Top = 38
          Width = 277
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'INDIRIZZOCLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 6
          Top = 54
          Width = 41
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'CAPCli'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 49
          Top = 54
          Width = 254
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'CITTACLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 305
          Top = 54
          Width = 30
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'PROVINCIACLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit46: TDBEdit
          Left = 41
          Top = 70
          Width = 110
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'PARTITAIVACLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 193
          Top = 70
          Width = 142
          Height = 13
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'CODICEFISCALECLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit8: TDBEdit
          Left = 285
          Top = 38
          Width = 50
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'NUMCIVICOCLI'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object PanelOpzioni: TPanel
        Left = 0
        Top = 0
        Width = 330
        Height = 37
        BevelOuter = bvNone
        Color = 15329769
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object Label7: TLabel
          Left = 0
          Top = 0
          Width = 330
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' OPZIONI'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object BitBtnSelezioneStato: TSpeedButtonRollOver
          Left = 123
          Top = 17
          Width = 14
          Height = 14
          Cursor = crHandPoint
          Enabled = False
          Glyph.Data = {
            860F0000424D860F0000000000003600000028000000460000000E0000000100
            200000000000500F000000000000000000000000000000000000E9E9E900E9E9
            E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
            CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
            E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
            BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
            AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
            D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
            B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
            D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
            E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
            E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
            F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
            E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
            BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
            B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
            D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
            EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
            E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
            EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
            D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
            FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
            DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
            B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
            FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
            E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
            F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
            D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
            EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
            FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
            DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
            FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
            E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
            FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
            BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
            F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
            EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
            EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
            D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
            FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
            C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
            FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
            FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
            F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
            ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
            D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
            FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
            E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
            FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
            FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
            FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
            F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
            AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
            E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
            F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
            FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
            FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
            FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
            FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
            AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
            F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
            EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
            EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
            FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
            FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
            FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
            AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
            FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
            DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
            FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
            EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
            EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
            FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
            BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
            E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
            FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
            FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
            F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
            EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
            E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
            FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
            BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
            FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
            FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
            FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
            FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
            E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
            F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
            B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
            FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
            DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
            FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
            E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
            E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
            F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
            E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
            B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
            E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
            D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
            E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
            E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
            E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
            FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
            E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
            BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
            D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
            E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
            AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
            E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
            D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
            E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
            E900E9E9E900E9E9E900}
          OnClick = BitBtnSelezioneStatoClick
        end
        object LabelStatoDocumento: TLabel
          Left = 6
          Top = 16
          Width = 31
          Height = 14
          AutoSize = False
          Caption = ' Stato '
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object DBEditStatoDocumento: TDBEdit
          Left = 40
          Top = 17
          Width = 80
          Height = 14
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'STATODESCRIZIONE'
          DataSource = SourceRG
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopupMenuAzzeramentoStato
          ReadOnly = True
          TabOrder = 0
          OnKeyUp = DBEditStatoDocumentoKeyUp
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 681
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 457
        Height = 55
        Brush.Color = 13822463
        Pen.Color = 427007
      end
      object Label1: TLabel
        Left = 335
        Top = 18
        Width = 29
        Height = 15
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 457
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documento'
        Color = 427007
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object Label3: TLabel
        Left = 162
        Top = 18
        Width = 51
        Height = 15
        AutoSize = False
        Caption = 'N'#176' / Reg.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LabelCantiere: TLabel
        Left = 3
        Top = 37
        Width = 92
        Height = 12
        Caption = 'Cantiere/Impianto'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object BitBtnPratica1: TSpeedButtonRollOver
        Left = 439
        Top = 38
        Width = 14
        Height = 14
        Cursor = crHandPoint
        Enabled = False
        Glyph.Data = {
          CE0B0000424DCE0B0000000000003600000028000000460000000E0000000100
          180000000000980B0000120B0000120B00000000000000000000E9E9E9E9E9E9
          E9E9E9E3E5E6BDC9CCA5B5B999A9AD99A9ADA5B5B9BDC9CCE4E5E6E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E7E8E8D9DEDFD1D7D8CDD3D4CDD3D4D1D7D8DA
          DEDFE7E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E6E6E7C7CED0ACB8BC
          9AA9AD9AA9ADACB8BCC7CED0E6E7E7E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0DDDDE7E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0
          DDDDE7E9E9E9E9E9E9E9E9E90000E9E9E9E9E9E9C8D1D39EADB1A5B5B8BFCFD2
          D2E2E5CFDFE2BCCBCFA7B6BA9EADB1C8D1D3E9E9E9E9E9E9E9E9E9E9E9E9DDE1
          E1CFD4D5D1D7D8DAE0E1E1E7E8E0E6E7D9DFE0D2D7D9CFD4D5DDE1E1E9E9E9E9
          E9E9E9E9E9E9E9E9CFD4D7A0AEB2ABB7BCD1D7DCECEEF5E8EBF1CCD3D8ADB9BE
          A0AEB2CFD4D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795A3B28E9ABC787FDC686A
          F56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795
          A3B28E9ABC787FDC686AF56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9
          0000E9E9E9C9D2D49EADB1C4D2D6DCEAEDDEECEFDEECEFDEECEFDEECEFDBE9EC
          C0CED29DACB0C9D2D4E9E9E9E9E9E9DEE1E2CFD4D5DCE1E2E4E9EAE5EAEBE5EA
          EBE5EAEBE5EAEBE4E9EADBE0E1CED4D5DEE1E2E9E9E9E9E9E9CCD1D89FADB2CB
          D1DFE8E8FDEAEAFFEAEAFFEAEAFFEAEAFFE7E7FCC6CDDB9EACB1CCD1D8E9E9E9
          E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF7171FF7171FF7373FC8389
          DB96A5B1AFB4D8E9E9E9E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF71
          71FF7171FF7373FC8389DB96A5B1AFB4D8E9E9E90000E4E5E69FADB1C6D4D7E1
          EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1C3D1D49EADB1E4E5E6
          E7E8E8CFD4D5DDE2E3E6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EB
          ECDCE1E2CFD4D5E7E8E8E4E5E79EACB3C4C9E0DDDDFFDDDDFFDDDDFFDDDDFFDD
          DDFFDDDDFFDDDDFFDDDDFFC0C7DC9EACB2E4E5E7DFDFE797A5B38A90E08181FF
          8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B91DC97A5B2DFDFE7DFDF
          E797A5B38A90E08181FF8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B
          91DC97A5B2DFDFE70000C1CACDABBABDE3EEF0E5F0F2E5F0F2E5F0F2E5F0F2E5
          F0F2E5F0F2E5F0F2E5F0F2E2EDF0A7B5B9C1CACDDBDEDFD3D9DAE7EBEBE8EBEC
          E8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE7EAEBD2D7D8DBDEDFBCC2
          D0A6B2C0CFCFFDD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFCE
          CFFCA3AFBBBBC2D0ABB3D097A2C09091FD9090FF9090FF9090FF9090FF9090FF
          9090FF9090FF9090FF9091FC97A4BBABB2D0ABB3D097A2C09091FD9090FF9090
          FF9090FF9090FF9090FF9090FF9090FF9090FF9091FC97A4BBABB2D00000A8B6
          BACBD6D9E9F2F42122FD2122FDE9F2F40000FF0000FFE9F2F40000FF0000FFE9
          F2F4C5D0D3A8B6BAD2D7D8DFE2E3E9ECEDE0E3E4E0E3E4E9ECEDDEE1E2DEE1E2
          E9ECEDDEE1E2DEE1E2E9ECEDDCE0E1D2D7D8A3AEBCB3B8E0C2C2FF1B1BFF1B1B
          FFC2C2FF0000FF0000FFC2C2FF0000FF0000FFC2C2FFAFB6D9A3AEBC9DA9BC9E
          A4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1FF0000FF0000FFA1A1FF
          9DA4D99DA9BC9DA9BC9EA4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1
          FF0000FF0000FFA1A1FF9DA4D99DA9BC000099A8ACE4EDEFECF5F62123FE2123
          FEECF5F60000FF0000FFECF5F60000FF0000FFECF5F6E2ECED99A8ACCDD2D4E7
          EAEBEAEDEEE1E4E4E1E4E4EAEDEEDFE2E3DFE2E3EAEDEEDFE2E3DFE2E3EAEDEE
          E7EAEACDD2D499A8ACB1B3F7B4B4FF1919FF1919FFB4B4FF0000FF0000FFB4B4
          FF0000FF0000FFB4B4FFB1B3F599A8AC99A8ACAEAFF7B0B0FF1919FF1919FFB0
          B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAFF599A8AC99A8ACAEAFF7
          B0B0FF1919FF1919FFB0B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAF
          F599A8AC000099A8ACEBF2F3F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7
          F8F0F7F8F0F7F8F0F7F8E4ECEE99A8ACCDD2D4EAECECEBEEEEEBEEEEEBEEEEEB
          EEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEE7EAEBCDD2D499A8ACA6A7FA
          A7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA5A7
          F499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
          C0FFC0C0FFC0C0FFBBBDF499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FF
          C0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFBBBDF499A8AC0000AAB7BBD2DBDD
          F4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FACDD7
          D9AAB7BBD3D7D9E1E4E5EDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFED
          EFEFEDEFEFEDEFEFDFE3E3D3D7D99CA8BC999FE09999FF9999FF9999FF9999FF
          9999FF9999FF9999FF9999FF9999FF9999FF999FDC9CA8BCA5B1BCBCC1E0D0D0
          FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFB9BFDCA5
          B1BCA5B1BCBCC1E0D0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FF
          D0D0FFD0D0FFB9BFDCA5B1BC0000C5CDD0AFBBBEF6F9F9F8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF5F8F9AEBABDC5CDD0DCDFE0D5D9DAEEEF
          EFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEDEEEFD4D9DADC
          DFE0AAB2D096A2BF8C8DFD8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF
          8C8CFF8C8DFC96A2BEAAB2D0BFC7D0A9B5BFDEDFFDE0E0FFE0E0FFE0E0FFE0E0
          FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0BFC7D0A9B5BFDEDFFDE0
          E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0
          0000E5E6E6A0AEB2DAE0E2FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
          FBFDFDD4DBDDA0AEB2E5E6E6E8E8E8D0D4D6E4E6E7EFF0F0EFF0F0EFF0F0EFF0
          F0EFF0F0EFF0F0EFF0F0EFF0F0E2E4E5D0D4D6E8E8E8DEDFE697A5B2878CE37E
          7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF898FDE97A5B2DEDFE6
          E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEF
          FFCDD3DE9FADB2E4E5E6E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEF
          EFFFEFEFFFEFEFFFEFEFFFCDD3DE9FADB2E4E5E60000E9E9E9D1D6D7A3B1B4DD
          E2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9
          E9E9E9E1E2E3D1D5D6E5E7E7F0F0F0F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0E4E6
          E6D0D4D6E1E2E3E9E9E9E9E9E9AFB5D795A2B47E83E47272FE7171FF7171FF71
          71FF7171FF7272FD7F85E196A4B2AFB5D7E9E9E9E9E9E9D1D6D7A3B1B4DDE2E4
          FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9E9E9
          E9D1D6D7A3B1B4DDE2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0
          AEB2D1D6D7E9E9E90000E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9
          FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9E1E2E3D0D5D6
          D7DBDCE5E7E7EEEFEFEFEFEFE3E6E6D5D9DAD0D4D6E1E2E3E9E9E9E9E9E9E9E9
          E9E9E9E9AFB5D796A4B38E99C37E83E47475F97474FA8085E0909BBF96A4B2AF
          B5D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9FAFA
          D9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0
          C3DDE2E4F7F9F9F9FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E90000E9E9
          E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E8E8E8DDE0E0D4D8D9CDD2D4CDD2D4
          D4D8D9DDE0E0E8E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DDDEE6A3AA
          D095A2BC99A8AC99A8AC95A2BCA3AAD0DDDEE6E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8
          BCC7CED0E5E6E6E9E9E9E9E9E9E9E9E90000}
        Margin = 6
        OnClick = BitBtnPratica1Click
      end
      object ShapeAzioni: TShape
        Left = 463
        Top = 0
        Width = 158
        Height = 55
        Brush.Color = 13822463
        Pen.Color = 427007
      end
      object LabelAzioni: TLabel
        Left = 463
        Top = 0
        Width = 158
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Azioni'
        Color = 427007
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object LabelAzioneMagazzino: TLabel
        Left = 468
        Top = 18
        Width = 52
        Height = 12
        Caption = 'Magazzino'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object LabelAzioneCantiere: TLabel
        Left = 468
        Top = 37
        Width = 43
        Height = 12
        Caption = 'Cantiere'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 3
        Top = 18
        Width = 135
        Height = 13
        Caption = 'Rapporto giornaliero'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBEditNumDoc: TcxDBTextEdit
        Left = 210
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'NUMDOC'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 0
        Height = 20
        Width = 60
      end
      object DBComboRegistro: TcxDBComboBox
        Left = 268
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'REGISTRO'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnInitPopup = cxDBComboBox1PropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 1
        Height = 20
        Width = 63
      end
      object DBEDataDoc: TcxDBDateEdit
        Left = 363
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'DATADOC'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 2
        Height = 20
        Width = 92
      end
      object DbeDescrizioneCantiere: TcxTextEdit
        Left = 100
        Top = 34
        AutoSize = False
        ParentFont = False
        PopupMenu = PopupMenuAzzeraCantiereImpianto
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 3
        Text = '- - -'
        OnKeyPress = DbeDescrizioneCantiereKeyPress
        Height = 19
        Width = 339
      end
      object DbeAzioneMagazzino: TcxComboBox
        Left = 524
        Top = 15
        AutoSize = False
        Enabled = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '- - -'
          'Carico'
          'Impegna'
          'Ordina'
          'Scarico')
        Properties.Sorted = True
        Style.BorderColor = 8963327
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = 8963327
        StyleDisabled.Color = 16250871
        StyleDisabled.TextColor = clWindowText
        TabOrder = 4
        Text = '- - -'
        Visible = False
        Height = 20
        Width = 88
      end
      object DbeAzioneCantiere: TcxComboBox
        Left = 524
        Top = 34
        AutoSize = False
        Enabled = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '- - -'
          'Carico'
          'Commessa'
          'Fattura'
          'Montaggio'
          'Scarico')
        Properties.Sorted = True
        Properties.OnChange = DbeAzioneCantierePropertiesChange
        Style.BorderColor = 8963327
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = 8963327
        StyleDisabled.Color = 16250871
        StyleDisabled.TextColor = clWindowText
        TabOrder = 5
        Text = '- - -'
        Height = 20
        Width = 88
      end
      object DBEditSegnoOperazione: TDBEdit
        Tag = -1
        Left = 611
        Top = 18
        Width = 9
        Height = 15
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = 13822463
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 427007
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Visible = False
      end
      object DBEditSegnoOperazioneCantiere: TDBEdit
        Tag = -1
        Left = 611
        Top = 37
        Width = 9
        Height = 15
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = 13822463
        Ctl3D = False
        DataField = 'SEGNOOPERAZIONECANTIERE'
        DataSource = SourceRG
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 427007
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object PanelPratiche: TPanel
      Left = 0
      Top = 431
      Width = 681
      Height = 70
      Align = alBottom
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label5: TLabel
        Left = 24
        Top = 17
        Width = 17
        Height = 14
        AutoSize = False
        Caption = '1)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 24
        Top = 34
        Width = 17
        Height = 14
        AutoSize = False
        Caption = '2)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 24
        Top = 51
        Width = 17
        Height = 14
        AutoSize = False
        Caption = '3)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPanelPraticheCaption: TLabel
        Left = 0
        Top = 0
        Width = 681
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' PRATICHE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object BitBtnPratica2: TSpeedButtonRollOver
        Left = 6
        Top = 34
        Width = 14
        Height = 14
        Cursor = crHandPoint
        Enabled = False
        Glyph.Data = {
          CE0B0000424DCE0B0000000000003600000028000000460000000E0000000100
          180000000000980B0000120B0000120B00000000000000000000E9E9E9E9E9E9
          E9E9E9E3E5E6BDC9CCA5B5B999A9AD99A9ADA5B5B9BDC9CCE4E5E6E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E7E8E8D9DEDFD1D7D8CDD3D4CDD3D4D1D7D8DA
          DEDFE7E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E6E6E7C7CED0ACB8BC
          9AA9AD9AA9ADACB8BCC7CED0E6E7E7E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0DDDDE7E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0
          DDDDE7E9E9E9E9E9E9E9E9E90000E9E9E9E9E9E9C8D1D39EADB1A5B5B8BFCFD2
          D2E2E5CFDFE2BCCBCFA7B6BA9EADB1C8D1D3E9E9E9E9E9E9E9E9E9E9E9E9DDE1
          E1CFD4D5D1D7D8DAE0E1E1E7E8E0E6E7D9DFE0D2D7D9CFD4D5DDE1E1E9E9E9E9
          E9E9E9E9E9E9E9E9CFD4D7A0AEB2ABB7BCD1D7DCECEEF5E8EBF1CCD3D8ADB9BE
          A0AEB2CFD4D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795A3B28E9ABC787FDC686A
          F56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795
          A3B28E9ABC787FDC686AF56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9
          0000E9E9E9C9D2D49EADB1C4D2D6DCEAEDDEECEFDEECEFDEECEFDEECEFDBE9EC
          C0CED29DACB0C9D2D4E9E9E9E9E9E9DEE1E2CFD4D5DCE1E2E4E9EAE5EAEBE5EA
          EBE5EAEBE5EAEBE4E9EADBE0E1CED4D5DEE1E2E9E9E9E9E9E9CCD1D89FADB2CB
          D1DFE8E8FDEAEAFFEAEAFFEAEAFFEAEAFFE7E7FCC6CDDB9EACB1CCD1D8E9E9E9
          E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF7171FF7171FF7373FC8389
          DB96A5B1AFB4D8E9E9E9E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF71
          71FF7171FF7373FC8389DB96A5B1AFB4D8E9E9E90000E4E5E69FADB1C6D4D7E1
          EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1C3D1D49EADB1E4E5E6
          E7E8E8CFD4D5DDE2E3E6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EB
          ECDCE1E2CFD4D5E7E8E8E4E5E79EACB3C4C9E0DDDDFFDDDDFFDDDDFFDDDDFFDD
          DDFFDDDDFFDDDDFFDDDDFFC0C7DC9EACB2E4E5E7DFDFE797A5B38A90E08181FF
          8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B91DC97A5B2DFDFE7DFDF
          E797A5B38A90E08181FF8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B
          91DC97A5B2DFDFE70000C1CACDABBABDE3EEF0E5F0F2E5F0F2E5F0F2E5F0F2E5
          F0F2E5F0F2E5F0F2E5F0F2E2EDF0A7B5B9C1CACDDBDEDFD3D9DAE7EBEBE8EBEC
          E8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE7EAEBD2D7D8DBDEDFBCC2
          D0A6B2C0CFCFFDD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFCE
          CFFCA3AFBBBBC2D0ABB3D097A2C09091FD9090FF9090FF9090FF9090FF9090FF
          9090FF9090FF9090FF9091FC97A4BBABB2D0ABB3D097A2C09091FD9090FF9090
          FF9090FF9090FF9090FF9090FF9090FF9090FF9091FC97A4BBABB2D00000A8B6
          BACBD6D9E9F2F42122FD2122FDE9F2F40000FF0000FFE9F2F40000FF0000FFE9
          F2F4C5D0D3A8B6BAD2D7D8DFE2E3E9ECEDE0E3E4E0E3E4E9ECEDDEE1E2DEE1E2
          E9ECEDDEE1E2DEE1E2E9ECEDDCE0E1D2D7D8A3AEBCB3B8E0C2C2FF1B1BFF1B1B
          FFC2C2FF0000FF0000FFC2C2FF0000FF0000FFC2C2FFAFB6D9A3AEBC9DA9BC9E
          A4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1FF0000FF0000FFA1A1FF
          9DA4D99DA9BC9DA9BC9EA4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1
          FF0000FF0000FFA1A1FF9DA4D99DA9BC000099A8ACE4EDEFECF5F62123FE2123
          FEECF5F60000FF0000FFECF5F60000FF0000FFECF5F6E2ECED99A8ACCDD2D4E7
          EAEBEAEDEEE1E4E4E1E4E4EAEDEEDFE2E3DFE2E3EAEDEEDFE2E3DFE2E3EAEDEE
          E7EAEACDD2D499A8ACB1B3F7B4B4FF1919FF1919FFB4B4FF0000FF0000FFB4B4
          FF0000FF0000FFB4B4FFB1B3F599A8AC99A8ACAEAFF7B0B0FF1919FF1919FFB0
          B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAFF599A8AC99A8ACAEAFF7
          B0B0FF1919FF1919FFB0B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAF
          F599A8AC000099A8ACEBF2F3F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7
          F8F0F7F8F0F7F8F0F7F8E4ECEE99A8ACCDD2D4EAECECEBEEEEEBEEEEEBEEEEEB
          EEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEE7EAEBCDD2D499A8ACA6A7FA
          A7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA5A7
          F499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
          C0FFC0C0FFC0C0FFBBBDF499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FF
          C0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFBBBDF499A8AC0000AAB7BBD2DBDD
          F4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FACDD7
          D9AAB7BBD3D7D9E1E4E5EDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFED
          EFEFEDEFEFEDEFEFDFE3E3D3D7D99CA8BC999FE09999FF9999FF9999FF9999FF
          9999FF9999FF9999FF9999FF9999FF9999FF999FDC9CA8BCA5B1BCBCC1E0D0D0
          FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFB9BFDCA5
          B1BCA5B1BCBCC1E0D0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FF
          D0D0FFD0D0FFB9BFDCA5B1BC0000C5CDD0AFBBBEF6F9F9F8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF5F8F9AEBABDC5CDD0DCDFE0D5D9DAEEEF
          EFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEDEEEFD4D9DADC
          DFE0AAB2D096A2BF8C8DFD8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF
          8C8CFF8C8DFC96A2BEAAB2D0BFC7D0A9B5BFDEDFFDE0E0FFE0E0FFE0E0FFE0E0
          FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0BFC7D0A9B5BFDEDFFDE0
          E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0
          0000E5E6E6A0AEB2DAE0E2FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
          FBFDFDD4DBDDA0AEB2E5E6E6E8E8E8D0D4D6E4E6E7EFF0F0EFF0F0EFF0F0EFF0
          F0EFF0F0EFF0F0EFF0F0EFF0F0E2E4E5D0D4D6E8E8E8DEDFE697A5B2878CE37E
          7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF898FDE97A5B2DEDFE6
          E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEF
          FFCDD3DE9FADB2E4E5E6E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEF
          EFFFEFEFFFEFEFFFEFEFFFCDD3DE9FADB2E4E5E60000E9E9E9D1D6D7A3B1B4DD
          E2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9
          E9E9E9E1E2E3D1D5D6E5E7E7F0F0F0F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0E4E6
          E6D0D4D6E1E2E3E9E9E9E9E9E9AFB5D795A2B47E83E47272FE7171FF7171FF71
          71FF7171FF7272FD7F85E196A4B2AFB5D7E9E9E9E9E9E9D1D6D7A3B1B4DDE2E4
          FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9E9E9
          E9D1D6D7A3B1B4DDE2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0
          AEB2D1D6D7E9E9E90000E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9
          FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9E1E2E3D0D5D6
          D7DBDCE5E7E7EEEFEFEFEFEFE3E6E6D5D9DAD0D4D6E1E2E3E9E9E9E9E9E9E9E9
          E9E9E9E9AFB5D796A4B38E99C37E83E47475F97474FA8085E0909BBF96A4B2AF
          B5D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9FAFA
          D9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0
          C3DDE2E4F7F9F9F9FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E90000E9E9
          E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E8E8E8DDE0E0D4D8D9CDD2D4CDD2D4
          D4D8D9DDE0E0E8E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DDDEE6A3AA
          D095A2BC99A8AC99A8AC95A2BCA3AAD0DDDEE6E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8
          BCC7CED0E5E6E6E9E9E9E9E9E9E9E9E90000}
        Margin = 6
      end
      object BitBtnPratica3: TSpeedButtonRollOver
        Left = 6
        Top = 51
        Width = 14
        Height = 14
        Cursor = crHandPoint
        Enabled = False
        Glyph.Data = {
          CE0B0000424DCE0B0000000000003600000028000000460000000E0000000100
          180000000000980B0000120B0000120B00000000000000000000E9E9E9E9E9E9
          E9E9E9E3E5E6BDC9CCA5B5B999A9AD99A9ADA5B5B9BDC9CCE4E5E6E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E7E8E8D9DEDFD1D7D8CDD3D4CDD3D4D1D7D8DA
          DEDFE7E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E6E6E7C7CED0ACB8BC
          9AA9AD9AA9ADACB8BCC7CED0E6E7E7E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0DDDDE7E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0
          DDDDE7E9E9E9E9E9E9E9E9E90000E9E9E9E9E9E9C8D1D39EADB1A5B5B8BFCFD2
          D2E2E5CFDFE2BCCBCFA7B6BA9EADB1C8D1D3E9E9E9E9E9E9E9E9E9E9E9E9DDE1
          E1CFD4D5D1D7D8DAE0E1E1E7E8E0E6E7D9DFE0D2D7D9CFD4D5DDE1E1E9E9E9E9
          E9E9E9E9E9E9E9E9CFD4D7A0AEB2ABB7BCD1D7DCECEEF5E8EBF1CCD3D8ADB9BE
          A0AEB2CFD4D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795A3B28E9ABC787FDC686A
          F56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795
          A3B28E9ABC787FDC686AF56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9
          0000E9E9E9C9D2D49EADB1C4D2D6DCEAEDDEECEFDEECEFDEECEFDEECEFDBE9EC
          C0CED29DACB0C9D2D4E9E9E9E9E9E9DEE1E2CFD4D5DCE1E2E4E9EAE5EAEBE5EA
          EBE5EAEBE5EAEBE4E9EADBE0E1CED4D5DEE1E2E9E9E9E9E9E9CCD1D89FADB2CB
          D1DFE8E8FDEAEAFFEAEAFFEAEAFFEAEAFFE7E7FCC6CDDB9EACB1CCD1D8E9E9E9
          E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF7171FF7171FF7373FC8389
          DB96A5B1AFB4D8E9E9E9E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF71
          71FF7171FF7373FC8389DB96A5B1AFB4D8E9E9E90000E4E5E69FADB1C6D4D7E1
          EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1C3D1D49EADB1E4E5E6
          E7E8E8CFD4D5DDE2E3E6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EB
          ECDCE1E2CFD4D5E7E8E8E4E5E79EACB3C4C9E0DDDDFFDDDDFFDDDDFFDDDDFFDD
          DDFFDDDDFFDDDDFFDDDDFFC0C7DC9EACB2E4E5E7DFDFE797A5B38A90E08181FF
          8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B91DC97A5B2DFDFE7DFDF
          E797A5B38A90E08181FF8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B
          91DC97A5B2DFDFE70000C1CACDABBABDE3EEF0E5F0F2E5F0F2E5F0F2E5F0F2E5
          F0F2E5F0F2E5F0F2E5F0F2E2EDF0A7B5B9C1CACDDBDEDFD3D9DAE7EBEBE8EBEC
          E8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE7EAEBD2D7D8DBDEDFBCC2
          D0A6B2C0CFCFFDD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFCE
          CFFCA3AFBBBBC2D0ABB3D097A2C09091FD9090FF9090FF9090FF9090FF9090FF
          9090FF9090FF9090FF9091FC97A4BBABB2D0ABB3D097A2C09091FD9090FF9090
          FF9090FF9090FF9090FF9090FF9090FF9090FF9091FC97A4BBABB2D00000A8B6
          BACBD6D9E9F2F42122FD2122FDE9F2F40000FF0000FFE9F2F40000FF0000FFE9
          F2F4C5D0D3A8B6BAD2D7D8DFE2E3E9ECEDE0E3E4E0E3E4E9ECEDDEE1E2DEE1E2
          E9ECEDDEE1E2DEE1E2E9ECEDDCE0E1D2D7D8A3AEBCB3B8E0C2C2FF1B1BFF1B1B
          FFC2C2FF0000FF0000FFC2C2FF0000FF0000FFC2C2FFAFB6D9A3AEBC9DA9BC9E
          A4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1FF0000FF0000FFA1A1FF
          9DA4D99DA9BC9DA9BC9EA4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1
          FF0000FF0000FFA1A1FF9DA4D99DA9BC000099A8ACE4EDEFECF5F62123FE2123
          FEECF5F60000FF0000FFECF5F60000FF0000FFECF5F6E2ECED99A8ACCDD2D4E7
          EAEBEAEDEEE1E4E4E1E4E4EAEDEEDFE2E3DFE2E3EAEDEEDFE2E3DFE2E3EAEDEE
          E7EAEACDD2D499A8ACB1B3F7B4B4FF1919FF1919FFB4B4FF0000FF0000FFB4B4
          FF0000FF0000FFB4B4FFB1B3F599A8AC99A8ACAEAFF7B0B0FF1919FF1919FFB0
          B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAFF599A8AC99A8ACAEAFF7
          B0B0FF1919FF1919FFB0B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAF
          F599A8AC000099A8ACEBF2F3F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7
          F8F0F7F8F0F7F8F0F7F8E4ECEE99A8ACCDD2D4EAECECEBEEEEEBEEEEEBEEEEEB
          EEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEE7EAEBCDD2D499A8ACA6A7FA
          A7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA5A7
          F499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
          C0FFC0C0FFC0C0FFBBBDF499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FF
          C0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFBBBDF499A8AC0000AAB7BBD2DBDD
          F4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FACDD7
          D9AAB7BBD3D7D9E1E4E5EDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFED
          EFEFEDEFEFEDEFEFDFE3E3D3D7D99CA8BC999FE09999FF9999FF9999FF9999FF
          9999FF9999FF9999FF9999FF9999FF9999FF999FDC9CA8BCA5B1BCBCC1E0D0D0
          FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFB9BFDCA5
          B1BCA5B1BCBCC1E0D0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FF
          D0D0FFD0D0FFB9BFDCA5B1BC0000C5CDD0AFBBBEF6F9F9F8FBFBF8FBFBF8FBFB
          F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF5F8F9AEBABDC5CDD0DCDFE0D5D9DAEEEF
          EFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEDEEEFD4D9DADC
          DFE0AAB2D096A2BF8C8DFD8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF
          8C8CFF8C8DFC96A2BEAAB2D0BFC7D0A9B5BFDEDFFDE0E0FFE0E0FFE0E0FFE0E0
          FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0BFC7D0A9B5BFDEDFFDE0
          E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0
          0000E5E6E6A0AEB2DAE0E2FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
          FBFDFDD4DBDDA0AEB2E5E6E6E8E8E8D0D4D6E4E6E7EFF0F0EFF0F0EFF0F0EFF0
          F0EFF0F0EFF0F0EFF0F0EFF0F0E2E4E5D0D4D6E8E8E8DEDFE697A5B2878CE37E
          7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF898FDE97A5B2DEDFE6
          E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEF
          FFCDD3DE9FADB2E4E5E6E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEF
          EFFFEFEFFFEFEFFFEFEFFFCDD3DE9FADB2E4E5E60000E9E9E9D1D6D7A3B1B4DD
          E2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9
          E9E9E9E1E2E3D1D5D6E5E7E7F0F0F0F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0E4E6
          E6D0D4D6E1E2E3E9E9E9E9E9E9AFB5D795A2B47E83E47272FE7171FF7171FF71
          71FF7171FF7272FD7F85E196A4B2AFB5D7E9E9E9E9E9E9D1D6D7A3B1B4DDE2E4
          FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9E9E9
          E9D1D6D7A3B1B4DDE2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0
          AEB2D1D6D7E9E9E90000E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9
          FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9E1E2E3D0D5D6
          D7DBDCE5E7E7EEEFEFEFEFEFE3E6E6D5D9DAD0D4D6E1E2E3E9E9E9E9E9E9E9E9
          E9E9E9E9AFB5D796A4B38E99C37E83E47475F97474FA8085E0909BBF96A4B2AF
          B5D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9FAFA
          D9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0
          C3DDE2E4F7F9F9F9FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E90000E9E9
          E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E8E8E8DDE0E0D4D8D9CDD2D4CDD2D4
          D4D8D9DDE0E0E8E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DDDEE6A3AA
          D095A2BC99A8AC99A8AC95A2BCA3AAD0DDDEE6E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8
          BCC7CED0E5E6E6E9E9E9E9E9E9E9E9E90000}
        Margin = 6
      end
      object Label32: TLabel
        Left = 56
        Top = 17
        Width = 42
        Height = 14
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 56
        Top = 34
        Width = 42
        Height = 14
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label38: TLabel
        Left = 56
        Top = 51
        Width = 42
        Height = 14
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label62: TLabel
        Left = 154
        Top = 17
        Width = 85
        Height = 14
        AutoSize = False
        Caption = 'Data di apertura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label63: TLabel
        Left = 154
        Top = 34
        Width = 85
        Height = 14
        AutoSize = False
        Caption = 'Data di apertura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label64: TLabel
        Left = 154
        Top = 50
        Width = 85
        Height = 14
        AutoSize = False
        Caption = 'Data di apertura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label65: TLabel
        Left = 321
        Top = 17
        Width = 63
        Height = 14
        AutoSize = False
        Caption = 'Descrizione'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label66: TLabel
        Left = 321
        Top = 34
        Width = 63
        Height = 14
        AutoSize = False
        Caption = 'Descrizione'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label67: TLabel
        Left = 321
        Top = 51
        Width = 63
        Height = 14
        AutoSize = False
        Caption = 'Descrizione'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object DBECodicePratica1: TDBEdit
        Left = 99
        Top = 17
        Width = 35
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PRATICA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBECodicePratica2: TDBEdit
        Left = 99
        Top = 34
        Width = 35
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PRATICA2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBECodicePratica3: TDBEdit
        Left = 99
        Top = 51
        Width = 35
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PRATICA3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit11: TDBEdit
        Left = 239
        Top = 17
        Width = 63
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'DATAPRATICA1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit12: TDBEdit
        Left = 239
        Top = 34
        Width = 63
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'DATAPRATICA2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit15: TDBEdit
        Left = 239
        Top = 51
        Width = 63
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'DATAPRATICA3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EditDescrizionePratica1: TEdit
        Left = 384
        Top = 17
        Width = 280
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnChange = EditDescrizionePratica1Change
      end
      object EditDescrizionePratica2: TEdit
        Left = 384
        Top = 34
        Width = 280
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object EditDescrizionePratica3: TEdit
        Left = 384
        Top = 51
        Width = 280
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
    object PanelRiferimenti: TPanel
      Left = 0
      Top = 170
      Width = 681
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      Color = 15329769
      ParentBackground = False
      TabOrder = 4
      object LabelAgente: TLabel
        Left = 6
        Top = 5
        Width = 63
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Agente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object LabelAgente2: TLabel
        Left = 172
        Top = 5
        Width = 63
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Agente 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object LabelAgente3: TLabel
        Left = 339
        Top = 5
        Width = 63
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Agente 3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object LabelAgente4: TLabel
        Left = 506
        Top = 5
        Width = 63
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Agente 4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object dbeAgente: TcxDBComboBox
        Left = 69
        Top = 3
        AutoSize = False
        DataBinding.DataField = 'AGENTE'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnEditValueChanged = dbeAgentePropertiesEditValueChanged
        Properties.OnInitPopup = dbeAgentePropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 0
        Height = 19
        Width = 102
      end
      object dbeAgente2: TcxDBComboBox
        Left = 235
        Top = 3
        AutoSize = False
        DataBinding.DataField = 'AGENTE2'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnEditValueChanged = dbeAgente2PropertiesEditValueChanged
        Properties.OnInitPopup = dbeAgente2PropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 1
        Height = 19
        Width = 102
      end
      object dbeAgente3: TcxDBComboBox
        Left = 402
        Top = 3
        AutoSize = False
        DataBinding.DataField = 'AGENTE3'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnEditValueChanged = dbeAgente3PropertiesEditValueChanged
        Properties.OnInitPopup = dbeAgente3PropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 2
        Height = 19
        Width = 102
      end
      object dbeAgente4: TcxDBComboBox
        Left = 569
        Top = 3
        AutoSize = False
        DataBinding.DataField = 'AGENTE4'
        DataBinding.DataSource = SourceRG
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnInitPopup = dbeAgente4PropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        TabOrder = 3
        Height = 19
        Width = 102
      end
    end
  end
  inherited FormMainPanel: TPanel
    Left = 400
    Top = 592
    ExplicitLeft = 400
    ExplicitTop = 592
    inherited SplitterAllegati: TcxSplitter
      Width = 537
      ExplicitWidth = 537
    end
  end
  object QryRG: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_NUMDOC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATADOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_REGISTRO'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM RAPGIORN'
      'WHERE '
      '  NUMDOC = :OLD_NUMDOC '
      '  AND DATADOC = :OLD_DATADOC '
      '  AND REGISTRO = :OLD_REGISTRO '
      '')
    EditSQL.Strings = (
      'UPDATE RAPGIORN SET'
      '  NUMDOC = :NUMDOC ,'
      '  DATADOC = :DATADOC, '
      '  REGISTRO = :REGISTRO, '
      '  NOTE = :NOTE,'
      '  CODICECLIENTE = :CODICECLIENTE,'
      '  RAGSOCCLI = :RAGSOCCLI,'
      '  INDIRIZZOCLI = :INDIRIZZOCLI,'
      '  NUMCIVICOCLI = :NUMCIVICOCLI,'
      '  CITTACLI = :CITTACLI,'
      '  CAPCLI = :CAPCLI,'
      '  PROVINCIACLI = :PROVINCIACLI,'
      '  PARTITAIVACLI = :PARTITAIVACLI,'
      '  CODICEFISCALECLI = :CODICEFISCALECLI,'
      '  PRATICA = :PRATICA,'
      '  DATAPRATICA1 = :DATAPRATICA1,'
      '  VERSIONE = :VERSIONE,'
      '  STATODESCRIZIONE = :STATODESCRIZIONE,'
      '  STATOFOREGROUND = :STATOFOREGROUND,'
      '  STATOBACKGROUND = :STATOBACKGROUND,'
      '  SEGNOOPERAZIONECANTIERE = :SEGNOOPERAZIONECANTIERE,'
      '  AGENTE  = :AGENTE,'
      '  AGENTE2 = :AGENTE2,'
      '  AGENTE3 = :AGENTE3,'
      '  AGENTE4 = :AGENTE4'
      ''
      'WHERE'
      '  NUMDOC = :OLD_NUMDOC '
      '  AND DATADOC = :OLD_DATADOC '
      '  AND REGISTRO = :OLD_REGISTRO '
      ''
      '')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO RAPGIORN'
      '('
      '  NUMDOC,'
      '  DATADOC,'
      '  REGISTRO,'
      '  NOTE,'
      '  CODICECLIENTE,'
      '  RAGSOCCLI,'
      '  INDIRIZZOCLI,'
      '  NUMCIVICOCLI,'
      '  CITTACLI,'
      '  CAPCLI,'
      '  PROVINCIACLI,'
      '  PARTITAIVACLI,'
      '  CODICEFISCALECLI,'
      '  PRATICA,'
      '  DATAPRATICA1,'
      '  VERSIONE,'
      '  STATODESCRIZIONE,'
      '  STATOFOREGROUND,'
      '  STATOBACKGROUND,'
      '  SEGNOOPERAZIONECANTIERE,'
      '  AGENTE,'
      '  AGENTE2,'
      '  AGENTE3,'
      '  AGENTE4'
      ')'
      'VALUES'
      '('
      '  :NUMDOC,'
      '  :DATADOC,'
      '  :REGISTRO,'
      '  :NOTE,'
      '  :CODICECLIENTE,'
      '  :RAGSOCCLI,'
      '  :INDIRIZZOCLI,'
      '  :NUMCIVICOCLI,'
      '  :CITTACLI,'
      '  :CAPCLI,'
      '  :PROVINCIACLI,'
      '  :PARTITAIVACLI,'
      '  :CODICEFISCALECLI,'
      '  :PRATICA,'
      '  :DATAPRATICA1,'
      '  :VERSIONE,'
      '  :STATODESCRIZIONE,'
      '  :STATOFOREGROUND,'
      '  :STATOBACKGROUND,'
      '  :SEGNOOPERAZIONECANTIERE,'
      '  :AGENTE,'
      '  :AGENTE2,'
      '  :AGENTE3,'
      '  :AGENTE4'
      ')'
      '')
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = QryRGBeforePost
    SQL.Strings = (
      'SELECT * FROM RAPGIORN'
      'WHERE'
      '  NUMDOC = :P_NUMDOC '
      '  AND DATADOC = :P_DATADOC'
      '  AND REGISTRO = :P_REGISTRO')
    Left = 144
    Top = 24
    object QryRGNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
      Required = True
    end
    object QryRGDATADOC: TDateTimeField
      FieldName = 'DATADOC'
      Required = True
    end
    object QryRGREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 5
    end
    object QryRGNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QryRGCODICECLIENTE: TIntegerField
      FieldName = 'CODICECLIENTE'
      OnChange = QryRGCODICECLIENTEChange
    end
    object QryRGRAGSOCCLI: TStringField
      FieldName = 'RAGSOCCLI'
      Size = 60
    end
    object QryRGINDIRIZZOCLI: TStringField
      FieldName = 'INDIRIZZOCLI'
      Size = 40
    end
    object QryRGNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      Size = 10
    end
    object QryRGCITTACLI: TStringField
      FieldName = 'CITTACLI'
      Size = 25
    end
    object QryRGCAPCLI: TStringField
      FieldName = 'CAPCLI'
      Size = 5
    end
    object QryRGPROVINCIACLI: TStringField
      FieldName = 'PROVINCIACLI'
      Size = 3
    end
    object QryRGPARTITAIVACLI: TStringField
      FieldName = 'PARTITAIVACLI'
      Size = 16
    end
    object QryRGCODICEFISCALECLI: TStringField
      FieldName = 'CODICEFISCALECLI'
      Size = 16
    end
    object QryRGPRATICA: TIntegerField
      FieldName = 'PRATICA'
      OnChange = QryRGPRATICAChange
    end
    object QryRGDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
      OnChange = QryRGPRATICAChange
    end
    object QryRGVERSIONE: TIntegerField
      FieldName = 'VERSIONE'
    end
    object QryRGSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QryRGSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QryRGSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QryRGSEGNOOPERAZIONECANTIERE: TStringField
      FieldName = 'SEGNOOPERAZIONECANTIERE'
      OnChange = QryRGSEGNOOPERAZIONECANTIEREChange
      Size = 1
    end
    object QryRGAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QryRGAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QryRGAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QryRGAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
  end
  object SourceRG: TDataSource
    AutoEdit = False
    DataSet = QryRG
    Left = 176
    Top = 24
  end
  object QTipoOre1: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'OREDIP1'#39)
    Left = 368
    Top = 288
    object QTipoOre1DESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoOre1: TDataSource
    AutoEdit = False
    DataSet = QTipoOre1
    Left = 400
    Top = 288
  end
  object QTipoOre2: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'OREDIP2'#39)
    Left = 464
    Top = 288
    object StringField1: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoOre2: TDataSource
    AutoEdit = False
    DataSet = QTipoOre2
    Left = 496
    Top = 288
  end
  object QTipoOre3: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'OREDIP3'#39)
    Left = 560
    Top = 288
    object StringField2: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoOre3: TDataSource
    AutoEdit = False
    DataSet = QTipoOre3
    Left = 600
    Top = 288
  end
  object QTipoSpese1: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'TIPOSPESA1'#39)
    Left = 368
    Top = 344
    object StringField3: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoSpese1: TDataSource
    AutoEdit = False
    DataSet = QTipoSpese1
    Left = 400
    Top = 344
  end
  object QTipoSpese2: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'TIPOSPESA2'#39)
    Left = 464
    Top = 344
    object StringField4: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoSpese2: TDataSource
    AutoEdit = False
    DataSet = QTipoSpese2
    Left = 496
    Top = 344
  end
  object QTipoSpese3: TIBOQuery
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI'
      'WHERE TIPO = '#39'TIPOSPESA3'#39)
    Left = 560
    Top = 344
    object StringField5: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
  end
  object STipoSpese3: TDataSource
    AutoEdit = False
    DataSet = QTipoSpese3
    Left = 592
    Top = 344
  end
  object MenuElenchi: TPopupMenu
    OnPopup = MenuElenchiPopup
    Left = 663
    Top = 32
    object Duplicarigo1: TMenuItem
      Caption = 'Duplica rigo   (CTRL+D)'
      OnClick = Duplicarigo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Selezionavista1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Seleziona vista'
      OnClick = Selezionavista1Click
    end
    object Salvaimpostazionicolonne1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Salva la vista attuale'
      OnClick = Salvaimpostazionicolonne1Click
    end
    object Ripristinacolonneeliminate1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Ripristina colonne eliminate'
      OnClick = Ripristinacolonneeliminate1Click
    end
  end
  object QSTC1: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_CODICE_CANTIERE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_DATA_APERTURA_CANTIERE'
        ParamType = ptUnknown
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT ID FROM SOTTOCANTIERI1'
      'WHERE'
      ' TIPOCANTIERE = '#39'P'#39' '
      ' AND CODICECANTIERE = :P_CODICE_CANTIERE'
      ' AND DATAAPERTURACANTIERE = :P_DATA_APERTURA_CANTIERE')
    Left = 352
    Top = 424
  end
  object QSTC2: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_CODICE_CANTIERE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_DATA_APERTURA_CANTIERE'
        ParamType = ptUnknown
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT ID FROM SOTTOCANTIERI2'
      'WHERE'
      ' TIPOCANTIERE = '#39'P'#39' '
      ' AND CODICECANTIERE = :P_CODICE_CANTIERE'
      ' AND DATAAPERTURACANTIERE = :P_DATA_APERTURA_CANTIERE')
    Left = 416
    Top = 424
  end
  object QSTC3: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_CODICE_CANTIERE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_DATA_APERTURA_CANTIERE'
        ParamType = ptUnknown
      end>
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT ID FROM SOTTOCANTIERI3'
      'WHERE'
      ' TIPOCANTIERE = '#39'P'#39' '
      ' AND CODICECANTIERE = :P_CODICE_CANTIERE'
      ' AND DATAAPERTURACANTIERE = :P_DATA_APERTURA_CANTIERE')
    Left = 480
    Top = 424
  end
  object PopupMenuAzzeraCantiereImpianto: TPopupMenu
    Left = 296
    Top = 96
    object Deselezionacantiereimpianto1: TMenuItem
      Caption = 'Deseleziona cantiere/impianto'
      OnClick = Deselezionacantiereimpianto1Click
    end
  end
  object PopupMenuAzzeramentoStato: TPopupMenu
    Left = 72
    Top = 168
    object AzzeraStato1: TMenuItem
      Caption = 'Azzera stato'
      OnClick = AzzeraStato1Click
    end
  end
end
