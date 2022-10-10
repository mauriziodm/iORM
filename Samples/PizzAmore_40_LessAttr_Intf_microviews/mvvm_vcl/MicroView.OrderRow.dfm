object MicroViewOrderRow: TMicroViewOrderRow
  Left = 0
  Top = 0
  Width = 430
  Height = 98
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object DBEdit1: TDBEdit
    Left = 16
    Top = 11
    Width = 177
    Height = 23
    DataField = 'Description'
    DataSource = SourceOrderRow
    TabOrder = 0
  end
  object MDSorderRow: TioModelDataSet
    ViewModelBridge = OrderRowMicroVMBridge
    ModelPresenter = 'MPOrderRow'
    Left = 272
    Top = 80
    object MDSorderRowDescription: TStringField
      FieldName = 'Description'
    end
  end
  object OrderRowMicroVMBridge: TioViewModelBridge
    Left = 152
    Top = 80
  end
  object SourceOrderRow: TDataSource
    DataSet = MDSorderRow
    Left = 360
    Top = 80
  end
end
