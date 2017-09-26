object ViewMain: TViewMain
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  DesignSize = (
    451
    305)
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 47
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object ButtonLoadFromDB: TUniSpeedButton
      Left = 83
      Top = 2
      Width = 126
      Height = 43
      Hint = ''
      Caption = 'Load from DB by code'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 1
    end
    object ButtonClearData: TUniSpeedButton
      Left = 2
      Top = 2
      Width = 81
      Height = 43
      Hint = ''
      Caption = 'Clear data'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
    object ButtonEdit: TUniSpeedButton
      Left = 390
      Top = 2
      Width = 59
      Height = 43
      Hint = ''
      Caption = 'Edit  ->'
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 3
    end
  end
  object UniLabel1: TUniLabel
    Left = 0
    Top = 47
    Width = 451
    Height = 22
    Hint = ''
    Alignment = taCenter
    AutoSize = False
    Caption = 'Persons'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 1
  end
  object UniDBGrid1: TUniDBGrid
    Left = 3
    Top = 67
    Width = 445
    Height = 57
    Hint = ''
    DataSource = PersonsDataSource
    LoadMask.Message = 'Loading data...'
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object UniLabel2: TUniLabel
    Left = 0
    Top = 127
    Width = 451
    Height = 22
    Hint = ''
    Alignment = taCenter
    AutoSize = False
    Caption = 'Phone numbers'
    Anchors = [akLeft, akRight, akBottom]
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 3
  end
  object UniDBGrid2: TUniDBGrid
    Left = 3
    Top = 145
    Width = 445
    Height = 156
    Hint = ''
    DataSource = PhonesDataSource
    LoadMask.Message = 'Loading data...'
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
  end
  object VMBridge: TioViewModelBridge
    DI_VMInterface = 'IPersonsViewModel'
    Left = 176
    Top = 80
  end
  object PersonsModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PersonsModelPresenter'
    Left = 176
    Top = 136
    object PersonsModelDataSetID: TIntegerField
      FieldName = 'ID'
    end
    object PersonsModelDataSetFirstName: TStringField
      FieldName = 'FirstName'
      Size = 100
    end
    object PersonsModelDataSetLastName: TStringField
      FieldName = 'LastName'
      Size = 100
    end
    object PersonsModelDataSetFullName: TStringField
      FieldName = 'FullName'
      Size = 250
    end
    object PersonsModelDataSetClassNameProp: TStringField
      FieldName = 'ClassNameProp'
      Size = 100
    end
  end
  object PersonsDataSource: TDataSource
    DataSet = PersonsModelDataSet
    Left = 280
    Top = 136
  end
  object PhonesModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PhonesModelPresenter'
    Left = 176
    Top = 224
    object PhonesModelDataSetPhoneType: TStringField
      DisplayWidth = 20
      FieldName = 'PhoneType'
    end
    object PhonesModelDataSetPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
  end
  object PhonesDataSource: TDataSource
    DataSet = PhonesModelDataSet
    Left = 280
    Top = 224
  end
end
