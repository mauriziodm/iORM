inherited ListaModelliConfForm: TListaModelliConfForm
  Left = 612
  Top = 236
  Caption = 'ListaModelliConfForm'
  ClientHeight = 688
  ClientWidth = 722
  Color = clPurple
  ExplicitWidth = 722
  ExplicitHeight = 688
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonNuovo: TSpeedButton
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      Enabled = True
    end
  end
  inherited ClientArea: TScrollBox
    inherited GridQ: TcxGrid
      inherited tvQ: TcxGridDBTableView
        OptionsView.GroupByBox = False
        Styles.Background = nil
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Selection = nil
        Styles.Footer = nil
        Styles.Group = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
        object tvQCODICE: TcxGridDBColumn
          Caption = 'Codice'
          DataBinding.FieldName = 'CODICE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object tvQDESCMODELLO: TcxGridDBColumn
          Caption = 'Tipo impianto'
          DataBinding.FieldName = 'DESCMODELLO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 584
        end
      end
    end
  end
  inherited Q: TIBOQuery
    SQL.Strings = (
      'SELECT CODICE, DESCMODELLO'
      ''
      'FROM CONFORM'
      ''
      'WHERE CODICE < -1'
      'AND DATA = '#39'01/01/1900'#39)
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QDESCMODELLO: TStringField
      FieldName = 'DESCMODELLO'
      Size = 100
    end
  end
end
