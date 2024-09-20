inherited ViewWhereOrderHistory: TViewWhereOrderHistory
  TextHeight = 15
  inherited BSMaster: TioModelDataSet
    object BSMasterOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSMasterFromDate: TDateField
      FieldName = 'FromDate'
    end
    object BSMasterToDate: TDateField
      FieldName = 'ToDate'
    end
  end
end
