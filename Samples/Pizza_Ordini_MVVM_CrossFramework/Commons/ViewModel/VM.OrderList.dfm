inherited OrderListVM: TOrderListVM
  OldCreateOrder = True
  object MPOrderList: TioModelPresenter
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'TOrder'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 40
    Top = 24
  end
  object ActionList1: TActionList
    Left = 160
    Top = 24
    object acBack: TAction
      Text = 'acBack'
      OnExecute = acBackExecute
    end
    object acEditOrder: TAction
      Text = 'acEditOrder'
      OnExecute = acEditOrderExecute
    end
  end
end
