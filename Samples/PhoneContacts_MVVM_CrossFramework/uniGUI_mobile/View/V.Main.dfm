object ViewMain: TViewMain
  Left = 0
  Top = 0
  Width = 302
  Height = 415
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object TopPanel: TUnimPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = ubsNone
    object ButtonEdit: TUnimButton
      Left = 229
      Top = 0
      Width = 73
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Edit'
      ExplicitLeft = 0
      ExplicitHeight = 41
    end
    object ButtonLoadFromDB: TUnimButton
      Left = 73
      Top = 0
      Width = 73
      Height = 38
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Load'
      ExplicitLeft = 0
      ExplicitHeight = 41
    end
    object ButtonClearData: TUnimButton
      Left = 0
      Top = 0
      Width = 73
      Height = 38
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Clear'
      ExplicitLeft = 8
      ExplicitHeight = 41
    end
  end
  object UnimDBGrid1: TUnimDBGrid
    Left = 0
    Top = 38
    Width = 302
    Height = 154
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = PersonsDataSource
    Options = []
    WebOptions.Paged = False
    ShowEditorOnEdit = False
  end
  object UnimDBGrid2: TUnimDBGrid
    Left = 0
    Top = 215
    Width = 302
    Height = 200
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    DataSource = PhonesDataSource
    Options = []
    WebOptions.Paged = False
    ShowEditorOnEdit = False
  end
  object UnimLabel2: TUnimLabel
    Left = 0
    Top = 192
    Width = 302
    Height = 23
    Hint = ''
    Alignment = taCenter
    AutoSize = False
    Caption = 'Numbers'
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ExplicitTop = 49
  end
  object VMBridge: TioViewModelBridge
    DI_VMInterface = 'IPersonsViewModel'
    Left = 80
    Top = 128
  end
  object PersonsModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PersonsModelPresenter'
    Left = 80
    Top = 184
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
    Left = 178
    Top = 184
  end
  object PhonesModelDataSet: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'PhonesModelPresenter'
    Left = 80
    Top = 272
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
    Left = 178
    Top = 272
  end
end
