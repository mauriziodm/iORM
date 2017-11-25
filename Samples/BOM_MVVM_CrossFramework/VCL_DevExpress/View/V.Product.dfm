inherited ProductView: TProductView
  inherited cxDBTextEdit1: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 7
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
    TabOrder = 9
  end
  inherited cxLabel3: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit3: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 14
  end
  inherited cxLabel4: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  object cxLabel7: TcxLabel [8]
    Left = 235
    Top = 185
    AutoSize = False
    Caption = 'Materials cost'
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
    Width = 96
    AnchorX = 331
  end
  object cxDBCurrencyEdit2: TcxDBCurrencyEdit [9]
    Left = 339
    Top = 184
    DataBinding.DataField = 'MaterialCost'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 97
  end
  object cxLabel8: TcxLabel [10]
    Left = 235
    Top = 225
    AutoSize = False
    Caption = 'Processes cost'
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
    Width = 96
    AnchorX = 331
  end
  object cxDBCurrencyEdit3: TcxDBCurrencyEdit [11]
    Left = 339
    Top = 224
    DataBinding.DataField = 'ProcessCost'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 97
  end
  inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Style.IsFontAssigned = True
    TabOrder = 2
  end
  inherited cxLabel6: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit4: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 3
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleMaterialCost: TCurrencyField [5]
      FieldName = 'MaterialCost'
    end
    object MDSArticleProcessCost: TCurrencyField [6]
      FieldName = 'ProcessCost'
    end
  end
end
