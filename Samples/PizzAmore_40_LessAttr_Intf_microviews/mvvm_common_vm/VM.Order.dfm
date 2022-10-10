inherited VMOrder: TVMOrder
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'IOrder'
    OnSelectionObject = MPMasterSelectionObject
  end
  object MPRows: TioModelPresenterDetail
    MasterBindSource = MPMaster
    MasterPropertyName = 'Rows'
    Left = 64
    Top = 112
  end
  object acDeleteRow: TioVMAction
    Name = 'acDeleteRow'
    OnExecute = acDeleteRowExecute
    Left = 328
    Top = 48
  end
  object acShowPizzaSelector: TioVMAction
    Name = 'acShowPizzaSelector'
    OnExecute = acShowPizzaSelectorExecute
    Left = 328
    Top = 176
  end
end
