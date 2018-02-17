inherited ViewCustomer: TViewCustomer
  inherited UniPanel1: TUniPanel
    inherited UniLabel6: TUniLabel
      Caption = 'Edit customer'
    end
  end
  inherited UniPanel2: TUniPanel
    object UniLabel7: TUniLabel
      Left = 10
      Top = 123
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fidelity card code'
      TabOrder = 7
    end
    object UniDBEdit5: TUniDBEdit
      Left = 107
      Top = 120
      Width = 332
      Height = 22
      Hint = ''
      DataField = 'FidelityCardCode'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
  end
  inherited PersonModelDataSet: TioModelDataSet
    object PersonModelDataSetFidelityCardCode: TStringField
      FieldName = 'FidelityCardCode'
      Size = 100
    end
  end
end
