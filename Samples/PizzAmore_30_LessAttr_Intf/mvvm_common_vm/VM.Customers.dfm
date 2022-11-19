inherited VMCustomers: TVMCustomers
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Paging.PagingType = ptHardPaging
  end
  object acNextPage: TioVMActionBSNextPage
    Name = 'acNextPage'
    TargetBindSource = BSMaster
    Left = 384
    Top = 48
  end
  object acPrevPage: TioVMActionBSPrevPage
    Name = 'acPrevPage'
    TargetBindSource = BSMaster
    Left = 384
    Top = 104
  end
  object acSetDataObject: TioVMAction
    Name = 'acSetDataObject'
    OnExecute = acSetDataObjectExecute
    Left = 384
    Top = 176
  end
end
