object DataSetView: TDataSetView
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'DataSetView'
  ClientHeight = 636
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    619
    636)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 6
    Width = 161
    Height = 19
    AutoSize = False
    Caption = 'Master DataSet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 456
    Width = 161
    Height = 19
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Detail DataSet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 541
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 597
    Height = 280
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = MasterDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descrizione'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PropDateTime'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PropBitMap'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PropBoolean'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BelongsToDetail.Descrizione'
        Width = 150
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 481
    Width = 597
    Height = 144
    Anchors = [akLeft, akRight, akBottom]
    DataSource = DetailDataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 366
    Top = 6
    Width = 230
    Height = 25
    DataSource = MasterDataSource
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object DBNavigator2: TDBNavigator
    Left = 365
    Top = 455
    Width = 240
    Height = 25
    DataSource = DetailDataSource
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 314
    Width = 597
    Height = 135
    Anchors = [akLeft, akRight, akBottom]
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object Label3: TLabel
      Left = 15
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Descrizione'
    end
    object Label4: TLabel
      Left = 175
      Top = 88
      Width = 134
      Height = 13
      Caption = 'BelongsToDetail.Descrizione'
    end
    object DBImage1: TDBImage
      Left = 464
      Top = 6
      Width = 125
      Height = 124
      DataField = 'PropBitMap'
      DataSource = MasterDataSource
      Stretch = True
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 328
      Top = 15
      Width = 97
      Height = 17
      Caption = 'PropBoolean'
      DataField = 'PropBoolean'
      DataSource = MasterDataSource
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 76
      Top = 14
      Width = 121
      Height = 19
      DataField = 'Descrizione'
      DataSource = MasterDataSource
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 320
      Top = 86
      Width = 121
      Height = 19
      DataField = 'BelongsToDetail.Descrizione'
      DataSource = MasterDataSource
      TabOrder = 3
    end
  end
  object ioViewModelBridge1: TioViewModelBridge
    Left = 136
    Top = 96
  end
  object ModelMasterDataSet: TioModelDataSet
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'ModelMasterPresenter'
    Left = 136
    Top = 184
    object ModelMasterDataSetID: TIntegerField
      FieldName = 'ID'
    end
    object ModelMasterDataSetDescrizione: TStringField
      FieldName = 'Descrizione'
      Size = 100
    end
    object ModelMasterDataSetPropDateTime: TDateTimeField
      FieldName = 'PropDateTime'
    end
    object ModelMasterDataSetPropBitMap: TGraphicField
      FieldName = 'PropBitMap'
      BlobType = ftGraphic
    end
    object ModelMasterDataSetPropBoolean: TBooleanField
      FieldName = 'PropBoolean'
    end
    object ModelMasterDataSetBelongsToDetailDescrizione: TStringField
      FieldName = 'BelongsToDetail.Descrizione'
      Size = 100
    end
  end
  object MasterDataSource: TDataSource
    DataSet = ModelMasterDataSet
    Left = 136
    Top = 232
  end
  object ModelDetailDataSet: TioModelDataSet
    ViewModelBridge = ioViewModelBridge1
    ModelPresenter = 'ModelDetailPresenter'
    Left = 344
    Top = 184
  end
  object DetailDataSource: TDataSource
    DataSet = ModelDetailDataSet
    Left = 344
    Top = 232
  end
end
