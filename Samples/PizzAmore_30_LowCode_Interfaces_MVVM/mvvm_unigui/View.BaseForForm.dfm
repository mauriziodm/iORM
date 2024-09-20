object ViewBaseForForm: TViewBaseForForm
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object BSSource: TDataSource
    DataSet = BSMaster
    Left = 384
    Top = 168
  end
  object ActionList1: TActionList
    Left = 480
    Top = 112
    object acBack: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Back'
      Enabled = True
      Visible = True
      VMActionName = 'acBack'
    end
    object acPersist: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Persist'
      Enabled = True
      Visible = True
      VMActionName = 'acPersist'
    end
    object acRevert: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Revert'
      Enabled = True
      Visible = True
      VMActionName = 'acRevert'
    end
  end
  object BSMaster: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BSMaster'
    Left = 384
    Top = 112
  end
  object VMBridge: TioViewModelBridge
    Left = 482
    Top = 170
  end
end
