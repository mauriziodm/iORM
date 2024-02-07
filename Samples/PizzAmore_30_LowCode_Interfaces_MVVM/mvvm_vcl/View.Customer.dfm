inherited ViewCustomer: TViewCustomer
  Width = 800
  ExplicitWidth = 800
  inherited PanelMain: TPanel
    Width = 800
    ExplicitWidth = 800
    object Label1: TLabel [0]
      Left = 10
      Top = 61
      Width = 80
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
      Left = 10
      Top = 101
      Width = 80
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
    object Label3: TLabel [2]
      Left = 10
      Top = 148
      Width = 80
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
    object Label4: TLabel [3]
      Left = 10
      Top = 195
      Width = 80
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
    object Label5: TLabel [4]
      Left = 8
      Top = 234
      Width = 80
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
    inherited PanelTop: TPanel
      Width = 800
      ExplicitWidth = 800
      DesignSize = (
        800
        40)
      inherited LabelTitle: TLabel
        Width = 691
        Caption = 'Customer'
        ExplicitWidth = 691
      end
      inherited ButtonETM: TSpeedButton
        Left = 740
        Visible = False
        ExplicitLeft = 740
      end
    end
    object DBEditID: TDBEdit [6]
      Left = 110
      Top = 61
      Width = 55
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'ID'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object DBEditName: TDBEdit [7]
      Left = 110
      Top = 101
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'Name'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object DBEditPhone: TDBEdit [8]
      Left = 110
      Top = 148
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'PhoneNumber'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object DBEditCity: TDBEdit [9]
      Left = 110
      Top = 195
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'City'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object DBEditAddress: TDBEdit [10]
      Left = 110
      Top = 234
      Width = 400
      Height = 25
      AutoSize = False
      BorderStyle = bsNone
      Color = clInactiveBorder
      Ctl3D = False
      DataField = 'Address'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    inherited PanelBottom: TPanel
      Width = 800
      TabOrder = 6
      ExplicitWidth = 800
      inherited ButtonPersist: TSpeedButton
        Left = 750
        ExplicitLeft = 750
      end
    end
  end
  object PanelETM: TPanel [1]
    Left = 0
    Top = 279
    Width = 801
    Height = 282
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Caption = 'PanelETM'
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      801
      282)
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 801
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
          Width = 793
          Height = 250
          Align = alClient
          BorderStyle = bsNone
          Color = clMenu
          Ctl3D = False
          DataSource = SourceETM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartActionType'
              Title.Alignment = taCenter
              Title.Caption = 'action type'
              Width = 250
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartEntityVersion'
              Title.Alignment = taCenter
              Title.Caption = 'version'
              Width = 180
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SmartUser'
              Title.Alignment = taCenter
              Title.Caption = 'user'
              Width = 120
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
          Width = 793
          Height = 250
          Align = alClient
          BorderStyle = bsNone
          DataField = 'DiffOneWay'
          DataSource = SourceETM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object ButtonRevertToVersion: TButton
      Left = 675
      Top = 3
      Width = 121
      Height = 20
      Action = acEtmRevertToVersion
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  inherited ActionList1: TActionList
    Left = 259
    Top = 83
    object acEtmRevertToVersion: TioViewAction [3]
      Category = 'iORM - MVVM'
      Caption = 'Revert to version'
      Enabled = True
      Visible = True
      VMActionName = 'acEtmRevertToVersion'
    end
  end
  inherited BSMaster: TioModelDataSet
    Left = 259
    Top = 194
    object MDSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object MDSMasterName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object MDSMasterPhoneNumber: TStringField
      FieldName = 'PhoneNumber'
      Size = 250
    end
    object MDSMasterCity: TStringField
      FieldName = 'City'
      Size = 250
    end
    object MDSMasterAddress: TStringField
      FieldName = 'Address'
      Size = 250
    end
  end
  inherited VMBridge: TioViewModelBridge
    Left = 258
    Top = 138
  end
  inherited SourceMaster: TDataSource
    Left = 259
    Top = 250
  end
  object BS_ETM: TioModelDataSet
    ViewModelBridge = VMBridge
    ModelPresenter = 'BS_ETM'
    Left = 360
    Top = 193
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
      Size = 65535
    end
  end
  object SourceETM: TDataSource
    AutoEdit = False
    DataSet = BS_ETM
    Left = 360
    Top = 250
  end
end
