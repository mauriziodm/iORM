object MultiregistroForm: TMultiregistroForm
  Left = 248
  Top = 98
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'MultiregistroForm'
  ClientHeight = 672
  ClientWidth = 719
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
      Top = 15
      Width = 686
      Height = 113
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
        Height = 113
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
      object Label3: TLabel
        Left = 140
        Top = 76
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'NB: Non sono ammessi gli SPAZI.'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
        Width = 575
        Height = 28
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Qual'#39#232' il nome del Registro?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEditRegistro: TDBEdit
        Left = 140
        Top = 50
        Width = 69
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'REGISTRO'
        DataSource = SourceReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = DBEditRegistroEnter
        OnExit = DBEditRegistroExit
      end
    end
    object PanelGruppo2: TPanel
      Left = 0
      Top = 138
      Width = 686
      Height = 113
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object LabelGruppo2: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 113
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '2'
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
      object Label7: TLabel
        Left = 140
        Top = 82
        Width = 400
        Height = 21
        AutoSize = False
        Caption = 
          'Codice del registro da usare nelle esportazioni verso altri prog' +
          'rammi'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 33
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Annotazioni')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEditNote: TDBEdit
        Left = 140
        Top = 40
        Width = 533
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOTE'
        DataSource = SourceReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = DBEditRegistroEnter
        OnExit = DBEditRegistroExit
      end
      object DBEdit4: TDBEdit
        Left = 496
        Top = 78
        Width = 177
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'EXPORT_CODICE'
        DataSource = SourceReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object PanelGriglia: TPanel
      Left = 0
      Top = 272
      Width = 686
      Height = 314
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Panel1: TPanel
        Left = 0
        Top = 266
        Width = 686
        Height = 48
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object SBPredefinito: TSpeedButtonRollOver
          Left = 220
          Top = 16
          Width = 260
          Height = 25
          Cursor = crHandPoint
          OnClick = SBPredefinitoClick
        end
      end
      object GridList: TcxGrid
        Left = 0
        Top = 0
        Width = 686
        Height = 266
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        RootLevelOptions.DetailFrameColor = clBlack
        RootLevelOptions.DetailFrameWidth = 1
        object tvList: TcxGridDBTableView
          DragMode = dmAutomatic
          OnDblClick = tvListDblClick
          OnEndDrag = tvListEndDrag
          OnKeyPress = tvListKeyPress
          Navigator.Buttons.CustomButtons = <>
          OnCustomDrawCell = tvListCustomDrawCell
          DataController.DataSource = SourceReg
          DataController.KeyFieldNames = 'REGISTRO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.DragHighlighting = False
          OptionsBehavior.DragOpening = False
          OptionsBehavior.DragScrolling = False
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.BestFitMaxRecordCount = 50
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          OptionsView.HeaderEndEllipsis = True
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          OnCustomDrawColumnHeader = tvListCustomDrawColumnHeader
          object tvListRegistro: TcxGridDBColumn
            Caption = 'Registro'
            DataBinding.FieldName = 'REGISTRO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            MinWidth = 142
            SortIndex = 0
            SortOrder = soAscending
            Width = 142
          end
          object tvListNote: TcxGridDBColumn
            Caption = 'Note'
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            MinWidth = 522
            Width = 522
          end
        end
        object lvList: TcxGridLevel
          GridView = tvList
          Options.DetailFrameColor = clBlack
        end
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
  end
  object QryReg: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM PROGREG'
      'WHERE'
      'REGISTRO=:OLD_REGISTRO')
    EditSQL.Strings = (
      'UPDATE PROGREG SET'
      '   REGISTRO = :REGISTRO ,'
      '   NOTE = :NOTE,'
      '   EXPORT_CODICE = :EXPORT_CODICE'
      'WHERE'
      '   REGISTRO = :OLD_REGISTRO')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO PROGREG'
      '   (REGISTRO, NOTE, EXPORT_CODICE)'
      'VALUES'
      '   (:REGISTRO, :NOTE, :EXPORT_CODICE)')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM PROGREG'
      '')
    FieldOptions = []
    Left = 586
    Top = 2
    object QryRegREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Required = True
      Size = 5
    end
    object QryRegPROGPREV: TIntegerField
      FieldName = 'PROGPREV'
    end
    object QryRegPROGORDCLI: TIntegerField
      FieldName = 'PROGORDCLI'
    end
    object QryRegPROGORDFORN: TIntegerField
      FieldName = 'PROGORDFORN'
    end
    object QryRegPROGDDT: TIntegerField
      FieldName = 'PROGDDT'
    end
    object QryRegPROGSAL: TIntegerField
      FieldName = 'PROGSAL'
    end
    object QryRegPROGFATT: TIntegerField
      FieldName = 'PROGFATT'
    end
    object QryRegPROGBOLLEENTRATA: TIntegerField
      FieldName = 'PROGBOLLEENTRATA'
    end
    object QryRegPROGFATTUREACQUISTO: TIntegerField
      FieldName = 'PROGFATTUREACQUISTO'
    end
    object QryRegPROGRICEVUTEFISCALI: TIntegerField
      FieldName = 'PROGRICEVUTEFISCALI'
    end
    object QryRegPROGNOTEACCREDITO: TIntegerField
      FieldName = 'PROGNOTEACCREDITO'
    end
    object QryRegPROGBUONICONSEGNA: TIntegerField
      FieldName = 'PROGBUONICONSEGNA'
    end
    object QryRegNOTE: TStringField
      FieldName = 'NOTE'
      Size = 60
    end
    object QryRegEXPORT_CODICE: TStringField
      FieldName = 'EXPORT_CODICE'
      Size = 10
    end
  end
  object SourceReg: TDataSource
    AutoEdit = False
    DataSet = QryReg
    Left = 614
    Top = 2
  end
end
