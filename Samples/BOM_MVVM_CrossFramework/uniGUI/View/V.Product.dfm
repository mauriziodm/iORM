inherited ProductView: TProductView
  inherited UniDBEdit1: TUniDBEdit
    TabOrder = 14
  end
  inherited UniDBEdit2: TUniDBEdit
    TabOrder = 13
  end
  object UniLabel6: TUniLabel [7]
    Left = 230
    Top = 185
    Width = 107
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Materials cost'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 6
  end
  object UniDBEdit6: TUniDBEdit [8]
    Left = 353
    Top = 184
    Width = 80
    Height = 23
    Hint = ''
    DataField = 'MaterialCost'
    DataSource = DSArticle
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 7
  end
  object UniLabel7: TUniLabel [9]
    Left = 230
    Top = 226
    Width = 107
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Processes cost'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 8
  end
  object UniDBEdit7: TUniDBEdit [10]
    Left = 353
    Top = 225
    Width = 80
    Height = 23
    Hint = ''
    DataField = 'ProcessCost'
    DataSource = DSArticle
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 9
  end
  inherited UniDBEdit5: TUniDBEdit
    TabOrder = 11
  end
  inherited UniDBEdit3: TUniDBEdit
    TabOrder = 12
  end
  object UniScrollBox1: TUniScrollBox [15]
    Left = 16
    Top = 262
    Width = 417
    Height = 27
    Hint = ''
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 15
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleMaterialCost: TCurrencyField
      FieldName = 'MaterialCost'
    end
    object MDSArticleProcessCost: TCurrencyField
      FieldName = 'ProcessCost'
    end
  end
  object BOMVCProvider: TioViewContextProvider
    OnAfterRequest = BOMVCProviderAfterRequest
    OnRelease = BOMVCProviderRelease
    OnRequest = BOMVCProviderRequest
    RegisterAsDefault = False
    Left = 242
    Top = 52
  end
end
