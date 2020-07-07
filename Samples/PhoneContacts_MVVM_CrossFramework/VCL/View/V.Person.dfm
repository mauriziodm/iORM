object ViewPerson: TViewPerson
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 37
      Align = alLeft
      Caption = '<- Back'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 34
    end
    object ButtonPost: TSpeedButton
      Left = 377
      Top = 0
      Width = 70
      Height = 37
      Align = alRight
      Caption = 'Post'
      ExplicitLeft = 375
      ExplicitTop = 1
      ExplicitHeight = 34
    end
    object Label1: TLabel
      Left = 70
      Top = 0
      Width = 307
      Height = 37
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Edit person'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 88
      ExplicitTop = 1
      ExplicitWidth = 269
      ExplicitHeight = 32
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 451
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      451
      36)
    object EditClassName: TLabeledEdit
      Left = 100
      Top = 8
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'CLASS NAME'
      Enabled = False
      LabelPosition = lpLeft
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
      Text = 'Mark Anderson'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 182
    Width = 451
    Height = 87
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      451
      87)
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 451
      Height = 22
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Phone numbers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 542
    end
    object StringGrid1: TStringGrid
      Tag = 2
      Left = 11
      Top = 25
      Width = 427
      Height = 25
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 2
      FixedCols = 0
      RowCount = 201
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      ColWidths = (
        120
        300)
      ColAligments = (
        0
        0)
    end
    object BindNavigator1: TBindNavigator
      Left = 326
      Top = 56
      Width = 110
      Height = 25
      DataSource = PhonesModelBindSource
      VisibleButtons = [nbPrior, nbNext, nbDelete, nbPost, nbCancel]
      Anchors = [akRight, akBottom]
      Orientation = orHorizontal
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 451
    Height = 141
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      451
      141)
    object EditID: TLabeledEdit
      Left = 100
      Top = 16
      Width = 57
      Height = 19
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'ID'
      LabelPosition = lpLeft
      ParentCtl3D = False
      TabOrder = 0
      Text = '-33'
    end
    object EditFirstName: TLabeledEdit
      Left = 100
      Top = 49
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = 'First name'
      LabelPosition = lpLeft
      ParentCtl3D = False
      TabOrder = 1
      Text = 'Mark Anderson'
    end
    object EditLastName: TLabeledEdit
      Left = 100
      Top = 74
      Width = 338
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Ctl3D = False
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Last name'
      LabelPosition = lpLeft
      ParentCtl3D = False
      TabOrder = 2
      Text = 'Mark Anderson'
    end
  end
  object VMBridge: TioViewModelBridge
    Left = 145
    Top = 160
  end
  object PersonModelBindSource: TioModelBindSource
    AutoActivate = True
    AutoPost = False
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
      end>
    ScopeMappings = <>
    ViewModelBridge = VMBridge
    ModelPresenter = 'PersonModelPresenter'
    Left = 144
    Top = 216
  end
  object PhonesModelBindSource: TioModelBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'PhoneType'
        Generator = 'ColorsNames'
        ReadOnly = False
      end
      item
        Name = 'PhoneNumber'
        Generator = 'BitmapNames'
        ReadOnly = False
      end>
    ScopeMappings = <>
    ViewModelBridge = VMBridge
    ModelPresenter = 'PhonesModelPresenter'
    Left = 144
    Top = 267
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 268
    Top = 53
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'ID'
      Control = EditID
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'FirstName'
      Control = EditFirstName
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'LastName'
      Control = EditLastName
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = PersonModelBindSource
      FieldName = 'ClassNameProp'
      Control = EditClassName
      Track = True
    end
    object LinkGridToDataSourcePhonesModelBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = PhonesModelBindSource
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'PhoneType'
          Header = 'Type'
          Width = 120
        end
        item
          MemberName = 'PhoneNumber'
          Header = 'Number'
          Width = 300
        end>
    end
  end
end
