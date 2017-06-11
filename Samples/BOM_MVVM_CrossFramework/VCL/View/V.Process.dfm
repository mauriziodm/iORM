inherited ProcessView: TProcessView
  inherited cxDBTextEdit1: TcxDBTextEdit
    Style.IsFontAssigned = True
  end
  inherited cxLabel1: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxLabel2: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit2: TcxDBTextEdit
    Style.IsFontAssigned = True
  end
  inherited cxLabel3: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit3: TcxDBTextEdit
    Style.IsFontAssigned = True
  end
  inherited cxLabel4: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Style.IsFontAssigned = True
  end
  object cxLabel6: TcxLabel [9]
    Left = 10
    Top = 225
    AutoSize = False
    Caption = 'Time (minutes)'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    Transparent = True
    Height = 21
    Width = 118
    AnchorX = 128
  end
  object cxDBTextEdit4: TcxDBTextEdit [10]
    Left = 136
    Top = 224
    DataBinding.DataField = 'Time'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 10
    Width = 97
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleTime: TIntegerField [4]
      FieldName = 'Time'
    end
  end
end
