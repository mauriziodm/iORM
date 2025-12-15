inherited ViewSynchroLogList: TViewSynchroLogList
  Width = 1000
  Height = 800
  Font.Height = -16
  ParentFont = False
  ExplicitWidth = 1000
  ExplicitHeight = 800
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 240
    Width = 1000
    Height = 5
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 100
    ExplicitTop = 216
    ExplicitWidth = 588
  end
  inherited PanelTop: TPanel
    Width = 1000
    ExplicitWidth = 1000
    inherited ButtonSelect: TSpeedButton
      Left = 930
      ExplicitLeft = 950
    end
    inherited LabelTitle: TLabel
      Width = 860
      Caption = 'Synchro log'
      ExplicitWidth = 900
    end
  end
  inherited PanelBottom: TPanel
    Top = 760
    Width = 1000
    Visible = False
    ExplicitTop = 760
    ExplicitWidth = 1000
    inherited ButtonAdd: TSpeedButton
      Left = 930
      ExplicitLeft = 940
    end
  end
  inherited PanelWhere: TPanel
    Top = 681
    Width = 1000
    Visible = False
    ExplicitTop = 681
    ExplicitWidth = 1000
  end
  object PanelTimeSlots: TPanel [4]
    Left = 0
    Top = 245
    Width = 1000
    Height = 436
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelTimeSlots'
    TabOrder = 3
    DesignSize = (
      1000
      436)
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 1000
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
    object GridETM: TDBGrid
      Left = 0
      Top = 30
      Width = 1000
      Height = 406
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
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end>
    end
    object ButtonShowTimeslot: TButton
      Left = 848
      Top = 2
      Width = 122
      Height = 25
      Action = acShowTimeSlot
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GridCustomers: TDBGrid [5]
    Left = 0
    Top = 40
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
  inherited ActionList1: TActionList
    object acShowTimeSlot: TioViewAction
      Category = 'iORM - MVVM'
      Caption = 'Show time-slot'
      Enabled = True
      Visible = True
      VMActionName = 'acShowTimeSlot'
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object BSMasterSynchroLevel: TStringField
      FieldName = 'SynchroLevel'
      Size = 50
    end
    object BSMasterSynchroLogName: TStringField
      FieldName = 'SynchroLogName'
      Size = 100
    end
    object BSMasterSynchroStatus: TStringField
      FieldName = 'SynchroStatus'
      Size = 50
    end
    object BSMasterEtmTimeSlot_ClassName: TStringField
      FieldName = 'EtmTimeSlot_ClassName'
      Size = 100
    end
    object BSMasterStart: TTimeField
      FieldName = 'Start'
    end
    object BSMasterLoadFromClient: TTimeField
      FieldName = 'LoadFromClient'
    end
    object BSMasterPersistToServer: TTimeField
      FieldName = 'PersistToServer'
    end
    object BSMasterReloadFromServer: TTimeField
      FieldName = 'ReloadFromServer'
    end
    object BSMasterPersistToClient: TTimeField
      FieldName = 'PersistToClient'
    end
    object BSMasterFinalize: TTimeField
      FieldName = 'Finalize'
    end
    object BSMasterCompleted: TTimeField
      FieldName = 'Completed'
    end
    object BSMasterSmartCount: TStringField
      FieldName = 'SmartCount'
      Size = 50
    end
    object BSMasterSmartUser: TStringField
      FieldName = 'SmartUser'
      Size = 100
    end
    object BSMasterSmartCliToSrv_TimeSlotID: TStringField
      FieldName = 'SmartCliToSrv_TimeSlotID'
      Size = 50
    end
    object BSMasterSmartSrvToCli_TimeSlotID: TStringField
      FieldName = 'SmartSrvToCli_TimeSlotID'
      Size = 100
    end
    object BSMasterErrorState: TStringField
      FieldName = 'ErrorState'
      Size = 50
    end
    object BSMasterErrorMsg: TStringField
      FieldName = 'ErrorMsg'
      Size = 1000
    end
  end
  inherited BSWhere: TioModelDataSet
    Left = 211
    Top = 698
  end
  inherited SourceWhere: TDataSource
    Left = 294
    Top = 698
  end
  object BS_ETM: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BS_ETM'
    Left = 200
    Top = 341
    object BS_ETMID: TIntegerField
      FieldName = 'ID'
    end
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
      DisplayLabel = 'SmartEventType'
      FieldName = 'SmartActionType'
      Size = 100
    end
    object BS_ETMSmartConflictInfo: TStringField
      FieldName = 'SmartConflictInfo'
      Size = 250
    end
    object BS_ETMSmartConflictCheckedByHuman: TStringField
      FieldName = 'SmartConflictCheckedByHuman'
      Size = 500
    end
  end
  object SourceETM: TDataSource
    DataSet = BS_ETM
    Left = 286
    Top = 342
  end
end
