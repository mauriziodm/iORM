object MicroViewOrderRowPizza: TMicroViewOrderRowPizza
  Left = 0
  Top = 0
  Width = 430
  Height = 82
  Color = 16771818
  Ctl3D = False
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  DesignSize = (
    430
    82)
  object Label2: TLabel
    Left = 53
    Top = 14
    Width = 51
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Pizza'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 53
    Top = 49
    Width = 51
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 49
    Width = 40
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Qty'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 276
    Top = 49
    Width = 39
    Height = 25
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
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
  object ButtonShow: TSpeedButton
    Left = 385
    Top = 7
    Width = 40
    Height = 30
    Action = acShow
    Anchors = [akTop, akRight]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonDelete: TSpeedButton
    Left = 385
    Top = 42
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
  object DBImage1: TDBImage
    Left = 6
    Top = 12
    Width = 60
    Height = 60
    BorderStyle = bsNone
    Ctl3D = False
    DataField = 'Image'
    DataSource = SourceOrderRow
    ParentCtl3D = False
    Stretch = True
    TabOrder = 0
  end
  object DBEditPizza: TDBEdit
    Left = 116
    Top = 14
    Width = 264
    Height = 20
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    DataField = 'Pizza.Name'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEditPrice: TDBEdit
    Left = 116
    Top = 49
    Width = 50
    Height = 20
    TabStop = False
    BorderStyle = bsNone
    DataField = 'Pizza.Price'
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
  object DBEditQty: TDBEdit
    Left = 212
    Top = 49
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
    TabOrder = 3
  end
  object DBEditRowTotal: TDBEdit
    Left = 320
    Top = 49
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
    TabOrder = 4
  end
  object SourceOrderRow: TDataSource
    DataSet = DSOrderRow
    Left = 352
    Top = 66
  end
  object ActionList1: TActionList
    Left = 256
    Top = 11
    object acDelete: TAction
      Caption = 'Del'
      OnExecute = acDeleteExecute
    end
    object acShow: TAction
      Caption = 'Show'
      OnExecute = acShowExecute
    end
  end
  object DSOrderRow: TioDataSetDetail
    AsDefault = True
    Left = 256
    Top = 64
    object DSOrderRowPizzaName: TStringField
      FieldName = 'Pizza.Name'
      Size = 250
    end
    object DSOrderRowPizzaPrice: TCurrencyField
      FieldName = 'Pizza.Price'
    end
    object DSOrderRowQty: TIntegerField
      FieldName = 'Qty'
    end
    object DSOrderRowGrandTotal: TCurrencyField
      FieldName = 'RowTotal'
    end
    object DSOrderRowImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object DSPizza: TioDataSetDetail
    MasterBindSource = DSOrderRow
    MasterPropertyName = 'Pizza'
    Left = 144
    Top = 64
  end
end
