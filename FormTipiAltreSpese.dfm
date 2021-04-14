inherited TipiAltreSpeseForm: TTipiAltreSpeseForm
  Left = 481
  Top = 286
  Caption = 'TipiAltreSpeseForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    inherited PanelSottocantieri: TPanel
      inherited LabelPanelSottopraticheCaption: TLabel
        Caption = ' TIPI DI SPESE'
      end
      inherited GridS1: TcxGrid
        inherited tvS1: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
        end
      end
      inherited GridS2: TcxGrid
        inherited tvS2: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
        end
      end
      inherited GridS3: TcxGrid
        inherited tvS3: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
        end
      end
    end
  end
  inherited QryS1: TIBOQuery
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'TIPOSPESA1'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'TIPOSPESA1'#39
      '      )')
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'TIPOSPESA1'#39)
  end
  inherited QryS2: TIBOQuery
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'TIPOSPESA2'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'TIPOSPESA2'#39
      '      )')
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'TIPOSPESA2'#39)
  end
  inherited QryS3: TIBOQuery
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'TIPOSPESA3'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'TIPOSPESA3'#39
      '      )')
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'TIPOSPESA3'#39)
  end
end
