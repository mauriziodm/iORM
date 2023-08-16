inherited ViewWhereOrderHistory: TViewWhereOrderHistory
  inherited PanelTop: TPanel
    inherited LabelTitle: TLabel
      Caption = 'Where history'
      ExplicitWidth = 108
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
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
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
        Expanded = False
        FieldName = 'FromDate'
        Title.Alignment = taCenter
        Title.Caption = 'From date'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 80
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
        Width = 80
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
        FieldName = 'RowsDescription'
        Title.Alignment = taCenter
        Title.Caption = 'Rows descr.'
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
    object BSMasterRowsDescription: TStringField
      FieldName = 'RowsDescription'
      Size = 100
    end
  end
end
