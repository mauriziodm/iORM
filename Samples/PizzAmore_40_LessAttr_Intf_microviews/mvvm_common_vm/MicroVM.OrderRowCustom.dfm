object MicroVMOrderRowCustom: TMicroVMOrderRowCustom
  Height = 304
  Width = 414
  object BSOrderRow: TioModelPresenterDetail
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
end
