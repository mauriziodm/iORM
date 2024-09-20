object ViewBaseForList: TViewBaseForList
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 788
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
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
