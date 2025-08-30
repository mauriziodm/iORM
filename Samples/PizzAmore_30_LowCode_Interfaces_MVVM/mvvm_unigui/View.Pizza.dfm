inherited ViewPizza: TViewPizza
  inherited PanelTop: TUniPanel
    inherited LabelTitle: TUniLabel
      Caption = 'Pizza'
    end
  end
  object UniLabel1: TUniLabel [2]
    Left = 10
    Top = 60
    Width = 100
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ID'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 2
  end
  object DBEditID: TUniDBEdit [3]
    Left = 125
    Top = 60
    Width = 55
    Height = 25
    Hint = ''
    DataField = 'ID'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 3
    BorderStyle = ubsNone
  end
  object UniLabel2: TUniLabel [4]
    Left = 10
    Top = 100
    Width = 100
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Name'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 4
  end
  object DBEditName: TUniDBEdit [5]
    Left = 125
    Top = 100
    Width = 260
    Height = 25
    Hint = ''
    DataField = 'Name'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 5
    BorderStyle = ubsNone
  end
  object UniLabel3: TUniLabel [6]
    Left = 10
    Top = 140
    Width = 100
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 6
  end
  object DBEditPrice: TUniDBEdit [7]
    Left = 125
    Top = 140
    Width = 260
    Height = 25
    Hint = ''
    DataField = 'Price'
    DataSource = BSSource
    ParentFont = False
    Font.Height = -16
    TabOrder = 7
    BorderStyle = ubsNone
  end
  object UniLabel4: TUniLabel [8]
    Left = 10
    Top = 180
    Width = 100
    Height = 21
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Image'
    ParentFont = False
    Font.Color = clNavy
    Font.Height = -16
    Font.Style = [fsBold]
    TabOrder = 8
  end
  object UniDBImage1: TUniDBImage [9]
    Left = 125
    Top = 180
    Width = 260
    Height = 250
    Hint = ''
    DataField = 'Image'
    DataSource = BSSource
    Stretch = True
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
end
