object MicroViewOrderRowCustom: TMicroViewOrderRowCustom
  Left = 0
  Top = 0
  Width = 430
  Height = 123
  Color = 14145535
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  DesignSize = (
    430
    123)
  object Label2: TLabel
    Left = 5
    Top = 11
    Width = 88
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 42
    Top = 86
    Width = 51
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 165
    Top = 86
    Width = 40
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Qty'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 257
    Top = 86
    Width = 39
    Height = 25
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 5
    Top = 1
    Width = 411
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Pen.Color = clSilver
  end
  object DBMemoDescription: TDBMemo
    Left = 105
    Top = 11
    Width = 311
    Height = 69
    Color = clInactiveBorder
    DataField = 'Description'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEditPrice: TDBEdit
    Left = 105
    Top = 86
    Width = 60
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Price'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditQty: TDBEdit
    Left = 217
    Top = 86
    Width = 30
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Qty'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEditRowTotal: TDBEdit
    Left = 301
    Top = 86
    Width = 89
    Height = 25
    TabStop = False
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    DataField = 'RowTotal'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 341
    Top = 9
    Width = 75
    Height = 25
    Action = acDelete
    TabOrder = 3
  end
  object MDSorderRow: TioModelDataSet
    ViewModelBridge = OrderRowMicroVMBridge
    ModelPresenter = 'MPOrderRow'
    Left = 264
    Top = 94
    object MDSorderRowDescription: TStringField
      FieldName = 'Description'
      Size = 250
    end
    object MDSorderRowPrice: TCurrencyField
      FieldName = 'Price'
    end
    object MDSorderRowQty: TIntegerField
      Alignment = taCenter
      FieldName = 'Qty'
    end
    object MDSorderRowRowTotal: TCurrencyField
      FieldName = 'RowTotal'
    end
    object MDSorderRowPizzaImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object OrderRowMicroVMBridge: TioViewModelBridge
    Left = 144
    Top = 94
  end
  object SourceOrderRow: TDataSource
    DataSet = MDSorderRow
    Left = 352
    Top = 94
  end
  object ActionList1: TActionList
    Left = 256
    Top = 48
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
  end
end
