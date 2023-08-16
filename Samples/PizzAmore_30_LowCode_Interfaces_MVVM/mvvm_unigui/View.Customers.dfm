inherited ViewCustomers: TViewCustomers
  inherited PanelWhere: TUniPanel [0]
    ScrollDirection = sdNone
    object UniLabel2: TUniLabel [0]
      Left = 112
      Top = 7
      Width = 57
      Height = 25
      Hint = ''
      AutoSize = False
      Caption = 'Name'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object DBEditWhereName: TUniDBEdit [1]
      Left = 167
      Top = 6
      Width = 250
      Height = 25
      Hint = ''
      DataField = 'Name'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 4
      BorderStyle = ubsNone
    end
    object UniLabel3: TUniLabel [2]
      Left = 8
      Top = 38
      Width = 57
      Height = 25
      Hint = ''
      AutoSize = False
      Caption = 'City'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 6
    end
    object DBEditWhereCity: TUniDBEdit [3]
      Left = 45
      Top = 38
      Width = 372
      Height = 25
      Hint = ''
      DataField = 'City'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 5
      BorderStyle = ubsNone
    end
    object UniLabel1: TUniLabel
      Left = 8
      Top = 7
      Width = 57
      Height = 25
      Hint = ''
      AutoSize = False
      Caption = 'ID'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 7
    end
    object DBEditWhereID: TUniDBEdit
      Left = 45
      Top = 7
      Width = 40
      Height = 25
      Hint = ''
      DataField = 'ID'
      DataSource = SourceWhere
      ParentFont = False
      Font.Height = -16
      TabOrder = 2
      BorderStyle = ubsNone
    end
  end
  inherited PanelTop: TUniPanel [1]
    inherited LabelTitle: TUniLabel
      Caption = 'Customers'
    end
  end
  inherited PanelBottom: TUniPanel [2]
    object ButtonPageDown: TUniSpeedButton
      Left = 50
      Top = 0
      Width = 50
      Height = 40
      Action = acPrevPage
      Align = alLeft
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      ParentColor = False
      TabOrder = 3
    end
    object ButtonPageUp: TUniSpeedButton
      Left = 100
      Top = 0
      Width = 50
      Height = 40
      Action = acNextPage
      Align = alLeft
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      ParentColor = False
      TabOrder = 4
    end
    object DBTextPageOf: TUniDBText
      Left = 156
      Top = 13
      Width = 205
      Height = 24
      Hint = ''
      DataField = '%Paging.CurrentPageOf'
      DataSource = SourceMaster
      Alignment = taCenter
      AutoSize = False
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Style = [fsBold]
    end
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
    LoadMask.Message = 'Loading data...'
    BufferedStore.Enabled = True
    BorderStyle = ubsNone
    Align = alClient
    TabOrder = 3
    Columns = <
      item
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 64
        Alignment = taCenter
      end
      item
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = 'Name'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 300
      end
      item
        FieldName = 'PhoneNumber'
        Title.Alignment = taCenter
        Title.Caption = 'Phone'
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 300
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
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
    object BSMasterPagingCurrentPageOf: TStringField
      Alignment = taCenter
      FieldName = '%Paging.CurrentPageOf'
      Size = 100
    end
  end
  inherited BSWhere: TioModelDataSet
    object BSWhereID: TIntegerField
      FieldName = 'ID'
    end
    object BSWhereName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSWhereCity: TStringField
      FieldName = 'City'
      Size = 100
    end
  end
end
