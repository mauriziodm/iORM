object PizzasForm: TPizzasForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 561
  ClientWidth = 384
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object ButtonSelect: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Action = acShow
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitTop = -6
    end
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 166
      Top = 7
      Width = 47
      Height = 21
      Caption = 'Pizzas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 521
    Width = 384
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonAdd: TSpeedButton
      Left = 334
      Top = 0
      Width = 50
      Height = 40
      Action = acAdd
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 264
    end
    object ButtonDelete: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 8
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 40
    Width = 384
    Height = 481
    Align = alClient
    DataSource = SourcePizzas
    PanelHeight = 96
    PanelWidth = 367
    TabOrder = 2
    RowCount = 5
    SelectedColor = 13828095
    ShowFocus = False
    OnDblClick = DBCtrlGrid1DblClick
    object DBTextName: TDBText
      Left = 99
      Top = 20
      Width = 259
      Height = 25
      DataField = 'Name'
      DataSource = SourcePizzas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = DBCtrlGrid1DblClick
    end
    object DBTextPrice: TDBText
      Left = 99
      Top = 51
      Width = 259
      Height = 25
      DataField = 'Price'
      DataSource = SourcePizzas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnDblClick = DBCtrlGrid1DblClick
    end
    object DBImage: TDBImage
      Left = 7
      Top = 7
      Width = 80
      Height = 80
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Image'
      DataSource = SourcePizzas
      Proportional = True
      Stretch = True
      TabOrder = 0
      OnDblClick = DBCtrlGrid1DblClick
    end
  end
  object DSPizzas: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    WhereStr.Strings = (
      '1=2')
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 80
    Top = 176
    object DSPizzasName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSPizzasPrice: TCurrencyField
      FieldName = 'Price'
    end
    object DSPizzasImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object SourcePizzas: TDataSource
    DataSet = DSPizzas
    Left = 80
    Top = 240
  end
  object ActionList1: TActionList
    Left = 192
    Top = 176
    object acAdd: TAction
      Caption = 'Add'
      OnExecute = acAddExecute
    end
    object acBack: TAction
      Caption = 'Back'
      OnExecute = acBackExecute
    end
    object acDelete: TioBSPersistenceDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Delete'
      TargetBindSource = DSPizzas
    end
    object acShow: TAction
      Caption = 'Show'
      OnExecute = acShowExecute
    end
  end
end
