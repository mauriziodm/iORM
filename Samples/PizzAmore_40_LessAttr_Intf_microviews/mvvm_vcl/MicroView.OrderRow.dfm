object MicroViewOrderRow: TMicroViewOrderRow
  Left = 0
  Top = 0
  Width = 430
  Height = 75
  Color = clWhite
  Ctl3D = False
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  DesignSize = (
    430
    75)
  object Label2: TLabel
    Left = 69
    Top = 3
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
    Top = 38
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
    Top = 38
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
    Top = 38
    Width = 39
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBImage1: TDBImage
    Left = 3
    Top = 3
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
    Top = 3
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
    Top = 38
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
    Top = 38
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
    Top = 38
    Width = 89
    Height = 25
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
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
    Left = 232
    Top = 3
    Width = 75
    Height = 25
    Action = acRefresh
    TabOrder = 5
  end
  object MDSorderRow: TioModelDataSet
    ViewModelBridge = OrderRowMicroVMBridge
    ModelPresenter = 'MPOrderRow'
    Left = 272
    Top = 32
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
    Left = 152
    Top = 32
  end
  object SourceOrderRow: TDataSource
    DataSet = MDSorderRow
    Left = 360
    Top = 32
  end
  object ActionList1: TActionList
    Left = 320
    object acRefresh: TioViewAction
      Category = 'iORM-MVVM'
      Caption = 'Refresh'
      Enabled = True
      Visible = True
      VMActionName = 'acRefresh'
    end
  end
end
