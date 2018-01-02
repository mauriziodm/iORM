object ViewPerson: TViewPerson
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object TopPanel: TUnimPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = ubsNone
    DesignSize = (
      451
      38)
    object ButtonPost: TUnimButton
      Left = 378
      Top = 0
      Width = 73
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Post'
    end
    object ButtonBack: TUnimButton
      Left = 0
      Top = 0
      Width = 73
      Height = 38
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Back'
    end
    object UnimLabel1: TUnimLabel
      Left = 73
      Top = 8
      Width = 305
      Height = 23
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Edit person'
      Anchors = [akLeft, akTop, akRight]
    end
  end
  object UnimPanel1: TUnimPanel
    Left = 0
    Top = 38
    Width = 451
    Height = 291
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = ubsNone
    DesignSize = (
      451
      291)
    object UnimDBEdit1: TUnimDBEdit
      Left = 135
      Top = 32
      Width = 306
      Height = 33
      Hint = ''
      DataField = 'ID'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
    end
    object UnimLabel2: TUnimLabel
      Left = 7
      Top = 35
      Width = 126
      Height = 23
      Hint = ''
      AutoSize = False
      Caption = 'ID'
    end
    object UnimLabel3: TUnimLabel
      Left = 7
      Top = 74
      Width = 138
      Height = 23
      Hint = ''
      AutoSize = False
      Caption = 'First name'
    end
    object UnimDBEdit2: TUnimDBEdit
      Left = 135
      Top = 71
      Width = 306
      Height = 33
      Hint = ''
      DataField = 'FirstName'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
    end
    object UnimLabel4: TUnimLabel
      Left = 7
      Top = 113
      Width = 138
      Height = 23
      Hint = ''
      AutoSize = False
      Caption = 'Last name'
    end
    object UnimDBEdit3: TUnimDBEdit
      Left = 135
      Top = 110
      Width = 306
      Height = 33
      Hint = ''
      DataField = 'LastName'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
    end
  end
  object VMBridge: TioViewModelBridge
    Left = 161
    Top = 88
  end
  object PersonModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PersonModelPresenter'
    Left = 104
    Top = 175
    object PersonModelDataSetID: TIntegerField
      FieldName = 'ID'
    end
    object PersonModelDataSetFirstName: TStringField
      FieldName = 'FirstName'
      Size = 100
    end
    object PersonModelDataSetLastName: TStringField
      FieldName = 'LastName'
      Size = 100
    end
    object PersonModelDataSetClassNameProp: TStringField
      FieldName = 'ClassNameProp'
      Size = 200
    end
  end
  object PhonesModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PhonesModelPresenter'
    Left = 104
    Top = 247
    object PhonesModelDataSetPhoneType: TStringField
      FieldName = 'PhoneType'
      Size = 100
    end
    object PhonesModelDataSetPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
  end
  object PersonDataSource: TDataSource
    DataSet = PersonModelDataSet
    Left = 216
    Top = 176
  end
  object PhonesDataSource: TDataSource
    DataSet = PhonesModelDataSet
    Left = 216
    Top = 248
  end
end
