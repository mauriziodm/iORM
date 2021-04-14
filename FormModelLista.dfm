inherited ModelListaForm: TModelListaForm
  Top = 56
  Caption = 'ModelListaForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      Enabled = True
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonEliminaClick
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      OnClick = RxSpeedButtonTrovaClick
    end
    inherited RxSpeedButtonVisualizza: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonVisualizzaClick
    end
    inherited RxSpeedButtonHelp: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonHelpClick
    end
  end
  inherited ClientArea: TScrollBox
    object PanelFiltri: TPanel
      Left = 0
      Top = 526
      Width = 686
      Height = 60
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
      object Shape6: TShape
        Left = 0
        Top = 18
        Width = 684
        Height = 1
        Brush.Color = clNavy
        Pen.Color = clNavy
      end
      object Label8: TLabel
        Left = 276
        Top = 9
        Width = 139
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'FILTRI DI RICERCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GridQ: TcxGrid
      Left = 0
      Top = 0
      Width = 686
      Height = 526
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailFrameColor = clBlack
      RootLevelOptions.DetailFrameWidth = 1
      object tvQ: TcxGridDBTableView
        DragMode = dmAutomatic
        OnDblClick = tvQDblClick
        Navigator.Buttons.CustomButtons = <>
        OnCustomDrawPartBackground = tvQCustomDrawPartBackground
        DataController.DataModeController.GridMode = True
        DataController.DataSource = DSQ
        DataController.KeyFieldNames = 
          'TIPO;CODICESOGGETTO;CODICEARTICOLO;CODICEGRUPPO1;CODICEGRUPPO2;C' +
          'ODICEGRUPPO3'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.BestFitMaxRecordCount = 50
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnSorting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.DataRowHeight = 19
        OptionsView.GridLines = glVertical
        OptionsView.HeaderEndEllipsis = True
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        OnCustomDrawColumnHeader = tvQCustomDrawColumnHeader
        OnCustomDrawGroupCell = tvQCustomDrawGroupCell
      end
      object lvQ: TcxGridLevel
        GridView = tvQ
        Options.DetailFrameColor = clBlack
      end
    end
    object Panel5: TPanel
      Left = 635
      Top = 10
      Width = 28
      Height = 14
      BevelOuter = bvNone
      Color = 16037544
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object SpeedButton3: TSpeedButton
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
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
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
        OnClick = SpeedButton4Click
      end
    end
  end
  object Q: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    FieldOptions = []
    Left = 576
    Top = 8
  end
  object DSQ: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 605
    Top = 8
  end
end
