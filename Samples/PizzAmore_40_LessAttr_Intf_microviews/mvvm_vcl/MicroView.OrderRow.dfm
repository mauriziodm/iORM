object MicroViewOrderRow: TMicroViewOrderRow
  Left = 0
  Top = 0
  Width = 430
  Height = 82
  Color = clWhite
  Ctl3D = False
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  DesignSize = (
    430
    82)
  object Label2: TLabel
    Left = 69
    Top = 11
    Width = 51
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Pizza'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 69
    Top = 46
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
    Left = 192
    Top = 46
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
    Left = 284
    Top = 46
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
  object DBImage1: TDBImage
    Left = 3
    Top = 11
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
  object DBEditNote: TDBEdit
    Left = 132
    Top = 11
    Width = 285
    Height = 25
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    DataField = 'Pizza.Name'
    DataSource = SourceOrderRow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEditPrice: TDBEdit
    Left = 132
    Top = 46
    Width = 60
    Height = 25
    TabStop = False
    BorderStyle = bsNone
    DataField = 'Pizza.Price'
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
  object DBEditQty: TDBEdit
    Left = 244
    Top = 46
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
    TabOrder = 3
  end
  object DBEditRowTotal: TDBEdit
    Left = 328
    Top = 46
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
    TabOrder = 4
  end
  object Button1: TButton
    Left = 341
    Top = 15
    Width = 75
    Height = 25
    Action = acDelete
    TabOrder = 5
  end
  object MDSorderRow: TioModelDataSet
    ViewModelBridge = OrderRowMicroVMBridge
    ModelPresenter = 'MPOrderRow'
    Left = 264
    Top = 66
    object MDSorderRowDescription: TStringField
      FieldName = 'Pizza.Name'
    end
    object MDSorderRowPizzaPrice: TCurrencyField
      FieldName = 'Pizza.Price'
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
    Top = 66
  end
  object SourceOrderRow: TDataSource
    DataSet = MDSorderRow
    Left = 352
    Top = 66
  end
  object ActionList1: TActionList
    Left = 256
    Top = 8
    object acDelete: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Delete'
      Enabled = True
      Visible = True
      VMActionName = 'acDelete'
    end
  end
end
