object MaterialView: TMaterialView
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  DesignSize = (
    451
    305)
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 37
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 14585439
    DesignSize = (
      451
      37)
    object ButtonClose: TUniSpeedButton
      Left = 8
      Top = 6
      Width = 58
      Height = 25
      Hint = ''
      Caption = 'Close'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWindow
      TabOrder = 1
    end
    object ButtonPost: TUniSpeedButton
      Left = 386
      Top = 6
      Width = 58
      Height = 25
      Hint = ''
      Caption = 'Post'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
    object UniDBText1: TUniDBText
      Left = 98
      Top = 6
      Width = 259
      Height = 21
      Hint = ''
      DataField = 'ArticleType'
      DataSource = DSArticle
      Alignment = taCenter
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
  end
  object UniLabel1: TUniLabel
    Left = 10
    Top = 65
    Width = 118
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Code'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 10
    Top = 105
    Width = 118
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Description'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 2
  end
  object UniLabel3: TUniLabel
    Left = 10
    Top = 145
    Width = 118
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'U.M.'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 3
  end
  object UniLabel4: TUniLabel
    Left = 10
    Top = 185
    Width = 118
    Height = 17
    Hint = ''
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cost'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    TabOrder = 4
  end
  object UniDBEdit1: TUniDBEdit
    Left = 144
    Top = 63
    Width = 289
    Height = 23
    Hint = ''
    DataField = 'Code'
    DataSource = DSArticle
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 5
  end
  object UniDBEdit2: TUniDBEdit
    Left = 144
    Top = 104
    Width = 289
    Height = 23
    Hint = ''
    DataField = 'Description'
    DataSource = DSArticle
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 6
  end
  object UniDBEdit3: TUniDBEdit
    Left = 144
    Top = 144
    Width = 80
    Height = 23
    Hint = ''
    DataField = 'UM'
    DataSource = DSArticle
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 7
  end
  object UniDBEdit4: TUniDBEdit
    Left = 144
    Top = 184
    Width = 80
    Height = 23
    Hint = ''
    DataField = 'Cost'
    DataSource = DSArticle
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    TabOrder = 8
  end
  object VMBridge: TioViewModelBridge
    Left = 308
    Top = 48
  end
  object MDSArticle: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPArticle'
    Left = 308
    Top = 104
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
    object MDSArticleArticleType: TStringField
      FieldName = 'ArticleType'
      Size = 30
    end
  end
  object DSArticle: TDataSource
    DataSet = MDSArticle
    Left = 244
    Top = 104
  end
end
