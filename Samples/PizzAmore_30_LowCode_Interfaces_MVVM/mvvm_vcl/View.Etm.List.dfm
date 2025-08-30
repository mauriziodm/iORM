inherited ViewEtmList: TViewEtmList
  Width = 1000
  Height = 800
  ExplicitWidth = 1000
  ExplicitHeight = 800
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 279
    Width = 1000
    Height = 5
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    Beveled = True
    Color = clBtnFace
    MinSize = 100
    ParentColor = False
    StyleElements = []
    ExplicitTop = 216
    ExplicitWidth = 588
  end
  inherited PanelTop: TPanel
    Width = 1000
    ExplicitWidth = 1000
    inherited ButtonSelect: TSpeedButton
      Left = 940
      ExplicitLeft = 950
    end
    inherited LabelTitle: TLabel
      Width = 880
      Caption = 'Entity Time Machine'
      ExplicitWidth = 157
    end
  end
  inherited PanelBottom: TPanel
    Top = 760
    Width = 1000
    ExplicitTop = 760
    ExplicitWidth = 1000
    inherited ButtonAdd: TSpeedButton
      Left = 940
      ExplicitLeft = 950
    end
  end
  inherited PanelWhere: TPanel
    Top = 681
    Width = 1000
    Visible = False
    ExplicitTop = 681
    ExplicitWidth = 1000
    inherited ButtonSearch: TSpeedButton
      Left = 950
      ExplicitLeft = 950
    end
    inherited ButtonClear: TSpeedButton
      Left = 950
      ExplicitLeft = 950
    end
  end
  object PanelDiff: TPanel [4]
    Left = 0
    Top = 284
    Width = 1000
    Height = 397
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelDiff'
    TabOrder = 3
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 1000
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
      Transparent = False
      StyleElements = []
      ExplicitWidth = 588
    end
    object DiffMemo: TDBMemo
      Left = 0
      Top = 20
      Width = 1000
      Height = 377
      Align = alClient
      BorderStyle = bsNone
      DataField = 'DiffOneWay'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GridCustomers: TDBGrid [5]
    Left = 0
    Top = 79
    Width = 1000
    Height = 200
    Align = alTop
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = SourceMaster
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
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
        Width = 160
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
        Width = 150
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
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartConflictInfo'
        Title.Alignment = taCenter
        Title.Caption = 'conflict'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 220
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartConflictCheckedByHuman'
        Title.Alignment = taCenter
        Title.Caption = 'checked by human'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end>
  end
  object PanelEntityInfo: TPanel [6]
    Left = 0
    Top = 40
    Width = 1000
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    StyleElements = []
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
      DataSource = SourceMaster
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
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ButtonRevertToObj: TSpeedButton
      Left = 880
      Top = 0
      Width = 120
      Height = 39
      Action = acEtmRevertToObj
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 910
    end
    object ButtonRevertToDB: TSpeedButton
      Left = 760
      Top = 0
      Width = 120
      Height = 39
      Action = acEtmRevertToDB
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 820
    end
  end
  inherited ActionList1: TActionList
    inherited acShowOrSelect: TioViewAction
      Caption = 'Show'
    end
    object acEtmRevertToDB: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Revert to DB'
      Enabled = True
      Visible = True
      VMActionName = 'acEtmRevertToDB'
    end
    object acEtmRevertToObj: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Revert to OBJ'
      Enabled = True
      Visible = True
      VMActionName = 'acEtmRevertToObj'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object BSMasterEntityClassName: TStringField
      FieldName = 'EntityClassName'
      Size = 60
    end
    object BSMasterEntityID: TIntegerField
      FieldName = 'EntityID'
    end
    object BSMasterSmartEntityVersion: TStringField
      FieldName = 'SmartEntityVersion'
      Size = 100
    end
    object BSMasterSmartUser: TStringField
      FieldName = 'SmartUser'
      Size = 100
    end
    object BSMasterSmartActionType: TStringField
      FieldName = 'SmartActionType'
      Size = 100
    end
    object BSMasterSmartConflictInfo: TStringField
      FieldName = 'SmartConflictInfo'
      Size = 250
    end
    object BSMasterSmartConflictCheckedByHuman: TStringField
      FieldName = 'SmartConflictCheckedByHuman'
      Size = 500
    end
    object BSMasterDiffOneWay: TStringField
      FieldName = 'DiffOneWay'
      Size = 99999
    end
  end
end
