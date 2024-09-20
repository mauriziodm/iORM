inherited ViewCustomer: TViewCustomer
  TextHeight = 15
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object BSMasterCity: TStringField
      FieldName = 'City'
      Size = 100
    end
    object BSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
  end
end
