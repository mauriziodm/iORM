object MaterialView: TMaterialView
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  DesignSize = (
    451
    305)
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = 16244682
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      451
      37)
    object ButtonClose: TSpeedButton
      Left = 4
      Top = 3
      Width = 53
      Height = 30
      Caption = 'Close'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 98
      Top = 8
      Width = 233
      Height = 17
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ArticleType'
      DataSource = DSArticle
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object ButtonPost: TcxButton
      Left = 368
      Top = 6
      Width = 73
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Post'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 136
    Top = 64
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'Code'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 300
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 65
    AutoSize = False
    Caption = 'Code'
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
  object cxLabel2: TcxLabel
    Left = 10
    Top = 105
    AutoSize = False
    Caption = 'Description'
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
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 136
    Top = 104
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'Description'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 300
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 145
    AutoSize = False
    Caption = 'U.M.'
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
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 136
    Top = 144
    DataBinding.DataField = 'UM'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 97
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 185
    AutoSize = False
    Caption = 'Cost'
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
  object cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Left = 136
    Top = 184
    DataBinding.DataField = 'Cost'
    DataBinding.DataSource = DSArticle
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI Semibold'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 8
    Width = 97
  end
  object MDSArticle: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPArticle'
    Left = 368
    Top = 96
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
  object VMBridge: TioViewModelBridge
    Left = 368
    Top = 40
  end
  object DSArticle: TDataSource
    DataSet = MDSArticle
    Left = 304
    Top = 96
  end
end
