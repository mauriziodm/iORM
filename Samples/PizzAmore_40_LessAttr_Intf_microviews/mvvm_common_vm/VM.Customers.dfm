inherited VMCustomers: TVMCustomers
  Width = 541
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'IGenericCustomer'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Paging.PagingType = ptHardPaging
  end
  object acNextPage: TioVMActionBSNextPage
    Name = 'acNextPage'
    TargetBindSource = BSMaster
    Left = 312
    Top = 48
  end
  object acPrevPage: TioVMActionBSPrevPage
    Name = 'acPrevPage'
    TargetBindSource = BSMaster
    Left = 312
    Top = 112
  end
end
