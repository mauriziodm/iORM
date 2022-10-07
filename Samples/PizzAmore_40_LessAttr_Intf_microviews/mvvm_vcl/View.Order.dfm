inherited ViewOrder: TViewOrder
  OnResize = FrameResize
  inherited PanelMain: TPanel
    Width = 449
    ExplicitWidth = 449
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
    inherited PanelTop: TPanel
      Width = 449
      ExplicitWidth = 449
      DesignSize = (
        449
        40)
      inherited LabelTitle: TLabel
        Width = 340
        Caption = 'Order'
        ExplicitWidth = 340
      end
    end
    inherited PanelBottom: TPanel
      Width = 449
      ExplicitWidth = 449
      inherited ButtonPersist: TSpeedButton
        Left = 399
        ExplicitLeft = 399
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
    object GridRows: TDBGrid
      Left = 5
      Top = 234
      Width = 423
      Height = 320
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = SourceRows
      FixedColor = clInactiveBorder
      GradientEndColor = clInactiveBorder
      GradientStartColor = clInactiveBorder
      ParentCtl3D = False
      TabOrder = 5
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
    object ScrollBoxOrderRows: TScrollBox
      Left = 140
      Top = 290
      Width = 288
      Height = 151
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 6
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 8
        Width = 17
        Height = 1
        TabOrder = 0
      end
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
  end
  inline MicroViewCustomer1: TMicroViewCustomer [2]
    Left = 0
    Top = 120
    Width = 430
    Height = 100
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    ExplicitTop = 120
    inherited MDSCustomer: TioModelDataSet
      CrossView_MasterBindSource = MDSMaster
      CrossView_MasterPropertyName = 'Customer'
    end
  end
  inherited ActionList1: TActionList [3]
    Left = 171
    Top = 315
    object acDeleteRow: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete row'
      Enabled = True
      Visible = True
      VMActionName = 'acDeleteRow'
    end
  end
  inherited MDSMaster: TioModelDataSet [4]
    Left = 171
    Top = 426
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
  inherited VMBridge: TioViewModelBridge [5]
    Left = 170
    Top = 370
  end
  inherited SourceMaster: TDataSource
    Left = 294
    Top = 426
  end
  object MDSRows: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPRows'
    Left = 172
    Top = 482
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
  object SourceRows: TDataSource
    DataSet = MDSRows
    Left = 294
    Top = 482
  end
  object VCProviderOrderPizzaSel: TioViewContextProvider
    OnAfterRequest = VCProviderOrderPizzaSelAfterRequest
    OnRequest = VCProviderOrderPizzaSelRequest
    RegisterAsDefault = False
    Left = 293
    Top = 314
  end
  object VCProviderOrderRows: TioViewContextProvider
    OnAfterRequest = VCProviderOrderRowsAfterRequest
    OnRequest = VCProviderOrderRowsRequest
    RegisterAsDefault = False
    Left = 293
    Top = 370
  end
end
