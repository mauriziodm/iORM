inherited ViewBindSourceGrid: TViewBindSourceGrid
  inherited ViewPanelTop: TPanel
    inherited LabelTitle: TLabel
      Caption = 'BindSource Grid'
    end
  end
  object StringGrid1: TStringGrid [1]
    Tag = 3
    Left = 3
    Top = 50
    Width = 294
    Height = 447
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 3
    FixedCols = 0
    RowCount = 201
    TabOrder = 1
    ColWidths = (
      64
      64
      64)
    ColAligments = (
      1
      0
      1)
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 224
    Top = 184
    object LinkGridToDataSourceMBSArticles: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = MBSArticles
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
