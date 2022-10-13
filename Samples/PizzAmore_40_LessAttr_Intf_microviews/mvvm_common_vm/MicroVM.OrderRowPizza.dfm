object MicroVMOrderRowPizza: TMicroVMOrderRowPizza
  Height = 304
  Width = 414
  object MPOrderRow: TioModelPresenterDetail
    AsDefault = True
    TypeOfCollection = tcSingleObject
    Left = 72
    Top = 24
  end
  object acDelete: TioVMAction
    Name = 'acDelete'
    OnExecute = acDeleteExecute
    Left = 224
    Top = 24
  end
  object acShow: TioVMAction
    Name = 'acShow'
    OnExecute = acShowExecute
    Left = 224
    Top = 104
  end
  object MPPizza: TioModelPresenterDetail
    MasterBindSource = MPOrderRow
    MasterPropertyName = 'Pizza'
    TypeOfCollection = tcSingleObject
    Left = 72
    Top = 96
  end
end
