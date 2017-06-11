object ArticleListView: TArticleListView
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = 16244682
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    DesignSize = (
      451
      37)
    object ButtonClose: TSpeedButton
      Left = 7
      Top = 1
      Width = 53
      Height = 30
      Caption = 'Exit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonNewMaterial: TcxButton
      Left = 95
      Top = 4
      Width = 113
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'New material'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ButtonNewProcess: TcxButton
      Left = 214
      Top = 4
      Width = 113
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'New process'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ButtonNewProduct: TcxButton
      Left = 333
      Top = 4
      Width = 113
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'New product'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 37
    Width = 451
    Height = 186
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = DSArticleList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupRowStyle = grsOffice11
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 25
      end
      object cxGrid1DBTableView1Code: TcxGridDBColumn
        DataBinding.FieldName = 'Code'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object cxGrid1DBTableView1Description: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        HeaderAlignmentHorz = taCenter
        Width = 190
      end
      object cxGrid1DBTableView1UM: TcxGridDBColumn
        DataBinding.FieldName = 'UM'
        HeaderAlignmentHorz = taCenter
        Width = 20
      end
      object cxGrid1DBTableView1ArticleType: TcxGridDBColumn
        DataBinding.FieldName = 'ArticleType'
        HeaderAlignmentHorz = taCenter
        Width = 59
      end
      object cxGrid1DBTableView1CreationDateTime: TcxGridDBColumn
        DataBinding.FieldName = 'CreationDateTime'
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 451
    Height = 82
    Align = alBottom
    BevelOuter = bvNone
    Color = 16244682
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 220
    DesignSize = (
      451
      82)
    object Label1: TLabel
      Left = 227
      Top = 15
      Width = 31
      Height = 17
      Caption = 'Code'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 311
      Top = 15
      Width = 66
      Height = 17
      Caption = 'Description'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBEditFilterCode: TcxDBTextEdit
      Left = 224
      Top = 35
      DataBinding.DataField = 'Code'
      DataBinding.DataSource = DSFilters
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'McSkin'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'McSkin'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'McSkin'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      Width = 81
    end
    object DBEditFiilterDescription: TcxDBTextEdit
      Left = 309
      Top = 35
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'Description'
      DataBinding.DataSource = DSFilters
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'McSkin'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'McSkin'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'McSkin'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
      Width = 65
    end
    object ButtonSearch: TcxButton
      Left = 380
      Top = 6
      Width = 64
      Height = 68
      Anchors = [akTop, akRight]
      Caption = 'Find'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioButtonFilterAll: TcxRadioButton
      Left = 14
      Top = 17
      Width = 90
      Height = 17
      Caption = 'All'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = True
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
    end
    object RadioButtonFilterProcesses: TcxRadioButton
      Left = 109
      Top = 17
      Width = 90
      Height = 17
      Caption = 'Processes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
    end
    object RadioButtonFilterMaterials: TcxRadioButton
      Left = 14
      Top = 47
      Width = 90
      Height = 17
      Caption = 'Materials'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
    end
    object RadioButtonFilterProducts: TcxRadioButton
      Left = 109
      Top = 47
      Width = 90
      Height = 17
      Caption = 'Products'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
    end
  end
  object MDSArticleList: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPArticleList'
    Left = 88
    Top = 152
    object MDSArticleListID: TIntegerField
      FieldName = 'ID'
    end
    object MDSArticleListCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSArticleListDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object MDSArticleListUM: TStringField
      FieldName = 'UM'
      Size = 10
    end
    object MDSArticleListCreationDateTime: TDateTimeField
      FieldName = 'CreationDateTime'
    end
    object MDSArticleListArticleType: TStringField
      FieldName = 'ArticleType'
      ReadOnly = True
      Size = 40
    end
  end
  object VMBridge: TioViewModelBridge
    DI_VMInterface = 'IArticleListVM'
    Left = 88
    Top = 96
  end
  object DSArticleList: TDataSource
    DataSet = MDSArticleList
    Left = 176
    Top = 152
  end
  object MDSFilters: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'MPFilters'
    Left = 88
    Top = 208
    object MDSFiltersCode: TStringField
      FieldName = 'Code'
      Size = 100
    end
    object MDSFiltersDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
  end
  object DSFilters: TDataSource
    DataSet = MDSFilters
    Left = 176
    Top = 208
  end
  object MainMenu: TMainMenu
    AutoMerge = True
    Left = 344
    Top = 96
    object Articles1: TMenuItem
      Caption = 'Articles'
      object New1: TMenuItem
        Caption = 'New'
        object Material1: TMenuItem
          Caption = 'Material'
        end
        object Process1: TMenuItem
          Caption = 'Process'
        end
        object Product1: TMenuItem
          Caption = 'Product'
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
  end
end
