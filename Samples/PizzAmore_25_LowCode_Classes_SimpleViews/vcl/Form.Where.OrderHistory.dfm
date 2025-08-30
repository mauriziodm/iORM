object OrderWhereHistoryForm: TOrderWhereHistoryForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 459
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 866
    object LabelTitle: TLabel
      Left = 0
      Top = 8
      Width = 870
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'Where history'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonSelect: TSpeedButton
      Left = 800
      Top = 0
      Width = 70
      Height = 40
      Action = acSelectCurrent
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 820
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 419
    Width = 870
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 418
    ExplicitWidth = 866
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 70
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 6
    end
  end
  object GridCustomers: TDBGrid
    Left = 0
    Top = 40
    Width = 870
    Height = 379
    Align = alClient
    DataSource = SourceWhereHistory
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = GridCustomersDblClick
    Columns = <
      item
        Alignment = taCenter
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'OrderState'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FromDate'
        Title.Alignment = taCenter
        Title.Caption = 'From date'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ToDate'
        Title.Alignment = taCenter
        Title.Caption = 'To date'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Alignment = taCenter
        Title.Caption = 'Customer'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PizzaName'
        Title.Alignment = taCenter
        Title.Caption = 'Pizza'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IngredientName'
        Title.Alignment = taCenter
        Title.Caption = 'Ingred.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Note'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 138
        Visible = True
      end>
  end
  object DSWhereHistory: TioDataSetMaster
    AsDefault = True
    TypeName = 'TWhereOrder'
    VirtualFields = True
    Paging.CurrentPageOfFormat = 'Page %d of %d'
    Paging.PageSize = 10
    Left = 56
    Top = 112
    object DSWhereHistoryOrderID: TIntegerField
      Alignment = taCenter
      FieldName = 'OrderID'
    end
    object DSWhereHistoryFromDate: TDateField
      Alignment = taCenter
      FieldName = 'FromDate'
    end
    object DSWhereHistoryNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object DSWhereHistoryOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object DSWhereHistoryToDate: TDateField
      FieldName = 'ToDate'
    end
    object DSWhereHistoryCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 100
    end
    object DSWhereHistoryPizzaName: TStringField
      FieldName = 'PizzaName'
      Size = 100
    end
    object DSWhereHistoryIngredientName: TStringField
      FieldName = 'IngredientName'
      Size = 100
    end
  end
  object SourceWhereHistory: TDataSource
    AutoEdit = False
    DataSet = DSWhereHistory
    Left = 56
    Top = 168
  end
  object ActionList1: TActionList
    Left = 184
    Top = 112
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSWhereHistory
    end
    object acDelete: TioBSDelete
      Category = 'iORM - BS'
      Caption = 'Delete'
      TargetBindSource = DSWhereHistory
    end
    object acSelectCurrent: TioBSSelectCurrent
      Category = 'iORM-BS'
      Caption = 'Select'
      TargetBindSource = DSWhereHistory
      Action_CloseQueryAction = acBack
    end
  end
end
