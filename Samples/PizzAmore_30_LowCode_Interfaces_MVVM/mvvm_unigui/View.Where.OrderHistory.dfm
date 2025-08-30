inherited ViewWhereOrderHistory: TViewWhereOrderHistory
  inherited PanelTop: TUniPanel
    inherited LabelTitle: TUniLabel
      Caption = 'Where history'
    end
  end
  inherited PanelWhere: TUniPanel
    Visible = False
  end
  object GridCustomers: TUniDBGrid [3]
    Left = 0
    Top = 40
    Width = 800
    Height = 440
    Hint = ''
    BodyRTL = False
    DataSource = SourceMaster
    ReadOnly = True
    WebOptions.PageSize = 50
    WebOptions.RetainCursorOnSort = True
    LoadMask.Message = 'Loading data...'
    BufferedStore.Enabled = True
    BorderStyle = ubsNone
    Align = alClient
    Font.Height = -13
    ParentFont = False
    TabOrder = 3
    Columns = <
      item
        FieldName = 'OrderID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'OrderState'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
        Alignment = taCenter
      end
      item
        FieldName = 'FromDate'
        Title.Alignment = taCenter
        Title.Caption = 'FromDate'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 120
        Alignment = taCenter
      end
      item
        FieldName = 'ToDate'
        Title.Alignment = taCenter
        Title.Caption = 'To date'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 120
        Alignment = taCenter
      end
      item
        FieldName = 'Note'
        Title.Alignment = taCenter
        Title.Caption = 'Note'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 300
      end>
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSMasterFromDate: TDateField
      FieldName = 'FromDate'
    end
    object BSMasterToDate: TDateField
      FieldName = 'ToDate'
    end
  end
end
