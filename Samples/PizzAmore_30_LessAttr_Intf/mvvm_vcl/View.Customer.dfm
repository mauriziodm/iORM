inherited ViewCustomer: TViewCustomer
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
      Top = 101
      Width = 80
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 10
      Top = 164
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
      Top = 227
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
      Top = 266
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
    inherited PanelTop: TPanel
      inherited LabelTitle: TLabel
        Caption = 'Customer'
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
    object DBEditName: TDBEdit
      Left = 110
      Top = 101
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'Name'
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
      Top = 164
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
      Top = 227
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
      Top = 266
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
  end
  object Button1: TButton [1]
    Left = 248
    Top = 62
    Width = 75
    Height = 25
    Action = acNew
    TabOrder = 1
  end
  inherited ActionList1: TActionList
    object acNew: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'acNew'
      Enabled = True
      Visible = True
      VMActionName = 'acNew'
    end
  end
  inherited MDSMaster: TioModelDataSet
    object MDSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object MDSMasterName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object MDSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 250
    end
    object MDSMasterCity: TStringField
      FieldName = 'City'
      Size = 250
    end
    object MDSMasterAddress: TStringField
      FieldName = 'Address'
      Size = 250
    end
  end
end
