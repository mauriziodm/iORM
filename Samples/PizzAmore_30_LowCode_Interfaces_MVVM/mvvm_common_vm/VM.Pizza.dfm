inherited VMPizza: TVMPizza
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IPizza'
  end
  inherited acPersist: TioVMActionBSPersistencePersist
    Left = 168
  end
  inherited acBack: TioVMActionBSCloseQuery
    Left = 168
  end
  inherited acRevert: TioVMActionBSPersistenceRevertOrDelete
    Left = 168
  end
  inherited acShowETM: TioVMActionBSShowOrSelect
    Left = 168
  end
  object BSIngredients: TioModelPresenterDetail
    MasterBindSource = BSMaster
    MasterPropertyName = 'Ingredients'
    OnReceiveSelectionInterface = BSIngredientsReceiveSelectionInterface
    Left = 48
    Top = 337
  end
  object acShowIngredientSelector: TioVMActionBSShowOrSelect
    Action_ParentCloseQueryAction = acBack
    EntityTypeName = 'IIngredient'
    ShowMode = smEntityTypeNameAsSelector
    TargetBindSource = BSIngredients
    ViewContextBy = vcByDefaultViewContextProvider
    Left = 168
    Top = 400
  end
  object acDeleteIngredient: TioVMActionBSDelete
    TargetBindSource = BSIngredients
    Left = 168
    Top = 336
  end
end
