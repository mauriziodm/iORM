inherited VMCustomers: TVMCustomers
  Width = 541
  inherited MPMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Paging.PagingType = ptHardPaging
  end
  object acNextPage: TioVMActionBSNextPage
    Name = 'acNextPage'
    TargetBindSource = MPMaster
    Left = 232
    Top = 16
  end
  object acPrevPage: TioVMActionBSPrevPage
    Name = 'acPrevPage'
    TargetBindSource = MPMaster
    Left = 232
    Top = 80
  end
end
