object ViewBaseForForm: TViewBaseForForm
  Left = 0
  Top = 0
  Width = 799
  Height = 600
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PanelTop: TPanel
      Left = 0
      Top = 0
      Width = 799
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = clNavy
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        799
        40)
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
        Left = 56
        Top = 7
        Width = 690
        Height = 21
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 689
      end
    end
    object PanelBottom: TPanel
      Left = 0
      Top = 560
      Width = 799
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      Color = clMenu
      ParentBackground = False
      TabOrder = 1
      object ButtonRevert: TSpeedButton
        Left = 0
        Top = 0
        Width = 50
        Height = 40
        Action = acRevert
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 334
        ExplicitTop = -6
      end
      object ButtonPersist: TSpeedButton
        Left = 749
        Top = 0
        Width = 50
        Height = 40
        Action = acPersist
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 334
        ExplicitTop = -6
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
end
