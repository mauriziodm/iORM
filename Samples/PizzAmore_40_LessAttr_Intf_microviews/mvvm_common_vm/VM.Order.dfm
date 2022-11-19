inherited VMOrder: TVMOrder
  Width = 453
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'TOrder'
    OnSelectionInterface = MPMasterSelectionInterface
  end
  object BSRows: TioModelPresenterDetail
    MasterBindSource = BSMaster
    MasterPropertyName = 'Rows'
    Left = 56
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
