object LiveBindingsView: TLiveBindingsView
  Left = 0
  Top = 0
  ActiveControl = StringGrid1
  BiDiMode = bdLeftToRight
  Caption = 'LiveBindingsView'
  ClientHeight = 606
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Visible = True
  OnClose = FormClose
  DesignSize = (
    625
    606)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 6
    Width = 161
    Height = 19
    AutoSize = False
    Caption = 'Master'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 422
    Width = 161
    Height = 19
    AutoSize = False
    Caption = 'Detail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Tag = 2
    Left = 8
    Top = 32
    Width = 610
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    ColCount = 2
    FixedCols = 0
    RowCount = 201
    TabOrder = 0
    ColWidths = (
      64
      150)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object BindNavigator1: TBindNavigator
    Left = 377
    Top = 6
    Width = 240
    Height = 25
    DataSource = MasterModelBindSource
    Orientation = orHorizontal
    TabOrder = 1
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 168
    Width = 610
    Height = 234
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object EditDescrizione: TEdit
      Left = 15
      Top = 44
      Width = 121
      Height = 19
      TabOrder = 0
      Text = 'Mark Anderson'
    end
  end
  object EditID: TEdit
    Left = 24
    Top = 194
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '-33'
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 448
    Width = 610
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    ColCount = 1
    FixedCols = 0
    RowCount = 201
    TabOrder = 4
    ColWidths = (
      64)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object BindNavigator2: TBindNavigator
    Left = 377
    Top = 422
    Width = 240
    Height = 25
    DataSource = DetailModelBindSource
    Orientation = orHorizontal
    TabOrder = 5
  end
  object ioViewModelBridge1: TioViewModelBridge
    Left = 136
    Top = 96
  end
  object MasterModelBindSource: TioModelBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'ID'
        FieldType = ftInteger
        Generator = 'Integers'
        ReadOnly = False
      end
      item
        Name = 'Descrizione'
        Generator = 'ContactNames'
        ReadOnly = False
      end>
    ScopeMappings = <>
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'ModelMasterPresenter'
    Left = 136
    Top = 152
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 236
    Top = 261
    object LinkGridToDataSourceMasterModelBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = MasterModelBindSource
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'ID'
        end
        item
          MemberName = 'Descrizione'
          Width = 150
        end>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = MasterModelBindSource
      FieldName = 'ID'
      Control = EditID
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = MasterModelBindSource
      FieldName = 'Descrizione'
      Control = EditDescrizione
      Track = True
    end
    object LinkGridToDataSourceDetailModelBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = DetailModelBindSource
      GridControl = StringGrid2
      Columns = <>
    end
  end
  object DetailModelBindSource: TioModelBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <>
    ScopeMappings = <>
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'ModelDetailPresenter'
    Left = 256
    Top = 152
  end
end
