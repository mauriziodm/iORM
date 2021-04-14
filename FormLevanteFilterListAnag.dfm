inherited LevanteFilterListAnagForm: TLevanteFilterListAnagForm
  Caption = 'LevanteFilterListAnagForm'
  ClientHeight = 671
  ClientWidth = 752
  ExplicitWidth = 752
  ExplicitHeight = 671
  DesignSize = (
    752
    671)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 591
    ExplicitHeight = 591
    inherited PanelGriglia: TPanel
      Top = 191
      Height = 400
      ExplicitTop = 191
      ExplicitHeight = 400
      inherited GridList: TcxGrid
        Height = 246
        ExplicitHeight = 246
        inherited tvList: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Selection = nil
        end
      end
      object PanelFiltri: TPanel
        Left = 0
        Top = 246
        Width = 686
        Height = 154
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object SubPanelFiltri: TPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 156
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonResetQuery: TSpeedButton
      Enabled = False
    end
  end
  inherited MenuGriglia: TPopupMenu
    inherited Ripristinacolonneeliminate1: TMenuItem
      Enabled = False
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 44263.739812974530000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
