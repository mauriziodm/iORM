inherited MicroProcessView: TMicroProcessView
  inherited ClientArea: TUniPanel
    object UniLabel3: TUniLabel [7]
      Left = 76
      Top = 35
      Width = 65
      Height = 15
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time (min)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      TabOrder = 9
    end
    object UniDBText5: TUniDBText [8]
      Left = 76
      Top = 63
      Width = 65
      Height = 15
      Hint = ''
      DataField = 'Time'
      DataSource = DSArticle
      AutoSize = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    inherited EditQty: TUniDBNumberEdit
      TabOrder = 11
    end
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleTime: TIntegerField
      FieldName = 'Time'
    end
  end
end
