object EtmForm: TEtmForm
  Left = 0
  Top = 0
  Caption = 'EtmForm'
  ClientHeight = 562
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 216
    Width = 588
    Height = 5
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 100
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 584
    DesignSize = (
      588
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
      Left = 88
      Top = 7
      Width = 369
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
      ExplicitWidth = 409
    end
    object ButtonRevert: TSpeedButton
      Left = 538
      Top = 0
      Width = 50
      Height = 40
      Align = alRight
      Caption = 'Revert'
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
  object PanelEntityInfo: TPanel
    Left = 0
    Top = 40
    Width = 588
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 584
    object Label1: TLabel
      Left = -1
      Top = 10
      Width = 110
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Time line for'
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
      Left = 128
      Top = 10
      Width = 257
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
  object GridCustomers: TDBGrid
    Left = 0
    Top = 79
    Width = 588
    Height = 137
    Align = alTop
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = SourceETM
    ParentCtl3D = False
    TabOrder = 2
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
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartEventType'
        Title.Alignment = taCenter
        Title.Caption = 'event type'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 200
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
        Width = 130
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
        Width = 90
        Visible = True
      end>
  end
  object PanelDiff: TPanel
    Left = 0
    Top = 221
    Width = 588
    Height = 341
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelDiff'
    TabOrder = 3
    ExplicitWidth = 584
    ExplicitHeight = 340
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 588
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
    end
    object Diff: TDBMemo
      Left = 0
      Top = 20
      Width = 588
      Height = 321
      Align = alClient
      BorderStyle = bsNone
      DataField = 'DiffOneWay'
      DataSource = SourceETM
      TabOrder = 0
      ExplicitWidth = 584
      ExplicitHeight = 320
    end
  end
  object DS_ETM: TioDataSetMaster
    AsDefault = True
    TypeName = 'TEtmRepository'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 72
    Top = 280
    object DS_ETMDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object DS_ETMEntityClassName: TStringField
      FieldName = 'EntityClassName'
      Size = 60
    end
    object DS_ETMEntityID: TIntegerField
      FieldName = 'EntityID'
    end
    object DS_ETMSmartEntityVersion: TStringField
      FieldName = 'SmartEntityVersion'
      Size = 100
    end
    object DS_ETMSmartUser: TStringField
      FieldName = 'SmartUser'
      Size = 100
    end
    object DS_ETMSmartEventType: TStringField
      FieldName = 'SmartEventType'
      Size = 100
    end
    object DS_ETMDiffOneWay: TStringField
      FieldName = 'DiffOneWay'
      Size = 65535
    end
  end
  object SourceETM: TDataSource
    AutoEdit = False
    DataSet = DS_ETM
    Left = 136
    Top = 280
  end
  object ActionList1: TActionList
    Left = 283
    Top = 280
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      OnUpdateScope = usGlobal
    end
  end
end
