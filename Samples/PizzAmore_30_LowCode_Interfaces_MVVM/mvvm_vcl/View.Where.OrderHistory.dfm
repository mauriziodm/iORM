inherited ViewWhereOrderHistory: TViewWhereOrderHistory
  inherited PanelTop: TPanel
    inherited ButtonSelect: TSpeedButton
      ExplicitLeft = 736
    end
    inherited LabelTitle: TLabel
      Caption = 'Where history'
      ExplicitWidth = 700
    end
  end
  inherited PanelBottom: TPanel
    inherited ButtonAdd: TSpeedButton
      ExplicitLeft = 730
      ExplicitTop = 3
    end
  end
  inherited PanelWhere: TPanel
    Visible = False
  end
  object GridCustomers: TDBGrid [3]
    Left = 0
    Top = 40
    Width = 800
    Height = 441
    Align = alClient
    DataSource = SourceMaster
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
        FieldName = 'OrderID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 30
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
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
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
        Width = 100
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
        Width = 130
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
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IngredientName'
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
        Width = 200
        Visible = True
      end>
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object BSMasterFromDate: TDateField
      FieldName = 'FromDate'
    end
    object BSMasterToDate: TDateField
      FieldName = 'ToDate'
    end
    object BSMasterNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterCustomerName: TStringField
      FieldName = 'CustomerName'
      Size = 100
    end
    object BSMasterIngredientName: TStringField
      FieldName = 'IngredientName'
      Size = 100
    end
    object BSMasterRowsDescription: TStringField
      FieldName = 'PizzaName'
      Size = 100
    end
  end
end
