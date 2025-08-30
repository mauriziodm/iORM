inherited VMCustomerList: TVMCustomerList
  Height = 500
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'ICustomer'
    AsyncLoad = True
    AsyncPersist = True
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 25
    Paging.PagingType = ptHardPaging
  end
  inherited BSWhere: TioModelPresenterMaster
    TypeName = 'ICustomer'
  end
  inherited acAppend: TioVMActionBSAppend
    OnNewInstanceAsInterface = acAddNewInstanceAsInterface
  end
  object acNextPage: TioVMActionBSNextPage
    TargetBindSource = BSMaster
    Left = 144
    Top = 368
  end
  object acPrevPage: TioVMActionBSPrevPage
    TargetBindSource = BSMaster
    Left = 144
    Top = 432
  end
end
