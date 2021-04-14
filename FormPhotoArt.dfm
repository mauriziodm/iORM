object PhotoArtForm: TPhotoArtForm
  Left = 3
  Top = 2
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '(Photo Album)'
  ClientHeight = 682
  ClientWidth = 800
  Color = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ClientArea: TPanel
    Left = 0
    Top = 68
    Width = 686
    Height = 586
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object PanelGruppo1: TPanel
      Left = 0
      Top = 0
      Width = 686
      Height = 321
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 321
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 110
        Top = 60
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Codice'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 110
        Top = 84
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Descrizione'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 110
        Top = 108
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 'Immagine'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
        Width = 575
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Immagine')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 190
        Top = 60
        Width = 171
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'CODICE'
        DataSource = SourcePhoto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 190
        Top = 84
        Width = 467
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'DESCRIZIONE'
        DataSource = SourcePhoto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object cxDBImage1: TcxDBImage
        Left = 189
        Top = 107
        DataBinding.DataField = 'JPEG'
        DataBinding.DataSource = SourcePhoto
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.ImmediatePost = True
        Properties.Stretch = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        TabOrder = 3
        Height = 200
        Width = 200
      end
    end
    object Grid1: TcxGrid
      Left = 0
      Top = 432
      Width = 686
      Height = 154
      Align = alBottom
      BorderStyle = cxcbsNone
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailFrameColor = clBlack
      RootLevelOptions.DetailFrameWidth = 1
      object tvPhoto: TcxGridDBTableView
        DragMode = dmAutomatic
        OnDblClick = tvPhotoDblClick
        OnKeyPress = tvPhotoKeyPress
        Navigator.Buttons.CustomButtons = <>
        OnCustomDrawPartBackground = tvPhotoCustomDrawPartBackground
        DataController.DataModeController.GridMode = True
        DataController.DataSource = SourcePhoto
        DataController.DetailKeyFieldNames = 'CODICE'
        DataController.KeyFieldNames = 'CODICE'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.BestFitMaxRecordCount = 50
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHiding = True
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.DataRowHeight = 50
        OptionsView.GridLines = glVertical
        OptionsView.HeaderEndEllipsis = True
        Styles.StyleSheet = DM1.MasterTableViewStyleSheet
        OnCustomDrawColumnHeader = tvPhotoCustomDrawColumnHeader
        OnCustomDrawGroupCell = tvPhotoCustomDrawGroupCell
        object tvPhotoCODICE: TcxGridDBColumn
          Caption = 'Codice'
          DataBinding.FieldName = 'CODICE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Width = 115
        end
        object tvPhotoDESCRIZIONE: TcxGridDBColumn
          Caption = 'Descrizione'
          DataBinding.FieldName = 'DESCRIZIONE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Width = 331
        end
        object tvPhotoJPEG: TcxGridDBColumn
          Caption = 'Immagine'
          DataBinding.FieldName = 'JPEG'
          PropertiesClassName = 'TcxImageProperties'
          Properties.GraphicClassName = 'TJPEGImage'
          Properties.ImmediatePost = True
          Properties.ReadOnly = True
          Properties.Stretch = True
          Width = 220
        end
      end
      object lvPhoto: TcxGridLevel
        GridView = tvPhoto
        Options.DetailFrameColor = clBlack
      end
    end
  end
  object ClientTopPanel: TbmpPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 68
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 1
    object RxSpeedButtonUscita: TSpeedButton
      Left = 2
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Torna alla PAGINA PRECEDENTE'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonUscitaClick
    end
    object RxSpeedModifica: TSpeedButton
      Left = 112
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Attiva / disattiva MODALITA'#39' MODIFICA'
      AllowAllUp = True
      GroupIndex = 1
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedModificaClick
    end
    object RxSpeedButtonNuovo: TSpeedButton
      Left = 162
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Inserimento NUOVA CATEGORIA'
      AllowAllUp = True
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonNuovoClick
    end
    object RxSpeedButtonElimina: TSpeedButton
      Left = 212
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Cancella la categoria dall'#39'archivio'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonEliminaClick
    end
    object RxSpeedButtonTrova: TSpeedButton
      Left = 262
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Attiva / disattiva la MODALITA'#39' RICERCA'
      AllowAllUp = True
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonTrovaClick
    end
    object RxSpeedButtonStampa: TSpeedButton
      Left = 362
      Top = 2
      Width = 49
      Height = 42
      Cursor = crHandPoint
      Hint = 'Accede al MENU'#39' DI STAMPA'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonResetQuery: TSpeedButton
      Left = 312
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonVisualizza: TSpeedButton
      Left = 512
      Top = 2
      Width = 49
      Height = 42
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonVisualizzaClick
    end
    object RxSpeedButtonHelp: TSpeedButton
      Left = 62
      Top = 2
      Width = 49
      Height = 42
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = RxSpeedButtonHelpClick
    end
    object RxSpeedButtonFax: TSpeedButton
      Left = 412
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonMail: TSpeedButton
      Left = 462
      Top = 2
      Width = 49
      Height = 42
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object Button1: TButton
      Left = 317
      Top = 35
      Width = 193
      Height = 25
      Caption = 'Importa foto catalogo Arcobaleno'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object QryPhoto: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM PHOTOART'
      'WHERE'
      'CODICE = :OLD_CODICE')
    EditSQL.Strings = (
      'UPDATE PHOTOART SET'
      '      CODICE = :CODICE,'
      '      DESCRIZIONE = :DESCRIZIONE,'
      '      JPEG = :JPEG'
      'WHERE'
      'CODICE = :OLD_CODICE '
      '')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO PHOTOART'
      '('
      '      CODICE,'
      '      DESCRIZIONE,'
      '      JPEG'
      ')'
      'VALUES'
      '('
      '      :CODICE,'
      '      :DESCRIZIONE,'
      '      :JPEG'
      ')')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM PHOTOART'
      'ORDER BY DESCRIZIONE'
      '')
    FieldOptions = []
    Left = 586
    Top = 2
    object QryPhotoCODICE: TStringField
      FieldName = 'CODICE'
      Required = True
      Size = 25
    end
    object QryPhotoDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 100
    end
    object QryPhotoJPEG: TBlobField
      FieldName = 'JPEG'
      Size = 8
    end
  end
  object SourcePhoto: TDataSource
    AutoEdit = False
    DataSet = QryPhoto
    Left = 614
    Top = 2
  end
end
