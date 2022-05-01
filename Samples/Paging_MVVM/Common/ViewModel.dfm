object VM: TVM
  OnViewPairing = ioViewModelViewPairing
  Height = 201
  Width = 389
  PixelsPerInch = 96
  object MPArticles: TioModelPresenterMaster
    AsDefault = True
    TypeName = 'TArticle'
    Paging.PageSize = 10
    Paging.PagingType = ptHardPaging
    Left = 144
    Top = 56
  end
end
