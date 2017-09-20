object ViewPerson: TViewPerson
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
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
    object ButtonPost: TUniSpeedButton
      Left = 379
      Top = 2
      Width = 70
      Height = 43
      Hint = ''
      Caption = 'Post'
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 1
    end
    object ButtonBack: TUniSpeedButton
      Left = 2
      Top = 2
      Width = 70
      Height = 43
      Hint = ''
      Caption = '<- Back'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
    object UniLabel6: TUniLabel
      Left = 78
      Top = 9
      Width = 267
      Height = 30
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Edit person'
      ParentFont = False
      Font.Height = -21
      Font.Style = [fsBold]
      TabOrder = 3
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 47
    Width = 451
    Height = 178
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    DesignSize = (
      451
      178)
    object UniLabel1: TUniLabel
      Left = 10
      Top = 19
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
      TabOrder = 1
    end
    object UniDBEdit1: TUniDBEdit
      Left = 106
      Top = 19
      Width = 332
      Height = 22
      Hint = ''
      DataField = 'ID'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 10
      Top = 59
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'First name'
      TabOrder = 3
    end
    object UniDBEdit2: TUniDBEdit
      Left = 107
      Top = 56
      Width = 332
      Height = 22
      Hint = ''
      DataField = 'FirstName'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 10
      Top = 87
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Last name'
      TabOrder = 5
    end
    object UniDBEdit3: TUniDBEdit
      Left = 107
      Top = 84
      Width = 332
      Height = 22
      Hint = ''
      DataField = 'LastName'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 258
    Width = 451
    Height = 47
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    BorderStyle = ubsSolid
    Caption = ''
    DesignSize = (
      451
      47)
    object UniLabel4: TUniLabel
      Left = 10
      Top = 16
      Width = 90
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CLASS NAME'
      ParentFont = False
      Font.Color = clGray
      TabOrder = 1
    end
    object UniDBEdit4: TUniDBEdit
      Left = 107
      Top = 13
      Width = 332
      Height = 22
      Hint = ''
      Enabled = False
      DataField = 'ClassNameProp'
      DataSource = PersonDataSource
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ParentColor = True
    end
  end
  object UniPanel4: TUniPanel
    Left = 0
    Top = 225
    Width = 451
    Height = 33
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    BorderStyle = ubsNone
    Caption = ''
    DesignSize = (
      451
      33)
    object UniLabel5: TUniLabel
      Left = 0
      Top = 0
      Width = 451
      Height = 22
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Phone numbers'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object UniDBGrid1: TUniDBGrid
      Left = 9
      Top = 21
      Width = 434
      Height = 4
      Hint = ''
      DataSource = PhonesDataSource
      LoadMask.Message = 'Loading data...'
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Columns = <
        item
          FieldName = 'PhoneType'
          Title.Caption = 'PhoneType'
          Width = 100
        end
        item
          FieldName = 'PhoneNumber'
          Title.Caption = 'PhoneNumber'
          Width = 269
          Expanded = True
        end>
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
