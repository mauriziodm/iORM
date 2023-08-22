object PizzaForm: TPizzaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pizz'#39'Amore'
  ClientHeight = 500
  ClientWidth = 409
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 61
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
  object Label2: TLabel
    Left = 10
    Top = 101
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
  object Label3: TLabel
    Left = 10
    Top = 140
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 180
    Width = 100
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonLoadImage: TSpeedButton
    Left = 376
    Top = 180
    Width = 30
    Height = 30
    Action = acLoadImage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 405
    DesignSize = (
      409
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
      Width = 234
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Pizza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 481
    end
    object ButtonETM: TSpeedButton
      Left = 349
      Top = 0
      Width = 60
      Height = 40
      Action = acShowETM
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 358
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 460
    Width = 409
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 459
    ExplicitWidth = 405
    object ButtonRevert: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acRevertOrDelete
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
    object ButtonPersist: TSpeedButton
      Left = 359
      Top = 0
      Width = 50
      Height = 40
      Action = acPersist
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 334
      ExplicitTop = -6
    end
  end
  object DBEditID: TDBEdit
    Left = 122
    Top = 61
    Width = 55
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'ID'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEditName: TDBEdit
    Left = 122
    Top = 101
    Width = 250
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Name'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEditPrice: TDBEdit
    Left = 122
    Top = 140
    Width = 95
    Height = 25
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Price'
    DataSource = SourcePizza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBImage: TDBImage
    Left = 120
    Top = 180
    Width = 250
    Height = 250
    BorderStyle = bsNone
    Color = clInactiveBorder
    DataField = 'Image'
    DataSource = SourcePizza
    Stretch = True
    TabOrder = 5
  end
  object DSPizza: TioDataSetMaster
    AsDefault = True
    TypeName = 'TPizza'
    LoadType = ltFromBSReload
    TypeOfCollection = tcSingleObject
    OrderBy = '[TPizza.Name]'
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 32
    Top = 224
    object DSPizzaID: TIntegerField
      FieldName = 'ID'
    end
    object DSPizzaName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object DSPizzaPrice: TCurrencyField
      FieldName = 'Price'
    end
    object DSPizzaImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
  object SourcePizza: TDataSource
    DataSet = DSPizza
    Left = 32
    Top = 280
  end
  object ActionList1: TActionList
    Left = 227
    Top = 208
    object acPersist: TioBSPersistencePersist
      Category = 'iORM-BSPersistence'
      Caption = 'Persist'
      TargetBindSource = DSPizza
    end
    object acRevertOrDelete: TioBSPersistenceRevertOrDelete
      Category = 'iORM-BSPersistence'
      Caption = 'Revert'
      Action_CloseQueryAction = acBack
      TargetBindSource = DSPizza
    end
    object acLoadImage: TAction
      Caption = '...'
      OnExecute = acLoadImageExecute
    end
    object acBack: TioBSCloseQuery
      Category = 'iORM-BS'
      Caption = 'Back'
      OnUpdateScope = usGlobal
      TargetBindSource = DSPizza
    end
    object acShowETM: TioBSShowOrSelect
      Category = 'iORM - BS'
      Caption = 'Timeline'
      Action_ParentCloseQueryAction = acBack
      EntityTypeName = 'TEtmRepository'
      ShowMode = smEntityTypeNameAsETM
      TargetBindSource = DSPizza
      ViewContextBy = vcByDefaultViewContextProvider
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 232
    Top = 352
  end
end
