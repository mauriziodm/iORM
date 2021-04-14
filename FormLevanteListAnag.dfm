inherited LevanteListAnagForm: TLevanteListAnagForm
  Left = 28
  Top = 82
  Caption = 'LevanteListAnagForm'
  ClientHeight = 826
  ClientWidth = 700
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  ExplicitWidth = 700
  ExplicitHeight = 826
  DesignSize = (
    700
    826)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 746
    Anchors = [akLeft, akTop, akBottom]
    OnResize = ClientAreaResize
    ExplicitHeight = 409
    object PanelGriglia: TPanel
      Left = 0
      Top = 432
      Width = 686
      Height = 314
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      ExplicitTop = 95
      object GridList: TcxGrid
        Left = 0
        Top = 0
        Width = 686
        Height = 314
        Align = alClient
        BorderStyle = cxcbsNone
        PopupMenu = MenuGriglia
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        RootLevelOptions.DetailFrameColor = clBlack
        RootLevelOptions.DetailFrameWidth = 1
        object tvList: TcxGridDBTableView
          DragMode = dmAutomatic
          PopupMenu = MenuGriglia
          OnDblClick = tvListDblClick
          OnEndDrag = tvListEndDrag
          OnKeyPress = tvListKeyPress
          Navigator.Buttons.CustomButtons = <>
          FilterBox.Visible = fvNever
          ScrollbarAnnotations.CustomAnnotations = <>
          OnCustomDrawCell = tvListCustomDrawCell
          OnCustomDrawPartBackground = tvListCustomDrawPartBackground
          DataController.DataSource = DS
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Clicca qui per filtrare'
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.DragHighlighting = False
          OptionsBehavior.DragOpening = False
          OptionsBehavior.DragScrolling = False
          OptionsBehavior.BestFitMaxRecordCount = 50
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.FocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLineColor = 5789784
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          OptionsView.RowSeparatorColor = 5789784
          Styles.FilterRowInfoText = DM1.tvContent
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          OnCustomDrawColumnHeader = tvListCustomDrawColumnHeader
          OnCustomDrawGroupCell = tvListCustomDrawGroupCell
        end
        object lvList: TcxGridLevel
          GridView = tvList
          Options.DetailFrameColor = clBlack
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonResetQuery: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonResetQueryClick
    end
    inherited RxSpeedButtonVisualizza: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonVisualizzaClick
    end
    inherited RxSpeedModifica: TSpeedButton
      OnClick = RxSpeedModificaClick
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonEliminaClick
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      OnClick = RxSpeedButtonTrovaClick
    end
    inherited RxSpeedButtonStampa: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonStampaClick
      OnMouseUp = RxSpeedButtonStampaMouseUp
    end
  end
  object Q: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    Left = 586
    Top = 10
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 614
    Top = 10
  end
  object MenuGriglia: TPopupMenu
    OnPopup = MenuGrigliaPopup
    Left = 518
    Top = 38
    object Selezionavista1: TMenuItem
      Caption = 'Seleziona vista'
      OnClick = Selezionavista1Click
    end
    object Salvalavistaattuale1: TMenuItem
      Caption = 'Salva la vista attuale'
      OnClick = Salvalavistaattuale1Click
    end
    object Ripristinacolonneeliminate1: TMenuItem
      Caption = 'Ripristina colonne eliminate'
      OnClick = Ripristinacolonneeliminate1Click
    end
  end
  object dxPrinter: TdxComponentPrinter
    CurrentLink = dxPrinterLink1
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.Caption = 'Anteprima di Stampa'
    PreviewOptions.WindowState = wsMaximized
    Version = 0
    OnEndGenerateReport = dxPrinterEndGenerateReport
    OnStartGenerateReport = dxPrinterStartGenerateReport
    Left = 384
    Top = 64
    PixelsPerInch = 96
    object dxPrinterLink1: TdxGridReportLink
      Active = True
      Component = GridList
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44263.737204571760000000
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
