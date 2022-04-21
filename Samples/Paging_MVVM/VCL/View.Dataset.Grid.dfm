object ViewDatasetGrid: TViewDatasetGrid
  Left = 0
  Top = 0
  Width = 300
  Height = 500
  TabOrder = 0
  PixelsPerInch = 96
  DesignSize = (
    300
    500)
  object ViewPanelTop: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonPreviousPage: TSpeedButton
      Left = 3
      Top = 26
      Width = 70
      Height = 21
      Caption = 'Prev. page'
    end
    object ButtonNextPage: TSpeedButton
      Left = 76
      Top = 26
      Width = 70
      Height = 21
      Caption = 'Next page'
    end
    object LabelTitle: TLabel
      Left = 0
      Top = 0
      Width = 300
      Height = 20
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Dataset Grid'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlBottom
    end
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 50
    Width = 294
    Height = 447
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSArticles
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Width = 70
        Visible = True
      end>
  end
  object MDSArticles: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPArticles'
    Left = 224
    Top = 128
    object MDSArticlesID: TIntegerField
      FieldName = 'ID'
    end
    object MDSArticlesDescription: TStringField
      DisplayWidth = 100
      FieldName = 'Description'
      Size = 100
    end
    object MDSArticlesPrice: TCurrencyField
      FieldName = 'Price'
    end
  end
  object VMBridge: TioViewModelBridge
    Left = 224
    Top = 72
  end
  object DSArticles: TDataSource
    DataSet = MDSArticles
    Left = 224
    Top = 184
  end
end
