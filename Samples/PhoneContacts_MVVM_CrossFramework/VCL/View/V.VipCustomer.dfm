inherited ViewVipCustomer: TViewVipCustomer
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Caption = 'Edit VIP customer'
    end
  end
  inherited Panel3: TPanel
    Top = 211
    Height = 58
    ExplicitTop = 211
    ExplicitHeight = 58
    inherited StringGrid1: TStringGrid
      Height = 0
      ExplicitHeight = 0
    end
    inherited BindNavigator1: TBindNavigator
      Top = 27
      Hints.Strings = ()
      ExplicitTop = 27
    end
  end
  inherited Panel4: TPanel
    Height = 170
    ExplicitHeight = 170
    object EditVipCardCode: TLabeledEdit
      Left = 100
      Top = 131
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'VIP card code'
      LabelPosition = lpLeft
      ParentCtl3D = False
      TabOrder = 4
      Text = 'Bitmap28'
    end
  end
  inherited PersonModelBindSource: TioModelBindSource
    FieldDefs = <
      item
        Name = 'ID'
        FieldType = ftInteger
        Generator = 'Integers'
        ReadOnly = False
      end
      item
        Name = 'FirstName'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'LastName'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'ClassNameProp'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'FidelityCardCode'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'VipCardCode'
        Generator = 'BitmapNames'
        ReadOnly = False
      end>
  end
  inherited BindingsList1: TBindingsList
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'VipCardCode'
      Control = EditVipCardCode
      Track = True
    end
  end
end
