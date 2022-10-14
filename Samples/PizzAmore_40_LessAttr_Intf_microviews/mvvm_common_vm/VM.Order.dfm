inherited VMOrder: TVMOrder
  Width = 453
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
  object acAddCustomPizza: TioVMAction
    Name = 'acAddCustomPizza'
    OnExecute = acAddCustomPizzaExecute
    Left = 344
    Top = 40
  end
  object acAddPizza: TioVMAction
    Name = 'acAddPizza'
    OnExecute = acAddPizzaExecute
    Left = 344
    Top = 112
  end
end
