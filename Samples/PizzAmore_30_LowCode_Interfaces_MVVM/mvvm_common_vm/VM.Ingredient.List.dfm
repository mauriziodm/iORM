inherited VMIngredientList: TVMIngredientList
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IIngredient'
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'IIngredient'
  end
  inherited acAppend: TioVMActionBSAppend
    OnNewInstanceAsInterface = acAppendNewInstanceAsInterface
  end
end
