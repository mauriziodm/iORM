inherited VMCustomerList: TVMCustomerList
  Height = 500
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Paging.PagingType = ptHardPaging
  end
  inherited acAdd: TioVMActionBSPersistenceAppend
    EntityTypeName = 'ICustomer'
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  object acNextPage: TioVMActionBSNextPage [7]
    Name = 'acNextPage'
    TargetBindSource = BSMaster
    Left = 160
    Top = 368
  end
  object acPrevPage: TioVMActionBSPrevPage [8]
    Name = 'acPrevPage'
    TargetBindSource = BSMaster
    Left = 160
    Top = 432
  end
end
