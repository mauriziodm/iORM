inherited ViewCustomers: TViewCustomers
  inherited PanelTop: TPanel
    inherited LabelTitle: TLabel
      Width = 80
      Caption = 'Customers'
      ExplicitWidth = 80
    end
  end
  inherited PanelBottom: TPanel
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
      ExplicitLeft = 58
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
    object DBTextPageOf: TDBText
      Left = 150
      Top = 0
      Width = 600
      Height = 40
      Align = alClient
      Alignment = taCenter
      DataSource = SourceMaster
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
  object GridCustomers: TDBGrid [2]
    Left = 0
    Top = 40
    Width = 800
    Height = 520
    Align = alClient
    DataSource = SourceMaster
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
        Width = 60
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
        Width = 240
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
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FullAddress'
        Title.Alignment = taCenter
        Title.Caption = 'Full address'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end>
  end
  inherited ActionList1: TActionList
    object acNextPage: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Pg.Up'
      Enabled = True
      Visible = True
      VMActionName = 'acNextPage'
    end
    object acPrevPage: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Pg.Dn'
      Enabled = True
      Visible = True
      VMActionName = 'acPrevPage'
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
    object MDSMasterFullAddress: TStringField
      FieldName = 'FullAddress'
      Size = 250
    end
    object MDSMasterPagingCurrentPageOf: TStringField
      FieldName = '%Paging.CurrentPageOf'
    end
  end
end
