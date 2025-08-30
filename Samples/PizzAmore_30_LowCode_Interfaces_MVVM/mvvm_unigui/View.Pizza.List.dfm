inherited ViewPizzas: TViewPizzas
  inherited PanelTop: TUniPanel
    inherited LabelTitle: TUniLabel
      Caption = 'Pizzas'
    end
  end
  inherited PanelWhere: TUniPanel
    inherited PanelWhereButtons: TUniPanel
      TabOrder = 9
    end
    object UniLabel1: TUniLabel
      Left = 10
      Top = 6
      Width = 17
      Height = 21
      Hint = ''
      Caption = 'ID'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 0
    end
    object DBEditWhereID: TUniDBEdit
      Left = 60
      Top = 6
      Width = 40
      Height = 25
      Hint = ''
      DataField = 'ID'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 1
      BorderStyle = ubsNone
    end
    object UniLabel2: TUniLabel
      Left = 130
      Top = 6
      Width = 46
      Height = 21
      Hint = ''
      Caption = 'Name'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object DBEditWhereName: TUniDBEdit
      Left = 182
      Top = 6
      Width = 261
      Height = 25
      Hint = ''
      DataField = 'Name'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 3
      BorderStyle = ubsNone
    end
    object UniLabel3: TUniLabel
      Left = 10
      Top = 38
      Width = 81
      Height = 21
      Hint = ''
      Caption = 'From price'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 5
    end
    object DBEditWhereFromPrice: TUniDBEdit
      Left = 100
      Top = 38
      Width = 100
      Height = 25
      Hint = ''
      DataField = 'FromPrice'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 7
      BorderStyle = ubsNone
    end
    object UniLabel4: TUniLabel
      Left = 218
      Top = 38
      Width = 60
      Height = 21
      Hint = ''
      Caption = 'To price'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object DBEditWhereToPrice: TUniDBEdit
      Left = 287
      Top = 38
      Width = 100
      Height = 25
      Hint = ''
      DataField = 'ToPrice'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 6
      BorderStyle = ubsNone
    end
  end
  object GridCustomers: TUniDBGrid [3]
    Left = 0
    Top = 40
    Width = 500
    Height = 440
    Hint = ''
    BodyRTL = False
    DataSource = SourceMaster
    ReadOnly = True
    WebOptions.PageSize = 50
    WebOptions.RetainCursorOnSort = True
    LoadMask.Message = 'Loading data...'
    BufferedStore.Enabled = True
    BorderStyle = ubsNone
    Align = alClient
    Font.Height = -13
    ParentFont = False
    TabOrder = 3
    Columns = <
      item
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 74
        Alignment = taCenter
      end
      item
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = 'Name'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 268
      end
      item
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = 'Price'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 114
      end>
  end
  object PanelImage: TUniPanel [4]
    Left = 500
    Top = 40
    Width = 300
    Height = 440
    Hint = ''
    Align = alRight
    TabOrder = 4
    Caption = 'PanelImage'
    object UniDBImage1: TUniDBImage
      Left = 43
      Top = 120
      Width = 217
      Height = 217
      Hint = ''
      DataField = 'Image'
      DataSource = SourceMaster
      Stretch = True
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BSMasterImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  inherited BSWhere: TioModelDataSet
    object BSWhereID: TIntegerField
      FieldName = 'ID'
    end
    object BSWhereName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSWhereFromPrice: TCurrencyField
      FieldName = 'FromPrice'
    end
    object BSWhereToPrice: TCurrencyField
      FieldName = 'ToPrice'
    end
  end
end
