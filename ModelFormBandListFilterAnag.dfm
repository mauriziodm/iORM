inherited BandListFilterAnagFormModel: TBandListFilterAnagFormModel
  Left = 5
  Top = 4
  Caption = 'BandListFilterAnagFormModel'
  ClientHeight = 708
  ClientWidth = 754
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  ExplicitWidth = 754
  ExplicitHeight = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Width = 729
    Height = 621
    ExplicitWidth = 729
    ExplicitHeight = 621
    object MainPageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 729
      Height = 621
      Cursor = crHandPoint
      Align = alClient
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabElenco
      Properties.CustomButtons.Buttons = <>
      Properties.NavigatorPosition = npLeftBottom
      Properties.Style = 9
      Properties.TabSlants.Positions = [spLeft, spRight]
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      OnChange = MainPageControlChange
      ClientRectBottom = 621
      ClientRectRight = 729
      ClientRectTop = 19
      object TabElenco: TcxTabSheet
        Caption = '   Elenco   '
        ImageIndex = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object PanelList: TPanel
          Left = 0
          Top = 0
          Width = 729
          Height = 602
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GridList: TcxGrid
            Left = 0
            Top = 53
            Width = 729
            Height = 405
            Align = alClient
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            LevelTabs.Style = 10
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clBlack
            RootLevelOptions.DetailFrameWidth = 1
            object btvList: TcxGridDBBandedTableView
              OnDblClick = btvListDblClick
              OnEndDrag = btvListEndDrag
              OnKeyPress = btvListKeyPress
              Navigator.Buttons.CustomButtons = <>
              FilterBox.Visible = fvNever
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawCell = btvListCustomDrawCell
              DataController.DataModeController.DetailInSQLMode = True
              DataController.DataSource = DS
              DataController.Filter.Options = [fcoCaseInsensitive]
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Kind = skCount
                  Position = spFooter
                  FieldName = 'TIPOIMPIANTO'
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  FieldName = 'TIPOIMPIANTO'
                end>
              DataController.Summary.SummaryGroups = <>
              FilterRow.InfoText = 'Clicca qui per definire un filtro di ricerca'
              FilterRow.SeparatorColor = 16037544
              FilterRow.ApplyChanges = fracImmediately
              OptionsBehavior.CellHints = True
              OptionsCustomize.ColumnHidingOnGrouping = False
              OptionsSelection.CellSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.FocusRect = False
              OptionsView.NoDataToDisplayInfoText = 'Nessun dato da visualizzare'
              OptionsView.GridLineColor = 13882323
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              OptionsView.RowSeparatorColor = clBlack
              OptionsView.FixedBandSeparatorColor = clBlack
              Styles.ContentEven = DM1.PrintContentEven
              Styles.ContentOdd = DM1.PrintContentOdd
              Styles.FilterRowInfoText = DM1.tvContent
              Styles.Footer = DM1.tvContent
              Styles.GroupSummary = DM1.tvContent
              Styles.StyleSheet = DM1.btvGCMaster
              OnCustomDrawGroupCell = btvListCustomDrawGroupCell
              Bands = <
                item
                end>
            end
            object lvList: TcxGridLevel
              GridView = btvList
              Options.DetailFrameColor = 11731033
              Options.DetailFrameWidth = 2
              Options.DetailTabsPosition = dtpTop
              Styles.Tab = DM1.tvArtDetail_Content
              Styles.TabsBackground = DM1.tvArtDetail_GroupByBox
            end
          end
          object PanelFiltri: TPanel
            Left = 0
            Top = 458
            Width = 729
            Height = 144
            Align = alBottom
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 0
            OnResize = PanelFiltriResize
            object SubPanelFiltri: TPanel
              Left = 0
              Top = 0
              Width = 686
              Height = 144
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
            end
          end
          object PanelSelezioneColonne: TPanel
            Left = 0
            Top = 0
            Width = 729
            Height = 53
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 2
            OnResize = PanelSelezioneColonneResize
            object SubPanelSelezioneColonne: TPanel
              Left = 0
              Top = 4
              Width = 684
              Height = 46
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object Label2: TLabel
                Left = 15
                Top = 0
                Width = 654
                Height = 44
                Alignment = taCenter
                AutoSize = False
                Color = 11064319
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = False
              end
              object Shape1: TShape
                Left = 17
                Top = 2
                Width = 650
                Height = 40
                Brush.Style = bsClear
                Pen.Color = 28895
              end
              object SbGcVisMem1: TSpeedButton
                Left = 69
                Top = 5
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '1'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem4: TSpeedButton
                Left = 414
                Top = 5
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '4'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem2: TSpeedButton
                Left = 184
                Top = 5
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '2'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem5: TSpeedButton
                Left = 529
                Top = 5
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '5'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem3: TSpeedButton
                Left = 299
                Top = 5
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '3'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMemAdd: TSpeedButton
                Left = 644
                Top = 5
                Width = 21
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                AllowAllUp = True
                GroupIndex = 11111
                Caption = '+'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object Label3: TLabel
                Left = 17
                Top = 3
                Width = 50
                Height = 39
                Alignment = taCenter
                AutoSize = False
                Caption = 'Memorie'
                Color = 28895
                Font.Charset = ANSI_CHARSET
                Font.Color = 12902911
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = False
                Layout = tlCenter
              end
              object SbGcVisMem6: TSpeedButton
                Left = 69
                Top = 23
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '6'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem7: TSpeedButton
                Left = 184
                Top = 23
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '7'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem8: TSpeedButton
                Left = 299
                Top = 23
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '8'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem9: TSpeedButton
                Left = 414
                Top = 23
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '9'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMem10: TSpeedButton
                Left = 529
                Top = 23
                Width = 114
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                GroupIndex = 199
                Caption = '10'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object SbGcVisMemSetPredef: TSpeedButton
                Left = 644
                Top = 23
                Width = 21
                Height = 16
                Cursor = crHandPoint
                Hint = 
                  'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                  'o.'
                AllowAllUp = True
                GroupIndex = 11111
                Caption = 'P'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
        end
      end
      object TabScheda: TcxTabSheet
        Caption = '   Scheda   '
        ImageIndex = 4
        DesignSize = (
          729
          602)
        object ClientAreaScheda: TScrollBox
          Left = 0
          Top = 0
          Width = 681
          Height = 602
          Anchors = [akLeft, akTop, akBottom]
          BorderStyle = bsNone
          Color = clRed
          ParentColor = False
          TabOrder = 0
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonResetQuery: TSpeedButton
      OnClick = RxSpeedButtonResetQueryClick
    end
    inherited RxSpeedButtonVisualizza: TSpeedButton
      OnClick = RxSpeedButtonVisualizzaClick
    end
    inherited RxSpeedModifica: TSpeedButton
      OnClick = RxSpeedModificaClick
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      OnClick = RxSpeedButtonEliminaClick
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      OnClick = RxSpeedButtonTrovaClick
    end
  end
  object Q: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    Left = 586
    Top = 26
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 614
    Top = 26
  end
end
