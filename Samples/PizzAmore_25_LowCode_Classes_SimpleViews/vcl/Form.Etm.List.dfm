object EtmListForm: TEtmListForm
  Left = 0
  Top = 0
  Caption = 'EtmListForm'
  ClientHeight = 661
  ClientWidth = 984
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
    Top = 279
    Width = 984
    Height = 5
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 100
    ExplicitTop = 216
    ExplicitWidth = 588
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 980
    DesignSize = (
      984
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
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 120
      Top = 7
      Width = 693
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
      ExplicitWidth = 709
    end
    object ButtonShowTimeslot: TSpeedButton
      Left = 860
      Top = 0
      Width = 124
      Height = 40
      Action = acShowTimeSlot
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 864
    end
  end
  object PanelEntityInfo: TPanel
    Left = 0
    Top = 40
    Width = 984
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 980
    DesignSize = (
      984
      39)
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
    object ButtonRevertTo: TSpeedButton
      Left = 888
      Top = 6
      Width = 76
      Height = 28
      Action = acEtmRevertToVersion
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 904
    end
    object SpeedButton1: TSpeedButton
      Left = 720
      Top = 6
      Width = 123
      Height = 28
      Action = acEtmRevertToObject
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object GridCustomers: TDBGrid
    Left = 0
    Top = 79
    Width = 984
    Height = 200
    Align = alTop
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = SourceETM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
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
        Title.Font.Color = clBlack
        Title.Font.Height = -12
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
        Title.Caption = 'conflict checked by human'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end>
  end
  object PanelDiff: TPanel
    Left = 0
    Top = 284
    Width = 984
    Height = 377
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelDiff'
    TabOrder = 3
    ExplicitWidth = 980
    ExplicitHeight = 376
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 984
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
      Width = 984
      Height = 357
      Align = alClient
      BorderStyle = bsNone
      DataField = 'DiffOneWay'
      DataSource = SourceETM
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      ExplicitWidth = 980
      ExplicitHeight = 356
    end
  end
  object DS_ETM: TioDataSetMaster
    AsDefault = True
    TypeName = 'TEtmRepository'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 72
    Top = 280
    object DS_ETMID: TIntegerField
      FieldName = 'ID'
    end
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
      DisplayLabel = 'SmartEventType'
      FieldName = 'SmartActionType'
      Size = 100
    end
    object DS_ETMSmartConflictInfo: TStringField
      FieldName = 'SmartConflictInfo'
      Size = 250
    end
    object DS_ETMSmartConflictCheckedByHuman: TStringField
      FieldName = 'SmartConflictCheckedByHuman'
      Size = 500
    end
    object DS_ETMDiffOneWay: TStringField
      FieldName = 'DiffOneWay'
      Size = 99999
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
    object acEtmRevertToVersion: TioBS_ETM_RevertToBindSource
      Category = 'iORM - BS - ETM'
      Caption = 'Revert TO'
      TargetBindSource = DS_ETM
      AutoExec_OnETMfor_AfterRevert = doRefresh
      AutoExec_OnTargetBS_AfterRevert = doReload
      AutoExec_Persist_AfterRevert = True
    end
    object acShowTimeSlot: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Show time-slot'
      Action_ParentCloseQueryAction = acBack
      ShowMode = smBSCurrent
      TargetBindSource = DS_ETM
      ViewContextBy = vcByDefaultViewContextProvider
    end
    object acEtmRevertToObject: TioBS_ETM_RevertToObject
      Category = 'iORM - BS - ETM'
      Caption = 'Revert to Obj'
      TargetBindSource = DS_ETM
      AfterRevert = acEtmRevertToObjectAfterRevert
    end
  end
end
