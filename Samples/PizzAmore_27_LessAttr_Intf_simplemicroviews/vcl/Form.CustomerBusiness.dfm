object BusinessCustomerForm: TBusinessCustomerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 423
  ClientWidth = 593
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 18
    Top = 61
    Width = 100
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
  object Label2: TLabel
    Left = 0
    Top = 125
    Width = 118
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Business name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 18
    Top = 188
    Width = 100
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
  object Label4: TLabel
    Left = 18
    Top = 227
    Width = 100
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
  object Label5: TLabel
    Left = 16
    Top = 266
    Width = 100
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
  object Label6: TLabel
    Left = 16
    Top = 330
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'VAT number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Back'
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      593
      40)
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 56
      Top = 7
      Width = 490
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Business customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 481
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 383
    Width = 593
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevert
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
    object ButtonPersist: TSpeedButton
      Left = 543
      Top = 0
      Width = 50
      Height = 40
      Action = acPersist
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
  end
  object DBEditID: TDBEdit
    Left = 130
    Top = 61
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditBusinessName: TDBEdit
    Left = 130
    Top = 125
    Width = 447
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'BusinessName'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditPhone: TDBEdit
    Left = 130
    Top = 188
    Width = 447
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'PhoneNumber'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEditCity: TDBEdit
    Left = 130
    Top = 227
    Width = 447
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'City'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEditAddress: TDBEdit
    Left = 128
    Top = 266
    Width = 449
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Address'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBEditVAT: TDBEdit
    Left = 128
    Top = 330
    Width = 449
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'VAT'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object DSCustomer: TioDataSetMaster
    AsDefault = True
    TypeName = 'TBusinessCustomer'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    VirtualFields = True
    Paging.CurrentPageOfFormat = '%d/%d'
    Paging.PageSize = 10
    Left = 320
    Top = 48
    object DSCustomerID: TIntegerField
      FieldName = 'ID'
    end
    object DSCustomerName: TStringField
      FieldName = 'BusinessName'
      Size = 100
    end
    object DSCustomerPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
    object DSCustomerCity: TStringField
      FieldName = 'City'
      Size = 100
    end
    object DSCustomerAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object DSCustomerVAT: TStringField
      FieldName = 'VAT'
      Size = 250
    end
  end
  object SourceCustomer: TDataSource
    DataSet = DSCustomer
    Left = 320
    Top = 104
  end
  object ActionList1: TActionList
    Left = 416
    Top = 48
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSCustomer
    end
    object acRevert: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      TargetBindSource = DSCustomer
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSCustomer
    end
  end
end
