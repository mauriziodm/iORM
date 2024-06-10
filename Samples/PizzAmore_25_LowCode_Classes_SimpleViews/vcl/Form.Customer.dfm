object CustomerForm: TCustomerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 561
  ClientWidth = 640
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    640
    561)
  TextHeight = 15
  object Label5: TLabel
    Left = 8
    Top = 202
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 163
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'City'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 124
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Phone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 85
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 10
    Top = 45
    Width = 100
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
  object DBEditAddress: TDBEdit
    Left = 120
    Top = 202
    Width = 505
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Address'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 521
    Width = 640
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevertOrDelete
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
      Left = 590
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
  object DBEditCity: TDBEdit
    Left = 122
    Top = 163
    Width = 503
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'City'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditPhone: TDBEdit
    Left = 122
    Top = 124
    Width = 503
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'PhoneNumber'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditName: TDBEdit
    Left = 122
    Top = 85
    Width = 503
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Name'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEditID: TDBEdit
    Left = 122
    Top = 45
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourceCustomer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 6
    DesignSize = (
      640
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
      Left = 104
      Top = 7
      Width = 413
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = ' Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 369
    end
  end
  object PanelETM: TPanel
    Left = 0
    Top = 239
    Width = 640
    Height = 282
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'PanelETM'
    Color = clMenu
    ParentBackground = False
    TabOrder = 7
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 640
      Height = 282
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Timeline'
        object GridCustomers: TDBGrid
          Left = 0
          Top = 0
          Width = 632
          Height = 250
          Align = alClient
          BorderStyle = bsNone
          Color = clMenu
          Ctl3D = False
          DataSource = SourceETM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DateAndTime'
              Title.Alignment = taCenter
              Title.Caption = 'when'
              Width = 160
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartActionType'
              Title.Alignment = taCenter
              Title.Caption = 'action type'
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartEntityVersion'
              Title.Alignment = taCenter
              Title.Caption = 'version'
              Width = 130
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartUser'
              Title.Alignment = taCenter
              Title.Caption = 'user'
              Width = 90
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Diff'
        ImageIndex = 1
        object DiffMemo: TDBMemo
          Left = 0
          Top = 0
          Width = 636
          Height = 250
          Align = alClient
          BorderStyle = bsNone
          DataField = 'DiffOneWay'
          DataSource = SourceETM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          ExplicitWidth = 580
        end
      end
    end
  end
  object ButtonRevertToVersion: TButton
    Left = 474
    Top = 241
    Width = 139
    Height = 23
    Action = acEtmRevertToVersion
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object DSCustomer: TioDataSetMaster
    AsDefault = True
    TypeName = 'TCustomer'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    VirtualFields = True
    Paging.CurrentPageOfFormat = '%d/%d'
    Paging.PageSize = 10
    Left = 320
    Top = 48
    object DSCustomerID: TIntegerField
      FieldName = 'ID'
    end
    object DSCustomerName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSCustomerPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 100
    end
    object DSCustomerCity: TStringField
      FieldName = 'City'
      Size = 100
    end
    object DSCustomerAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
  end
  object SourceCustomer: TDataSource
    DataSet = DSCustomer
    Left = 320
    Top = 104
  end
  object ActionList1: TActionList
    Left = 416
    Top = 48
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSCustomer
    end
    object acRevertOrDelete: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      Action_CloseQueryAction = acBack
      TargetBindSource = DSCustomer
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      TargetBindSource = DSCustomer
      OnUpdateScope = usGlobal
    end
    object acEtmRevertToVersion: TioBS_ETM_RevertToBindSource
      Category = 'iORM - BS - ETM'
      Caption = 'Revert to version'
      TargetBindSource = DS_ETM
      AutoExec_OnETMfor_AfterRevert = doRefresh
      AutoExec_OnTargetBS_AfterRevert = doReload
      AutoExec_Persist_AfterRevert = True
    end
  end
  object SourceETM: TDataSource
    AutoEdit = False
    DataSet = DS_ETM
    Left = 32
    Top = 400
  end
  object DS_ETM: TioDataSetMaster
    AsDefault = False
    TypeName = 'TEtmRepository'
    ETMfor = DSCustomer
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 32
    Top = 344
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
      FieldName = 'SmartActionType'
      Size = 100
    end
    object DS_ETMDiffOneWay: TStringField
      FieldName = 'DiffOneWay'
      Size = 65535
    end
    object DS_ETMDiffOnewayMoreInfo: TStringField
      FieldName = 'DiffOnewayMoreInfo'
      Size = 65535
    end
    object DS_ETMDiffTwoWay: TStringField
      FieldName = 'DiffTwoWay'
      Size = 65535
    end
    object DS_ETMDiffTwowayMoreInfo: TStringField
      FieldName = 'DiffTwowayMoreInfo'
      Size = 65535
    end
  end
end
