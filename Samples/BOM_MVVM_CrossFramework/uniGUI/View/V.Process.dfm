inherited ProcessView: TProcessView
  inherited UniDBEdit1: TUniDBEdit
    TabOrder = 7
  end
  inherited UniDBEdit2: TUniDBEdit
    TabOrder = 8
  end
  object UniLabel5: TUniLabel [7]
    Left = 10
    Top = 225
    Width = 118
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Time (minutes)'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 5
  end
  object UniDBEdit5: TUniDBEdit [8]
    Left = 144
    Top = 225
    Width = 80
    Height = 23
    Hint = ''
    DataField = 'Time'
    DataSource = DSArticle
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 6
  end
  inherited UniDBEdit3: TUniDBEdit
    TabOrder = 9
  end
  inherited UniDBEdit4: TUniDBEdit
    TabOrder = 10
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleTime: TIntegerField
      FieldName = 'Time'
    end
  end
end
