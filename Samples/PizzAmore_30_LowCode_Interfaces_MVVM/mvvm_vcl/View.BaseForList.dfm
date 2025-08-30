object ViewBaseForList: TViewBaseForList
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object ButtonSelect: TSpeedButton
      Left = 730
      Top = 0
      Width = 70
      Height = 40
      Action = acShowOrSelect
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 740
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 70
      Top = 0
      Width = 660
      Height = 40
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 76
      ExplicitTop = -2
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 560
    Width = 800
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonAdd: TSpeedButton
      Left = 730
      Top = 0
      Width = 70
      Height = 40
      Action = acAppend
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 740
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PanelWhere: TPanel
    Left = 0
    Top = 481
    Width = 800
    Height = 79
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      800
      79)
    object ButtonSearch: TSpeedButton
      Left = 730
      Top = 0
      Width = 70
      Height = 45
      Action = acBuildWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonClear: TSpeedButton
      Left = 730
      Top = 51
      Width = 70
      Height = 25
      Action = acClearWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Left = 235
    Top = 75
    object acAppend: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Add'
      Enabled = True
      Visible = True
      VMActionName = 'acAppend'
    end
    object acBack: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Back'
      Enabled = True
      Visible = True
      VMActionName = 'acBack'
    end
    object acBuildWhere: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Search'
      Enabled = True
      Visible = True
      VMActionName = 'acBuildWhere'
    end
    object acClearWhere: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Clear'
      Enabled = True
      Visible = True
      VMActionName = 'acClearWhere'
    end
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
    object acShowOrSelect: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Select'
      Enabled = True
      Visible = True
      VMActionName = 'acShowOrSelect'
    end
  end
  object BSMaster: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSMaster'
    Left = 235
    Top = 186
  end
  object VMBridge: TioViewModelBridge
    Left = 234
    Top = 130
  end
  object SourceMaster: TDataSource
    DataSet = BSMaster
    Left = 318
    Top = 186
  end
  object BSWhere: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSWhere'
    Left = 235
    Top = 338
  end
  object SourceWhere: TDataSource
    DataSet = BSWhere
    Left = 318
    Top = 338
  end
end
