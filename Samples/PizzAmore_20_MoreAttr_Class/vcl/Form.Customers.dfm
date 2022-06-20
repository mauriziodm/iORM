object CustomersForm: TCustomersForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 761
  ClientWidth = 384
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object PanelBottom: TPanel
    Left = 0
    Top = 721
    Width = 384
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
    object ButtonAdd: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Action = acAdd
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 264
    end
    object ButtonPageUp: TSpeedButton
      Left = 100
      Top = 0
      Width = 50
      Height = 40
      Action = acNextPage
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 94
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
    end
    object ButtonPageDown: TSpeedButton
      Left = 50
      Top = 0
      Width = 50
      Height = 40
      Action = acPrevPage
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 56
      ExplicitTop = 6
    end
    object DBTextPageOf: TDBText
      Left = 150
      Top = 0
      Width = 184
      Height = 40
      Align = alClient
      Alignment = taCenter
      DataField = '%Paging.CurrentPageOf'
      DataSource = SourceCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 154
      ExplicitTop = 12
      ExplicitWidth = 176
      ExplicitHeight = 17
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 1
    object ButtonSelect: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Action = acShowOrSelect
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = -6
    end
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
      Left = 150
      Top = 7
      Width = 80
      Height = 21
      Caption = 'Customers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GridCustomers: TDBGrid
    Left = 0
    Top = 40
    Width = 384
    Height = 681
    Align = alClient
    DataSource = SourceCustomers
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = GridCustomersDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PhoneNumber'
        Title.Alignment = taCenter
        Title.Caption = 'Phone'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object DSCustomers: TioDataSetMaster
    TypeName = 'TCustomer'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 50
    Left = 56
    Top = 112
    object DSCustomersID: TIntegerField
      FieldName = 'ID'
    end
    object DSCustomersName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSCustomersPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
    object DSCustomersPagingCurrentPageOf: TStringField
      Alignment = taCenter
      FieldName = '%Paging.CurrentPageOf'
      Size = 100
    end
  end
  object SourceCustomers: TDataSource
    DataSet = DSCustomers
    Left = 56
    Top = 168
  end
  object ActionList1: TActionList
    Left = 184
    Top = 112
    object acBack: TAction
      Caption = 'Back'
      OnExecute = acBackExecute
    end
    object acDelete: TioBSPersistenceDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Delete'
      TargetBindSource = DSCustomers
    end
    object acNextPage: TioBSNextPage
      Category = 'iORM-BSPaging'
      Caption = 'Pg.Up'
      TargetBindSource = DSCustomers
    end
    object acPrevPage: TioBSPrevPage
      Category = 'iORM-BSPaging'
      Caption = 'Pg.Dn'
      TargetBindSource = DSCustomers
    end
    object acShowOrSelect: TAction
      Caption = 'Select'
      OnExecute = acShowOrSelectExecute
      OnUpdate = acShowOrSelectUpdate
    end
    object acAdd: TAction
      Category = 'iORM-BSPersistence'
      Caption = 'Add'
      OnExecute = acAddExecute
    end
  end
end
