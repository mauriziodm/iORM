inherited ViewCustomer: TViewCustomer
  Width = 800
  ExplicitWidth = 800
  inherited PanelMain: TPanel
    Width = 800
    ExplicitWidth = 800
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
      Top = 148
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
      Top = 195
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
      Top = 234
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
      Width = 800
      ExplicitWidth = 800
      DesignSize = (
        800
        40)
      inherited LabelTitle: TLabel
        Width = 691
        Caption = 'Customer'
        ExplicitWidth = 691
      end
      inherited ButtonETM: TSpeedButton
        Left = 730
        ExplicitLeft = 740
      end
    end
    object DBEditID: TDBEdit [6]
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
      TabOrder = 1
    end
    object DBEditName: TDBEdit [7]
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
      TabOrder = 2
    end
    object DBEditPhone: TDBEdit [8]
      Left = 110
      Top = 148
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
      TabOrder = 3
    end
    object DBEditCity: TDBEdit [9]
      Left = 110
      Top = 195
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
      TabOrder = 4
    end
    object DBEditAddress: TDBEdit [10]
      Left = 110
      Top = 234
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
      TabOrder = 5
    end
    inherited PanelBottom: TPanel
      Width = 800
      TabOrder = 6
      ExplicitWidth = 800
      inherited ButtonPersist: TSpeedButton
        Left = 740
        ExplicitLeft = 750
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 259
    Top = 83
  end
  inherited BSMaster: TioModelDataSet
    Left = 259
    Top = 194
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
  inherited VMBridge: TioViewModelBridge
    Left = 258
    Top = 138
  end
  inherited SourceMaster: TDataSource
    Left = 259
    Top = 250
  end
end
