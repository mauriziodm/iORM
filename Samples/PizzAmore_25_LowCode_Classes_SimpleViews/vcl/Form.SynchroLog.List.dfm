object SynchroLogListForm: TSynchroLogListForm
  Left = 0
  Top = 0
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 661
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 240
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
      Left = 112
      Top = 7
      Width = 705
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Synchro log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 717
    end
  end
  object PanelTimeSlots: TPanel
    Left = 0
    Top = 245
    Width = 984
    Height = 416
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelTimeSlots'
    TabOrder = 1
    ExplicitWidth = 980
    ExplicitHeight = 415
    DesignSize = (
      984
      416)
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 984
      Height = 30
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time-slots'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 988
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 30
      Width = 984
      Height = 386
      Align = alClient
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
      TabOrder = 0
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
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 160
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EntityClassName'
          Title.Alignment = taCenter
          Title.Caption = 'entity class'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EntityID'
          Title.Alignment = taCenter
          Title.Caption = 'entity ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SmartActionType'
          Title.Alignment = taCenter
          Title.Caption = 'action type'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
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
          Title.Font.Color = clWindowText
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
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 90
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
          Width = 170
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
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 170
          Visible = True
        end>
    end
    object ButtonShowTimeslot: TButton
      Left = 852
      Top = 3
      Width = 110
      Height = 22
      Action = acShowTimeSlot
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 848
    end
  end
  object GridCustomers: TDBGrid
    Left = 0
    Top = 40
    Width = 984
    Height = 200
    Align = alTop
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = SourceSynchroLog
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
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DateAndTime'
        Title.Alignment = taCenter
        Title.Caption = 'when'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SynchroLogName'
        Title.Alignment = taCenter
        Title.Caption = 'synchro log name'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SynchroLevel'
        Title.Alignment = taCenter
        Title.Caption = 'synchro level'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SynchroStatus'
        Title.Alignment = taCenter
        Title.Caption = 'synchro status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ErrorState'
        Title.Alignment = taCenter
        Title.Caption = 'error'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartCount'
        Title.Alignment = taCenter
        Title.Caption = 'obj count'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartUser'
        Title.Alignment = taCenter
        Title.Caption = 'user'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EtmTimeSlot_ClassName'
        Title.Alignment = taCenter
        Title.Caption = 'etm class'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartCliToSrv_TimeSlotID'
        Title.Alignment = taCenter
        Title.Caption = 'to srv etm ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SmartSrvToCli_TimeSlotID'
        Title.Alignment = taCenter
        Title.Caption = 'to cli etm ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Start'
        Title.Alignment = taCenter
        Title.Caption = '0-start'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LoadFromClient'
        Title.Alignment = taCenter
        Title.Caption = '1-load from cli'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PersistToServer'
        Title.Alignment = taCenter
        Title.Caption = '2-save to srv'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ReloadFromServer'
        Title.Alignment = taCenter
        Title.Caption = '3-reload from srv'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PersistToClient'
        Title.Alignment = taCenter
        Title.Caption = '4-save to cli'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Finalize'
        Title.Alignment = taCenter
        Title.Caption = '5-finalize'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Completed'
        Title.Alignment = taCenter
        Title.Caption = '6-completed'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ErrorMsg'
        Title.Caption = 'error message'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 1000
        Visible = True
      end>
  end
  object DSSynchroLog: TioDataSetMaster
    AsDefault = True
    TypeName = 'TioEtmSynchroStrategy_LogItem'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 96
    Top = 128
    object DSSynchroLogID: TIntegerField
      FieldName = 'ID'
    end
    object DSSynchroLogDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object DSSynchroLogSynchroLevel: TStringField
      FieldName = 'SynchroLevel'
      Size = 50
    end
    object DSSynchroLogSynchroLogName: TStringField
      FieldName = 'SynchroLogName'
      Size = 100
    end
    object DSSynchroLogSynchroStatus: TStringField
      FieldName = 'SynchroStatus'
      Size = 50
    end
    object DSSynchroLogEtmTimeSlot_ClassName: TStringField
      FieldName = 'EtmTimeSlot_ClassName'
      Size = 100
    end
    object DSSynchroLogStart: TTimeField
      FieldName = 'Start'
    end
    object DSSynchroLogLoadFromClient: TTimeField
      FieldName = 'LoadFromClient'
    end
    object DSSynchroLogPersistToServer: TTimeField
      FieldName = 'PersistToServer'
    end
    object DSSynchroLogReloadFromServer: TTimeField
      FieldName = 'ReloadFromServer'
    end
    object DSSynchroLogPersistToClient: TTimeField
      FieldName = 'PersistToClient'
    end
    object DSSynchroLogFinalize: TTimeField
      FieldName = 'Finalize'
    end
    object DSSynchroLogCompleted: TTimeField
      FieldName = 'Completed'
    end
    object DSSynchroLogSmartCount: TStringField
      FieldName = 'SmartCount'
      Size = 50
    end
    object DSSynchroLogSmartUser: TStringField
      FieldName = 'SmartUser'
      Size = 100
    end
    object DSSynchroLogSmartCliToSrv_TimeSlotID: TStringField
      FieldName = 'SmartCliToSrv_TimeSlotID'
      Size = 50
    end
    object DSSynchroLogSmartSrvToCli_TimeSlotID: TStringField
      FieldName = 'SmartSrvToCli_TimeSlotID'
      Size = 100
    end
    object DSSynchroLogErrorState: TStringField
      FieldName = 'ErrorState'
      Size = 50
    end
    object DSSynchroLogErrorMsg: TStringField
      FieldName = 'ErrorMsg'
      Size = 1000
    end
  end
  object SourceSynchroLog: TDataSource
    AutoEdit = False
    DataSet = DSSynchroLog
    Left = 96
    Top = 184
  end
  object ActionList1: TActionList
    Left = 307
    Top = 168
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      OnUpdateScope = usGlobal
    end
    object acShowTimeSlot: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Show time-slot'
      Action_ParentCloseQueryAction = acBack
      ShowMode = smBSCurrent
      TargetBindSource = DS_ETM
      ViewContextBy = vcByDefaultViewContextProvider
    end
  end
  object DS_ETM: TioDataSetDetail
    AsDefault = False
    MasterBindSource = DSSynchroLog
    MasterPropertyName = 'EtmTimeslotsSrv'
    Left = 96
    Top = 341
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
    object DS_ETMSmartActionType: TStringField
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
  end
  object SourceETM: TDataSource
    AutoEdit = False
    DataSet = DS_ETM
    Left = 96
    Top = 400
  end
end
