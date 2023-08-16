inherited ViewOrders: TViewOrders
  OnCreate = UniFrameCreate
  inherited PanelTop: TUniPanel
    inherited LabelTitle: TUniLabel
      Caption = 'Orders'
    end
  end
  inherited PanelWhere: TUniPanel
    Top = 468
    Height = 92
    ExplicitTop = 468
    ExplicitHeight = 92
    inherited PanelWhereButtons: TUniPanel
      Height = 92
      ExplicitHeight = 92
      inherited ButtonSearch: TUniSpeedButton
        Height = 45
        ExplicitHeight = 45
      end
      inherited ButtonClear: TUniSpeedButton
        Top = 67
        Height = 25
        ExplicitTop = 67
        ExplicitHeight = 25
      end
      object ButtonHistory: TUniSpeedButton
        Left = 0
        Top = 42
        Width = 60
        Height = 25
        Action = acWhereShowHistory
        Align = alBottom
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        TabOrder = 3
      end
    end
    object UniLabel1: TUniLabel
      Left = 10
      Top = 10
      Width = 17
      Height = 21
      Hint = ''
      Caption = 'ID'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object DBEditWhereID: TUniDBEdit
      Left = 54
      Top = 10
      Width = 40
      Height = 25
      Hint = ''
      DataField = 'OrderID'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 3
      BorderStyle = ubsNone
    end
    object UniLabel2: TUniLabel
      Left = 130
      Top = 10
      Width = 47
      Height = 21
      Hint = ''
      Caption = 'Status'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 10
      Top = 42
      Width = 38
      Height = 21
      Hint = ''
      Caption = 'Note'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 5
    end
    object DBEditNote: TUniDBEdit
      Left = 54
      Top = 41
      Width = 256
      Height = 25
      Hint = ''
      DataField = 'Note'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 6
      BorderStyle = ubsNone
    end
    object UniLabel4: TUniLabel
      Left = 434
      Top = 10
      Width = 77
      Height = 21
      Hint = ''
      Caption = 'From date'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 7
    end
    object UniLabel5: TUniLabel
      Left = 434
      Top = 42
      Width = 56
      Height = 21
      Hint = ''
      Caption = 'To date'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 8
    end
    object DBEditStatus: TUniDBComboBox
      Left = 190
      Top = 6
      Width = 120
      Height = 29
      Hint = ''
      DataField = 'OrderState'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 9
      IconItems = <>
    end
    object DBEditFromDate: TUniDBDateTimePicker
      Left = 528
      Top = 6
      Width = 120
      Height = 25
      Hint = ''
      DataField = 'FromDate'
      DataSource = SourceWhere
      DateTime = 45073.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 10
      ParentFont = False
      Font.Height = -16
      BorderStyle = ubsNone
    end
    object DBEditToDate: TUniDBDateTimePicker
      Left = 528
      Top = 41
      Width = 120
      Height = 25
      Hint = ''
      DataField = 'ToDate'
      DataSource = SourceWhere
      DateTime = 45073.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 11
      ParentFont = False
      Font.Height = -16
      BorderStyle = ubsNone
    end
  end
  object GridCustomers: TUniDBGrid [3]
    Left = 0
    Top = 40
    Width = 800
    Height = 428
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
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'OrderDate'
        Title.Alignment = taCenter
        Title.Caption = 'Date'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 120
        Alignment = taCenter
      end
      item
        FieldName = 'Customer.Name'
        Title.Alignment = taCenter
        Title.Caption = 'Customer'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 300
      end
      item
        FieldName = 'GrandTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Grand total'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 120
      end
      item
        FieldName = 'OrderState'
        Title.Alignment = taCenter
        Title.Caption = ' Status'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 120
        Alignment = taCenter
      end>
  end
  inherited ActionList1: TActionList
    object acWhereShowHistory: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'History'
      Enabled = True
      Visible = True
      VMActionName = 'acWhereShowHistory'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object BSMasterOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSMasterCustomerName: TStringField
      FieldName = 'Customer.Name'
      Size = 100
    end
    object BSMasterGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
  end
  inherited BSWhere: TioModelDataSet
    Top = 418
    object BSWhereOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object BSWhereOrderState: TStringField
      FieldName = 'OrderState'
      Size = 100
    end
    object BSWhereNote: TStringField
      FieldName = 'Note'
      Size = 100
    end
    object BSWhereFromDate: TDateField
      FieldName = 'FromDate'
    end
    object BSWhereToDate: TDateField
      FieldName = 'ToDate'
    end
  end
  inherited SourceWhere: TDataSource
    Top = 418
  end
end
