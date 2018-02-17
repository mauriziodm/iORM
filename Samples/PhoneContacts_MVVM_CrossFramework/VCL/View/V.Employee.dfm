inherited ViewEmployee: TViewEmployee
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Caption = 'Edit employee'
    end
  end
  inherited Panel3: TPanel
    Top = 196
    Height = 73
    ExplicitTop = 196
    ExplicitHeight = 73
    inherited StringGrid1: TStringGrid
      Height = 10
      ExplicitHeight = 10
    end
    inherited BindNavigator1: TBindNavigator
      Top = 42
      Hints.Strings = ()
      ExplicitTop = 42
    end
  end
  inherited Panel4: TPanel
    Height = 155
    ExplicitHeight = 155
    object EditBranchOffice: TLabeledEdit
      Left = 100
      Top = 116
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 63
      EditLabel.Height = 13
      EditLabel.Caption = 'Branch office'
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
        Name = 'BranchOffice'
        Generator = 'BitmapNames'
        ReadOnly = False
      end>
  end
  inherited BindingsList1: TBindingsList
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'BranchOffice'
      Control = EditBranchOffice
      Track = True
    end
  end
end
