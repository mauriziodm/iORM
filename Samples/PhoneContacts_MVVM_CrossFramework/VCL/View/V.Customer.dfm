inherited ViewCustomer: TViewCustomer
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Caption = 'Edit customer'
    end
  end
  inherited Panel3: TPanel
    Top = 191
    Height = 78
    inherited BindNavigator1: TBindNavigator
      Hints.Strings = ()
    end
  end
  inherited Panel4: TPanel
    Height = 150
    ExplicitHeight = 150
    DesignSize = (
      451
      150)
    object EditFidelityCard: TLabeledEdit
      Left = 100
      Top = 106
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 84
      EditLabel.Height = 13
      EditLabel.Caption = 'Fidelity card code'
      LabelPosition = lpLeft
      ParentCtl3D = False
      TabOrder = 3
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
      end>
  end
  inherited BindingsList1: TBindingsList
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'FidelityCardCode'
      Control = EditFidelityCard
      Track = True
    end
  end
end
