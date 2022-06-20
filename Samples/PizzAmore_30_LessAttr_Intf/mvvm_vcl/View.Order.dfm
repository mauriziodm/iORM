inherited ViewOrder: TViewOrder
  OnResize = FrameResize
  inherited PanelMain: TPanel
    Width = 449
    ExplicitLeft = -6
    ExplicitWidth = 449
    ExplicitHeight = 578
    object Label1: TLabel [0]
      Left = 5
      Top = 57
      Width = 75
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 5
      Top = 88
      Width = 75
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Note'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 5
      Top = 137
      Width = 75
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 3
      Top = 168
      Width = 75
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
    object Label5: TLabel [4]
      Left = 3
      Top = 199
      Width = 75
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
    object ButtonSelectCustomer: TSpeedButton [5]
      Left = 392
      Top = 137
      Width = 25
      Height = 25
      Action = acShowCustomerSelector
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited PanelTop: TPanel
      Width = 449
      DesignSize = (
        449
        40)
      inherited LabelTitle: TLabel
        Width = 340
        Caption = 'Order'
      end
    end
    inherited PanelBottom: TPanel
      Width = 449
      inherited ButtonPersist: TSpeedButton
        Left = 399
      end
      object Label6: TLabel
        Left = 173
        Top = 9
        Width = 96
        Height = 25
        AutoSize = False
        Caption = 'Grand total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ButtonDeleteRow: TSpeedButton
        Left = 50
        Top = 0
        Width = 79
        Height = 40
        Action = acDeleteRow
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBEditGrandTotal: TDBEdit
        Left = 277
        Top = 7
        Width = 90
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        DataField = 'GrandTotal'
        DataSource = SourceMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DBEditID: TDBEdit
      Left = 92
      Top = 57
      Width = 30
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'ID'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEditDate: TDBEdit
      Left = 140
      Top = 57
      Width = 100
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'OrderDate'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEditNote: TDBEdit
      Left = 92
      Top = 88
      Width = 325
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Note'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEditCustID: TDBEdit
      Left = 92
      Top = 137
      Width = 30
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
      TabOrder = 5
    end
    object DBEditCustName: TDBEdit
      Left = 128
      Top = 137
      Width = 261
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Name'
      DataSource = SourceCustomer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEditCustAddress: TDBEdit
      Left = 92
      Top = 168
      Width = 325
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'FullAddress'
      DataSource = SourceCustomer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DBECustPhone: TDBEdit
      Left = 92
      Top = 199
      Width = 325
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
      TabOrder = 8
    end
    object GridRows: TDBGrid
      Left = 5
      Top = 230
      Width = 423
      Height = 320
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = SourceRows
      FixedColor = clInactiveBorder
      GradientEndColor = clInactiveBorder
      GradientStartColor = clInactiveBorder
      ParentCtl3D = False
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Description'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UnitPrice'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Qty'
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
          FieldName = 'RowTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end>
    end
  end
  object PanelPizzas: TPanel [1]
    Left = 449
    Top = 0
    Width = 350
    Height = 600
    Align = alRight
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 455
  end
  inherited ActionList1: TActionList
    object acDeleteRow: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete row'
      Enabled = True
      Visible = True
      VMActionName = 'acDeleteRow'
    end
    object acShowCustomerSelector: TioViewAction
      Category = 'iORM-MVVM'
      Caption = '...'
      Enabled = True
      Visible = True
      VMActionName = 'acShowCustomerSelector'
    end
  end
  inherited MDSMaster: TioModelDataSet
    object MDSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object MDSMasterOrderDate: TDateField
      FieldName = 'OrderDate'
    end
    object MDSMasterNote: TStringField
      FieldName = 'Note'
      Size = 250
    end
    object MDSMasterGrandTotal: TCurrencyField
      FieldName = 'GrandTotal'
    end
  end
  inherited SourceMaster: TDataSource
    Left = 294
  end
  object MDSCustomer: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPCustomer'
    Left = 204
    Top = 330
    object MDSCustomerID: TIntegerField
      FieldName = 'ID'
    end
    object MDSCustomerName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object MDSCustomerFullAddress: TStringField
      FieldName = 'FullAddress'
      Size = 250
    end
    object MDSCustomerPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 250
    end
  end
  object MDSRows: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPRows'
    Left = 204
    Top = 386
    object MDSRowsDescription: TStringField
      FieldName = 'Description'
      Size = 250
    end
    object MDSRowsPrice: TCurrencyField
      FieldName = 'Price'
    end
    object MDSRowsQty: TIntegerField
      FieldName = 'Qty'
    end
    object MDSRowsRowTotal: TCurrencyField
      FieldName = 'RowTotal'
    end
  end
  object SourceCustomer: TDataSource
    DataSet = MDSCustomer
    Left = 294
    Top = 330
  end
  object SourceRows: TDataSource
    DataSet = MDSRows
    Left = 294
    Top = 386
  end
  object VCProviderOrder: TioViewContextProvider
    OnAfterRequest = VCProviderOrderAfterRequest
    OnRequest = VCProviderOrderRequest
    RegisterAsDefault = False
    Left = 293
    Top = 162
  end
end
