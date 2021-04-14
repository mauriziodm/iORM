object mainForm: TmainForm
  Left = 137
  Top = 120
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = '- - -'
  ClientHeight = 846
  ClientWidth = 1149
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object TLabel
    Left = 10
    Top = 521
    Width = 3
    Height = 14
  end
  object MainLeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 211
    Height = 825
    Align = alLeft
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    OnDragOver = MainLeftPanelDragOver
    DesignSize = (
      211
      825)
    object ImageLeftPanelParteSfumata: TImage
      Left = 0
      Top = 594
      Width = 211
      Height = 22
      Stretch = True
    end
    object ImageLeftPanelParteFissaSuperiore: TImage
      Left = 0
      Top = 564
      Width = 211
      Height = 22
      AutoSize = True
      Stretch = True
    end
    object ImgDocTipo: TImage
      Left = -8
      Top = -8
      Width = 211
      Height = 82
      AutoSize = True
    end
    object SBTipoDocumento: TSpeedButtonRollOver
      Left = 179
      Top = 14
      Width = 20
      Height = 44
      AllowAllUp = True
      GroupIndex = 50
      Enabled = False
      Visible = False
      OnClick = SBTipoDocumentoClick
    end
    object LabelTipoDocumento: TLabel
      Left = 73
      Top = 22
      Width = 104
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fattura'
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      Visible = False
    end
    object SBRubrica: TPaintBox
      Tag = 3
      Left = 6
      Top = 172
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBRubricaDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBDocumenti: TPaintBox
      Tag = 4
      Left = 6
      Top = 182
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBDocumentiDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBGM: TPaintBox
      Tag = 5
      Left = 6
      Top = 192
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBGMDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBCV: TPaintBox
      Tag = 6
      Left = 6
      Top = 202
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBCVDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBArticoli: TPaintBox
      Tag = 7
      Left = 6
      Top = 212
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBArticoliDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBPratiche: TPaintBox
      Tag = 8
      Left = 6
      Top = 222
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBPraticheDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBScadenze: TPaintBox
      Tag = 9
      Left = 6
      Top = 232
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBScadenzeDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBPrimanota: TPaintBox
      Tag = 10
      Left = 6
      Top = 242
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBPrimanotaDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBSoggetto: TPaintBox
      Left = 6
      Top = 82
      Width = 205
      Height = 30
      Cursor = crHandPoint
      Color = clBtnFace
      Enabled = False
      ParentColor = False
      Visible = False
      OnClick = SBRubricaClick
      OnDragOver = MainLeftPanelDragOver
      OnEndDrag = SBSoggettoEndDrag
      OnMouseDown = SBSoggettoMouseDown
      OnMouseMove = SBSoggettoMouseMove
      OnMouseUp = SBSoggettoMouseUp
      OnPaint = SBRubricaPaint
    end
    object SBPratica: TPaintBox
      Tag = 1
      Left = 6
      Top = 112
      Width = 205
      Height = 30
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDragOver = MainLeftPanelDragOver
      OnEndDrag = SBSoggettoEndDrag
      OnMouseDown = SBSoggettoMouseDown
      OnMouseMove = SBSoggettoMouseMove
      OnMouseUp = SBSoggettoMouseUp
      OnPaint = SBRubricaPaint
    end
    object SSChiudi: TSpeedButtonRollOver
      Left = 2
      Top = 83
      Width = 17
      Height = 17
      Cursor = crHandPoint
      Flat = True
      Visible = False
      OnClick = SSChiudiClick
    end
    object SBAssistenze: TPaintBox
      Tag = 11
      Left = 6
      Top = 252
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBAssistenzeDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBAssistenza: TPaintBox
      Tag = 2
      Left = 6
      Top = 142
      Width = 205
      Height = 30
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDragOver = MainLeftPanelDragOver
      OnEndDrag = SBSoggettoEndDrag
      OnMouseDown = SBSoggettoMouseDown
      OnMouseMove = SBSoggettoMouseMove
      OnMouseUp = SBSoggettoMouseUp
      OnPaint = SBRubricaPaint
    end
    object PSChiudi: TSpeedButtonRollOver
      Left = 192
      Top = 83
      Width = 17
      Height = 17
      Cursor = crHandPoint
      Flat = True
      Visible = False
      OnClick = PSChiudiClick
    end
    object SBImpegni: TPaintBox
      Tag = 12
      Left = 6
      Top = 262
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBImpegniDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBAgenda: TPaintBox
      Tag = 13
      Left = 6
      Top = 272
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object MMSeparatore1: TPaintBox
      Left = 6
      Top = 400
      Width = 205
      Height = 10
      Cursor = crHandPoint
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object MMSeparatore2: TPaintBox
      Left = 6
      Top = 408
      Width = 205
      Height = 10
      Cursor = crHandPoint
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object MMSeparatore3: TPaintBox
      Left = 6
      Top = 416
      Width = 205
      Height = 10
      Cursor = crHandPoint
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBGC: TPaintBox
      Tag = 14
      Left = 6
      Top = 282
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBGCDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object Caption1: TLabel
      Left = 8
      Top = 8
      Width = 18
      Height = 14
      Caption = '- - -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12546353
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Caption2: TLabel
      Left = 88
      Top = 8
      Width = 18
      Height = 14
      Caption = '- - -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12546353
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Caption3: TLabel
      Left = 168
      Top = 8
      Width = 18
      Height = 14
      Caption = '- - -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object SBPartitario: TPaintBox
      Tag = 15
      Left = 6
      Top = 290
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBPartitarioDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBGOS: TPaintBox
      Tag = 16
      Left = 6
      Top = 298
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBGOSDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBUtilita: TSpeedButtonRollOver
      Left = 10
      Top = 802
      Width = 67
      Height = 17
      Cursor = crHandPoint
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 101
      Enabled = False
      Flat = True
      OnClick = SBUtilitaClick
      ExplicitTop = 741
    end
    object SBImpostazioni: TSpeedButtonRollOver
      Left = 97
      Top = 802
      Width = 106
      Height = 17
      Cursor = crHandPoint
      AllowAllUp = True
      Anchors = [akLeft, akBottom]
      GroupIndex = 102
      Enabled = False
      Flat = True
      OnClick = SBImpostazioniClick
      ExplicitTop = 741
    end
    object SBResOrd: TPaintBox
      Tag = 17
      Left = 6
      Top = 306
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object SBComunicazioni: TPaintBox
      Tag = 18
      Left = 6
      Top = 314
      Width = 205
      Height = 10
      Cursor = crHandPoint
      Enabled = False
      Visible = False
      OnClick = SBRubricaClick
      OnDblClick = SBComunicazioniDblClick
      OnDragOver = MainLeftPanelDragOver
      OnPaint = SBRubricaPaint
    end
    object PanelNomiDoc: TPanel
      Left = -158
      Top = 133
      Width = 162
      Height = 170
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clGray
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TabStop = True
      Visible = False
      OnExit = PanelNomiDocExit
      object ListBoxNomeDoc: TListBox
        Left = 0
        Top = 0
        Width = 160
        Height = 168
        Align = alClient
        BorderStyle = bsNone
        Color = 13822463
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ItemHeight = 12
        ParentFont = False
        TabOrder = 0
        OnClick = ListBoxNomeDocClick
      end
    end
    object PanelDateNavigator: TPanel
      Left = 21
      Top = 391
      Width = 168
      Height = 179
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = 14544639
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      object AgendaDateNavigator: TcxDateNavigator
        Left = -3
        Top = 12
        Width = 173
        Height = 154
        Cursor = crHandPoint
        BorderStyle = cxcbsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfOffice11
        TabOrder = 0
        OnSelectionChanged = AgendaDateNavigatorSelectionChanged
      end
      object eGruppoAgenda: TcxComboBox
        Left = -2
        Top = -2
        Cursor = crArrow
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.MaxLength = 0
        Properties.PopupAlignment = taRightJustify
        Properties.Sorted = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = eGruppoAgendaPropertiesChange
        Properties.OnInitPopup = eGruppoAgendaPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Color = clWhite
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.Kind = lfOffice11
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Width = 170
      end
      object AgendaNoInterventi: TcxCheckBox
        Left = -1
        Top = 161
        Caption = 'Non visualizzare gli interventi'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        State = cbsChecked
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 10066329
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        TabOrder = 2
      end
    end
    object PanelMenuUtilita: TPanel
      Left = 78
      Top = 282
      Width = 201
      Height = 105
      BevelOuter = bvNone
      Color = 14544639
      TabOrder = 2
      Visible = False
      object SU: TShape
        Left = 0
        Top = 0
        Width = 201
        Height = 105
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 2856447
      end
      object UtilitaTitolo: TImage
        Left = 0
        Top = 0
        Width = 23
        Height = 56
      end
      object UtilitaBarra: TImage
        Left = 0
        Top = 56
        Width = 23
        Height = 41
        Stretch = True
      end
      object MenuUtilita: TListBox
        Left = 27
        Top = 4
        Width = 170
        Height = 99
        Cursor = crHandPoint
        Style = lbOwnerDrawFixed
        BorderStyle = bsNone
        ExtendedSelect = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Items.Strings = (
          'voce 1'
          'voce 2'
          'voce 3'
          'voce 4')
        ParentColor = True
        ParentFont = False
        Sorted = True
        TabOrder = 0
        OnClick = MenuUtilitaClick
        OnMouseMove = MenuUtilitaMouseMove
      end
    end
  end
  object PanelTopStretched: TPanel
    Left = 211
    Top = 0
    Width = 793
    Height = 87
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    OnResize = PanelTopStretchedResize
    object ImageTopStretched: TImage
      Left = 0
      Top = 0
      Width = 793
      Height = 68
      Align = alTop
      Stretch = True
    end
    object MainTopPanel: TbmpPanel
      Left = 44
      Top = 0
      Width = 708
      Height = 68
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      object RxSpeedButtonUscita: TSpeedButton
        Left = 0
        Top = 0
        Width = 61
        Height = 62
        Cursor = crHandPoint
        Hint = 'Pagina precedenre'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonHelp: TSpeedButton
        Left = 62
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedModifica: TSpeedButton
        Left = 127
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Modifica'
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
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonNuovo: TSpeedButton
        Left = 192
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Nuovo / Aggiungi'
        AllowAllUp = True
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonElimina: TSpeedButton
        Left = 257
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Elimina / Cancella'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonTrova: TSpeedButton
        Left = 322
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Esegui la ricerca / Trova'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonResetQuery: TSpeedButton
        Left = 387
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Azzera i filtri di ricerca'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonStampa: TSpeedButton
        Left = 452
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Hint = 'Stampa'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonFax: TSpeedButton
        Left = 517
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonMail: TSpeedButton
        Left = 582
        Top = 0
        Width = 64
        Height = 62
        Cursor = crHandPoint
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
      end
      object RxSpeedButtonVisualizza: TSpeedButton
        Left = 647
        Top = 0
        Width = 61
        Height = 62
        Cursor = crHandPoint
        Hint = 'Visualizza / Apri'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 1
      end
      object MediaPlayer1: TMediaPlayer
        Left = 200
        Top = 250
        Width = 0
        Height = 30
        VisibleButtons = [btPlay]
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
  end
  object AvviaLevanteBiometrico: TButton
    Left = 456
    Top = 152
    Width = 137
    Height = 25
    Caption = 'AvviaLevanteBiometrico'
    TabOrder = 1
    OnClick = AvviaLevanteBiometricoClick
  end
  object MainRightPanel: TPanel
    Left = 1054
    Top = 0
    Width = 95
    Height = 825
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    OnResize = MainRightPanelResize
    object ImageRightPanelTopFixed: TImage
      Left = 0
      Top = 0
      Width = 95
      Height = 49
      Align = alTop
      AutoSize = True
    end
    object ImageRightPanelStretched: TImage
      Left = 0
      Top = 49
      Width = 95
      Height = 726
      Align = alClient
      Stretch = True
      ExplicitHeight = 665
    end
    object ImageRightPanelBottomFixed: TImage
      Left = 0
      Top = 775
      Width = 95
      Height = 50
      Align = alBottom
      AutoSize = True
      ExplicitTop = 714
    end
    object Attendere: TImage
      Left = 28
      Top = 4
      Width = 53
      Height = 53
      AutoSize = True
      Visible = False
    end
    object SBImportPalmare: TSpeedButtonRollOver
      Left = 72
      Top = 608
      Width = 20
      Height = 43
      Cursor = crHandPoint
      Enabled = False
      Glyph.Data = {
        9A320000424D9A320000000000003600000028000000640000002B0000000100
        18000000000064320000C40E0000C40E00000000000000000000408080408080
        4080804080808040008040008040008040008040008040008040008040008040
        0080400080400040808040808040808040808040808040808040808040808040
        8080808080808080808080808080808080808080808080808080808080808080
        8080804080804080804080804080804080804080804080804080804080800000
        8000008000008000008000008000008000008000008000008000008000008040
        8080408080408080408080408080408080408080408080408080000080000080
        0000800000800000800000800000800000800000800000800000804080804080
        8040808040808040808040808040808040808040808080400080400080400080
        4000804000804000804000804000804000804000804000408080408080408080
        408080408080408080408080408080804000804000804000804000EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA99580400040808040808040808040
        8080408080408080408080808080808080808080808080C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080804080804080804080804080804080
        80408080408080000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000080408080408080408080408080408080408080
        408080000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF00008040808040808040808040808040808040808040808080
        4000804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA9958040004080804080804080804080804080804080804080808040008040
        00804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EF
        A995804000408080408080408080408080408080408080808080808080808080
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008040808040808040
        8080408080408080408080804000804000804000EFA995EFA995EFA995EFA995
        EFA995EFA995EFA995EFA995EFA995EFA9958040004080804080804080804080
        80408080408080804000804000804000EFA995EFA995804000804000804000EF
        A995804000804000804000EFA995804000408080408080408080408080408080
        408080808080808080808080C0C0C0C0C0C0808080808080808080C0C0C08080
        80808080808080C0C0C080808040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FF000080000080000080FF00FF000080000080
        000080FF00FF0000804080804080804080804080804080804080800000800000
        80000080FF00FFFF00FF000080000080000080FF00FF000080000080000080FF
        00FF000080408080408080408080408080408080408080804000804000804000
        EFA995EFA995804000804000804000EFA995804000804000804000EFA9958040
        00408080408080408080408080408080408080804000804000804000EFA995EF
        A995804000804000804000EFA995804000804000804000EFA995804000408080
        408080408080408080408080408080808080808080808080C0C0C0C0C0C08080
        80808080808080C0C0C0808080808080808080C0C0C080808040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FF000080000080
        000080FF00FF000080000080000080FF00FF0000804080804080804080804080
        80408080408080000080000080000080FF00FFFF00FF000080000080000080FF
        00FF000080000080000080FF00FF000080408080408080408080408080408080
        408080804000804000804000EFA995EFA995804000804000804000EFA9958040
        00804000804000EFA99580400040808040808040808040808040808040808080
        4000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA995EFA9958040004080804080804080804080804080804080808080808080
        80808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0808080408080408080408080408080408080408080000080000080000080
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000080408080
        408080408080408080408080408080804000804000804000EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA995EFA99580400040808040808040
        8080408080408080408080804000804000804000EFA995EFA995804000804000
        804000EFA995804000804000804000EFA9958040004080804080804080804080
        80408080408080808080808080808080C0C0C0C0C0C0808080808080808080C0
        C0C0808080808080808080C0C0C0808080408080408080408080408080408080
        408080000080000080000080FF00FFFF00FF000080000080000080FF00FF0000
        80000080000080FF00FF00008040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FF000080000080000080FF00FF000080000080
        000080FF00FF0000804080804080804080804080804080804080808040008040
        00804000EFA995EFA995804000804000804000EFA995804000804000804000EF
        A995804000408080408080408080408080408080408080804000804000804000
        EFA995EFA995804000804000804000EFA995804000804000804000EFA9958040
        00408080408080408080408080408080408080808080808080808080C0C0C0C0
        C0C0808080808080808080C0C0C0808080808080808080C0C0C0808080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FF0000
        80000080000080FF00FF000080000080000080FF00FF00008040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FF000080000080
        000080FF00FF000080000080000080FF00FF0000804080804080804080804080
        80408080408080804000804000804000EFA995EFA995804000804000804000EF
        A995804000804000804000EFA995804000408080408080408080408080408080
        408080804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA99580400040808040808040808040808040808040808080
        8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C08080804080804080804080804080804080804080800000800000
        80000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000080408080408080408080408080408080408080000080000080000080
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        80408080408080408080408080408080408080804000804000804000EFA995EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995804000408080
        408080408080408080408080408080804000804000804000EFA995EFA9958040
        00804000804000EFA995804000804000804000EFA99580400040808040808040
        8080408080408080408080808080808080808080C0C0C0C0C0C0808080808080
        808080C0C0C0808080808080808080C0C0C08080804080804080804080804080
        80408080408080000080000080000080FF00FFFF00FF000080000080000080FF
        00FF000080000080000080FF00FF000080408080408080408080408080408080
        408080000080000080000080FF00FFFF00FF000080000080000080FF00FF0000
        80000080000080FF00FF00008040808040808040808040808040808040808080
        4000804000804000EFA995EFA995804000804000804000EFA995804000804000
        804000EFA9958040004080804080804080804080804080804080808040008040
        00804000EFA995EFA995804000804000804000EFA995804000804000804000EF
        A995804000408080408080408080408080408080408080808080808080808080
        C0C0C0C0C0C0808080808080808080C0C0C0808080808080808080C0C0C08080
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FF000080000080000080FF00FF000080000080000080FF00FF000080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FF0000
        80000080000080FF00FF000080000080000080FF00FF00008040808040808040
        8080408080408080408080804000804000804000EFA995EFA995804000804000
        804000EFA995804000804000804000EFA9958040004080804080804080804080
        80408080408080804000804000804000EFA995EFA995EFA995EFA995EFA995EF
        A995EFA995EFA995EFA995EFA995804000408080408080408080408080408080
        408080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C080808040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0000804080804080804080804080804080804080800000800000
        80000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000080408080408080408080408080408080408080804000804000804000
        EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA9958040
        00408080408080408080408080408080408080804000804000804000EFA995EF
        A995804000804000804000EFA995804000804000804000EFA995804000408080
        408080408080408080408080408080808080808080808080C0C0C0C0C0C08080
        80808080808080C0C0C0808080808080808080C0C0C080808040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FF000080000080
        000080FF00FF000080000080000080FF00FF0000804080804080804080804080
        80408080408080000080000080000080FF00FFFF00FF000080000080000080FF
        00FF000080000080000080FF00FF000080408080408080408080408080408080
        408080804000804000804000EFA995EFA995804000804000804000EFA9958040
        00804000804000EFA99580400040808040808040808040808040808040808080
        4000804000804000EFA995EFA995804000804000804000EFA995804000804000
        804000EFA9958040004080804080804080804080804080804080808080808080
        80808080C0C0C0C0C0C0808080808080808080C0C0C0808080808080808080C0
        C0C0808080408080408080408080408080408080408080000080000080000080
        FF00FFFF00FF000080000080000080FF00FF000080000080000080FF00FF0000
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FF000080000080000080FF00FF000080000080000080FF00FF000080408080
        408080408080408080408080408080804000804000804000EFA995EFA9958040
        00804000804000EFA995804000804000804000EFA99580400040808040808040
        8080408080408080408080804000804000804000EFA995EFA995EFA995EFA995
        EFA995EFA995EFA995EFA995EFA995EFA9958040004080804080804080804080
        80408080408080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080408080408080408080408080408080
        408080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF00008040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0000804080804080804080804080804080804080808040008040
        00804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EF
        A995804000408080408080408080408080408080408080804000804000804000
        EFA995EFA995804000804000804000EFA995804000804000804000EFA9958040
        00408080408080408080408080408080408080808080808080808080C0C0C0C0
        C0C0808080808080808080C0C0C0808080808080808080C0C0C0808080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FF0000
        80000080000080FF00FF000080000080000080FF00FF00008040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FF000080000080
        000080FF00FF000080000080000080FF00FF0000804080804080804080804080
        80408080408080804000804000804000EFA995EFA995804000804000804000EF
        A995804000804000804000EFA995804000408080408080408080408080408080
        408080804000804000804000EFA995EFA995804000804000804000EFA9958040
        00804000804000EFA99580400040808040808040808040808040808040808080
        8080808080808080C0C0C0C0C0C0808080808080808080C0C0C0808080808080
        808080C0C0C08080804080804080804080804080804080804080800000800000
        80000080FF00FFFF00FF000080000080000080FF00FF000080000080000080FF
        00FF000080408080408080408080408080408080408080000080000080000080
        FF00FFFF00FF000080000080000080FF00FF000080000080000080FF00FF0000
        80408080408080408080408080408080408080804000804000804000EFA995EF
        A995804000804000804000EFA995804000804000804000EFA995804000408080
        408080408080408080408080408080804000804000804000EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA995EFA99580400040808040808040
        8080408080408080408080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080804080804080804080804080
        80408080408080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF000080408080408080408080408080408080
        408080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF00008040808040808040808040808040808040808080
        4000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA995EFA9958040004080804080804080804080804080804080808040008040
        00804000EFA995EFA995804000804000804000EFA995804000804000804000EF
        A995804000408080408080408080408080408080408080808080808080808080
        C0C0C0C0C0C0808080808080808080C0C0C0808080808080808080C0C0C08080
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FF000080000080000080FF00FF000080000080000080FF00FF000080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FF0000
        80000080000080FF00FF000080000080000080FF00FF00008040808040808040
        8080408080408080408080804000804000804000EFA995EFA995804000804000
        804000EFA995804000804000804000EFA9958040004080804080804080804080
        80408080408080804000804000804000EFA995EFA995804000804000804000EF
        A995804000804000804000EFA995804000408080408080408080408080408080
        408080808080808080808080C0C0C0C0C0C0808080808080808080C0C0C08080
        80808080808080C0C0C080808040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FF000080000080000080FF00FF000080000080
        000080FF00FF0000804080804080804080804080804080804080800000800000
        80000080FF00FFFF00FF000080000080000080FF00FF000080000080000080FF
        00FF000080408080408080408080408080408080408080804000804000804000
        EFA995EFA995804000804000804000EFA995804000804000804000EFA9958040
        00408080408080408080408080408080408080804000804000804000EFA995EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995804000408080
        408080408080408080408080408080808080808080808080C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000804080804080804080804080
        80408080408080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF000080408080408080408080408080408080
        408080804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA99580400040808040808040808040808040808040808080
        4000804000804000EFA995EFA995EFA995804000804000804000804000804000
        EFA995EFA9958040004080804080804080804080804080804080808080808080
        80808080C0C0C0C0C0C0C0C0C0808080808080808080808080808080C0C0C0C0
        C0C0808080408080408080408080408080408080408080000080000080000080
        FF00FFFF00FFFF00FF000080000080000080000080000080FF00FFFF00FF0000
        80408080408080408080408080408080408080000080000080000080FF00FFFF
        00FFFF00FF000080000080000080000080000080FF00FFFF00FF000080408080
        408080408080408080408080408080804000804000804000EFA995EFA995EFA9
        95804000804000804000804000804000EFA995EFA99580400040808040808040
        8080408080408080408080804000804000804000EFA995EFA995EFA995804000
        804000804000804000804000EFA995EFA9958040004080804080804080804080
        80408080408080808080808080808080C0C0C0C0C0C0C0C0C080808080808080
        8080808080808080C0C0C0C0C0C0808080408080408080408080408080408080
        408080000080000080000080FF00FFFF00FFFF00FF0000800000800000800000
        80000080FF00FFFF00FF00008040808040808040808040808040808040808000
        0080000080000080FF00FFFF00FFFF00FF000080000080000080000080000080
        FF00FFFF00FF0000804080804080804080804080804080804080808040008040
        00804000EFA995EFA995EFA995804000804000804000804000804000EFA995EF
        A995804000408080408080408080408080408080408080804000804000804000
        EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA9958040
        00408080408080408080408080408080408080808080808080808080C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080408080
        408080408080408080408080408080000080000080000080FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008040808040808040
        8080408080408080408080000080000080000080FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000804080804080804080804080
        80408080408080804000804000804000EFA995EFA995EFA995EFA995EFA995EF
        A995EFA995EFA995EFA995EFA995804000408080408080408080408080408080
        804000804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA99580400040808040808040808040808080808080
        8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C08080804080804080804080804080800000800000800000
        80000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF000080408080408080408080408080000080000080000080000080
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF000080408080408080408080408080804000804000804000804000EFA995EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995804000
        408080408080408080804000804000804000804000EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA99580400040
        8080408080808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080804080804080
        80000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000080408080408080000080
        000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00008040808040808080400080400080
        4000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA995EFA995EFA995EFA995804000408080804000804000804000804000EFA9
        95EFA995EFA995804000EFA995EFA995EFA995804000EFA995EFA995EFA99580
        4000EFA995EFA995EFA995804000808080808080808080808080C0C0C0C0C0C0
        C0C0C0808080C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0808080C0C0
        C0C0C0C0C0C0C0808080000080000080000080000080FF00FFFF00FFFF00FF00
        0080FF00FFFF00FFFF00FF000080FF00FFFF00FFFF00FF000080FF00FFFF00FF
        FF00FF000080000080000080000080000080FF00FFFF00FFFF00FF000080FF00
        FFFF00FFFF00FF000080FF00FFFF00FFFF00FF000080FF00FFFF00FFFF00FF00
        0080804000804000804000804000EFA995EFA995EFA995804000EFA995EFA995
        EFA995804000EFA995EFA995EFA995804000EFA995EFA995EFA9958040008040
        00804000804000EFA995EFA995EFA995804000804000804000EFA99580400080
        4000804000EFA995804000804000804000EFA995EFA995804000808080808080
        808080C0C0C0C0C0C0C0C0C0808080808080808080C0C0C08080808080808080
        80C0C0C0808080808080808080C0C0C0C0C0C0808080000080000080000080FF
        00FFFF00FFFF00FF000080000080000080FF00FF000080000080000080FF00FF
        000080000080000080FF00FFFF00FF000080000080000080000080FF00FFFF00
        FFFF00FF000080000080000080FF00FF000080000080000080FF00FF00008000
        0080000080FF00FFFF00FF000080804000804000804000EFA995EFA995EFA995
        804000804000804000EFA995804000804000804000EFA9958040008040008040
        00EFA995EFA995804000804000804000804000EFA995EFA995EFA995EFA99580
        4000EFA995EFA995EFA995804000EFA995EFA995EFA995804000EFA995EFA995
        EFA995804000808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0
        C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C080
        8080000080000080000080FF00FFFF00FFFF00FFFF00FF000080FF00FFFF00FF
        FF00FF000080FF00FFFF00FFFF00FF000080FF00FFFF00FFFF00FF0000800000
        80000080000080FF00FFFF00FFFF00FFFF00FF000080FF00FFFF00FFFF00FF00
        0080FF00FFFF00FFFF00FF000080FF00FFFF00FFFF00FF000080804000804000
        804000EFA995EFA995EFA995EFA995804000EFA995EFA995EFA995804000EFA9
        95EFA995EFA995804000EFA995EFA995EFA995804000804000804000804000EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA995EFA995EFA995EFA995EFA995804000808080808080808080C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0808080000080000080000080FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000080804000804000804000EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA99580
        4000804000804000804000EFA995EFA995804000804000804000804000804000
        804000804000804000804000804000804000804000EFA995EFA9958040008080
        80808080808080C0C0C0C0C0C080808080808080808080808080808080808080
        8080808080808080808080808080808080C0C0C0C0C0C0808080000080000080
        000080FF00FFFF00FF0000800000800000800000800000800000800000800000
        80000080000080000080000080FF00FFFF00FF000080000080000080000080FF
        00FFFF00FF000080000080000080000080000080000080000080000080000080
        000080000080000080FF00FFFF00FF000080804000804000804000EFA995EFA9
        9580400080400080400080400080400080400080400080400080400080400080
        4000804000EFA995EFA995804000804000804000804000EFA995EFA995804000
        8040008040008040008040008040008040008040008040008040008040008040
        00EFA995EFA995804000808080808080808080C0C0C0C0C0C080808080808080
        8080808080808080808080808080808080808080808080808080808080C0C0C0
        C0C0C0808080000080000080000080FF00FFFF00FF0000800000800000800000
        80000080000080000080000080000080000080000080000080FF00FFFF00FF00
        0080000080000080000080FF00FFFF00FF000080000080000080000080000080
        000080000080000080000080000080000080000080FF00FFFF00FF0000808040
        00804000804000EFA995EFA99580400080400080400080400080400080400080
        4000804000804000804000804000804000EFA995EFA995804000804000804000
        804000EFA995EFA9958040008040008040008040008040008040008040008040
        00804000804000804000804000EFA995EFA995804000808080808080808080C0
        C0C0C0C0C0808080808080808080808080808080808080808080808080808080
        808080808080808080C0C0C0C0C0C0808080000080000080000080FF00FFFF00
        FF00008000008000008000008000008000008000008000008000008000008000
        0080000080FF00FFFF00FF000080000080000080000080FF00FFFF00FF000080
        0000800000800000800000800000800000800000800000800000800000800000
        80FF00FFFF00FF000080804000804000804000EFA995EFA99580400080400080
        4000804000804000804000804000804000804000804000804000804000EFA995
        EFA995804000804000804000804000EFA995EFA9958040008040008040008040
        00804000804000804000804000804000804000804000804000EFA995EFA99580
        4000808080808080808080C0C0C0C0C0C0808080808080808080808080808080
        808080808080808080808080808080808080808080C0C0C0C0C0C08080800000
        80000080000080FF00FFFF00FF00008000008000008000008000008000008000
        0080000080000080000080000080000080FF00FFFF00FF000080000080000080
        000080FF00FFFF00FF0000800000800000800000800000800000800000800000
        80000080000080000080000080FF00FFFF00FF000080804000804000804000EF
        A995EFA995804000804000804000804000804000804000804000804000804000
        804000804000804000EFA995EFA995804000804000804000804000EFA995EFA9
        9580400080400080400080400080400080400080400080400080400080400080
        4000804000EFA995EFA995804000808080808080808080C0C0C0C0C0C0808080
        8080808080808080808080808080808080808080808080808080808080808080
        80C0C0C0C0C0C0808080000080000080000080FF00FFFF00FF00008000008000
        0080000080000080000080000080000080000080000080000080000080FF00FF
        FF00FF000080000080000080000080FF00FFFF00FF0000800000800000800000
        80000080000080000080000080000080000080000080000080FF00FFFF00FF00
        0080804000804000804000EFA995EFA995804000804000804000804000804000
        804000804000804000804000804000804000804000EFA995EFA9958040008040
        00804000804000EFA995EFA99580400080400080400080400080400080400080
        4000804000804000804000804000804000EFA995EFA995804000808080808080
        808080C0C0C0C0C0C08080808080808080808080808080808080808080808080
        80808080808080808080808080C0C0C0C0C0C0808080000080000080000080FF
        00FFFF00FF000080000080000080000080000080000080000080000080000080
        000080000080000080FF00FFFF00FF000080000080000080000080FF00FFFF00
        FF00008000008000008000008000008000008000008000008000008000008000
        0080000080FF00FFFF00FF000080804000804000804000EFA995EFA995804000
        8040008040008040008040008040008040008040008040008040008040008040
        00EFA995EFA995804000804000804000804000EFA995EFA99580400080400080
        4000804000804000804000804000804000804000804000804000804000EFA995
        EFA995804000808080808080808080C0C0C0C0C0C08080808080808080808080
        80808080808080808080808080808080808080808080808080C0C0C0C0C0C080
        8080000080000080000080FF00FFFF00FF000080000080000080000080000080
        000080000080000080000080000080000080000080FF00FFFF00FF0000800000
        80000080000080FF00FFFF00FF00008000008000008000008000008000008000
        0080000080000080000080000080000080FF00FFFF00FF000080804000804000
        804000EFA995EFA9958040008040008040008040008040008040008040008040
        00804000804000804000804000EFA995EFA995804000804000804000804000EF
        A995EFA995804000804000804000804000804000804000804000804000804000
        804000804000804000EFA995EFA995804000808080808080808080C0C0C0C0C0
        C080808080808080808080808080808080808080808080808080808080808080
        8080808080C0C0C0C0C0C0808080000080000080000080FF00FFFF00FF000080
        0000800000800000800000800000800000800000800000800000800000800000
        80FF00FFFF00FF000080000080000080000080FF00FFFF00FF00008000008000
        0080000080000080000080000080000080000080000080000080000080FF00FF
        FF00FF000080804000804000804000EFA995EFA9958040008040008040008040
        00804000804000804000804000804000804000804000804000EFA995EFA99580
        4000804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA9958040008080
        80808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000080000080
        000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000080000080000080000080FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000080804000804000804000EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EF
        A995EFA995EFA995EFA995804000804000804000804000804000EFA995EFA995
        EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995804000808080808080808080808080C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0808080000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0080000080000080000080000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000808040
        00804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995804000408080804000
        804000804000804000EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA9
        95EFA995EFA995EFA995EFA995EFA99580400040808040808080808080808080
        8080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C08080804080804080800000800000800000800000
        80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF000080408080408080000080000080000080000080FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000080408080408080804000804000804000804000EFA995EFA995EF
        A995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995EFA995
        8040004080804080804080808040008040008040008040008040008040008040
        0080400080400080400080400080400080400080400080400080400040808040
        8080408080408080808080808080808080808080808080808080808080808080
        8080808080808080808080808080808080808080808080804080804080804080
        8040808000008000008000008000008000008000008000008000008000008000
        0080000080000080000080000080000080000080408080408080408080408080
        0000800000800000800000800000800000800000800000800000800000800000
        8000008000008000008000008000008040808040808040808040808080400080
        4000804000804000804000804000804000804000804000804000804000804000
        8040008040008040008040004080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        4080804080804080804080804080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        4080804080804080804080804080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        408080408080408080408080408080408080408080408080408080408080}
      OnClick = SBImportPalmareClick
    end
    object LabelAllegati: TLabel
      Left = 5
      Top = 624
      Width = 62
      Height = 29
      AutoSize = False
      Caption = '- - -'
      Color = 11845573
      Font.Charset = ANSI_CHARSET
      Font.Color = 16762566
      Font.Height = -24
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ListViewExpDoc: TListView
      Left = 3
      Top = 93
      Width = 95
      Height = 428
      Hint = 'Zona sulla quale "appoggiare" momentaneamente'#13#10'i documenti.'
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 15503991
      Columns = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FlatScrollBars = True
      HideSelection = False
      IconOptions.AutoArrange = True
      LargeImages = ImageListExpDocLargeImages
      MultiSelect = True
      ParentFont = False
      PopupMenu = MenuBacheca
      TabOrder = 0
      OnAdvancedCustomDraw = ListViewExpDocAdvancedCustomDraw
      OnEndDrag = ListViewExpDocEndDrag
      OnDragOver = ListViewExpDocDragOver
      OnKeyUp = ListViewExpDocKeyUp
      OnMouseDown = ListViewExpDocMouseDown
    end
  end
  object MainBottomPanel: TPanel
    Left = 0
    Top = 825
    Width = 1149
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'MainBottomPanel'
    ParentBackground = False
    TabOrder = 5
    object ImageBottomPanelRightFixed: TImage
      Left = 1044
      Top = 0
      Width = 105
      Height = 21
      Align = alRight
      AutoSize = True
      ExplicitLeft = 1066
    end
    object ImageBottomPanelStretched: TImage
      Left = 105
      Top = 0
      Width = 939
      Height = 21
      Align = alClient
      Stretch = True
      ExplicitWidth = 961
    end
    object ImageBottomPanelLeftFixed: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 21
      Align = alLeft
      AutoSize = True
    end
    object LabelDataOdierna: TLabel
      Left = 6
      Top = 3
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '- - -'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 82
      Top = 3
      Width = 45
      Height = 14
      AutoSize = False
      Caption = 'Azienda:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LabelAziendaCorrente: TLabel
      Left = 130
      Top = 3
      Width = 120
      Height = 14
      AutoSize = False
      Caption = '- - -'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 470
      Top = 4
      Width = 35
      Height = 14
      AutoSize = False
      Caption = 'Status:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LabelStatus: TLabel
      Left = 514
      Top = 3
      Width = 439
      Height = 14
      AutoSize = False
      Caption = '- - -'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object SBStopFax: TSpeedButton
      Left = 953
      Top = 3
      Width = 55
      Height = 16
      Caption = 'Stop FAX'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 274
      Top = 3
      Width = 55
      Height = 14
      AutoSize = False
      Caption = 'Operatore:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LabelOperatoreCorrente: TLabel
      Left = 331
      Top = 3
      Width = 120
      Height = 14
      AutoSize = False
      Caption = '- - -'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  inline StartFrame: TStartFrame
    Left = 683
    Top = 129
    Width = 183
    Height = 239
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Color = 14450266
    ParentColor = False
    TabOrder = 0
    Visible = False
    ExplicitLeft = 683
    ExplicitTop = 129
    ExplicitWidth = 183
    ExplicitHeight = 239
    inherited PanelBackGround: TPanel
      Width = 183
      Height = 239
      ExplicitWidth = 183
      ExplicitHeight = 239
      inherited PanelCover: TPanel
        inherited WebBrowser: TWebBrowser
          ControlData = {
            4C000000B6310000942D00000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620A000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
  end
  object ImageListExpDocLargeImages: TImageList
    Height = 20
    Masked = False
    Width = 43
    Left = 242
    Top = 440
    Bitmap = {
      494C01010700090004002B001400FFFFFFFFFE00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000AC000000280000000100200000000000806B
      000000000000000000000000000000000000EF947300EF947300EF9473004242
      4200424242004242420042424200424242004242420042424200424242004242
      42004242420042424200424242004242420042424200EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF9473000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDEDE006363
      6300DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006363
      6300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF947300EF94730052525200393939003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39004242420042424200EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF9473000084840042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400F7F7F7006363
      6300F7F7F700DEDEDE00DEDEDE0063636300DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700F7F7F700F7F7F7009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFEEDB00FFF5DC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0064646400FFFFFF00FFFFFF00FFFFFF006363
      6300FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A005A5A5A005252
      5200525252005252520052525200525252005252520052525200525252005252
      520052525200525252005252520052525200525252004242420052525200EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF9473000084
      840042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400EFEFEF0000000000EFEFEF00D6D6D600DEDEDE006363
      6300DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F7009C9C9C00FBFBFB00FFFFFF00FFFFFF00FFEFDC00FFA04700FF93
      3B00FFEACC00FFFFFA00FDFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006464
      6400FFFFFF00FFFFFF00F7F7F70000000000F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A005A5A5A007B7B7B009494940094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      94007B7B7B005252520042424200424242004242420042424200424242004242
      4200424242005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      52004242420052525200EF9473000084840042E7C60042E7C60042E7C6008484
      8400848484008484840084848400848484008484840042E7E70042E7E7008484
      840084848400848484008484840042E7E70042E7E70084848400848484008484
      84008484840084848400848484008484840042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400EFEFEF00EFEF
      EF00EFEFEF00D6D6D600D6D6D60063636300DEDEDE00DEDEDE00000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF000000
      00000000000000000000EFEFEF00F7F7F700F7F7F7009C9C9C00FBFBFB00FFFF
      FF00F7F7F700FFB17000FF913000FF913000FF8D2B00FF9F4C00FFB47500FFDA
      B900FFFFF200FFFFFF00FFFFFF0064646400FFFFFF00FFFFFF00F7F7F700F7F7
      F700F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00D6D6
      D600D6D6D6009494940094949400949494009494940094949400949494009494
      940094949400949494009494940094949400949494007B7B7B00424242004242
      4200424242004242420042424200424242004242420042424200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252000084
      840042E7C60042E7C60042E7C600000000000000000000000000000000000000
      00000000000042E7E70042E7E7000000000000000000000000000000000042E7
      E70042E7E7000000000000000000000000000000000000000000000000000000
      000042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400E7E7E70063636300E7E7E700D6D6D600D6D6D6006363
      6300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F7009C9C9C00FBFBFB00FDFDFD00FFC38200FF913000FF913000FF91
      3000FF913000FF913000FF913000FF913000FF9D4700FFEFDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF0063636300EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00D6D6D600FFFFFF0042424200424242004242
      42004242420042424200424242004242420042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A005A5A5A005A5A5A007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A0052525200525252000084840042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400E7E7E7000000
      0000E7E7E700D6D6D600D6D6D60063636300D6D6D600DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFEF00EFEFEF00F7F7F7009C9C9C00FDFDFD00FFCE
      9B00FF913000FF913000FF913000FF913000FF913000FF913000FF913000FF91
      3000FF913000FF913000FFF3E300FFFFFF00FFFFFF00FFFFFF00EFEFEF000000
      0000EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00D6D6
      D600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0042424200C6C6C6009494940094949400949494007B7B7B005A5A5A005A5A
      5A00525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200525252005252520042424200424242004242
      4200181818001818180018181800181818007B7B7B005A5A5A00525252000084
      840042E7A50042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D6006363
      6300D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF009C9C9C00FFFFFF00FFD3A700FF913000FF913000FF913000FF91
      3000FF913000FFA65500FFD4A600FFCA9F00FFAC6200FF913000FFAF6800FFFF
      FA00FFFFFF00FFFFFF00EFEFEF00EFEFEF00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00D6D6D600FFFFFF008484840000BD000000BD
      000000BD000000BD000000BD0000FFFFFF0042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A00BDBDBD003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900181818005A5A5A00525252000084840042E7A50042E7A50042E7C6008484
      8400848484008484840042E7C60042E7C6008484840084848400848484008484
      8400848484008484840084848400848484008484840042E7E70042E7E7008484
      8400848484008484840084848400848484008484840042E7E70042E7E7008484
      8400848484008484840042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400D6D6D6006363
      6300D6D6D600CECECE00D6D6D600636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300FFFFFF00FFFF
      FF00FFE6D300FFC79600FF8E3000FF913000FF913000FFD5AF00FFFFFF00FFFD
      FF00FFFFFB00FFDFC100FFB16E00FFF3E300FFFFFF00FFFFFF00E7E7E7006363
      6300E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00DEDE
      DE00FFFFFF008484840000BD000000BD000042DE000042DE000042DE0000FFFF
      FF0042424200C6C6C6009494940094949400949494007B7B7B005A5A5A00BDBD
      BD00393939003939390039393900D6D6D600D6D6D60039393900D6D6D600D6D6
      D60039393900D6D6D600393939003939390039393900D6D6D60039393900D6D6
      D600D6D6D60039393900D6D6D600D6D6D600181818005A5A5A00525252000084
      840042E7A50042E7A50042E7A50000000000000000000000000042E7C60042E7
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000042E7E70042E7E700000000000000000000000000000000000000
      00000000000042E7E70042E7E70000000000000000000000000042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400D6D6D60000000000D6D6D600CECECE00D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5EA00FFDC
      BC00FFB87D00FFDEBE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF1E700FFFF
      FA00FFFFFF00FFFFFF00E7E7E70000000000E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00DEDEDE00FFFFFF008484840000BD000000BD
      000042DE000042DE000000F70000FFFFFF0042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A00BDBDBD00D6D6D600D6D6D60039393900FFFF
      FF00D6D6D60039393900FFFFFF00D6D6D60039393900FFFFFF00D6D6D6003939
      3900FFFFFF00D6D6D60039393900FFFFFF00D6D6D60039393900FFFFFF00D6D6
      D600181818005A5A5A00525252000084840042E7A50042E7A50042E7A50042E7
      A50042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFBFF00FFF2E300FFE7C700FFF6
      F000FBFAFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7
      E700E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00DEDE
      DE00FFFFFF008484840000BD000042DE000042DE000042DE000000F70000FFFF
      FF0042424200C6C6C6009494940094949400949494007B7B7B005A5A5A00BDBD
      BD00FFFFFF00D6D6D60039393900F7FFFF00D6D6D60039393900F7FFFF00D6D6
      D60039393900F7FFFF00D6D6D60039393900F7FFFF00D6D6D60039393900F7FF
      FF00D6D6D60039393900F7FFFF00D6D6D600181818005A5A5A00525252000084
      840042E7A50042E7A50042E7A50042E7A50042E7A50042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400C6C6C60063636300C6C6C600CECECE00CECECE00CECE
      CE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00FFFFFF00FFF5E600FFDDB900FFF6E700FFFFFF00FFFF
      FF00FBFBFB00FFE2C300FF913000FF974300FFC89700FFEDD000FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00DEDEDE0063636300DEDEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00DEDEDE00FFFFFF008484840000BD000042DE
      000042DE000042DE000000F70000FFFFFF0042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A00BDBDBD00F7FFFF00D6D6D600393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900181818005A5A5A00525252000084840042E7A50042E7A50042E7A5008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840042E7C60042E7C6008484840084848400848484008484840042E7
      E700848484008484840084848400848484008484840084848400848484008484
      840042E7E700848484008484840042E7E7008484840084848400848484008484
      84008484840042E7E70042E7E70042E7E70042E7E70000848400C6C6C6000000
      0000C6C6C600CECECE00CECECE00CECECE00CECECE00D6D6D600D6D6D6006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300E7E7E700E7E7E700EFEFEF00FFFFFF00FFF7
      E700FFB26600FFA75A00FFE4C700FFF7E800FFF8E700FFDAB000FF913000FF91
      3000FF913000FF913000FFB87900FFE7CF00F8F8FE00FFFFFF00DEDEDE000000
      0000DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00DEDE
      DE00FFFFFF00848484006BFF6B0042DE000042DE00006BFF6B00B5FFB500FFFF
      FF0042424200C6C6C6009494940094949400949494007B7B7B005A5A5A00BDBD
      BD00FFFFFF00D6D6D60039393900D6D6D600D6D6D60039393900D6D6D600D6D6
      D60039393900D6D6D600D6D6D60039393900D6D6D600D6D6D60039393900D6D6
      D600D6D6D60039393900D6D6D600D6D6D600181818005A5A5A00525252000084
      840042E7A50042E7A50042E7A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042E7C60042E7C6000000
      000000000000000000000000000042E7E7000000000000000000000000000000
      00000000000000000000000000000000000042E7E700000000000000000042E7
      E700000000000000000000000000000000000000000042E7E70042E7E70042E7
      E70042E7E70000848400BDBDBD00BDBDBD00BDBDBD00CECECE00CECECE00CECE
      CE00CECECE00CECECE00D6D6D600636363009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0063636300E7E7
      E700E7E7E700E7E7E700F3F3F300FFFFFF00FFCDA700FF913000FF913000FF91
      3000FF8A2B00FF913000FF913000FF913000FF913000FF913000FF913000FFB1
      7200FFF6F500FFFFFF00D6D6D600D6D6D600D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00DEDEDE00FFFFFF00848484006BFF6B0042DE
      000000F7000000F70000B5FFB500FFFFFF0042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A00BDBDBD00F7FFFF00D6D6D60039393900FFFF
      FF00D6D6D60039393900FFFFFF00D6D6D60039393900FFFFFF00D6D6D6003939
      3900FFFFFF00D6D6D60039393900FFFFFF00D6D6D60039393900FFFFFF00D6D6
      D600181818005A5A5A00525252000084840042E7A50042E7A50042E7A50042E7
      A50042E7A50042E7A50042E7A50042E7A50042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400BDBDBD006363
      6300BDBDBD00C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE006363
      63009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0063636300E7E7E700E7E7E700E7E7E700EBEBEB00F3F3
      F300FDFBFF00FFD4AA00FF913000FF913000FF913000FF913000FF913000FF91
      3000FF913000FF913000FF9C4200FFF1E400FEFEFE00FFFFFF00D6D6D6006363
      6300D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00DEDE
      DE00FFFFFF00848484006BFF6B006BFF6B006BFF6B0094FF9400B5FFB500FFFF
      FF0042424200C6C6C6009494940094949400949494007B7B7B005A5A5A00BDBD
      BD0039393900D6D6D60039393900F7FFFF00D6D6D60039393900F7FFFF00D6D6
      D60039393900F7FFFF00393939003939390039393900D6D6D60039393900F7FF
      FF00D6D6D60039393900F7FFFF00D6D6D600181818005A5A5A00525252000084
      840042E7A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7
      A50042E7A50042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400B5B5B50000000000B5B5B500C6C6C600C6C6C600CECE
      CE00CECECE00CECECE00CECECE00636363009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0063636300E7E7
      E700E7E7E700E7E7E700EBEBEB00EBEBEB00FFFFFF00FFFDFF00FFE0C300FFB1
      6900FF913000FF913000FF913000FF913000FF913000FF913000FFEDD600FFFF
      FF00FFFFFF00FFFFFF00D6D6D60000000000D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00DEDEDE00FFFFFF00848484006BFF6B00B5FF
      B500B5FFB500B5FFB500B5FFB500FFFFFF0042424200C6C6C600949494009494
      9400949494007B7B7B005A5A5A005A5A5A00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD007B7B
      7B007B7B7B005A5A5A00EF9473000084840042E7630042E7A50042E7A5008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484008484840042E7C60042E7C60042E7C60042E7
      C60042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400ADADAD00ADAD
      AD00ADADAD00C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE006363
      63009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0063636300E7E7E700E7E7E700E7E7E700EBEBEB00EBEB
      EB00EBEBEB00F3F3F300FFFFFF00FFFFFB00FFF1E400FFE6CF00FFD2A600FF91
      3000FF913000FFD5AA00FFFFFF00FBFBFB00FFFFFF00FFFFFF00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF9473005A5A5A007B7B7B00DEDE
      DE00FFFFFF008484840084848400848484008484840084848400848484008484
      840042424200C6C6C6009494940094949400949494007B7B7B005A5A5A005A5A
      5A005A5A5A005A5A5A007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00EF947300EF9473000084
      840042E7630042E7630042E7A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042E7C60042E7C60042E7C60042E7C60042E7C60042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400ADADAD0063636300ADADAD00C6C6C600C6C6C600C6C6
      C600C6C6C600CECECE00CECECE00636363009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0063636300DEDE
      DE00E7E7E700E7E7E700EBEBEB00EBEBEB00EBEBEB00EBEBEB00F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFB00FFD5AA00FFD5AB00FFFFFB00FBFBFB00FBFB
      FB00FFFFFF00FFFFFF00CECECE0063636300CECECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF9473005A5A5A007B7B7B00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C6009494
      9400949494007B7B7B005A5A5A00EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF9473000084840042E7630042E7630042E7630042E7
      A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7
      A50042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70000848400A5A5A5000000
      0000A5A5A500C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CECECE006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00CECECE000000
      0000CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF947300EF9473007B7B7B00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C6007B7B7B00EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF9473000084
      840042E7630042E7630042E7630042E7630042E7A50042E7A50042E7A50042E7
      A50042E7A50042E7A50042E7A50042E7A50042E7A50042E7C60042E7C60042E7
      C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7C60042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7E70042E7
      E70042E7E70000848400A5A5A500A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF947300EF947300EF947300848484007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300EF947300EF947300EF947300EF947300EF94
      7300EF947300EF947300EF947300008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000084840000848400008484009C9C9C009C9C
      9C009C9C9C00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00DEDE
      DE00DEDEDE0063636300DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0063636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7D6D600B5ADAD008494A5008CB5D60094CE
      F7008CCEF70094D6EF0094D6F70094CEF70094CEF70094CEF70094CEF70094D6
      F70094D6FF0094D6F70084D6F7008CD6F7008CD6F7008CD6F70094D6EF008CD6
      F7009CD6F700CEE7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00DEDEDE0063636300DEDEDE00E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F7009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F70063636300F7F7F700DEDEDE00DEDEDE0063636300DEDEDE00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700F7F7F700F7F7F7009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0063636300FFFFFF00FFFF
      FF00FFFFFF0063636300FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700DED6
      CE009CADA5007394A50084C6DE008CD6FF0084DEFF008CDEF70094DEEF0094DE
      EF0094DEF70094DEF7009CDEF7009CE7F7009CE7F7009CE7F7009CE7F7009CE7
      F700A5E7F700A5E7F700ADE7F700B5EFFF00B5EFF700CEE7EF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F70063636300F7F7F700DEDEDE00DEDEDE0063636300DEDE
      DE00DEDEDE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F7009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF0063636300FFFF
      FF00FFFFFF00FFFFFF0063636300FFFFFF00EFEFEF0000000000EFEFEF00D6D6
      D600DEDEDE0063636300DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F700F7F7F7009C9C9C00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0063636300FFFFFF00FFFFFF00F7F7F70000000000F7F7F700DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700000000000000000000000000E7E7E7000000000000000000E7E7
      E700E7E7E700EFEFEF000000000000000000EFEFEF0000000000EFEFEF00EFEF
      EF000000000000000000EFEFEF0000000000F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7E7E700D6DECE00A5A59C007B9CAD008CDEF7008CDE
      F7008CDEF70084DEF7008CDEFF008CDEF70084DEEF0084DEEF0084DEEF0084DE
      EF0094E7F70094E7F7009CE7F7009CE7F7009CE7F700A5E7FF00ADE7FF00ADEF
      FF00ADEFF700CEEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF0000000000EFEF
      EF00D6D6D600DEDEDE0063636300DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F7F7F700F7F7F700F7F7F7009C9C9C00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300FFFFFF00FFFFFF00F7F7F70000000000F7F7
      F700EFEFEF00EFEFEF00EFEFEF00D6D6D600D6D6D60063636300DEDEDE00DEDE
      DE0000000000000000000000000000000000000000000000000000000000EFEF
      EF00EFEFEF00000000000000000000000000EFEFEF00F7F7F700F7F7F7009C9C
      9C00F7F7F700F7F7F7000000000000000000FFFFFF00FFFFFF009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063636300FFFFFF00FFFF
      FF00F7F7F700F7F7F700F7F7F700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0000000000DEDEDE00E7E7E700E7E7E70000000000E7E7E7000000
      0000E7E7E700E7E7E70000000000E7E7E700E7E7E700E7E7E700000000000000
      0000EFEFEF0000000000EFEFEF00EFEFEF0000000000EFEFEF00000000000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700DEDE
      CE00BDADA5008CA5BD008CDEF70094DEF70094DEF7008CDEFF007BD6EF0073CE
      E7007BD6EF008CDEF70094E7F7009CE7F700A5E7F700ADEFFF009CEFFF008CE7
      F70084DEF7008CE7F70094E7F70094E7F70094E7F700CEEFF700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00F7F7F700F7EF
      EF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00D6D6D600D6D6D60063636300DEDE
      DE00DEDEDE000000000000000000000000000000000000000000000000000000
      0000EFEFEF00EFEFEF00000000000000000000000000EFEFEF00F7F7F700F7F7
      F7009C9C9C00F7F7F700F7F7F7000000000000000000FFFFFF00FFFFFF009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063636300FFFF
      FF00FFFFFF00F7F7F700F7F7F700F7F7F700E7E7E70063636300E7E7E700D6D6
      D600D6D6D60063636300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F7F7F700F7F7F7009C9C9C00F7F7F700F7F7F700F7F7F700FFFF
      FF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0063636300FFFFFF00FFFFFF00EFEFEF0063636300EFEFEF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0000000000DEDEDE00DEDE
      DE00E7E7E700000000000000000000000000E7E7E7000000000000000000E7E7
      E70000000000000000000000000000000000EFEFEF0000000000EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F70000000000F7F7F700F7F7
      F700F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDED600D6D6CE00C6CEB500AD9C9C00849CAD008CDEF7008CE7
      F70094DEF70073CEE70073CEE7008CE7F70094DEEF008CCED60094C6D600A5CE
      DE0094B5BD007B9CA5009CD6DE00ADEFFF0094E7F7008CDEF7008CE7F7008CE7
      F70094E7F700BDDEEF00E7E7E700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00C6CECE007B848C008C94A500E7E7EF00E7E7E70063636300E7E7
      E700D6D6D600D6D6D60063636300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F7009C9C9C00F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300FFFFFF00FFFFFF00EFEFEF0063636300FFFF
      FF00E7E7E70000000000E7E7E700D6D6D600D6D6D60063636300D6D6D600DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EFEFEF00F7F7F7009C9C
      9C00F7F7F700F7F7F7000000000000000000FFFFFF00FFFFFF009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063636300FFFFFF00FFFF
      FF00EFEFEF0000000000EFEFEF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0000000000DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDED600D6D6CE00CEC6C600C6BDBD00BDB5B500ADAD
      9C008C7B7B007B8C9C008CDEF7008CE7FF007BCEDE007BCEE700A5EFF7008CCE
      CE0073A5A5009CB5BD00ADBDBD00ADB5BD00ADB5BD00849C9C0094ADB500ADD6
      E700ADEFF7008CE7F70084E7F7008CE7F700A5EFFF009CBDC600848C94009CA5
      AD00ADB5BD00ADBDC600A5B5C60094ADBD00849CA5005A7B8C0039637B007B9C
      BD00ADCEE700E7E7E70000000000E7E7E700D6D6D600D6D6D60063636300D6D6
      D600DEDEDE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF00F7F7
      F7009C9C9C00F7F7F700F7F7F7000000000000000000FFFFFF00FFFFFF009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063636300FFFF
      FF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D60063636300D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF009C9C9C00F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0063636300FFFFFF00FFFFFF00EFEFEF00EFEFEF00EFEFEF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0000000000DEDEDE000000
      0000DEDEDE0000000000E7E7E700E7E7E70000000000E7E7E700000000000000
      0000E7E7E700E7E7E70000000000EFEFEF0000000000EFEFEF0000000000EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000F7F7F700F7F7F7000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6CE00C6C6
      BD00BDBDB500BDB5AD00B5B5AD00A5A59C008C7373007B8C940094E7F70084D6
      EF007BCEE7009CE7F70084BDC6008CADA500ADC6C600BDBDBD00CECECE00CECE
      CE00A5B5AD00A5B5B500DEE7EF00A5BDC60094C6CE009CEFF70084E7F7008CE7
      F700A5EFFF007BADB500395A630039637300527B8C00638CA5006394B5005A9C
      B5004A849C00638CA5006394B5008CBDD600BDE7FF00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D60063636300D6D6D600D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9C9C00F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF00D6D6D60063636300D6D6D600CECECE00D6D6D60063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300FFFFFF00FFFF
      FF00E7E7E70063636300E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0000000000DEDEDE0000000000DEDEDE0000000000E7E7E700E7E7
      E70000000000E7E7E7000000000000000000E7E7E700E7E7E70000000000EFEF
      EF0000000000EFEFEF0000000000EFEFEF00EFEFEF0000000000EFEFEF000000
      000000000000F7F7F700F7F7F70000000000F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDED600D6D6D600D6CECE00CECECE00CECECE00C6C6
      BD00AD9C9C008C9C9C0094DEEF007BCEEF0094DEF70094D6E70094ADB500B5B5
      B500BDB5B500B5ADAD00A5A5A500B5B5B5007B848400B5C6BD00EFF7F700C6CE
      D6008CA5AD0094D6DE0094EFFF008CE7F700A5EFFF00527B8400293942005273
      84007B9CB5009CADCE00A5C6DE00A5CEE700ADC6D600BDCEDE0084A5BD00ADC6
      DE00F7FFFF00D6D6D60063636300D6D6D600CECECE00D6D6D600636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300636363006363630063636300636363006363630063636300FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF00D6D6D60000000000D6D6D600CECE
      CE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E70000000000E7E7E700D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0000000000DEDEDE000000
      0000DEDEDE0000000000E7E7E700E7E7E70000000000E7E7E700000000000000
      0000E7E7E700E7E7E70000000000E7E7E70000000000EFEFEF0000000000EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000EFEFEF00F7F7F7000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700DEC6C600949C9C008CD6E70084D6
      F70094DEFF008CBDCE00B5C6C600BDBDB500A5A5A500ADADAD00D6D6D600DEE7
      E700DEDEDE00CECECE00CED6CE00D6D6D600ADB5BD008CB5C6009CEFFF008CEF
      FF0094E7F7005A7B9C006B849C00ADCEE700CEDEEF00F7F7F700F7F7F700F7F7
      F700F7F7F700EFEFF7009CBDD600C6DEEF00FFFFFF00D6D6D60000000000D6D6
      D600CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF00CECECE00CECECE00CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700E7E7E700E7E7E700D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE005A5A5A00DEDEDE0029292900DEDEDE0000000000E7E7E700E7E7
      E70000000000E7E7E7000000000000000000E7E7E700E7E7E70000000000E7E7
      E70010101000EFEFEF0010101000EFEFEF00EFEFEF0000000000EFEFEF000000
      000000000000EFEFEF00F7F7F70000000000F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600C6CED600CED6
      DE00C6C6C6006B737B008CCED6008CDEF7009CDEF700A5CED600ADBDBD00B5B5
      B500ADB5AD00E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00CECE
      CE00B5B5C60094BDCE009CEFFF008CEFFF008CDEEF006BADCE0084CEEF0094DE
      F7009CCEE700CEDEE700F7F7F700F7F7F700F7F7F700A5C6CE008CB5C600D6E7
      EF00FFFFFF00CECECE00CECECE00CECECE00CECECE00CECECE00D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF00C6C6C60063636300C6C6C600CECE
      CE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0063636300DEDEDE00D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE008C8C8C00DEDEDE007B7B
      7B00DEDEDE004A4A4A00E7E7E700E7E7E70008080800E7E7E700080808000808
      0800E7E7E700E7E7E70021212100E7E7E70029292900EFEFEF0029292900EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000EFEFEF00F7F7F7000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00B5BDC600849CAD0084ADC60084B5C6006B9CAD0031637B0084BDD60094E7
      F70094DEEF00A5D6E700B5C6CE00BDBDBD00CED6D600F7FFFF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00CECEBD00D6D6D600A5B5C6008CC6D60094EFFF008CE7
      F7008CD6F7008CC6EF0094DEFF008CDEFF008CCEEF00A5C6DE00EFEFF700F7F7
      F700EFF7F7009CBDCE00CEDEE700F7F7F700FFFFFF00C6C6C60063636300C6C6
      C600CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF00C6C6C60000000000C6C6C600CECECE00CECECE00CECECE00CECECE00D6D6
      D600D6D6D600F7000800E7001800D6002900C6003900B5004A00A5005A009400
      6B0084007B0073008C0063009C005200AD004200BD00E7E7E700E7E7E700EFEF
      EF00EFEFEF00EFEFEF0063636300636363006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300FFFFFF00FFFF
      FF00DEDEDE0000000000DEDEDE00D6D6D600D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0063636300DEDEDE0073737300DEDEDE0094949400DEDEDE00E7E7
      E70063636300E7E7E7006363630063636300E7E7E700E7E7E70042424200E7E7
      E70042424200EFEFEF0039393900EFEFEF00EFEFEF0000000000EFEFEF000000
      000000000000EFEFEF00EFEFEF0000000000F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00D6D6D600D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE008C9CA500739CAD0084BDDE0084C6
      E70084BDDE00639CBD006BB5D6008CDEFF008CDEF7009CD6F700A5C6D600BDBD
      C600C6CECE00EFEFEF00FFFFFF00FFFFFF00F7F7F700DEE7E700C6CECE00B5C6
      CE009CBDCE009CE7EF008CE7F7008CE7F70094DEF7008CCEF7008CD6F70094DE
      F70094D6FF009CCEEF00BDD6EF00F7F7F700C6CEDE00A5BDCE00E7E7EF00F7F7
      F700FFFFFF00C6C6C60000000000C6C6C600CECECE00CECECE00CECECE00CECE
      CE00D6D6D600D6D6D600F7000800E7001800D6002900C6003900B5004A00A500
      5A0094006B0084007B0073008C0063009C005200AD004200BD00E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00636363006363630063636300636363006363
      630063636300636363006363630063636300FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF00BDBDBD00BDBDBD00BDBDBD00CECE
      CE00CECECE00CECECE00CECECE00CECECE00D6D6D600EF001000DE002100CE00
      3100BD004200AD0052009C0063008C0073007B0084006B0094005A00A5004A00
      B5003900C600E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF0063636300CECE
      CE00CECECE00D6D6D600D6D6D600DEDEDE00E7E7E700E7E7E700EFEFEF00F7F7
      F700F7F7F70063636300FFFFFF00FFFFFF00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE0031313100DEDEDE003939
      3900DEDEDE0039393900DEDEDE00E7E7E70084848400E7E7E700848484008484
      8400E7E7E700E7E7E70063636300E7E7E7005A5A5A00EFEFEF0052525200EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000EFEFEF00EFEFEF000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00CED6
      D6007B94A5006B9CB50073BDDE0084CEEF0094D6EF007BC6E7006BBDDE0084D6
      F70084DEF7008CDEF700B5E7F700CEDEE700BDC6CE00DED6DE00F7EFEF00EFE7
      E700DEDEDE00B5C6C600A5C6C6008CB5BD00ADDEEF00A5EFFF008CE7EF008CE7
      F7008CD6F70084D6EF008CD6EF009CD6F70094D6F70094DEFF008CC6E700B5C6
      D600C6CED600B5BDCE00DEE7E700F7F7F700FFFFFF00BDBDBD00BDBDBD00BDBD
      BD00CECECE00CECECE00CECECE00CECECE00CECECE00D6D6D600EF001000DE00
      2100CE003100BD004200AD0052009C0063008C0073007B0084006B0094005A00
      A5004A00B5003900C600E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF006363
      6300CECECE00CECECE00D6D6D600D6D6D600DEDEDE00E7E7E700E7E7E700FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00BDBDBD0063636300BDBDBD00C6C6C600CECECE00CECECE00CECECE00CECE
      CE00CECECE00E7001800D6002900C6003900B5004A00A5005A0094006B008400
      7B0073008C0063009C005200AD004200BD003100CE00E7E7E700E7E7E700E7E7
      E700E7E7E700EFEFEF0063636300CECECE00CECECE00D6D6D600D6D6D600DEDE
      DE00E7E7E700E7E7E700EFEFEF00F7F7F700F7F7F70063636300FFFFFF00FFFF
      FF00D6D6D60063636300D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDE
      DE00DEDEDE0031313100DEDEDE0031313100DEDEDE0031313100DEDEDE00DEDE
      DE0042424200E7E7E7004242420042424200E7E7E700E7E7E7008C8C8C00E7E7
      E70073737300E7E7E7006B6B6B00EFEFEF00EFEFEF0000000000EFEFEF000000
      000000000000EFEFEF00EFEFEF0000000000F7F7F70000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600D6D6
      D600D6D6D600DEDEDE00DEDEDE00BDC6C60073949C006BA5C60073C6E7008CD6
      EF009CDEF7009CDEF7007BC6E70084D6EF008CDEF7008CE7F7009CE7F700B5E7
      EF00CEE7EF00D6DEEF00C6CED600CED6DE00ADBDC6009CC6C6009CD6DE00A5DE
      EF009CE7F70094DEF70094E7F70094E7FF0084CEF70084D6EF0094DEF700ADE7
      F7009CDEF70084D6F70084CEE700BDD6E700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700BDBDBD0063636300BDBDBD00C6C6C600CECECE00CECECE00CECE
      CE00CECECE00CECECE00E7001800D6002900C6003900B5004A00A5005A009400
      6B0084007B0073008C0063009C005200AD004200BD003100CE00E7E7E700E7E7
      E700E7E7E700E7E7E700EFEFEF0063636300CECECE00CECECE00D6D6D600D6D6
      D600DEDEDE00E7E7E700FFFFFF00FFFFFF000000FF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF000000FF00B5B5B50000000000B5B5B500C6C6
      C600C6C6C600CECECE00CECECE00CECECE00CECECE00DE002100CE003100BD00
      4200AD0052009C0063008C0073007B0084006B0094005A00A5004A00B5003900
      C6002900D600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70063636300CECE
      CE0000000000000000000000000000000000000000000000000000000000F7F7
      F700F7F7F70063636300FFFFFF00FFFFFF00D6D6D60000000000D6D6D600D6D6
      D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE0031313100DEDEDE003131
      3100DEDEDE0031313100DEDEDE00DEDEDE0031313100E7E7E700313131003131
      3100E7E7E700E7E7E70073737300E7E7E7008C8C8C00E7E7E7007B7B7B00EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000EFEFEF00EFEFEF000000
      0000F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00C6CE
      CE007394A5007BB5CE0084CEEF00A5E7F700BDF7FF00A5E7F70094D6EF008CCE
      E7009CDEF70094DEEF0084E7EF0084E7F70094EFF700A5EFF700ADEFEF00A5EF
      EF009CEFEF009CEFEF00A5EFF7009CE7FF008CDEF70094E7FF0094E7F7007BC6
      E70084CEEF008CD6F700ADEFFF00CEFFFF00ADE7FF008CD6EF00ADDEF700EFF7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700B5B5B50000000000B5B5
      B500C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00DE002100CE00
      3100BD004200AD0052009C0063008C0073007B0084006B0094005A00A5004A00
      B5003900C6002900D600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7006363
      6300CECECE0000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF000000FF000000FF00FFFFFF000000FF000000
      FF00ADADAD00ADADAD00ADADAD00C6C6C600C6C6C600C6C6C600CECECE00CECE
      CE00CECECE00D6002900C6003900B5004A00A5005A0094006B0084007B007300
      8C0063009C005200AD004200BD003100CE002100DE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70063636300CECECE00CECECE00D6D6D600D6D6D600DEDE
      DE00E7E7E700E7E7E700EFEFEF00F7F7F700F7F7F70063636300FFFFFF00FFFF
      FF00CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600DEDEDE00DEDE
      DE00DEDEDE0031313100DEDEDE0031313100DEDEDE0031313100DEDEDE00DEDE
      DE0031313100E7E7E7003131310031313100E7E7E700E7E7E70031313100E7E7
      E7006B6B6B00E7E7E70094949400EFEFEF00EFEFEF0000000000EFEFEF000000
      000000000000EFEFEF00EFEFEF0000000000EFEFEF0000000000F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600D6D6
      D600D6D6D600DEDEDE00DEDEDE00DEDEDE009CB5BD0084B5C6009CD6F700ADE7
      F700B5EFF700A5E7FF009CD6EF0094C6DE00B5EFF70094DEF7008CDEF7008CD6
      EF008CCEE70094D6E7009CDEEF009CD6EF0094D6EF008CCEE70084CEE70084D6
      EF008CDEFF00A5EFFF009CD6E7006BA5CE008CCEF70094D6F700ADE7F700B5EF
      F700ADE7EF00B5DEEF00DEEFF700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700ADADAD00ADADAD00ADADAD00C6C6C600C6C6C600C6C6C600CECE
      CE00CECECE00CECECE00D6002900C6003900B5004A00A5005A0094006B008400
      7B0073008C0063009C005200AD004200BD003100CE002100DE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E70063636300CECECE00CECECE00D6D6D600D6D6
      D600FFFFFF00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF00ADADAD0063636300ADADAD00C6C6
      C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CE003100BD004200AD00
      52009C0063008C0073007B0084006B0094005A00A5004A00B5003900C6002900
      D6001800E700DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63006363630063636300FFFFFF00FFFFFF00CECECE0063636300CECECE00D6D6
      D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE0031313100DEDEDE003131
      3100DEDEDE0031313100DEDEDE00DEDEDE0031313100E7E7E700313131003131
      3100E7E7E700E7E7E70031313100E7E7E70031313100E7E7E70031313100EFEF
      EF00EFEFEF0000000000EFEFEF000000000000000000EFEFEF00EFEFEF000000
      0000EFEFEF0000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDE
      DE00D6DEE700ADCEDE009CCEE700A5D6EF00A5DEF70094DEF7007BBDDE00739C
      C6007BB5CE0084CEEF006BB5D6006BA5C60063A5BD0063A5BD0063A5BD006BA5
      C6006BA5C600639CBD005AA5BD005AADCE0073CEEF008CCEEF0073ADCE007BB5
      DE0084C6F700A5DEF700B5EFF700ADEFEF00B5EFEF00DEEFF700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700ADADAD0063636300ADAD
      AD00C6C6C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CE003100BD00
      4200AD0052009C0063008C0073007B0084006B0094005A00A5004A00B5003900
      C6002900D6001800E700DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E7006363
      6300636363006363630063636300FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF00A5A5A50000000000A5A5A500C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600CECECE00BD004200AD0052009C0063008C0073007B0084006B0094005A00
      A5004A00B5003900C6002900D6001800E7000800F700DEDEDE00DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFF
      FF00CECECE0000000000CECECE00D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600D6D6
      D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEE7E700CEDEE700BDD6
      E700B5DEEF009CCEE70094C6E7007BB5D6006BA5CE0063B5DE0073C6EF0084D6
      F7007BCEEF0073C6EF0073C6EF007BCEEF007BCEF70084D6F7007BD6F70073CE
      EF0073C6E7007BC6DE0094CEDE00A5D6EF00ADDEF700CEEFF700DEF7F700D6EF
      F700E7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700A5A5A50000000000A5A5A500C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600CECECE00BD004200AD0052009C0063008C0073007B0084006B00
      94005A00A5004A00B5003900C6002900D6001800E7000800F700DEDEDE00DEDE
      DE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFFFF000000
      FF000000FF00FFFFFF000000FF000000FF00A5A5A500A5A5A500A5A5A500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECE
      CE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600C6C6C600C6C6C600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEE700D6E7EF00CEE7EF00BDDE
      F700ADDEF7009CD6F7009CD6F7009CDEF7009CD6F7009CD6F7009CD6F7009CDE
      F7009CDEF7009CDEFF009CDEF700A5DEF700ADE7F700BDEFF700CEEFF700DEF7
      F700E7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5
      A500C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CECECE00CECE
      CE00CECECE00CECECE00CECECE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF009C9C9C009C9C9C009C9C9C00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700C6C6C600C6C6C600C6C6C600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7EF00DEE7EF00D6E7F700CEEF
      F700C6EFF700C6EFF700C6E7F700C6EFF700CEEFF700CEEFFF00D6EFFF00DEEF
      F700E7EFEF00E7EFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7009C9C9C009C9C9C009C9C9C00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7E7E700E7E7E700FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00}
  end
  object TimerStartStop: TTimer
    Enabled = False
    OnTimer = TimerStartStopTimer
    Left = 235
    Top = 288
  end
  object MenuBacheca: TPopupMenu
    OnPopup = MenuBachecaPopup
    Left = 1099
    Top = 320
    object Incollalevociselezionatesuldocumento1: TMenuItem
      Caption = 'Incolla le voci selezionate sul documento'
      OnClick = Incollalevociselezionatesuldocumento1Click
    end
    object Incollatuttelevocisuldocumento1: TMenuItem
      Caption = 'Incolla tutte le voci sul documento'
      OnClick = Incollatuttelevocisuldocumento1Click
    end
    object Refresh1: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
    object SvuotaBacheca: TMenuItem
      Caption = 'Elimina tutto'
      OnClick = SvuotaBachecaClick
    end
  end
  object TimerLaunchTabForms: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerLaunchTabFormsTimer
    Left = 216
    Top = 216
  end
  object TimerBlinkAllegatiAlarm: TTimer
    Enabled = False
    OnTimer = TimerBlinkAllegatiAlarmTimer
    Left = 230
    Top = 554
  end
end
