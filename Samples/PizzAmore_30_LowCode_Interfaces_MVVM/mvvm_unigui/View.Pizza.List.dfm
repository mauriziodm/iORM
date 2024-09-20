inherited ViewPizzas: TViewPizzas
  TextHeight = 15
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BSMasterImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  inherited BSWhere: TioModelDataSet
    object BSWhereID: TIntegerField
      FieldName = 'ID'
    end
    object BSWhereName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSWhereFromPrice: TCurrencyField
      FieldName = 'FromPrice'
    end
    object BSWhereToPrice: TCurrencyField
      FieldName = 'ToPrice'
    end
  end
end
