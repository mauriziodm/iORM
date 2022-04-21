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
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 16
    Width = 73
    Height = 22
    Action = ioBSPrevPage1
    Flat = True
  end
  object SpeedButton2: TSpeedButton
    Left = 527
    Top = 16
    Width = 73
    Height = 22
    Action = ioBSNextPage1
    Flat = True
  end
  object DBText1: TDBText
    Left = 140
    Top = 47
    Width = 50
    Height = 17
    Alignment = taRightJustify
    DataField = '%Paging.CurrentPage'
    DataSource = SourceArticles
  end
  object Label2: TLabel
    Left = 108
    Top = 47
    Width = 26
    Height = 15
    Caption = 'Page'
  end
  object Label3: TLabel
    Left = 197
    Top = 47
    Width = 11
    Height = 15
    Caption = 'of'
  end
  object DBText2: TDBText
    Left = 214
    Top = 47
    Width = 50
    Height = 17
    DataField = '%Paging.PageCount'
    DataSource = SourceArticles
  end
  object Label4: TLabel
    Left = 334
    Top = 45
    Width = 26
    Height = 15
    Caption = 'Page'
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
    Height = 352
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 8
    Top = 41
    Width = 91
    Height = 25
    Caption = 'Open/Close'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DBEdit1: TDBEdit
    Left = 366
    Top = 43
    Width = 33
    Height = 23
    DataField = '%Paging.CurrentPage'
    DataSource = SourceArticles
    TabOrder = 4
  end
  object Button3: TButton
    Left = 400
    Top = 41
    Width = 57
    Height = 25
    Caption = 'Post'
    TabOrder = 5
    OnClick = Button3Click
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
    OnRecordChangeAction = rcPersistAlways
    Left = 192
    Top = 240
    object DSArticlesID: TIntegerField
      FieldName = 'ID'
    end
    object DSArticlesDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object DSArticlesPrice: TCurrencyField
      FieldName = 'Price'
    end
    object DSArticlesPagingCurrentPage: TIntegerField
      FieldName = '%Paging.CurrentPage'
    end
    object DSArticlesPagingPageCount: TIntegerField
      FieldName = '%Paging.PageCount'
    end
  end
  object SourceArticles: TDataSource
    DataSet = DSArticles
    Left = 272
    Top = 240
  end
  object Timer1: TTimer
    Interval = 250
    Left = 328
    Top = 176
  end
  object ActionList1: TActionList
    Left = 384
    Top = 248
    object ioBSNextPage1: TioBSNextPage
      Category = 'iORM-BSPaging'
      Caption = 'Next page'
      TargetBindSource = DSArticles
    end
    object ioBSPrevPage1: TioBSPrevPage
      Category = 'iORM-BSPaging'
      Caption = 'Prev page'
      TargetBindSource = DSArticles
    end
  end
end
