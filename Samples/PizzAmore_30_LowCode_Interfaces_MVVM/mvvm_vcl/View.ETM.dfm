inherited ViewEtm: TViewEtm
  Width = 800
  Height = 568
  ExplicitWidth = 800
  ExplicitHeight = 568
  inherited PanelMain: TPanel
    Width = 800
    Height = 568
    StyleElements = []
    ExplicitWidth = 1000
    ExplicitHeight = 700
    object Label1: TLabel [0]
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
    object Label2: TLabel [1]
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
    object Label6: TLabel [2]
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
    inherited PanelTop: TPanel
      Width = 800
      ExplicitWidth = 1000
      inherited ButtonBack: TSpeedButton
        Font.Height = -16
      end
      inherited LabelTitle: TLabel
        Width = 691
        Caption = 'Time slot'
      end
      inherited ButtonETM: TSpeedButton
        Left = 740
        Font.Height = -16
        ExplicitLeft = 740
        ExplicitTop = 8
      end
    end
    inherited PanelBottom: TPanel
      Top = 528
      Width = 800
      ExplicitTop = 660
      ExplicitWidth = 1000
      inherited ButtonRevert: TSpeedButton
        Width = 60
        Font.Height = -16
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 60
      end
      inherited ButtonPersist: TSpeedButton
        Left = 740
        Width = 60
        Font.Height = -16
        ExplicitLeft = 750
        ExplicitTop = 0
        ExplicitWidth = 60
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
      DataSource = SourceMaster
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
      DataSource = SourceMaster
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
      Width = 227
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'EntityClassname'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 726
      Top = 54
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'EntityID'
      DataSource = SourceMaster
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
      Width = 785
      Height = 425
      ActivePage = TabSheetTimeSlotData
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      StyleElements = []
      ExplicitWidth = 985
      ExplicitHeight = 452
      object TabSheetTimeSlotData: TTabSheet
        Caption = 'Time slot'
        object Label7: TLabel
          Left = -30
          Top = 17
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
          Left = 269
          Top = 17
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
          Left = 444
          Top = 17
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
          Left = -30
          Top = 72
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
          Left = -30
          Top = 127
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
          Left = -30
          Top = 158
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
          Left = -30
          Top = 245
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
          Left = 213
          Top = 245
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
          Left = 456
          Top = 245
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
          Left = -14
          Top = 190
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
          Left = -33
          Top = 301
          Width = 215
          Height = 25
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'checked by human'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 209
          Top = 301
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
          Left = 536
          Top = 300
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
          Left = -30
          Top = 355
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
          Left = 191
          Top = 17
          Width = 61
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'EntityFromVersion'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 367
          Top = 17
          Width = 61
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'EntityToVersion'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 534
          Top = 17
          Width = 158
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'EntityUpdated'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 191
          Top = 72
          Width = 157
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'UserName'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit7: TDBEdit
          Left = 354
          Top = 72
          Width = 74
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'UserID'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 191
          Top = 127
          Width = 173
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ActionType'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 191
          Top = 158
          Width = 173
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'IntentType'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBCheckBox1: TDBCheckBox
          Left = 191
          Top = 248
          Width = 21
          Height = 17
          DataField = 'ConflictDetected'
          DataSource = SourceMaster
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 319
          Top = 245
          Width = 136
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ConflictState'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 593
          Top = 245
          Width = 155
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ConflictStrategyName'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 207
          Top = 190
          Width = 37
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'BlindLevel'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object DBCheckBox2: TDBCheckBox
          Left = 268
          Top = 189
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'auto update props'
          DataField = 'BlindLevel_AutoUpdateProps'
          DataSource = SourceMaster
          TabOrder = 11
        end
        object DBCheckBox3: TDBCheckBox
          Left = 441
          Top = 191
          Width = 151
          Height = 17
          Alignment = taLeftJustify
          Caption = 'detect obj exists'
          DataField = 'BlindLevel_DetectObjExists'
          DataSource = SourceMaster
          TabOrder = 12
        end
        object DBCheckBox4: TDBCheckBox
          Left = 605
          Top = 191
          Width = 143
          Height = 17
          Alignment = taLeftJustify
          Caption = 'detect conflicts'
          DataField = 'BlindLevel_DetectConflicts'
          DataSource = SourceMaster
          TabOrder = 13
        end
        object DBCheckBox5: TDBCheckBox
          Left = 191
          Top = 304
          Width = 21
          Height = 17
          DataField = 'ConflictCheckedByHuman'
          DataSource = SourceMaster
          TabOrder = 14
        end
        object DBEdit13: TDBEdit
          Left = 363
          Top = 300
          Width = 120
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ConflictCheckedByHuman_Name'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit14: TDBEdit
          Left = 485
          Top = 300
          Width = 50
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ConflictCheckedByHuman_ID'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object DBEdit15: TDBEdit
          Left = 595
          Top = 300
          Width = 153
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'ConflictCheckedByHuman_DateTime'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object DBEdit16: TDBEdit
          Left = 191
          Top = 355
          Width = 323
          Height = 25
          BorderStyle = bsNone
          Color = clInactiveBorder
          DataField = 'TimeSlotSynchroState'
          DataSource = SourceMaster
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
          Width = 777
          Height = 389
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'EntityState'
          DataSource = SourceMaster
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          ExplicitWidth = 916
          ExplicitHeight = 416
        end
      end
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterDateAndTime: TDateTimeField
      FieldName = 'DateAndTime'
    end
    object BSMasterEntityClassname: TStringField
      FieldName = 'EntityClassname'
      Size = 100
    end
    object BSMasterEntityID: TIntegerField
      FieldName = 'EntityID'
    end
    object BSMasterEntityFromVersion: TIntegerField
      FieldName = 'EntityFromVersion'
    end
    object BSMasterEntityToVersion: TIntegerField
      FieldName = 'EntityToVersion'
    end
    object BSMasterEntityUpdated: TDateTimeField
      FieldName = 'EntityUpdated'
    end
    object BSMasterEntityState: TStringField
      FieldName = 'EntityState'
      Size = 99999
    end
    object BSMasterUserID: TIntegerField
      FieldName = 'UserID'
    end
    object BSMasterUserName: TStringField
      FieldName = 'UserName'
      Size = 100
    end
    object BSMasterActionType: TStringField
      FieldName = 'ActionType'
      Size = 50
    end
    object BSMasterIntentType: TStringField
      FieldName = 'IntentType'
      Size = 50
    end
    object BSMasterConflictDetected: TBooleanField
      FieldName = 'ConflictDetected'
    end
    object BSMasterConflictState: TStringField
      FieldName = 'ConflictState'
      Size = 50
    end
    object BSMasterConflictStrategyName: TStringField
      FieldName = 'ConflictStrategyName'
      Size = 50
    end
    object BSMasterBlindLevel: TByteField
      FieldName = 'BlindLevel'
    end
    object BSMasterBlindLevel_AutoUpdateProps: TBooleanField
      FieldName = 'BlindLevel_AutoUpdateProps'
    end
    object BSMasterBlindLevel_DetectObjExists: TBooleanField
      FieldName = 'BlindLevel_DetectObjExists'
    end
    object BSMasterBlindLevel_DetectConflicts: TBooleanField
      FieldName = 'BlindLevel_DetectConflicts'
    end
    object BSMasterConflictCheckedByHuman: TBooleanField
      FieldName = 'ConflictCheckedByHuman'
    end
    object BSMasterConflictCheckedByHuman_ID: TIntegerField
      FieldName = 'ConflictCheckedByHuman_ID'
    end
    object BSMasterConflictCheckedByHuman_Name: TStringField
      FieldName = 'ConflictCheckedByHuman_Name'
      Size = 100
    end
    object BSMasterConflictCheckedByHuman_DateTime: TDateTimeField
      FieldName = 'ConflictCheckedByHuman_DateTime'
    end
    object BSMasterTimeSlotSynchroState: TStringField
      FieldName = 'TimeSlotSynchroState'
      Size = 50
    end
  end
end
