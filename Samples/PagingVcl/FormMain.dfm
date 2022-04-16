object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  DesignSize = (
    624
    441)
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 177
    Height = 15
    Caption = 'How many articles will be created'
  end
  object LabelPageCount: TLabel
    Left = 199
    Top = 42
    Width = 87
    Height = 15
    Caption = 'LabelPageCount'
  end
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 16
    Width = 73
    Height = 22
    Caption = 'Prev page'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 527
    Top = 16
    Width = 73
    Height = 22
    Caption = 'Next page'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 448
    Top = 44
    Width = 73
    Height = 22
    Caption = 'Hard refresh'
    Flat = True
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 527
    Top = 44
    Width = 73
    Height = 22
    Caption = 'Soft refresh'
    Flat = True
    OnClick = SpeedButton4Click
  end
  object Edit1: TEdit
    Left = 199
    Top = 13
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '1000'
  end
  object Button1: TButton
    Left = 326
    Top = 12
    Width = 91
    Height = 25
    Caption = 'Create articles'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 608
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DataSource = SourceArticles
    ParentCtl3D = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object ioVCL1: TioVCL
    Left = 192
    Top = 104
  end
  object SQLIteConn: TioSQLiteConnectionDef
    AutoCreateDB.Enabled = True
    Database = 'PagingArticles.db'
    DatabaseStdFolder = sfDocuments
    DefaultConnection = True
    Persistent = False
    Pooled = False
    Left = 192
    Top = 168
  end
  object DSArticles: TioDataSetMaster
    TypeName = 'TArticle'
    Paging.PageSize = 10
    Paging.PagingType = ptHardPaging
    Left = 192
    Top = 240
  end
  object SourceArticles: TDataSource
    DataSet = DSArticles
    Left = 272
    Top = 240
  end
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 328
    Top = 176
  end
end
