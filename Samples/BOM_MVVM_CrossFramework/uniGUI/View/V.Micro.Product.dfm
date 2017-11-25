inherited MicroProductView: TMicroProductView
  inherited ClientArea: TUniPanel
    object UniLabel4: TUniLabel [9]
      Left = 147
      Top = 35
      Width = 65
      Height = 15
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Mat.cost'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      TabOrder = 11
    end
    object UniLabel5: TUniLabel [10]
      Left = 218
      Top = 35
      Width = 65
      Height = 15
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Proc.cost'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      TabOrder = 12
    end
    object UniDBText6: TUniDBText [11]
      Left = 147
      Top = 63
      Width = 65
      Height = 15
      Hint = ''
      DataField = 'MaterialCost'
      DataSource = DSArticle
      AutoSize = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object UniDBText7: TUniDBText [12]
      Left = 218
      Top = 63
      Width = 65
      Height = 15
      Hint = ''
      DataField = 'ProcessCost'
      DataSource = DSArticle
      AutoSize = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    inherited EditQty: TUniDBNumberEdit
      TabOrder = 15
    end
  end
  inherited MDSArticle: TioModelDataSet
    Top = 4
    object MDSArticleMaterialCost: TCurrencyField
      FieldName = 'MaterialCost'
    end
    object MDSArticleProcessCost: TCurrencyField
      FieldName = 'ProcessCost'
    end
  end
end
