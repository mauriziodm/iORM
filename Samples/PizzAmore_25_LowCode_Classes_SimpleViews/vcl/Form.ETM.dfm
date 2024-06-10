object FormEtm: TFormEtm
  Left = 0
  Top = 0
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 599
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    956
    599)
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 54
    Width = 31
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
  object Label2: TLabel
    Left = 112
    Top = 54
    Width = 57
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'when'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 360
    Top = 54
    Width = 129
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'entity class && ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 952
    DesignSize = (
      956
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
      Left = 96
      Top = 7
      Width = 733
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Time slot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 417
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 559
    Width = 956
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 558
    ExplicitWidth = 952
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevert
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
    object ButtonPersist: TSpeedButton
      Left = 906
      Top = 0
      Width = 50
      Height = 40
      Action = acPersist
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
  end
  object DBEditID: TDBEdit
    Left = 50
    Top = 53
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourceTimeSlot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditName: TDBEdit
    Left = 175
    Top = 54
    Width = 175
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'DateAndTime'
    DataSource = SourceTimeSlot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit1: TDBEdit
    Left = 495
    Top = 54
    Width = 226
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'EntityClassname'
    DataSource = SourceTimeSlot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 727
    Top = 54
    Width = 74
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'EntityID'
    DataSource = SourceTimeSlot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 96
    Width = 928
    Height = 452
    ActivePage = TabSheetTimeSlotData
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    ExplicitWidth = 924
    ExplicitHeight = 451
    object TabSheetTimeSlotData: TTabSheet
      Caption = 'Time slot'
      object Label7: TLabel
        Left = 10
        Top = 25
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'entity from version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 309
        Top = 25
        Width = 79
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'to version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 484
        Top = 25
        Width = 79
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'updated'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 80
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'user name && ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 10
        Top = 135
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'action type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 10
        Top = 166
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'intent type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 10
        Top = 253
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'conflict detected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 309
        Top = 253
        Width = 103
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'conflict state'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 576
        Top = 253
        Width = 132
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'conflict strategy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 10
        Top = 198
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'blind level'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 7
        Top = 309
        Width = 215
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'conflict checked by human'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 265
        Top = 309
        Width = 148
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'human name && ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 654
        Top = 308
        Width = 53
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'when'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 10
        Top = 363
        Width = 212
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'synchronization state'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit3: TDBEdit
        Left = 231
        Top = 25
        Width = 61
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'EntityFromVersion'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 407
        Top = 25
        Width = 61
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'EntityToVersion'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 574
        Top = 25
        Width = 158
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'EntityUpdated'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit6: TDBEdit
        Left = 231
        Top = 80
        Width = 157
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'UserName'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 394
        Top = 80
        Width = 74
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'UserID'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 231
        Top = 135
        Width = 173
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ActionType'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit9: TDBEdit
        Left = 231
        Top = 166
        Width = 173
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'IntentType'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBCheckBox1: TDBCheckBox
        Left = 231
        Top = 256
        Width = 21
        Height = 17
        DataField = 'ConflictDetected'
        DataSource = SourceTimeSlot
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 423
        Top = 253
        Width = 136
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ConflictState'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 721
        Top = 253
        Width = 190
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ConflictStrategyName'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object DBEdit12: TDBEdit
        Left = 231
        Top = 198
        Width = 37
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'BlindLevel'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DBCheckBox2: TDBCheckBox
        Left = 309
        Top = 197
        Width = 167
        Height = 17
        Alignment = taLeftJustify
        Caption = 'auto update props'
        DataField = 'BlindLevel_AutoUpdateProps'
        DataSource = SourceTimeSlot
        TabOrder = 11
      end
      object DBCheckBox3: TDBCheckBox
        Left = 525
        Top = 197
        Width = 151
        Height = 17
        Alignment = taLeftJustify
        Caption = 'detect obj exists'
        DataField = 'BlindLevel_DetectObjExists'
        DataSource = SourceTimeSlot
        TabOrder = 12
      end
      object DBCheckBox4: TDBCheckBox
        Left = 725
        Top = 197
        Width = 143
        Height = 17
        Alignment = taLeftJustify
        Caption = 'detect conflicts'
        DataField = 'BlindLevel_DetectConflicts'
        DataSource = SourceTimeSlot
        TabOrder = 13
      end
      object DBCheckBox5: TDBCheckBox
        Left = 231
        Top = 312
        Width = 21
        Height = 17
        DataField = 'ConflictCheckedByHuman'
        DataSource = SourceTimeSlot
        TabOrder = 14
      end
      object DBEdit13: TDBEdit
        Left = 427
        Top = 308
        Width = 148
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ConflictCheckedByHuman_Name'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object DBEdit14: TDBEdit
        Left = 581
        Top = 308
        Width = 52
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ConflictCheckedByHuman_ID'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object DBEdit15: TDBEdit
        Left = 725
        Top = 308
        Width = 158
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'ConflictCheckedByHuman_DateTime'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object DBEdit16: TDBEdit
        Left = 231
        Top = 363
        Width = 323
        Height = 25
        BorderStyle = bsNone
        Color = clInactiveBorder
        DataField = 'TimeSlotSynchroState'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
    end
    object TabSheetEneityState: TTabSheet
      Caption = ' Entity state '
      ImageIndex = 1
      object DBMemoEntityState: TDBMemo
        Left = 0
        Top = 0
        Width = 920
        Height = 416
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'EntityState'
        DataSource = SourceTimeSlot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object DSTimeSlot: TioDataSetMaster
    AsDefault = True
    TypeName = 'TEtmRepository'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    VirtualFields = True
    Paging.CurrentPageOfFormat = '%d/%d'
    Paging.PageSize = 10
    Left = 576
    Top = 208
    object DSTimeSlotID: TIntegerField
      FieldName = 'ID'
    end
    object DSTimeSlotDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object DSTimeSlotEntityClassname: TStringField
      FieldName = 'EntityClassname'
      Size = 100
    end
    object DSTimeSlotEntityID: TIntegerField
      FieldName = 'EntityID'
    end
    object DSTimeSlotEntityFromVersion: TIntegerField
      FieldName = 'EntityFromVersion'
    end
    object DSTimeSlotEntityVersion: TIntegerField
      FieldName = 'EntityToVersion'
    end
    object DSTimeSlotEntityUpdated: TDateTimeField
      FieldName = 'EntityUpdated'
    end
    object DSTimeSlotEntityState: TStringField
      FieldName = 'EntityState'
      Size = 99999
    end
    object DSTimeSlotUserID: TIntegerField
      FieldName = 'UserID'
    end
    object DSTimeSlotUserName: TStringField
      FieldName = 'UserName'
      Size = 100
    end
    object DSTimeSlotActionType: TStringField
      FieldName = 'ActionType'
      Size = 50
    end
    object DSTimeSlotIntentType: TStringField
      FieldName = 'IntentType'
      Size = 50
    end
    object DSTimeSlotConflictDetected: TBooleanField
      FieldName = 'ConflictDetected'
    end
    object DSTimeSlotConflictState: TStringField
      FieldName = 'ConflictState'
      Size = 50
    end
    object DSTimeSlotConflictStrategyName: TStringField
      FieldName = 'ConflictStrategyName'
      Size = 50
    end
    object DSTimeSlotBlindLevel: TByteField
      FieldName = 'BlindLevel'
    end
    object DSTimeSlotBlindLevel_AutoUpdateProps: TBooleanField
      FieldName = 'BlindLevel_AutoUpdateProps'
    end
    object DSTimeSlotBlindLevel_DetectObjExists: TBooleanField
      FieldName = 'BlindLevel_DetectObjExists'
    end
    object DSTimeSlotBlindLevel_DetectConflicts: TBooleanField
      FieldName = 'BlindLevel_DetectConflicts'
    end
    object DSTimeSlotConflictCheckedByHuman: TBooleanField
      FieldName = 'ConflictCheckedByHuman'
    end
    object DSTimeSlotConflictCheckedByHuman_ID: TIntegerField
      FieldName = 'ConflictCheckedByHuman_ID'
    end
    object DSTimeSlotConflictCheckedByHuman_Name: TStringField
      FieldName = 'ConflictCheckedByHuman_Name'
      Size = 100
    end
    object DSTimeSlotConflictCheckedByHuman_DateTime: TDateTimeField
      FieldName = 'ConflictCheckedByHuman_DateTime'
    end
    object DSTimeSlotTimeSlotSynchroState: TStringField
      FieldName = 'TimeSlotSynchroState'
      Size = 50
    end
  end
  object SourceTimeSlot: TDataSource
    DataSet = DSTimeSlot
    Left = 576
    Top = 264
  end
  object ActionList1: TActionList
    Left = 672
    Top = 208
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSTimeSlot
      OnUpdateScope = usGlobal
    end
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSTimeSlot
    end
    object acRevert: TioBSPersistenceRevert
      Category = 'iORM - BS - Persistence'
      Caption = 'Revert'
      TargetBindSource = DSTimeSlot
    end
  end
end
