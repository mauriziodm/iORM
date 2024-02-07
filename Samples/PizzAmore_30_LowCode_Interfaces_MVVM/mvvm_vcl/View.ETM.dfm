object ViewETM: TViewETM
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 216
    Width = 800
    Height = 5
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 100
    ExplicitWidth = 588
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      800
      40)
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
      Left = 56
      Top = 7
      Width = 691
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Entity Time Machine'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 689
    end
    object ButtonRevert: TSpeedButton
      Left = 750
      Top = 0
      Width = 50
      Height = 40
      Action = acEtmRevertToVersion
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
  end
  object GridCustomers: TDBGrid
    Left = 0
    Top = 79
    Width = 800
    Height = 137
    Align = alTop
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = SourceETM
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DateAndTime'
        Title.Alignment = taCenter
        Title.Caption = 'when'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartActionType'
        Title.Alignment = taCenter
        Title.Caption = 'action type'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartEntityVersion'
        Title.Alignment = taCenter
        Title.Caption = 'version'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartUser'
        Title.Alignment = taCenter
        Title.Caption = 'user'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
  object PanelDiff: TPanel
    Left = 0
    Top = 221
    Width = 800
    Height = 379
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelDiff'
    TabOrder = 2
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 800
      Height = 20
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'differences between the actual version and the selected one'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 588
    end
    object DiffMemo: TDBMemo
      Left = 0
      Top = 20
      Width = 800
      Height = 359
      Align = alClient
      BorderStyle = bsNone
      DataField = 'DiffOneWay'
      DataSource = SourceETM
      TabOrder = 0
    end
  end
  object PanelEntityInfo: TPanel
    Left = 0
    Top = 40
    Width = 800
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = -5
      Top = 10
      Width = 110
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Timeline for'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 370
      Top = 10
      Width = 47
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTextEntityClassName: TDBText
      Left = 121
      Top = 10
      Width = 262
      Height = 25
      DataField = 'EntityClassName'
      DataSource = SourceETM
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBTextEntityID: TDBText
      Left = 435
      Top = 10
      Width = 126
      Height = 25
      DataField = 'EntityID'
      DataSource = SourceETM
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object BS_ETM: TioModelDataSet
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'BS_ETM'
    Left = 112
    Top = 149
    object BS_ETMDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object BS_ETMEntityClassName: TStringField
      FieldName = 'EntityClassName'
      Size = 60
    end
    object BS_ETMEntityID: TIntegerField
      FieldName = 'EntityID'
    end
    object BS_ETMSmartEntityVersion: TStringField
      FieldName = 'SmartEntityVersion'
      Size = 100
    end
    object BS_ETMSmartUser: TStringField
      FieldName = 'SmartUser'
      Size = 100
    end
    object BS_ETMSmartActionType: TStringField
      FieldName = 'SmartActionType'
      Size = 100
    end
    object BS_ETMDiffOneWay: TStringField
      FieldName = 'DiffOneWay'
      Size = 99999
    end
  end
  object ioViewModelBridge1: TioViewModelBridge
    Left = 50
    Top = 50
  end
  object SourceETM: TDataSource
    AutoEdit = False
    DataSet = BS_ETM
    Left = 174
    Top = 149
  end
  object ActionList1: TActionList
    Left = 312
    Top = 150
    object acBack: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Back'
      Enabled = True
      Visible = True
      VMActionName = 'acBack'
    end
    object acEtmRevertToVersion: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Revert'
      Enabled = True
      Visible = True
      VMActionName = 'acEtmRevertToVersion'
    end
  end
end
