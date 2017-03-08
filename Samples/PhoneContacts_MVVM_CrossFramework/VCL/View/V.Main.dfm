object ViewMain: TViewMain
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  DesignSize = (
    451
    305)
  object Label1: TLabel
    Left = 0
    Top = 41
    Width = 451
    Height = 16
    Align = alTop
    Alignment = taCenter
    Caption = 'Persons'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 52
  end
  object Label2: TLabel
    Left = 3
    Top = 154
    Width = 445
    Height = 24
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = 'Phone numbers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 397
    ExplicitWidth = 458
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonClearData: TSpeedButton
      Left = 0
      Top = 0
      Width = 83
      Height = 37
      Align = alLeft
      Caption = 'Clear data'
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 34
    end
    object ButtonLoadFromDB: TSpeedButton
      Left = 83
      Top = 0
      Width = 140
      Height = 37
      Align = alLeft
      Caption = 'Load from DB by code'
      ExplicitLeft = 85
      ExplicitTop = 1
      ExplicitHeight = 34
    end
    object ButtonEdit: TSpeedButton
      Left = 377
      Top = 0
      Width = 70
      Height = 37
      Align = alRight
      Caption = 'Edit  ->'
      ExplicitLeft = 376
      ExplicitTop = 1
      ExplicitHeight = 34
    end
    object ButtonRefresh: TSpeedButton
      Left = 223
      Top = 0
      Width = 70
      Height = 37
      Align = alLeft
      Caption = 'Refresh'
      ExplicitLeft = 226
      ExplicitTop = 1
      ExplicitHeight = 34
    end
  end
  object MasterGrid: TStringGrid
    Tag = 4
    Left = 6
    Top = 63
    Width = 439
    Height = 85
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    FixedCols = 0
    RowCount = 201
    TabOrder = 1
    OnDblClick = MasterGridDblClick
    ColWidths = (
      45
      180
      180
      200)
  end
  object StringGrid1: TStringGrid
    Tag = 2
    Left = 6
    Top = 173
    Width = 439
    Height = 125
    Anchors = [akLeft, akRight, akBottom]
    ColCount = 2
    FixedCols = 0
    RowCount = 201
    TabOrder = 2
    ColWidths = (
      100
      300)
  end
  object VMBridge: TioViewModelBridge
    Left = 176
    Top = 80
  end
  object PersonsModelBindSource: TioModelBindSource
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
        Name = 'FullName'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'ClassNameProp'
        Generator = 'LoremIpsum'
        ReadOnly = False
      end>
    ScopeMappings = <>
    ViewModelBridge = VMBridge
    ModelPresenter = 'PersonsModelPresenter'
    Left = 176
    Top = 136
  end
  object PhonesModelBindSource: TioModelBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'PhoneType'
        Generator = 'BitmapNames'
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
    Left = 176
    Top = 192
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 172
    Top = 245
    object LinkGridToDataSourcePersonsModelBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = PersonsModelBindSource
      GridControl = MasterGrid
      Columns = <
        item
          MemberName = 'ID'
          ReadOnly = True
          Width = 45
        end
        item
          MemberName = 'FirstName'
          Header = 'First name'
          Width = 180
        end
        item
          MemberName = 'LastName'
          Header = 'Last name'
          Width = 180
        end
        item
          MemberName = 'ClassNameProp'
          Header = 'Class'
          Width = 200
        end>
    end
    object LinkGridToDataSourcePhonesModelBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = PhonesModelBindSource
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'PhoneType'
          Header = 'Type'
          Width = 100
        end
        item
          MemberName = 'PhoneNumber'
          Header = 'Number'
          Width = 300
        end>
    end
  end
end
