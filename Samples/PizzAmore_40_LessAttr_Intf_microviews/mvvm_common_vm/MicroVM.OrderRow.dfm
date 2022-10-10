object MicroVMOrderRows: TMicroVMOrderRows
  Height = 304
  Width = 414
  object MPOrderRow: TioModelPresenterDetail
    AsDefault = True
    TypeOfCollection = tcSingleObject
    Left = 72
    Top = 24
  end
  object acRefresh: TioVMAction
    Name = 'acRefresh'
    Caption = 'Refresh'
    OnExecute = acRefreshExecute
    Left = 176
    Top = 56
  end
end
