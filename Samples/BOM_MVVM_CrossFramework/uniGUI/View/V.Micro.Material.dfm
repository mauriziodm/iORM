object MicroMaterialView: TMicroMaterialView
  Left = 0
  Top = 0
  Width = 451
  Height = 105
  TabOrder = 0
  DesignSize = (
    451
    105)
  object ClientArea: TUniPanel
    Left = 3
    Top = 3
    Width = 433
    Height = 98
    Hint = ''
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 15847612
    DesignSize = (
      433
      98)
    object ButtonShow: TUniButton
      Left = 373
      Top = 3
      Width = 57
      Height = 29
      Hint = ''
      Caption = 'Show'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 1
    end
    object ButtonPost: TUniButton
      Left = 373
      Top = 34
      Width = 57
      Height = 58
      Hint = ''
      Caption = 'Post'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      TabOrder = 2
    end
    object UniDBText1: TUniDBText
      Left = 5
      Top = 9
      Width = 84
      Height = 15
      Hint = ''
      DataField = 'Code'
      DataSource = DSArticle
      AutoSize = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object UniDBText2: TUniDBText
      Left = 94
      Top = 9
      Width = 219
      Height = 15
      Hint = ''
      DataField = 'Description'
      DataSource = DSArticle
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object UniDBText3: TUniDBText
      Left = 319
      Top = 9
      Width = 50
      Height = 15
      Hint = ''
      DataField = 'UM'
      DataSource = DSArticle
      AutoSize = False
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object UniLabel1: TUniLabel
      Left = 5
      Top = 35
      Width = 65
      Height = 15
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cost'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      TabOrder = 6
    end
    object UniDBText4: TUniDBText
      Left = 5
      Top = 63
      Width = 65
      Height = 15
      Hint = ''
      DataField = 'Cost'
      DataSource = DSArticle
      AutoSize = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object UniLabel2: TUniLabel
      Left = 306
      Top = 35
      Width = 63
      Height = 15
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Qty'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      TabOrder = 8
    end
    object EditQty: TUniDBNumberEdit
      Left = 306
      Top = 51
      Width = 63
      Height = 41
      Hint = ''
      DataField = 'Qty'
      DataSource = DSItem
      Alignment = taCenter
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TabOrder = 9
      DecimalSeparator = ','
    end
  end
  object MicroVMBridge: TioViewModelBridge
    Left = 35
    Top = 28
  end
  object MDSArticle: TioModelDataSet
    ViewModelBridge = MicroVMBridge
    ModelPresenter = 'MPBOMArticle'
    Left = 197
    Top = 12
    object MDSArticleCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSArticleDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object MDSArticleUM: TStringField
      FieldName = 'UM'
      Size = 10
    end
    object MDSArticleCost: TCurrencyField
      FieldName = 'Cost'
    end
  end
  object DSArticle: TDataSource
    DataSet = MDSArticle
    Left = 196
    Top = 52
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
  end
  object MDSItem: TioModelDataSet
    ViewModelBridge = MicroVMBridge
    ModelPresenter = 'MPBOMItem'
    Left = 109
    Top = 12
    object MDSItemQty: TFloatField
      Alignment = taCenter
      FieldName = 'Qty'
    end
  end
  object DSItem: TDataSource
    DataSet = MDSItem
    Left = 108
    Top = 52
  end
end
