inherited ViewOrders: TViewOrders
  OnCreate = UniFrameCreate
  TextHeight = 15
  inherited ActionList1: TActionList
    object acWhereShowHistory: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'History'
      Enabled = True
      Visible = True
      VMActionName = 'acWhereShowHistory'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterCustomerName: TStringField
      FieldName = 'Customer.Name'
      Size = 100
    end
    object BSMasterGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
  end
  inherited BSWhere: TioModelDataSet
    Top = 418
    object BSWhereOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object BSWhereOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSWhereNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSWhereFromDate: TDateField
      FieldName = 'FromDate'
    end
    object BSWhereToDate: TDateField
      FieldName = 'ToDate'
    end
  end
  inherited SourceWhere: TDataSource
    Top = 418
  end
end
