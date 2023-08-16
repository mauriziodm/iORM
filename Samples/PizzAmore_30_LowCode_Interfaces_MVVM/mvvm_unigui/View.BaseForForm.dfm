object ViewBaseForForm: TViewBaseForForm
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  TabOrder = 0
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
    object LabelTitle: TUniLabel
      Left = 50
      Top = 0
      Width = 750
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
      TabOrder = 2
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
      Action = acRevert
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
      Action = acPersist
      Align = alRight
      ParentFont = False
      Font.Color = clGreen
      Font.Height = -13
      Font.Style = [fsBold]
      ParentColor = False
      TabOrder = 2
    end
  end
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
