object StartForm: TStartForm
  Left = 0
  Top = 0
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 562
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object VMBridge: TioViewModelBridge
    DI_VMInterface = 'IVMStart'
    Left = 84
    Top = 438
  end
  object ActionList1: TActionList
    Left = 188
    Top = 438
    object acQuit: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Quit'
      Enabled = True
      Visible = True
      VMActionName = 'acQuit'
    end
    object acShowOrders: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Orders'
      Enabled = True
      Visible = True
      VMActionName = 'acShowOrders'
    end
    object acShowCustomers: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Customers'
      Enabled = True
      Visible = True
      VMActionName = 'acShowCustomers'
    end
    object acShowPizzas: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Pizzas'
      Enabled = True
      Visible = True
      VMActionName = 'acShowPizzas'
    end
  end
  object VCProviderForm: TioViewContextProvider
    AsDefault = True
    OnAfterRequest = VCProviderFormAfterRequest
    OnRelease = VCProviderFormRelease
    OnRequest = VCProviderFormRequest
    Left = 292
    Top = 438
  end
end
