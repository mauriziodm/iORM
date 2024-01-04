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
      Left = 750
      Top = 0
      Width = 50
      Height = 40
      Action = acShowOrSelect
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 756
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 50
      Top = 0
      Width = 700
      Height = 40
      Align = alClient
      Alignment = taCenter
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 34
      ExplicitHeight = 21
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
      Left = 750
      Top = 0
      Width = 50
      Height = 40
      Action = acAdd
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 264
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
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
      Left = 750
      Top = 0
      Width = 50
      Height = 45
      Action = acBuildWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonClear: TSpeedButton
      Left = 750
      Top = 51
      Width = 50
      Height = 25
      Action = acClearWhere
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Left = 203
    Top = 163
    object acBack: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Back'
      Enabled = True
      Visible = True
      VMActionName = 'acBack'
    end
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
    object acAdd: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Add'
      Enabled = True
      Visible = True
      VMActionName = 'acAdd'
    end
    object acShowOrSelect: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Select'
      Enabled = True
      Visible = True
      VMActionName = 'acShowOrSelect'
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
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object BSMaster: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSMaster'
    Left = 203
    Top = 274
  end
  object VMBridge: TioViewModelBridge
    Left = 202
    Top = 218
  end
  object SourceMaster: TDataSource
    DataSet = BSMaster
    Left = 286
    Top = 274
  end
  object BSWhere: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSWhere'
    Left = 203
    Top = 426
  end
  object SourceWhere: TDataSource
    DataSet = BSWhere
    Left = 286
    Top = 426
  end
end
