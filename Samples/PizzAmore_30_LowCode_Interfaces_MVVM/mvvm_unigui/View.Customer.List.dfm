inherited ViewCustomers: TViewCustomers
  TextHeight = 15
  inherited ActionList1: TActionList
    object acNextPage: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Pg.Up'
      Enabled = True
      Visible = True
      VMActionName = 'acNextPage'
    end
    object acPrevPage: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Pg.Dn'
      Enabled = True
      Visible = True
      VMActionName = 'acPrevPage'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
    object BSMasterPagingCurrentPageOf: TStringField
      Alignment = taCenter
      FieldName = '%Paging.CurrentPageOf'
      Size = 100
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
    object BSWhereCity: TStringField
      FieldName = 'City'
      Size = 100
    end
  end
end
