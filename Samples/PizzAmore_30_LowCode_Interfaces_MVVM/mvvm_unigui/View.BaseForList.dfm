object ViewBaseForList: TViewBaseForList
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  Color = clMenu
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object PanelTop: TUniPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 40
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = clNavy
    object ButtonBack: TUniSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      ParentFont = False
      Font.Color = clNavy
      Font.Height = -13
      ParentColor = False
      TabOrder = 1
    end
    object ButtonSelect: TUniSpeedButton
      Left = 750
      Top = 0
      Width = 50
      Height = 40
      Action = acShowOrSelect
      Align = alRight
      ParentFont = False
      Font.Color = clNavy
      Font.Height = -13
      ParentColor = False
      TabOrder = 2
    end
    object LabelTitle: TUniLabel
      Left = 50
      Top = 0
      Width = 700
      Height = 40
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Title'
      Align = alClient
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWhite
      TabOrder = 3
    end
  end
  object PanelBottom: TUniPanel
    Left = 0
    Top = 560
    Width = 800
    Height = 40
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    Color = clMenu
    object ButtonDelete: TUniSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acDelete
      Align = alLeft
      ParentFont = False
      Font.Color = clRed
      Font.Height = -13
      ParentColor = False
      TabOrder = 1
    end
    object ButtonAdd: TUniSpeedButton
      Left = 740
      Top = 0
      Width = 60
      Height = 40
      Action = acAdd
      Align = alRight
      ParentFont = False
      Font.Color = clGreen
      Font.Height = -13
      Font.Style = [fsBold]
      ParentColor = False
      TabOrder = 2
    end
  end
  object PanelWhere: TUniPanel
    Left = 0
    Top = 480
    Width = 800
    Height = 80
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
    Color = clMenu
    object PanelWhereButtons: TUniPanel
      Left = 740
      Top = 0
      Width = 60
      Height = 80
      Hint = ''
      Align = alRight
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object ButtonSearch: TUniSpeedButton
        Left = 0
        Top = 0
        Width = 60
        Height = 40
        Action = acBuildWhere
        Align = alTop
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        Font.Style = [fsBold]
        ParentColor = False
        TabOrder = 1
      end
      object ButtonClear: TUniSpeedButton
        Left = 0
        Top = 40
        Width = 60
        Height = 40
        Action = acClearWhere
        Align = alBottom
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        TabOrder = 2
      end
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
