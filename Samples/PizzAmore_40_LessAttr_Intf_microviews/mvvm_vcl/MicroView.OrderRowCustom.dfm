object MicroViewOrderRowCustom: TMicroViewOrderRowCustom
  Left = 0
  Top = 0
  Width = 430
  Height = 120
  Color = 14145535
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  DesignSize = (
    430
    120)
  object Label2: TLabel
    Left = 16
    Top = 14
    Width = 88
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 53
    Top = 89
    Width = 51
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 89
    Width = 40
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Qty'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 276
    Top = 89
    Width = 39
    Height = 25
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 430
    Height = 3
    Align = alTop
    Pen.Color = clWhite
  end
  object ButtonDelete: TSpeedButton
    Left = 385
    Top = 45
    Width = 40
    Height = 30
    Action = acDelete
    Anchors = [akTop, akRight]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBMemoDescription: TDBMemo
    Left = 116
    Top = 14
    Width = 264
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    Color = clWhite
    DataField = 'Description'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditPrice: TDBEdit
    Left = 116
    Top = 89
    Width = 50
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    DataField = 'Price'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditQty: TDBEdit
    Left = 212
    Top = 89
    Width = 30
    Height = 20
    BorderStyle = bsNone
    Color = clWhite
    DataField = 'Qty'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEditRowTotal: TDBEdit
    Left = 320
    Top = 89
    Width = 60
    Height = 20
    TabStop = False
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    DataField = 'RowTotal'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object BSorderRow: TioModelDataSet
    ViewModelBridge = OrderRowMicroVMBridge
    ModelPresenter = 'BSorderRow'
    Left = 264
    Top = 94
    object BSorderRowDescription: TStringField
      FieldName = 'Description'
      Size = 250
    end
    object BSorderRowPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BSorderRowQty: TIntegerField
      Alignment = taCenter
      FieldName = 'Qty'
    end
    object BSorderRowRowTotal: TCurrencyField
      FieldName = 'RowTotal'
    end
    object BSorderRowPizzaImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object OrderRowMicroVMBridge: TioViewModelBridge
    Left = 144
    Top = 94
  end
  object SourceOrderRow: TDataSource
    DataSet = BSorderRow
    Left = 352
    Top = 94
  end
  object ActionList1: TActionList
    Left = 256
    Top = 48
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Del'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
  end
end
