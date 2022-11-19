inherited ViewCustomerPrivate: TViewCustomerPrivate
  inherited PanelMain: TPanel
    object Label1: TLabel [0]
      Left = 10
      Top = 61
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 10
      Top = 117
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'First name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 10
      Top = 204
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 10
      Top = 259
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'City'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 298
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [5]
      Left = 10
      Top = 149
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Last name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited PanelTop: TPanel
      inherited LabelTitle: TLabel
        Caption = 'Private customer'
      end
    end
    object DBEditID: TDBEdit
      Left = 110
      Top = 61
      Width = 55
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'ID'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object DBEditFirstName: TDBEdit
      Left = 110
      Top = 117
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'FirstName'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object DBEditPhone: TDBEdit
      Left = 110
      Top = 204
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'PhoneNumber'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object DBEditCity: TDBEdit
      Left = 110
      Top = 259
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'City'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object DBEditAddress: TDBEdit
      Left = 110
      Top = 298
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'Address'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object DBEditLastName: TDBEdit
      Left = 110
      Top = 149
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'LastName'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object Button1: TButton
      Left = 224
      Top = 62
      Width = 75
      Height = 25
      Action = acDelete
      TabOrder = 8
    end
  end
  inherited ActionList1: TActionList
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'FirstName'
      Size = 250
    end
    object BSMasterLastName: TStringField
      FieldName = 'LastName'
      Size = 250
    end
    object BSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 250
    end
    object BSMasterCity: TStringField
      FieldName = 'City'
      Size = 250
    end
    object BSMasterAddress: TStringField
      FieldName = 'Address'
      Size = 250
    end
  end
end
