inherited VMOrder: TVMOrder
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    OnSelectionObject = MPMasterSelectionObject
  end
  object MPRows: TioModelPresenterDetail
    MasterBindSource = MPMaster
    MasterPropertyName = 'Rows'
    Left = 56
    Top = 112
  end
  object acShowPizzaSelector: TioVMAction
    Name = 'acShowPizzaSelector'
    OnExecute = acShowPizzaSelectorExecute
    Left = 328
    Top = 176
  end
end
