inherited ViewVipCustomer: TViewVipCustomer
  inherited UniPanel1: TUniPanel
    inherited UniLabel6: TUniLabel
      Caption = 'Edit VIP customer'
    end
  end
  inherited UniPanel2: TUniPanel
    object UniLabel8: TUniLabel
      Left = 10
      Top = 151
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'VIP card code'
      TabOrder = 9
    end
    object UniDBEdit6: TUniDBEdit
      Left = 107
      Top = 148
      Width = 332
      Height = 22
      Hint = ''
      DataField = 'VipCardCode'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
    end
  end
  inherited PersonModelDataSet: TioModelDataSet
    object PersonModelDataSetVipCardCode: TStringField
      FieldName = 'VipCardCode'
      Size = 100
    end
  end
end
