object MicroVMOrderRows: TMicroVMOrderRows
  Height = 304
  Width = 414
  object MPOrderRow: TioModelPresenterMaster
    AsDefault = True
    TypeName = 'IOrderRow'
    LoadType = ltFromBSAsIs
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 48
    Top = 24
  end
end
