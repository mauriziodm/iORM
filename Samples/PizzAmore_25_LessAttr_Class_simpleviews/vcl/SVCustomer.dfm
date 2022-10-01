object CustomerSimpleView: TCustomerSimpleView
  Left = 0
  Top = 0
  Width = 612
  Height = 416
  TabOrder = 0
  object Label1: TLabel
    Left = 3
    Top = 3
    Width = 253
    Height = 32
    Caption = 'CustomersSimpleView'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 11
    Height = 15
    Caption = 'ID'
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 16
    Top = 160
    Width = 32
    Height = 15
    Caption = 'Name'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 16
    Top = 208
    Width = 21
    Height = 15
    Caption = 'City'
    FocusControl = DBEdit3
  end
  object Button1: TButton
    Left = 3
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 128
    Width = 104
    Height = 23
    DataField = 'ID'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 176
    Width = 300
    Height = 23
    DataField = 'Name'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 224
    Width = 300
    Height = 23
    DataField = 'City'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DS: TioDataSetMaster
    AsDefault = True
    TypeName = 'TCustomer'
    LoadType = ltManual
    TypeOfCollection = tcSingleObject
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 152
    Top = 56
    object DSID: TIntegerField
      FieldName = 'ID'
    end
    object DSName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object DSCity: TStringField
      FieldName = 'City'
      Size = 250
    end
  end
  object DataSource1: TDataSource
    DataSet = DS
    Left = 248
    Top = 56
  end
end
