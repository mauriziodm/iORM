object ChartFrame: TChartFrame
  Left = 0
  Top = 0
  Width = 757
  Height = 587
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object ChartGrid: TcxGrid
    Left = 0
    Top = 17
    Width = 757
    Height = 570
    Align = alClient
    TabOrder = 0
    object cvChart: TcxGridDBChartView
      DiagramArea.Values.CaptionPosition = ldvcpAboveRight
      DiagramArea.Values.MarkerStyle = cmsSquare
      DiagramArea.Transparency = 100
      DiagramBar.Values.CaptionPosition = cdvcpOutsideEnd
      DiagramColumn.Active = True
      DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
      DiagramLine.Values.CaptionPosition = ldvcpAboveRight
      DiagramLine.Values.MarkerStyle = cmsSquare
      DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
      DiagramStackedArea.Values.CaptionPosition = ldvcpAboveRight
      DiagramStackedArea.Values.MarkerStyle = cmsSquare
      DiagramStackedArea.Transparency = 100
      DiagramStackedBar.Values.CaptionPosition = cdvcpCenter
      DiagramStackedColumn.Values.CaptionPosition = cdvcpCenter
      Legend.Alignment = cpaCenter
      Legend.Border = lbNone
      Legend.KeyBorder = lbSingle
      Legend.Orientation = cpoHorizontal
      Legend.Position = cppBottom
      OptionsBehavior.ValueHotTrack = vhAlways
      Styles.Legend = ChartLegenda
      ToolBox.Border = tbNone
      ToolBox.CustomizeButton = True
      ToolBox.DiagramSelector = True
      OnActiveDiagramChanged = cvChartActiveDiagramChanged
    end
    object lvChart: TcxGridLevel
      GridView = cvChart
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      757
      17)
    object CBShowValue: TcxCheckBox
      Left = 669
      Top = -4
      Anchors = [akTop, akRight]
      Caption = 'Mostra i valori'
      ParentFont = False
      Properties.Alignment = taRightJustify
      Properties.OnChange = CBShowValuePropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 0
      Transparent = True
      Width = 93
    end
  end
  object dxPrinter: TdxComponentPrinter
    CurrentLink = ChartPrinterLink
    PreviewOptions.Caption = 'Anteprima di Stampa'
    Version = 0
    OnCustomDrawPageFooter = dxPrinterCustomDrawPageFooter
    OnCustomDrawPageHeader = dxPrinterCustomDrawPageHeader
    Left = 328
    Top = 64
    object ChartPrinterLink: TdxGridReportLink
      Active = True
      Component = ChartGrid
      PDFExportOptions.Author = 'Levante Software'
      PrinterPage.CenterOnPageH = True
      PrinterPage.CenterOnPageV = True
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Giornale di Cantiere'
      ReportDocument.CreationDate = 43858.676398460650000000
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -16
      ReportTitle.Font.Name = 'Arial'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Grafico'
      ShrinkToPageWidth = True
      BuiltInReportLink = True
    end
  end
  object ChartStyleRepository1: TcxStyleRepository
    Left = 176
    Top = 248
    PixelsPerInch = 96
    object ChartLegenda: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
end
