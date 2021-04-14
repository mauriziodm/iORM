object ImpegnoForm: TImpegnoForm
  Left = 511
  Top = 47
  Anchors = [akLeft, akTop, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Impegni'
  ClientHeight = 805
  ClientWidth = 809
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ClientTopPanel: TbmpPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 68
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 0
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
      OnClick = RxSpeedButtonVisualizzaClick
    end
    object RxSpeedButtonUscita: TSpeedButton
      Left = 7
      Top = 2
      Width = 49
      Height = 42
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
      AllowAllUp = True
      GroupIndex = 1
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
    object RxSpeedButtonElimina: TSpeedButton
      Left = 212
      Top = 2
      Width = 49
      Height = 42
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
      OnClick = RxSpeedButtonEliminaClick
    end
    object RxSpeedButtonTrova: TSpeedButton
      Left = 262
      Top = 2
      Width = 49
      Height = 42
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
    end
    object RxSpeedButtonStampa: TSpeedButton
      Left = 362
      Top = 2
      Width = 49
      Height = 42
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
      OnClick = RxSpeedButtonStampaClick
      OnMouseUp = RxSpeedButtonStampaMouseUp
    end
    object RxSpeedButtonHelp: TSpeedButton
      Left = 62
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
      Left = 48
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Report'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object FormMainPanel: TPanel
    Left = 0
    Top = 68
    Width = 715
    Height = 700
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object PanelTabs: TPanel
      Left = 0
      Top = 0
      Width = 715
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      Visible = False
      object TabControlPagineDocumento: TcxTabControl
        Left = 0
        Top = 0
        Width = 715
        Height = 19
        Cursor = crHandPoint
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Properties.CustomButtons.Buttons = <>
        Properties.Style = 9
        Properties.TabIndex = 0
        Properties.Tabs.Strings = (
          'Appuntamento / Intervento'
          'Ricambi / Mandopera'
          'Operazioni pianificate'
          'Precedenti'
          'Allegati F/G'
          'Anagrafica articolo'
          'Distinta base'
          'Mappa')
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        OnChange = TabControlPagineDocumentoChange
        ClientRectRight = 0
        ClientRectTop = 0
      end
    end
    object PageControlPagineDocumento: TcxPageControl
      Left = 0
      Top = 19
      Width = 715
      Height = 632
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      Properties.ActivePage = TabInterventiPrecedenti
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      OnChange = PageControlPagineDocumentoChange
      ClientRectBottom = 632
      ClientRectRight = 715
      ClientRectTop = 24
      object TabAppuntamento: TcxTabSheet
        Caption = 'Appuntamento'
        Color = clWhite
        ImageIndex = 0
        ParentColor = False
        DesignSize = (
          715
          608)
        object AppuntamentoClientArea: TScrollBox
          Left = 2
          Top = -1
          Width = 681
          Height = 603
          HorzScrollBar.Range = 654
          VertScrollBar.ButtonSize = 12
          VertScrollBar.Increment = 42
          VertScrollBar.Range = 3000
          VertScrollBar.Size = 12
          VertScrollBar.Style = ssFlat
          VertScrollBar.Tracking = True
          Anchors = [akLeft, akTop, akBottom]
          AutoScroll = False
          BorderStyle = bsNone
          Color = clWhite
          Ctl3D = False
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object PanelChiamata: TPanel
            Left = -1
            Top = 1212
            Width = 662
            Height = 119
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 0
            Visible = False
            object LabelPanelChiamata: TLabel
              Left = 0
              Top = 0
              Width = 662
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' CHIAMATA'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              ExplicitWidth = 661
            end
            object Label21: TLabel
              Left = 6
              Top = 18
              Width = 75
              Height = 14
              AutoSize = False
              Caption = 'Data e ora'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelMotivoChiamata: TLabel
              Left = 6
              Top = 59
              Width = 115
              Height = 14
              AutoSize = False
              Caption = 'Motivo della chiamata'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBText1: TDBText
              Left = 522
              Top = 0
              Width = 136
              Height = 14
              Alignment = taRightJustify
              DataField = 'ID'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelTipoIntervento: TLabel
              Left = 559
              Top = 39
              Width = 83
              Height = 14
              AutoSize = False
              Caption = 'Tipo intervento'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Image1: TImage
              Left = 307
              Top = 37
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036040000424D360400000000000036000000280000001000
                000010000000010020000000000000040000C30E0000C30E0000000000000000
                0000EAEAEAFFDEDDDEFFC9CCCEFFC9CDCFFFC9CDCFFFC9CDCFFFC9CDCFFFC9CD
                CFFFC9CDCFFFC9CDCFFFC9CDCFFFC9CDCFFFC9CDCFFFC9CCCFFFDFDEDFFFEAEA
                EAFFDCDCDCFF418DA2FF039AC1FF039EC4FF03A0C5FF03A2C6FF03A2C7FF03A2
                C7FF03A2C7FF03A2C6FF03A2C6FF03A0C5FF039EC4FF0499C0FF4D90A3FFDFDE
                DFFFBDC5C9FF039DC5FF00BEECFF00C5F0FF00CAF3FF00CDF4FF00CDF5FF00CD
                F5FF00CDF5FF00CDF5FF00CCF4FF00CAF3FF00C5F0FF00BEECFF0498BEFFCBCD
                D0FFD7D7D8FF228EAAFF00C2EEFF00CAF3FF00D0F6FF00D4F8FF00CFF3FF005D
                6DFF004F5CFF00CBEDFF00D4F8FF00D0F6FF00CAF3FF00C1EEFF2C8DA7FFDCDB
                DCFFE8E8E8FF86A2ABFF12B7DDFF21D2F5FF20D8F9FF18DBFBFF09A7C0FF0000
                00FF000000FF00ABC6FF00D7FBFF00D3F8FF00CBF4FF02AED5FF93A9B1FFE9E8
                E9FFEAEAEAFFD7D7D8FF3B96ADFF47D8F6FF4EE0FAFF54E5FCFF5AE5FBFF3985
                91FF278C9BFF02DBFCFF00D8FBFF00D2F7FF00C9F2FF2E8FA8FFDBDADBFFEAEA
                EAFFEBEBEBFFE8E8E8FF87A3ACFF4AC6E2FF5CE0F9FF63E6FBFF6AE9FDFF4B9F
                ACFF51A0ABFF69E9FDFF16D9FAFF00CEF5FF02B0D7FF94AAB1FFE9E9E9FFEBEB
                EBFFEBEBEBFFEAEAEAFFD7D7D8FF4899AEFF6BE0F8FF72E6FBFF79EAFCFF3A6D
                75FF44777FFF8DEDFDFF8AEAFBFF17CEF3FF2F8FA8FFDBDBDBFFEAEAEAFFEBEB
                EBFFEBEBEBFFEBEBEBFFE8E8E8FF88A3ACFF68CDE3FF81E7FAFF88EBFCFF233C
                40FF2C464BFF9CEFFCFFA2EDFBFF62C5DBFF94AAB2FFE9E9E9FFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEAEAEAFFD7D7D8FF559CAFFF90E8F9FF94E8F7FF070C
                0CFF0D1314FFA8EDF9FFB0EEFBFF629CABFFDBDBDCFFEAEAEAFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFE8E8E8FF89A4ADFF86D3E5FF85C0CBFF0000
                00FF000000FF9ACAD4FF96D1DFFF95AAB2FFE9E9E9FFEBEBEBFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFD8D7D8FF619FAFFF7EA8B1FF0000
                00FF000000FF91B3BAFF689DACFFDCDBDCFFEAEAEAFFEBEBEBFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFE8E8E8FF8AA4ADFF96CAD6FF4857
                5BFF556568FF9FCFDAFF96AAB2FFE9E9E9FFEBEBEBFFEBEBEBFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFD8D7D8FF6CA1B0FFCFF2
                FBFFD4F4FCFF6D9EACFFDCDBDCFFEAEAEAFFEBEBEBFFEBEBEBFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFE8E8E8FF96ABB3FF82B6
                C4FF7FB2C0FF9FB1B7FFE9E9E9FFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEB
                EBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFE5E5E5FFC8CC
                CEFFCACED0FFE6E6E6FFEAEAEAFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEB
                EBFF}
            end
            object Image2: TImage
              Left = 418
              Top = 37
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036030000424D360300000000000036000000280000001000
                000010000000010018000000000000030000C30E0000C30E0000000000000000
                0000EBEBEBEBEBEBEBEBEBE7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
                E7E7E7E7E7E7E7E7E7EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB6F6F6FB1B1
                B1C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C79797976F6F6FEBEBEBEBEBEBEB
                EBEBEBEBEBEBEBEBEBEBEB737373B6B6B6CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
                CCCCCC9C9C9C737373EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB767676B9B9
                B9CECECECECECECECECECECECECECECECECECE9F9F9F767676EBEBEBEBEBEBEB
                EBEBEBEBEBCDCDCDE3E3E37B7B7BBBBBBBCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
                CFCFCFA2A2A27B7B7BEBEBEBCCCCCCEBEBEBDBDBDB767676C7C7C78E8E8EA3A3
                A3ACACACACACACACACACACACACACACACACACAC9999998E8E8ED5D5D5767676D1
                D1D1D7D7D77C7C7C9F9F9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFABABAB7C7C7CC0C0C0C4C4C48282828282828282828282
                82828282828282828282828282828282828282828282828282828282828282BD
                BDBDC1C1C1878787878787878787878787878787878787878787878787878787
                878787878787878787878787878787BBBBBBC0C0C08D8D8D8D8D8D8D8D8D8D8D
                8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DBC
                BCBCC5C5C5929292929292929292929292929292929292929292929292929292
                929292DFDFDFACACACE5E5E5959595C2C2C2E8E8E8D0D0D0CECECEC6C6C6C6C6
                C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7D0D0D0D0D0D0E8
                E8E8EBEBEBEBEBEBEBEBEBAAAAAAA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
                A4A4A4A4A4A4B3B3B3EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBA7A7A7A1A1
                A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1B0B0B0EBEBEBEBEBEBEB
                EBEBEBEBEBEBEBEBEBEBEBABABABA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
                A5A5A5A5A5A5B3B3B3EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC3C3C3C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C6C6EBEBEBEBEBEBEB
                EBEB}
              Transparent = True
            end
            object Label51: TLabel
              Left = 6
              Top = 39
              Width = 75
              Height = 14
              AutoSize = False
              Caption = 'Richiedente'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBEMotivoChiamata: TDBMemo
              Left = 131
              Top = 59
              Width = 392
              Height = 54
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'EVENTMESSAGE'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEDataChiamata: TcxDBDateEdit
              Left = 129
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'DATAORACHIAMATA'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = []
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.Shadow = False
              Style.TransparentBorder = True
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 90
            end
            object DBETipoIntervento: TcxDBCheckListBox
              Left = 530
              Top = 59
              Width = 123
              Height = 39
              Cursor = crHandPoint
              Columns = 1
              DataBinding.DataSource = SourceImp
              DataBinding.DataField = 'TIPOINTERVENTO'
              EditValueFormat = cvfCaptions
              Items = <
                item
                  Text = 'Collaudo'
                end
                item
                  Text = 'Manutenzione'
                end
                item
                  Text = 'Guasto o altro'
                end>
              ParentColor = False
              ParentFont = False
              Style.BorderStyle = cbsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 6
              OnCheckStatesToEditValue = DBETipoInterventoCheckStatesToEditValue
              OnEditValueToCheckStates = DBETipoInterventoEditValueToCheckStates
              OnEnter = DBEdit1Enter
              OnExit = DBETipoInterventoExit
            end
            object DBEOraChiamata: TcxDBTimeEdit
              Left = 215
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'DATAORACHIAMATA'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object dbeUrgente: TcxDBCheckBox
              Left = 320
              Top = 35
              Caption = 'Urgente'
              DataBinding.DataField = 'URGENTE'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.BorderStyle = ebsSingle
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 3
            end
            object cxDBCheckBox1: TcxDBCheckBox
              Left = 432
              Top = 35
              Caption = 'Stampato F.L.'
              DataBinding.DataField = 'STAMPATO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.BorderStyle = ebsSingle
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 4
            end
            object CheckBoxFatto: TcxDBCheckBox
              Left = 1
              Top = 97
              Caption = 'Fatto'
              DataBinding.DataField = 'FATTO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment = taLeftJustify
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.BorderStyle = ebsSingle
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 7
            end
            object DBERichiedente: TcxDBComboBox
              Left = 129
              Top = 36
              DataBinding.DataField = 'RICHIEDENTE'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Sorted = True
              Properties.OnInitPopup = DBERichiedentePropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Width = 146
            end
          end
          object PanelAppuntamento: TPanel
            Left = 0
            Top = 1339
            Width = 661
            Height = 142
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 1
            Visible = False
            object Shape7: TShape
              Left = 3
              Top = 17
              Width = 262
              Height = 77
              Brush.Style = bsClear
              Pen.Color = clGray
              Shape = stRoundRect
            end
            object LabelPanelAppuntamento: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' APPUNTAMENTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label3: TLabel
              Left = 6
              Top = 32
              Width = 24
              Height = 12
              Caption = 'Data'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelLuogoAppuntamento: TLabel
              Left = 308
              Top = 17
              Width = 37
              Height = 14
              AutoSize = False
              Caption = 'Luogo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label13: TLabel
              Left = 126
              Top = 32
              Width = 19
              Height = 12
              Caption = 'Ora'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelTecnico: TLabel
              Left = 6
              Top = 100
              Width = 136
              Height = 14
              AutoSize = False
              Caption = 'Tecnico'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label2: TLabel
              Left = 172
              Top = 23
              Width = 28
              Height = 12
              Caption = 'Inizio'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label5: TLabel
              Left = 172
              Top = 43
              Width = 21
              Height = 12
              Caption = 'Fine'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape3: TShape
              Left = 148
              Top = 39
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape4: TShape
              Left = 158
              Top = 29
              Width = 1
              Height = 21
              Pen.Color = clGray
            end
            object Shape5: TShape
              Left = 159
              Top = 29
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape6: TShape
              Left = 159
              Top = 49
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object LabelAgente: TLabel
              Left = 191
              Top = 100
              Width = 119
              Height = 14
              AutoSize = False
              Caption = 'Agente'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelArticolo: TLabel
              Left = 363
              Top = 100
              Width = 136
              Height = 14
              AutoSize = False
              Caption = 'Articolo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelDurataAppuntamento: TLabel
              Left = 9
              Top = 59
              Width = 248
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = '- - -'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label47: TLabel
              Left = 6
              Top = 78
              Width = 33
              Height = 12
              Caption = 'Colore'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label48: TLabel
              Left = 121
              Top = 78
              Width = 22
              Height = 12
              Caption = 'Tipo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBELuogo: TDBMemo
              Left = 343
              Top = 17
              Width = 313
              Height = 46
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'LOCATION'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEDataAppuntamento: TcxDBDateEdit
              Left = 32
              Top = 29
              AutoSize = False
              DataBinding.DataField = 'START_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = []
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.Shadow = False
              Style.TransparentBorder = True
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 90
            end
            object DBEDataFineAppuntamento: TcxDBDateEdit
              Left = 403
              Top = 25
              AutoSize = False
              DataBinding.DataField = 'FINISH'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = []
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.Shadow = False
              Style.TransparentBorder = True
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 2
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 21
              Width = 90
            end
            object DBETecnico: TcxDBLookupComboBox
              Left = 63
              Top = 96
              AutoSize = False
              DataBinding.DataField = 'RESOURCEID'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'RESOURCEID'
              Properties.ListColumns = <
                item
                  FieldName = 'RESOURCENAME'
                end>
              Properties.ListOptions.AnsiSort = True
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = SourceTecnici
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = True
              Style.Shadow = False
              Style.ButtonStyle = btsSimple
              Style.IsFontAssigned = True
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 21
              Width = 120
            end
            object DBEOraAppuntamento: TcxDBTimeEdit
              Left = 202
              Top = 20
              AutoSize = False
              DataBinding.DataField = 'START_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Properties.OnChange = DBEOraAppuntamentoPropertiesChange
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBEOraFineAppuntamento: TcxDBTimeEdit
              Left = 202
              Top = 40
              AutoSize = False
              DataBinding.DataField = 'FINISH_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Properties.OnChange = DBEOraAppuntamentoPropertiesChange
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DbeArticolo: TcxDBButtonEdit
              Left = 412
              Top = 96
              DataBinding.DataField = 'CODICEARTICOLO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = DbeArticoloPropertiesButtonClick
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 9
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Width = 120
            end
            object DbeDescrizioneArticolo: TcxDBTextEdit
              Tag = -1
              Left = 528
              Top = 96
              TabStop = False
              DataBinding.DataField = 'DESCRIZIONEARTICOLO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 10
              Width = 130
            end
            object DbeAgente: TcxDBComboBox
              Left = 237
              Top = 96
              DataBinding.DataField = 'AGENTE'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.DropDownListStyle = lsEditFixedList
              Properties.Sorted = True
              Properties.OnEditValueChanged = DbeAgentePropertiesEditValueChanged
              Properties.OnInitPopup = DbeAgentePropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Width = 120
            end
            object PanelAgenti: TPanel
              Left = 0
              Top = 119
              Width = 667
              Height = 19
              BevelOuter = bvNone
              Ctl3D = False
              ParentColor = True
              ParentCtl3D = False
              TabOrder = 11
              object LabelAgente2: TLabel
                Left = 0
                Top = 3
                Width = 63
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Agente 2'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object LabelAgente3: TLabel
                Left = 207
                Top = 3
                Width = 63
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Agente 3'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object LabelAgente4: TLabel
                Left = 415
                Top = 3
                Width = 63
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Agente 4'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
              object dbeAgente2: TcxDBComboBox
                Left = 63
                Top = -1
                AutoSize = False
                DataBinding.DataField = 'AGENTE2'
                DataBinding.DataSource = SourceImp
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.ImmediatePost = True
                Properties.Sorted = True
                Properties.OnEditValueChanged = dbeAgente2PropertiesEditValueChanged
                Properties.OnInitPopup = dbeAgente2PropertiesInitPopup
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.Shadow = False
                Style.ButtonStyle = btsDefault
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 0
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 21
                Width = 142
              end
              object dbeAgente3: TcxDBComboBox
                Left = 270
                Top = -1
                AutoSize = False
                DataBinding.DataField = 'AGENTE3'
                DataBinding.DataSource = SourceImp
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.ImmediatePost = True
                Properties.Sorted = True
                Properties.OnEditValueChanged = dbeAgente3PropertiesEditValueChanged
                Properties.OnInitPopup = dbeAgente3PropertiesInitPopup
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.Shadow = False
                Style.ButtonStyle = btsDefault
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 1
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 21
                Width = 142
              end
              object dbeAgente4: TcxDBComboBox
                Left = 478
                Top = -1
                AutoSize = False
                DataBinding.DataField = 'AGENTE4'
                DataBinding.DataSource = SourceImp
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.ImmediatePost = True
                Properties.Sorted = True
                Properties.OnInitPopup = dbeAgente4PropertiesInitPopup
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.Shadow = False
                Style.ButtonStyle = btsDefault
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 2
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 21
                Width = 142
              end
            end
            object dbeLabelColor: TcxDBColorComboBox
              Left = 45
              Top = 73
              DataBinding.DataField = 'LABELCOLOR'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.CustomColors = <>
              Properties.ImmediatePost = True
              Properties.ShowDescriptions = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Width = 52
            end
            object dbeState: TcxDBImageComboBox
              Left = 148
              Top = 73
              AutoSize = False
              DataBinding.DataField = 'STATE'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              PopupMenu = PopupMenuAnnullaAppuntamento
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Free'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Tentative'
                  Value = 1
                end
                item
                  Description = 'Busy'
                  Value = 2
                end
                item
                  Description = 'Out of office'
                  Value = 3
                end>
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 19
              Width = 114
            end
          end
          object PanelIntervento: TPanel
            Left = 0
            Top = 1492
            Width = 661
            Height = 274
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 2
            Visible = False
            object Shape12: TShape
              Left = 3
              Top = 17
              Width = 262
              Height = 58
              Brush.Style = bsClear
              Pen.Color = clGray
              Shape = stRoundRect
            end
            object LabelPanelIntervento: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' RAPPORTO INTERVENTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label8: TLabel
              Left = 6
              Top = 145
              Width = 115
              Height = 14
              AutoSize = False
              Caption = 'Relazione'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label19: TLabel
              Left = 6
              Top = 237
              Width = 38
              Height = 12
              Caption = 'Veicolo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label22: TLabel
              Left = 6
              Top = 255
              Width = 16
              Height = 12
              Caption = 'Km'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label23: TLabel
              Left = 91
              Top = 255
              Width = 56
              Height = 12
              Caption = 'Carburante'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label24: TLabel
              Left = 338
              Top = 255
              Width = 25
              Height = 12
              Caption = 'Vitto'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label25: TLabel
              Left = 430
              Top = 255
              Width = 41
              Height = 12
              Caption = 'Alloggio'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label26: TLabel
              Left = 214
              Top = 255
              Width = 56
              Height = 12
              Caption = 'Autostrada'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object LabelSpese: TLabel
              Left = 315
              Top = 233
              Width = 29
              Height = 12
              Caption = 'Spese'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label28: TLabel
              Left = 537
              Top = 255
              Width = 58
              Height = 12
              Caption = 'Altre spese'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label9: TLabel
              Left = 6
              Top = 32
              Width = 24
              Height = 12
              Caption = 'Data'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label10: TLabel
              Left = 126
              Top = 32
              Width = 19
              Height = 12
              Caption = 'Ora'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label11: TLabel
              Left = 172
              Top = 23
              Width = 28
              Height = 12
              Caption = 'Inizio'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label34: TLabel
              Left = 172
              Top = 43
              Width = 21
              Height = 12
              Caption = 'Fine'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape8: TShape
              Left = 148
              Top = 39
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape9: TShape
              Left = 158
              Top = 29
              Width = 1
              Height = 21
              Pen.Color = clGray
            end
            object Shape10: TShape
              Left = 159
              Top = 29
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape11: TShape
              Left = 159
              Top = 49
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object BitBtnSelezioneStato: TSpeedButtonRollOver
              Left = 378
              Top = 33
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
            end
            object LabelStatoDocumento: TLabel
              Left = 281
              Top = 32
              Width = 31
              Height = 14
              AutoSize = False
              Caption = ' Stato '
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object LabelDurataIntervento: TLabel
              Left = 9
              Top = 60
              Width = 248
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = '- - -'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBERelazioneIntervento: TDBMemo
              Left = 65
              Top = 145
              Width = 591
              Height = 50
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RELAZIONEINTERVENTO'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEKm: TDBEdit
              Left = 24
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'KMPERCORSI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object PanelVeicolo: TPanel
              Left = 51
              Top = 237
              Width = 176
              Height = 14
              BevelOuter = bvNone
              Caption = 'PanelModello'
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              Visible = False
              object DBEVeicolo: TDBComboBox
                Left = -2
                Top = -3
                Width = 181
                Height = 20
                Color = 16250871
                DataField = 'VEICOLO'
                DataSource = SourceImp
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnDropDown = DBEVeicoloDropDown
              end
            end
            object DBECarburante: TDBEdit
              Left = 149
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'SPESECARBURANTE'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object DBEAutostrada: TDBEdit
              Left = 272
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'SPESEAUTOSTRADA'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object DBEAlloggio: TDBEdit
              Left = 472
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'SPESEALLOGGIO'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 10
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object DBEVitto: TDBEdit
              Left = 364
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'SPESEVITTO'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 9
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object DBEAltreSpese: TDBEdit
              Left = 596
              Top = 255
              Width = 60
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'SPESEALTRE'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 11
              Visible = False
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = DBEKmKeyPress
            end
            object DBEDataIntervento: TcxDBDateEdit
              Left = 32
              Top = 29
              AutoSize = False
              DataBinding.DataField = 'DATAORAINTERVENTO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = []
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.Shadow = False
              Style.TransparentBorder = True
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 90
            end
            object DBEOraIntervento: TcxDBTimeEdit
              Left = 202
              Top = 20
              AutoSize = False
              DataBinding.DataField = 'DATAORAINTERVENTO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Properties.OnChange = DBEOraInterventoPropertiesChange
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBEOraFineIntervento: TcxDBTimeEdit
              Left = 202
              Top = 40
              AutoSize = False
              DataBinding.DataField = 'DATAORAFINEINTERVENTO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Properties.OnChange = DBEOraInterventoPropertiesChange
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBEditStatoDocumento: TDBEdit
              Left = 315
              Top = 33
              Width = 60
              Height = 14
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'StatoDescrizione'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnChange = DBEditStatoDocumentoChange
            end
            object PanelRifDoc: TPanel
              Left = -1
              Top = 198
              Width = 669
              Height = 27
              BevelOuter = bvNone
              Ctl3D = False
              ParentColor = True
              ParentCtl3D = False
              TabOrder = 12
              object Label136: TLabel
                Left = 6
                Top = 12
                Width = 41
                Height = 12
                Caption = 'Rif. doc.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label137: TLabel
                Left = 311
                Top = 12
                Width = 29
                Height = 15
                AutoSize = False
                Caption = 'del'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label138: TLabel
                Left = 164
                Top = 12
                Width = 51
                Height = 14
                AutoSize = False
                Caption = 'N'#176
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Shape1: TShape
                Left = -20
                Top = 5
                Width = 689
                Height = 1
                Pen.Color = clWhite
              end
              object Label139: TLabel
                Left = 431
                Top = 12
                Width = 66
                Height = 12
                Caption = 'Corrispettivo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object dbeRifDoc_TipoDoc: TcxDBComboBox
                Left = 53
                Top = 9
                AutoSize = False
                DataBinding.DataField = 'RIFDOC_TIPO'
                ParentFont = False
                Properties.ImmediatePost = True
                Properties.Items.Strings = (
                  ''
                  'Buono di lavoro'
                  'Estratto_conto'
                  'Fatt.R.F.'
                  'Fattura'
                  'Intervento'
                  'Ordine di servizio'
                  'Ricev.fisc'
                  'Scontrino')
                Properties.Sorted = True
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.Shadow = False
                Style.ButtonStyle = btsDefault
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 0
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 20
                Width = 100
              end
              object dbeRifDoc_NumDoc: TcxDBTextEdit
                Left = 181
                Top = 9
                AutoSize = False
                DataBinding.DataField = 'RIFDOC_NUM'
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 1
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 20
                Width = 60
              end
              object dbeRifDoc_RegDoc: TcxDBComboBox
                Left = 239
                Top = 9
                AutoSize = False
                DataBinding.DataField = 'RIFDOC_REG'
                ParentFont = False
                Properties.ImmediatePost = True
                Properties.Sorted = True
                Properties.OnInitPopup = dbeRifDoc_RegDocPropertiesInitPopup
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.Shadow = False
                Style.ButtonStyle = btsDefault
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 2
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 20
                Width = 60
              end
              object dbeRifDoc_DataDoc: TcxDBDateEdit
                Left = 330
                Top = 9
                AutoSize = False
                DataBinding.DataField = 'RIFDOC_DATA'
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ShowTime = False
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                StyleDisabled.Color = 16250871
                TabOrder = 3
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 20
                Width = 90
              end
              object dbeRifDoc_CorrispNoPag: TcxDBImageComboBox
                Left = 501
                Top = 9
                AutoSize = False
                DataBinding.DataField = 'RIFDOC_CORRISPNOPAG'
                ParentFont = False
                Properties.ImageAlign = iaRight
                Properties.ImmediatePost = True
                Properties.Items = <
                  item
                  end
                  item
                    Description = 'PAGATO'
                    Value = 'F'
                  end
                  item
                    Description = 'NON PAGATO'
                    ImageIndex = 9
                    Value = 'T'
                  end
                  item
                    Description = 'CHIUSO (non pagato)'
                    ImageIndex = 10
                    Value = 'C'
                  end
                  item
                    Description = 'NON DOVUTO'
                    ImageIndex = 13
                    Value = 'N'
                  end>
                Style.BorderStyle = ebsNone
                Style.Color = 16250871
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.IsFontAssigned = True
                TabOrder = 4
                OnEnter = DBEdit1Enter
                OnExit = DBEdit1Exit
                Height = 20
                Width = 158
              end
            end
          end
          object PanelNumDataDocumento: TPanel
            Left = 0
            Top = 32
            Width = 674
            Height = 55
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 3
            Visible = False
            object ShapeAzioni: TShape
              Left = 417
              Top = 0
              Width = 158
              Height = 55
              Brush.Color = 13822463
              Pen.Color = 427007
            end
            object ShapeDocumento: TShape
              Left = 0
              Top = 0
              Width = 414
              Height = 55
              Brush.Color = 13822463
              Pen.Color = 427007
            end
            object LabelData: TLabel
              Left = 268
              Top = 18
              Width = 29
              Height = 15
              AutoSize = False
              Caption = 'del'
              Font.Charset = ANSI_CHARSET
              Font.Color = 427007
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelDocumento: TLabel
              Left = 0
              Top = 0
              Width = 414
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Documento'
              Color = 427007
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object LabelAzioni: TLabel
              Left = 417
              Top = 0
              Width = 158
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Azioni'
              Color = 427007
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object LabelAzioneMagazzino: TLabel
              Left = 422
              Top = 18
              Width = 52
              Height = 12
              Caption = 'Magazzino'
              Font.Charset = ANSI_CHARSET
              Font.Color = 427007
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelAzioneCantiere: TLabel
              Left = 422
              Top = 37
              Width = 43
              Height = 12
              Caption = 'Cantiere'
              Font.Charset = ANSI_CHARSET
              Font.Color = 427007
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelNumReg: TLabel
              Left = 132
              Top = 18
              Width = 51
              Height = 15
              AutoSize = False
              Caption = 'N'#176
              Font.Charset = ANSI_CHARSET
              Font.Color = 427007
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelCantiere: TLabel
              Left = 2
              Top = 37
              Width = 92
              Height = 12
              Caption = 'Cantiere/Impianto'
              Font.Charset = ANSI_CHARSET
              Font.Color = 427007
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object BitBtnPratica1: TSpeedButtonRollOver
              Left = 395
              Top = 38
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                CE0B0000424DCE0B0000000000003600000028000000460000000E0000000100
                180000000000980B0000120B0000120B00000000000000000000E9E9E9E9E9E9
                E9E9E9E3E5E6BDC9CCA5B5B999A9AD99A9ADA5B5B9BDC9CCE4E5E6E9E9E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E7E8E8D9DEDFD1D7D8CDD3D4CDD3D4D1D7D8DA
                DEDFE7E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E6E6E7C7CED0ACB8BC
                9AA9AD9AA9ADACB8BCC7CED0E6E7E7E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
                E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0DDDDE7E9E9E9E9E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0
                DDDDE7E9E9E9E9E9E9E9E9E90000E9E9E9E9E9E9C8D1D39EADB1A5B5B8BFCFD2
                D2E2E5CFDFE2BCCBCFA7B6BA9EADB1C8D1D3E9E9E9E9E9E9E9E9E9E9E9E9DDE1
                E1CFD4D5D1D7D8DAE0E1E1E7E8E0E6E7D9DFE0D2D7D9CFD4D5DDE1E1E9E9E9E9
                E9E9E9E9E9E9E9E9CFD4D7A0AEB2ABB7BCD1D7DCECEEF5E8EBF1CCD3D8ADB9BE
                A0AEB2CFD4D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795A3B28E9ABC787FDC686A
                F56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795
                A3B28E9ABC787FDC686AF56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9
                0000E9E9E9C9D2D49EADB1C4D2D6DCEAEDDEECEFDEECEFDEECEFDEECEFDBE9EC
                C0CED29DACB0C9D2D4E9E9E9E9E9E9DEE1E2CFD4D5DCE1E2E4E9EAE5EAEBE5EA
                EBE5EAEBE5EAEBE4E9EADBE0E1CED4D5DEE1E2E9E9E9E9E9E9CCD1D89FADB2CB
                D1DFE8E8FDEAEAFFEAEAFFEAEAFFEAEAFFE7E7FCC6CDDB9EACB1CCD1D8E9E9E9
                E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF7171FF7171FF7373FC8389
                DB96A5B1AFB4D8E9E9E9E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF71
                71FF7171FF7373FC8389DB96A5B1AFB4D8E9E9E90000E4E5E69FADB1C6D4D7E1
                EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1C3D1D49EADB1E4E5E6
                E7E8E8CFD4D5DDE2E3E6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EB
                ECDCE1E2CFD4D5E7E8E8E4E5E79EACB3C4C9E0DDDDFFDDDDFFDDDDFFDDDDFFDD
                DDFFDDDDFFDDDDFFDDDDFFC0C7DC9EACB2E4E5E7DFDFE797A5B38A90E08181FF
                8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B91DC97A5B2DFDFE7DFDF
                E797A5B38A90E08181FF8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B
                91DC97A5B2DFDFE70000C1CACDABBABDE3EEF0E5F0F2E5F0F2E5F0F2E5F0F2E5
                F0F2E5F0F2E5F0F2E5F0F2E2EDF0A7B5B9C1CACDDBDEDFD3D9DAE7EBEBE8EBEC
                E8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE7EAEBD2D7D8DBDEDFBCC2
                D0A6B2C0CFCFFDD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFCE
                CFFCA3AFBBBBC2D0ABB3D097A2C09091FD9090FF9090FF9090FF9090FF9090FF
                9090FF9090FF9090FF9091FC97A4BBABB2D0ABB3D097A2C09091FD9090FF9090
                FF9090FF9090FF9090FF9090FF9090FF9090FF9091FC97A4BBABB2D00000A8B6
                BACBD6D9E9F2F42122FD2122FDE9F2F40000FF0000FFE9F2F40000FF0000FFE9
                F2F4C5D0D3A8B6BAD2D7D8DFE2E3E9ECEDE0E3E4E0E3E4E9ECEDDEE1E2DEE1E2
                E9ECEDDEE1E2DEE1E2E9ECEDDCE0E1D2D7D8A3AEBCB3B8E0C2C2FF1B1BFF1B1B
                FFC2C2FF0000FF0000FFC2C2FF0000FF0000FFC2C2FFAFB6D9A3AEBC9DA9BC9E
                A4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1FF0000FF0000FFA1A1FF
                9DA4D99DA9BC9DA9BC9EA4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1
                FF0000FF0000FFA1A1FF9DA4D99DA9BC000099A8ACE4EDEFECF5F62123FE2123
                FEECF5F60000FF0000FFECF5F60000FF0000FFECF5F6E2ECED99A8ACCDD2D4E7
                EAEBEAEDEEE1E4E4E1E4E4EAEDEEDFE2E3DFE2E3EAEDEEDFE2E3DFE2E3EAEDEE
                E7EAEACDD2D499A8ACB1B3F7B4B4FF1919FF1919FFB4B4FF0000FF0000FFB4B4
                FF0000FF0000FFB4B4FFB1B3F599A8AC99A8ACAEAFF7B0B0FF1919FF1919FFB0
                B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAFF599A8AC99A8ACAEAFF7
                B0B0FF1919FF1919FFB0B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAF
                F599A8AC000099A8ACEBF2F3F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7
                F8F0F7F8F0F7F8F0F7F8E4ECEE99A8ACCDD2D4EAECECEBEEEEEBEEEEEBEEEEEB
                EEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEE7EAEBCDD2D499A8ACA6A7FA
                A7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA5A7
                F499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
                C0FFC0C0FFC0C0FFBBBDF499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FF
                C0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFBBBDF499A8AC0000AAB7BBD2DBDD
                F4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FACDD7
                D9AAB7BBD3D7D9E1E4E5EDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFED
                EFEFEDEFEFEDEFEFDFE3E3D3D7D99CA8BC999FE09999FF9999FF9999FF9999FF
                9999FF9999FF9999FF9999FF9999FF9999FF999FDC9CA8BCA5B1BCBCC1E0D0D0
                FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFB9BFDCA5
                B1BCA5B1BCBCC1E0D0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FF
                D0D0FFD0D0FFB9BFDCA5B1BC0000C5CDD0AFBBBEF6F9F9F8FBFBF8FBFBF8FBFB
                F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF5F8F9AEBABDC5CDD0DCDFE0D5D9DAEEEF
                EFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEDEEEFD4D9DADC
                DFE0AAB2D096A2BF8C8DFD8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF
                8C8CFF8C8DFC96A2BEAAB2D0BFC7D0A9B5BFDEDFFDE0E0FFE0E0FFE0E0FFE0E0
                FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0BFC7D0A9B5BFDEDFFDE0
                E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0
                0000E5E6E6A0AEB2DAE0E2FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
                FBFDFDD4DBDDA0AEB2E5E6E6E8E8E8D0D4D6E4E6E7EFF0F0EFF0F0EFF0F0EFF0
                F0EFF0F0EFF0F0EFF0F0EFF0F0E2E4E5D0D4D6E8E8E8DEDFE697A5B2878CE37E
                7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF898FDE97A5B2DEDFE6
                E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEF
                FFCDD3DE9FADB2E4E5E6E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEF
                EFFFEFEFFFEFEFFFEFEFFFCDD3DE9FADB2E4E5E60000E9E9E9D1D6D7A3B1B4DD
                E2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9
                E9E9E9E1E2E3D1D5D6E5E7E7F0F0F0F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0E4E6
                E6D0D4D6E1E2E3E9E9E9E9E9E9AFB5D795A2B47E83E47272FE7171FF7171FF71
                71FF7171FF7272FD7F85E196A4B2AFB5D7E9E9E9E9E9E9D1D6D7A3B1B4DDE2E4
                FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9E9E9
                E9D1D6D7A3B1B4DDE2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0
                AEB2D1D6D7E9E9E90000E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9
                FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9E1E2E3D0D5D6
                D7DBDCE5E7E7EEEFEFEFEFEFE3E6E6D5D9DAD0D4D6E1E2E3E9E9E9E9E9E9E9E9
                E9E9E9E9AFB5D796A4B38E99C37E83E47475F97474FA8085E0909BBF96A4B2AF
                B5D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9FAFA
                D9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0
                C3DDE2E4F7F9F9F9FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E90000E9E9
                E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E8E8E8DDE0E0D4D8D9CDD2D4CDD2D4
                D4D8D9DDE0E0E8E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DDDEE6A3AA
                D095A2BC99A8AC99A8AC95A2BCA3AAD0DDDEE6E9E9E9E9E9E9E9E9E9E9E9E9E9
                E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8
                BCC7CED0E5E6E6E9E9E9E9E9E9E9E9E90000}
              Margin = 6
              OnClick = BitBtnPratica1Click
            end
            object sbCreaIntervento1: TSpeedButtonRollOver
              Left = 621
              Top = 18
              Width = 41
              Height = 30
              Cursor = crHandPoint
              Hint = 'Trasforma la chiamata o l'#39'appuntamento in intervento'
              Glyph.Data = {
                66480000424D66480000000000003600000028000000CD0000001E0000000100
                18000000000030480000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C4BB7893844A6C
                591C442D0D341D0C311B1A3B2747605276867CB3BBB6FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF29AA5FFFFFFF29AA5F29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F3F1E4E9E6DBE2DED1DAD5CF
                D6D2CED6D1D1D8D4DADFDDE3E7E5F0F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F1
                D8FFFFFFD3F1D8D3F1D8D3F1D8D3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B
                1A3B2747605276867CB3BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29
                AA5F29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B1A3B274760
                5276867CB3BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29AA5F29AA5F
                29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B1A3B2747605276867CB3
                BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29AA5F29AA5F29AA5F29AA
                5F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F5F389A695215436
                1145271042250F3F230F3C210E381F0D351E0C321C0B2E1A0B2B180A28161833
                24849089F0F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDE8EDEAD2DDD7CFDAD4CFD9
                D3CFD9D3CFD8D3CFD7D2CFD7D2CED6D2CED5D1CED5D1CED4D0D1D6D3E7E9E8FC
                FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF1F5F389A6952154361145271042250F3F230F
                3C210E381F0D351E0C321C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFF1F5F389A6952154361145271042250F3F230F3C210E381F
                0D351E0C321C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFF
                FFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF1F5F389A6952154361145271042250F3F230F3C210E381F0D351E0C32
                1C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF
                29AA5FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF23
                5F3C14512D134D2B18602F208337269F3E28B54126BC4024BB3D1FB238199731
                1274270D461E0A2917092615173022B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF2FC26C2FC26CFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29
                AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F4F2D3DFD8D0DCD5
                D0DBD5D1DFD5D2E6D7D4ECD8D4F0D9D4F2D9D3F1D8D2F0D7D1EAD6D0E3D4CFDA
                D2CED4D1CED4D0D1D5D3F0F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D7D1
                F1D7FFFFFFFFFFFFFFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFD3F1D8FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B2459
                4943737F5E89AB759DCE7EA5DA82A8DB7DA3D0698EAD4B6F7C23453D0A291709
                2615173022B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFF
                FFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B1A5246245D762C
                669D306DBA2F6DC32C6CC22666B71F5A97174A6D0F36380A2917092615173022
                B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFFFFFFFFFFFF
                FFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B1851451E597423609A2565B6
                2365BF2063BE1B5EB316549511466B0C34370A2917092615173022B2BAB5FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFFFFFFFFFFFFFFFFFFFF29
                AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF6E9B81165B331557311E6F3831A64937C14F34C04C31BF492EBE472BBD4427
                BC4125BB3E21BA3B1EB9391AB83515952C0D4D1D09271609241465746BFFFFFF
                FFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFF
                FFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EBE6D0
                DED6D0DDD6D2E2D7D6EDDBD7F3DCD6F2DBD6F2DBD5F2DAD5F2DAD4F2D9D3F1D8
                D3F1D8D2F1D7D1F1D7D0EAD5CFDBD2CED4D0CED3D0E0E3E1FFFFFFFFFFFFFFFF
                FFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFF
                FFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B33155731
                2964585586AA6E9AD5719CD6749ED777A0D87BA3D97DA5D981A7DA84A9DB87AC
                DC8AAEDD6D8FAD2B4C4809271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2F
                C26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF
                29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B33155731205E553670
                A23F79C83C77C73974C63672C53371C4306EC32D6CC2296AC12768C12365C01B
                56950F384009271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B331557311E5C542F6B9F3471C431
                6FC32D6DC22A6BC22869C12466C02164BF1D61BE1A5FBD165DBC1250920C363F
                09271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF29AA5F00FFFFFFFFFFFF
                FFFFFFFFFFFF70A0841862371A653730974942C4593FC3553CC25338C15035C0
                4D32BF4A2FBE472CBD4528BC4226BB3F22BA3C1FB9391BB83618B7341179260A
                301709251465756CFFFFFFFFFFFFFFFFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF
                29AA5F29AA5FFFFFFF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFF
                FFE2ECE6D1E0D7D1E0D7D6EADBD9F3DED9F3DDD8F3DDD7F3DCD7F2DBD6F2DBD5
                F2DAD5F2DAD4F2D9D4F1D9D3F1D8D2F1D7D1F1D7D1F1D6CFE4D4CED6D1CED3D0
                E0E3E1FFFFFFFFFFFFFFFFFFD1F1D7D1F1D7D1F1D7FFFFFFFFFFFFD3F1D8D3F1
                D8FFFFFFD3F1D8FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFF70A08418
                62371B623E3F7A8C6493D26795D36A97D46D99D5709BD5739ED776A0D77AA2D8
                7DA4D980A7DA83A9DB87ABDC89ADDD8DAFDE56768812302209251465756CFFFF
                FFFFFFFFFFFFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29
                AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF70A0841862371A613E
                3471884A80CB467ECA437CC94079C83D77C73975C63773C53471C5306FC32E6D
                C32A6AC22768C12466C02164BF164A750B2B2009251465756CFFFFFFFFFFFFFF
                FFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29AA5FFFFFFF
                FFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF70A0841862371A613E2F6D873F79
                C83C76C63974C63572C53270C42E6DC32B6BC22969C12567C02265BF1E62BE1B
                60BD175DBC155BBB0F45730A2B2009251465756CFFFFFFFFFFFFFFFFFF2FC26C
                2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29AA5FFFFFFFFFFFFF29AA
                5F00FFFFFFFFFFFFFFFFFF71A5861A6A3B1C6D3C43B55A49C65E46C65C43C559
                40C4563DC35439C15036C14E33BF4B30BF482DBE4629BD4226BC4023BB3D20BA
                3A1CB83719B834159D2D0B301709251565756CFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF29AA5F29AA5F29AA5FFFFFFF
                FFFFFFFFFFFFE2EDE7D1E1D8D2E2D8D9F0DEDBF4DFDAF4DED9F3DED9F3DDD8F3
                DDD7F3DCD7F3DCD6F2DBD6F2DAD5F2DAD4F2D9D4F2D9D3F1D8D2F1D8D2F1D7D1
                F1D6D0EBD5CED6D1CED3D0E0E3E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFD3F1D8D3F1D8D3F1D8FFFFFFFFFFFFFFFF
                FF71A5861A6A3B1D69424D84B25D8ED06090D16392D26694D36A97D46C99D46F
                9BD5739DD6759FD779A2D87CA3D97FA6DA82A8DB86AADC88ACDD8CAFDE7698B9
                12302209251565756CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF29AA5FFFFFFFFFFFFF29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFF71A5861A
                6A3B1D69424880B25085CD4D83CC4A81CB477ECA447CC9417AC83E78C73A76C6
                3874C63572C5316FC42F6DC32B6BC22869C12567C02265BF1B59A00B2B200925
                1565756CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFF
                FFFFFFFFFF29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFF71A5861A6A3B1C6942
                417BAF467EC9437CC9407AC83C77C73A75C63672C53371C42F6EC32C6CC2296A
                C12667C02365BF1F63BE1C61BD185EBC165CBB11519D0A2B2009251565756CFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF
                29AA5F29AA5F29AA5F00FFFFFFFFFFFFB9D4C41B713F1F734049B86050C9654E
                C8634AC75F47C65D44C55A41C4573EC3553AC25137C14F34C04B31BF492EBE47
                2ABD4327BC4124BB3D21BA3B1DB9381AB835169D2E0B3218092615B2BBB6FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF1F6F3D1E3D9D2E3D9DBF1DFDCF4E0DCF4E0DBF4DF
                DAF4DFDAF3DED9F3DDD8F3DDD8F3DCD7F3DCD6F2DBD6F2DBD5F2DAD4F2D9D4F2
                D9D3F1D8D3F1D8D2F1D7D1F1D7D0EBD5CED6D1CED4D0F0F1F0FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB9D4C41B713F1E6F454781B25689CE588BCF5C8DD05F8FD06292
                D26594D26996D36B98D46F9BD5729DD6749ED778A1D87BA3D97EA5DA81A7DA85
                AADC87ACDC8BAEDD7597B9123223092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFB9D4C41B713F1F70464F86B4578ACF5488CE5185CD4E83CC4B82CB487FCA45
                7DC9427BC83F79C83B76C73974C63672C53270C4306EC32C6CC2296AC12667C0
                2365C01C59A00B2D21092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D4C41B
                713F1E70464781B24E83CC4B81CB477ECA447CC9417AC83D78C73B76C63773C5
                3471C4306FC32D6DC22A6BC22768C02466C02063BE1D61BE195FBD165DBC1252
                9D0A2D21092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFF2F7F42B814F1D764240A4
                5A58CB6C55CA6951C9664FC8634BC76048C65E45C55B42C4583FC35574D384A8
                E4B252C96732BF4A2FBE472BBD4428BC4225BB3E22BA3C1EB9391BB836127B28
                0A2B18193525F1F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDD4E6DCD2E4D9D9EDDEDEF5E2DD
                F4E1DCF4E0DCF4E0DBF4DFDAF4DFDAF3DED9F3DED9F3DDE4F7E7ECF9EEDDF4E1
                D6F2DBD5F2DAD5F2DAD4F2D9D3F1D8D3F1D8D2F1D7D1F1D7D0E5D4CED5D1D1D7
                D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF2F7F42B814F1D7642377B8E4E84CC5186CD5588CE
                578ACE5B8DCF5E8FD06191D16493D26896D3A6C1E4EBF5F48BAEDD739ED777A0
                D87AA2D87DA5D980A7DA84A9DB87ABDC8AAEDD5476870A2B18193525F1F2F1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF2F7F42B814F1D76424383925E8FD15C8DD0588ACF5588CE5286
                CD4F84CC4C82CB4980CA467ECA8DB1DCE1F0EC5F90D13975C63773C53371C430
                6FC32D6CC22A6AC22768C12466C0174C760A2B18193525F1F2F1FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFF2F7F42B814F1D76423E80905588CE5286CD4E84CC4C82CB487FCA457DC942
                7BC83E78C73C76C687ADDAE1F0EC5689CD2E6DC32B6BC22869C12567C02164BF
                1E62BE1A5FBD175DBC1147740A2B18193525F1F2F1FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF8FC0A4
                1E7D452E8F505FCD725DCD7059CB6C56CA6A52C96750C8644CC76149C65E46C6
                5C42C4598BDB98AFE6B8A2E2AD6DD17F33BF4B30BF482CBD4529BD4226BB3F23
                BB3D1FB9391CB8370E50200B2B1885948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F3EDD2E5DAD5E9
                DCDFF5E3DFF5E2DEF5E2DDF4E1DCF4E1DCF4E0DBF4DFDBF4DFDAF4DEDBF4DFF6
                FCF7ECF9EEEBF9EEE3F6E6D6F2DBD6F2DAD5F2DAD4F2D9D4F1D9D3F1D8D2F1D7
                D2F1D7CFDCD2CED5D1E7EAE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC0A41E7D45277B65477FCA4B
                81CB4D83CC5085CC5488CD578ACE5A8CCF5D8ED06091D16392D2C0D5EAF4FCF5
                E4F0F2A6C1E4739DD676A0D779A2D87DA4D97FA6DA83A9DB86AADC89ADDD2B4E
                4A0B2B1885948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC0A41E7D453081686594D36392D25F8FD1
                5C8DD0598BCF5689CE5387CD5085CD4D83CC4A80CBB0CAE4ECF9EED8EAEB85AB
                DA3A76C63874C63471C5316FC42E6DC32B6BC22768C12567C0113C430B2B1885
                948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF8FC0A41E7D452E7F675D8ED05A8CCF5689CE5387CD4F84
                CC4D82CB4980CA467EC9437CC93F79C8ACC8E3ECF9EED7E9EB7EA6D82F6EC32C
                6CC22969C12667C02265BF1F63BE1B60BD185EBC0E3A420B2B1885948BFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFF2E8C551F814855BB6C63CF7560CE735ECD715ACC6D57CB6B53CA67
                50C9654DC8624AC75F47C65D8CDB99AFE6B8AFE6B8AFE6B890DC9D4CC76031BF
                492DBE462ABD4326BC4024BB3D20BA3A1997310C301B1A3927FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D5E8DDD2E6DADDF1E2E0F5E3DFF5E3DFF5E3DEF5E2DDF5E1DDF4E1DCF4E0DBF4
                E0DBF4DFE7F8EAF8FDF8ECF9EEECF9EEECF9EEE9F9ECDBF4E0D6F2DBD5F2DAD4
                F2D9D4F2D9D3F1D8D2F1D8D1EAD6CED6D1D1D7D4FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F81
                48387BA7437CC9467EC94A81CA4D83CB4F85CC5387CD5689CE598BCF5C8DD060
                90D1BED3EAF4FCF5F4FCF5F4FCF5CEDFED86ABDC759FD778A1D87CA3D97EA5DA
                82A8DB85AADC698EAD0C301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F81485992B169
                96D46694D36492D26090D15D8ED05A8CCF578ACF5387CE5185CD4E83CCB1CCE4
                ECF9EEECF9EEECF9EEBBD3E65689CE3974C63572C53270C42F6DC32C6CC22869
                C11F5A970C301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F8148538EAF6190D15E8ED0
                5B8CD0578ACE5488CE5085CC4E83CC4A80CB477ECA447CC9AEC9E3ECF9EEECF9
                EEECF9EEB8D1E54D83CB2D6DC2296AC12768C02365BF2063BE1C61BD1654950C
                301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00BBDBC821894C2E94556BD17C68D07A64CF7661CE745E
                CD715ECD715FCD725ECD715DCD715DCD705DCD709BDFA6AFE6B7AFE6B7AFE6B7
                AFE6B7A8E4B270D28132BF4A2EBE472BBD4427BC4125BB3E21BA3B104D220C31
                1BB3BEB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF1F8F4D3E7DBD5EADDE1F6E5E1F6E4E0F5E4DFF5E3DFF5E3DFF5E3
                DFF5E3DFF5E3DFF5E2DFF5E3DBF4E1F2FBF4ECF9EEECF9EEECF9EEECF9EEEBF9
                EDE3F6E7D6F2DBD5F2DAD5F2DAD4F2D9D3F1D8D3F1D8CFDBD3CED6D1F0F2F1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                BBDBC821894C2583613C77C73F79C7437CC8457EC94980CA4F84CC5689CE5D8E
                D06291D26896D46F9BD5D2E2EEF3FBF4F3FBF4F3FBF4F3FBF4ECF5F3AAC4E574
                9ED777A0D87BA3D97DA5D981A7DA84A9DB234A400C311BB3BEB8FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBDBC82189
                4C2F8A65709BD66E99D56A97D46795D36593D26493D26594D36694D36593D365
                94D36795D3C9DEE8ECF9EEECF9EEECF9EEECF9EEE1F1EC89AEDB3975C63672C5
                3371C4306EC32D6CC2296AC1123E3B0C311BB3BEB8FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBDBC821894C2E896468
                96D36594D36191D15F8FD15C8DD05B8CD05C8DD05C8ED05C8ED05C8DD05E8ED0
                C7DDE8ECF9EEECF9EEECF9EEECF9EEE0F0EB83AAD92E6DC32A6BC22869C12466
                C02164BF1D61BE0F3C3A0C311BB3BEB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0084C19D228D4E49AE686FD2806CD1
                7D69D07A7DD68C98DFA4A1E2ADA4E2AEA6E3B0A7E3B1A9E4B3ADE5B6AFE6B7AF
                E6B7AEE6B7AEE6B7AFE6B7AFE6B7AFE6B78CDB9A42C4582FBE472CBD4528BC42
                26BB3F18792D0D351E778B80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFE6F2EBD3E8DCDBEFE1E2F6E6E2F6E5E1F6E4E6
                F7E9ECF9EDECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDEBF9EDEAF8EC
                EAF8ECEBF9EDEBF9EDECF9EEE9F8EBD9F3DED5F2DAD5F2DAD4F2D9D4F1D9D1E4
                D5CFD7D2E3E8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF84C19D228D4E2B7E883874C53B77C63E79C76997D3B3CCE7
                D0E1EDD8E7EFDFECF1E4F0F2E8F3F3F0F9F3F2FBF4F2FBF4F1FBF3F1FBF3F2FB
                F4F2FBF4F3FBF4CADCEC7EA6DA76A0D77AA2D87DA4D980A7DA48707D0D351E77
                8B80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF84C19D228D4E4C9592759ED7719CD66E9AD589ADDCBED4E8D1E4EAD7E8
                ECDBECECDFEEEDE2F1EDE9F7EDEBF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDEC
                F9EEB6CFE44A81CB3773C53471C5306FC32E6DC31C51700D351E778B80FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84C1
                9D228D4E4892916D99D56996D46694D382A9DBBBD2E7D0E2EAD5E7EBDAEBECDD
                EEECE1F0ECE9F7EDEBF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDECF9EEB2CDE3
                407AC82B6BC22969C12567C02265BF164D6E0D351E778B80FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF005BAF7E239151
                62C37973D38370D3816CD17EADE5B6AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6
                B8AFE6B7AEE6B7AEE6B7AEE5B7AEE5B7AEE6B7AEE6B7AFE6B7AFE6B89EE1A952
                C96630BF482DBE4629BD42209C380E39204A6856FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEEFE5D3E9DCE0F3E4E3F6
                E6E2F6E6E2F6E5EDF9EFECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEA
                F8EDE9F8ECE9F8EBE9F8EBE9F8ECEAF8EDECF9EEECF9EEEAF9EDDDF4E1D6F2DA
                D5F2DAD4F2D9D2EBD7CFD7D2DBE1DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5BAF7E2391512C77A63472C43773C53A
                76C6EEF7F3F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F3FBF4F2FBF3F1FBF3
                F0FAF2F0FAF2F1FBF3F2FBF3F3FBF4F4FBF5DFECF18CAEDD759FD779A2D87CA3
                D9638BAC0E39204A6856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF5BAF7E239151659EB678A1D8769FD7729CD6E9F6EE
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8
                EBE9F8ECEAF8EDECF9EEECF9EED1E5E95E8FD03874C63572C5316FC427619A0E
                39204A6856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF5BAF7E2391515F9AB5719CD66E9AD56A97D4E8F5EEECF9EEECF9
                EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8EBE9F8ECEA
                F8EDECF9EEECF9EECFE3E95589CD2C6CC2296AC12667C01E5B970E39204A6856
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00339F6024955375D28678D58874D48471D382AFE6B8AFE6B8AFE6B8AFE6B8
                AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AEE5B7ADE5B6ADE5B6AEE5B7AEE6B7AFE6
                B7AFE6B8AFE6B8A7E3B276D58631BF492EBE4728B5410F3E221D462EFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6ECDF
                D3EADDE3F6E7E4F7E7E3F6E6E3F6E6ECF9EEECF9EEECF9EEECF9EEECF9EEECF9
                EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEEC
                F9EEEBF9EEE4F7E8D6F2DBD5F2DAD4F0D9CFD8D3D2DAD5FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF339F602495532C6F
                BB306EC33371C43673C5F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F2
                FBF4F1FBF3F0FAF1EEFAF0EEFAF0F0FAF1F1FBF3F2FBF4F4FBF5F4FCF5EBF5F4
                B1CAE7749ED778A1D8749DCE0F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF339F6024955379A5D17DA4D979
                A2D876A0D8ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8EC
                E9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE1F0EC92B5DD3974
                C63672C5306DBA0F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF339F6024955373A0D0759FD7729CD66F9AD5
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8
                EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE0EFEC8CB1DB2D6DC22A6BC226
                66B60F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00269D57259A567ED78D7BD68B79D58875D485AFE6B8AF
                E6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AEE5B7ADE5B6ADE5B6ADE5B6
                ADE5B6AEE5B7AEE6B7AFE6B7AFE6B8AFE6B897DFA435C04D32BF4A2FBE471041
                240F3E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFD4EBDDD3EBDDE5F7E8E5F7E8E4F7E7E3F6E7ECF9EEECF9EEECF9EE
                ECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8
                EBEAF8EDECF9EEECF9EEECF9EEEAF8ECD7F2DBD6F2DBD5F2DACFD9D3CFD8D3FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                269D57259A56296AC12C6CC22F6EC33270C4F4FCF5F4FCF5F4FCF5F4FCF5F4FC
                F5F4FCF5F3FBF4F2FBF3F0FAF2EEFAF0EDF9EFEDF9EFEEFAF0F0FAF2F2FBF3F3
                FBF4F4FCF5F4FCF5D6E5EF719CD6739ED777A0D81041240F3E23FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF269D57259A
                5683A8DB80A7DB7EA5DA7AA2D9ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEC
                F9EEEAF8EDE9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8EBEAF8EDECF9EEECF9EE
                ECF9EEC7DCE83D77C73975C63773C51041240F3E23FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF269D57259A567CA4D979
                A2D876A0D7739DD6ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8ED
                E9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8EBEAF8EDECF9EEECF9EEECF9EEC5DB
                E73270C42E6DC32B6BC21041240F3E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0027A15A269E5883D8917FD78E7CD6
                8C7AD689AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AE
                E5B7ADE5B6ADE5B6AEE5B7AEE6B7AFE6B7AFE6B8AFE6B883D8923CC25339C150
                36C14E33BF4B114627104225FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFD4ECDED4ECDEE6F7E9E5F7E8E5F7E8E4F7E7EC
                F9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EA
                E7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE8F7EAD8F3DDD7F3DCD7F3DCD6F2
                DBCFDAD4CFD9D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF27A15A269E582567C02869C12B6BC22E6DC2F4FCF5F4FCF5
                F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F2FBF4F1FBF3F0FAF1EEFAF0EEFAF0F0FA
                F1F1FBF3F2FBF4F4FBF5F4FCF5B5CDE76A97D46C99D4709BD5739DD611462710
                4225FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF27A15A269E5888ACDD84A9DC81A7DB7FA5DAECF9EEECF9EEECF9EEECF9
                EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEB
                F9EDECF9EEECF9EEA4C1E1437CC9417AC83E78C73A76C6114627104225FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27A1
                5A269E5881A7DA7DA4D97AA2D977A0D8ECF9EEECF9EEECF9EEECF9EEECF9EEEC
                F9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EE
                ECF9EE9FBEE03974C63672C53371C42F6EC3114627104225FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0035AB6627A25A
                81D69184D99280D88F7DD78DAAE5B4AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6
                B8AFE6B7AEE6B7AEE6B7AEE5B7AEE5B7AEE6B7AEE6B7AFE6B7AFE6B87FD78E43
                C55941C4573DC3543AC25134BA4C124A29205335FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7EEE0D4ECDEE6F7E9E6F7
                E9E6F7E9E5F7E8EDFAEFECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEA
                F8EDE9F8ECE9F8EBE9F8EBE9F8ECEAF8EDECF9EEECF9EEE6F8EAD9F3DED9F3DD
                D8F3DDD8F3DCD6F1DBD0DBD4D2DCD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF35AB6627A25A2168B92466BF2769C02A
                6BC1DDEBF0F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F3FBF4F2FBF3F1FBF3
                F0FAF2F0FAF2F1FBF3F2FBF3F3FBF4F4FBF5A6C2E46292D26694D36996D36B98
                D46996CA124A29205335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF35AB6627A25A85ADD688ACDD85AADC82A8DBE1F0ED
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8
                EBE9F8ECEAF8EDECF9EEECF9EE9BBBDF4A81CB487FCA447CC9427BC83B75BD12
                4A29205335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF35AB6627A25A7FA9D482A8DB7EA5DA7BA3D9E0EFEDECF9EEECF9
                EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8EBE9F8ECEA
                F8EDECF9EEECF9EE95B7DE407AC83D78C73A75C63773C5316FBA124A29205335
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF005FBF8628A75D72CD8988DA9685D99381D8908CDB999FE1AAA2E2ADA1E2AC
                A2E2ADA2E2ACA1E2ACA2E2ADADE5B6AFE6B7AEE6B7AEE6B7AFE6B7AFE6B7A8E4
                B275D4854BC76048C65E44C55A42C4583EC35531A649134E2C4D785FFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF2E7
                D4EDDFE3F5E7E7F8EAE7F7E9E6F7E9E8F8EBEDF9EFEDFAEFEDF9EFEDFAEFEDFA
                EFEDF9EEECF9EEEAF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDECF9EEE5F7E8DB
                F4DFDAF4DFDAF3DED9F3DED8F3DDD6EDDBD0DCD5DCE4DFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D2072
                A42064BE2366BF2668C0477FC99BBAE0B3CCE6B4CDE6BDD3E9BFD4E9C4D7EACA
                DCEBEDF7F3F2FBF4F1FBF3F1FBF3F2FBF4F2FBF4E7F2F28AAEDD5B8DCF5F8FD0
                6191D16594D26896D35485AA134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D76ADBE8CAFDE89
                ADDD86AADC94B4E0BFD4E9CADDEAC9DDEACCE0EBCCE0EBCEE0EAD0E2EAE7F6EC
                EBF9EDEAF8ECEAF8ECEBF9EDEBF9EDE1F0EC87ACDB5286CD4F84CC4B82CB4980
                CA457DC93670A2134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D70AABC86AADC83A8DB7FA6DA
                8EB1DEBCD2E8C7DCE9C7DBE9CADEEACADEEACBDFE9CDE1EAE7F6ECEBF9EDEAF8
                ECEAF8ECEBF9EDEBF9EDE0EFEC81A8D9487FCA457DC9417AC83E78C73B76C62F
                6B9F134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF0088D1A629AA5F5CC17C8CDB9A88DA9686D99482D8917F
                D78E7CD68C79D58876D48672D3836FD2806DD17E9BDFA5AFE6B7AFE6B7AFE6B7
                AFE6B79FE1A96AD07B52C96750C8644CC76149C65E45C55B42C4592A8C421452
                2E7B9C89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFE7F6EDD4EEDFDEF3E5E8F8EBE7F8EAE7F7EAE6F7E9E5F7E8E5F7E8
                E4F7E7E4F6E7E3F6E6E2F6E6D5F3E2EDF9F1ECF9EEECF9EEECF9EEECF9EEEBF9
                EFE1F5E5DCF4E1DCF4E0DBF4DFDBF4DFDAF3DED9F3DED4E8D9D0DCD5E4EBE7FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                88D1A629AA5F21838C1C61BD1F63BE2265BF2667C02869C12B6BC22F6EC33170
                C33572C43874C53D78C6AFCAE5F3FBF4F3FBF4F3FBF4F3FBF4CEE0EC6B98D454
                88CD578ACE5A8CCF5E8FD06091D16493D23E758114522E7B9C89FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88D1A629AA
                5F5EAD9E91B2DF8DAFDE8AADDD87ABDC84A9DC81A7DB7EA5DA7BA3D977A0D875
                9ED7729DD6BFD5E7ECF9EEECF9EEECF9EEECF9EECEE1EA749ED7598BCF5689CE
                5387CD5085CD4C82CB4A80CB2D6A7D14522E7B9C89FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88D1A629AA5F5BAB9D8A
                ADDD86ABDC84A9DB80A6DA7DA4D97AA2D976A0D7739ED7709BD66D99D56A97D4
                BCD3E7ECF9EEECF9EEECF9EEECF9EECCE0E96B98D44F84CC4D82CB4980CA467E
                C9427BC83F79C828667B14522E7B9C89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BDE7CF2AAF613DB56B90DC9D8DDC
                9B89DA9787DA9583D89180D88F7DD78D7AD68977D58773D38370D3819ADFA6AF
                E6B8AFE6B8AFE6B894DEA061CE745ACC6D56CA6A53CA6750C8644DC8624AC75F
                46C65C1E6E39155730B6CABEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF2FAF5D4EFDFD8F0E1E9F8EBE8F8EBE7F8EAE7
                F8EAE6F7E9E6F7E9E5F7E8E4F7E7E4F7E7E3F6E6DBF4E6F8FDF9ECF9EEECF9EE
                ECF9EEE9F8EEE0F5E3DEF5E2DDF4E1DDF4E1DCF4E0DBF4E0DBF4DFDAF4DED2E2
                D7D0DDD6F0F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFBDE7CF2AAF61269D71185EBC1B60BD1E62BE2164BF2567C0
                2769C02A6BC12E6DC2306FC33472C43773C5A7C3E3F4FCF5F4FCF5F4FCF5AAC5
                E44F84CB4D83CB5085CC5387CD578ACE598BCF5D8ED06090D1246550155730B6
                CABEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBDE7CF2AAF613EAD7794B4E091B2DF8EB0DE8BAEDE88ACDD85AADC82A8
                DB7FA5DA7CA3D978A1D8769FD7BCD2E7ECF9EEECF9EEECF9EEB5CDE56795D360
                90D15C8DD05A8CCF5689CE5387CE5185CD4D83CC20614F155730B6CABEFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE7
                CF2AAF613DAD778EB0DE8BAEDE87ABDC85AADC81A7DA7EA5DA7BA3D977A0D874
                9ED7719CD66E9AD5B8D0E6ECF9EEECF9EEECF9EEB1CBE45E8FD0578ACE5387CD
                5085CC4D82CB4A80CB477ECA437CC91E604E155730B6CABEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF38B86E
                2BB0627AD29191DD9E8EDC9B8ADB9888DA9684D99281D8907ED78D7AD68A78D5
                8874D4849EE0A9AFE6B8A7E3B086D99564CF7661CE745ECD715BCC6E57CB6B54
                CA6850C9654EC8633EAD55175E3525653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7F1E2D5EFE0E4F6
                E9E9F8ECE8F8EBE8F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7E8E4F7E7E3F6E6F8
                FDF8ECF9EEF0FBF2E8F8EAE0F5E4DFF5E3DFF5E3DEF5E2DDF5E1DDF4E1DCF4E0
                DCF4E0D8EFDDD1DFD7D3E0D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38B86E2BB0621D72A5185EBC1A
                5FBD1D62BE2064BE2466BF2668C0296AC12D6DC2306EC33371C4ADC7E5F4FCF5
                D6E6EE78A2D8437CC8457EC94980CA4C82CB4F85CC5286CD5689CE588BCF4B82
                A9175E3525653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF38B86E2BB0627DB4C195B5E092B3E08FB1DF
                8CAFDE88ACDD86AADC83A8DB7FA6DA7DA4D979A2D8C2D8E9ECF9EED9EAEC98B7
                E06A97D46795D36492D26191D15D8ED05B8CD0578ACF5488CE437DA7175E3525
                653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF38B86E2BB06279B1C08FB1DF8CAFDE88ACDD86AADC82A8
                DB7FA6DA7CA4D978A1D8759FD7729CD6C0D5E8ECF9EED7E9EB92B4DE6191D15F
                8FD15B8CD0588ACF5488CE5186CD4E83CC4B81CB3C77A5175E3525653FFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFF96DBB32BB46446BD7396DEA292DD9F8FDC9C8BDB9988DA9685D993
                82D8917FD78E7BD68B79D58898DFA4ACE5B57DD78C6CD17D69D07A65CF7762CE
                755ECD715CCC6F58CB6C55CA6951C966277E431862378BAF9AFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EAF8F0D5F0E0DAF2E3EAF8ECE9F8ECE9F8EBE8F8EBE7F8EAE7F7E9E6F7E9E5F7
                E8E5F7E8E4F7E7EBF9EEECF9EEE5F7E8E2F6E5E1F6E4E0F5E4E0F5E3DFF5E3DE
                F5E2DEF5E2DDF4E1DCF4E0D4E5D9D1E0D7E8EFEBFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB4
                64269C79185EBC185EBC195FBC1D61BD1F63BE2366BF2667C02869C12C6CC22F
                6EC38CB0DCE5F1F25286CC3B77C63F79C7427BC8457EC9487FCA4B81CB4E84CC
                5186CD5588CE296E5E1862378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB46447B3829A
                B8E296B6E193B4E090B1DF8DAFDE89ADDD87ABDC84A9DC80A7DB7EA5DAB1CBE6
                E4F2ED85AADC719CD66E9AD56B97D46896D46593D26291D25E8FD15C8DD0588A
                CF286E5E1862378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB46446B28294B4E090B1DF
                8DAFDE89ADDD86ABDC83A8DB80A6DA7DA4D979A2D876A0D7AEC8E4E3F2ED7EA5
                D96996D46694D36292D26090D15C8DD0598BCF5588CE5286CD4E84CC266C5D18
                62378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFF2FBF63ABC702CB56569CB8896DEA393DD9F90
                DC9D8CDB9A89DA9786D99483D89180D88F7CD68C7AD68976D48673D3836FD280
                6CD17E69D07A66CF7863CF755FCD725DCD7059CB6C3CA1561A6A3B277145F1F5
                F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFDFEFDD7F2E2D5F0E0E1F5E7EAF8EDE9F8ECE9F8EBE8F8EB
                E7F8EAE7F7EAE6F7E9E6F7E9E5F7E8E4F7E7E4F6E7E3F6E6E2F6E6E2F6E5E1F6
                E4E0F5E4E0F5E3DFF5E3DFF5E2DEF5E2D8ECDDD1E1D8D4E2DAFCFDFDFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF2FBF63ABC702CB565208295185EBC185EBC185EBC1C61BD1E62BE2265
                BF2567C02769C02B6BC22E6DC23170C33472C43874C53A76C63E79C7417AC844
                7DC9477FCA4A81CA4D83CC387A8D1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FB
                F63ABC702CB5656BB7AB9AB9E297B6E194B4E091B2DF8EB0DE8AADDD88ACDD85
                AADC81A7DB7FA5DA7BA3D978A1D8759ED7729CD66E9AD56C98D56996D46594D3
                6392D25F8FD13F7F8F1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF63ABC702C
                B56568B4AA95B5E091B2DF8EB0DE8AADDD87ABDC84A9DB81A7DA7EA5DA7AA2D9
                77A0D8739ED7719CD66D99D56A97D46694D36392D26190D15D8ED05A8CCF5689
                CE3A7C8E1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFBDEAD02DB96733B9
                6985D89A97DFA494DEA091DD9E8DDC9B8ADB9887DA9584D99281D8907DD78D7A
                D68A77D58774D48470D3816DD27F6AD17B67D07964CF7660CE7352BC681F7742
                1B6E3DB7D1C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF6D5F1E1D6F1E1E7F7EBEA
                F9EDEAF8ECE9F8ECE8F8EBE8F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7E8E4F7E7
                E3F6E6E2F6E6E2F6E5E1F6E5E1F6E4E0F5E4DFF5E3DCF2E1D2E4D9D1E2D8F1F6
                F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD02DB9672BB06A1C6EAB185EBC185EBC
                185EBC1B60BD1D62BE2164BF2466BF2668C02A6BC12D6DC2306FC33371C43773
                C53A75C63D78C7407AC8437CC9467EC9417EB01E72481B6E3DB7D1C2FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFBDEAD02DB96733B66D88B9CB9BB9E298B7E195B5E091B2
                DF8FB1DF8BAEDE88ACDD86AADC82A8DB7FA6DA7CA3D979A2D8769FD7739DD76F
                9BD66D99D56A97D46694D3568CB71F73481B6E3DB7D1C2FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFBDEAD02DB96733B66D84B6C996B5E192B3DF8FB1DF8BAEDE88ACDD85
                AADC82A8DB7FA6DA7BA3D978A1D8749ED7729CD66E9AD56B98D46795D36493D2
                6191D15E8ED04F87B51F73481B6E3DB7D1C2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFF7DD6A12DBA6733BA6A86D89A98DFA495DEA192DD9F8EDC9B8BDB9988DA
                9685D99382D8917ED78D7BD68B78D58875D48571D3826ED27F6BD17C68D07A58
                BF6E217E461C754171A788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F7
                ECD5F1E1D6F1E1E7F7EBEAF9EDEAF8ECE9F8ECE8F8EBE8F8EBE7F8EAE7F7E9E6
                F7E9E5F7E8E5F7E8E4F7E7E3F6E7E3F6E6E2F6E5E1F6E5E1F6E4DEF2E2D3E5DA
                D2E3D9E3EDE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA672B
                B16B1C6EAB185EBC185EBC185EBC1A5FBD1D61BD2064BE2366BF2667C0296AC1
                2C6CC2306EC33270C43673C53975C53C77C73F79C73C7CAF20794B1C754171A7
                88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA6733B76E89BACB
                9CBAE399B7E196B6E192B3E090B1DF8CAFDE89ADDD87ABDC83A8DB80A7DB7DA4
                D97AA2D976A0D8749ED7709BD66E99D55D92B9227B4C1C754171A788FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA6733B76E84B7CA97B6E193B3
                E090B1DF8CAFDE89ADDD86AADC83A8DB80A6DA7CA4D979A2D8759FD7739DD66F
                9AD56C98D46896D36594D3558EB7217A4C1C754171A788FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFF7DD6A22DBB6833BA6A6BCD8A99DFA596DEA2
                93DD9F8FDC9C8CDB9A88DA9686D99482D8917FD78E7CD68C79D58876D48672D3
                836FD2804BAF6624854A1E7D4572AC8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFE5F7ECD5F1E1D6F1E1E1F5E8EBF9EDEAF8ECE9F8ECE9F8
                EBE8F8EBE7F8EAE7F7EAE6F7E9E5F7E8E5F7E8E4F7E7E4F6E7E3F6E6E2F6E6DB
                EFE0D3E7DBD2E5DAE3EEE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF7DD6A22DBB682BB16B218396185EBC185EBC185EBC195FBC1C61BD1F
                63BE2265BF2567C02869C12B6BC22F6EC33170C33572C43874C52F7D9021804F
                1E7D4572AC8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D
                D6A22DBB6833B76E6EB9AC9DBBE39AB8E297B6E193B4E091B2DF8DAFDE8AADDD
                87ABDC84A9DC81A7DB7EA5DA7BA3D977A0D8759ED74E92992482501E7D4572AC
                8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A22DBB68
                33B76E6AB7AB98B7E194B4E091B2DF8DAFDE8AADDD86ABDC84A9DB80A6DA7DA4
                D97AA2D976A0D7739ED7709BD66D99D5498E972381501E7D4572AC8AFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD7A22EBC692D
                B96748C0767ED49596DEA394DEA090DC9D8DDC9B89DA9787DA9583D89180D88F
                7DD78D7AD68962C379369D5B21874B20844A73B08DFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F7ECD5F2E1D5F1E1DAF2E4
                E5F6EAEAF8EDEAF8ECE9F8EBE8F8EBE7F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7
                E7E0F3E4D7EBDED3E7DBD2E6DBE3EFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD7A22EBC692DB967279F7B1D73A6185E
                BC185EBC185EBC1B60BD1E62BE2164BF2466BF2769C02A6BC12E6DC22C77A627
                856C21874B20844A73B08DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF7DD7A22EBC692DB96749B78581B9C39AB9E298B7E194
                B4E091B2DF8EB0DE8BAEDE88ACDD85AADC82A8DB7FA5DA659EB638917121874B
                20844A73B08DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF7DD7A22EBC692DB96748B6847DB6C195B5E092B3DF8EB0DE8BAEDE
                87ABDC85AADC81A7DA7EA5DA7BA3D977A0D85F9AB5368F7021874B20844A73B0
                8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFBDEBD13BC1722DBA672CB76640BB7161C8837BD2918ADA9A8EDC9B8A
                DB9882D6926DCA8353B97335A25E239251238F50309359B9DAC7FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
                FBF6D8F3E3D5F1E1D5F1E0D9F1E3DFF4E6E5F6E9E8F8EBE8F8EBE8F8EAE6F7E9
                E2F4E6DDF1E3D7ECDFD3E9DCD3E9DCD5E9DEF1F8F4FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC172
                2DBA672CB76627A37521878F1C72A51963B61A5FBD1D62BE2068B82473A52680
                8B258E68239251238F50309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC1722DBA672CB7
                6641B57C63B5A27EB5C18EB4D892B3E08FB1DF86AED670A8BC56A29936996D23
                9251238F50309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC1722DBA672CB76640B47C61
                B3A279B2C089B0D78CAFDE88ACDD80A9D46BA5BA52A09835996C239251238F50
                309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF696DEB43ABE712CB7662CB4642BB1
                622AAD6129AA5F28A75D28A45B27A159269D57259A56329E5F91C9A8F1F8F4FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFDFEFDEAF8F0D7F2E3D5F1E0D5F0E0D5EFE0D4EFDFD4
                EEDFD4EDDFD4EDDED4ECDED4EBDDD3EBDDD6EBDFE9F4EDFCFEFDFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF2FBF696DEB43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D
                28A45B27A159269D57259A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F2FBF696DEB43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D28A45B27A1
                59269D57259A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF696DE
                B43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D28A45B27A159269D5725
                9A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                BDEAD088D7A960C78B38B66D2AAE6129AB5F36AD685DBA8485CAA2BBE1CBFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF6E7F7
                EEE0F4E8D7F0E2D4EFDFD4EEDFD7EFE1DFF1E7E6F4ECF1F9F5FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38
                B66D2AAE6129AB5F36AD685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38B66D2AAE61
                29AB5F36AD685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38B66D2AAE6129AB5F36AD
                685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00}
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = SBCreaInterventoClick
            end
            object SBEspandiPratica1: TSpeedButtonRollOver
              Left = 378
              Top = 38
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiPratica1Click
            end
            object sbOpenTask1: TSpeedButtonRollOver
              Left = 582
              Top = 18
              Width = 32
              Height = 32
              Cursor = crHandPoint
              Hint = 'Crea o apre il Task associato alla chiamata'
              Glyph.Data = {
                363C0000424D363C0000000000003600000028000000A0000000200000000100
                180000000000003C0000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D8D5DCDAD4DCD9
                D3D6D5D2E2E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBEBEBEBEBEB
                EBE9E9E9F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C1BDCECBC3CECB
                C2C0BEB9CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C1BDCECBC3CECB
                C2C0BEB9CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D7D2E3E0D7E3DF
                D7D5D3CFDDDDDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCCCBB4B0A4B7B2A5BDB8ABBDB8
                ABB8B3A6B3AEA1B6B2A5B2AFA7BDBCB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5D5D5D5D6D6D6D9D9D9D9D9
                D9D7D7D7D4D4D4D6D6D6D5D5D5DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADACAAA4A0A4A7A3ADADA8B2ADA8
                B2ADA8ABB3AEA1B3AEA19A978D989691CDCDCCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADACAAA4A0A4A7A3ADADA8B2ADA8
                B2ADA8ABB3AEA1B3AEA19A978D989691CDCDCCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C4C2B6B09FBCB5A3C5BEABC5BE
                ABBEB7A4B7B09DBAB4A1ABA79BB1B0ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D3D3B5B0A3CFCBBDDAD6C8CBC6B8CAC5
                B7CAC6B8CAC5B7C4BFB2BDB8ABB7B2A5B3AEA1B6B3A8B8B7B3FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9D5D5D5E3E3E3E8E8E8E0E0E0E0E0
                E0E0E0E0E0E0E0DDDDDDD9D9D9D6D6D6D4D4D4D7D7D7DADADAFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5A39FA99895CFA09DD79591CB9490
                CA9491CB9490CA9C98C2A7A2B5A7A3ADB3AEA1A9A59994928CC8C7C6FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5A39FA99895CFA09DD79591CB9490
                CA9491CB9490CA9C98C2A7A2B5A7A3ADB3AEA1A9A59994928CC8C7C6FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCB9B2A0DED9C5EEE8D5D9D2BED7D0
                BCD7D2BED7D0BCCFC8B5C5BEABBCB5A3B7B09DB6B1A2ACAAA5FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE3E3E3BAB7B0CECABCDCD9CACECABBD1CDBFD3CE
                BFD4CFC0D4D0C0D4D0C0D2CEBFCFCBBDC9C4B7C0BBAEB8B3A6B3AEA1B0ADA4BE
                BDBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1D9D9D9E2E2E2E9E9E9E2E2E2E4E4E4E4E4
                E4E5E5E5E5E5E5E5E5E5E4E4E4E3E3E3DFDFDFDBDBDBD7D7D7D4D4D4D4D4D4DD
                DDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCDCDCDA9A59D9E9ACCA19FD89794CD9996D09B97
                D09B98D19B99D19B99D19A97D09895CF9390CAA4A0BAADA8ABB3AEA1A09C9098
                9692FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCDCDCDA9A59D9E9ACCA19FD89794CD9996D09B97
                D09B98D19B99D19B99D19A97D09895CF9390CAA4A0BAADA8ABB3AEA1A09C9098
                9692FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFDEDEDEB8B4AADDD7C4F1EDD7DDD7C2E1DCC8E4DD
                C8E6DEC9E6E0C9E6E0C9E3DDC8DED9C5D6CFBCC9C2B0BEB7A4B7B09DACA89AB2
                B0ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFD3D3D2B9B4A7DEDBCCD0CCBDDBD7CADAD5C6DAD5
                C5DAD5C5DAD5C5D9D4C5D9D5C5D9D5C5DAD5C6D6D1C3CDC8BBC7C2B5BEB9ACB6
                B1A4B5B1A4B4B2ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE8E8E8D7D7D7EAEAEAE3E3E3E9E9E9E8E8E8E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E8E8E8E6E6E6E1E1E1DEDEDEDADADAD6
                D6D6D5D5D5D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD3D3D3B7B7B6A39FB1A3A1DA9996CFA19ED8A09CD5A09C
                D4A09CD4A09CD49F9BD49F9CD49F9CD4A09CD59D99D39693CD9894C6A8A3B6B1
                ACA6B3AEA198948CC5C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD3D3D3B7B7B6A39FB1A3A1DA9996CFA19ED8A09CD5A09C
                D4A09CD4A09CD49F9BD49F9CD49F9CD4A09CD59D99D39693CD9894C6A8A3B6B1
                ACA6B3AEA198948CC5C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCECECDBFB8A6F4EFDAE0DAC5EFEAD7EEE7D2EEE7
                D0EEE7D0EEE7D0EDE6D0EDE7D0EDE7D0EEE7D2E8E1CDDCD5C2D3CCBAC6BFADBB
                B4A2B9B3A0ABA79EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFDDDDDDBDBBB5CCC8BADAD6C7D7D2C3E3DFD2DED9C9E0DB
                CCE3DED1E1DDCFDED9CBD8D3C4D5D0C1D2CDBED1CCBDD0CBBCD0CBBDCECABDCD
                C8BCC4C0B3BAB5A8B5B1A4CACAC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEEEEEEDCDCDCE1E1E1E8E8E8E6E6E6EDEDEDE9E9E9EBEB
                EBECECECECECECEAEAEAE7E7E7E5E5E5E4E4E4E3E3E3E3E3E3E3E3E3E2E2E2E1
                E1E1DDDDDDD8D8D8D5D5D5E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDDDDDDC4C4C4A8A59DA29FC8A09DD69E9AD3A6A4DEA39FD7A4A1
                DAAAA7DCAFABDAAAA6D79E9BD49C99D29A96CF9996CF9995CE9995CF9794CF96
                93CE9C99C2AFAAADB3AEA1A5A4A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDDDDDDC4C4C4A8A59DA29FC8A09DD69E9AD3A6A4DEA39FD7A4A1
                DAAAA7DCAFABDAAAA6D79E9BD49C99D29A96CF9996CF9995CE9995CF9794CF96
                93CE9C99C2AFAAADB3AEA1A5A4A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD8D8D8BAB6AFDAD5C1EEE8D3EAE3CDFBF5E3F4EDD6F7EF
                DAFBF4E1F8F2DEF4EDD9EBE4CFE7E0CBE3DCC6E1DAC5E0D9C4E0D9C5DDD7C5DC
                D5C4CFC9B7C1BAA7B9B3A0BEBDBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDEDEDEDBDBDBB7B2A6DCD9CAD6D2C3E0DBCBE7E3D6E3DFD0E9E5
                D9E9E5D9E8E5D9E8E5D9E7E3D7E1DDD0DAD5C7D3CEBFD0CBBCCFCABBCDC8BACB
                C6B8CAC6B9CBC7BAC4BFB2B8B4A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFEEEEEEEDEDEDD6D6D6E9E9E9E6E6E6EAEAEAEFEFEFECECECF0F0
                F0F0F0F0F0F0F0F0F0F0EFEFEFECECECE8E8E8E4E4E4E3E3E3E2E2E2E1E1E1E0
                E0E0E0E0E0E1E1E1DDDDDDD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFC6C6C6C2C1C1A8A3A7A19FD89D9AD3A4A1D9A8A6E1ABA8DCABA8
                E3ABA8E3AAA8E3AAA8E3A2A0E39B99DFA09CD69B97D09995CE9894CD9693CC95
                91CB9491CC9592CCA19DC0B3AEA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFC6C6C6C2C1C1A8A3A7A19FD89D9AD3A4A1D9A8A6E1ABA8DCABA8
                E3ABA8E3AAA8E3AAA8E3A2A0E39B99DFA09CD69B97D09995CE9894CD9693CC95
                91CB9491CC9592CCA19DC0B3AEA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDADADAD6D6D6BAB4A2F1EDD7E8E3CDF7EFD9FFFBE8FBF5E0FFFE
                EDFFFEEDFFFEEDFFFEEDFFFBEAF8F2E0EEE7D3E4DDC8E0D9C4DED7C2DCD5C1D9
                D2BED7D2BFD9D3C1CFC8B5BCB6A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFE1E1E1DDDDDDC6C5C2C5C1B3DDDACADAD5C6E2DDCEE8E4D8E9E5D9EAE6
                DBEAE6DBEAE6DBE9E6DAE9E6DAE9E5DAE8E5D9E7E3D6E1DDCFD8D3C4D1CCBDCF
                CABCCDC9BAC9C4B6CAC6B9BFBAADC3C2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF0F0F0EEEEEEE1E1E1DEDEDEEAEAEAE8E8E8ECECECEFEFEFF0F0F0F1F1
                F1F1F1F1F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFECECECE7E7E7E3E3E3E2
                E2E2E1E1E1DFDFDFE0E0E0DADADAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFCACACAC4C4C4ABA9A4A29FC0A2A0D8A09CD5A6A2DBAAA7E2ABA8E3ACA9
                E5ACA9E5ACA9E5B2B0E3AFADE3AAA6E4B1AFE2B3B0DFA7A4DB9E9BD49996CF98
                94CE9693CC9390C99491CCAFAAB49C9B97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFCACACAC4C4C4ABA9A4A29FC0A2A0D8A09CD5A6A2DBAAA7E2ABA8E3ACA9
                E5ACA9E5ACA9E5B2B0E3AFADE3AAA6E4B1AFE2B3B0DFA7A4DB9E9BD49996CF98
                94CE9693CC9390C99491CCAFAAB49C9B97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDD8D8D8C0BFBBD0CBB7F2EED7EEE7D2F9F2DDFFFCEBFFFEEDFFFF
                EFFFFFEFFFFFEFFFFFEEFFFFEEFFFEEEFFFEEDFFFBE8F8F2DEEBE4CFE1DAC5DE
                D7C4DCD6C1D6CFBBD7D2BFC8C1AEB6B5B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDDDDDDDB8B5ACD6D2C4D9D5C6E1DDCEE4DFD1E8E4D7EDEAE1EBE8
                DDEBE8DDEBE8DDE9E6DA87B484ACC7A5E9E6DAE9E5DAE8E5D9E5E1D4D5D0C1D1
                CCBDCFCBBCCEC9BAC8C3B5CCC7BAACABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFEEEEEEEEEEEED9D9D9E6E6E6E7E7E7EBEBEBEDEDEDEFEFEFF3F3F3F2F2
                F2F2F2F2F2F2F2F0F0F0CFCFCFDCDCDCF0F0F0F0F0F0F0F0F0EEEEEEE5E5E5E3
                E3E3E2E2E2E2E2E2DFDFDFE1E1E1D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C4C4C4C4C4C4ABA79C9D9AD49F9CD5A5A2DBAAA6DDAAA7E2AEACE9ACAA
                E6ACAAE6B4B1E5DBD8DC87B484ACC7A5CECBDEABA8E4AAA8E3A19EE19C99D299
                96CF9895CE9793CC938FC9A8A4C682817BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C4C4C4C4C4C4ABA79C9D9AD49F9CD5A5A2DBAAA6DDAAA7E2AEACE9ACAA
                E6ACAAE6B4B1E5DBD8DC87B484ACC7A5CECBDEABA8E4AAA8E3A19EE19C99D299
                96CF9895CE9793CC938FC9A8A4C682817BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD8D8D8D8D8D8B7B3A6E8E3CFEDE7D2F8F2DDFCF5E1FFFCEAFFFFF8FFFF
                F2FFFFF2FFFFF2FFFFEE78B874ADD3A3FFFFEEFFFEEEFFFEEDFEF8E6E7E0CBE1
                DAC5DED9C4DDD6C1D5CDBADAD3C19B9995FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDD5D5D4BAB6A8DEDBCCDAD6C6E5E0D3E5E1D4E9E6DAEFECE4ECE9
                DFECE9DFE4E5D86CA66C3C8F443D8F43BED0B5EAE6DCE9E6DAE8E5D9DCD7C7D9
                D4C4D5D0C1D1CCBDCCC7B9C6C2B5C1C1BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEEEAEAEAD8D8D8EAEAEAE8E8E8EDEDEDEEEEEEF0F0F0F4F4F4F2F2
                F2F2F2F2EFEFEFC6C6C6B7B7B7B6B6B6E2E2E2F1F1F1F0F0F0F0F0F0E8E8E8E7
                E7E7E5E5E5E3E3E3E1E1E1DEDEDEDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C5C5C5C4C4C4BABAB8A4A0B2A3A1DAA09DD5A4A0DFADA9DFABA9E4AFADEBADAB
                E8B4B2E7D7D8DA6CA66C3C8F443D8F43BED0B5C8C5E1ABA9E4AFADE3A19ED69F
                9BD49C99D29996CF9692CCA3A0C2999895FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C5C5C5C4C4C4BABAB8A4A0B2A3A1DAA09DD5A4A0DFADA9DFABA9E4AFADEBADAB
                E8B4B2E7D7D8DA6CA66C3C8F443D8F43BED0B5C8C5E1ABA9E4AFADE3A19ED69F
                9BD49C99D29996CF9692CCA3A0C2999895FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D9D9D9D8D8D8D0D0CFC1BBA7F4EFDAEEE8D2FEF7E4FEF8E6FFFFEEFFFFFCFFFF
                F5FFFFF5FCFEEB52A4520E841A108418C6E0BAFFFFF1FFFFEEFFFEEDF1EAD3ED
                E6CFE7E0CBE1DAC5DAD3BFD2CCBAB4B3B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDC2C0BDCAC6B8DBD8C9E0DBCDE6E2D5E7E3D6ECE9E0EEECE3EFEC
                E4DDE2D3559B593B924740954D3F944B45944CD0DAC5EAE7DCE8E4D7E1DDCDE0
                DBCBDDD8C8DAD5C5D3CFC0BFBAADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEEDFDFDFE0E0E0E9E9E9EBEBEBEEEEEEEFEFEFF2F2F2F4F4F4F4F4
                F4EDEDEDBFBFBFB8B8B8BABABAB9B9B9BABABAE8E8E8F1F1F1EFEFEFEBEBEBEA
                EAEAE9E9E9E7E7E7E4E4E4DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3
                C4C4C4C4C4C4A9A6A1A19EC6A19ED7A4A1DAB2AFDFA9A6E1ADABE8AFADEAB7B4
                EAD0D5D6559B593B924740954D3F944B45944CD0DAC5AFADE5A3A1E3A5A2DAA4
                A1D9A29ED7A09CD49B98D1B2ADB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3
                C4C4C4C4C4C4A9A6A1A19EC6A19ED7A4A1DAB2AFDFA9A6E1ADABE8AFADEAB7B4
                EAD0D5D6559B593B924740954D3F944B45944CD0DAC5AFADE5A3A1E3A5A2DAA4
                A1D9A29ED7A09CD49B98D1B2ADB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D8D8D8D8D8D8BEBBB6D7D2BEEFEBD6F7EFDCFFF9E7FFFBE8FFFFF7FFFFFBFFFF
                FCF2F9E43295370D881E148C26128B231B8B25E0EED0FFFFF1FFFCEAF8F2DCF7
                EFD9F2EBD5EEE7D0E4DEC9C6C0ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDB8B4ABD9D6C7D8D4C5E6E2D5E8E4D8EAE6DBEEECE3EFECE3D4DE
                CB509C59459F5A36994E419F594DA462489E5A509B57DEE1D1E6E2D5E3DECFE1
                DDCDDFDBCBDCD7C8D2CDBEB7B4ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEED7D7D7E8E8E8E7E7E7EEEEEEEFEFEFF1F1F1F4F4F4F4F4F4EBEB
                EBBFBFBFBFBFBFBBBBBBBFBFBFC2C2C2BFBFBFBEBEBEEDEDEDEEEEEEECECECEB
                EBEBEAEAEAE9E9E9E4E4E4D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
                C4C4C4C4C4C4ACA79D9F9DD69E9BD4A8A5E0AAA7E2ACA9E5AFADEABEBCE9CED8
                CC509C59459F5A36994E419F594DA462489E5A509B57BFC1D79A98E3A6A3DCA5
                A2DAA4A1D9A19ED7A7A3CB9F9B91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
                C4C4C4C4C4C4ACA79D9F9DD69E9BD4A8A5E0AAA7E2ACA9E5AFADEABEBCE9CED8
                CC509C59459F5A36994E419F594DA462489E5A509B57BFC1D79A98E3A6A3DCA5
                A2DAA4A1D9A19ED7A7A3CB9F9B91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D8D8D8D8D8D8B8B2A6EDE8D3EBE6D0FFF9E7FFFCEBFFFFEFFFFFFBFFFFFBE6F4
                D92B96371B9A39069228159A3726A2441F99392B9534F4F8E1FFF9E7FBF4DEF8
                F2DCF5EFD9F1EAD5E3DCC6B0ADA2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                E1E1E1D6D6D5BBB6A9DEDBCCDAD5C7E8E5D9E9E5DAECEAE0EFEDE5C6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364E1DFD0E4E0D2E3
                DED0E1DCCDDFDACAC7C2B3CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F0F0F0EAEAEAD8D8D8EAEAEAE8E8E8F0F0F0F0F0F0F3F3F3F4F4F4E6E6E6B8B8
                B8BABABABCBCBCC1C1C1C2C2C2BEBEBEC1C1C1C2C2C2C3C3C3ECECECEDEDEDEC
                ECECEBEBEBEAEAEADEDEDEE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CACACABBBABAABA6B0A3A1DAA09CD6AEABE3ABA8E4ADACE8BEBDEAC6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364C0BFD7A7A4DEA6
                A3DDA5A1DAA4A0D8AAA6BEA5A4A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CACACABBBABAABA6B0A3A1DAA09CD6AEABE3ABA8E4ADACE8BEBDEAC6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364C0BFD7A7A4DEA6
                A3DDA5A1DAA4A0D8AAA6BEA5A4A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDD1D0D0C2BBA9F4EFDAEEE7D3FFFEEDFFFEEEFFFFF7FFFFFED2EAC80A89
                1F00932800982D15A34117A343099C3618A2411FA24340A047F8F5E0FCF7E3FB
                F4E0F8F1DCF5EED7D3CCB7BFBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFC0BFBDC9C5B7DAD6C7E0DCCFEAE6DBEAE7DDEFEDE4B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FE8E5D9E8
                E4D8E7E3D6E2DED1BBB7ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDEDEDEE0E0E0E8E8E8EBEBEBF1F1F1F1F1F1F4F4F4E0E0E0B7B7B7BEBE
                BEBFBFBFBFBFBFC0C0C0C1C1C1C5C5C5C1C1C1BDBDBDBABABAC7C7C7F0F0F0EF
                EFEFEFEFEFECECECD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9C9B97A6A2C4A09DD6A09DDDACA9E5ACA9E6CCCBE8B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FB9B6E1AA
                A7E2A9A6E1A6A3DDA6A2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9C9B97A6A2C4A09DD6A09DDDACA9E5ACA9E6CCCBE8B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FB9B6E1AA
                A7E2A9A6E1A6A3DDA6A2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB5B4B0D6D0BCEEE8D3F7F1DEFFFFEFFFFFF2FFFFFCB8DDB100891C009C
                34009F3700A03A00A23A04A4401BAD4F0BA441009A3200932854A956FFFEEDFF
                FCEBFFFBE8F9F4E1BEB8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB5B2ABD5D2C3D4D0C1E8E5D9EBE8DDECE9DF9EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585E9
                E5D9E8E4D7D9D5C8BDBCB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD7D7D7E6E6E6E5E5E5F0F0F0F2F2F2F2F2F2D8D8D8B9B9B9C1C1C1C2C2
                C2C3C3C3C3C3C3C4C4C4C4C4C4C3C3C3C6C6C6C6C6C6C0C0C0BCBCBCD0D0D0F0
                F0F0EFEFEFE8E8E8DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D998FAAA7CF9B99D2AFADE3ACAAE6D0CEE39EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585B2
                AFE2AAA7E2B3AFD29A9892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D998FAAA7CF9B99D2AFADE3ACAAE6D0CEE39EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585B2
                AFE2AAA7E2B3AFD29A9892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFAEAA9FE7E3CDE6E0CBFFFEEDFFFFF2FFFFF599CC95008E2100A44001A7
                4403AA4703AB4A03AD4B03AD4A03AA4811B05118B05400A33D00982C78BA76FF
                FEEDFFFCEAEDE7D5B3B1ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBBB6AADEDBCCD3CFC1ECE9DFEEECE3A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D52A0
                C19AE7E3D8C6C2B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD8D8D8EAEAEAE5E5E5F2F2F2F4F4F4DCDCDCBDBDBDC3C3C3C4C4C4C6C6
                C6C7C7C7C9C9C9D0D0D0CBCBCBC7C7C7C6C6C6C6C6C6C9C9C9C3C3C3BCBCBCD8
                D8D8EFEFEFDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFABA6AAA3A1DA9B98D2ADABE8C4C2E8A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D529C
                BC9DB1AEE1ACA8BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFABA6AAA3A1DA9B98D2ADABE8C4C2E8A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D529C
                BC9DB1AEE1ACA8BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBFB9A8F4EFDAE4DECBFFFFF5FFFFFBA9D5A303983003AA4804AE4E06B3
                5407B5580DB85E30C67B12BC6607B55806B45509B1541CB75E09AA4A00982D9C
                CB93FFFBEBD1CABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDC1BCAFDDDACBDDDACFEFEDE4F0EEE69EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A4B7B5B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEDBDBDBEAEAEAEBEBEBF4F4F4F5F5F5D8D8D8CECECEC7C7C7C9C9C9CACA
                CACECECED6D6D6C6C6C6DCDCDCCCCCCCCACACAC9C9C9C8C8C8CACACAC6C6C6BC
                BCBCDBDBDBD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C1C1C0AAA6B8A2A0D99F9DDDAFAEEBC6C4EA9EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A496948DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C1C1C0AAA6B8A2A0D99F9DDDAFAEEBC6C4EA9EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A496948DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D7D7D7CBC4B1F2EED9F2EEDEFFFFFCFFFFFF99CC9530C27307B55809BA5E0ABC
                631CC6714AD58F00B15923E4B70EC26A0ABE6509BB5F07B75918BA6011B15400
                962CB0CDA2ACAAA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C9C6B8DDDACDE6E3DAF0EEE6F1EFE8C3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FCACEC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                E9E9E9E0E0E0EAEAEAEFEFEFF5F5F5F6F6F6E5E5E5C5C5C5DADADACCCCCCD4D4
                D4DADADAC8C8C8C7C7C7D6D6D6DBDBDBCFCFCFCDCDCDCBCBCBC9C9C9C9C9C9C8
                C8C8BABABAE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                B2B1B0A6A3C5A2A0DAABA9E4B0AFEDB8B7EDC3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FA2A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                B2B1B0A6A3C5A2A0DAABA9E4B0AFEDB8B7EDC3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FA2A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CBCBCBD6D2BEF2EEDCFFFBEEFFFFFFFFFFFFCDE8C611AB5151DD9F0DC46C33D3
                894BDE9D0BB75B37AD5900D9A933E3AB0EC9740DC56F0BC16709BB6014BA6018
                B55C039129C1C3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFC5C1B5DFDCD0E5E2D9F1EEE7F2F0E9F3F1EB79B17D59CEA882D8B359CA
                963DB6768EC399F3F2ED75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B475429756FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDEBEBEBEFEFEFF5F5F5F6F6F6F7F7F7CDCDCDDADADAE1E1E1D6D6
                D6CACACAD7D7D7F7F7F7D3D3D3DBDBDBD9D9D9D1D1D1CFCFCFCDCDCDCACACAC9
                C9C9C9C9C9BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFA7A3BEA4A1DDA8A6E3B1AFEDB1B0EFC8C6EF79B17D59CEA882D8B359CA
                963DB6768EC399DEDDEF75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B4752A893FD7DAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFA7A3BEA4A1DDA8A6E3B1AFEDB1B0EFC8C6EF79B17D59CEA882D8B359CA
                963DB6768EC399DEDDEF75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B4752A893FD7DAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD0CAB8F5F1E0FEF9EDFFFFFFFFFFFFFFFFFF65B46A37DDA771EBB737D7
                8E10BB6082CD92FFFFFF5FC58507E4B833E0A011CF7D10CB760DC56D0ABE6311
                BA601CB85F228A2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBAB9B3DEDCCFDDDACFF1EFE8F3F0EAF3F2ECE9EDE350AB7137BE8842AD
                6BA9CEADF6F5F0F5F3EEEDEFE750B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B374549D62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDADADAEBEBEBEBEBEBF6F6F6F6F6F6F7F7F7F4F4F4C7C7C7CECECEC6C6
                C6DFDFDFF9F9F9F8F8F8F5F5F5CCCCCCDDDDDDD7D7D7D2D2D2D0D0D0CDCDCDCA
                CACAC9C9C9C9C9C9C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D9B93AAA8DAACA9DAB1AFEEB2B0F0B2B1F1CED1E650AB7137BE8842AD
                6BA9CEADD2D1F2B4B2F3D1D3EA50B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B3742F883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D9B93AAA8DAACA9DAB1AFEEB2B0F0B2B1F1CED1E650AB7137BE8842AD
                6BA9CEADD2D1F2B4B2F3D1D3EA50B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B3742F883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB2B0A7F4F1DEF2EEDEFFFFFFFFFFFFFFFFFFFFFFFB2BAB5907C67A17AE
                51A9DDAEFFFFFFFFFFFFFFFFFF2BBA711BE8BB2BDC9811D28110CD7A0DC6700A
                BE6511BA601EB75E39903CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB9B7B0D9D6C9E4E1D7EFEDE6F4F2EDF5F3EFB9D3B74CA668BFD9
                BFF8F7F3F7F6F2F6F4F0F4F3EDD6E2D13AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F689D70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD9D9D9E8E8E8EEEEEEF5F5F5F7F7F7F8F8F8E3E3E3C4C4C4E6E6
                E6FAFAFAF9F9F9F9F9F9F8F8F8EDEDEDCCCCCCDEDEDED5D5D5D2D2D2D0D0D0CD
                CDCDCACACAC9C9C9C7C7C7C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFA3A197B3B0D3B7B4DFAFAEEDB3B1F2BBBAF3B9D3B74CA668BAD3
                C1C5C5F5B5B4F5B4B3F4BBBAF1C9D5D43AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F367D41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFA3A197B3B0D3B7B4DFAFAEEDB3B1F2BBBAF3B9D3B74CA668BAD3
                C1C5C5F5B5B4F5B4B3F4BBBAF1C9D5D43AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F367D41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB4B2A7EDE8D6FCF8EAFFFFFFFFFFFFFFFFFFBFE4BC25A44DC8ED
                C8FFFFFFFFFFFFFFFFFFFFFFFFE8F9E10BBC7432E8BA1ED78F11D28211CD7A0D
                C56F0ABC6214BA601BB156548D54FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD6D6D4B8B6B1D0CDC1DCDACEEBE9E1F2F0EBF4F5EFF9F8
                F5F8F8F4F7F6F2F6F4F0F4F3EEF3F2ECB2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA86582A687FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEAEAEAD9D9D9E4E4E4EAEAEAF2F2F2F6F6F6F9F9F9FBFB
                FBFAFAFAF9F9F9F9F9F9F8F8F8F7F7F7E0E0E0CFCFCFDEDEDED3D3D3D2D2D2D0
                D0D0CCCCCCC9C9C9CACACAC3C3C3CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB6B5B49A9890CBC7BAC2C0D4C2C0E6C1BFEFC9CAF2BEBE
                F7B6B6F7B5B4F5B4B3F4B3B2F3C1C1F0B2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA865497E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB6B5B49A9890CBC7BAC2C0D4C2C0E6C1BFEFC9CAF2BEBE
                F7B6B6F7B5B4F5B4B3F4B3B2F3C1C1F0B2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA865497E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFCDCCCBAFADA5DDD8C8F1EEDDFFFFF8FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DEB400C88244EAB710D58911D28210
                CC780DC46C09BA5E1CBA6012A748769576FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D8BCBBB7C3C0B7D4D1C4E4E1
                D8EEECE4F1EFE9F4F2EDF4F3EDF3F1EBF2F0E986BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F57C4D4C6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBDCDCDCDEDEDEE5E5E5EEEE
                EEF4F4F4F6F6F6F7F7F7F8F8F8F7F7F7F6F6F6D3D3D3D3D3D3DEDEDED3D3D3D1
                D1D1CECECECACACAC7C7C7CACACABEBEBEE6E6E6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAB99A9892B4B1A5C6C3C7BCB9
                DFC4C2E9B1AFEFB3B1F2B3B2F2B2B1F0CFCDEC86BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F579DB8A0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAB99A9892B4B1A5C6C3C7BCB9
                DFC4C2E9B1AFEFB3B1F2B3B2F2B2B1F0CFCDEC86BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F579DB8A0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0CFB2B0AAC4C1B4E4E0CEFCF8
                EBFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C48509D3924BE8B310D38711
                D0800EC9730ABE6507B45626BA63039A34B7CEBAFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2
                D1BDBBB8BBB9B2C9C6BCD3D0C3DBD8CDDCD9CECDCABE5AA87149CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C4929ACAA7FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8
                E8DCDCDCDADADAE0E0E0E5E5E5EAEAEAEAEAEAE3E3E3C6C6C6D8D8D8DBDBDBD2
                D2D2D0D0D0CCCCCCC8C8C8C6C6C6D1D1D1DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
                AD989691A29F97C0BCB0BFBDC7C8C5D1CFCCD1CCC9BC449D5E49CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C49273B785FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
                AD989691A29F97C0BCB0BFBDC7C8C5D1CFCCD1CCC9BC449D5E49CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C49273B785FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7
                C6B1AFABB5B2A9D0CCBEE3DECDEFEBDCF1EDDDDBD7C635A35521DEA23DE3A611
                D38410CD7A0BC26A07B85B06B15406CF8886CA98FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDCFFFFFFFFFFFF3FA3695BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF71C1D2C3FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDFFFFFFFFFFFFC1C1C1DBDBDBD7
                D7D7D1D1D1CDCDCDCACACAD1D1D1C6C6C6E5E5E5FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCC0C0BFFFFFFFD5D8D62C9A595BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF719AB59CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCC0C0BFFFFFFFD5D8D62C9A595BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF719AB59CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6FFFFFFFFFFFF1A9D4A3AE3A92C
                DC9611D07E0DC66F0ABE630ECF8001B159B5CCB6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6CFC736B0726E
                D6AE45C8903ABA7B38B67533A96395B097FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5C7C7C7DE
                DEDED3D3D3CBCBCBC9C9C9C2C2C2D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAA9D32AF706E
                D6AE45C8903ABA7B38B67533A9635B845FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAA9D32AF706E
                D6AE45C8903ABA7B38B67533A9635B845FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C405B25B55
                E8B01BD5850BC16709BB5F01A9458C9F8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97B29B39
                BB7E6BC9992F9D532C984B9EB6A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3CC
                CCCCD7D7D7BCBCBCB9B9B9D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E886339
                BB7E6BC9992F9D532C984B658C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E886339
                BB7E6BC9992F9D532C984B658C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EA28E0A
                C26C51D69200982F01912396A796FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF68
                9F7365BB852A8B39ACBFAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
                C5C5D0D0D0B3B3B3DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37
                804565BB85258834769579FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37
                804565BB85258834769579FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54
                8F5448C276077D09A6B0A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF9EC7A1DCE2DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDBDBDBEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF76AF7AC1CBC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF76AF7AC1CBC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF8AC48ED5DDD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ParentShowHint = False
              ShowHint = True
              OnClick = sbOpenTask1Click
            end
            object TipoDocumento: TcxDBComboBox
              Left = 1
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'TIPOIMPEGNO'
              DataBinding.DataSource = SourceImp
              Enabled = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediatePost = True
              Properties.Items.Strings = (
                'Intervento')
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.Shadow = False
              Style.ButtonStyle = btsDefault
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 128
            end
            object DBEditNumDoc: TcxDBTextEdit
              Left = 146
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'ID'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBComboRegistro: TcxDBComboBox
              Left = 204
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'REGISTRO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.Sorted = True
              Properties.OnInitPopup = DBComboRegistroPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.Shadow = False
              Style.ButtonStyle = btsDefault
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBEDataDoc: TcxDBDateEdit
              Left = 286
              Top = 15
              AutoSize = False
              DataBinding.DataField = 'DATAORAINTERVENTO'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.SaveTime = False
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 92
            end
            object DbeAzioneMagazzino: TcxComboBox
              Left = 478
              Top = 15
              AutoSize = False
              Enabled = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '- - -'
                'Carico'
                'Impegna'
                'Ordina'
                'Scarico')
              Properties.Sorted = True
              Style.BorderColor = 8963327
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.BorderColor = 8963327
              StyleDisabled.Color = 16250871
              StyleDisabled.TextColor = clWindowText
              TabOrder = 5
              Text = '- - -'
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 88
            end
            object DbeAzioneCantiere: TcxComboBox
              Left = 478
              Top = 34
              AutoSize = False
              Enabled = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '- - -'
                'Carico'
                'Commessa'
                'Fattura'
                'Montaggio'
                'Scarico')
              Properties.Sorted = True
              Style.BorderColor = 8963327
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.BorderColor = 8963327
              StyleDisabled.Color = 16250871
              StyleDisabled.TextColor = clWindowText
              TabOrder = 6
              Text = '- - -'
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 88
            end
            object DBEditSegnoOperazione: TDBEdit
              Tag = -1
              Left = 565
              Top = 18
              Width = 9
              Height = 15
              TabStop = False
              AutoSize = False
              BorderStyle = bsNone
              Color = 13822463
              Ctl3D = False
              DataField = 'SEGNOOPERAZIONE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 427007
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEditSegnoOperazioneCantiere: TDBEdit
              Tag = -1
              Left = 565
              Top = 37
              Width = 9
              Height = 15
              TabStop = False
              AutoSize = False
              BorderStyle = bsNone
              Color = 13822463
              Ctl3D = False
              DataField = 'SEGNOOPERAZIONECANTIERE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 427007
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DbeDescrizioneCantiere: TcxTextEdit
              Left = 99
              Top = 34
              TabStop = False
              AutoSize = False
              ParentFont = False
              PopupMenu = PopupMenuAzzeraCantiereImpianto
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 4
              Text = '- - -'
              OnKeyPress = DbeDescrizioneCantiereKeyPress
              Height = 20
              Width = 278
            end
          end
          object PanelCantiere: TPanel
            Left = 0
            Top = 88
            Width = 674
            Height = 38
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 6
            Visible = False
            object Shape21: TShape
              Left = 454
              Top = 12
              Width = 121
              Height = 26
              Brush.Color = 13822463
              Pen.Color = 427007
            end
            object Shape19: TShape
              Left = 0
              Top = 12
              Width = 451
              Height = 26
              Brush.Color = 13822463
              Pen.Color = 427007
            end
            object BitBtnPratica1_2: TSpeedButtonRollOver
              Left = 432
              Top = 19
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                CE0B0000424DCE0B0000000000003600000028000000460000000E0000000100
                180000000000980B0000120B0000120B00000000000000000000E9E9E9E9E9E9
                E9E9E9E3E5E6BDC9CCA5B5B999A9AD99A9ADA5B5B9BDC9CCE4E5E6E9E9E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E7E8E8D9DEDFD1D7D8CDD3D4CDD3D4D1D7D8DA
                DEDFE7E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E6E6E7C7CED0ACB8BC
                9AA9AD9AA9ADACB8BCC7CED0E6E7E7E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
                E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0DDDDE7E9E9E9E9E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9DCDDE79DA4D0919EBC98A7AD98A7AD919EBC9DA4D0
                DDDDE7E9E9E9E9E9E9E9E9E90000E9E9E9E9E9E9C8D1D39EADB1A5B5B8BFCFD2
                D2E2E5CFDFE2BCCBCFA7B6BA9EADB1C8D1D3E9E9E9E9E9E9E9E9E9E9E9E9DDE1
                E1CFD4D5D1D7D8DAE0E1E1E7E8E0E6E7D9DFE0D2D7D9CFD4D5DDE1E1E9E9E9E9
                E9E9E9E9E9E9E9E9CFD4D7A0AEB2ABB7BCD1D7DCECEEF5E8EBF1CCD3D8ADB9BE
                A0AEB2CFD4D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795A3B28E9ABC787FDC686A
                F56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9E9E9E9E9E9E9ABB0D795
                A3B28E9ABC787FDC686AF56A6DF17B82D88D99BE95A3B2ABB1D8E9E9E9E9E9E9
                0000E9E9E9C9D2D49EADB1C4D2D6DCEAEDDEECEFDEECEFDEECEFDEECEFDBE9EC
                C0CED29DACB0C9D2D4E9E9E9E9E9E9DEE1E2CFD4D5DCE1E2E4E9EAE5EAEBE5EA
                EBE5EAEBE5EAEBE4E9EADBE0E1CED4D5DEE1E2E9E9E9E9E9E9CCD1D89FADB2CB
                D1DFE8E8FDEAEAFFEAEAFFEAEAFFEAEAFFE7E7FCC6CDDB9EACB1CCD1D8E9E9E9
                E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF7171FF7171FF7373FC8389
                DB96A5B1AFB4D8E9E9E9E9E9E9AFB4D896A4B28086DF7272FD7171FF7171FF71
                71FF7171FF7373FC8389DB96A5B1AFB4D8E9E9E90000E4E5E69FADB1C6D4D7E1
                EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1E1EEF1C3D1D49EADB1E4E5E6
                E7E8E8CFD4D5DDE2E3E6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EBECE6EB
                ECDCE1E2CFD4D5E7E8E8E4E5E79EACB3C4C9E0DDDDFFDDDDFFDDDDFFDDDDFFDD
                DDFFDDDDFFDDDDFFDDDDFFC0C7DC9EACB2E4E5E7DFDFE797A5B38A90E08181FF
                8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B91DC97A5B2DFDFE7DFDF
                E797A5B38A90E08181FF8181FF8181FF8181FF8181FF8181FF8181FF8181FF8B
                91DC97A5B2DFDFE70000C1CACDABBABDE3EEF0E5F0F2E5F0F2E5F0F2E5F0F2E5
                F0F2E5F0F2E5F0F2E5F0F2E2EDF0A7B5B9C1CACDDBDEDFD3D9DAE7EBEBE8EBEC
                E8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE8EBECE7EAEBD2D7D8DBDEDFBCC2
                D0A6B2C0CFCFFDD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFCE
                CFFCA3AFBBBBC2D0ABB3D097A2C09091FD9090FF9090FF9090FF9090FF9090FF
                9090FF9090FF9090FF9091FC97A4BBABB2D0ABB3D097A2C09091FD9090FF9090
                FF9090FF9090FF9090FF9090FF9090FF9090FF9091FC97A4BBABB2D00000A8B6
                BACBD6D9E9F2F42122FD2122FDE9F2F40000FF0000FFE9F2F40000FF0000FFE9
                F2F4C5D0D3A8B6BAD2D7D8DFE2E3E9ECEDE0E3E4E0E3E4E9ECEDDEE1E2DEE1E2
                E9ECEDDEE1E2DEE1E2E9ECEDDCE0E1D2D7D8A3AEBCB3B8E0C2C2FF1B1BFF1B1B
                FFC2C2FF0000FF0000FFC2C2FF0000FF0000FFC2C2FFAFB6D9A3AEBC9DA9BC9E
                A4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1FF0000FF0000FFA1A1FF
                9DA4D99DA9BC9DA9BC9EA4E0A1A1FF1717FF1717FFA1A1FF0000FF0000FFA1A1
                FF0000FF0000FFA1A1FF9DA4D99DA9BC000099A8ACE4EDEFECF5F62123FE2123
                FEECF5F60000FF0000FFECF5F60000FF0000FFECF5F6E2ECED99A8ACCDD2D4E7
                EAEBEAEDEEE1E4E4E1E4E4EAEDEEDFE2E3DFE2E3EAEDEEDFE2E3DFE2E3EAEDEE
                E7EAEACDD2D499A8ACB1B3F7B4B4FF1919FF1919FFB4B4FF0000FF0000FFB4B4
                FF0000FF0000FFB4B4FFB1B3F599A8AC99A8ACAEAFF7B0B0FF1919FF1919FFB0
                B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAFF599A8AC99A8ACAEAFF7
                B0B0FF1919FF1919FFB0B0FF0000FF0000FFB0B0FF0000FF0000FFB0B0FFADAF
                F599A8AC000099A8ACEBF2F3F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7F8F0F7
                F8F0F7F8F0F7F8F0F7F8E4ECEE99A8ACCDD2D4EAECECEBEEEEEBEEEEEBEEEEEB
                EEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEEBEEEEE7EAEBCDD2D499A8ACA6A7FA
                A7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA7A7FFA5A7
                F499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0
                C0FFC0C0FFC0C0FFBBBDF499A8AC99A8ACBEBEFAC0C0FFC0C0FFC0C0FFC0C0FF
                C0C0FFC0C0FFC0C0FFC0C0FFC0C0FFC0C0FFBBBDF499A8AC0000AAB7BBD2DBDD
                F4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FAF4F9FACDD7
                D9AAB7BBD3D7D9E1E4E5EDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFEDEFEFED
                EFEFEDEFEFEDEFEFDFE3E3D3D7D99CA8BC999FE09999FF9999FF9999FF9999FF
                9999FF9999FF9999FF9999FF9999FF9999FF999FDC9CA8BCA5B1BCBCC1E0D0D0
                FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFB9BFDCA5
                B1BCA5B1BCBCC1E0D0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FFD0D0FF
                D0D0FFD0D0FFB9BFDCA5B1BC0000C5CDD0AFBBBEF6F9F9F8FBFBF8FBFBF8FBFB
                F8FBFBF8FBFBF8FBFBF8FBFBF8FBFBF5F8F9AEBABDC5CDD0DCDFE0D5D9DAEEEF
                EFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEEEFEFEDEEEFD4D9DADC
                DFE0AAB2D096A2BF8C8DFD8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF8C8CFF
                8C8CFF8C8DFC96A2BEAAB2D0BFC7D0A9B5BFDEDFFDE0E0FFE0E0FFE0E0FFE0E0
                FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0BFC7D0A9B5BFDEDFFDE0
                E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0E0FFDEDEFCA9B4BEBFC7D0
                0000E5E6E6A0AEB2DAE0E2FBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFDFBFDFD
                FBFDFDD4DBDDA0AEB2E5E6E6E8E8E8D0D4D6E4E6E7EFF0F0EFF0F0EFF0F0EFF0
                F0EFF0F0EFF0F0EFF0F0EFF0F0E2E4E5D0D4D6E8E8E8DEDFE697A5B2878CE37E
                7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF898FDE97A5B2DEDFE6
                E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEF
                FFCDD3DE9FADB2E4E5E6E4E5E69FADB2D2D7E3EFEFFFEFEFFFEFEFFFEFEFFFEF
                EFFFEFEFFFEFEFFFEFEFFFCDD3DE9FADB2E4E5E60000E9E9E9D1D6D7A3B1B4DD
                E2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9
                E9E9E9E1E2E3D1D5D6E5E7E7F0F0F0F1F1F1F1F1F1F1F1F1F1F1F1F0F0F0E4E6
                E6D0D4D6E1E2E3E9E9E9E9E9E9AFB5D795A2B47E83E47272FE7171FF7171FF71
                71FF7171FF7272FD7F85E196A4B2AFB5D7E9E9E9E9E9E9D1D6D7A3B1B4DDE2E4
                FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0AEB2D1D6D7E9E9E9E9E9
                E9D1D6D7A3B1B4DDE2E4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDBE0E1A0
                AEB2D1D6D7E9E9E90000E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9
                FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9E1E2E3D0D5D6
                D7DBDCE5E7E7EEEFEFEFEFEFE3E6E6D5D9DAD0D4D6E1E2E3E9E9E9E9E9E9E9E9
                E9E9E9E9AFB5D796A4B38E99C37E83E47475F97474FA8085E0909BBF96A4B2AF
                B5D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0C3DDE2E4F7F9F9F9FAFA
                D9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E9E9E9E9E9E9E9D1D6D7A1AFB3B5C0
                C3DDE2E4F7F9F9F9FAFAD9DFE0B1BCBFA1AEB2D1D6D7E9E9E9E9E9E90000E9E9
                E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E8E8E8DDE0E0D4D8D9CDD2D4CDD2D4
                D4D8D9DDE0E0E8E8E8E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DDDEE6A3AA
                D095A2BC99A8AC99A8AC95A2BCA3AAD0DDDEE6E9E9E9E9E9E9E9E9E9E9E9E9E9
                E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8BCC7CED0E5E6E6E9E9E9
                E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E6E6C7CED0ACB8BC99A8AC99A8ACACB8
                BCC7CED0E5E6E6E9E9E9E9E9E9E9E9E90000}
              Margin = 6
              OnClick = BitBtnPratica1Click
            end
            object sbCreaIntervento2: TSpeedButtonRollOver
              Left = 621
              Top = 3
              Width = 41
              Height = 30
              Cursor = crHandPoint
              Hint = 'Trasforma la chiamata o l'#39'appuntamento in intervento'
              Glyph.Data = {
                66480000424D66480000000000003600000028000000CD0000001E0000000100
                18000000000030480000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C4BB7893844A6C
                591C442D0D341D0C311B1A3B2747605276867CB3BBB6FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF29AA5FFFFFFF29AA5F29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F3F1E4E9E6DBE2DED1DAD5CF
                D6D2CED6D1D1D8D4DADFDDE3E7E5F0F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F1
                D8FFFFFFD3F1D8D3F1D8D3F1D8D3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B
                1A3B2747605276867CB3BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29
                AA5F29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B1A3B274760
                5276867CB3BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29AA5F29AA5F
                29AA5F29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFB5C4BB7893844A6C591C442D0D341D0C311B1A3B2747605276867CB3
                BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFF29AA5F29AA5F29AA5F29AA
                5F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F5F389A695215436
                1145271042250F3F230F3C210E381F0D351E0C321C0B2E1A0B2B180A28161833
                24849089F0F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDE8EDEAD2DDD7CFDAD4CFD9
                D3CFD9D3CFD8D3CFD7D2CFD7D2CED6D2CED5D1CED5D1CED4D0D1D6D3E7E9E8FC
                FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF1F5F389A6952154361145271042250F3F230F
                3C210E381F0D351E0C321C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFF1F5F389A6952154361145271042250F3F230F3C210E381F
                0D351E0C321C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFF
                FFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF1F5F389A6952154361145271042250F3F230F3C210E381F0D351E0C32
                1C0B2E1A0B2B180A2816183324849089F0F2F1FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF
                29AA5FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF23
                5F3C14512D134D2B18602F208337269F3E28B54126BC4024BB3D1FB238199731
                1274270D461E0A2917092615173022B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF2FC26C2FC26CFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29
                AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F4F2D3DFD8D0DCD5
                D0DBD5D1DFD5D2E6D7D4ECD8D4F0D9D4F2D9D3F1D8D2F0D7D1EAD6D0E3D4CFDA
                D2CED4D1CED4D0D1D5D3F0F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1F1D7D1
                F1D7FFFFFFFFFFFFFFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFD3F1D8FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B2459
                4943737F5E89AB759DCE7EA5DA82A8DB7DA3D0698EAD4B6F7C23453D0A291709
                2615173022B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFF
                FFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B1A5246245D762C
                669D306DBA2F6DC32C6CC22666B71F5A97174A6D0F36380A2917092615173022
                B2BAB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFFFFFFFFFFFF
                FFFFFFFF29AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFB7CBBF235F3C14512D134D2B1851451E597423609A2565B6
                2365BF2063BE1B5EB316549511466B0C34370A2917092615173022B2BAB5FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF2FC26C2FC26CFFFFFFFFFFFFFFFFFFFFFFFF29
                AA5FFFFFFFFFFFFFFFFFFF29AA5FFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF6E9B81165B331557311E6F3831A64937C14F34C04C31BF492EBE472BBD4427
                BC4125BB3E21BA3B1EB9391AB83515952C0D4D1D09271609241465746BFFFFFF
                FFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFF
                FFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EBE6D0
                DED6D0DDD6D2E2D7D6EDDBD7F3DCD6F2DBD6F2DBD5F2DAD5F2DAD4F2D9D3F1D8
                D3F1D8D2F1D7D1F1D7D0EAD5CFDBD2CED4D0CED3D0E0E3E1FFFFFFFFFFFFFFFF
                FFFFFFFFD1F1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFF
                FFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B33155731
                2964585586AA6E9AD5719CD6749ED777A0D87BA3D97DA5D981A7DA84A9DB87AC
                DC8AAEDD6D8FAD2B4C4809271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2F
                C26CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF
                29AA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B33155731205E553670
                A23F79C83C77C73974C63672C53371C4306EC32D6CC2296AC12768C12365C01B
                56950F384009271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF6E9B81165B331557311E5C542F6B9F3471C431
                6FC32D6DC22A6BC22869C12466C02164BF1D61BE1A5FBD165DBC1250920C363F
                09271609241465746BFFFFFFFFFFFFFFFFFFFFFFFF2FC26CFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF29AA5F00FFFFFFFFFFFF
                FFFFFFFFFFFF70A0841862371A653730974942C4593FC3553CC25338C15035C0
                4D32BF4A2FBE472CBD4528BC4226BB3F22BA3C1FB9391BB83618B7341179260A
                301709251465756CFFFFFFFFFFFFFFFFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF
                29AA5F29AA5FFFFFFF29AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFF
                FFE2ECE6D1E0D7D1E0D7D6EADBD9F3DED9F3DDD8F3DDD7F3DCD7F2DBD6F2DBD5
                F2DAD5F2DAD4F2D9D4F1D9D3F1D8D2F1D7D1F1D7D1F1D6CFE4D4CED6D1CED3D0
                E0E3E1FFFFFFFFFFFFFFFFFFD1F1D7D1F1D7D1F1D7FFFFFFFFFFFFD3F1D8D3F1
                D8FFFFFFD3F1D8FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFFFFFFFFFFFFF70A08418
                62371B623E3F7A8C6493D26795D36A97D46D99D5709BD5739ED776A0D77AA2D8
                7DA4D980A7DA83A9DB87ABDC89ADDD8DAFDE56768812302209251465756CFFFF
                FFFFFFFFFFFFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29
                AA5FFFFFFFFFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF70A0841862371A613E
                3471884A80CB467ECA437CC94079C83D77C73975C63773C53471C5306FC32E6D
                C32A6AC22768C12466C02164BF164A750B2B2009251465756CFFFFFFFFFFFFFF
                FFFF2FC26C2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29AA5FFFFFFF
                FFFFFF29AA5FFFFFFFFFFFFFFFFFFFFFFFFF70A0841862371A613E2F6D873F79
                C83C76C63974C63572C53270C42E6DC32B6BC22969C12567C02265BF1E62BE1B
                60BD175DBC155BBB0F45730A2B2009251465756CFFFFFFFFFFFFFFFFFF2FC26C
                2FC26C2FC26CFFFFFFFFFFFF29AA5F29AA5FFFFFFF29AA5FFFFFFFFFFFFF29AA
                5F00FFFFFFFFFFFFFFFFFF71A5861A6A3B1C6D3C43B55A49C65E46C65C43C559
                40C4563DC35439C15036C14E33BF4B30BF482DBE4629BD4226BC4023BB3D20BA
                3A1CB83719B834159D2D0B301709251565756CFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF29AA5F29AA5F29AA5FFFFFFF
                FFFFFFFFFFFFE2EDE7D1E1D8D2E2D8D9F0DEDBF4DFDAF4DED9F3DED9F3DDD8F3
                DDD7F3DCD7F3DCD6F2DBD6F2DAD5F2DAD4F2D9D4F2D9D3F1D8D2F1D8D2F1D7D1
                F1D6D0EBD5CED6D1CED3D0E0E3E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD3F1D8FFFFFFFFFFFFD3F1D8D3F1D8D3F1D8FFFFFFFFFFFFFFFF
                FF71A5861A6A3B1D69424D84B25D8ED06090D16392D26694D36A97D46C99D46F
                9BD5739DD6759FD779A2D87CA3D97FA6DA82A8DB86AADC88ACDD8CAFDE7698B9
                12302209251565756CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF29AA5FFFFFFFFFFFFF29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFF71A5861A
                6A3B1D69424880B25085CD4D83CC4A81CB477ECA447CC9417AC83E78C73A76C6
                3874C63572C5316FC42F6DC32B6BC22869C12567C02265BF1B59A00B2B200925
                1565756CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFF
                FFFFFFFFFF29AA5F29AA5F29AA5FFFFFFFFFFFFFFFFFFF71A5861A6A3B1C6942
                417BAF467EC9437CC9407AC83C77C73A75C63672C53371C42F6EC32C6CC2296A
                C12667C02365BF1F63BE1C61BD185EBC165CBB11519D0A2B2009251565756CFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29AA5FFFFFFFFFFFFF
                29AA5F29AA5F29AA5F00FFFFFFFFFFFFB9D4C41B713F1F734049B86050C9654E
                C8634AC75F47C65D44C55A41C4573EC3553AC25137C14F34C04B31BF492EBE47
                2ABD4327BC4124BB3D21BA3B1DB9381AB835169D2E0B3218092615B2BBB6FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF1F6F3D1E3D9D2E3D9DBF1DFDCF4E0DCF4E0DBF4DF
                DAF4DFDAF3DED9F3DDD8F3DDD8F3DCD7F3DCD6F2DBD6F2DBD5F2DAD4F2D9D4F2
                D9D3F1D8D3F1D8D2F1D7D1F1D7D0EBD5CED6D1CED4D0F0F1F0FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB9D4C41B713F1E6F454781B25689CE588BCF5C8DD05F8FD06292
                D26594D26996D36B98D46F9BD5729DD6749ED778A1D87BA3D97EA5DA81A7DA85
                AADC87ACDC8BAEDD7597B9123223092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFB9D4C41B713F1F70464F86B4578ACF5488CE5185CD4E83CC4B82CB487FCA45
                7DC9427BC83F79C83B76C73974C63672C53270C4306EC32C6CC2296AC12667C0
                2365C01C59A00B2D21092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D4C41B
                713F1E70464781B24E83CC4B81CB477ECA447CC9417AC83D78C73B76C63773C5
                3471C4306FC32D6DC22A6BC22768C02466C02063BE1D61BE195FBD165DBC1252
                9D0A2D21092615B2BBB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFF2F7F42B814F1D764240A4
                5A58CB6C55CA6951C9664FC8634BC76048C65E45C55B42C4583FC35574D384A8
                E4B252C96732BF4A2FBE472BBD4428BC4225BB3E22BA3C1EB9391BB836127B28
                0A2B18193525F1F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDD4E6DCD2E4D9D9EDDEDEF5E2DD
                F4E1DCF4E0DCF4E0DBF4DFDAF4DFDAF3DED9F3DED9F3DDE4F7E7ECF9EEDDF4E1
                D6F2DBD5F2DAD5F2DAD4F2D9D3F1D8D3F1D8D2F1D7D1F1D7D0E5D4CED5D1D1D7
                D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF2F7F42B814F1D7642377B8E4E84CC5186CD5588CE
                578ACE5B8DCF5E8FD06191D16493D26896D3A6C1E4EBF5F48BAEDD739ED777A0
                D87AA2D87DA5D980A7DA84A9DB87ABDC8AAEDD5476870A2B18193525F1F2F1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF2F7F42B814F1D76424383925E8FD15C8DD0588ACF5588CE5286
                CD4F84CC4C82CB4980CA467ECA8DB1DCE1F0EC5F90D13975C63773C53371C430
                6FC32D6CC22A6AC22768C12466C0174C760A2B18193525F1F2F1FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFF2F7F42B814F1D76423E80905588CE5286CD4E84CC4C82CB487FCA457DC942
                7BC83E78C73C76C687ADDAE1F0EC5689CD2E6DC32B6BC22869C12567C02164BF
                1E62BE1A5FBD175DBC1147740A2B18193525F1F2F1FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF8FC0A4
                1E7D452E8F505FCD725DCD7059CB6C56CA6A52C96750C8644CC76149C65E46C6
                5C42C4598BDB98AFE6B8A2E2AD6DD17F33BF4B30BF482CBD4529BD4226BB3F23
                BB3D1FB9391CB8370E50200B2B1885948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F3EDD2E5DAD5E9
                DCDFF5E3DFF5E2DEF5E2DDF4E1DCF4E1DCF4E0DBF4DFDBF4DFDAF4DEDBF4DFF6
                FCF7ECF9EEEBF9EEE3F6E6D6F2DBD6F2DAD5F2DAD4F2D9D4F1D9D3F1D8D2F1D7
                D2F1D7CFDCD2CED5D1E7EAE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC0A41E7D45277B65477FCA4B
                81CB4D83CC5085CC5488CD578ACE5A8CCF5D8ED06091D16392D2C0D5EAF4FCF5
                E4F0F2A6C1E4739DD676A0D779A2D87DA4D97FA6DA83A9DB86AADC89ADDD2B4E
                4A0B2B1885948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC0A41E7D453081686594D36392D25F8FD1
                5C8DD0598BCF5689CE5387CD5085CD4D83CC4A80CBB0CAE4ECF9EED8EAEB85AB
                DA3A76C63874C63471C5316FC42E6DC32B6BC22768C12567C0113C430B2B1885
                948BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF8FC0A41E7D452E7F675D8ED05A8CCF5689CE5387CD4F84
                CC4D82CB4980CA467EC9437CC93F79C8ACC8E3ECF9EED7E9EB7EA6D82F6EC32C
                6CC22969C12667C02265BF1F63BE1B60BD185EBC0E3A420B2B1885948BFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFF2E8C551F814855BB6C63CF7560CE735ECD715ACC6D57CB6B53CA67
                50C9654DC8624AC75F47C65D8CDB99AFE6B8AFE6B8AFE6B890DC9D4CC76031BF
                492DBE462ABD4326BC4024BB3D20BA3A1997310C301B1A3927FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D5E8DDD2E6DADDF1E2E0F5E3DFF5E3DFF5E3DEF5E2DDF5E1DDF4E1DCF4E0DBF4
                E0DBF4DFE7F8EAF8FDF8ECF9EEECF9EEECF9EEE9F9ECDBF4E0D6F2DBD5F2DAD4
                F2D9D4F2D9D3F1D8D2F1D8D1EAD6CED6D1D1D7D4FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F81
                48387BA7437CC9467EC94A81CA4D83CB4F85CC5387CD5689CE598BCF5C8DD060
                90D1BED3EAF4FCF5F4FCF5F4FCF5CEDFED86ABDC759FD778A1D87CA3D97EA5DA
                82A8DB85AADC698EAD0C301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F81485992B169
                96D46694D36492D26090D15D8ED05A8CCF578ACF5387CE5185CD4E83CCB1CCE4
                ECF9EEECF9EEECF9EEBBD3E65689CE3974C63572C53270C42F6DC32C6CC22869
                C11F5A970C301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8C551F8148538EAF6190D15E8ED0
                5B8CD0578ACE5488CE5085CC4E83CC4A80CB477ECA447CC9AEC9E3ECF9EEECF9
                EEECF9EEB8D1E54D83CB2D6DC2296AC12768C02365BF2063BE1C61BD1654950C
                301B1A3927FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00BBDBC821894C2E94556BD17C68D07A64CF7661CE745E
                CD715ECD715FCD725ECD715DCD715DCD705DCD709BDFA6AFE6B7AFE6B7AFE6B7
                AFE6B7A8E4B270D28132BF4A2EBE472BBD4427BC4125BB3E21BA3B104D220C31
                1BB3BEB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF1F8F4D3E7DBD5EADDE1F6E5E1F6E4E0F5E4DFF5E3DFF5E3DFF5E3
                DFF5E3DFF5E3DFF5E2DFF5E3DBF4E1F2FBF4ECF9EEECF9EEECF9EEECF9EEEBF9
                EDE3F6E7D6F2DBD5F2DAD5F2DAD4F2D9D3F1D8D3F1D8CFDBD3CED6D1F0F2F1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                BBDBC821894C2583613C77C73F79C7437CC8457EC94980CA4F84CC5689CE5D8E
                D06291D26896D46F9BD5D2E2EEF3FBF4F3FBF4F3FBF4F3FBF4ECF5F3AAC4E574
                9ED777A0D87BA3D97DA5D981A7DA84A9DB234A400C311BB3BEB8FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBDBC82189
                4C2F8A65709BD66E99D56A97D46795D36593D26493D26594D36694D36593D365
                94D36795D3C9DEE8ECF9EEECF9EEECF9EEECF9EEE1F1EC89AEDB3975C63672C5
                3371C4306EC32D6CC2296AC1123E3B0C311BB3BEB8FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBDBC821894C2E896468
                96D36594D36191D15F8FD15C8DD05B8CD05C8DD05C8ED05C8ED05C8DD05E8ED0
                C7DDE8ECF9EEECF9EEECF9EEECF9EEE0F0EB83AAD92E6DC32A6BC22869C12466
                C02164BF1D61BE0F3C3A0C311BB3BEB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0084C19D228D4E49AE686FD2806CD1
                7D69D07A7DD68C98DFA4A1E2ADA4E2AEA6E3B0A7E3B1A9E4B3ADE5B6AFE6B7AF
                E6B7AEE6B7AEE6B7AFE6B7AFE6B7AFE6B78CDB9A42C4582FBE472CBD4528BC42
                26BB3F18792D0D351E778B80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFE6F2EBD3E8DCDBEFE1E2F6E6E2F6E5E1F6E4E6
                F7E9ECF9EDECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDEBF9EDEAF8EC
                EAF8ECEBF9EDEBF9EDECF9EEE9F8EBD9F3DED5F2DAD5F2DAD4F2D9D4F1D9D1E4
                D5CFD7D2E3E8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF84C19D228D4E2B7E883874C53B77C63E79C76997D3B3CCE7
                D0E1EDD8E7EFDFECF1E4F0F2E8F3F3F0F9F3F2FBF4F2FBF4F1FBF3F1FBF3F2FB
                F4F2FBF4F3FBF4CADCEC7EA6DA76A0D77AA2D87DA4D980A7DA48707D0D351E77
                8B80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF84C19D228D4E4C9592759ED7719CD66E9AD589ADDCBED4E8D1E4EAD7E8
                ECDBECECDFEEEDE2F1EDE9F7EDEBF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDEC
                F9EEB6CFE44A81CB3773C53471C5306FC32E6DC31C51700D351E778B80FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84C1
                9D228D4E4892916D99D56996D46694D382A9DBBBD2E7D0E2EAD5E7EBDAEBECDD
                EEECE1F0ECE9F7EDEBF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDECF9EEB2CDE3
                407AC82B6BC22969C12567C02265BF164D6E0D351E778B80FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF005BAF7E239151
                62C37973D38370D3816CD17EADE5B6AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6
                B8AFE6B7AEE6B7AEE6B7AEE5B7AEE5B7AEE6B7AEE6B7AFE6B7AFE6B89EE1A952
                C96630BF482DBE4629BD42209C380E39204A6856FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEEFE5D3E9DCE0F3E4E3F6
                E6E2F6E6E2F6E5EDF9EFECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEA
                F8EDE9F8ECE9F8EBE9F8EBE9F8ECEAF8EDECF9EEECF9EEEAF9EDDDF4E1D6F2DA
                D5F2DAD4F2D9D2EBD7CFD7D2DBE1DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5BAF7E2391512C77A63472C43773C53A
                76C6EEF7F3F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F3FBF4F2FBF3F1FBF3
                F0FAF2F0FAF2F1FBF3F2FBF3F3FBF4F4FBF5DFECF18CAEDD759FD779A2D87CA3
                D9638BAC0E39204A6856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF5BAF7E239151659EB678A1D8769FD7729CD6E9F6EE
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8
                EBE9F8ECEAF8EDECF9EEECF9EED1E5E95E8FD03874C63572C5316FC427619A0E
                39204A6856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF5BAF7E2391515F9AB5719CD66E9AD56A97D4E8F5EEECF9EEECF9
                EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8EBE9F8ECEA
                F8EDECF9EEECF9EECFE3E95589CD2C6CC2296AC12667C01E5B970E39204A6856
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00339F6024955375D28678D58874D48471D382AFE6B8AFE6B8AFE6B8AFE6B8
                AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AEE5B7ADE5B6ADE5B6AEE5B7AEE6B7AFE6
                B7AFE6B8AFE6B8A7E3B276D58631BF492EBE4728B5410F3E221D462EFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6ECDF
                D3EADDE3F6E7E4F7E7E3F6E6E3F6E6ECF9EEECF9EEECF9EEECF9EEECF9EEECF9
                EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEEC
                F9EEEBF9EEE4F7E8D6F2DBD5F2DAD4F0D9CFD8D3D2DAD5FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF339F602495532C6F
                BB306EC33371C43673C5F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F2
                FBF4F1FBF3F0FAF1EEFAF0EEFAF0F0FAF1F1FBF3F2FBF4F4FBF5F4FCF5EBF5F4
                B1CAE7749ED778A1D8749DCE0F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF339F6024955379A5D17DA4D979
                A2D876A0D8ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8EC
                E9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE1F0EC92B5DD3974
                C63672C5306DBA0F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF339F6024955373A0D0759FD7729CD66F9AD5
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8
                EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE0EFEC8CB1DB2D6DC22A6BC226
                66B60F3E221D462EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00269D57259A567ED78D7BD68B79D58875D485AFE6B8AF
                E6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AEE5B7ADE5B6ADE5B6ADE5B6
                ADE5B6AEE5B7AEE6B7AFE6B7AFE6B8AFE6B897DFA435C04D32BF4A2FBE471041
                240F3E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFD4EBDDD3EBDDE5F7E8E5F7E8E4F7E7E3F6E7ECF9EEECF9EEECF9EE
                ECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8
                EBEAF8EDECF9EEECF9EEECF9EEEAF8ECD7F2DBD6F2DBD5F2DACFD9D3CFD8D3FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                269D57259A56296AC12C6CC22F6EC33270C4F4FCF5F4FCF5F4FCF5F4FCF5F4FC
                F5F4FCF5F3FBF4F2FBF3F0FAF2EEFAF0EDF9EFEDF9EFEEFAF0F0FAF2F2FBF3F3
                FBF4F4FCF5F4FCF5D6E5EF719CD6739ED777A0D81041240F3E23FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF269D57259A
                5683A8DB80A7DB7EA5DA7AA2D9ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEC
                F9EEEAF8EDE9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8EBEAF8EDECF9EEECF9EE
                ECF9EEC7DCE83D77C73975C63773C51041240F3E23FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF269D57259A567CA4D979
                A2D876A0D7739DD6ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8ED
                E9F8EBE7F8EAE6F7E9E6F7E9E7F8EAE9F8EBEAF8EDECF9EEECF9EEECF9EEC5DB
                E73270C42E6DC32B6BC21041240F3E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0027A15A269E5883D8917FD78E7CD6
                8C7AD689AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6B7AEE6B7AE
                E5B7ADE5B6ADE5B6AEE5B7AEE6B7AFE6B7AFE6B8AFE6B883D8923CC25339C150
                36C14E33BF4B114627104225FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFD4ECDED4ECDEE6F7E9E5F7E8E5F7E8E4F7E7EC
                F9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EA
                E7F8EAE9F8EBE9F8ECEBF9EDECF9EEECF9EEE8F7EAD8F3DDD7F3DCD7F3DCD6F2
                DBCFDAD4CFD9D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF27A15A269E582567C02869C12B6BC22E6DC2F4FCF5F4FCF5
                F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F2FBF4F1FBF3F0FAF1EEFAF0EEFAF0F0FA
                F1F1FBF3F2FBF4F4FBF5F4FCF5B5CDE76A97D46C99D4709BD5739DD611462710
                4225FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF27A15A269E5888ACDD84A9DC81A7DB7FA5DAECF9EEECF9EEECF9EEECF9
                EEECF9EEECF9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEB
                F9EDECF9EEECF9EEA4C1E1437CC9417AC83E78C73A76C6114627104225FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27A1
                5A269E5881A7DA7DA4D97AA2D977A0D8ECF9EEECF9EEECF9EEECF9EEECF9EEEC
                F9EEECF9EEEBF9EDE9F8ECE9F8EBE7F8EAE7F8EAE9F8EBE9F8ECEBF9EDECF9EE
                ECF9EE9FBEE03974C63672C53371C42F6EC3114627104225FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0035AB6627A25A
                81D69184D99280D88F7DD78DAAE5B4AFE6B8AFE6B8AFE6B8AFE6B8AFE6B8AFE6
                B8AFE6B7AEE6B7AEE6B7AEE5B7AEE5B7AEE6B7AEE6B7AFE6B7AFE6B87FD78E43
                C55941C4573DC3543AC25134BA4C124A29205335FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7EEE0D4ECDEE6F7E9E6F7
                E9E6F7E9E5F7E8EDFAEFECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEA
                F8EDE9F8ECE9F8EBE9F8EBE9F8ECEAF8EDECF9EEECF9EEE6F8EAD9F3DED9F3DD
                D8F3DDD8F3DCD6F1DBD0DBD4D2DCD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF35AB6627A25A2168B92466BF2769C02A
                6BC1DDEBF0F4FCF5F4FCF5F4FCF5F4FCF5F4FCF5F4FBF5F3FBF4F2FBF3F1FBF3
                F0FAF2F0FAF2F1FBF3F2FBF3F3FBF4F4FBF5A6C2E46292D26694D36996D36B98
                D46996CA124A29205335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF35AB6627A25A85ADD688ACDD85AADC82A8DBE1F0ED
                ECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8
                EBE9F8ECEAF8EDECF9EEECF9EE9BBBDF4A81CB487FCA447CC9427BC83B75BD12
                4A29205335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF35AB6627A25A7FA9D482A8DB7EA5DA7BA3D9E0EFEDECF9EEECF9
                EEECF9EEECF9EEECF9EEECF9EEECF9EEEAF8EDE9F8ECE9F8EBE9F8EBE9F8ECEA
                F8EDECF9EEECF9EE95B7DE407AC83D78C73A75C63773C5316FBA124A29205335
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF005FBF8628A75D72CD8988DA9685D99381D8908CDB999FE1AAA2E2ADA1E2AC
                A2E2ADA2E2ACA1E2ACA2E2ADADE5B6AFE6B7AEE6B7AEE6B7AFE6B7AFE6B7A8E4
                B275D4854BC76048C65E44C55A42C4583EC35531A649134E2C4D785FFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF2E7
                D4EDDFE3F5E7E7F8EAE7F7E9E6F7E9E8F8EBEDF9EFEDFAEFEDF9EFEDFAEFEDFA
                EFEDF9EEECF9EEEAF9EDEBF9EDEAF8ECEAF8ECEBF9EDEBF9EDECF9EEE5F7E8DB
                F4DFDAF4DFDAF3DED9F3DED8F3DDD6EDDBD0DCD5DCE4DFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D2072
                A42064BE2366BF2668C0477FC99BBAE0B3CCE6B4CDE6BDD3E9BFD4E9C4D7EACA
                DCEBEDF7F3F2FBF4F1FBF3F1FBF3F2FBF4F2FBF4E7F2F28AAEDD5B8DCF5F8FD0
                6191D16594D26896D35485AA134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D76ADBE8CAFDE89
                ADDD86AADC94B4E0BFD4E9CADDEAC9DDEACCE0EBCCE0EBCEE0EAD0E2EAE7F6EC
                EBF9EDEAF8ECEAF8ECEBF9EDEBF9EDE1F0EC87ACDB5286CD4F84CC4B82CB4980
                CA457DC93670A2134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF8628A75D70AABC86AADC83A8DB7FA6DA
                8EB1DEBCD2E8C7DCE9C7DBE9CADEEACADEEACBDFE9CDE1EAE7F6ECEBF9EDEAF8
                ECEAF8ECEBF9EDEBF9EDE0EFEC81A8D9487FCA457DC9417AC83E78C73B76C62F
                6B9F134E2C4D785FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF0088D1A629AA5F5CC17C8CDB9A88DA9686D99482D8917F
                D78E7CD68C79D58876D48672D3836FD2806DD17E9BDFA5AFE6B7AFE6B7AFE6B7
                AFE6B79FE1A96AD07B52C96750C8644CC76149C65E45C55B42C4592A8C421452
                2E7B9C89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFE7F6EDD4EEDFDEF3E5E8F8EBE7F8EAE7F7EAE6F7E9E5F7E8E5F7E8
                E4F7E7E4F6E7E3F6E6E2F6E6D5F3E2EDF9F1ECF9EEECF9EEECF9EEECF9EEEBF9
                EFE1F5E5DCF4E1DCF4E0DBF4DFDBF4DFDAF3DED9F3DED4E8D9D0DCD5E4EBE7FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                88D1A629AA5F21838C1C61BD1F63BE2265BF2667C02869C12B6BC22F6EC33170
                C33572C43874C53D78C6AFCAE5F3FBF4F3FBF4F3FBF4F3FBF4CEE0EC6B98D454
                88CD578ACE5A8CCF5E8FD06091D16493D23E758114522E7B9C89FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88D1A629AA
                5F5EAD9E91B2DF8DAFDE8AADDD87ABDC84A9DC81A7DB7EA5DA7BA3D977A0D875
                9ED7729DD6BFD5E7ECF9EEECF9EEECF9EEECF9EECEE1EA749ED7598BCF5689CE
                5387CD5085CD4C82CB4A80CB2D6A7D14522E7B9C89FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88D1A629AA5F5BAB9D8A
                ADDD86ABDC84A9DB80A6DA7DA4D97AA2D976A0D7739ED7709BD66D99D56A97D4
                BCD3E7ECF9EEECF9EEECF9EEECF9EECCE0E96B98D44F84CC4D82CB4980CA467E
                C9427BC83F79C828667B14522E7B9C89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BDE7CF2AAF613DB56B90DC9D8DDC
                9B89DA9787DA9583D89180D88F7DD78D7AD68977D58773D38370D3819ADFA6AF
                E6B8AFE6B8AFE6B894DEA061CE745ACC6D56CA6A53CA6750C8644DC8624AC75F
                46C65C1E6E39155730B6CABEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF2FAF5D4EFDFD8F0E1E9F8EBE8F8EBE7F8EAE7
                F8EAE6F7E9E6F7E9E5F7E8E4F7E7E4F7E7E3F6E6DBF4E6F8FDF9ECF9EEECF9EE
                ECF9EEE9F8EEE0F5E3DEF5E2DDF4E1DDF4E1DCF4E0DBF4E0DBF4DFDAF4DED2E2
                D7D0DDD6F0F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFBDE7CF2AAF61269D71185EBC1B60BD1E62BE2164BF2567C0
                2769C02A6BC12E6DC2306FC33472C43773C5A7C3E3F4FCF5F4FCF5F4FCF5AAC5
                E44F84CB4D83CB5085CC5387CD578ACE598BCF5D8ED06090D1246550155730B6
                CABEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBDE7CF2AAF613EAD7794B4E091B2DF8EB0DE8BAEDE88ACDD85AADC82A8
                DB7FA5DA7CA3D978A1D8769FD7BCD2E7ECF9EEECF9EEECF9EEB5CDE56795D360
                90D15C8DD05A8CCF5689CE5387CE5185CD4D83CC20614F155730B6CABEFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE7
                CF2AAF613DAD778EB0DE8BAEDE87ABDC85AADC81A7DA7EA5DA7BA3D977A0D874
                9ED7719CD66E9AD5B8D0E6ECF9EEECF9EEECF9EEB1CBE45E8FD0578ACE5387CD
                5085CC4D82CB4A80CB477ECA437CC91E604E155730B6CABEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF38B86E
                2BB0627AD29191DD9E8EDC9B8ADB9888DA9684D99281D8907ED78D7AD68A78D5
                8874D4849EE0A9AFE6B8A7E3B086D99564CF7661CE745ECD715BCC6E57CB6B54
                CA6850C9654EC8633EAD55175E3525653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7F1E2D5EFE0E4F6
                E9E9F8ECE8F8EBE8F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7E8E4F7E7E3F6E6F8
                FDF8ECF9EEF0FBF2E8F8EAE0F5E4DFF5E3DFF5E3DEF5E2DDF5E1DDF4E1DCF4E0
                DCF4E0D8EFDDD1DFD7D3E0D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38B86E2BB0621D72A5185EBC1A
                5FBD1D62BE2064BE2466BF2668C0296AC12D6DC2306EC33371C4ADC7E5F4FCF5
                D6E6EE78A2D8437CC8457EC94980CA4C82CB4F85CC5286CD5689CE588BCF4B82
                A9175E3525653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF38B86E2BB0627DB4C195B5E092B3E08FB1DF
                8CAFDE88ACDD86AADC83A8DB7FA6DA7DA4D979A2D8C2D8E9ECF9EED9EAEC98B7
                E06A97D46795D36492D26191D15D8ED05B8CD0578ACF5488CE437DA7175E3525
                653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF38B86E2BB06279B1C08FB1DF8CAFDE88ACDD86AADC82A8
                DB7FA6DA7CA4D978A1D8759FD7729CD6C0D5E8ECF9EED7E9EB92B4DE6191D15F
                8FD15B8CD0588ACF5488CE5186CD4E83CC4B81CB3C77A5175E3525653FFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFF96DBB32BB46446BD7396DEA292DD9F8FDC9C8BDB9988DA9685D993
                82D8917FD78E7BD68B79D58898DFA4ACE5B57DD78C6CD17D69D07A65CF7762CE
                755ECD715CCC6F58CB6C55CA6951C966277E431862378BAF9AFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EAF8F0D5F0E0DAF2E3EAF8ECE9F8ECE9F8EBE8F8EBE7F8EAE7F7E9E6F7E9E5F7
                E8E5F7E8E4F7E7EBF9EEECF9EEE5F7E8E2F6E5E1F6E4E0F5E4E0F5E3DFF5E3DE
                F5E2DEF5E2DDF4E1DCF4E0D4E5D9D1E0D7E8EFEBFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB4
                64269C79185EBC185EBC195FBC1D61BD1F63BE2366BF2667C02869C12C6CC22F
                6EC38CB0DCE5F1F25286CC3B77C63F79C7427BC8457EC9487FCA4B81CB4E84CC
                5186CD5588CE296E5E1862378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB46447B3829A
                B8E296B6E193B4E090B1DF8DAFDE89ADDD87ABDC84A9DC80A7DB7EA5DAB1CBE6
                E4F2ED85AADC719CD66E9AD56B97D46896D46593D26291D25E8FD15C8DD0588A
                CF286E5E1862378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96DBB32BB46446B28294B4E090B1DF
                8DAFDE89ADDD86ABDC83A8DB80A6DA7DA4D979A2D876A0D7AEC8E4E3F2ED7EA5
                D96996D46694D36292D26090D15C8DD0598BCF5588CE5286CD4E84CC266C5D18
                62378BAF9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFF2FBF63ABC702CB56569CB8896DEA393DD9F90
                DC9D8CDB9A89DA9786D99483D89180D88F7CD68C7AD68976D48673D3836FD280
                6CD17E69D07A66CF7863CF755FCD725DCD7059CB6C3CA1561A6A3B277145F1F5
                F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFDFEFDD7F2E2D5F0E0E1F5E7EAF8EDE9F8ECE9F8EBE8F8EB
                E7F8EAE7F7EAE6F7E9E6F7E9E5F7E8E4F7E7E4F6E7E3F6E6E2F6E6E2F6E5E1F6
                E4E0F5E4E0F5E3DFF5E3DFF5E2DEF5E2D8ECDDD1E1D8D4E2DAFCFDFDFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF2FBF63ABC702CB565208295185EBC185EBC185EBC1C61BD1E62BE2265
                BF2567C02769C02B6BC22E6DC23170C33472C43874C53A76C63E79C7417AC844
                7DC9477FCA4A81CA4D83CC387A8D1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FB
                F63ABC702CB5656BB7AB9AB9E297B6E194B4E091B2DF8EB0DE8AADDD88ACDD85
                AADC81A7DB7FA5DA7BA3D978A1D8759ED7729CD66E9AD56C98D56996D46594D3
                6392D25F8FD13F7F8F1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF63ABC702C
                B56568B4AA95B5E091B2DF8EB0DE8AADDD87ABDC84A9DB81A7DA7EA5DA7AA2D9
                77A0D8739ED7719CD66D99D56A97D46694D36392D26190D15D8ED05A8CCF5689
                CE3A7C8E1A6A3B277145F1F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFBDEAD02DB96733B9
                6985D89A97DFA494DEA091DD9E8DDC9B8ADB9887DA9584D99281D8907DD78D7A
                D68A77D58774D48470D3816DD27F6AD17B67D07964CF7660CE7352BC681F7742
                1B6E3DB7D1C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF6D5F1E1D6F1E1E7F7EBEA
                F9EDEAF8ECE9F8ECE8F8EBE8F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7E8E4F7E7
                E3F6E6E2F6E6E2F6E5E1F6E5E1F6E4E0F5E4DFF5E3DCF2E1D2E4D9D1E2D8F1F6
                F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD02DB9672BB06A1C6EAB185EBC185EBC
                185EBC1B60BD1D62BE2164BF2466BF2668C02A6BC12D6DC2306FC33371C43773
                C53A75C63D78C7407AC8437CC9467EC9417EB01E72481B6E3DB7D1C2FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFBDEAD02DB96733B66D88B9CB9BB9E298B7E195B5E091B2
                DF8FB1DF8BAEDE88ACDD86AADC82A8DB7FA6DA7CA3D979A2D8769FD7739DD76F
                9BD66D99D56A97D46694D3568CB71F73481B6E3DB7D1C2FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFBDEAD02DB96733B66D84B6C996B5E192B3DF8FB1DF8BAEDE88ACDD85
                AADC82A8DB7FA6DA7BA3D978A1D8749ED7729CD66E9AD56B98D46795D36493D2
                6191D15E8ED04F87B51F73481B6E3DB7D1C2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFF7DD6A12DBA6733BA6A86D89A98DFA495DEA192DD9F8EDC9B8BDB9988DA
                9685D99382D8917ED78D7BD68B78D58875D48571D3826ED27F6BD17C68D07A58
                BF6E217E461C754171A788FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F7
                ECD5F1E1D6F1E1E7F7EBEAF9EDEAF8ECE9F8ECE8F8EBE8F8EBE7F8EAE7F7E9E6
                F7E9E5F7E8E5F7E8E4F7E7E3F6E7E3F6E6E2F6E5E1F6E5E1F6E4DEF2E2D3E5DA
                D2E3D9E3EDE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA672B
                B16B1C6EAB185EBC185EBC185EBC1A5FBD1D61BD2064BE2366BF2667C0296AC1
                2C6CC2306EC33270C43673C53975C53C77C73F79C73C7CAF20794B1C754171A7
                88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA6733B76E89BACB
                9CBAE399B7E196B6E192B3E090B1DF8CAFDE89ADDD87ABDC83A8DB80A7DB7DA4
                D97AA2D976A0D8749ED7709BD66E99D55D92B9227B4C1C754171A788FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A12DBA6733B76E84B7CA97B6E193B3
                E090B1DF8CAFDE89ADDD86AADC83A8DB80A6DA7CA4D979A2D8759FD7739DD66F
                9AD56C98D46896D36594D3558EB7217A4C1C754171A788FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFF7DD6A22DBB6833BA6A6BCD8A99DFA596DEA2
                93DD9F8FDC9C8CDB9A88DA9686D99482D8917FD78E7CD68C79D58876D48672D3
                836FD2804BAF6624854A1E7D4572AC8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFE5F7ECD5F1E1D6F1E1E1F5E8EBF9EDEAF8ECE9F8ECE9F8
                EBE8F8EBE7F8EAE7F7EAE6F7E9E5F7E8E5F7E8E4F7E7E4F6E7E3F6E6E2F6E6DB
                EFE0D3E7DBD2E5DAE3EEE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF7DD6A22DBB682BB16B218396185EBC185EBC185EBC195FBC1C61BD1F
                63BE2265BF2567C02869C12B6BC22F6EC33170C33572C43874C52F7D9021804F
                1E7D4572AC8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D
                D6A22DBB6833B76E6EB9AC9DBBE39AB8E297B6E193B4E091B2DF8DAFDE8AADDD
                87ABDC84A9DC81A7DB7EA5DA7BA3D977A0D8759ED74E92992482501E7D4572AC
                8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD6A22DBB68
                33B76E6AB7AB98B7E194B4E091B2DF8DAFDE8AADDD86ABDC84A9DB80A6DA7DA4
                D97AA2D976A0D7739ED7709BD66D99D5498E972381501E7D4572AC8AFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD7A22EBC692D
                B96748C0767ED49596DEA394DEA090DC9D8DDC9B89DA9787DA9583D89180D88F
                7DD78D7AD68962C379369D5B21874B20844A73B08DFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F7ECD5F2E1D5F1E1DAF2E4
                E5F6EAEAF8EDEAF8ECE9F8EBE8F8EBE7F8EAE7F8EAE6F7E9E6F7E9E5F7E8E4F7
                E7E0F3E4D7EBDED3E7DBD2E6DBE3EFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DD7A22EBC692DB967279F7B1D73A6185E
                BC185EBC185EBC1B60BD1E62BE2164BF2466BF2769C02A6BC12E6DC22C77A627
                856C21874B20844A73B08DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF7DD7A22EBC692DB96749B78581B9C39AB9E298B7E194
                B4E091B2DF8EB0DE8BAEDE88ACDD85AADC82A8DB7FA5DA659EB638917121874B
                20844A73B08DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF7DD7A22EBC692DB96748B6847DB6C195B5E092B3DF8EB0DE8BAEDE
                87ABDC85AADC81A7DA7EA5DA7BA3D977A0D85F9AB5368F7021874B20844A73B0
                8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFBDEBD13BC1722DBA672CB76640BB7161C8837BD2918ADA9A8EDC9B8A
                DB9882D6926DCA8353B97335A25E239251238F50309359B9DAC7FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
                FBF6D8F3E3D5F1E1D5F1E0D9F1E3DFF4E6E5F6E9E8F8EBE8F8EBE8F8EAE6F7E9
                E2F4E6DDF1E3D7ECDFD3E9DCD3E9DCD5E9DEF1F8F4FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC172
                2DBA672CB76627A37521878F1C72A51963B61A5FBD1D62BE2068B82473A52680
                8B258E68239251238F50309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC1722DBA672CB7
                6641B57C63B5A27EB5C18EB4D892B3E08FB1DF86AED670A8BC56A29936996D23
                9251238F50309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBD13BC1722DBA672CB76640B47C61
                B3A279B2C089B0D78CAFDE88ACDD80A9D46BA5BA52A09835996C239251238F50
                309359B9DAC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF696DEB43ABE712CB7662CB4642BB1
                622AAD6129AA5F28A75D28A45B27A159269D57259A56329E5F91C9A8F1F8F4FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFDFEFDEAF8F0D7F2E3D5F1E0D5F0E0D5EFE0D4EFDFD4
                EEDFD4EDDFD4EDDED4ECDED4EBDDD3EBDDD6EBDFE9F4EDFCFEFDFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF2FBF696DEB43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D
                28A45B27A159269D57259A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F2FBF696DEB43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D28A45B27A1
                59269D57259A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF696DE
                B43ABE712CB7662CB4642BB1622AAD6129AA5F28A75D28A45B27A159269D5725
                9A56329E5F91C9A8F1F8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                BDEAD088D7A960C78B38B66D2AAE6129AB5F36AD685DBA8485CAA2BBE1CBFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FBF6E7F7
                EEE0F4E8D7F0E2D4EFDFD4EEDFD7EFE1DFF1E7E6F4ECF1F9F5FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38
                B66D2AAE6129AB5F36AD685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38B66D2AAE61
                29AB5F36AD685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFBDEAD088D7A960C78B38B66D2AAE6129AB5F36AD
                685DBA8485CAA2BBE1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00}
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = SBCreaInterventoClick
            end
            object SBEspandiPratica2: TSpeedButtonRollOver
              Left = 415
              Top = 19
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiPratica1Click
            end
            object sbOpenTask2: TSpeedButtonRollOver
              Left = 582
              Top = 3
              Width = 32
              Height = 32
              Cursor = crHandPoint
              Hint = 'Crea o apre il Task associato alla chiamata'
              Glyph.Data = {
                363C0000424D363C0000000000003600000028000000A0000000200000000100
                180000000000003C0000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D8D5DCDAD4DCD9
                D3D6D5D2E2E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBEBEBEBEBEB
                EBE9E9E9F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C1BDCECBC3CECB
                C2C0BEB9CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C1BDCECBC3CECB
                C2C0BEB9CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D7D2E3E0D7E3DF
                D7D5D3CFDDDDDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCCCBB4B0A4B7B2A5BDB8ABBDB8
                ABB8B3A6B3AEA1B6B2A5B2AFA7BDBCB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5D5D5D5D6D6D6D9D9D9D9D9
                D9D7D7D7D4D4D4D6D6D6D5D5D5DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADACAAA4A0A4A7A3ADADA8B2ADA8
                B2ADA8ABB3AEA1B3AEA19A978D989691CDCDCCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADACAAA4A0A4A7A3ADADA8B2ADA8
                B2ADA8ABB3AEA1B3AEA19A978D989691CDCDCCFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C4C2B6B09FBCB5A3C5BEABC5BE
                ABBEB7A4B7B09DBAB4A1ABA79BB1B0ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D3D3B5B0A3CFCBBDDAD6C8CBC6B8CAC5
                B7CAC6B8CAC5B7C4BFB2BDB8ABB7B2A5B3AEA1B6B3A8B8B7B3FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9D5D5D5E3E3E3E8E8E8E0E0E0E0E0
                E0E0E0E0E0E0E0DDDDDDD9D9D9D6D6D6D4D4D4D7D7D7DADADAFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5A39FA99895CFA09DD79591CB9490
                CA9491CB9490CA9C98C2A7A2B5A7A3ADB3AEA1A9A59994928CC8C7C6FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5A39FA99895CFA09DD79591CB9490
                CA9491CB9490CA9C98C2A7A2B5A7A3ADB3AEA1A9A59994928CC8C7C6FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCB9B2A0DED9C5EEE8D5D9D2BED7D0
                BCD7D2BED7D0BCCFC8B5C5BEABBCB5A3B7B09DB6B1A2ACAAA5FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE3E3E3BAB7B0CECABCDCD9CACECABBD1CDBFD3CE
                BFD4CFC0D4D0C0D4D0C0D2CEBFCFCBBDC9C4B7C0BBAEB8B3A6B3AEA1B0ADA4BE
                BDBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1D9D9D9E2E2E2E9E9E9E2E2E2E4E4E4E4E4
                E4E5E5E5E5E5E5E5E5E5E4E4E4E3E3E3DFDFDFDBDBDBD7D7D7D4D4D4D4D4D4DD
                DDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCDCDCDA9A59D9E9ACCA19FD89794CD9996D09B97
                D09B98D19B99D19B99D19A97D09895CF9390CAA4A0BAADA8ABB3AEA1A09C9098
                9692FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCDCDCDA9A59D9E9ACCA19FD89794CD9996D09B97
                D09B98D19B99D19B99D19A97D09895CF9390CAA4A0BAADA8ABB3AEA1A09C9098
                9692FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFDEDEDEB8B4AADDD7C4F1EDD7DDD7C2E1DCC8E4DD
                C8E6DEC9E6E0C9E6E0C9E3DDC8DED9C5D6CFBCC9C2B0BEB7A4B7B09DACA89AB2
                B0ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFD3D3D2B9B4A7DEDBCCD0CCBDDBD7CADAD5C6DAD5
                C5DAD5C5DAD5C5D9D4C5D9D5C5D9D5C5DAD5C6D6D1C3CDC8BBC7C2B5BEB9ACB6
                B1A4B5B1A4B4B2ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE8E8E8D7D7D7EAEAEAE3E3E3E9E9E9E8E8E8E7E7
                E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E8E8E8E6E6E6E1E1E1DEDEDEDADADAD6
                D6D6D5D5D5D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD3D3D3B7B7B6A39FB1A3A1DA9996CFA19ED8A09CD5A09C
                D4A09CD4A09CD49F9BD49F9CD49F9CD4A09CD59D99D39693CD9894C6A8A3B6B1
                ACA6B3AEA198948CC5C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD3D3D3B7B7B6A39FB1A3A1DA9996CFA19ED8A09CD5A09C
                D4A09CD4A09CD49F9BD49F9CD49F9CD4A09CD59D99D39693CD9894C6A8A3B6B1
                ACA6B3AEA198948CC5C5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFCECECDBFB8A6F4EFDAE0DAC5EFEAD7EEE7D2EEE7
                D0EEE7D0EEE7D0EDE6D0EDE7D0EDE7D0EEE7D2E8E1CDDCD5C2D3CCBAC6BFADBB
                B4A2B9B3A0ABA79EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFDDDDDDBDBBB5CCC8BADAD6C7D7D2C3E3DFD2DED9C9E0DB
                CCE3DED1E1DDCFDED9CBD8D3C4D5D0C1D2CDBED1CCBDD0CBBCD0CBBDCECABDCD
                C8BCC4C0B3BAB5A8B5B1A4CACAC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEEEEEEDCDCDCE1E1E1E8E8E8E6E6E6EDEDEDE9E9E9EBEB
                EBECECECECECECEAEAEAE7E7E7E5E5E5E4E4E4E3E3E3E3E3E3E3E3E3E2E2E2E1
                E1E1DDDDDDD8D8D8D5D5D5E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDDDDDDC4C4C4A8A59DA29FC8A09DD69E9AD3A6A4DEA39FD7A4A1
                DAAAA7DCAFABDAAAA6D79E9BD49C99D29A96CF9996CF9995CE9995CF9794CF96
                93CE9C99C2AFAAADB3AEA1A5A4A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDDDDDDC4C4C4A8A59DA29FC8A09DD69E9AD3A6A4DEA39FD7A4A1
                DAAAA7DCAFABDAAAA6D79E9BD49C99D29A96CF9996CF9995CE9995CF9794CF96
                93CE9C99C2AFAAADB3AEA1A5A4A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD8D8D8BAB6AFDAD5C1EEE8D3EAE3CDFBF5E3F4EDD6F7EF
                DAFBF4E1F8F2DEF4EDD9EBE4CFE7E0CBE3DCC6E1DAC5E0D9C4E0D9C5DDD7C5DC
                D5C4CFC9B7C1BAA7B9B3A0BEBDBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDEDEDEDBDBDBB7B2A6DCD9CAD6D2C3E0DBCBE7E3D6E3DFD0E9E5
                D9E9E5D9E8E5D9E8E5D9E7E3D7E1DDD0DAD5C7D3CEBFD0CBBCCFCABBCDC8BACB
                C6B8CAC6B9CBC7BAC4BFB2B8B4A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFEEEEEEEDEDEDD6D6D6E9E9E9E6E6E6EAEAEAEFEFEFECECECF0F0
                F0F0F0F0F0F0F0F0F0F0EFEFEFECECECE8E8E8E4E4E4E3E3E3E2E2E2E1E1E1E0
                E0E0E0E0E0E1E1E1DDDDDDD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFC6C6C6C2C1C1A8A3A7A19FD89D9AD3A4A1D9A8A6E1ABA8DCABA8
                E3ABA8E3AAA8E3AAA8E3A2A0E39B99DFA09CD69B97D09995CE9894CD9693CC95
                91CB9491CC9592CCA19DC0B3AEA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFC6C6C6C2C1C1A8A3A7A19FD89D9AD3A4A1D9A8A6E1ABA8DCABA8
                E3ABA8E3AAA8E3AAA8E3A2A0E39B99DFA09CD69B97D09995CE9894CD9693CC95
                91CB9491CC9592CCA19DC0B3AEA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFDADADAD6D6D6BAB4A2F1EDD7E8E3CDF7EFD9FFFBE8FBF5E0FFFE
                EDFFFEEDFFFEEDFFFEEDFFFBEAF8F2E0EEE7D3E4DDC8E0D9C4DED7C2DCD5C1D9
                D2BED7D2BFD9D3C1CFC8B5BCB6A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFE1E1E1DDDDDDC6C5C2C5C1B3DDDACADAD5C6E2DDCEE8E4D8E9E5D9EAE6
                DBEAE6DBEAE6DBE9E6DAE9E6DAE9E5DAE8E5D9E7E3D6E1DDCFD8D3C4D1CCBDCF
                CABCCDC9BAC9C4B6CAC6B9BFBAADC3C2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF0F0F0EEEEEEE1E1E1DEDEDEEAEAEAE8E8E8ECECECEFEFEFF0F0F0F1F1
                F1F1F1F1F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFECECECE7E7E7E3E3E3E2
                E2E2E1E1E1DFDFDFE0E0E0DADADAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFCACACAC4C4C4ABA9A4A29FC0A2A0D8A09CD5A6A2DBAAA7E2ABA8E3ACA9
                E5ACA9E5ACA9E5B2B0E3AFADE3AAA6E4B1AFE2B3B0DFA7A4DB9E9BD49996CF98
                94CE9693CC9390C99491CCAFAAB49C9B97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFCACACAC4C4C4ABA9A4A29FC0A2A0D8A09CD5A6A2DBAAA7E2ABA8E3ACA9
                E5ACA9E5ACA9E5B2B0E3AFADE3AAA6E4B1AFE2B3B0DFA7A4DB9E9BD49996CF98
                94CE9693CC9390C99491CCAFAAB49C9B97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDD8D8D8C0BFBBD0CBB7F2EED7EEE7D2F9F2DDFFFCEBFFFEEDFFFF
                EFFFFFEFFFFFEFFFFFEEFFFFEEFFFEEEFFFEEDFFFBE8F8F2DEEBE4CFE1DAC5DE
                D7C4DCD6C1D6CFBBD7D2BFC8C1AEB6B5B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDDDDDDDB8B5ACD6D2C4D9D5C6E1DDCEE4DFD1E8E4D7EDEAE1EBE8
                DDEBE8DDEBE8DDE9E6DA87B484ACC7A5E9E6DAE9E5DAE8E5D9E5E1D4D5D0C1D1
                CCBDCFCBBCCEC9BAC8C3B5CCC7BAACABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFEEEEEEEEEEEED9D9D9E6E6E6E7E7E7EBEBEBEDEDEDEFEFEFF3F3F3F2F2
                F2F2F2F2F2F2F2F0F0F0CFCFCFDCDCDCF0F0F0F0F0F0F0F0F0EEEEEEE5E5E5E3
                E3E3E2E2E2E2E2E2DFDFDFE1E1E1D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C4C4C4C4C4C4ABA79C9D9AD49F9CD5A5A2DBAAA6DDAAA7E2AEACE9ACAA
                E6ACAAE6B4B1E5DBD8DC87B484ACC7A5CECBDEABA8E4AAA8E3A19EE19C99D299
                96CF9895CE9793CC938FC9A8A4C682817BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C4C4C4C4C4C4ABA79C9D9AD49F9CD5A5A2DBAAA6DDAAA7E2AEACE9ACAA
                E6ACAAE6B4B1E5DBD8DC87B484ACC7A5CECBDEABA8E4AAA8E3A19EE19C99D299
                96CF9895CE9793CC938FC9A8A4C682817BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD8D8D8D8D8D8B7B3A6E8E3CFEDE7D2F8F2DDFCF5E1FFFCEAFFFFF8FFFF
                F2FFFFF2FFFFF2FFFFEE78B874ADD3A3FFFFEEFFFEEEFFFEEDFEF8E6E7E0CBE1
                DAC5DED9C4DDD6C1D5CDBADAD3C19B9995FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDD5D5D4BAB6A8DEDBCCDAD6C6E5E0D3E5E1D4E9E6DAEFECE4ECE9
                DFECE9DFE4E5D86CA66C3C8F443D8F43BED0B5EAE6DCE9E6DAE8E5D9DCD7C7D9
                D4C4D5D0C1D1CCBDCCC7B9C6C2B5C1C1BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEEEAEAEAD8D8D8EAEAEAE8E8E8EDEDEDEEEEEEF0F0F0F4F4F4F2F2
                F2F2F2F2EFEFEFC6C6C6B7B7B7B6B6B6E2E2E2F1F1F1F0F0F0F0F0F0E8E8E8E7
                E7E7E5E5E5E3E3E3E1E1E1DEDEDEDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C5C5C5C4C4C4BABAB8A4A0B2A3A1DAA09DD5A4A0DFADA9DFABA9E4AFADEBADAB
                E8B4B2E7D7D8DA6CA66C3C8F443D8F43BED0B5C8C5E1ABA9E4AFADE3A19ED69F
                9BD49C99D29996CF9692CCA3A0C2999895FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C5C5C5C4C4C4BABAB8A4A0B2A3A1DAA09DD5A4A0DFADA9DFABA9E4AFADEBADAB
                E8B4B2E7D7D8DA6CA66C3C8F443D8F43BED0B5C8C5E1ABA9E4AFADE3A19ED69F
                9BD49C99D29996CF9692CCA3A0C2999895FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D9D9D9D8D8D8D0D0CFC1BBA7F4EFDAEEE8D2FEF7E4FEF8E6FFFFEEFFFFFCFFFF
                F5FFFFF5FCFEEB52A4520E841A108418C6E0BAFFFFF1FFFFEEFFFEEDF1EAD3ED
                E6CFE7E0CBE1DAC5DAD3BFD2CCBAB4B3B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDC2C0BDCAC6B8DBD8C9E0DBCDE6E2D5E7E3D6ECE9E0EEECE3EFEC
                E4DDE2D3559B593B924740954D3F944B45944CD0DAC5EAE7DCE8E4D7E1DDCDE0
                DBCBDDD8C8DAD5C5D3CFC0BFBAADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEEDFDFDFE0E0E0E9E9E9EBEBEBEEEEEEEFEFEFF2F2F2F4F4F4F4F4
                F4EDEDEDBFBFBFB8B8B8BABABAB9B9B9BABABAE8E8E8F1F1F1EFEFEFEBEBEBEA
                EAEAE9E9E9E7E7E7E4E4E4DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3
                C4C4C4C4C4C4A9A6A1A19EC6A19ED7A4A1DAB2AFDFA9A6E1ADABE8AFADEAB7B4
                EAD0D5D6559B593B924740954D3F944B45944CD0DAC5AFADE5A3A1E3A5A2DAA4
                A1D9A29ED7A09CD49B98D1B2ADB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3
                C4C4C4C4C4C4A9A6A1A19EC6A19ED7A4A1DAB2AFDFA9A6E1ADABE8AFADEAB7B4
                EAD0D5D6559B593B924740954D3F944B45944CD0DAC5AFADE5A3A1E3A5A2DAA4
                A1D9A29ED7A09CD49B98D1B2ADB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D8D8D8D8D8D8BEBBB6D7D2BEEFEBD6F7EFDCFFF9E7FFFBE8FFFFF7FFFFFBFFFF
                FCF2F9E43295370D881E148C26128B231B8B25E0EED0FFFFF1FFFCEAF8F2DCF7
                EFD9F2EBD5EEE7D0E4DEC9C6C0ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDDDDDDDB8B4ABD9D6C7D8D4C5E6E2D5E8E4D8EAE6DBEEECE3EFECE3D4DE
                CB509C59459F5A36994E419F594DA462489E5A509B57DEE1D1E6E2D5E3DECFE1
                DDCDDFDBCBDCD7C8D2CDBEB7B4ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEEEEEEED7D7D7E8E8E8E7E7E7EEEEEEEFEFEFF1F1F1F4F4F4F4F4F4EBEB
                EBBFBFBFBFBFBFBBBBBBBFBFBFC2C2C2BFBFBFBEBEBEEDEDEDEEEEEEECECECEB
                EBEBEAEAEAE9E9E9E4E4E4D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
                C4C4C4C4C4C4ACA79D9F9DD69E9BD4A8A5E0AAA7E2ACA9E5AFADEABEBCE9CED8
                CC509C59459F5A36994E419F594DA462489E5A509B57BFC1D79A98E3A6A3DCA5
                A2DAA4A1D9A19ED7A7A3CB9F9B91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
                C4C4C4C4C4C4ACA79D9F9DD69E9BD4A8A5E0AAA7E2ACA9E5AFADEABEBCE9CED8
                CC509C59459F5A36994E419F594DA462489E5A509B57BFC1D79A98E3A6A3DCA5
                A2DAA4A1D9A19ED7A7A3CB9F9B91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D8D8D8D8D8D8B8B2A6EDE8D3EBE6D0FFF9E7FFFCEBFFFFEFFFFFFBFFFFFBE6F4
                D92B96371B9A39069228159A3726A2441F99392B9534F4F8E1FFF9E7FBF4DEF8
                F2DCF5EFD9F1EAD5E3DCC6B0ADA2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                E1E1E1D6D6D5BBB6A9DEDBCCDAD5C7E8E5D9E9E5DAECEAE0EFEDE5C6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364E1DFD0E4E0D2E3
                DED0E1DCCDDFDACAC7C2B3CBCAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F0F0F0EAEAEAD8D8D8EAEAEAE8E8E8F0F0F0F0F0F0F3F3F3F4F4F4E6E6E6B8B8
                B8BABABABCBCBCC1C1C1C2C2C2BEBEBEC1C1C1C2C2C2C3C3C3ECECECEDEDEDEC
                ECECEBEBEBEAEAEADEDEDEE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CACACABBBABAABA6B0A3A1DAA09CD6AEABE3ABA8E4ADACE8BEBDEAC6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364C0BFD7A7A4DEA6
                A3DDA5A1DAA4A0D8AAA6BEA5A4A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CACACABBBABAABA6B0A3A1DAA09CD6AEABE3ABA8E4ADACE8BEBDEAC6D7BF3993
                482D9A4E309D5241A56042A56138A05843A46048A4615FA364C0BFD7A7A4DEA6
                A3DDA5A1DAA4A0D8AAA6BEA5A4A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDD1D0D0C2BBA9F4EFDAEEE7D3FFFEEDFFFEEEFFFFF7FFFFFED2EAC80A89
                1F00932800982D15A34117A343099C3618A2411FA24340A047F8F5E0FCF7E3FB
                F4E0F8F1DCF5EED7D3CCB7BFBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFC0BFBDC9C5B7DAD6C7E0DCCFEAE6DBEAE7DDEFEDE4B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FE8E5D9E8
                E4D8E7E3D6E2DED1BBB7ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDEDEDEE0E0E0E8E8E8EBEBEBF1F1F1F1F1F1F4F4F4E0E0E0B7B7B7BEBE
                BEBFBFBFBFBFBFC0C0C0C1C1C1C5C5C5C1C1C1BDBDBDBABABAC7C7C7F0F0F0EF
                EFEFEFEFEFECECECD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9C9B97A6A2C4A09DD6A09DDDACA9E5ACA9E6CCCBE8B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FB9B6E1AA
                A7E2A9A6E1A6A3DDA6A2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9C9B97A6A2C4A09DD6A09DDDACA9E5ACA9E6CCCBE8B4CEAF31934630A0
                5730A25931A35B31A45B35A65F45AC6A3AA6602F9F552D9A4E6DA96FB9B6E1AA
                A7E2A9A6E1A6A3DDA6A2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB5B4B0D6D0BCEEE8D3F7F1DEFFFFEFFFFFF2FFFFFCB8DDB100891C009C
                34009F3700A03A00A23A04A4401BAD4F0BA441009A3200932854A956FFFEEDFF
                FCEBFFFBE8F9F4E1BEB8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB5B2ABD5D2C3D4D0C1E8E5D9EBE8DDECE9DF9EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585E9
                E5D9E8E4D7D9D5C8BDBCB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD7D7D7E6E6E6E5E5E5F0F0F0F2F2F2F2F2F2D8D8D8B9B9B9C1C1C1C2C2
                C2C3C3C3C3C3C3C4C4C4C4C4C4C3C3C3C6C6C6C6C6C6C0C0C0BCBCBCD0D0D0F0
                F0F0EFEFEFE8E8E8DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D998FAAA7CF9B99D2AFADE3ACAAE6D0CEE39EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585B2
                AFE2AAA7E2B3AFD29A9892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D998FAAA7CF9B99D2AFADE3ACAAE6D0CEE39EC29B2D964932A65F33A8
                6234AA6434AB6634AC6734AC6634AA653EAE6B43AE6D32A55D2E9D5187B585B2
                AFE2AAA7E2B3AFD29A9892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFAEAA9FE7E3CDE6E0CBFFFEEDFFFFF2FFFFF599CC95008E2100A44001A7
                4403AA4703AB4A03AD4B03AD4A03AA4811B05118B05400A33D00982C78BA76FF
                FEEDFFFCEAEDE7D5B3B1ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBBB6AADEDBCCD3CFC1ECE9DFEEECE3A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D52A0
                C19AE7E3D8C6C2B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD8D8D8EAEAEAE5E5E5F2F2F2F4F4F4DCDCDCBDBDBDC3C3C3C4C4C4C6C6
                C6C7C7C7C9C9C9D0D0D0CBCBCBC7C7C7C6C6C6C6C6C6C9C9C9C3C3C3BCBCBCD8
                D8D8EFEFEFDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFABA6AAA3A1DA9B98D2ADABE8C4C2E8A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D529C
                BC9DB1AEE1ACA8BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFABA6AAA3A1DA9B98D2ADABE8C4C2E8A9C8A5349D5434AA6535AD6936B0
                6D37B2703BB47454BE893FB77A37B27036B16E38AF6D46B37438AA662F9D529C
                BC9DB1AEE1ACA8BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBFB9A8F4EFDAE4DECBFFFFF5FFFFFBA9D5A303983003AA4804AE4E06B3
                5407B5580DB85E30C67B12BC6607B55806B45509B1541CB75E09AA4A00982D9C
                CB93FFFBEBD1CABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                DDDDDDC1BCAFDDDACBDDDACFEFEDE4F0EEE69EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A4B7B5B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EEEEEEDBDBDBEAEAEAEBEBEBF4F4F4F5F5F5D8D8D8CECECEC7C7C7C9C9C9CACA
                CACECECED6D6D6C6C6C6DCDCDCCCCCCCCACACAC9C9C9C8C8C8CACACAC6C6C6BC
                BCBCDBDBDBD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C1C1C0AAA6B8A2A0D99F9DDDAFAEEBC6C4EA9EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A496948DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                C1C1C0AAA6B8A2A0D99F9DDDAFAEEBC6C4EA9EC29B54BB8337B27038B57439B7
                7846BE8266C89731AF714BD3B33CBB7D39B87938B67537B37143B5763EAF6D31
                9C51AEC3A496948DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D7D7D7CBC4B1F2EED9F2EEDEFFFFFCFFFFFF99CC9530C27307B55809BA5E0ABC
                631CC6714AD58F00B15923E4B70EC26A0ABE6509BB5F07B75918BA6011B15400
                962CB0CDA2ACAAA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D3D3D3C9C6B8DDDACDE6E3DAF0EEE6F1EFE8C3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FCACEC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                E9E9E9E0E0E0EAEAEAEFEFEFF5F5F5F6F6F6E5E5E5C5C5C5DADADACCCCCCD4D4
                D4DADADAC8C8C8C7C7C7D6D6D6DBDBDBCFCFCFCDCDCDCBCBCBC9C9C9C9C9C9C8
                C8C8BABABAE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                B2B1B0A6A3C5A2A0DAABA9E4B0AFEDB8B7EDC3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FA2A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                B2B1B0A6A3C5A2A0DAABA9E4B0AFEDB8B7EDC3D6BE3EAB6B6BCEA23BBC7E56C7
                9367CFA13AB37259AC712ECBA956D2AB3CC0843BBD803ABA7B38B67640B57643
                B27334984FA2A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                CBCBCBD6D2BEF2EEDCFFFBEEFFFFFFFFFFFFCDE8C611AB5151DD9F0DC46C33D3
                894BDE9D0BB75B37AD5900D9A933E3AB0EC9740DC56F0BC16709BB6014BA6018
                B55C039129C1C3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFC5C1B5DFDCD0E5E2D9F1EEE7F2F0E9F3F1EB79B17D59CEA882D8B359CA
                963DB6768EC399F3F2ED75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B475429756FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDDDDDDEBEBEBEFEFEFF5F5F5F6F6F6F7F7F7CDCDCDDADADAE1E1E1D6D6
                D6CACACAD7D7D7F7F7F7D3D3D3DBDBDBD9D9D9D1D1D1CFCFCFCDCDCDCACACAC9
                C9C9C9C9C9BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFA7A3BEA4A1DDA8A6E3B1AFEDB1B0EFC8C6EF79B17D59CEA882D8B359CA
                963DB6768EC399DEDDEF75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B4752A893FD7DAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFA7A3BEA4A1DDA8A6E3B1AFEDB1B0EFC8C6EF79B17D59CEA882D8B359CA
                963DB6768EC399DEDDEF75BD9037D3B456D0A33EC48A3DC1853BBD7F39B8783E
                B57646B4752A893FD7DAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD0CAB8F5F1E0FEF9EDFFFFFFFFFFFFFFFFFF65B46A37DDA771EBB737D7
                8E10BB6082CD92FFFFFF5FC58507E4B833E0A011CF7D10CB760DC56D0ABE6311
                BA601CB85F228A2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBAB9B3DEDCCFDDDACFF1EFE8F3F0EAF3F2ECE9EDE350AB7137BE8842AD
                6BA9CEADF6F5F0F5F3EEEDEFE750B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B374549D62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDADADAEBEBEBEBEBEBF6F6F6F6F6F6F7F7F7F4F4F4C7C7C7CECECEC6C6
                C6DFDFDFF9F9F9F8F8F8F5F5F5CCCCCCDDDDDDD7D7D7D2D2D2D0D0D0CDCDCDCA
                CACAC9C9C9C9C9C9C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D9B93AAA8DAACA9DAB1AFEEB2B0F0B2B1F1CED1E650AB7137BE8842AD
                6BA9CEADD2D1F2B4B2F3D1D3EA50B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B3742F883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF9D9B93AAA8DAACA9DAB1AFEEB2B0F0B2B1F1CED1E650AB7137BE8842AD
                6BA9CEADD2D1F2B4B2F3D1D3EA50B58245D6B650CD9D3EC68D3DC3883BBE8139
                B8793EB57647B3742F883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFB2B0A7F4F1DEF2EEDEFFFFFFFFFFFFFFFFFFFFFFFB2BAB5907C67A17AE
                51A9DDAEFFFFFFFFFFFFFFFFFF2BBA711BE8BB2BDC9811D28110CD7A0DC6700A
                BE6511BA601EB75E39903CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB9B7B0D9D6C9E4E1D7EFEDE6F4F2EDF5F3EFB9D3B74CA668BFD9
                BFF8F7F3F7F6F2F6F4F0F4F3EDD6E2D13AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F689D70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD9D9D9E8E8E8EEEEEEF5F5F5F7F7F7F8F8F8E3E3E3C4C4C4E6E6
                E6FAFAFAF9F9F9F9F9F9F8F8F8EDEDEDCCCCCCDEDEDED5D5D5D2D2D2D0D0D0CD
                CDCDCACACAC9C9C9C7C7C7C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFA3A197B3B0D3B7B4DFAFAEEDB3B1F2BBBAF3B9D3B74CA668BAD3
                C1C5C5F5B5B4F5B4B3F4BBBAF1C9D5D43AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F367D41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFA3A197B3B0D3B7B4DFAFAEEDB3B1F2BBBAF3B9D3B74CA668BAD3
                C1C5C5F5B5B4F5B4B3F4BBBAF1C9D5D43AB78455D6B547CA973EC68E3EC3883B
                BD8039B77740B57645AF6F367D41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFB4B2A7EDE8D6FCF8EAFFFFFFFFFFFFFFFFFFBFE4BC25A44DC8ED
                C8FFFFFFFFFFFFFFFFFFFFFFFFE8F9E10BBC7432E8BA1ED78F11D28211CD7A0D
                C56F0ABC6214BA601BB156548D54FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFD6D6D4B8B6B1D0CDC1DCDACEEBE9E1F2F0EBF4F5EFF9F8
                F5F8F8F4F7F6F2F6F4F0F4F3EEF3F2ECB2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA86582A687FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEAEAEAD9D9D9E4E4E4EAEAEAF2F2F2F6F6F6F9F9F9FBFB
                FBFAFAFAF9F9F9F9F9F9F8F8F8F7F7F7E0E0E0CFCFCFDEDEDED3D3D3D2D2D2D0
                D0D0CCCCCCC9C9C9CACACAC3C3C3CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB6B5B49A9890CBC7BAC2C0D4C2C0E6C1BFEFC9CAF2BEBE
                F7B6B6F7B5B4F5B4B3F4B3B2F3C1C1F0B2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA865497E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFB6B5B49A9890CBC7BAC2C0D4C2C0E6C1BFEFC9CAF2BEBE
                F7B6B6F7B5B4F5B4B3F4B3B2F3C1C1F0B2CFB132BF8E62D7B33DC8933EC68E3D
                C2873BBC7E38B57446B5763FA865497E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFCDCCCBAFADA5DDD8C8F1EEDDFFFFF8FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DEB400C88244EAB710D58911D28210
                CC780DC46C09BA5E1CBA6012A748769576FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D8BCBBB7C3C0B7D4D1C4E4E1
                D8EEECE4F1EFE9F4F2EDF4F3EDF3F1EBF2F0E986BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F57C4D4C6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBDCDCDCDEDEDEE5E5E5EEEE
                EEF4F4F4F6F6F6F7F7F7F8F8F8F7F7F7F6F6F6D3D3D3D3D3D3DEDEDED3D3D3D1
                D1D1CECECECACACAC7C7C7CACACABEBEBEE6E6E6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAB99A9892B4B1A5C6C3C7BCB9
                DFC4C2E9B1AFEFB3B1F2B3B2F2B2B1F0CFCDEC86BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F579DB8A0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAB99A9892B4B1A5C6C3C7BCB9
                DFC4C2E9B1AFEFB3B1F2B3B2F2B2B1F0CFCDEC86BC9038C79967D6B03DC7913E
                C58C3CC08339B87937B16F4DB578349F579DB8A0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0CFB2B0AAC4C1B4E4E0CEFCF8
                EBFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C48509D3924BE8B310D38711
                D0800EC9730ABE6507B45626BA63039A34B7CEBAFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2
                D1BDBBB8BBB9B2C9C6BCD3D0C3DBD8CDDCD9CECDCABE5AA87149CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C4929ACAA7FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8
                E8DCDCDCDADADAE0E0E0E5E5E5EAEAEAEAEAEAE3E3E3C6C6C6D8D8D8DBDBDBD2
                D2D2D0D0D0CCCCCCC8C8C8C6C6C6D1D1D1DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
                AD989691A29F97C0BCB0BFBDC7C8C5D1CFCCD1CCC9BC449D5E49CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C49273B785FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
                AD989691A29F97C0BCB0BFBDC7C8C5D1CFCCD1CCC9BC449D5E49CFA45DD2A73E
                C78F3DC3883ABB7D37B47236AF6D36C49273B785FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7
                C6B1AFABB5B2A9D0CCBEE3DECDEFEBDCF1EDDDDBD7C635A35521DEA23DE3A611
                D38410CD7A0BC26A07B85B06B15406CF8886CA98FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDCFFFFFFFFFFFF3FA3695BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF71C1D2C3FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDFFFFFFFFFFFFC1C1C1DBDBDBD7
                D7D7D1D1D1CDCDCDCACACAD1D1D1C6C6C6E5E5E5FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCC0C0BFFFFFFFD5D8D62C9A595BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF719AB59CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCCC0C0BFFFFFFFD5D8D62C9A595BD2A951
                CD9C3EC58B3BBE8039B8783CC48C32AF719AB59CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6FFFFFFFFFFFF1A9D4A3AE3A92C
                DC9611D07E0DC66F0ABE630ECF8001B159B5CCB6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6CFC736B0726E
                D6AE45C8903ABA7B38B67533A96395B097FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5C7C7C7DE
                DEDED3D3D3CBCBCBC9C9C9C2C2C2D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAA9D32AF706E
                D6AE45C8903ABA7B38B67533A9635B845FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAA9D32AF706E
                D6AE45C8903ABA7B38B67533A9635B845FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C405B25B55
                E8B01BD5850BC16709BB5F01A9458C9F8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97B29B39
                BB7E6BC9992F9D532C984B9EB6A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3CC
                CCCCD7D7D7BCBCBCB9B9B9D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E886339
                BB7E6BC9992F9D532C984B658C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E886339
                BB7E6BC9992F9D532C984B658C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EA28E0A
                C26C51D69200982F01912396A796FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF68
                9F7365BB852A8B39ACBFAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
                C5C5D0D0D0B3B3B3DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37
                804565BB85258834769579FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37
                804565BB85258834769579FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54
                8F5448C276077D09A6B0A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF9EC7A1DCE2DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDBDBDBEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF76AF7AC1CBC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF76AF7AC1CBC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF8AC48ED5DDD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ParentShowHint = False
              ShowHint = True
              OnClick = sbOpenTask1Click
            end
            object LabelCantiere2: TLabel
              Left = 0
              Top = 0
              Width = 451
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Cantiere/Impianto'
              Color = 427007
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label53: TLabel
              Left = 454
              Top = 0
              Width = 121
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'R.D.A.'
              Color = 427007
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object DbeDescrizioneCantiere2: TcxTextEdit
              Tag = -1
              Left = 2
              Top = 15
              TabStop = False
              AutoSize = False
              ParentFont = False
              PopupMenu = PopupMenuAzzeraCantiereImpianto
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Color = 13822463
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              StyleDisabled.Color = 16250871
              TabOrder = 0
              Text = '- - -'
              Height = 20
              Width = 411
            end
            object dbeRDA: TcxDBTextEdit
              Tag = -1
              Left = 455
              Top = 15
              DataBinding.DataField = 'RDA'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.UseLeftAlignmentOnEditing = False
              Style.BorderStyle = ebsNone
              Style.Color = 13822463
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 1
              Width = 119
            end
          end
          object PanelInterventiPrecedenti: TPanel
            Left = 0
            Top = 2001
            Width = 661
            Height = 216
            BevelOuter = bvNone
            Color = 16119285
            ParentBackground = False
            TabOrder = 7
            Visible = False
            DesignSize = (
              661
              216)
            object LabelPanelInterventiPrecedenti: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' INTERVENTI PRECEDENTI'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object GridInterventiPrecedenti: TcxGrid
              Left = 5
              Top = 18
              Width = 651
              Height = 193
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = cxcbsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              LookAndFeel.Kind = lfFlat
              RootLevelOptions.DetailFrameColor = clBlack
              object tvIntPrec: TcxGridDBTableView
                DragMode = dmAutomatic
                Navigator.Buttons.CustomButtons = <>
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DetailKeyFieldNames = 'ID'
                DataController.KeyFieldNames = 'ID'
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'GIACENZA'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'IMPEGNATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'ORDINATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'DISPONIBILE'
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'GIACENZA'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'ORDINATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'IMPEGNATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'DISPONIBILE'
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.ImmediateEditor = False
                OptionsCustomize.ColumnFiltering = False
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsSelection.MultiSelect = True
                OptionsView.CellAutoHeight = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.ExpandButtonsForEmptyDetails = False
                OptionsView.GridLineColor = 11579568
                OptionsView.GridLines = glNone
                OptionsView.GroupByBox = False
                OptionsView.GroupSummaryLayout = gslAlignWithColumns
                OptionsView.HeaderAutoHeight = True
                OptionsView.RowSeparatorColor = clGray
                Styles.Background = DM1.tvInfoUtiliBackground
                Styles.Content = DM1.tvInfoUtiliContent
                Styles.ContentEven = DM1.tvInfoUtiliContent
                Styles.ContentOdd = DM1.tvInfoUtiliContentEven
                Styles.Header = DM1.tvInfoUtiliHeader
                Styles.StyleSheet = DM1.tvInfoUtili
                object tvIntPrecID: TcxGridDBColumn
                  Caption = 'Cod.'
                  DataBinding.FieldName = 'ID'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  Width = 50
                end
                object tvIntPrecDATAORAINTERVENTO: TcxGridDBColumn
                  Caption = 'Data'
                  DataBinding.FieldName = 'DATAORAINTERVENTO'
                  PropertiesClassName = 'TcxDateEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  HeaderAlignmentHorz = taCenter
                  Width = 70
                end
                object tvIntPrecRESOURCENAME: TcxGridDBColumn
                  Caption = 'Operatore'
                  DataBinding.FieldName = 'RESOURCENAME'
                  PropertiesClassName = 'TcxTextEditProperties'
                  HeaderAlignmentHorz = taCenter
                  Width = 90
                end
                object tvIntPrecTIPOINTERVENTO: TcxGridDBColumn
                  Caption = 'Tipo'
                  DataBinding.FieldName = 'TIPOINTERVENTO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  HeaderAlignmentHorz = taCenter
                  Width = 100
                end
                object tvIntPrecRELAZIONEINTERVENTO: TcxGridDBColumn
                  Caption = 'Relazione'
                  DataBinding.FieldName = 'RELAZIONEINTERVENTO'
                  PropertiesClassName = 'TcxMemoProperties'
                  HeaderAlignmentHorz = taCenter
                  Width = 353
                end
              end
              object lvIntPrec: TcxGridLevel
                GridView = tvIntPrec
              end
            end
          end
          object PanelPratiche: TPanel
            Left = 0
            Top = 2230
            Width = 661
            Height = 38
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 8
            Visible = False
            object Label29: TLabel
              Left = 24
              Top = 17
              Width = 17
              Height = 14
              AutoSize = False
              Caption = '1)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelPanelPraticheCaption: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' PRATICA/CANTIERE'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label32: TLabel
              Left = 56
              Top = 17
              Width = 42
              Height = 14
              AutoSize = False
              Caption = 'Numero'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label62: TLabel
              Left = 154
              Top = 17
              Width = 85
              Height = 14
              AutoSize = False
              Caption = 'Data di apertura'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label65: TLabel
              Left = 321
              Top = 17
              Width = 63
              Height = 14
              AutoSize = False
              Caption = 'Descrizione'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Bevel11: TBevel
              Left = -6
              Top = 36
              Width = 679
              Height = 2
              Style = bsRaised
            end
            object DBECodicePratica1: TDBEdit
              Left = 99
              Top = 17
              Width = 35
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PRATICA'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit11: TDBEdit
              Left = 239
              Top = 17
              Width = 63
              Height = 14
              TabStop = False
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'DATAPRATICA1'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object EditDescrizionePratica1: TEdit
              Left = 384
              Top = 17
              Width = 273
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnChange = EditDescrizionePratica1Change
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelImpegnoGenerico: TPanel
            Left = 0
            Top = 2275
            Width = 661
            Height = 128
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 9
            Visible = False
            object Label15: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' APPUNTAMENTO / IMPEGNO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Bevel5: TBevel
              Left = -20
              Top = 126
              Width = 703
              Height = 2
              Style = bsRaised
            end
            object Label17: TLabel
              Left = 304
              Top = 81
              Width = 37
              Height = 14
              AutoSize = False
              Caption = 'Luogo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label20: TLabel
              Left = 304
              Top = 18
              Width = 37
              Height = 35
              AutoSize = False
              Caption = 'Motivo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape13: TShape
              Left = 3
              Top = 25
              Width = 262
              Height = 46
              Brush.Style = bsClear
              Pen.Color = clGray
              Shape = stRoundRect
            end
            object Label7: TLabel
              Left = 6
              Top = 40
              Width = 24
              Height = 12
              Caption = 'Data'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label14: TLabel
              Left = 126
              Top = 40
              Width = 19
              Height = 12
              Caption = 'Ora'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelTecnico2: TLabel
              Left = 6
              Top = 79
              Width = 136
              Height = 14
              AutoSize = False
              Caption = 'Operatore'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 172
              Top = 31
              Width = 28
              Height = 12
              Caption = 'Inizio'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label35: TLabel
              Left = 172
              Top = 51
              Width = 21
              Height = 12
              Caption = 'Fine'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape14: TShape
              Left = 148
              Top = 47
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape15: TShape
              Left = 158
              Top = 37
              Width = 1
              Height = 21
              Pen.Color = clGray
            end
            object Shape16: TShape
              Left = 159
              Top = 37
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object Shape17: TShape
              Left = 159
              Top = 57
              Width = 10
              Height = 1
              Pen.Color = clGray
            end
            object DBELuogoImpegno: TDBMemo
              Left = 343
              Top = 81
              Width = 313
              Height = 40
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'LOCATION'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEMotivoImpegno: TDBMemo
              Left = 343
              Top = 17
              Width = 313
              Height = 61
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'EVENTMESSAGE'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEDataInizioGenerico: TcxDBDateEdit
              Left = 32
              Top = 37
              AutoSize = False
              DataBinding.DataField = 'START_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = []
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.Shadow = False
              Style.TransparentBorder = True
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 90
            end
            object DbeTecnico2: TcxDBLookupComboBox
              Left = 62
              Top = 75
              AutoSize = False
              DataBinding.DataField = 'RESOURCEID'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'RESOURCEID'
              Properties.ListColumns = <
                item
                  FieldName = 'RESOURCENAME'
                end>
              Properties.ListOptions.AnsiSort = True
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = SourceTecnici
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = True
              Style.Shadow = False
              Style.ButtonStyle = btsSimple
              Style.IsFontAssigned = True
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 21
              Width = 200
            end
            object DBEOraInizioGenerico: TcxDBTimeEdit
              Left = 202
              Top = 28
              AutoSize = False
              DataBinding.DataField = 'START_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
            object DBEOraFineGenerico: TcxDBTimeEdit
              Left = 202
              Top = 48
              AutoSize = False
              DataBinding.DataField = 'FINISH_EVENT'
              DataBinding.DataSource = SourceImp
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.TimeFormat = tfHourMin
              Style.BorderColor = clBlue
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 20
              Width = 60
            end
          end
          object PanelInformazioniUtili: TPanel
            Left = 0
            Top = 2429
            Width = 661
            Height = 17
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBackground = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 10
            Visible = False
            object LabelInformazioniUtili: TLabel
              Left = 14
              Top = -3
              Width = 637
              Height = 22
              Alignment = taCenter
              AutoSize = False
              Caption = 'Informazioni utili'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Verdana'
              Font.Style = [fsUnderline]
              ParentFont = False
              Transparent = True
              Layout = tlCenter
            end
          end
          object PanelCreaIntervento: TPanel
            Left = 0
            Top = 2466
            Width = 661
            Height = 27
            BevelOuter = bvNone
            Color = clSilver
            ParentBackground = False
            TabOrder = 11
            Visible = False
            object SBCreaIntervento: TSpeedButtonRollOver
              Left = 200
              Top = 1
              Width = 260
              Height = 25
              Cursor = crHandPoint
              Caption = 'Crea Rapporto di Intervento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -15
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SBCreaInterventoClick
            end
          end
          object PanelDestinatario: TPanel
            Tag = 102
            Left = 332
            Top = 1108
            Width = 329
            Height = 102
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 5
            Visible = False
            object Label33: TLabel
              Tag = -1
              Left = 6
              Top = 70
              Width = 35
              Height = 13
              AutoSize = False
              Caption = 'P.IVA:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object LabelPanelDestinatario: TLabel
              Left = 0
              Top = 0
              Width = 329
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' DESTINATARIO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object SBSoggetto: TSpeedButtonRollOver
              Left = 309
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBSoggettoClick
            end
            object SBEspandiSoggetto: TSpeedButtonRollOver
              Left = 292
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiSoggettoClick
            end
            object DBText3: TDBText
              Left = 6
              Top = 17
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CLIENTE'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = 10395294
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label54: TLabel
              Tag = -1
              Left = 166
              Top = 70
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'C.F.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label75: TLabel
              Tag = -1
              Left = 6
              Top = 85
              Width = 35
              Height = 13
              AutoSize = False
              Caption = 'Tel.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Tag = -1
              Left = 166
              Top = 86
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'Cell.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object DBERagSocCli: TDBEdit
              Left = 44
              Top = 17
              Width = 279
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 14211288
              Ctl3D = False
              DataField = 'RAGSOCCLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit7: TDBEdit
              Left = 6
              Top = 38
              Width = 265
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZOCLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit8: TDBEdit
              Left = 6
              Top = 54
              Width = 41
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPCLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit9: TDBEdit
              Left = 49
              Top = 54
              Width = 242
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTACLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit12: TDBEdit
              Left = 293
              Top = 54
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIACLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit46: TDBEdit
              Left = 41
              Top = 70
              Width = 110
              Height = 13
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PARTITAIVACLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit13: TDBEdit
              Left = 193
              Top = 70
              Width = 130
              Height = 13
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALECLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit14: TDBEdit
              Left = 273
              Top = 38
              Width = 50
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICOCLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit16: TDBEdit
              Left = 41
              Top = 85
              Width = 110
              Height = 13
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONOCLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
            end
            object DBEdit44: TDBEdit
              Left = 193
              Top = 85
              Width = 130
              Height = 13
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULARECLI'
              DataSource = SourceImp
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 9
            end
          end
          object PanelLuogoDestinazione: TPanel
            Left = 0
            Top = 1108
            Width = 328
            Height = 89
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 4
            Visible = False
            object LabelPanelDestinazioneMerce: TLabel
              Left = 0
              Top = 0
              Width = 328
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' DESTINAZIONE DELLA MERCE'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object BitBtnDestinazioneMerci: TSpeedButtonRollOver
              Left = 308
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = BitBtnDestinazioneMerciClick
            end
            object DBEIndirizzoDest: TDBEdit
              Left = 6
              Top = 38
              Width = 263
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'IndirizzoDestMerci'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBECapDest: TDBEdit
              Left = 6
              Top = 54
              Width = 38
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPDestMerci'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBECittaDest: TDBEdit
              Left = 46
              Top = 54
              Width = 233
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CittaDestMerci'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEProvinciaDest: TDBEdit
              Left = 281
              Top = 54
              Width = 43
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'ProvinciaDestMerci'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBERagSocDest: TDBEdit
              Left = 6
              Top = 17
              Width = 318
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGSOCDESTMERCI'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBENumCivicoDest: TDBEdit
              Left = 271
              Top = 38
              Width = 53
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICODESTMERCI'
              DataSource = PreventiviOrdiniForm.SourceDocumento
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelApparecchi: TPanel
            Left = 0
            Top = 1771
            Width = 661
            Height = 208
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 12
            Visible = False
            DesignSize = (
              661
              208)
            object LabelPanelApparecchi: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' APPARECCHI'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object GridApp: TcxGrid
              Left = 5
              Top = 19
              Width = 651
              Height = 182
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = cxcbsNone
              TabOrder = 0
              LookAndFeel.Kind = lfUltraFlat
              RootLevelOptions.DetailFrameColor = clGray
              RootLevelOptions.DetailFrameWidth = 1
              object tvApp: TcxGridDBTableView
                DragMode = dmAutomatic
                Navigator.Buttons.CustomButtons = <>
                FilterBox.Visible = fvNever
                ScrollbarAnnotations.CustomAnnotations = <>
                OnEditing = tvAppEditing
                DataController.DataModeController.GridMode = True
                DataController.DataSource = SourcePratApp
                DataController.DetailKeyFieldNames = 'ID'
                DataController.KeyFieldNames = 'ID'
                DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'GIACENZA'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'IMPEGNATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'ORDINATO'
                  end
                  item
                    Format = '#,0.####'
                    Kind = skSum
                    FieldName = 'DISPONIBILE'
                  end>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnSorting = False
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.FocusRect = False
                OptionsView.NoDataToDisplayInfoText = 'Nessun apparecchio presente'
                OptionsView.ColumnAutoWidth = True
                OptionsView.DataRowHeight = 30
                OptionsView.ExpandButtonsForEmptyDetails = False
                OptionsView.GridLineColor = 11579568
                OptionsView.GridLines = glNone
                OptionsView.GroupByBox = False
                OptionsView.GroupSummaryLayout = gslAlignWithColumns
                OptionsView.Header = False
                OptionsView.HeaderAutoHeight = True
                OptionsView.RowSeparatorColor = clGray
                Styles.StyleSheet = DM1.MasterTableViewStyleSheet
                object tvAppTIPOAPPARECCHIO: TcxGridDBColumn
                  Caption = 'Tipo'
                  DataBinding.FieldName = 'TIPOAPPARECCHIO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  OnCustomDrawCell = tvAppTIPOAPPARECCHIOCustomDrawCell
                  BestFitMaxWidth = 115
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 115
                  Options.Editing = False
                  Options.HorzSizing = False
                  Width = 115
                end
                object tvAppCOMPUTED_APPARECCHIO_FULL: TcxGridDBColumn
                  Caption = 'Apparecchio'
                  DataBinding.FieldName = 'COMPUTED_APPARECCHIO_FULL'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  OnCustomDrawCell = tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  Width = 249
                end
                object tvAppANNOCOSTRUZIONE: TcxGridDBColumn
                  Caption = 'Costruito'
                  DataBinding.FieldName = 'ANNOCOSTRUZIONE'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  OnCustomDrawCell = tvAppANNOCOSTRUZIONECustomDrawCell
                  BestFitMaxWidth = 12
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 12
                  Options.Editing = False
                  Options.HorzSizing = False
                  Width = 12
                end
                object tvAppGARANZIA_SCADENZA: TcxGridDBColumn
                  Caption = 'Garanzia'
                  DataBinding.FieldName = 'GARANZIA_SCADENZA'
                  PropertiesClassName = 'TcxDateEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.ImmediatePost = True
                  Properties.ReadOnly = True
                  Properties.ShowTime = False
                  OnCustomDrawCell = tvAppGARANZIA_SCADENZACustomDrawCell
                  BestFitMaxWidth = 186
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 186
                  Options.Editing = False
                  Options.HorzSizing = False
                  Styles.Content = DM1.tvContent
                  Width = 186
                end
                object tvAppSELECTED: TcxGridDBColumn
                  Caption = '+'
                  DataBinding.FieldName = 'SELECTED'
                  PropertiesClassName = 'TcxCheckBoxProperties'
                  Properties.Alignment = taLeftJustify
                  Properties.ImmediatePost = True
                  Properties.NullStyle = nssUnchecked
                  Properties.ValueChecked = 'T'
                  Properties.ValueUnchecked = 'F'
                  OnCustomDrawCell = tvAppSELECTEDCustomDrawCell
                  BestFitMaxWidth = 18
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 18
                  Options.HorzSizing = False
                  Styles.Content = DM1.tvContent
                  Width = 18
                end
                object tvAppDATAINSTALLAZIONE: TcxGridDBColumn
                  Caption = 'Installato'
                  DataBinding.FieldName = 'DATAINSTALLAZIONE'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  Visible = False
                  BestFitMaxWidth = 65
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 65
                  Options.Editing = False
                  Options.HorzSizing = False
                  VisibleForCustomization = False
                  Width = 65
                end
                object tvAppDATACOLLAUDO: TcxGridDBColumn
                  Caption = 'Collaudo'
                  DataBinding.FieldName = 'DATACOLLAUDO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.ReadOnly = True
                  Visible = False
                  BestFitMaxWidth = 65
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 65
                  Options.Editing = False
                  Options.HorzSizing = False
                  VisibleForCustomization = False
                  Width = 65
                end
                object tvAppCOSTRUTTORE: TcxGridDBColumn
                  DataBinding.FieldName = 'COSTRUTTORE'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppMODELLO: TcxGridDBColumn
                  DataBinding.FieldName = 'MODELLO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppMATRICOLA: TcxGridDBColumn
                  DataBinding.FieldName = 'MATRICOLA'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppUBICAZIONE: TcxGridDBColumn
                  DataBinding.FieldName = 'UBICAZIONE'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppID: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 0
                  Options.Editing = False
                  VisibleForCustomization = False
                  Width = 30
                end
                object tvAppDISMESSO: TcxGridDBColumn
                  DataBinding.FieldName = 'DISMESSO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  SortIndex = 0
                  SortOrder = soAscending
                  VisibleForCustomization = False
                end
                object tvAppCOMPUTED_ABBINATO: TcxGridDBColumn
                  DataBinding.FieldName = 'COMPUTED_ABBINATO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  SortIndex = 1
                  SortOrder = soDescending
                  VisibleForCustomization = False
                end
                object tvAppCOMPUTED_ORDER1: TcxGridDBColumn
                  DataBinding.FieldName = 'COMPUTED_ORDER1'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  SortIndex = 2
                  SortOrder = soAscending
                  VisibleForCustomization = False
                end
                object tvAppCOMPUTED_ORDER2: TcxGridDBColumn
                  DataBinding.FieldName = 'COMPUTED_ORDER2'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  SortIndex = 3
                  SortOrder = soAscending
                  VisibleForCustomization = False
                end
                object tvAppMASTER_ID: TcxGridDBColumn
                  DataBinding.FieldName = 'MASTER_ID'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppIDAPPABBINATO: TcxGridDBColumn
                  DataBinding.FieldName = 'IDAPPABBINATO'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.ReadOnly = True
                  Visible = False
                  Options.Editing = False
                  VisibleForCustomization = False
                end
                object tvAppSELECTED2: TcxGridDBColumn
                  Caption = 'X'
                  DataBinding.FieldName = 'SELECTED'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Visible = False
                  VisibleForCustomization = False
                  Width = 60
                end
                object tvAppPOTENZATERMICA: TcxGridDBColumn
                  DataBinding.FieldName = 'POTENZATERMICA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppPOTENZATERMICA2: TcxGridDBColumn
                  DataBinding.FieldName = 'POTENZATERMICA2'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppTIPOCAMERA: TcxGridDBColumn
                  DataBinding.FieldName = 'TIPOCAMERA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppCOMBUSTIBILE: TcxGridDBColumn
                  DataBinding.FieldName = 'COMBUSTIBILE'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppCOMBUSTIBILEALTRO: TcxGridDBColumn
                  DataBinding.FieldName = 'COMBUSTIBILEALTRO'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppCOMPUTED_INGARANZIA: TcxGridDBColumn
                  DataBinding.FieldName = 'COMPUTED_INGARANZIA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppGARANZIA_NOTE: TcxGridDBColumn
                  DataBinding.FieldName = 'GARANZIA_NOTE'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppGARANZIA_MESI: TcxGridDBColumn
                  DataBinding.FieldName = 'GARANZIA_MESI'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppGARANZIA_MESI_ESTENSIONE: TcxGridDBColumn
                  DataBinding.FieldName = 'GARANZIA_MESI_ESTENSIONE'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppDISMESSO_DATA: TcxGridDBColumn
                  DataBinding.FieldName = 'DISMESSO_DATA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppDISMESSO_NOTE: TcxGridDBColumn
                  DataBinding.FieldName = 'DISMESSO_NOTE'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppVOLTAGGIOELETTRICO: TcxGridDBColumn
                  DataBinding.FieldName = 'VOLTAGGIOELETTRICO'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppPOTENZAELETTRICA: TcxGridDBColumn
                  DataBinding.FieldName = 'POTENZAELETTRICA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppPORTATA: TcxGridDBColumn
                  DataBinding.FieldName = 'PORTATA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppPREVALENZA: TcxGridDBColumn
                  DataBinding.FieldName = 'PREVALENZA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppREFRIGERANTE: TcxGridDBColumn
                  DataBinding.FieldName = 'REFRIGERANTE'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppCARICA: TcxGridDBColumn
                  DataBinding.FieldName = 'CARICA'
                  Visible = False
                  VisibleForCustomization = False
                end
                object tvAppPOTENZAFRIGORIFERA: TcxGridDBColumn
                  DataBinding.FieldName = 'POTENZAFRIGORIFERA'
                  Visible = False
                  VisibleForCustomization = False
                end
              end
              object lvApp: TcxGridLevel
                GridView = tvApp
              end
            end
            object cbSelezionaAppTutti: TcxCheckBox
              Left = 494
              Top = -3
              Caption = 'Seleziona/deseleziona tutti'
              Enabled = False
              ParentBackground = False
              ParentColor = False
              ParentFont = False
              Properties.Alignment = taRightJustify
              Properties.NullStyle = nssUnchecked
              Properties.OnChange = cbSelezionaAppTuttiPropertiesChange
              State = cbsChecked
              Style.BorderColor = clGray
              Style.BorderStyle = ebsUltraFlat
              Style.Color = clWhite
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.TextColor = clMaroon
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              TabOrder = 1
              Transparent = True
            end
          end
          object PanelUbicazioneImpianto: TPanel
            Left = 0
            Top = 131
            Width = 661
            Height = 53
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 13
            Visible = False
            object Label267: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' UBICAZIONE IMPIANTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label268: TLabel
              Left = 6
              Top = 17
              Width = 47
              Height = 14
              AutoSize = False
              Caption = 'Comune'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label269: TLabel
              Left = 6
              Top = 35
              Width = 19
              Height = 14
              AutoSize = False
              Caption = 'via'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label271: TLabel
              Left = 384
              Top = 35
              Width = 27
              Height = 12
              Caption = 'piano'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label272: TLabel
              Left = 451
              Top = 35
              Width = 16
              Height = 12
              Caption = 'int.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label275: TLabel
              Left = 262
              Top = 17
              Width = 47
              Height = 14
              AutoSize = False
              Caption = 'Zona'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label276: TLabel
              Left = 316
              Top = 35
              Width = 27
              Height = 12
              Caption = 'scala'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label332: TLabel
              Left = 448
              Top = 17
              Width = 47
              Height = 14
              AutoSize = False
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label333: TLabel
              Left = 553
              Top = 17
              Width = 47
              Height = 14
              AutoSize = False
              Caption = 'Prov.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label334: TLabel
              Left = 255
              Top = 35
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape29: TShape
              Left = 632
              Top = -6
              Width = 1
              Height = 62
              Pen.Color = clWhite
            end
            object Label335: TLabel
              Left = 506
              Top = 35
              Width = 34
              Height = 12
              Caption = 'palazz.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object dbeComuneImm: TcxDBButtonEdit
              Left = 53
              Top = 14
              AutoSize = False
              DataBinding.DataField = 'COMUNEIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Glyph.SourceDPI = 96
                  Glyph.Data = {
                    424DE6010000000000003600000028000000090000000C000000010020000000
                    000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
                    FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
                    FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
                    EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
                    29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
                    CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
                    29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
                    29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
                    CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
                    29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
                    EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
                    EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
                    EFFFFFFFFF00}
                  Kind = bkGlyph
                end>
              Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonStyle = btsUltraFlat
              Style.ButtonTransparency = ebtAlways
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 200
            end
            object dbeZonaImm: TcxDBComboBox
              Left = 290
              Top = 14
              AutoSize = False
              DataBinding.DataField = 'ZONAIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.OnInitPopup = dbeZonaImmPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 150
            end
            object dbeCapImm: TcxDBButtonEdit
              Left = 474
              Top = 14
              AutoSize = False
              DataBinding.DataField = 'CAPIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Glyph.SourceDPI = 96
                  Glyph.Data = {
                    424DE6010000000000003600000028000000090000000C000000010020000000
                    000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
                    FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
                    FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
                    EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
                    29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
                    CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
                    29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
                    29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
                    CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
                    29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
                    EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
                    EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
                    EFFFFFFFFF00}
                  Kind = bkGlyph
                end>
              Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonTransparency = ebtAlways
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 70
            end
            object dbeProvinciaImm: TcxDBButtonEdit
              Left = 581
              Top = 14
              AutoSize = False
              DataBinding.DataField = 'PROVINCIAIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Glyph.SourceDPI = 96
                  Glyph.Data = {
                    424DE6010000000000003600000028000000090000000C000000010020000000
                    000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
                    FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
                    FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
                    EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
                    29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
                    CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
                    29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
                    29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
                    CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
                    29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
                    EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
                    EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
                    EFFFFFFFFF00}
                  Kind = bkGlyph
                end>
              Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonTransparency = ebtAlways
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 50
            end
            object dbeIndirizzoImm: TcxDBButtonEdit
              Left = 53
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'INDIRIZZOIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Glyph.SourceDPI = 96
                  Glyph.Data = {
                    424DE6010000000000003600000028000000090000000C000000010020000000
                    000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
                    FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
                    FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
                    EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
                    29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
                    CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
                    29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
                    29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
                    CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
                    29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
                    EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
                    EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
                    EFFFFFFFFF00}
                  Kind = bkGlyph
                end>
              Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonTransparency = ebtAlways
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 200
            end
            object dbeNumCivicoImm: TcxDBTextEdit
              Left = 267
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'NUMCIVICOIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 45
            end
            object dbeScalaImm: TcxDBTextEdit
              Left = 345
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'SCALAIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 35
            end
            object dbePianoImm: TcxDBTextEdit
              Left = 413
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'PIANOIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 35
            end
            object dbeInternoImm: TcxDBTextEdit
              Left = 468
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'INTERNOIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 35
            end
            object dbeStrCertImageCombo: TcxDBImageComboBox
              Tag = -1
              Left = 632
              Top = 16
              TabStop = False
              AutoSize = False
              DataBinding.DataField = 'COMPUTED_STR_CERTIFIED_IMM'
              DataBinding.DataSource = SourceAss
              ParentColor = True
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Items = <
                item
                end
                item
                  ImageIndex = 1
                  Value = 'F'
                end
                item
                  ImageIndex = 0
                  Value = 'T'
                end>
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.ButtonStyle = btsUltraFlat
              Style.ButtonTransparency = ebtHideInactive
              TabOrder = 10
              Height = 33
              Width = 30
            end
            object dbePalazzinaImm: TcxDBTextEdit
              Left = 540
              Top = 32
              AutoSize = False
              DataBinding.DataField = 'PALAZZOIMM'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 9
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 91
            end
          end
          object PanelNoteImpianto: TPanel
            Left = 0
            Top = 193
            Width = 661
            Height = 147
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 14
            Visible = False
            object Label16: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' NOTE IMPIANTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object dbeNoteImpianto: TDBMemo
              Left = 7
              Top = 16
              Width = 649
              Height = 60
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = 16250871
              DataField = 'NOTE'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object dbeNotePrivateImpianto: TDBMemo
              Tag = -1
              Left = 6
              Top = 82
              Width = 649
              Height = 60
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = 13816575
              DataField = 'NOTEPRIVATE'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object PanelCheckNotePrivateImpianto: TPanel
              Left = 552
              Top = -1
              Width = 105
              Height = 14
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object cbVediNotePrivateImpianto: TcxCheckBox
                Left = -2
                Top = -4
                AutoSize = False
                Caption = 'Vedi note private'
                ParentFont = False
                Properties.Alignment = taRightJustify
                Properties.OnChange = cbVediNotePrivateSoggettoPropertiesChange
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.LookAndFeel.NativeStyle = False
                Style.TextColor = clMaroon
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                Height = 21
                Width = 111
              end
            end
          end
          object PanelRespImp: TPanel
            Left = 0
            Top = 346
            Width = 661
            Height = 176
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 15
            Visible = False
            object Label251: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' RESPONSABILE DELL'#39'IMPIANTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object DBText9: TDBText
              Left = 580
              Top = 0
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CODICERESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object SBEspandiRespImp: TSpeedButtonRollOver
              Left = 626
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiRespImpClick
            end
            object SBRespImp: TSpeedButtonRollOver
              Left = 643
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBRespImpClick
            end
            object Label253: TLabel
              Left = 5
              Top = 84
              Width = 43
              Height = 12
              Caption = 'Indirizzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label254: TLabel
              Left = 232
              Top = 84
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label262: TLabel
              Left = 298
              Top = 84
              Width = 41
              Height = 12
              Caption = 'Comune'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label261: TLabel
              Left = 525
              Top = 84
              Width = 23
              Height = 12
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label263: TLabel
              Left = 597
              Top = 84
              Width = 25
              Height = 12
              Caption = 'Prov.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label264: TLabel
              Left = 5
              Top = 102
              Width = 42
              Height = 12
              Caption = 'Telefono'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label266: TLabel
              Left = 220
              Top = 102
              Width = 23
              Height = 12
              Caption = 'Cell.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelRagioneSociale: TLabel
              Left = 133
              Top = 28
              Width = 84
              Height = 14
              AutoSize = False
              Caption = 'Ragione sociale'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelNome: TLabel
              Left = 451
              Top = 37
              Width = 52
              Height = 14
              AutoSize = False
              Caption = 'Nome'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelCognome: TLabel
              Left = 133
              Top = 39
              Width = 108
              Height = 14
              AutoSize = False
              Caption = 'Cognome o Rag.Soc.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelTipoPersona: TLabel
              Left = 3
              Top = 22
              Width = 46
              Height = 26
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo persona'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              WordWrap = True
            end
            object Shape18: TShape
              Left = 124
              Top = 35
              Width = 5
              Height = 1
              Pen.Color = clGray
            end
            object Shape20: TShape
              Left = 123
              Top = 16
              Width = 1
              Height = 38
              Pen.Color = clGray
            end
            object Label49: TLabel
              Left = 161
              Top = 55
              Width = 74
              Height = 12
              Caption = 'Codice Fiscale'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label50: TLabel
              Left = 422
              Top = 55
              Width = 58
              Height = 12
              Caption = 'Partita IVA'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DbeInQualitaDi: TcxDBRadioGroup
              Left = 79
              Top = 129
              Cursor = crHandPoint
              Caption = '  in qualit'#224' di   '
              DataBinding.DataField = 'INQUALITADIRESPIMP'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Columns = 4
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Caption = 'Proprietario'
                  Value = 'Proprietario'
                end
                item
                  Caption = 'Occupante'
                  Value = 'Occupante'
                end
                item
                  Caption = 'Terzo responsabile'
                  Value = 'Terzo responsabile'
                end
                item
                  Caption = 'Amministratore'
                  Value = 'Amministratore'
                end>
              Properties.ReadOnly = False
              Style.BorderColor = clGray
              Style.BorderStyle = ebsSingle
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              TabOrder = 13
              Height = 38
              Width = 506
            end
            object eIndirizzoRespImp: TDBEdit
              Left = 57
              Top = 84
              Width = 170
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZORESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eNumCivicoRespImp: TDBEdit
              Left = 247
              Top = 84
              Width = 44
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICORESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eCittaRespImp: TDBEdit
              Left = 341
              Top = 84
              Width = 179
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTARESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eCAPRespImp: TDBEdit
              Left = 551
              Top = 84
              Width = 40
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPRESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 9
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eProvinciaRespImp: TDBEdit
              Left = 626
              Top = 84
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIARESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 10
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eTelefonoRespImp: TDBEdit
              Left = 57
              Top = 102
              Width = 150
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONORESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 11
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eCellulareRespImp: TDBEdit
              Left = 247
              Top = 102
              Width = 150
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULARERESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 12
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object dbeNaturaGiuridica: TcxDBRadioGroup
              Left = 48
              Top = 13
              Cursor = crHandPoint
              DataBinding.DataField = 'NATURAGIURIDICARESPIMP'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.DefaultValue = ''
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Caption = 'Fisica'
                  Value = 'F'
                end
                item
                  Caption = 'Giuridica'
                  Value = 'G'
                end>
              Properties.OnChange = dbeNaturaGiuridicaPropertiesChange
              Style.BorderStyle = ebsUltraFlat
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clGray
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 41
              Width = 75
            end
            object eRagSocRespImp: TDBEdit
              Left = 242
              Top = 19
              Width = 411
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGSOCRESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object eNomeRespImp: TDBEdit
              Left = 485
              Top = 37
              Width = 168
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NOMERESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = eCognomeRespImpKeyPress
            end
            object eCognomeRespImp: TDBEdit
              Left = 242
              Top = 37
              Width = 201
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'COGNOMERESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = eCognomeRespImpKeyPress
            end
            object eCodiceFiscaleRespImp: TDBEdit
              Left = 242
              Top = 55
              Width = 162
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALERESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object ePIVARespImp: TDBEdit
              Left = 485
              Top = 55
              Width = 168
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PARTITAIVARESPIMP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelAbbonamentoImpianto: TPanel
            Left = 0
            Top = 550
            Width = 661
            Height = 159
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 16
            Visible = False
            DesignSize = (
              661
              159)
            object Label322: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' CONTRATTO / ABBONAMENTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label323: TLabel
              Left = 290
              Top = 20
              Width = 64
              Height = 12
              Caption = 'Contratto N'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label324: TLabel
              Left = 425
              Top = 20
              Width = 59
              Height = 12
              Caption = 'data stipula'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label325: TLabel
              Left = 6
              Top = 111
              Width = 98
              Height = 12
              Caption = 'durata contr. (mesi)'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label326: TLabel
              Left = 162
              Top = 111
              Width = 91
              Height = 12
              Caption = 'rinnovo per (mesi)'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label327: TLabel
              Left = 312
              Top = 111
              Width = 100
              Height = 12
              Caption = 'validit'#224' a partire dal'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label328: TLabel
              Left = 516
              Top = 111
              Width = 47
              Height = 12
              Caption = 'scadenza'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label329: TLabel
              Left = 290
              Top = 38
              Width = 19
              Height = 12
              Caption = 'tipo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label330: TLabel
              Left = 290
              Top = 66
              Width = 32
              Height = 12
              Caption = 'prezzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label331: TLabel
              Left = 247
              Top = 142
              Width = 40
              Height = 12
              Caption = 'a mezzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Shape2: TShape
              Left = 0
              Top = 138
              Width = 661
              Height = 1
              Anchors = [akLeft, akBottom]
              Brush.Style = bsClear
              Pen.Color = clWhite
            end
            object sbContrattoRinnova: TSpeedButton
              Left = 570
              Top = 124
              Width = 72
              Height = 14
              Cursor = crHandPoint
              Caption = 'Rinnova'
              Enabled = False
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = sbContrattoRinnovaClick
            end
            object Label339: TLabel
              Left = 401
              Top = 66
              Width = 31
              Height = 12
              Caption = 'sconti'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label340: TLabel
              Left = 527
              Top = 66
              Width = 61
              Height = 12
              Caption = 'prezzo netto'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label342: TLabel
              Left = 507
              Top = 84
              Width = 83
              Height = 12
              Caption = 'netto IVA comp.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label344: TLabel
              Left = 290
              Top = 84
              Width = 38
              Height = 12
              Caption = 'aliq.Iva'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Contratto_Stato: TcxDBRadioGroup
              Left = 6
              Top = 22
              Cursor = crHandPoint
              Caption = ' L'#39'impianto '#232'  attualmente in abbonamento ? '
              DataBinding.DataField = 'CONTRATTO_STATO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Caption = 'SI'
                  Value = 'T'
                end
                item
                  Caption = 'NO'
                  Value = 'F'
                end
                item
                  Caption = 'Sospeso  per                 mesi dal'
                  Value = 'S'
                end
                item
                  Caption = 'Dismesso dal'
                  Value = 'D'
                end>
              Properties.ReadOnly = False
              Style.BorderColor = clGray
              Style.BorderStyle = ebsSingle
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              TabOrder = 0
              Height = 83
              Width = 279
            end
            object Contratto_SospesoMesi: TcxDBComboBox
              Left = 101
              Top = 68
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_SOSP_MESI'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 46
            end
            object Contratto_SospesoDal: TcxDBDateEdit
              Left = 192
              Top = 68
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_SOSP_DATA'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_DismessoDal: TcxDBDateEdit
              Left = 104
              Top = 84
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_DISMESSO_DATA'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_Numero: TcxDBTextEdit
              Left = 358
              Top = 17
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_NUMERO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 60
            end
            object Contratto_DataStipula: TcxDBDateEdit
              Left = 488
              Top = 17
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_DATASTIPULA'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_Mesi: TcxDBComboBox
              Left = 107
              Top = 108
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_MESI'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              TabOrder = 14
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 50
            end
            object Contratto_MesiRinnovo: TcxDBComboBox
              Left = 255
              Top = 108
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_MESI_RINNOVO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 15
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 50
            end
            object Contratto_ValiditaInizio: TcxDBDateEdit
              Left = 417
              Top = 108
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_VALIDITA_INIZIO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 16
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_ValiditaScadenza: TcxDBDateEdit
              Left = 568
              Top = 108
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_VALIDITA_FINE'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 17
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_DisdettaMezzo: TcxDBComboBox
              Left = 292
              Top = 140
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_DISDETTA_MEZZO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.Items.Strings = (
                'Altro'
                'E-mail'
                'Fax'
                'Lettera'
                'Raccomandata'
                'Raccomandata A/R'
                'SMS'
                'Telefono'
                'Verbale')
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 20
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 120
            end
            object Contratto_Importo: TcxDBCurrencyEdit
              Left = 331
              Top = 63
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_IMPORTO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 65
            end
            object Contratto_DisdettaRicevuta: TcxDBCheckBox
              Left = 2
              Top = 138
              Caption = 'Ricevuta disdetta in data'
              DataBinding.DataField = 'CONTRATTO_DISDETTA_RICEVUTA'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.DisplayUnchecked = 'Falso'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.BorderColor = clGray
              Style.BorderStyle = ebsSingle
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              TabOrder = 18
            end
            object Contratto_DisdettaData: TcxDBDateEdit
              Left = 152
              Top = 140
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_DISDETTA_DATARICEZ'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 19
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 90
            end
            object Contratto_Tipo: TcxDBComboBox
              Left = 331
              Top = 35
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_TIPO'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.ImmediatePost = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 327
            end
            object Contratto_Sconto1: TcxDBCurrencyEdit
              Left = 436
              Top = 63
              RepositoryItem = DM1.EdPropQta
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_SCONTO1'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 30
            end
            object Contratto_Sconto2: TcxDBCurrencyEdit
              Left = 464
              Top = 63
              RepositoryItem = DM1.EdPropQta
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_SCONTO2'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 9
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 30
            end
            object Contratto_Sconto3: TcxDBCurrencyEdit
              Left = 492
              Top = 63
              RepositoryItem = DM1.EdPropQta
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_SCONTO3'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 10
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 30
            end
            object Contratto_ImportoNetto: TcxDBCurrencyEdit
              Tag = -1
              Left = 593
              Top = 63
              TabStop = False
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_IMPORTONETTO'
              DataBinding.DataSource = SourceAss
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 11
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 65
            end
            object Contratto_ImportoNettoIvaComp: TcxDBCurrencyEdit
              Left = 593
              Top = 81
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_IMPORTONETTOIVACOMP'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = #8364' ,0.00;-'#8364' ,0.00'
              Properties.ReadOnly = False
              Style.BorderColor = clGray
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.IsFontAssigned = True
              TabOrder = 13
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              OnKeyPress = Contratto_ImportoKeyPress
              Height = 18
              Width = 65
            end
            object Contratto_CodiceIVA: TcxDBLookupComboBox
              Left = 331
              Top = 81
              AutoSize = False
              DataBinding.DataField = 'CONTRATTO_CODICEIVA'
              DataBinding.DataSource = SourceAss
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownAutoSize = True
              Properties.DropDownRows = 20
              Properties.DropDownSizeable = True
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'CODICEIVA'
              Properties.ListColumns = <
                item
                  Caption = 'Codice'
                  Fixed = True
                  HeaderAlignment = taCenter
                  SortOrder = soAscending
                  Width = 60
                  FieldName = 'CODICEIVA'
                end
                item
                  Caption = 'Descrizione'
                  HeaderAlignment = taCenter
                  FieldName = 'DESCRIZIONEIVA'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListOptions.GridLines = glVertical
              Properties.ListSource = DM1.SourceAliquoteIVA
              Style.BorderColor = clBlack
              Style.BorderStyle = ebsNone
              Style.Color = 16250871
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.TextColor = clBlack
              Style.ButtonStyle = btsUltraFlat
              Style.IsFontAssigned = True
              TabOrder = 12
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
              Height = 18
              Width = 171
            end
          end
          object PanelProprietarioImpianto: TPanel
            Left = 0
            Top = 713
            Width = 661
            Height = 56
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 17
            Visible = False
            object LabelPanelProprietario: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' PROPRIETARIO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label228: TLabel
              Left = 6
              Top = 17
              Width = 76
              Height = 12
              Caption = 'Nome/Rag.soc.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label229: TLabel
              Left = 6
              Top = 35
              Width = 43
              Height = 12
              Caption = 'Indirizzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label230: TLabel
              Left = 227
              Top = 35
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label234: TLabel
              Left = 503
              Top = 17
              Width = 23
              Height = 12
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label235: TLabel
              Left = 294
              Top = 17
              Width = 40
              Height = 12
              Caption = 'Localit'#224
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label236: TLabel
              Left = 575
              Top = 17
              Width = 47
              Height = 12
              Caption = 'Provincia'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label237: TLabel
              Left = 293
              Top = 35
              Width = 18
              Height = 12
              Caption = 'Tel.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label239: TLabel
              Left = 533
              Top = 35
              Width = 19
              Height = 12
              Caption = 'C.F.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object SBProprietario: TSpeedButtonRollOver
              Left = 643
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBProprietarioClick
            end
            object SBEspandiProprietario: TSpeedButtonRollOver
              Left = 626
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiProprietarioClick
            end
            object DBText2: TDBText
              Left = 580
              Top = 0
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CODICEPROP'
              DataSource = SourceAss
              DragMode = dmAutomatic
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label240: TLabel
              Left = 411
              Top = 35
              Width = 23
              Height = 12
              Caption = 'Cell.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBEdit52: TDBEdit
              Left = 86
              Top = 17
              Width = 200
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGSOCPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit53: TDBEdit
              Left = 52
              Top = 35
              Width = 170
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZOPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit54: TDBEdit
              Left = 242
              Top = 35
              Width = 44
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICOPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit58: TDBEdit
              Left = 529
              Top = 17
              Width = 40
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit59: TDBEdit
              Left = 337
              Top = 17
              Width = 160
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTAPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit60: TDBEdit
              Left = 626
              Top = 17
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIAPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit61: TDBEdit
              Left = 315
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONOPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit63: TDBEdit
              Left = 556
              Top = 35
              Width = 100
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALEPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit64: TDBEdit
              Left = 438
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULAREPROP'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelOccupanteImpianto: TPanel
            Left = 0
            Top = 776
            Width = 661
            Height = 56
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 18
            Visible = False
            object Label231: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' UTENTE / OCCUPANTE'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label232: TLabel
              Left = 6
              Top = 17
              Width = 76
              Height = 12
              Caption = 'Nome/Rag.soc.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label233: TLabel
              Left = 6
              Top = 35
              Width = 43
              Height = 12
              Caption = 'Indirizzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label238: TLabel
              Left = 227
              Top = 35
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label255: TLabel
              Left = 503
              Top = 17
              Width = 23
              Height = 12
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label256: TLabel
              Left = 294
              Top = 17
              Width = 40
              Height = 12
              Caption = 'Localit'#224
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label257: TLabel
              Left = 575
              Top = 17
              Width = 47
              Height = 12
              Caption = 'Provincia'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label258: TLabel
              Left = 293
              Top = 35
              Width = 18
              Height = 12
              Caption = 'Tel.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label259: TLabel
              Left = 533
              Top = 35
              Width = 19
              Height = 12
              Caption = 'C.F.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label260: TLabel
              Left = 411
              Top = 35
              Width = 23
              Height = 12
              Caption = 'Cell.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBText4: TDBText
              Left = 580
              Top = 0
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CODICEUT'
              DataSource = SourceAss
              DragMode = dmAutomatic
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object SBEspandiOccupante: TSpeedButtonRollOver
              Left = 626
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiOccupanteClick
            end
            object SBOccupante: TSpeedButtonRollOver
              Left = 643
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBOccupanteClick
            end
            object DBEdit55: TDBEdit
              Left = 86
              Top = 17
              Width = 200
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGSOCUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit56: TDBEdit
              Left = 52
              Top = 35
              Width = 170
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZOUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit57: TDBEdit
              Left = 242
              Top = 35
              Width = 44
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICOUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit62: TDBEdit
              Left = 529
              Top = 17
              Width = 40
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit78: TDBEdit
              Left = 337
              Top = 17
              Width = 160
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTAUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit79: TDBEdit
              Left = 626
              Top = 17
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIAUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit80: TDBEdit
              Left = 315
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONOUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit81: TDBEdit
              Left = 556
              Top = 35
              Width = 100
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALEUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit82: TDBEdit
              Left = 438
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULAREUT'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelAmministratoreImpianto: TPanel
            Left = 0
            Top = 834
            Width = 661
            Height = 56
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 19
            Visible = False
            object Label241: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' AMMINISTRATORE'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label242: TLabel
              Left = 6
              Top = 17
              Width = 76
              Height = 12
              Caption = 'Nome/Rag.soc.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label243: TLabel
              Left = 6
              Top = 35
              Width = 43
              Height = 12
              Caption = 'Indirizzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label244: TLabel
              Left = 227
              Top = 35
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label245: TLabel
              Left = 503
              Top = 17
              Width = 23
              Height = 12
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label246: TLabel
              Left = 294
              Top = 17
              Width = 40
              Height = 12
              Caption = 'Localit'#224
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label247: TLabel
              Left = 575
              Top = 17
              Width = 47
              Height = 12
              Caption = 'Provincia'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBText5: TDBText
              Left = 580
              Top = 0
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CODICEINST'
              DataSource = SourceAss
              DragMode = dmAutomatic
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object SBEspandiInstallatore: TSpeedButtonRollOver
              Left = 626
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiInstallatoreClick
            end
            object SBInstallatore: TSpeedButtonRollOver
              Left = 643
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBInstallatoreClick
            end
            object Label27: TLabel
              Left = 293
              Top = 35
              Width = 18
              Height = 12
              Caption = 'Tel.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label30: TLabel
              Left = 533
              Top = 35
              Width = 19
              Height = 12
              Caption = 'C.F.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label31: TLabel
              Left = 411
              Top = 35
              Width = 23
              Height = 12
              Caption = 'Cell.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBEdit65: TDBEdit
              Left = 86
              Top = 17
              Width = 200
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGSOCINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit66: TDBEdit
              Left = 52
              Top = 35
              Width = 170
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZOINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit67: TDBEdit
              Left = 242
              Top = 35
              Width = 44
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICOINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit68: TDBEdit
              Left = 529
              Top = 17
              Width = 40
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAPINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit69: TDBEdit
              Left = 337
              Top = 17
              Width = 160
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTAINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit70: TDBEdit
              Left = 626
              Top = 17
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIAINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit2: TDBEdit
              Left = 315
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONOINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit3: TDBEdit
              Left = 556
              Top = 35
              Width = 100
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALEINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit4: TDBEdit
              Left = 438
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULAREINST'
              DataSource = SourceAss
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelSoggetto: TPanel
            Left = 0
            Top = 898
            Width = 661
            Height = 56
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 20
            Visible = False
            object Label36: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' SOGGETTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label37: TLabel
              Left = 6
              Top = 17
              Width = 76
              Height = 12
              Caption = 'Nome/Rag.soc.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label38: TLabel
              Left = 6
              Top = 35
              Width = 43
              Height = 12
              Caption = 'Indirizzo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label39: TLabel
              Left = 227
              Top = 35
              Width = 11
              Height = 12
              Caption = 'n'#176
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label40: TLabel
              Left = 503
              Top = 17
              Width = 23
              Height = 12
              Caption = 'CAP'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label41: TLabel
              Left = 294
              Top = 17
              Width = 40
              Height = 12
              Caption = 'Localit'#224
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label42: TLabel
              Left = 575
              Top = 17
              Width = 47
              Height = 12
              Caption = 'Provincia'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBText6: TDBText
              Left = 580
              Top = 0
              Width = 36
              Height = 14
              Alignment = taCenter
              DataField = 'CODICE'
              DataSource = SourceSogg
              DragMode = dmAutomatic
              Font.Charset = ANSI_CHARSET
              Font.Color = 13421772
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object SpeedButtonRollOver1: TSpeedButtonRollOver
              Left = 626
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200B8695B00BD776B00BD786D00BD786D00BD786D00B868
                5B00E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E3DEDD00E4DFDF00E4DFDF00E4DFDF00E4DFDF00E3DEDD00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00B6665C00B971
                6D00B9726F00B9726F00B9726F00B6665C00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF00B1605C00AE656D00AD666F00AD66
                6F00AD666F00B1605C009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF00B1605C00AE656D00AD666F00AD666F00AD666F00B160
                5C009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F400E9F2
                F400BE796D00E3E2E200E9F2F400E9F2F400E9F2F400BE796D00E9F2F400E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E9ECED00E5E0E000E8EA
                EB00E9ECED00E9ECED00E9ECED00E5E0E000E9ECED00E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF00C2C2FF00B7706F00C1B7EC00C2C2FF00C2C2
                FF00C2C2FF00B7706F00C2C2FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF00A1A1FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B069
                6F00A1A1FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF00A1A1
                FF00B0696F00A39AEC00A1A1FF00A1A1FF00A1A1FF00B0696F00A1A1FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F600ECF5F600BF796D00E6E5
                E400ECF5F600ECF5F600ECF5F600BF796D00ECF5F600ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00EAEDEE00E6E1E100E9EBEC00EAEDEE00EAED
                EE00EAEDEE00E6E1E100EAEDEE00EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF00B4B4FF00B46D6F00B4ABEC00B4B4FF00B4B4FF00B4B4FF00B46D
                6F00B4B4FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0
                FF00B36C6F00B0A7EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF00B0B0FF00B36C6F00B0A7
                EC00B0B0FF00B0B0FF00B0B0FF00B36C6F00B0B0FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800BF786C00E4D7D500EAE7E600EAE7
                E600EAE7E600BF786C00F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00E6E2E100EAEBEB00EAECEC00EAECEC00EAECEC00E6E2
                E100EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00B26A6D00AA98DB00A89FEC00A89FEC00A89FEC00B26A6D00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEAC
                DB00BFB5EC00BFB5EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00B66E6D00BEACDB00BFB5EC00BFB5
                EC00BFB5EC00B66E6D00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00BA6A5D00C0786C00C07A6E00C07A6E00C07A6E00BA6A
                5C00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00E8E1E000E8E3E200E8E3E200E8E3E200E8E3E200E8E1E000EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF00B2625D00AF67
                6D00AF686F00AF686F00AF686F00B2615C009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B972
                6F00B9726F00B6665C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00B7665D00B9716D00B9726F00B9726F00B9726F00B666
                5C00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00E8E0DE00E8E0
                DE00E8E0DE00E8E0DE00E8E0DE00E8E0DE00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF00B45C4D00B45C4D00B45C4D00B45C
                4D00B45C4D00B45C4D008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C
                4D00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00B45C4D00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBEspandiSoggettoClick
            end
            object SBSoggImpianto: TSpeedButtonRollOver
              Left = 643
              Top = 1
              Width = 14
              Height = 14
              Cursor = crHandPoint
              Enabled = False
              Glyph.Data = {
                860F0000424D860F0000000000003600000028000000460000000E0000000100
                200000000000500F000000000000000000000000000000000000E9E9E900E9E9
                E900E9E9E900E3E5E600BDC9CC00A5B5B90099A9AD0099A9AD00A5B5B900BDC9
                CC00E4E5E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E7E8
                E800D9DEDF00D1D7D800CDD3D400CDD3D400D1D7D800DADEDF00E7E8E800E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E6E6E700C7CED000ACB8
                BC009AA9AD009AA9AD00ACB8BC00C7CED000E6E7E700E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7
                AD00919EBC009DA4D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900DCDDE7009DA4D000919EBC0098A7AD0098A7AD00919EBC009DA4
                D000DDDDE700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900C8D1D3009EAD
                B100A5B5B800BFCFD200D2E2E500CFDFE200BCCBCF00A7B6BA009EADB100C8D1
                D300E9E9E900E9E9E900E9E9E900E9E9E900DDE1E100CFD4D500D1D7D800DAE0
                E100E1E7E800E0E6E700D9DFE000D2D7D900CFD4D500DDE1E100E9E9E900E9E9
                E900E9E9E900E9E9E900CFD4D700A0AEB200ABB7BC00D1D7DC00ECEEF500E8EB
                F100CCD3D800ADB9BE00A0AEB200CFD4D800E9E9E900E9E9E900E9E9E900E9E9
                E900ABB0D70095A3B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99
                BE0095A3B200ABB1D800E9E9E900E9E9E900E9E9E900E9E9E900ABB0D70095A3
                B2008E9ABC00787FDC00686AF5006A6DF1007B82D8008D99BE0095A3B200ABB1
                D800E9E9E900E9E9E900E9E9E900C9D2D4009EADB100C4D2D600DCEAED00DEEC
                EF00DEECEF00DEECEF00DEECEF00DBE9EC00C0CED2009DACB000C9D2D400E9E9
                E900E9E9E900DEE1E200CFD4D500DCE1E200E4E9EA00E5EAEB00E5EAEB00E5EA
                EB00E5EAEB00E4E9EA00DBE0E100CED4D500DEE1E200E9E9E900E9E9E900CCD1
                D8009FADB200CBD1DF00E8E8FD00EAEAFF00EAEAFF00EAEAFF00EAEAFF00E7E7
                FC00C6CDDB009EACB100CCD1D800E9E9E900E9E9E900AFB4D80096A4B2008086
                DF007272FD007171FF007171FF007171FF007171FF007373FC008389DB0096A5
                B100AFB4D800E9E9E900E9E9E900AFB4D80096A4B2008086DF007272FD007171
                FF007171FF007171FF007171FF007373FC008389DB0096A5B100AFB4D800E9E9
                E900E4E5E6009FADB100C6D4D700E1EEF100E1EEF100E1EEF100E1EEF100E1EE
                F100E1EEF100E1EEF100E1EEF100C3D1D4009EADB100E4E5E600E7E8E800CFD4
                D500DDE2E300E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EBEC00E6EB
                EC00E6EBEC00DCE1E200CFD4D500E7E8E800E4E5E7009EACB300C4C9E000DDDD
                FF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00DDDDFF00C0C7
                DC009EACB200E4E5E700DFDFE70097A5B3008A90E0008181FF008181FF008181
                FF008181FF008181FF008181FF008181FF008181FF008B91DC0097A5B200DFDF
                E700DFDFE70097A5B3008A90E0008181FF008181FF008181FF008181FF008181
                FF008181FF008181FF008181FF008B91DC0097A5B200DFDFE700C1CACD00ABBA
                BD00E3EEF000E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0F200E5F0
                F200E5F0F200E2EDF000A7B5B900C1CACD00DBDEDF00D3D9DA00E7EBEB00E8EB
                EC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E8EBEC00E7EA
                EB00D2D7D800DBDEDF00BCC2D000A6B2C000CFCFFD00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00CECFFC00A3AFBB00BBC2
                D000ABB3D00097A2C0009091FD009090FF009090FF009090FF009090FF009090
                FF009090FF009090FF009090FF009091FC0097A4BB00ABB2D000ABB3D00097A2
                C0009091FD009090FF009090FF009090FF009090FF009090FF009090FF009090
                FF009090FF009091FC0097A4BB00ABB2D000A8B6BA00CBD6D900E9F2F4002122
                FD002122FD00E9F2F4000000FF000000FF00E9F2F4000000FF000000FF00E9F2
                F400C5D0D300A8B6BA00D2D7D800DFE2E300E9ECED00E0E3E400E0E3E400E9EC
                ED00DEE1E200DEE1E200E9ECED00DEE1E200DEE1E200E9ECED00DCE0E100D2D7
                D800A3AEBC00B3B8E000C2C2FF001B1BFF001B1BFF00C2C2FF000000FF000000
                FF00C2C2FF000000FF000000FF00C2C2FF00AFB6D900A3AEBC009DA9BC009EA4
                E000A1A1FF001717FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000
                FF000000FF00A1A1FF009DA4D9009DA9BC009DA9BC009EA4E000A1A1FF001717
                FF001717FF00A1A1FF000000FF000000FF00A1A1FF000000FF000000FF00A1A1
                FF009DA4D9009DA9BC0099A8AC00E4EDEF00ECF5F6002123FE002123FE00ECF5
                F6000000FF000000FF00ECF5F6000000FF000000FF00ECF5F600E2ECED0099A8
                AC00CDD2D400E7EAEB00EAEDEE00E1E4E400E1E4E400EAEDEE00DFE2E300DFE2
                E300EAEDEE00DFE2E300DFE2E300EAEDEE00E7EAEA00CDD2D40099A8AC00B1B3
                F700B4B4FF001919FF001919FF00B4B4FF000000FF000000FF00B4B4FF000000
                FF000000FF00B4B4FF00B1B3F50099A8AC0099A8AC00AEAFF700B0B0FF001919
                FF001919FF00B0B0FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0
                FF00ADAFF50099A8AC0099A8AC00AEAFF700B0B0FF001919FF001919FF00B0B0
                FF000000FF000000FF00B0B0FF000000FF000000FF00B0B0FF00ADAFF50099A8
                AC0099A8AC00EBF2F300F0F7F800F0F7F800F0F7F800F0F7F800F0F7F800F0F7
                F800F0F7F800F0F7F800F0F7F800F0F7F800E4ECEE0099A8AC00CDD2D400EAEC
                EC00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEEEE00EBEE
                EE00EBEEEE00EBEEEE00E7EAEB00CDD2D40099A8AC00A6A7FA00A7A7FF00A7A7
                FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7FF00A7A7
                FF00A5A7F40099A8AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8
                AC0099A8AC00BEBEFA00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00C0C0
                FF00C0C0FF00C0C0FF00C0C0FF00C0C0FF00BBBDF40099A8AC00AAB7BB00D2DB
                DD00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9FA00F4F9
                FA00F4F9FA00F4F9FA00CDD7D900AAB7BB00D3D7D900E1E4E500EDEFEF00EDEF
                EF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEFEF00EDEF
                EF00DFE3E300D3D7D9009CA8BC00999FE0009999FF009999FF009999FF009999
                FF009999FF009999FF009999FF009999FF009999FF009999FF00999FDC009CA8
                BC00A5B1BC00BCC1E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00A5B1BC00BCC1
                E000D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0FF00D0D0
                FF00D0D0FF00D0D0FF00B9BFDC00A5B1BC00C5CDD000AFBBBE00F6F9F900F8FB
                FB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F8FBFB00F5F8
                F900AEBABD00C5CDD000DCDFE000D5D9DA00EEEFEF00EEEFEF00EEEFEF00EEEF
                EF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EEEFEF00EDEEEF00D4D9DA00DCDF
                E000AAB2D00096A2BF008C8DFD008C8CFF008C8CFF008C8CFF008C8CFF008C8C
                FF008C8CFF008C8CFF008C8CFF008C8DFC0096A2BE00AAB2D000BFC7D000A9B5
                BF00DEDFFD00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0
                FF00E0E0FF00DEDEFC00A9B4BE00BFC7D000BFC7D000A9B5BF00DEDFFD00E0E0
                FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00E0E0FF00DEDE
                FC00A9B4BE00BFC7D000E5E6E600A0AEB200DAE0E200FBFDFD00FBFDFD00FBFD
                FD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00FBFDFD00D4DBDD00A0AEB200E5E6
                E600E8E8E800D0D4D600E4E6E700EFF0F000EFF0F000EFF0F000EFF0F000EFF0
                F000EFF0F000EFF0F000EFF0F000E2E4E500D0D4D600E8E8E800DEDFE60097A5
                B200878CE3007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7EFF007E7E
                FF007E7EFF00898FDE0097A5B200DEDFE600E4E5E6009FADB200D2D7E300EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3
                DE009FADB200E4E5E600E4E5E6009FADB200D2D7E300EFEFFF00EFEFFF00EFEF
                FF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00EFEFFF00CDD3DE009FADB200E4E5
                E600E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E1E2
                E300D1D5D600E5E7E700F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F0F0
                F000E4E6E600D0D4D600E1E2E300E9E9E900E9E9E900AFB5D70095A2B4007E83
                E4007272FE007171FF007171FF007171FF007171FF007272FD007F85E10096A4
                B200AFB5D700E9E9E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9
                E900E9E9E900D1D6D700A3B1B400DDE2E400FDFEFE00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FDFDFD00DBE0E100A0AEB200D1D6D700E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E1E2E300D0D5
                D600D7DBDC00E5E7E700EEEFEF00EFEFEF00E3E6E600D5D9DA00D0D4D600E1E2
                E300E9E9E900E9E9E900E9E9E900E9E9E900AFB5D70096A4B3008E99C3007E83
                E4007475F9007474FA008085E000909BBF0096A4B200AFB5D700E9E9E900E9E9
                E900E9E9E900E9E9E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FA
                FA00D9DFE000B1BCBF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9
                E900D1D6D700A1AFB300B5C0C300DDE2E400F7F9F900F9FAFA00D9DFE000B1BC
                BF00A1AEB200D1D6D700E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800DDE0E000D4D8
                D900CDD2D400CDD2D400D4D8D900DDE0E000E8E8E800E9E9E900E9E9E900E9E9
                E900E9E9E900E9E9E900E9E9E900DDDEE600A3AAD00095A2BC0099A8AC0099A8
                AC0095A2BC00A3AAD000DDDEE600E9E9E900E9E9E900E9E9E900E9E9E900E9E9
                E900E9E9E900E5E6E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CE
                D000E5E6E600E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E5E6
                E600C7CED000ACB8BC0099A8AC0099A8AC00ACB8BC00C7CED000E5E6E600E9E9
                E900E9E9E900E9E9E900}
              OnClick = SBSoggettoClick
            end
            object Label43: TLabel
              Left = 293
              Top = 35
              Width = 18
              Height = 12
              Caption = 'Tel.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label44: TLabel
              Left = 533
              Top = 35
              Width = 19
              Height = 12
              Caption = 'C.F.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label45: TLabel
              Left = 411
              Top = 35
              Width = 23
              Height = 12
              Caption = 'Cell.'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object DBEdit1: TDBEdit
              Left = 86
              Top = 17
              Width = 200
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'RAGIONESOCIALE'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit5: TDBEdit
              Left = 52
              Top = 35
              Width = 170
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'INDIRIZZO'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit6: TDBEdit
              Left = 242
              Top = 35
              Width = 44
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'NUMCIVICO'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit10: TDBEdit
              Left = 529
              Top = 17
              Width = 40
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CAP'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit15: TDBEdit
              Left = 337
              Top = 17
              Width = 160
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CITTA'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit17: TDBEdit
              Left = 626
              Top = 17
              Width = 30
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'PROVINCIA'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit18: TDBEdit
              Left = 315
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'TELEFONO'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit19: TDBEdit
              Left = 556
              Top = 35
              Width = 100
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CODICEFISCALE'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object DBEdit20: TDBEdit
              Left = 438
              Top = 35
              Width = 90
              Height = 14
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'CELLULARE'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
          object PanelNoteSoggetto: TPanel
            Left = 0
            Top = 956
            Width = 661
            Height = 147
            BevelOuter = bvNone
            Color = 15329769
            ParentBackground = False
            TabOrder = 21
            Visible = False
            object Label46: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' NOTE SOGGETTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object dbeNoteSoggetto: TDBMemo
              Left = 7
              Top = 17
              Width = 649
              Height = 60
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = 16250871
              DataField = 'NOTE'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 1
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
            object PanelCheckNotePrivateSoggetto: TPanel
              Left = 552
              Top = -1
              Width = 105
              Height = 14
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object cbVediNotePrivateSoggetto: TcxCheckBox
                Left = -2
                Top = -3
                AutoSize = False
                Caption = 'Vedi note private'
                ParentFont = False
                Properties.Alignment = taRightJustify
                Properties.OnChange = cbVediNotePrivateSoggettoPropertiesChange
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Verdana'
                Style.Font.Style = []
                Style.TextColor = clMaroon
                Style.IsFontAssigned = True
                TabOrder = 0
                Height = 21
                Width = 111
              end
            end
            object dbeNotePrivateSoggetto: TDBMemo
              Tag = -1
              Left = 7
              Top = 82
              Width = 649
              Height = 60
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = 13816575
              DataField = 'NOTEPRIVATE'
              DataSource = SourceSogg
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 2
              OnEnter = DBEdit1Enter
              OnExit = DBEdit1Exit
            end
          end
        end
      end
      object TabOP: TcxTabSheet
        Caption = 'Operazioni pianificate'
        ImageIndex = 1
        DesignSize = (
          715
          608)
        object PanelOP: TPanel
          Left = 0
          Top = 10
          Width = 686
          Height = 593
          Anchors = [akLeft, akTop, akBottom]
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            686
            593)
          object LabelOP: TLabel
            Left = 0
            Top = 0
            Width = 686
            Height = 13
            Align = alTop
            AutoSize = False
            Caption = ' OPERAZIONI PIANIFICATE'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object GridOP: TcxGrid
            Left = 10
            Top = 25
            Width = 665
            Height = 556
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clGray
            RootLevelOptions.DetailFrameWidth = 1
            object btvOP: TcxGridDBBandedTableView
              PopupMenu = MenuOP
              Navigator.Buttons.CustomButtons = <>
              FilterBox.Visible = fvNever
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawCell = btvOPCustomDrawCell
              OnEditing = btvOPEditing
              DataController.DataSource = SourceOP
              DataController.DetailKeyFieldNames = 'ID'
              DataController.KeyFieldNames = 'ID'
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GridLineColor = 12303291
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.BandHeaders = False
              OptionsView.FixedBandSeparatorColor = 10066329
              Styles.Content = DM1.tvContentGrayArial8
              Styles.ContentEven = DM1.tvContentOdd
              Styles.ContentOdd = DM1.tvContentEven
              Styles.StyleSheet = DM1.btvGCMaster
              OnCustomDrawGroupCell = btvOPCustomDrawGroupCell
              Bands = <
                item
                  Caption = 'Operazioni pianificate'
                  Options.HoldOwnColumnsOnly = True
                  Width = 448
                end
                item
                  Caption = 'Periodicit'#224
                  Options.HoldOwnColumnsOnly = True
                  Options.Sizing = False
                  Width = 105
                end
                item
                  Caption = 'Prezzo'
                  Options.HoldOwnColumnsOnly = True
                  Width = 190
                end
                item
                  Caption = 'Altro'
                  Options.HoldOwnColumnsOnly = True
                  Options.Sizing = False
                  Width = 30
                end>
              object btvOPID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPIDIMPEGNO: TcxGridDBBandedColumn
                Caption = 'ID doc.'
                DataBinding.FieldName = 'IDIMPEGNO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPIDPRATICA: TcxGridDBBandedColumn
                Caption = 'ID prat./imp.'
                DataBinding.FieldName = 'IDPRATICA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvOPIDOPPRATICA: TcxGridDBBandedColumn
                Caption = 'ID op.'
                DataBinding.FieldName = 'IDOPPRATICA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 40
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object btvOPIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.DropDownAutoSize = True
                Properties.DropDownSizeable = True
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    Caption = 'Tipo'
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    Width = 110
                    FieldName = 'TIPOAPPARECCHIO'
                  end
                  item
                    Caption = 'Apparecchio'
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    Width = 300
                    FieldName = 'COMPUTED_APPARECCHIO_FULL'
                  end
                  item
                    Caption = 'Costruito'
                    HeaderAlignment = taCenter
                    Width = 60
                    FieldName = 'ANNOCOSTRUZIONE'
                  end
                  item
                    Caption = 'Installato'
                    HeaderAlignment = taCenter
                    Width = 70
                    FieldName = 'DATAINSTALLAZIONE'
                  end
                  item
                    Caption = 'Collaudo'
                    HeaderAlignment = taCenter
                    Width = 70
                    FieldName = 'DATACOLLAUDO'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListSource = SourcePratApp
                Visible = False
                GroupIndex = 0
                HeaderAlignmentHorz = taCenter
                SortIndex = 0
                SortOrder = soAscending
                VisibleForCustomization = False
                Width = 250
                Position.BandIndex = 0
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
              object btvOPIDOP: TcxGridDBBandedColumn
                Caption = 'Codice'
                DataBinding.FieldName = 'IDOP'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                BestFitMaxWidth = 60
                HeaderAlignmentHorz = taCenter
                MinWidth = 60
                Options.HorzSizing = False
                Width = 60
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.LineCount = 2
                Position.RowIndex = 0
              end
              object btvOPDESCRIZIONE: TcxGridDBBandedColumn
                Caption = 'Descrizione'
                DataBinding.FieldName = 'DESCRIZIONE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = False
                HeaderAlignmentHorz = taCenter
                Width = 200
                Position.BandIndex = 0
                Position.ColIndex = 7
                Position.LineCount = 2
                Position.RowIndex = 0
              end
              object btvOPDAEFFETTUARE: TcxGridDBBandedColumn
                Caption = 'Da fare'
                DataBinding.FieldName = 'DAEFFETTUARE'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                BestFitMaxWidth = 42
                HeaderAlignmentHorz = taCenter
                MinWidth = 25
                Options.HorzSizing = False
                Width = 25
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.LineCount = 2
                Position.RowIndex = 0
              end
              object btvOPEFFETTUATA: TcxGridDBBandedColumn
                Caption = 'fatto'
                DataBinding.FieldName = 'EFFETTUATA'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                BestFitMaxWidth = 42
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.HorzSizing = False
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.LineCount = 2
                Position.RowIndex = 0
              end
              object btvOPMINUTIPREVISTI: TcxGridDBBandedColumn
                Caption = 'Min'
                DataBinding.FieldName = 'MINUTIPREVISTI'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPERIODICITAGetDisplayText
                BestFitMaxWidth = 25
                HeaderAlignmentHorz = taCenter
                MinWidth = 40
                Options.HorzSizing = False
                Width = 40
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 1
              end
              object btvOPPERIODICITA: TcxGridDBBandedColumn
                Caption = 'Period.'
                DataBinding.FieldName = 'PERIODICITA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPERIODICITAGetDisplayText
                BestFitMaxWidth = 40
                HeaderAlignmentHorz = taCenter
                MinWidth = 40
                Options.HorzSizing = False
                Width = 40
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPULTIMA: TcxGridDBBandedColumn
                Caption = 'Ultima'
                DataBinding.FieldName = 'ULTIMA'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ReadOnly = True
                Properties.ShowTime = False
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPULTIMAGetDisplayText
                BestFitMaxWidth = 65
                HeaderAlignmentHorz = taCenter
                MinWidth = 65
                Options.HorzSizing = False
                Width = 65
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPPROSSIMA: TcxGridDBBandedColumn
                Caption = 'Prox. entro'
                DataBinding.FieldName = 'PROSSIMA'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ReadOnly = True
                Properties.ShowTime = False
                OnCustomDrawCell = btvOPPROSSIMACustomDrawCell
                OnGetDisplayText = btvOPULTIMAGetDisplayText
                BestFitMaxWidth = 65
                HeaderAlignmentHorz = taCenter
                MinWidth = 65
                Options.HorzSizing = False
                Width = 65
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 1
              end
              object btvOPTIPOAPPARECCHIO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'TIPOAPPARECCHIO'
                  end>
                Properties.ListSource = SourcePratApp
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 9
                Position.RowIndex = 0
              end
              object btvOPCOSTRUTTORE: TcxGridDBBandedColumn
                Caption = 'COSTRUTTORE'
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'COSTRUTTORE'
                  end>
                Properties.ListSource = SourcePratApp
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 10
                Position.RowIndex = 0
              end
              object btvOPMODELLO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'MODELLO'
                  end>
                Properties.ListSource = SourcePratApp
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 11
                Position.RowIndex = 0
              end
              object btvOPMATRICOLA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'MATRICOLA'
                  end>
                Properties.ListSource = SourcePratApp
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 12
                Position.RowIndex = 0
              end
              object btvOPUBICAZIONE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'UBICAZIONE'
                  end>
                Properties.ListSource = SourcePratApp
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 13
                Position.RowIndex = 0
              end
              object btvOPPRZUNIT: TcxGridDBBandedColumn
                Caption = 'Prezzo'
                DataBinding.FieldName = 'PRZUNIT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITGetDisplayText
                BestFitMaxWidth = 45
                HeaderAlignmentHorz = taCenter
                MinWidth = 65
                Options.HorzSizing = False
                Width = 65
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPSCONTO1: TcxGridDBBandedColumn
                Caption = 'S1'
                DataBinding.FieldName = 'SCONTO1'
                RepositoryItem = DM1.EdPropQta
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITGetDisplayText
                HeaderAlignmentHorz = taCenter
                Options.HorzSizing = False
                Width = 20
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvOPSCONTO2: TcxGridDBBandedColumn
                Caption = 'S2'
                DataBinding.FieldName = 'SCONTO2'
                RepositoryItem = DM1.EdPropQta
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITGetDisplayText
                HeaderAlignmentHorz = taCenter
                Options.HorzSizing = False
                Width = 20
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvOPSCONTO3: TcxGridDBBandedColumn
                Caption = 'S3'
                DataBinding.FieldName = 'SCONTO3'
                RepositoryItem = DM1.EdPropQta
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITGetDisplayText
                HeaderAlignmentHorz = taCenter
                Options.HorzSizing = False
                Width = 20
                Position.BandIndex = 2
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object btvOPPRZUNITNETTO: TcxGridDBBandedColumn
                Caption = 'Netto'
                DataBinding.FieldName = 'PRZUNITNETTO'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Properties.ReadOnly = True
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITGetDisplayText
                HeaderAlignmentHorz = taCenter
                MinWidth = 65
                Options.HorzSizing = False
                Width = 65
                Position.BandIndex = 2
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object btvOPCODICEIVA: TcxGridDBBandedColumn
                Caption = 'Aliquota IVA'
                DataBinding.FieldName = 'CODICEIVA'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taBottomJustify
                Properties.DropDownAutoSize = True
                Properties.DropDownRows = 20
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'CODICEIVA'
                Properties.ListColumns = <
                  item
                    Caption = 'Codice'
                    Fixed = True
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    Width = 40
                    FieldName = 'CODICEIVA'
                  end
                  item
                    Caption = 'Descrizione'
                    HeaderAlignment = taCenter
                    FieldName = 'DESCRIZIONEIVA'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListSource = DM1.SourceAliquoteIVA
                OnCustomDrawCell = btvOPCODICEIVACustomDrawCell
                OnGetDisplayText = btvOPCODICEIVAGetDisplayText
                HeaderAlignmentHorz = taCenter
                Width = 64
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 1
              end
              object btvOPALIQUOTAIVA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ALIQUOTAIVA'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 2
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object btvOPPRZUNITIVACOMP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'PRZUNITIVACOMP'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 2
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object btvOPPRZUNITNETTOIVACOMP: TcxGridDBBandedColumn
                Caption = 'Iva comp.'
                DataBinding.FieldName = 'PRZUNITNETTOIVACOMP'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = #8364' ,0.00;-'#8364' ,0.00'
                Properties.ReadOnly = False
                OnCustomDrawCell = btvOPPROSSIMACustomDrawCell
                OnGetDisplayText = btvOPPRZUNITNETTOIVACOMPGetDisplayText
                HeaderAlignmentHorz = taCenter
                MinWidth = 65
                Options.HorzSizing = False
                Width = 65
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 1
              end
              object btvOPADDEBITA: TcxGridDBBandedColumn
                Caption = '+'
                DataBinding.FieldName = 'ADDEBITA'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                BestFitMaxWidth = 15
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.HorzSizing = False
                Styles.Content = DM1.tvDisHeader
                Width = 30
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvOPINABBONAMENTO: TcxGridDBBandedColumn
                Caption = 'Abb.'
                DataBinding.FieldName = 'INABBONAMENTO'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                HeaderAlignmentHorz = taCenter
                MinWidth = 30
                Options.HorzSizing = False
                Styles.Content = DM1.tvDisHeader
                Width = 30
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 1
              end
            end
            object lvOP: TcxGridLevel
              GridView = btvOP
            end
          end
        end
      end
      object TabAllegati: TcxTabSheet
        Caption = 'Allegati'
        ImageIndex = 2
        DesignSize = (
          715
          608)
        object PanelAllegatiFG: TPanel
          Left = 0
          Top = 10
          Width = 686
          Height = 593
          Anchors = [akLeft, akTop, akBottom]
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            686
            593)
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 686
            Height = 13
            Align = alTop
            AutoSize = False
            Caption = ' ALLEGATI'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object GridAll: TcxGrid
            Left = 10
            Top = 25
            Width = 665
            Height = 556
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clGray
            RootLevelOptions.DetailFrameWidth = 1
            object btvAll: TcxGridDBBandedTableView
              PopupMenu = MenuNuovoAllegato
              OnDblClick = btvAllDblClick
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = SourceAllegati
              DataController.DetailKeyFieldNames = 'ID'
              DataController.KeyFieldNames = 'ID'
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.OnDataChanged = btvAllDataControllerDataChanged
              OptionsCustomize.ColumnSorting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsSelection.MultiSelect = True
              OptionsSelection.HideSelection = True
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GridLineColor = 10066329
              OptionsView.GroupByBox = False
              OptionsView.BandHeaders = False
              OptionsView.FixedBandSeparatorColor = 13882323
              Styles.ContentEven = DM1.tvContentEven
              Styles.ContentOdd = DM1.tvContentOdd
              Styles.StyleSheet = DM1.btvGCMaster
              Bands = <
                item
                  Caption = 'Allegati'
                end>
              object btvAllID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 40
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 40
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvAllTIPO: TcxGridDBBandedColumn
                Caption = 'Allegato'
                DataBinding.FieldName = 'TIPO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                MinWidth = 180
                Options.HorzSizing = False
                Width = 180
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvAllGENCAL_ID: TcxGridDBBandedColumn
                Caption = 'ID apparecchio'
                DataBinding.FieldName = 'GENCAL_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 40
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 40
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvAllGENCAL_COSTRUTTORE: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'GENCAL_COSTRUTTORE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                OnGetDisplayText = btvAllGENCAL_COSTRUTTOREGetDisplayText
                HeaderAlignmentHorz = taCenter
                Width = 200
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object btvAllGENCAL_MODELLO: TcxGridDBBandedColumn
                Caption = 'Modello'
                DataBinding.FieldName = 'GENCAL_MODELLO'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object btvAllGENCAL_MATRICOLA: TcxGridDBBandedColumn
                Caption = 'Matricola'
                DataBinding.FieldName = 'GENCAL_MATRICOLA'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object btvAllBRUC_ID: TcxGridDBBandedColumn
                Caption = 'ID bruciatore'
                DataBinding.FieldName = 'BRUC_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 40
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 40
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object btvAllBRUC_COSTRUTTORE: TcxGridDBBandedColumn
                Caption = 'Bruc.costruttore'
                DataBinding.FieldName = 'BRUC_COSTRUTTORE'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object btvAllBRUC_MODELLO: TcxGridDBBandedColumn
                Caption = 'Bruc.modello'
                DataBinding.FieldName = 'BRUC_MODELLO'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
              object btvAllBRUC_MATRICOLA: TcxGridDBBandedColumn
                Caption = 'Bruc.matricola'
                DataBinding.FieldName = 'BRUC_MATRICOLA'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 9
                Position.RowIndex = 0
              end
              object btvAllDATACONTROLLO: TcxGridDBBandedColumn
                Caption = 'Data'
                DataBinding.FieldName = 'DATACONTROLLO'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.SaveTime = False
                Properties.ShowTime = False
                HeaderAlignmentHorz = taCenter
                MinWidth = 80
                Options.HorzSizing = False
                Width = 80
                Position.BandIndex = 0
                Position.ColIndex = 10
                Position.RowIndex = 0
              end
              object btvAllSTATOAVANZAMENTO: TcxGridDBBandedColumn
                Caption = 'Avanzamento'
                DataBinding.FieldName = 'STATOAVANZAMENTO'
                PropertiesClassName = 'TcxRadioGroupProperties'
                Properties.ImmediatePost = True
                Properties.Items = <
                  item
                    Caption = 'Da stampare'
                    Value = 10
                  end
                  item
                    Caption = 'Stampato'
                    Value = 20
                  end
                  item
                    Caption = 'Completato'
                    Value = 30
                  end
                  item
                    Caption = 'Inviato internet'
                    Value = 40
                  end
                  item
                    Caption = 'Consegnato cartaceo'
                    Value = 50
                  end>
                OnCustomDrawCell = btvAllSTATOAVANZAMENTOCustomDrawCell
                HeaderAlignmentHorz = taCenter
                MinWidth = 130
                Options.HorzSizing = False
                Width = 130
                Position.BandIndex = 0
                Position.ColIndex = 11
                Position.RowIndex = 0
              end
            end
            object lvAll: TcxGridLevel
              GridView = btvAll
            end
          end
        end
      end
      object TabInterventiPrecedenti: TcxTabSheet
        Caption = 'Precedenti'
        Color = clWhite
        ImageIndex = 3
        ParentColor = False
        DesignSize = (
          715
          608)
        object PanelPrecInt: TPanel
          Left = 0
          Top = 165
          Width = 686
          Height = 438
          Anchors = [akLeft, akTop, akBottom]
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            686
            438)
          object Label6: TLabel
            Left = 0
            Top = 0
            Width = 686
            Height = 13
            Align = alTop
            AutoSize = False
            Caption = ' INTERVENTI PRECEDENTI'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object GridPrecInt: TcxGrid
            Left = 10
            Top = 25
            Width = 665
            Height = 400
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clGray
            RootLevelOptions.DetailFrameWidth = 1
            object btvPrecInt: TcxGridDBBandedTableView
              Navigator.Buttons.CustomButtons = <>
              FilterBox.Visible = fvNever
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCustomDrawCell = btvPrecIntCustomDrawCell
              DataController.DataSource = SourceIntPrec
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.OnCompare = btvPrecIntDataControllerCompare
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.NoDataToDisplayInfoText = 'Nessun dato disponibile'
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GridLineColor = 10066329
              OptionsView.GridLines = glVertical
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.BandHeaders = False
              OptionsView.FixedBandSeparatorColor = 10066329
              Styles.Content = DM1.tvContentEven
              Styles.StyleSheet = DM1.btvGCMaster
              OnCustomDrawGroupCell = btvPrecIntCustomDrawGroupCell
              Bands = <
                item
                  Caption = 'Interventi precedenti'
                end>
              object btvPrecIntTIPODOC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TIPODOC'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 14
                Position.RowIndex = 0
              end
              object btvPrecIntNUMDOC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'NUMDOC'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 15
                Position.RowIndex = 0
              end
              object btvPrecIntREGDOC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'REGDOC'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 16
                Position.RowIndex = 0
              end
              object btvPrecIntDATADOC: TcxGridDBBandedColumn
                Caption = 'Data'
                DataBinding.FieldName = 'DATADOC'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ImmediatePost = True
                Properties.ShowTime = False
                Visible = False
                HeaderAlignmentHorz = taCenter
                SortIndex = 0
                SortOrder = soDescending
                VisibleForCustomization = False
                Width = 68
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvPrecIntCODICE: TcxGridDBBandedColumn
                Caption = 'Codice'
                DataBinding.FieldName = 'CODICE'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                MinWidth = 90
                Options.HorzSizing = False
                Width = 90
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvPrecIntDESCRIZIONE: TcxGridDBBandedColumn
                Caption = 'Descrizione'
                DataBinding.FieldName = 'DESCRIZIONE'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 306
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object btvPrecIntUM: TcxGridDBBandedColumn
                Caption = 'um'
                DataBinding.FieldName = 'UM'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 25
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object btvPrecIntQTA: TcxGridDBBandedColumn
                Caption = 'Qt'#224
                DataBinding.FieldName = 'QTA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                RepositoryItem = DM1.EdPropQta
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                Styles.Content = DM1.tvContent
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 21
                Position.RowIndex = 0
              end
              object btvPrecIntPRZUNIT: TcxGridDBBandedColumn
                Caption = 'Prz.unit.'
                DataBinding.FieldName = 'PRZUNIT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                Styles.Content = DM1.tvContent
                VisibleForCustomization = False
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object btvPrecIntPRZUNITIVACOMP: TcxGridDBBandedColumn
                Caption = 'Prz.Unit.'
                DataBinding.FieldName = 'PRZUNITIVACOMP'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                Styles.Content = DM1.tvContent
                VisibleForCustomization = False
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object btvPrecIntCALC_PRZUNITNETTO: TcxGridDBBandedColumn
                Caption = 'Prz.unit.'
                DataBinding.FieldName = 'CALC_PRZUNITNETTO'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                Styles.Content = DM1.tvContent
                VisibleForCustomization = False
                Width = 56
                Position.BandIndex = 0
                Position.ColIndex = 18
                Position.RowIndex = 0
              end
              object btvPrecIntCALC_PRZUNITIVACOMPNETTO: TcxGridDBBandedColumn
                Caption = 'Prz.unit.ic'
                DataBinding.FieldName = 'CALC_PRZUNITIVACOMPNETTO'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                MinWidth = 60
                Options.HorzSizing = False
                Styles.Content = DM1.tvContent
                Width = 60
                Position.BandIndex = 0
                Position.ColIndex = 20
                Position.RowIndex = 0
              end
              object btvPrecIntS1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'S1'
                RepositoryItem = DM1.EdPropQta
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object btvPrecIntS2: TcxGridDBBandedColumn
                DataBinding.FieldName = 'S2'
                RepositoryItem = DM1.EdPropQta
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
              object btvPrecIntS3: TcxGridDBBandedColumn
                DataBinding.FieldName = 'S3'
                RepositoryItem = DM1.EdPropQta
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 9
                Position.RowIndex = 0
              end
              object btvPrecIntIMPORTO: TcxGridDBBandedColumn
                Caption = 'Importo'
                DataBinding.FieldName = 'IMPORTO'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 10
                Position.RowIndex = 0
              end
              object btvPrecIntIMPORTOIVACOMP: TcxGridDBBandedColumn
                Caption = 'Importo'
                DataBinding.FieldName = 'IMPORTOIVACOMP'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0.00;-,0.00'
                Visible = False
                OnGetDisplayText = btvPrecIntQTAGetDisplayText
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 50
                Position.BandIndex = 0
                Position.ColIndex = 11
                Position.RowIndex = 0
              end
              object btvPrecIntTECNICO_NOME: TcxGridDBBandedColumn
                Caption = 'Tecnico'
                DataBinding.FieldName = 'TECNICO_NOME'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Width = 101
                Position.BandIndex = 0
                Position.ColIndex = 12
                Position.RowIndex = 0
              end
              object btvPrecIntTIPORECORD: TcxGridDBBandedColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'TIPORECORD'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                HeaderAlignmentHorz = taCenter
                SortIndex = 3
                SortOrder = soAscending
                VisibleForCustomization = False
                Width = 60
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvPrecIntMASTER_ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MASTER_ID'
                Visible = False
                GroupIndex = 0
                SortIndex = 1
                SortOrder = soDescending
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 13
                Position.RowIndex = 0
              end
              object btvPrecIntAPPARECCHIO_FULL: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'APPARECCHIO_FULL'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                OnGetDisplayText = btvPrecIntAPPARECCHIO_FULLGetDisplayText
                HeaderAlignmentHorz = taCenter
                Width = 300
                Position.BandIndex = 0
                Position.ColIndex = 19
                Position.RowIndex = 0
              end
              object btvPrecIntIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                Visible = False
                HeaderAlignmentHorz = taCenter
                SortIndex = 2
                SortOrder = soDescending
                VisibleForCustomization = False
                Width = 30
                Position.BandIndex = 0
                Position.ColIndex = 17
                Position.RowIndex = 0
              end
              object btvPrecIntINABBONAMENTO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INABBONAMENTO'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 22
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_TIPO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_TIPO'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 23
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_NUM: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_NUM'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 24
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_REG: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_REG'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 25
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_DATA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_DATA'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 26
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_CORRISPNOPAG: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_CORRISPNOPAG'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 27
                Position.RowIndex = 0
              end
              object btvPrecIntRIFDOC_TOTALEDOCUMENTO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'RIFDOC_TOTALEDOCUMENTO'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 28
                Position.RowIndex = 0
              end
            end
            object lvPrecInt: TcxGridLevel
              GridView = btvPrecInt
            end
          end
        end
        object PanelPrescrizioni: TPanel
          Left = 0
          Top = 10
          Width = 686
          Height = 148
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            686
            148)
          object Label12: TLabel
            Left = 0
            Top = 0
            Width = 686
            Height = 13
            Align = alTop
            AutoSize = False
            Caption = ' RACCOMANDAZIONI / PRESCRIZIONI'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object GridPresc: TcxGrid
            Left = 10
            Top = 25
            Width = 665
            Height = 110
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            RootLevelOptions.DetailFrameColor = clGray
            RootLevelOptions.DetailFrameWidth = 1
            object btvPresc: TcxGridDBBandedTableView
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnEditing = btvPrescEditing
              DataController.DataModeController.SmartRefresh = True
              DataController.DataSource = SourcePresc
              DataController.KeyFieldNames = 'UNIQUEKEYFIELD'
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.OnDataChanged = btvPrescDataControllerDataChanged
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.FocusRect = False
              OptionsView.NoDataToDisplayInfoText = 'Non ci sono raccomandazioni o prescrizioni'
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GridLineColor = 10066329
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.Header = False
              OptionsView.BandHeaders = False
              OptionsView.FixedBandSeparatorColor = 10066329
              Styles.Content = DM1.tvContentEven
              Styles.Selection = DM1.tvContentEven
              Styles.StyleSheet = DM1.btvGCMaster
              Bands = <
                item
                  Caption = 'Risolto'
                  Width = 10
                end
                item
                  Caption = 'Raccomandazioni / Prescrizioni'
                end>
              object btvPrescCODICE: TcxGridDBBandedColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'CODICE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                OnCustomDrawCell = btvPrescCODICECustomDrawCell
                HeaderAlignmentHorz = taCenter
                Width = 631
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object btvPrescDESCRIZIONE: TcxGridDBBandedColumn
                Caption = 'Descrizione'
                DataBinding.FieldName = 'DESCRIZIONE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                OnCustomDrawCell = btvPrescDESCRIZIONECustomDrawCell
                HeaderAlignmentHorz = taCenter
                Width = 343
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object btvPrescDATADOC: TcxGridDBBandedColumn
                Caption = 'Data'
                DataBinding.FieldName = 'DATADOC'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Properties.ShowTime = False
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 67
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object btvPrescTECNICO_NOME: TcxGridDBBandedColumn
                Caption = 'Tecnico'
                DataBinding.FieldName = 'TECNICO_NOME'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 114
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object btvPrescRISOLTO: TcxGridDBBandedColumn
                Caption = 'Fatto'
                DataBinding.ValueType = 'Boolean'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.Alignment = taCenter
                Properties.AllowGrayed = True
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.OnEditValueChanged = btvPrescRISOLTOPropertiesEditValueChanged
                OnCustomDrawCell = btvPrescRISOLTOCustomDrawCell
                HeaderAlignmentHorz = taCenter
                Styles.Content = DM1.tvContent
                Width = 42
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.LineCount = 3
                Position.RowIndex = 0
              end
              object btvPrescTIPORECORD: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TIPORECORD'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvPrescIDIMPEGNO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDIMPEGNO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvPrescIDALLEGATO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IDALLEGATO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Visible = False
                HeaderAlignmentHorz = taCenter
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvPrescUNIQUEKEYFIELD: TcxGridDBBandedColumn
                DataBinding.FieldName = 'UNIQUEKEYFIELD'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object btvPrescIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
                Caption = 'Apparecchio'
                DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.DropDownAutoSize = True
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    Caption = 'Tipo'
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    Width = 110
                    FieldName = 'TIPOAPPARECCHIO'
                  end
                  item
                    Caption = 'Apparecchio'
                    HeaderAlignment = taCenter
                    SortOrder = soAscending
                    Width = 300
                    FieldName = 'COMPUTED_APPARECCHIO_FULL'
                  end
                  item
                    Caption = 'Costruito'
                    HeaderAlignment = taCenter
                    Width = 60
                    FieldName = 'ANNOCOSTRUZIONE'
                  end
                  item
                    Caption = 'Installado'
                    HeaderAlignment = taCenter
                    Width = 70
                    FieldName = 'DATAINSTALLAZIONE'
                  end
                  item
                    Caption = 'Collaudo'
                    HeaderAlignment = taCenter
                    Width = 70
                    FieldName = 'DATACOLLAUDO'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListSource = SourcePratApp
                Visible = False
                HeaderAlignmentHorz = taCenter
                Width = 250
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object btvPrescFATTO_DATA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FATTO_DATA'
                PropertiesClassName = 'TcxDateEditProperties'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
              object btvPrescFATTO_NOTE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FATTO_NOTE'
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 0
              end
            end
            object lvPresc: TcxGridLevel
              GridView = btvPresc
            end
          end
        end
      end
      object TabMappa: TcxTabSheet
        Caption = 'Mappa'
        ImageIndex = 4
      end
    end
    object PanelAllegati: TPanel
      Left = 0
      Top = 659
      Width = 715
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
    end
    object SplitterAllegati: TcxSplitter
      Left = 0
      Top = 651
      Width = 715
      Height = 8
      Cursor = crVSplit
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 10
      AlignSplitter = salBottom
      AutoPosition = False
      PositionAfterOpen = 165
      AutoSnap = True
      MinSize = 10
      ResizeUpdate = True
      Control = PanelAllegati
      Color = 16768991
      ParentColor = False
    end
  end
  object RE: TcxRichEdit
    Left = 724
    Top = 24
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Color = clLime
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Visible = False
    Height = 89
    Width = 85
  end
  object QryImp: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DeleteSQL.Strings = (
      'DELETE FROM IMPEGNI'
      'WHERE'
      '   ID = :OLD_ID')
    EditSQL.Strings = (
      'UPDATE IMPEGNI SET'
      '      ID = :ID ,'
      '      ParentID = :ParentID ,'
      '      TipoImpegno = :TipoImpegno ,'
      '      EventType = :EventType ,'
      '      START_EVENT = :START_EVENT ,'
      '      FINISH_EVENT = :FINISH_EVENT ,'
      '      Options = :Options ,'
      '      Caption = :Caption ,'
      '      RecurrenceIndex = :RecurrenceIndex ,'
      '      RecurenceInfo = :RecurenceInfo ,'
      '      ResourceID = :ResourceID ,'
      '      Location = :Location ,'
      '      EventMessage = :EventMessage ,'
      '      Reminder = :Reminder ,'
      '      State = :State ,'
      '      LabelColor = :LabelColor ,'
      '      TipoIntervento = :TipoIntervento ,'
      '      DataOraChiamata = :DataOraChiamata ,'
      '      DataOraIntervento = :DataOraIntervento ,'
      '      DataOraIntervento2 = :DataOraIntervento2 ,'
      '      DataOraIntervento3 = :DataOraIntervento3 ,'
      '      DataOraIntervento4 = :DataOraIntervento4 ,'
      '      DataOraIntervento5 = :DataOraIntervento5 ,'
      '      DataOraFineIntervento = :DataOraFineIntervento ,'
      '      DataOraFineIntervento2 = :DataOraFineIntervento2 ,'
      '      DataOraFineIntervento3 = :DataOraFineIntervento3 ,'
      '      DataOraFineIntervento4 = :DataOraFineIntervento4 ,'
      '      DataOraFineIntervento5 = :DataOraFineIntervento5 ,'
      '      RelazioneIntervento = :RelazioneIntervento ,'
      '      Osservazioni = :Osservazioni ,'
      '      Raccomandazioni = :Raccomandazioni ,'
      '      Prescrizioni = :Prescrizioni ,'
      '      Cliente = :Cliente ,'
      '      RagSocCli = :RagSocCli ,'
      '      IndirizzoCli = :IndirizzoCli ,'
      '      CittaCli = :CittaCli ,'
      '      CAPCli = :CAPCli ,'
      '      ProvinciaCli = :ProvinciaCli,'
      '      Pratica = :Pratica ,'
      '      Pratica2 = :Pratica2 ,'
      '      Pratica3 = :Pratica3 ,'
      '      DataPratica1 = :DataPratica1 ,'
      '      DataPratica2 = :DataPratica2 ,'
      '      DataPratica3 = :DataPratica3 ,'
      '      Veicolo = :Veicolo ,'
      '      KmPercorsi = :KmPercorsi,'
      '      SpeseCarburante = :SpeseCarburante ,'
      '      SpeseVitto = :SpeseVitto ,'
      '      SpeseAlloggio = :SpeseAlloggio ,'
      '      SpeseAutostrada = :SpeseAutostrada ,'
      '      SpeseAltre = :SpeseAltre,'
      '      PartitaIvaCli = :PartitaIvaCli ,'
      '      CodiceFiscaleCli = :CodiceFiscaleCli ,'
      '      Registro = :Registro ,'
      '      Agente = :Agente,'
      '      Agente2 = :Agente2,'
      '      Agente3 = :Agente3,'
      '      Agente4 = :Agente4,'
      '      CodiceArticolo = :CodiceArticolo,'
      '      DescrizioneArticolo = :DescrizioneArticolo,'
      '      TelefonoCli = :TelefonoCli,'
      '      CellulareCli = :CellulareCli,'
      '      IDPRATICA = :IDPRATICA,'
      '      MASTER_ID = :MASTER_ID,'
      '      URGENTE = :URGENTE,'
      '      STAMPATO = :STAMPATO,'
      '      FATTO = :FATTO,'
      '      RICHIEDENTE = :RICHIEDENTE,'
      '      RDA = :RDA'
      'WHERE'
      '   ID = :OLD_ID'
      '')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO IMPEGNI'
      '      ('
      '      ID,'
      '      ParentID,'
      '      TipoImpegno,'
      '      EventType,'
      '      START_EVENT,'
      '      FINISH_EVENT,'
      '      Options,'
      '      Caption,'
      '      RecurrenceIndex,'
      '      RecurenceInfo,'
      '      ResourceID,'
      '      Location,'
      '      EventMessage,'
      '      Reminder,'
      '      State,'
      '      LabelColor,'
      '      TipoIntervento,'
      '      DataOraChiamata,'
      '      DataOraIntervento,'
      '      DataOraIntervento2,'
      '      DataOraIntervento3,'
      '      DataOraIntervento4,'
      '      DataOraIntervento5,'
      '      DataOraFineIntervento,'
      '      DataOraFineIntervento2,'
      '      DataOraFineIntervento3,'
      '      DataOraFineIntervento4,'
      '      DataOraFineIntervento5,'
      '      RelazioneIntervento,'
      '      Osservazioni,'
      '      Raccomandazioni,'
      '      Prescrizioni,'
      '      Cliente,'
      '      RagSocCli,'
      '      IndirizzoCli,'
      '      NumCivicoCli,'
      '      CittaCli,'
      '      CAPCli,'
      '      ProvinciaCli,'
      '      Pratica,'
      '      Pratica2,'
      '      Pratica3,'
      '      DataPratica1,'
      '      DataPratica2,'
      '      DataPratica3,'
      '      Veicolo,'
      '      KmPercorsi,'
      '      SpeseCarburante,'
      '      SpeseVitto,'
      '      SpeseAlloggio,'
      '      SpeseAutostrada,'
      '      SpeseAltre,'
      '      PartitaIvaCli,'
      '      CodiceFiscaleCli,'
      '      Registro,'
      '      Agente,'
      '      Agente2,'
      '      Agente3,'
      '      Agente4,'
      '      CodiceArticolo,'
      '      DescrizioneArticolo,'
      '      TelefonoCli,'
      '      CellulareCli,'
      '      IDPRATICA,'
      '      MASTER_ID,'
      '      URGENTE,'
      '      STAMPATO,'
      '      FATTO,'
      '      RICHIEDENTE,'
      '      RDA'
      '      )'
      'VALUES'
      '      ('
      '      :ID,'
      '      :ParentID,'
      '      :TipoImpegno,'
      '      :EventType,'
      '      :START_EVENT,'
      '      :FINISH_EVENT,'
      '      :Options,'
      '      :Caption,'
      '      :RecurrenceIndex,'
      '      :RecurenceInfo,'
      '      :ResourceID,'
      '      :Location,'
      '      :EventMessage,'
      '      :Reminder,'
      '      :State,'
      '      :LabelColor,'
      '      :TipoIntervento,'
      '      :DataOraChiamata,'
      '      :DataOraIntervento,'
      '      :DataOraIntervento2,'
      '      :DataOraIntervento3,'
      '      :DataOraIntervento4,'
      '      :DataOraIntervento5,'
      '      :DataOraFineIntervento,'
      '      :DataOraFineIntervento2,'
      '      :DataOraFineIntervento3,'
      '      :DataOraFineIntervento4,'
      '      :DataOraFineIntervento5,'
      '      :RelazioneIntervento,'
      '      :Osservazioni,'
      '      :Raccomandazioni,'
      '      :Prescrizioni,'
      '      :Cliente,'
      '      :RagSocCli,'
      '      :IndirizzoCli,'
      '      :NumCivicoCli,'
      '      :CittaCli,'
      '      :CAPCli,'
      '      :ProvinciaCli,'
      '      :Pratica,'
      '      :Pratica2,'
      '      :Pratica3,'
      '      :DataPratica1,'
      '      :DataPratica2,'
      '      :DataPratica3,'
      '      :Veicolo,'
      '      :KmPercorsi,'
      '      :SpeseCarburante,'
      '      :SpeseVitto,'
      '      :SpeseAlloggio,'
      '      :SpeseAutostrada,'
      '      :SpeseAltre,'
      '      :PartitaIvaCli,'
      '      :CodiceFiscaleCli,'
      '      :Registro,'
      '      :Agente,'
      '      :Agente2,'
      '      :Agente3,'
      '      :Agente4,'
      '      :CodiceArticolo,'
      '      :DescrizioneArticolo,'
      '      :TelefonoCli,'
      '      :CellulareCli,'
      '      :IDPRATICA,'
      '      :MASTER_ID,'
      '      :URGENTE,'
      '      :STAMPATO,'
      '      :FATTO,'
      '      :RICHIEDENTE,'
      '      :RDA'
      '      )')
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = QryImpBeforePost
    SQL.Strings = (
      'SELECT * FROM IMPEGNI I')
    Left = 570
    Top = 1
    object QryImpID: TIntegerField
      FieldName = 'ID'
      Required = True
      OnChange = QryImpIDChange
    end
    object QryImpPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object QryImpTIPOIMPEGNO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPOIMPEGNO'
      OnChange = QryImpTIPOIMPEGNOChange
      Size = 25
    end
    object QryImpEVENTTYPE: TIntegerField
      FieldName = 'EVENTTYPE'
    end
    object QryImpSTART: TDateTimeField
      FieldName = 'START_EVENT'
      OnChange = QryImpSTARTChange
    end
    object QryImpFINISH: TDateTimeField
      FieldName = 'FINISH_EVENT'
      OnChange = QryImpFINISHChange
    end
    object QryImpOPTIONS: TIntegerField
      FieldName = 'OPTIONS'
    end
    object QryImpCAPTION: TStringField
      FieldName = 'CAPTION'
      Size = 255
    end
    object QryImpRECURRENCEINDEX: TIntegerField
      FieldName = 'RECURRENCEINDEX'
    end
    object QryImpRECURENCEINFO: TBlobField
      FieldName = 'RECURENCEINFO'
      Size = 8
    end
    object QryImpRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
      OnChange = QryImpRESOURCEIDChange
    end
    object QryImpLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 255
    end
    object QryImpEVENTMESSAGE: TStringField
      FieldName = 'EVENTMESSAGE'
      Size = 255
    end
    object QryImpREMINDER: TIntegerField
      FieldName = 'REMINDER'
    end
    object QryImpSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object QryImpLABELCOLOR: TIntegerField
      FieldName = 'LABELCOLOR'
    end
    object QryImpTIPOINTERVENTO: TStringField
      FieldName = 'TIPOINTERVENTO'
      Size = 100
    end
    object QryImpDATAORACHIAMATA: TDateTimeField
      FieldName = 'DATAORACHIAMATA'
    end
    object QryImpDATAORAINTERVENTO: TDateTimeField
      FieldName = 'DATAORAINTERVENTO'
      OnChange = QryImpDATAORAINTERVENTOChange
    end
    object QryImpDATAORAFINEINTERVENTO: TDateTimeField
      FieldName = 'DATAORAFINEINTERVENTO'
      OnChange = QryImpDATAORAFINEINTERVENTOChange
    end
    object QryImpRELAZIONEINTERVENTO: TMemoField
      FieldName = 'RELAZIONEINTERVENTO'
      BlobType = ftMemo
    end
    object QryImpOSSERVAZIONI: TStringField
      FieldName = 'OSSERVAZIONI'
      Size = 255
    end
    object QryImpRACCOMANDAZIONI: TStringField
      FieldName = 'RACCOMANDAZIONI'
      Size = 255
    end
    object QryImpPRESCRIZIONI: TStringField
      FieldName = 'PRESCRIZIONI'
      Size = 255
    end
    object QryImpCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = QryImpCLIENTEChange
    end
    object QryImpRAGSOCCLI: TStringField
      FieldName = 'RAGSOCCLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 60
    end
    object QryImpINDIRIZZOCLI: TStringField
      FieldName = 'INDIRIZZOCLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 80
    end
    object QryImpNUMCIVICOCLI: TStringField
      FieldName = 'NUMCIVICOCLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 10
    end
    object QryImpCITTACLI: TStringField
      FieldName = 'CITTACLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 60
    end
    object QryImpCAPCLI: TStringField
      FieldName = 'CAPCLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 5
    end
    object QryImpPROVINCIACLI: TStringField
      FieldName = 'PROVINCIACLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 3
    end
    object QryImpPRATICA: TIntegerField
      FieldName = 'PRATICA'
      OnChange = QryImpPRATICAChange
    end
    object QryImpPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object QryImpPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object QryImpDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryImpDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object QryImpDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object QryImpVEICOLO: TStringField
      FieldName = 'VEICOLO'
      Size = 40
    end
    object QryImpKMPERCORSI: TIBOFloatField
      FieldName = 'KMPERCORSI'
    end
    object QryImpSPESECARBURANTE: TIBOFloatField
      FieldName = 'SPESECARBURANTE'
      currency = True
    end
    object QryImpSPESEVITTO: TIBOFloatField
      FieldName = 'SPESEVITTO'
      currency = True
    end
    object QryImpSPESEALLOGGIO: TIBOFloatField
      FieldName = 'SPESEALLOGGIO'
      currency = True
    end
    object QryImpSPESEAUTOSTRADA: TIBOFloatField
      FieldName = 'SPESEAUTOSTRADA'
      currency = True
    end
    object QryImpSPESEALTRE: TIBOFloatField
      FieldName = 'SPESEALTRE'
      currency = True
    end
    object QryImpPARTITAIVACLI: TStringField
      FieldName = 'PARTITAIVACLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 16
    end
    object QryImpCODICEFISCALECLI: TStringField
      FieldName = 'CODICEFISCALECLI'
      OnChange = QryImpRAGSOCCLIChange
      Size = 16
    end
    object QryImpREGISTRO: TStringField
      FieldName = 'REGISTRO'
      OnChange = QryImpREGISTROChange
      Size = 5
    end
    object QryImpAGENTE: TStringField
      FieldName = 'AGENTE'
      OnChange = QryImpAGENTEChange
      Size = 25
    end
    object QryImpCODICEARTICOLO: TStringField
      FieldName = 'CODICEARTICOLO'
      Size = 25
    end
    object QryImpDESCRIZIONEARTICOLO: TStringField
      FieldName = 'DESCRIZIONEARTICOLO'
      Size = 60
    end
    object QryImpTELEFONOCLI: TStringField
      FieldName = 'TELEFONOCLI'
      Size = 30
    end
    object QryImpCELLULARECLI: TStringField
      FieldName = 'CELLULARECLI'
      Size = 30
    end
    object QryImpAGENTE2: TStringField
      FieldName = 'AGENTE2'
      OnChange = QryImpAGENTE2Change
      Size = 25
    end
    object QryImpAGENTE3: TStringField
      FieldName = 'AGENTE3'
      OnChange = QryImpAGENTE3Change
      Size = 25
    end
    object QryImpAGENTE4: TStringField
      FieldName = 'AGENTE4'
      OnChange = QryImpAGENTE4Change
      Size = 25
    end
    object QryImpIDPRATICA: TIntegerField
      FieldName = 'IDPRATICA'
      OnChange = QryImpIDPRATICAChange
    end
    object QryImpMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
    end
    object QryImpURGENTE: TStringField
      FieldName = 'URGENTE'
      Size = 1
    end
    object QryImpSTAMPATO: TStringField
      FieldName = 'STAMPATO'
      Size = 1
    end
    object QryImpDATAORAINTERVENTO2: TDateTimeField
      FieldName = 'DATAORAINTERVENTO2'
    end
    object QryImpDATAORAINTERVENTO3: TDateTimeField
      FieldName = 'DATAORAINTERVENTO3'
    end
    object QryImpDATAORAINTERVENTO4: TDateTimeField
      FieldName = 'DATAORAINTERVENTO4'
    end
    object QryImpDATAORAINTERVENTO5: TDateTimeField
      FieldName = 'DATAORAINTERVENTO5'
    end
    object QryImpDATAORAFINEINTERVENTO2: TDateTimeField
      FieldName = 'DATAORAFINEINTERVENTO2'
    end
    object QryImpDATAORAFINEINTERVENTO3: TDateTimeField
      FieldName = 'DATAORAFINEINTERVENTO3'
    end
    object QryImpDATAORAFINEINTERVENTO4: TDateTimeField
      FieldName = 'DATAORAFINEINTERVENTO4'
    end
    object QryImpDATAORAFINEINTERVENTO5: TDateTimeField
      FieldName = 'DATAORAFINEINTERVENTO5'
    end
    object QryImpFATTO: TStringField
      FieldName = 'FATTO'
      FixedChar = True
      Size = 1
    end
    object QryImpRICHIEDENTE: TStringField
      FieldName = 'RICHIEDENTE'
      Size = 30
    end
    object QryImpRDA: TStringField
      FieldName = 'RDA'
    end
  end
  object SourceImp: TDataSource
    AutoEdit = False
    DataSet = QryImp
    Left = 598
    Top = 1
  end
  object QryAss: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAPRATICA'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    EditSQL.Strings = (
      'UPDATE PRATICHE SET'
      ''
      '      Cliente = :CodiceProp,'
      '      RagSocCli = :RagSocProp,'
      '      IndirizzoCli = :IndirizzoProp,'
      '      NumCivicoCli = :NumCivicoProp,'
      '      CAPCli = :CAPProp,'
      '      CittaCli = :CittaProp,'
      '      ProvinciaCli = :ProvinciaProp,'
      '      CodiceFiscaleCli = :CodiceFiscaleProp,'
      '      TELEFONOCLI = :TELEFONOPROP,'
      '      CELLULARECLI = :CELLULAREPROP,'
      ''
      '      CodiceUT = :CodiceUT,'
      '      RagSocUT = :RagSocUT,'
      '      IndirizzoUT = :IndirizzoUT,'
      '      NumCivicoUT = :NumCivicoUT,'
      '      CAPUT = :CAPUT,'
      '      CittaUT = :CittaUT,'
      '      ProvinciaUT = :ProvinciaUT,'
      '      CodiceFiscaleUT = :CodiceFiscaleUT,'
      '      TELEFONOUT = :TELEFONOUT,'
      '      CELLULAREUT = :CELLULAREUT,'
      ''
      '      CodiceInst = :CodiceInst,'
      '      RagSocInst = :RagSocInst,'
      '      IndirizzoInst = :IndirizzoInst,'
      '      NumCivicoInst = :NumCivicoInst,'
      '      CAPInst = :CAPInst,'
      '      CittaInst = :CittaInst,'
      '      ProvinciaInst = :ProvinciaInst,'
      '      CodiceFiscaleInst = :CodiceFiscaleInst,'
      '      TELEFONOInst = :TELEFONOInst,'
      '      CELLULAREInst = :CELLULAREInst,'
      ''
      '      CodiceRespImp = :CodiceRespImp,'
      '      RagSocRespImp = :RagSocRespImp,'
      '      CognomeRespImp = :CognomeRespImp,'
      '      NomeRespImp = :NomeRespImp,'
      '      IndirizzoRespImp = :IndirizzoRespImp,'
      '      NumCivicoRespImp = :NumCivicoRespImp,'
      '      CAPRespImp = :CAPRespImp,'
      '      CittaRespImp = :CittaRespImp,'
      '      ProvinciaRespImp = :ProvinciaRespImp,'
      '      CodiceFiscaleRespImp = :CodiceFiscaleRespImp,'
      '      TELEFONORespImp = :TELEFONORespImp,'
      '      CELLULARERespImp = :CELLULARERespImp,'
      '      InQualitaDiRespImp = :InQualitaDiRespImp,'
      '      NATURAGIURIDICARESPIMP = :NATURAGIURIDICARESPIMP,'
      '      PARTITAIVARESPIMP = :PARTITAIVARESPIMP,'
      ''
      ''
      '      CodiceIstatComuneImm = :CodiceIstatComuneImm,'
      '      ComuneImm = :ComuneImm,'
      '      IndirizzoImm = :IndirizzoImm,'
      '      NumCivicoImm = :NumCivicoImm,'
      '      ProvinciaImm = :ProvinciaImm,'
      '      PianoImm = :PianoImm,'
      '      InternoImm = :InternoImm,'
      '      PalazzoImm = :PalazzoImm,'
      '      CapImm = :CapImm,'
      '      ZonaImm = :ZonaImm,'
      '      ScalaImm = :ScalaImm,'
      ''
      '      ImmobCodice = :ImmobCodice,'
      '      ImmobIndirizzo = :ImmobIndirizzo,'
      '      ImmobNumCivico = :ImmobNumCivico,'
      '      ImmobLocalita = :ImmobLocalita,'
      '      ImmobProvincia = :ImmobProvincia,'
      '      ImmobCAP = :ImmobCAP,'
      ''
      '      CodiceCatasto = :CodiceCatasto,'
      '      Note = :Note,'
      '      NotePrivate = :NotePrivate,'
      ''
      '      CONTRATTO_STATO = :CONTRATTO_STATO,'
      '      CONTRATTO_SOSP_MESI = :CONTRATTO_SOSP_MESI,'
      '      CONTRATTO_SOSP_DATA = :CONTRATTO_SOSP_DATA,'
      '      CONTRATTO_DISMESSO_DATA = :CONTRATTO_DISMESSO_DATA,'
      '      CONTRATTO_NUMERO = :CONTRATTO_NUMERO,'
      '      CONTRATTO_DATASTIPULA = :CONTRATTO_DATASTIPULA,'
      '      CONTRATTO_IMPORTO = :CONTRATTO_IMPORTO,'
      '      CONTRATTO_SCONTO1 = :CONTRATTO_SCONTO1,'
      '      CONTRATTO_SCONTO2 = :CONTRATTO_SCONTO2,'
      '      CONTRATTO_SCONTO3 = :CONTRATTO_SCONTO3,'
      '      CONTRATTO_IMPORTONETTO = :CONTRATTO_IMPORTONETTO,'
      '      CONTRATTO_CODICEIVA = :CONTRATTO_CODICEIVA,'
      '      CONTRATTO_IMPORTOIVACOMP = :CONTRATTO_IMPORTOIVACOMP,'
      
        '      CONTRATTO_IMPORTONETTOIVACOMP = :CONTRATTO_IMPORTONETTOIVA' +
        'COMP,'
      '      CONTRATTO_TIPO = :CONTRATTO_TIPO,'
      '      CONTRATTO_MESI = :CONTRATTO_MESI,'
      '      CONTRATTO_MESI_RINNOVO = :CONTRATTO_MESI_RINNOVO,'
      '      CONTRATTO_VALIDITA_INIZIO = :CONTRATTO_VALIDITA_INIZIO,'
      '      CONTRATTO_VALIDITA_FINE = :CONTRATTO_VALIDITA_FINE,'
      
        '      CONTRATTO_DISDETTA_RICEVUTA = :CONTRATTO_DISDETTA_RICEVUTA' +
        ','
      
        '      CONTRATTO_DISDETTA_DATARICEZ = :CONTRATTO_DISDETTA_DATARIC' +
        'EZ,'
      '      CONTRATTO_DISDETTA_MEZZO = :CONTRATTO_DISDETTA_MEZZO,'
      ''
      '      CODICE = :PRATICA,'
      '      DATAAPERTURA = :DATAPRATICA1,'
      '      TIPO = :TIPO'
      ''
      'WHERE'
      '  CODICE = :OLD_PRATICA'
      '  AND DATAAPERTURA = :OLD_DATAPRATICA1')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO PRATICHE ('
      ''
      '      Cliente,'
      '      RagSocCli,'
      '      IndirizzoCli,'
      '      NumCivicoCli,'
      '      CAPCli,'
      '      CittaCli,'
      '      ProvinciaCli,'
      '      CodiceFiscaleCli,'
      '      TELEFONOCLI,'
      '      CELLULARECLI,'
      ''
      '      CodiceUT,'
      '      RagSocUT,'
      '      IndirizzoUT,'
      '      NumCivicoUT,'
      '      CAPUT,'
      '      CittaUT,'
      '      ProvinciaUT,'
      '      CodiceFiscaleUT,'
      '      TELEFONOUT,'
      '      CELLULAREUT,'
      ''
      '      CodiceInst,'
      '      RagSocInst,'
      '      IndirizzoInst,'
      '      NumCivicoInst,'
      '      CAPInst,'
      '      CittaInst,'
      '      ProvinciaInst,'
      '      CodiceFiscaleInst,'
      '      TELEFONOInst,'
      '      CELLULAREInst,'
      ''
      '      CodiceRespImp,'
      '      RagSocRespImp,'
      '      IndirizzoRespImp,'
      '      NumCivicoRespImp,'
      '      CAPRespImp,'
      '      CittaRespImp,'
      '      ProvinciaRespImp,'
      '      CodiceFiscaleRespImp,'
      '      TELEFONORespImp,'
      '      CELLULARERespImp,'
      '      InQualitaDiRespImp,'
      '        NATURAGIURIDICARESPIMP,'
      '        NOMERESPIMP,'
      '        COGNOMERESPIMP,'
      '        PARTITAIVARESPIMP,'
      ''
      ''
      ''
      '      CodiceIstatComuneImm,'
      '      ComuneImm,'
      '      IndirizzoImm,'
      '      NumCivicoImm,'
      '      ProvinciaImm,'
      '      PianoImm,'
      '      InternoImm,'
      '      PalazzoImm,'
      '      CapImm,'
      '      ZonaImm,'
      '      ScalaImm,'
      ''
      '      ImmobCodice,'
      '      ImmobIndirizzo,'
      '      ImmobNumCivico,'
      '      ImmobLocalita,'
      '      ImmobProvincia,'
      '      ImmobCAP,'
      ''
      '      CodiceCatasto,'
      '      Note,'
      '      NotePrivate,'
      ''
      '      CONTRATTO_STATO,'
      '      CONTRATTO_SOSP_MESI,'
      '      CONTRATTO_SOSP_DATA,'
      '      CONTRATTO_DISMESSO_DATA,'
      '      CONTRATTO_NUMERO,'
      '      CONTRATTO_DATASTIPULA,'
      '      CONTRATTO_IMPORTO,'
      '      CONTRATTO_SCONTO1,'
      '      CONTRATTO_SCONTO2,'
      '      CONTRATTO_SCONTO3,'
      '      CONTRATTO_IMPORTONETTO,'
      '      CONTRATTO_CODICEIVA,'
      '      CONTRATTO_IMPORTOIVACOMP,'
      '      CONTRATTO_IMPORTONETTOIVACOMP,'
      '      CONTRATTO_TIPO,'
      '      CONTRATTO_MESI,'
      '      CONTRATTO_MESI_RINNOVO,'
      '      CONTRATTO_VALIDITA_INIZIO,'
      '      CONTRATTO_VALIDITA_FINE,'
      '      CONTRATTO_DISDETTA_RICEVUTA,'
      '      CONTRATTO_DISDETTA_DATARICEZ,'
      '      CONTRATTO_DISDETTA_MEZZO,'
      ''
      '      CODICE,'
      '      DATAAPERTURA,'
      '      TIPO'
      ''
      ') VALUES ('
      ''
      '      :CodiceProp,'
      '      :RagSocProp,'
      '      :IndirizzoProp,'
      '      :NumCivicoProp,'
      '      :CAPProp,'
      '      :CittaProp,'
      '      :ProvinciaProp,'
      '      :CodiceFiscaleProp,'
      '      :TELEFONOPROP,'
      '      :CELLULAREPROP,'
      ''
      '      :CodiceUT,'
      '      :RagSocUT,'
      '      :IndirizzoUT,'
      '      :NumCivicoUT,'
      '      :CAPUT,'
      '      :CittaUT,'
      '      :ProvinciaUT,'
      '      :CodiceFiscaleUT,'
      '      :TELEFONOUT,'
      '      :CELLULAREUT,'
      ''
      '      :CodiceInst,'
      '      :RagSocInst,'
      '      :IndirizzoInst,'
      '      :NumCivicoInst,'
      '      :CAPInst,'
      '      :CittaInst,'
      '      :ProvinciaInst,'
      '      :CodiceFiscaleInst,'
      '      :TELEFONOInst,'
      '      :CELLULAREInst,'
      ''
      '      :CodiceRespImp,'
      '      :RagSocRespImp,'
      '      :IndirizzoRespImp,'
      '      :NumCivicoRespImp,'
      '      :CAPRespImp,'
      '      :CittaRespImp,'
      '      :ProvinciaRespImp,'
      '      :CodiceFiscaleRespImp,'
      '      :TELEFONORespImp,'
      '      :CELLULARERespImp,'
      '      :InQualitaDiRespImp,'
      '        :NATURAGIURIDICARESPIMP,'
      '        :NOMERESPIMP,'
      '        :COGNOMERESPIMP,'
      '        :PARTITAIVARESPIMP,'
      ''
      ''
      ''
      '      :CodiceIstatComuneImm,'
      '      :ComuneImm,'
      '      :IndirizzoImm,'
      '      :NumCivicoImm,'
      '      :ProvinciaImm,'
      '      :PianoImm,'
      '      :InternoImm,'
      '      :PalazzoImm,'
      '      :CapImm,'
      '      :ZonaImm,'
      '      :ScalaImm,'
      ''
      '      :ImmobCodice,'
      '      :ImmobIndirizzo,'
      '      :ImmobNumCivico,'
      '      :ImmobLocalita,'
      '      :ImmobProvincia,'
      '      :ImmobCAP,'
      ''
      '      :CodiceCatasto,'
      '      :Note,'
      '      :NotePrivate,'
      ''
      '      :CONTRATTO_STATO,'
      '      :CONTRATTO_SOSP_MESI,'
      '      :CONTRATTO_SOSP_DATA,'
      '      :CONTRATTO_DISMESSO_DATA,'
      '      :CONTRATTO_NUMERO,'
      '      :CONTRATTO_DATASTIPULA,'
      '      :CONTRATTO_IMPORTO,'
      '      :CONTRATTO_SCONTO1,'
      '      :CONTRATTO_SCONTO2,'
      '      :CONTRATTO_SCONTO3,'
      '      :CONTRATTO_IMPORTONETTO,'
      '      :CONTRATTO_CODICEIVA,'
      '      :CONTRATTO_IMPORTOIVACOMP,'
      '      :CONTRATTO_IMPORTONETTOIVACOMP,'
      '      :CONTRATTO_TIPO,'
      '      :CONTRATTO_MESI,'
      '      :CONTRATTO_MESI_RINNOVO,'
      '      :CONTRATTO_VALIDITA_INIZIO,'
      '      :CONTRATTO_VALIDITA_FINE,'
      '      :CONTRATTO_DISDETTA_RICEVUTA,'
      '      :CONTRATTO_DISDETTA_DATARICEZ,'
      '      :CONTRATTO_DISDETTA_MEZZO,'
      ''
      '      :PRATICA,'
      '      :DATAPRATICA1,'
      '      :TIPO'
      ')'
      '')
    PessimisticLocking = True
    RecordCountAccurate = True
    AfterOpen = QryAssAfterOpen
    AfterPost = QryAssAfterOpen
    OnCalcFields = QryAssCalcFields
    SQL.Strings = (
      'SELECT'
      '      P.Cliente as CodiceProp,'
      '      P.RagSocCli as RagSocProp,'
      '      P.IndirizzoCli as IndirizzoProp,'
      '      P.NumCivicoCli as NumCivicoProp,'
      '      P.CAPCli as CAPProp,'
      '      P.CittaCli as CittaProp,'
      '      P.ProvinciaCli as ProvinciaProp,'
      '      P.CodiceFiscaleCli as CodiceFiscaleProp,'
      
        '      COALESCE(P.TelefonoCli, (SELECT Telefono FROM Clienti WHER' +
        'E Codice = P.Cliente)) AS TelefonoProp,'
      
        '      COALESCE(P.CellulareCli, (SELECT Cellulare FROM Clienti WH' +
        'ERE Codice = P.Cliente)) AS CellulareProp,'
      
        '      CAST(P.IndirizzoCli || '#39', '#39' || P.NumCivicoCli || '#39' - '#39' || ' +
        'P.CAPCli || '#39' '#39' || P.CittaCli || '#39'  ('#39' || P.ProvinciaCli || '#39')'#39' ' +
        'AS VARCHAR(150)) AS IndirizzoCompletoCli,'
      '      P.RESOURCEID,'
      ''
      '      P.CodiceUT,'
      '      P.RagSocUT,'
      '      P.IndirizzoUT,'
      '      P.NumCivicoUT,'
      '      P.CAPUT,'
      '      P.CittaUT,'
      '      P.ProvinciaUT,'
      '      P.CodiceFiscaleUT,'
      
        '      COALESCE(P.TelefonoUT, (SELECT Telefono FROM Clienti WHERE' +
        ' Codice = P.CodiceUT)) AS TelefonoUT,'
      
        '      COALESCE(P.CellulareUT, (SELECT Cellulare FROM Clienti WHE' +
        'RE Codice = P.CodiceUT)) AS CellulareUT,'
      ''
      '      P.CodiceInst,'
      '      P.RagSocInst,'
      '      P.IndirizzoInst,'
      '      P.NumCivicoInst,'
      '      P.CAPInst,'
      '      P.CittaInst,'
      '      P.ProvinciaInst,'
      '      P.CodiceFiscaleInst,'
      
        '      COALESCE(P.TELEFONOINST, (SELECT Telefono FROM Clienti WHE' +
        'RE Codice = P.CodiceInst)) AS TelefonoInst,'
      
        '      COALESCE(P.CELLULAREINST, (SELECT Cellulare FROM Clienti W' +
        'HERE Codice = P.CodiceInst)) AS CellulareInst,'
      ''
      '      P.CodiceRespImp,'
      '      P.RagSocRespImp,'
      '      P.IndirizzoRespImp,'
      '      P.NumCivicoRespImp,'
      '      P.CAPRespImp,'
      '      P.CittaRespImp,'
      '      P.ProvinciaRespImp,'
      '      P.CodiceFiscaleRespImp,'
      
        '      COALESCE(P.TELEFONORESPIMP, (SELECT Telefono FROM Clienti ' +
        'WHERE Codice = P.CodiceRespImp)) AS TelefonoRespImp,'
      
        '      COALESCE(P.CELLULARERESPIMP, (SELECT Cellulare FROM Client' +
        'i WHERE Codice = P.CodiceRespImp)) AS CellulareRespImp,'
      
        '      CAST(P.IndirizzoRespImp || '#39', '#39' || P.NumCivicoRespImp || '#39 +
        ' - '#39' || P.CAPRespImp || '#39' '#39' || P.CittaRespImp || '#39'  ('#39' || P.Prov' +
        'inciaRespImp || '#39')'#39' AS VARCHAR(150)) AS IndirizzoCompletoRespInp' +
        ','
      '      P.InQualitaDiRespImp,'
      '        P.NATURAGIURIDICARESPIMP,'
      '        P.NOMERESPIMP,'
      '        P.COGNOMERESPIMP,'
      '        P.PARTITAIVARESPIMP,'
      ''
      ''
      '      P.CodiceIstatComuneImm,'
      '      P.ComuneImm,'
      '      P.IndirizzoImm,'
      '      P.NumCivicoImm,'
      '      P.ProvinciaImm,'
      '      P.PianoImm,'
      '      P.InternoImm,'
      '      P.PalazzoImm,'
      '      P.CapImm,'
      '      P.ZonaImm,'
      '      P.ScalaImm,'
      ''
      '      P.ImmobCodice,'
      '      P.ImmobIndirizzo,'
      '      P.ImmobNumCivico,'
      '      P.ImmobLocalita,'
      '      P.ImmobProvincia,'
      '      P.ImmobCAP,'
      ''
      '      P.CodiceCatasto,'
      '      P.Costruttore,'
      '      P.Modello,'
      '      P.Matricola,'
      '      P.BreveDescrizioneCaldaia,'
      '      P.PotenzaNominale,'
      '      P.PotenzaNominaleFocolare,'
      '      P.DataInstallazione,'
      '      P.DataPrimaAccensione,'
      '      P.TipoCamera,'
      '      P.TipoTiraggio,'
      '      P.Combustibile,'
      '      P.CombustibileAltro,'
      '      P.Abbonato,'
      '      P.DataInizioAbbonamento,'
      '      P.DataFineAbbonamento,'
      '      P.RicevutaDisdetta,'
      '      P.DataDisdetta,'
      '      P.MezzoDisdetta,'
      '      P.MezzoDisdettaAltro,'
      '      P.TipoContratto,'
      '      P.ImportoContratto,'
      '      P.Note,'
      '      P.NotePrivate,'
      '      P.TipoImpianto,'
      '      P.Periodicita,'
      '      P.NoteMontaggio,'
      '      P.AnnoCostruzione,'
      '      P.Riscaldamento,'
      '      P.AcquaSanitaria,'
      '      P.MarcaEfficienzaEnerg,'
      '      P.LocaleInstallazione,'
      '      P.FluidoTermovettore,'
      ''
      '      P.CONTRATTO_STATO,'
      '      P.CONTRATTO_SOSP_MESI,'
      '      P.CONTRATTO_SOSP_DATA,'
      '      P.CONTRATTO_DISMESSO_DATA,'
      '      P.CONTRATTO_NUMERO,'
      '      P.CONTRATTO_DATASTIPULA,'
      '      P.CONTRATTO_IMPORTO,'
      '      P.CONTRATTO_SCONTO1,'
      '      P.CONTRATTO_SCONTO2,'
      '      P.CONTRATTO_SCONTO3,'
      '      P.CONTRATTO_IMPORTONETTO,'
      '      P.CONTRATTO_CODICEIVA,'
      '      P.CONTRATTO_IMPORTOIVACOMP,'
      '      P.CONTRATTO_IMPORTONETTOIVACOMP,'
      '      P.CONTRATTO_TIPO,'
      '      P.CONTRATTO_MESI,'
      '      P.CONTRATTO_MESI_RINNOVO,'
      '      P.CONTRATTO_VALIDITA_INIZIO,'
      '      P.CONTRATTO_VALIDITA_FINE,'
      '      P.CONTRATTO_DISDETTA_RICEVUTA,'
      '      P.CONTRATTO_DISDETTA_DATARICEZ,'
      '      P.CONTRATTO_DISDETTA_MEZZO,'
      '      P.COMPUTED_CONTRATTO_SCADUTO,'
      ''
      '      P.CODICE AS PRATICA,'
      '      P.DATAAPERTURA AS DATAPRATICA1,'
      '      P.TIPO,'
      '      P.DESCRIZIONE,'
      '      FL_USAPREDEFINITI,'
      '      FL_DATI_APPARECCHI,'
      '      FL_DATI_APPARECCHI_SEPARATI,'
      '      FL_DATI_OP,'
      '      FL_DATI_PRECEDENTI,'
      '      FL_DATI_NUMULTINTERV,'
      '      FL_DATI_RAPPINT,'
      '      FL_DATI_MERCE,'
      '      FL_DATI_ALTRESPESE,'
      '      FL_DATI_FIRME,'
      '      FL_COPIE,'
      ''
      '      PRM_PROXVISITA_INBASEA,'
      '      PRM_PROXVISITA_ADDPERIODSU,'
      '      PRM_AUTODOC_OPFATTE,'
      '      PRM_AUTODOC_RIFCONTRATTO,'
      '      PRM_AUTODOC_DICITURA,'
      '      PRM_AUTODOC_DICITURATXT,'
      '      PRM_AUTOCLOSE_ENABLED,'
      '      PRM_AUTOCLOSE_SOLOMANUT,'
      '      PRM_AUTOCLOSE_FATTURA,'
      '      PRM_AUTOCLOSE_SCAD,'
      ''
      '      PROXVISITAENTRO'
      ''
      'FROM PRATICHE P'
      ''
      '    WHERE P.CODICE = :P_PRATICA'
      '          AND P.DATAAPERTURA = :P_DATAPRATICA'
      '')
    Left = 714
    Top = 1
    object QryAssRAGSOCUT: TStringField
      FieldName = 'RAGSOCUT'
      Size = 60
    end
    object QryAssINDIRIZZOUT: TStringField
      FieldName = 'INDIRIZZOUT'
      Size = 80
    end
    object QryAssNUMCIVICOUT: TStringField
      FieldName = 'NUMCIVICOUT'
      Size = 10
    end
    object QryAssCAPUT: TStringField
      FieldName = 'CAPUT'
      Size = 5
    end
    object QryAssCITTAUT: TStringField
      FieldName = 'CITTAUT'
      Size = 60
    end
    object QryAssPROVINCIAUT: TStringField
      FieldName = 'PROVINCIAUT'
      Size = 3
    end
    object QryAssTELEFONOUT: TStringField
      FieldName = 'TELEFONOUT'
      Size = 30
    end
    object QryAssCELLULAREUT: TStringField
      FieldName = 'CELLULAREUT'
      Size = 30
    end
    object QryAssRAGSOCINST: TStringField
      FieldName = 'RAGSOCINST'
      Size = 60
    end
    object QryAssINDIRIZZOINST: TStringField
      FieldName = 'INDIRIZZOINST'
      Size = 80
    end
    object QryAssNUMCIVICOINST: TStringField
      FieldName = 'NUMCIVICOINST'
      Size = 10
    end
    object QryAssCAPINST: TStringField
      FieldName = 'CAPINST'
      Size = 5
    end
    object QryAssCITTAINST: TStringField
      FieldName = 'CITTAINST'
      Size = 60
    end
    object QryAssPROVINCIAINST: TStringField
      FieldName = 'PROVINCIAINST'
      Size = 3
    end
    object QryAssTELEFONOINST: TStringField
      FieldName = 'TELEFONOINST'
      Size = 30
    end
    object QryAssCELLULAREINST: TStringField
      FieldName = 'CELLULAREINST'
      Size = 30
    end
    object QryAssCODICEISTATCOMUNEIMM: TStringField
      FieldName = 'CODICEISTATCOMUNEIMM'
      Size = 10
    end
    object QryAssCOMUNEIMM: TStringField
      FieldName = 'COMUNEIMM'
      Size = 60
    end
    object QryAssCAPIMM: TStringField
      FieldName = 'CAPIMM'
      Size = 5
    end
    object QryAssINDIRIZZOIMM: TStringField
      FieldName = 'INDIRIZZOIMM'
      Size = 80
    end
    object QryAssNUMCIVICOIMM: TStringField
      FieldName = 'NUMCIVICOIMM'
      Size = 10
    end
    object QryAssPROVINCIAIMM: TStringField
      FieldName = 'PROVINCIAIMM'
      Size = 3
    end
    object QryAssPIANOIMM: TStringField
      FieldName = 'PIANOIMM'
      Size = 10
    end
    object QryAssINTERNOIMM: TStringField
      FieldName = 'INTERNOIMM'
      Size = 10
    end
    object QryAssPALAZZOIMM: TStringField
      FieldName = 'PALAZZOIMM'
      Size = 30
    end
    object QryAssCOSTRUTTORE: TStringField
      FieldName = 'COSTRUTTORE'
      Size = 45
    end
    object QryAssMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 30
    end
    object QryAssMATRICOLA: TStringField
      FieldName = 'MATRICOLA'
      Size = 30
    end
    object QryAssBREVEDESCRIZIONECALDAIA: TStringField
      FieldName = 'BREVEDESCRIZIONECALDAIA'
      Size = 60
    end
    object QryAssPOTENZANOMINALE: TStringField
      FieldName = 'POTENZANOMINALE'
      Size = 10
    end
    object QryAssDATAINSTALLAZIONE: TDateTimeField
      FieldName = 'DATAINSTALLAZIONE'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryAssDATAPRIMAACCENSIONE: TDateTimeField
      FieldName = 'DATAPRIMAACCENSIONE'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryAssTIPOCAMERA: TStringField
      FieldName = 'TIPOCAMERA'
      Size = 10
    end
    object QryAssTIPOTIRAGGIO: TStringField
      FieldName = 'TIPOTIRAGGIO'
      Size = 10
    end
    object QryAssCOMBUSTIBILE: TStringField
      FieldName = 'COMBUSTIBILE'
    end
    object QryAssCOMBUSTIBILEALTRO: TStringField
      FieldName = 'COMBUSTIBILEALTRO'
    end
    object QryAssABBONATO: TStringField
      FieldName = 'ABBONATO'
      Size = 1
    end
    object QryAssDATAINIZIOABBONAMENTO: TDateTimeField
      FieldName = 'DATAINIZIOABBONAMENTO'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryAssDATAFINEABBONAMENTO: TDateTimeField
      FieldName = 'DATAFINEABBONAMENTO'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryAssRICEVUTADISDETTA: TStringField
      FieldName = 'RICEVUTADISDETTA'
      Size = 1
    end
    object QryAssDATADISDETTA: TDateTimeField
      FieldName = 'DATADISDETTA'
    end
    object QryAssMEZZODISDETTA: TStringField
      FieldName = 'MEZZODISDETTA'
    end
    object QryAssMEZZODISDETTAALTRO: TStringField
      FieldName = 'MEZZODISDETTAALTRO'
    end
    object QryAssTIPOCONTRATTO: TStringField
      FieldName = 'TIPOCONTRATTO'
    end
    object QryAssIMPORTOCONTRATTO: TIBOFloatField
      FieldName = 'IMPORTOCONTRATTO'
      currency = True
    end
    object QryAssNOTE: TStringField
      FieldName = 'NOTE'
      Size = 1000
    end
    object QryAssTIPOIMPIANTO: TStringField
      FieldName = 'TIPOIMPIANTO'
    end
    object QryAssPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QryAssNOTEMONTAGGIO: TStringField
      FieldName = 'NOTEMONTAGGIO'
      Size = 200
    end
    object QryAssRISCALDAMENTO: TStringField
      FieldName = 'RISCALDAMENTO'
      Size = 1
    end
    object QryAssACQUASANITARIA: TStringField
      FieldName = 'ACQUASANITARIA'
      Size = 1
    end
    object QryAssMARCAEFFICIENZAENERG: TStringField
      FieldName = 'MARCAEFFICIENZAENERG'
      Size = 10
    end
    object QryAssLOCALEINSTALLAZIONE: TStringField
      FieldName = 'LOCALEINSTALLAZIONE'
      Size = 30
    end
    object QryAssFLUIDOTERMOVETTORE: TStringField
      FieldName = 'FLUIDOTERMOVETTORE'
      Size = 15
    end
    object QryAssANNOCOSTRUZIONE: TIntegerField
      FieldName = 'ANNOCOSTRUZIONE'
    end
    object QryAssRAGSOCRESPIMP: TStringField
      FieldName = 'RAGSOCRESPIMP'
      Size = 60
    end
    object QryAssINDIRIZZORESPIMP: TStringField
      FieldName = 'INDIRIZZORESPIMP'
      Size = 80
    end
    object QryAssNUMCIVICORESPIMP: TStringField
      FieldName = 'NUMCIVICORESPIMP'
      Size = 10
    end
    object QryAssCAPRESPIMP: TStringField
      FieldName = 'CAPRESPIMP'
      Size = 5
    end
    object QryAssCITTARESPIMP: TStringField
      FieldName = 'CITTARESPIMP'
      Size = 60
    end
    object QryAssPROVINCIARESPIMP: TStringField
      FieldName = 'PROVINCIARESPIMP'
      Size = 3
    end
    object QryAssTELEFONORESPIMP: TStringField
      FieldName = 'TELEFONORESPIMP'
      Size = 30
    end
    object QryAssCELLULARERESPIMP: TStringField
      FieldName = 'CELLULARERESPIMP'
      Size = 30
    end
    object QryAssINDIRIZZOCOMPLETORESPINP: TStringField
      FieldName = 'INDIRIZZOCOMPLETORESPINP'
      ReadOnly = True
      Size = 150
    end
    object QryAssINQUALITADIRESPIMP: TStringField
      FieldName = 'INQUALITADIRESPIMP'
    end
    object QryAssCODICEFISCALEUT: TStringField
      FieldName = 'CODICEFISCALEUT'
      Size = 16
    end
    object QryAssCODICEFISCALERESPIMP: TStringField
      FieldName = 'CODICEFISCALERESPIMP'
      Size = 16
    end
    object QryAssCODICECATASTO: TStringField
      FieldName = 'CODICECATASTO'
      Size = 50
    end
    object QryAssRAGSOCPROP: TStringField
      FieldName = 'RAGSOCPROP'
      Size = 60
    end
    object QryAssINDIRIZZOPROP: TStringField
      FieldName = 'INDIRIZZOPROP'
      Size = 80
    end
    object QryAssNUMCIVICOPROP: TStringField
      FieldName = 'NUMCIVICOPROP'
      Size = 10
    end
    object QryAssCAPPROP: TStringField
      FieldName = 'CAPPROP'
      Size = 5
    end
    object QryAssCITTAPROP: TStringField
      FieldName = 'CITTAPROP'
      Size = 80
    end
    object QryAssPROVINCIAPROP: TStringField
      FieldName = 'PROVINCIAPROP'
      Size = 3
    end
    object QryAssCODICEFISCALEPROP: TStringField
      FieldName = 'CODICEFISCALEPROP'
      Size = 16
    end
    object QryAssTELEFONOPROP: TStringField
      FieldName = 'TELEFONOPROP'
      Size = 30
    end
    object QryAssCELLULAREPROP: TStringField
      FieldName = 'CELLULAREPROP'
      Size = 30
    end
    object QryAssINDIRIZZOCOMPLETOCLI: TStringField
      FieldName = 'INDIRIZZOCOMPLETOCLI'
      ReadOnly = True
      Size = 150
    end
    object QryAssPOTENZANOMINALEFOCOLARE: TStringField
      FieldName = 'POTENZANOMINALEFOCOLARE'
      Size = 10
    end
    object QryAssCODICEPROP: TIntegerField
      FieldName = 'CODICEPROP'
      OnChange = QryAssCODICEPROPChange
    end
    object QryAssCODICEUT: TIntegerField
      FieldName = 'CODICEUT'
      OnChange = QryAssCODICEUTChange
    end
    object QryAssCODICEINST: TIntegerField
      FieldName = 'CODICEINST'
      OnChange = QryAssCODICEINSTChange
    end
    object QryAssCODICERESPIMP: TIntegerField
      FieldName = 'CODICERESPIMP'
      OnChange = QryAssCODICERESPIMPChange
    end
    object QryAssZONAIMM: TStringField
      FieldName = 'ZONAIMM'
      Size = 30
    end
    object QryAssSCALAIMM: TStringField
      FieldName = 'SCALAIMM'
      Size = 10
    end
    object QryAssCODICEFISCALEINST: TStringField
      FieldName = 'CODICEFISCALEINST'
      Size = 16
    end
    object QryAssCONTRATTO_STATO: TStringField
      FieldName = 'CONTRATTO_STATO'
      Size = 1
    end
    object QryAssCONTRATTO_SOSP_MESI: TSmallintField
      FieldName = 'CONTRATTO_SOSP_MESI'
    end
    object QryAssCONTRATTO_SOSP_DATA: TDateTimeField
      FieldName = 'CONTRATTO_SOSP_DATA'
    end
    object QryAssCONTRATTO_DISMESSO_DATA: TDateTimeField
      FieldName = 'CONTRATTO_DISMESSO_DATA'
    end
    object QryAssCONTRATTO_DATASTIPULA: TDateTimeField
      FieldName = 'CONTRATTO_DATASTIPULA'
    end
    object QryAssCONTRATTO_IMPORTO: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTO'
      OnValidate = QryAssCONTRATTO_IMPORTOValidate
      currency = True
    end
    object QryAssCONTRATTO_SCONTO1: TIBOFloatField
      FieldName = 'CONTRATTO_SCONTO1'
      OnValidate = QryAssCONTRATTO_IMPORTOValidate
    end
    object QryAssCONTRATTO_SCONTO2: TIBOFloatField
      FieldName = 'CONTRATTO_SCONTO2'
      OnValidate = QryAssCONTRATTO_IMPORTOValidate
    end
    object QryAssCONTRATTO_SCONTO3: TIBOFloatField
      FieldName = 'CONTRATTO_SCONTO3'
      OnValidate = QryAssCONTRATTO_IMPORTOValidate
    end
    object QryAssCONTRATTO_IMPORTONETTO: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTONETTO'
    end
    object QryAssCONTRATTO_CODICEIVA: TIntegerField
      FieldName = 'CONTRATTO_CODICEIVA'
      OnValidate = QryAssCONTRATTO_IMPORTOValidate
    end
    object QryAssCONTRATTO_DESCRIZIONEIVA: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTRATTO_DESCRIZIONEIVA'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'DESCRIZIONEIVA'
      KeyFields = 'CONTRATTO_CODICEIVA'
      Size = 40
      Lookup = True
    end
    object QryAssCONTRATTO_ALIQUOTAIVA: TFloatField
      FieldKind = fkLookup
      FieldName = 'CONTRATTO_ALIQUOTAIVA'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CONTRATTO_CODICEIVA'
      Lookup = True
    end
    object QryAssCONTRATTO_IMPORTOIVACOMP: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTOIVACOMP'
    end
    object QryAssCONTRATTO_IMPORTONETTOIVACOMP: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTONETTOIVACOMP'
      OnValidate = QryAssCONTRATTO_IMPORTONETTOIVACOMPValidate
    end
    object QryAssCONTRATTO_NUMERO: TStringField
      FieldName = 'CONTRATTO_NUMERO'
      Size = 25
    end
    object QryAssCONTRATTO_TIPO: TStringField
      FieldName = 'CONTRATTO_TIPO'
      Size = 60
    end
    object QryAssCONTRATTO_MESI: TSmallintField
      FieldName = 'CONTRATTO_MESI'
    end
    object QryAssCONTRATTO_MESI_RINNOVO: TSmallintField
      FieldName = 'CONTRATTO_MESI_RINNOVO'
    end
    object QryAssCONTRATTO_VALIDITA_INIZIO: TDateTimeField
      FieldName = 'CONTRATTO_VALIDITA_INIZIO'
      OnChange = QryAssCONTRATTO_VALIDITA_INIZIOChange
    end
    object QryAssCONTRATTO_VALIDITA_FINE: TDateTimeField
      FieldName = 'CONTRATTO_VALIDITA_FINE'
    end
    object QryAssCONTRATTO_DISDETTA_RICEVUTA: TStringField
      FieldName = 'CONTRATTO_DISDETTA_RICEVUTA'
      Size = 1
    end
    object QryAssCONTRATTO_DISDETTA_DATARICEZ: TDateTimeField
      FieldName = 'CONTRATTO_DISDETTA_DATARICEZ'
    end
    object QryAssCONTRATTO_DISDETTA_MEZZO: TStringField
      FieldName = 'CONTRATTO_DISDETTA_MEZZO'
    end
    object QryAssCOMPUTED_CONTRATTO_SCADUTO: TStringField
      FieldName = 'COMPUTED_CONTRATTO_SCADUTO'
      ReadOnly = True
      Size = 1
    end
    object QryAssDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryAssPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryAssDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryAssTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QryAssNOTEPRIVATE: TMemoField
      FieldName = 'NOTEPRIVATE'
      BlobType = ftMemo
    end
    object QryAssCOMPUTED_STR_CERTIFIED_IMM: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_STR_CERTIFIED_IMM'
      Size = 1
      Calculated = True
    end
    object QryAssRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QryAssIMMOBCODICE: TIntegerField
      FieldName = 'IMMOBCODICE'
    end
    object QryAssIMMOBINDIRIZZO: TStringField
      FieldName = 'IMMOBINDIRIZZO'
      Size = 80
    end
    object QryAssIMMOBNUMCIVICO: TStringField
      FieldName = 'IMMOBNUMCIVICO'
      Size = 10
    end
    object QryAssIMMOBLOCALITA: TStringField
      FieldName = 'IMMOBLOCALITA'
      Size = 60
    end
    object QryAssIMMOBPROVINCIA: TStringField
      FieldName = 'IMMOBPROVINCIA'
      Size = 3
    end
    object QryAssIMMOBCAP: TStringField
      FieldName = 'IMMOBCAP'
      Size = 5
    end
    object QryAssNATURAGIURIDICARESPIMP: TStringField
      FieldName = 'NATURAGIURIDICARESPIMP'
      FixedChar = True
      Size = 1
    end
    object QryAssNOMERESPIMP: TStringField
      FieldName = 'NOMERESPIMP'
      Size = 60
    end
    object QryAssCOGNOMERESPIMP: TStringField
      FieldName = 'COGNOMERESPIMP'
      Size = 60
    end
    object QryAssPARTITAIVARESPIMP: TStringField
      FieldName = 'PARTITAIVARESPIMP'
      Size = 11
    end
    object QryAssPRM_PROXVISITA_INBASEA: TStringField
      FieldName = 'PRM_PROXVISITA_INBASEA'
      Size = 30
    end
    object QryAssPRM_PROXVISITA_ADDPERIODSU: TStringField
      FieldName = 'PRM_PROXVISITA_ADDPERIODSU'
      Size = 30
    end
    object QryAssPRM_AUTODOC_OPFATTE: TStringField
      FieldName = 'PRM_AUTODOC_OPFATTE'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTODOC_RIFCONTRATTO: TStringField
      FieldName = 'PRM_AUTODOC_RIFCONTRATTO'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTODOC_DICITURA: TStringField
      FieldName = 'PRM_AUTODOC_DICITURA'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTODOC_DICITURATXT: TStringField
      FieldName = 'PRM_AUTODOC_DICITURATXT'
      Size = 255
    end
    object QryAssPRM_AUTOCLOSE_ENABLED: TStringField
      FieldName = 'PRM_AUTOCLOSE_ENABLED'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTOCLOSE_SOLOMANUT: TStringField
      FieldName = 'PRM_AUTOCLOSE_SOLOMANUT'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTOCLOSE_FATTURA: TStringField
      FieldName = 'PRM_AUTOCLOSE_FATTURA'
      FixedChar = True
      Size = 1
    end
    object QryAssPRM_AUTOCLOSE_SCAD: TStringField
      FieldName = 'PRM_AUTOCLOSE_SCAD'
      FixedChar = True
      Size = 1
    end
    object QryAssPROXVISITAENTRO: TDateTimeField
      FieldName = 'PROXVISITAENTRO'
    end
  end
  object SourceAss: TDataSource
    AutoEdit = False
    DataSet = QryAss
    Left = 742
    Top = 1
  end
  object MenuStampe: TPopupMenu
    OnPopup = MenuStampePopup
    Left = 264
    Top = 24
    object StampaKITperiltecnico1: TMenuItem
      Caption = 'Stampa KIT per il tecnico'
      OnClick = StampaKITperiltecnico1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Fogliodilavoro1: TMenuItem
      Caption = 'Foglio di lavoro'
      OnClick = Fogliodilavoro1Click
    end
    object Rapportointerventiprecedenti1: TMenuItem
      Caption = 'Rapporto interventi precedenti'
      Visible = False
      OnClick = Rapportointerventiprecedenti1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object AllegatiFG1: TMenuItem
      Caption = 'Rapporto di controllo di efficienza energetica'
      OnClick = AllegatiFG1Click
    end
  end
  object QryTecnici: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      '  RESOURCEID'
      ' ,RESOURCENAME'
      ' ,GCAL_CALENDAR_ID'
      'FROM TECNICI'
      'WHERE ABILITATO <> '#39'F'#39
      'ORDER BY RESOURCENAME')
    Left = 714
    Top = 90
    object QryTecniciRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
      Required = True
    end
    object QryTecniciRESOURCENAME: TStringField
      FieldName = 'RESOURCENAME'
      Size = 255
    end
    object QryTecniciGCAL_CALENDAR_ID: TStringField
      FieldName = 'GCAL_CALENDAR_ID'
      Size = 60
    end
  end
  object SourceTecnici: TDataSource
    AutoEdit = False
    DataSet = QryTecnici
    Left = 742
    Top = 90
  end
  object QryDatiTecnico: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CODICE'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT '
      ' NOME,'
      
        ' CAST(INDIRIZZO || '#39' '#39' || CITTA || '#39' '#39' || PROVINCIA || '#39' - '#39'  ||' +
        ' TELEFONO AS VARCHAR(1000)) AS INDIRIZZOCOMPLETO,'
      ' ESTREMIDOCQUALIFICA '
      ''
      'FROM TECNICI'
      'WHERE RESOURCEID = :P_CODICE')
    Left = 714
    Top = 162
    object QryDatiTecnicoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryDatiTecnicoINDIRIZZOCOMPLETO: TMemoField
      FieldName = 'INDIRIZZOCOMPLETO'
      ReadOnly = True
      BlobType = ftMemo
    end
    object QryDatiTecnicoESTREMIDOCQUALIFICA: TStringField
      FieldName = 'ESTREMIDOCQUALIFICA'
      Size = 60
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = QryDatiTecnico
    Left = 742
    Top = 162
  end
  object QryIntPrec: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAPRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAORADOCATTUALE'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    OnCalcFields = QryIntPrecCalcFields
    SQL.Strings = (
      'SELECT'
      ' UIV.MASTER_ID'
      ',UIV.TIPORECORD'
      ',UIV.TIPODOC'
      ',UIV.NUMDOC'
      ',UIV.REGDOC'
      ',UIV.DATADOC'
      ',UIV.CODICE'
      ',UIV.DESCRIZIONE'
      ',UIV.UM'
      ',UIV.QTA'
      ',UIV.PRZUNIT'
      ',UIV.PRZUNITIVACOMP'
      ',UIV.S1'
      ',UIV.S2'
      ',UIV.S3'
      ',UIV.IMPORTO'
      ',UIV.IMPORTOIVACOMP'
      ',UIV.TECNICO_NOME'
      ',UIV.IDAPPARECCHIOPRAT'
      
        ',CAST((COALESCE(PA.COSTRUTTORE,'#39#39') || '#39' '#39' || COALESCE(PA.MODELLO' +
        ','#39#39') || '#39' ('#39' ||COALESCE( PA.MATRICOLA,'#39#39') || '#39') '#39' || COALESCE(PA' +
        '.UBICAZIONE,'#39#39')) AS VARCHAR(200)) AS APPARECCHIO_FULL'
      ',UIV.INABBONAMENTO'
      ',UIV.RifDoc_Tipo'
      ',UIV.RifDoc_Num'
      ',UIV.RifDoc_Reg'
      ',UIV.RifDoc_Data'
      ',UIV.RifDoc_CorrispNoPag'
      ',UIV.RifDoc_TotaleDocumento'
      'FROM IMP_ULTIMI_INTERVENTI_VIEW UIV'
      'LEFT JOIN PRATAPPARECCHI PA ON (PA.ID=UIV.IDAPPARECCHIOPRAT)'
      'WHERE'
      ' (UIV.CLIENTE = :P_CLIENTE   OR   :P_CLIENTE = 0)'
      ' AND (UIV.PRATICA = :P_PRATICA   OR   :P_PRATICA = 0)'
      ' AND (UIV.DATAPRATICA1 = :P_DATAPRATICA   OR   :P_PRATICA = 0)'
      
        '-- AND (UIV.TIPORECORD = '#39'10-RELAZIONE INTERVENTO'#39' OR COALESCE(U' +
        'IV.IDAPPARECCHIOPRAT,0) = 0)'
      ' AND UIV.DATADOC < :P_DATAORADOCATTUALE'
      
        'ORDER BY UIV.DATADOC DESC, UIV.MASTER_ID DESC, UIV.IDAPPARECCHIO' +
        'PRAT DESC, UIV.TIPORECORD'
      '')
    Left = 714
    Top = 210
    object QryIntPrecTIPORECORD: TStringField
      FieldName = 'TIPORECORD'
      Size = 25
    end
    object QryIntPrecMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
    end
    object QryIntPrecTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 25
    end
    object QryIntPrecNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object QryIntPrecREGDOC: TStringField
      FieldName = 'REGDOC'
      Size = 5
    end
    object QryIntPrecDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryIntPrecCODICE: TStringField
      FieldName = 'CODICE'
      Size = 25
    end
    object QryIntPrecDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 5000
    end
    object QryIntPrecUM: TStringField
      FieldName = 'UM'
      Size = 2
    end
    object QryIntPrecQTA: TIBOFloatField
      FieldName = 'QTA'
    end
    object QryIntPrecPRZUNIT: TIBOFloatField
      FieldName = 'PRZUNIT'
    end
    object QryIntPrecPRZUNITIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITIVACOMP'
    end
    object QryIntPrecS1: TIBOFloatField
      FieldName = 'S1'
    end
    object QryIntPrecS2: TIBOFloatField
      FieldName = 'S2'
    end
    object QryIntPrecS3: TIBOFloatField
      FieldName = 'S3'
    end
    object QryIntPrecIMPORTO: TIBOFloatField
      FieldName = 'IMPORTO'
    end
    object QryIntPrecIMPORTOIVACOMP: TIBOFloatField
      FieldName = 'IMPORTOIVACOMP'
    end
    object QryIntPrecTECNICO_NOME: TStringField
      FieldName = 'TECNICO_NOME'
      Size = 255
    end
    object QryIntPrecIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryIntPrecCALC_PRZUNITNETTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_PRZUNITNETTO'
      Calculated = True
    end
    object QryIntPrecCALC_PRZUNITIVACOMPNETTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_PRZUNITIVACOMPNETTO'
      Calculated = True
    end
    object QryIntPrecINABBONAMENTO: TStringField
      FieldName = 'INABBONAMENTO'
      Size = 1
    end
    object QryIntPrecRIFDOC_TIPO: TStringField
      FieldName = 'RIFDOC_TIPO'
      Size = 25
    end
    object QryIntPrecRIFDOC_NUM: TIntegerField
      FieldName = 'RIFDOC_NUM'
    end
    object QryIntPrecRIFDOC_REG: TStringField
      FieldName = 'RIFDOC_REG'
      Size = 5
    end
    object QryIntPrecRIFDOC_DATA: TDateTimeField
      FieldName = 'RIFDOC_DATA'
    end
    object QryIntPrecRIFDOC_CORRISPNOPAG: TStringField
      FieldName = 'RIFDOC_CORRISPNOPAG'
      Size = 1
    end
    object QryIntPrecRIFDOC_TOTALEDOCUMENTO: TIBOFloatField
      FieldName = 'RIFDOC_TOTALEDOCUMENTO'
      currency = True
    end
    object QryIntPrecAPPARECCHIO_FULL: TStringField
      FieldName = 'APPARECCHIO_FULL'
      ReadOnly = True
      Size = 200
    end
  end
  object SourceIntPrec: TDataSource
    AutoEdit = False
    DataSet = QryIntPrec
    Left = 744
    Top = 210
  end
  object QryOP: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IDIMPEGNO'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DeleteSQL.Strings = (
      'DELETE FROM OPIMPEGNO'
      'WHERE'
      '   OPIMPEGNO.ID = :OLD_ID'
      '')
    EditSQL.Strings = (
      'UPDATE OPIMPEGNO SET'
      '      OPIMPEGNO.ID = :ID,'
      '      OPIMPEGNO.IDIMPEGNO = :IDIMPEGNO,'
      '      OPIMPEGNO.IDPRATICA = :IDPRATICA,'
      '      OPIMPEGNO.IDOPPRATICA = :IDOPPRATICA,'
      '      OPIMPEGNO.IDAPPARECCHIOPRAT = :IDAPPARECCHIOPRAT,'
      '      OPIMPEGNO.IDOP = :IDOP,'
      '      OPIMPEGNO.DESCRIZIONE = :DESCRIZIONE,'
      '      OPIMPEGNO.DAEFFETTUARE = :DAEFFETTUARE,'
      '      OPIMPEGNO.EFFETTUATA = :EFFETTUATA,'
      '      OPIMPEGNO.MINUTIPREVISTI = :MINUTIPREVISTI,'
      '      OPIMPEGNO.PERIODICITA = :PERIODICITA,'
      '      OPIMPEGNO.ULTIMA = :ULTIMA,'
      '      OPIMPEGNO.PROSSIMA = :PROSSIMA,'
      '      OPIMPEGNO.PRZUNIT = :PRZUNIT,'
      '      OPIMPEGNO.SCONTO1 = :SCONTO1,'
      '      OPIMPEGNO.SCONTO2 = :SCONTO2,'
      '      OPIMPEGNO.SCONTO3 = :SCONTO3,'
      '      OPIMPEGNO.PRZUNITNETTO = :PRZUNITNETTO,'
      '      OPIMPEGNO.CODICEIVA = :CODICEIVA,'
      '      OPIMPEGNO.PRZUNITIVACOMP = :PRZUNITIVACOMP,'
      '      OPIMPEGNO.PRZUNITNETTOIVACOMP = :PRZUNITNETTOIVACOMP,'
      '      OPIMPEGNO.ADDEBITA = :ADDEBITA,'
      '      OPIMPEGNO.INABBONAMENTO = :INABBONAMENTO'
      'WHERE OPIMPEGNO.ID = :OLD_ID')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO OPIMPEGNO'
      '('
      '      OPIMPEGNO.ID,'
      '      OPIMPEGNO.IDIMPEGNO,'
      '      OPIMPEGNO.IDPRATICA,'
      '      OPIMPEGNO.IDOPPRATICA,'
      '      OPIMPEGNO.IDAPPARECCHIOPRAT,'
      '      OPIMPEGNO.IDOP,'
      '      OPIMPEGNO.DESCRIZIONE,'
      '      OPIMPEGNO.DAEFFETTUARE,'
      '      OPIMPEGNO.EFFETTUATA,'
      '      OPIMPEGNO.MINUTIPREVISTI,'
      '      OPIMPEGNO.PERIODICITA,'
      '      OPIMPEGNO.ULTIMA,'
      '      OPIMPEGNO.PROSSIMA,'
      '      OPIMPEGNO.PRZUNIT,'
      '      OPIMPEGNO.SCONTO1,'
      '      OPIMPEGNO.SCONTO2,'
      '      OPIMPEGNO.SCONTO3,'
      '      OPIMPEGNO.PRZUNITNETTO,'
      '      OPIMPEGNO.CODICEIVA,'
      '      OPIMPEGNO.PRZUNITIVACOMP,'
      '      OPIMPEGNO.PRZUNITNETTOIVACOMP,'
      '      OPIMPEGNO.ADDEBITA,'
      '      OPIMPEGNO.INABBONAMENTO'
      ')'
      'VALUES'
      '('
      '      :ID,'
      '      :IDIMPEGNO,'
      '      :IDPRATICA,'
      '      :IDOPPRATICA,'
      '      :IDAPPARECCHIOPRAT,'
      '      :IDOP,'
      '      :DESCRIZIONE,'
      '      :DAEFFETTUARE,'
      '      :EFFETTUATA,'
      '      :MINUTIPREVISTI,'
      '      :PERIODICITA,'
      '      :ULTIMA,'
      '      :PROSSIMA,'
      '      :PRZUNIT,'
      '      :SCONTO1,'
      '      :SCONTO2,'
      '      :SCONTO3,'
      '      :PRZUNITNETTO,'
      '      :CODICEIVA,'
      '      :PRZUNITIVACOMP,'
      '      :PRZUNITNETTOIVACOMP,'
      '      :ADDEBITA,'
      '      :INABBONAMENTO'
      ')'
      ''
      '')
    KeyLinks.Strings = (
      'OPIMPEGNO.ID')
    KeyLinksAutoDefine = False
    PessimisticLocking = True
    RecordCountAccurate = True
    BeforePost = QryOPBeforePost
    AfterPost = QryOPAfterPost
    KeyRelation = 'OPIMPEGNO'
    SQL.Strings = (
      'SELECT'
      '      OPIMPEGNO.ID,'
      '      OPIMPEGNO.IDIMPEGNO,'
      '      OPIMPEGNO.IDPRATICA,'
      '      OPIMPEGNO.IDOPPRATICA,'
      '      OPIMPEGNO.IDAPPARECCHIOPRAT,'
      '      OPIMPEGNO.IDOP,'
      '      OPIMPEGNO.DESCRIZIONE,'
      
        '      CAST(COALESCE(OPIMPEGNO.DAEFFETTUARE, '#39'F'#39') AS CHAR(1)) AS ' +
        'DAEFFETTUARE,'
      
        '      CAST(COALESCE(OPIMPEGNO.EFFETTUATA, '#39'F'#39') AS CHAR(1)) AS EF' +
        'FETTUATA,'
      '      OPIMPEGNO.MINUTIPREVISTI,'
      '      OPIMPEGNO.PERIODICITA,'
      '      OPIMPEGNO.ULTIMA,'
      '      OPIMPEGNO.PROSSIMA,'
      '      OPIMPEGNO.PRZUNIT,'
      '      OPIMPEGNO.SCONTO1,'
      '      OPIMPEGNO.SCONTO2,'
      '      OPIMPEGNO.SCONTO3,'
      '      OPIMPEGNO.PRZUNITNETTO,'
      '      OPIMPEGNO.CODICEIVA,'
      '      OPIMPEGNO.PRZUNITIVACOMP,'
      '      OPIMPEGNO.PRZUNITNETTOIVACOMP,'
      '      OPIMPEGNO.ADDEBITA,'
      '      OPIMPEGNO.INABBONAMENTO'
      ''
      'FROM OPIMPEGNO'
      'WHERE OPIMPEGNO.IDIMPEGNO = :P_IDIMPEGNO')
    Left = 714
    Top = 125
    object QryOPID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryOPIDIMPEGNO: TIntegerField
      FieldName = 'IDIMPEGNO'
      Required = True
    end
    object QryOPIDPRATICA: TIntegerField
      FieldName = 'IDPRATICA'
    end
    object QryOPIDOPPRATICA: TIntegerField
      FieldName = 'IDOPPRATICA'
    end
    object QryOPIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryOPIDOP: TStringField
      FieldName = 'IDOP'
      Size = 25
    end
    object QryOPDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryOPDAEFFETTUARE: TStringField
      FieldName = 'DAEFFETTUARE'
      Size = 1
    end
    object QryOPEFFETTUATA: TStringField
      FieldName = 'EFFETTUATA'
      Size = 1
    end
    object QryOPMINUTIPREVISTI: TIntegerField
      FieldName = 'MINUTIPREVISTI'
    end
    object QryOPPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QryOPULTIMA: TDateTimeField
      FieldName = 'ULTIMA'
    end
    object QryOPPROSSIMA: TDateTimeField
      FieldName = 'PROSSIMA'
    end
    object QryOPPRZUNIT: TIBOFloatField
      FieldName = 'PRZUNIT'
      OnValidate = QryOPPRZUNITValidate
      currency = True
    end
    object QryOPSCONTO1: TIBOFloatField
      FieldName = 'SCONTO1'
      OnValidate = QryOPPRZUNITValidate
    end
    object QryOPSCONTO2: TIBOFloatField
      FieldName = 'SCONTO2'
      OnValidate = QryOPPRZUNITValidate
    end
    object QryOPSCONTO3: TIBOFloatField
      FieldName = 'SCONTO3'
      OnValidate = QryOPPRZUNITValidate
    end
    object QryOPPRZUNITNETTO: TIBOFloatField
      FieldName = 'PRZUNITNETTO'
      currency = True
    end
    object QryOPCODICEIVA: TIntegerField
      FieldName = 'CODICEIVA'
      OnValidate = QryOPPRZUNITValidate
    end
    object QryOPPRZUNITIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITIVACOMP'
      currency = True
    end
    object QryOPPRZUNITNETTOIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITNETTOIVACOMP'
      OnValidate = QryOPPRZUNITNETTOIVACOMPValidate
      currency = True
    end
    object QryOPADDEBITA: TStringField
      FieldName = 'ADDEBITA'
      Size = 1
    end
    object QryOPINABBONAMENTO: TStringField
      FieldName = 'INABBONAMENTO'
      Size = 1
    end
    object QryOPALIQUOTAIVA: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQUOTAIVA'
      LookupDataSet = DM1.TableAliquoteIVA
      LookupKeyFields = 'CODICEIVA'
      LookupResultField = 'ALIQUOTAIVA'
      KeyFields = 'CODICEIVA'
      Lookup = True
    end
    object QryOPLookup_DESCAPPARECCHIOPRAT: TStringField
      FieldKind = fkLookup
      FieldName = 'Lookup_DESCAPPARECCHIOPRAT'
      LookupDataSet = QryPratApp
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPUTED_APPARECCHIO_NOUBICAZ'
      KeyFields = 'IDAPPARECCHIOPRAT'
      Size = 200
      Lookup = True
    end
  end
  object SourceOP: TDataSource
    AutoEdit = False
    DataSet = QryOP
    Left = 742
    Top = 125
  end
  object MenuOP: TPopupMenu
    Left = 304
    Top = 24
    object AggiornaOP1: TMenuItem
      Caption = 
        'Aggiorna la situazione delle operazioni pianificate nell'#39'impiant' +
        'o'
      OnClick = AggiornaOP1Click
    end
  end
  object QryAllegati: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IDIMPEGNO'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DeleteSQL.Strings = (
      'DELETE FROM ALLEGATI_MANUT'
      'WHERE '
      '  ID = :OLD_ID')
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT A.ID, A.IDIMPEGNO, A.TIPO, A.STATOAVANZAMENTO, A.DATACONT' +
        'ROLLO,'
      
        '       A.GENCAL_ID, A.GENCAL_COSTRUTTORE, A.GENCAL_MODELLO, A.GE' +
        'NCAL_MATRICOLA,'
      
        '       A.BRUC_ID, A.BRUC_COSTRUTTORE, A.BRUC_MODELLO, A.BRUC_MAT' +
        'RICOLA'
      'FROM ALLEGATI_MANUT A'
      'WHERE IDIMPEGNO = :P_IDIMPEGNO'
      '')
    Left = 714
    Top = 291
    object QryAllegatiID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryAllegatiTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object QryAllegatiDATACONTROLLO: TDateTimeField
      FieldName = 'DATACONTROLLO'
    end
    object QryAllegatiGENCAL_ID: TIntegerField
      FieldName = 'GENCAL_ID'
    end
    object QryAllegatiGENCAL_COSTRUTTORE: TStringField
      FieldName = 'GENCAL_COSTRUTTORE'
      Size = 45
    end
    object QryAllegatiGENCAL_MODELLO: TStringField
      FieldName = 'GENCAL_MODELLO'
      Size = 30
    end
    object QryAllegatiGENCAL_MATRICOLA: TStringField
      FieldName = 'GENCAL_MATRICOLA'
      Size = 30
    end
    object QryAllegatiBRUC_ID: TIntegerField
      FieldName = 'BRUC_ID'
    end
    object QryAllegatiBRUC_COSTRUTTORE: TStringField
      FieldName = 'BRUC_COSTRUTTORE'
      Size = 45
    end
    object QryAllegatiBRUC_MODELLO: TStringField
      FieldName = 'BRUC_MODELLO'
      Size = 30
    end
    object QryAllegatiBRUC_MATRICOLA: TStringField
      FieldName = 'BRUC_MATRICOLA'
      Size = 30
    end
    object QryAllegatiIDIMPEGNO: TIntegerField
      FieldName = 'IDIMPEGNO'
    end
    object QryAllegatiSTATOAVANZAMENTO: TSmallintField
      FieldName = 'STATOAVANZAMENTO'
    end
  end
  object SourceAllegati: TDataSource
    AutoEdit = False
    DataSet = QryAllegati
    Left = 742
    Top = 291
  end
  object MenuNuovoAllegato: TPopupMenu
    Left = 344
    Top = 24
    object CreazioneallegatiFG1: TMenuItem
      Caption = 'Creazione allegati F/G  '
      OnClick = CreazioneallegatiFG1Click
    end
  end
  object QryPresc: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAPRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAORADOCATTUALE'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    EditSQL.Strings = (
      'UPDATE CLIENTI SET'
      'CODICE=CODICE'
      'WHERE 1=2')
    IB_Connection = DM1.DBAzienda
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      '  P.UNIQUEKEYFIELD,'
      '  P.TIPORECORD,'
      '  P.IDIMPEGNO,'
      '  P.IDALLEGATO,'
      '  P.IDAPPARECCHIOPRAT,'
      '  P.DATADOC,'
      '  P.CODICE,'
      '  P.DESCRIZIONE,'
      '  P.FATTO,'
      '  P.FATTO_DATA,'
      '  P.FATTO_NOTE,'
      '  P.TECNICO_NOME'
      'FROM IMP_PRESCRIZIONI_VIEW P'
      'WHERE'
      ' (P.CLIENTE = :P_CLIENTE   OR   :P_CLIENTE = 0)'
      ' AND (P.PRATICA = :P_PRATICA   OR   :P_PRATICA = 0)'
      ' AND (P.DATAPRATICA1 = :P_DATAPRATICA   OR   :P_PRATICA = 0)'
      ' AND P.DATADOC < :P_DATAORADOCATTUALE'
      'ORDER BY P.DATADOC DESC, P.TIPORECORD'
      '')
    Left = 714
    Top = 250
    object QryPrescTIPORECORD: TStringField
      FieldName = 'TIPORECORD'
      Size = 25
    end
    object QryPrescIDIMPEGNO: TIntegerField
      FieldName = 'IDIMPEGNO'
    end
    object QryPrescIDALLEGATO: TIntegerField
      FieldName = 'IDALLEGATO'
    end
    object QryPrescCODICE: TStringField
      FieldName = 'CODICE'
      Size = 25
    end
    object QryPrescDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 5000
    end
    object QryPrescTECNICO_NOME: TStringField
      FieldName = 'TECNICO_NOME'
      Size = 255
    end
    object QryPrescDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryPrescUNIQUEKEYFIELD: TStringField
      FieldName = 'UNIQUEKEYFIELD'
      Size = 100
    end
    object QryPrescIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryPrescFATTO: TStringField
      FieldName = 'FATTO'
      Size = 1
    end
    object QryPrescFATTO_DATA: TDateTimeField
      FieldName = 'FATTO_DATA'
    end
    object QryPrescFATTO_NOTE: TStringField
      FieldName = 'FATTO_NOTE'
      Size = 60
    end
  end
  object SourcePresc: TDataSource
    DataSet = QryPresc
    Left = 742
    Top = 250
  end
  object TimerBlink: TTimer
    OnTimer = TimerBlinkTimer
    Left = 400
    Top = 24
  end
  object QryPratApp: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_MASTER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_IDPRATICA'
        ParamType = ptInput
      end>
    AutoFetchAll = True
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    EditSQL.Strings = (
      
        'EXECUTE PROCEDURE  IMPAPPSEL_SETAPPSEL (:MASTER_ID, :ID, :SELECT' +
        'ED)'
      '')
    IB_Connection = DM1.DBAzienda
    RecordCountAccurate = True
    AfterDelete = QryPratAppAfterDelete
    AfterOpen = QryPratAppAfterOpen
    BeforePost = QryPratAppBeforePost
    AfterPost = QryPratAppAfterPost
    OnCalcFields = QryPratAppCalcFields
    AfterRefresh = QryPratAppAfterRefresh
    SQL.Strings = (
      
        'SELECT PA.ID, I.MASTER_ID, PA.COSTRUTTORE, PA.MODELLO, PA.MATRIC' +
        'OLA, PA.UBICAZIONE, PA.TIPOAPPARECCHIO,'
      
        ' PA.ANNOCOSTRUZIONE, PA.DATAINSTALLAZIONE, PA.DATACOLLAUDO, PA.I' +
        'DAPPABBINATO, PA.GARANZIA_SCADENZA, PA.GARANZIA_NOTE,'
      
        ' PA.POTENZATERMICA, PA.POTENZATERMICA2, PA.TIPOCAMERA, PA.COMBUS' +
        'TIBILE, PA.COMBUSTIBILEALTRO, PA.GARANZIA_MESI, PA.GARANZIA_MESI' +
        '_ESTENSIONE,'
      
        ' PA.DISMESSO, PA.DISMESSO_DATA, PA.DISMESSO_NOTE, PA.VOLTAGGIOEL' +
        'ETTRICO, PA.POTENZAELETTRICA, PA.PORTATA, PA.PREVALENZA,'
      ' PA.REFRIGERANTE, PA.CARICA, PA.POTENZAFRIGORIFERA,'
      
        ' (SELECT OUTVAR FROM IMPAPPSEL_GETSELECTED (I.MASTER_ID, PA.ID))' +
        ' AS SELECTED'
      'FROM PRATAPPARECCHI PA'
      'LEFT OUTER JOIN IMPEGNI I ON (I.MASTER_ID = :P_MASTER_ID)'
      'WHERE PA.IDPRATICA = :P_IDPRATICA'
      '')
    Left = 714
    Top = 333
    object QryPratAppID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryPratAppMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
      ReadOnly = True
      Required = True
    end
    object QryPratAppCOSTRUTTORE: TStringField
      FieldName = 'COSTRUTTORE'
      Size = 45
    end
    object QryPratAppMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 30
    end
    object QryPratAppMATRICOLA: TStringField
      FieldName = 'MATRICOLA'
      Size = 30
    end
    object QryPratAppUBICAZIONE: TStringField
      FieldName = 'UBICAZIONE'
      Size = 30
    end
    object QryPratAppTIPOAPPARECCHIO: TStringField
      FieldName = 'TIPOAPPARECCHIO'
      Size = 30
    end
    object QryPratAppANNOCOSTRUZIONE: TIntegerField
      Alignment = taCenter
      FieldName = 'ANNOCOSTRUZIONE'
    end
    object QryPratAppDATAINSTALLAZIONE: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATAINSTALLAZIONE'
    end
    object QryPratAppDATACOLLAUDO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATACOLLAUDO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QryPratAppDISMESSO: TStringField
      FieldName = 'DISMESSO'
      Size = 1
    end
    object QryPratAppIDAPPABBINATO: TIntegerField
      FieldName = 'IDAPPABBINATO'
    end
    object QryPratAppCOMPUTED_APPARECCHIO_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_APPARECCHIO_FULL'
      Size = 200
      Calculated = True
    end
    object QryPratAppCOMPUTED_APPARECCHIO_NOUBICAZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_APPARECCHIO_NOUBICAZ'
      Size = 200
      Calculated = True
    end
    object QryPratAppCOMPUTED_ABBINATO: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ABBINATO'
      Calculated = True
    end
    object QryPratAppCOMPUTED_ORDER1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ORDER1'
      Calculated = True
    end
    object QryPratAppCOMPUTED_ORDER2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ORDER2'
      Calculated = True
    end
    object QryPratAppSELECTED: TStringField
      FieldName = 'SELECTED'
      Size = 1
    end
    object QryPratAppPOTENZATERMICA: TIBOFloatField
      FieldName = 'POTENZATERMICA'
    end
    object QryPratAppPOTENZATERMICA2: TIBOFloatField
      FieldName = 'POTENZATERMICA2'
    end
    object QryPratAppTIPOCAMERA: TStringField
      FieldName = 'TIPOCAMERA'
    end
    object QryPratAppCOMBUSTIBILE: TStringField
      FieldName = 'COMBUSTIBILE'
    end
    object QryPratAppCOMBUSTIBILEALTRO: TStringField
      FieldName = 'COMBUSTIBILEALTRO'
    end
    object QryPratAppGARANZIA_SCADENZA: TDateTimeField
      FieldName = 'GARANZIA_SCADENZA'
    end
    object QryPratAppGARANZIA_NOTE: TStringField
      FieldName = 'GARANZIA_NOTE'
      Size = 100
    end
    object QryPratAppGARANZIA_MESI: TSmallintField
      FieldName = 'GARANZIA_MESI'
    end
    object QryPratAppGARANZIA_MESI_ESTENSIONE: TSmallintField
      FieldName = 'GARANZIA_MESI_ESTENSIONE'
    end
    object QryPratAppCOMPUTED_INGARANZIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_INGARANZIA'
      Size = 1
      Calculated = True
    end
    object QryPratAppDISMESSO_DATA: TDateTimeField
      FieldName = 'DISMESSO_DATA'
    end
    object QryPratAppDISMESSO_NOTE: TStringField
      FieldName = 'DISMESSO_NOTE'
      Size = 100
    end
    object QryPratAppVOLTAGGIOELETTRICO: TIntegerField
      FieldName = 'VOLTAGGIOELETTRICO'
    end
    object QryPratAppPOTENZAELETTRICA: TIBOFloatField
      FieldName = 'POTENZAELETTRICA'
    end
    object QryPratAppPORTATA: TIBOFloatField
      FieldName = 'PORTATA'
    end
    object QryPratAppPREVALENZA: TIBOFloatField
      FieldName = 'PREVALENZA'
    end
    object QryPratAppREFRIGERANTE: TStringField
      FieldName = 'REFRIGERANTE'
    end
    object QryPratAppCARICA: TIBOFloatField
      FieldName = 'CARICA'
    end
    object QryPratAppPOTENZAFRIGORIFERA: TIBOFloatField
      FieldName = 'POTENZAFRIGORIFERA'
    end
    object QryPratAppCOMPUTED_GARANZIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_GARANZIA'
      Size = 100
      Calculated = True
    end
    object QryPratAppCOMPUTED_GARANZIA_NOTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_GARANZIA_NOTE'
      Size = 100
      Calculated = True
    end
  end
  object SourcePratApp: TDataSource
    AutoEdit = False
    DataSet = QryPratApp
    Left = 742
    Top = 333
  end
  object ImageList_PratApp: TImageList
    Height = 9
    Width = 10
    Left = 440
    Top = 24
    Bitmap = {
      494C01010100030004000A000900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000028000000090000000100200000000000A005
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000028000000090000000100010000000000480000000000000000000000
      000000000000000000000000FFFFFF009F000000000000008E00000000000000
      C440000000000000E0C0000000000000F1C0000000000000E0C0000000000000
      C4400000000000008E000000000000009F000000000000000000000000000000
      0000000000000000000000000000}
  end
  object QrySogg: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CODICE'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    EditSQL.Strings = (
      'UPDATE CLIENTI SET'
      ''
      '  RAGIONESOCIALE = :RAGIONESOCIALE'
      '  ,INDIRIZZO = :INDIRIZZO'
      '  ,NUMCIVICO = :NUMCIVICO'
      '  ,CITTA = :CITTA'
      '  ,CAP = :CAP'
      '  ,PROVINCIA = :PROVINCIA'
      '  ,TELEFONO = :TELEFONO'
      '  ,CELLULARE = :CELLULARE'
      '  ,PARTITAIVA = :PARTITAIVA'
      '  ,CODICEFISCALE = :CODICEFISCALE'
      '  ,NOTE = :NOTE'
      '  ,NOTEPRIVATE = :NOTEPRIVATE'
      ''
      'WHERE CODICE = :CODICE'
      '')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO CLIENTI ('
      ''
      '  RAGIONESOCIALE'
      '  ,INDIRIZZO'
      '  ,NUMCIVICO'
      '  ,CITTA'
      '  ,CAP'
      '  ,PROVINCIA'
      '  ,TELEFONO'
      '  ,CELLULARE'
      '  ,PARTITAIVA'
      '  ,CODICEFISCALE'
      '  ,NOTE'
      '  ,NOTEPRIVATE'
      ''
      ') VALUES ('
      ''
      '  :RAGIONESOCIALE'
      '  ,:INDIRIZZO'
      '  ,:NUMCIVICO'
      '  ,:CITTA'
      '  ,:CAP'
      '  ,:PROVINCIA'
      '  ,:TELEFONO'
      '  ,:CELLULARE'
      '  ,:PARTITAIVA'
      '  ,:CODICEFISCALE'
      '  ,:NOTE'
      '  ,:NOTEPRIVATE'
      ''
      ')'
      '')
    PessimisticLocking = True
    RecordCountAccurate = True
    AfterOpen = QrySoggAfterOpen
    BeforePost = QrySoggAfterOpen
    SQL.Strings = (
      'SELECT'
      '   C.CODICE'
      '  ,C.RAGIONESOCIALE'
      '  ,C.INDIRIZZO'
      '  ,C.NUMCIVICO'
      '  ,C.CITTA'
      '  ,C.CAP'
      '  ,C.PROVINCIA'
      '  ,C.TELEFONO'
      '  ,C.CELLULARE'
      '  ,C.PARTITAIVA'
      '  ,C.CODICEFISCALE'
      '  ,C.NOTE'
      '  ,C.NOTEPRIVATE'
      ''
      'FROM CLIENTI C'
      'WHERE C.CODICE = :P_CODICE'
      '')
    Left = 714
    Top = 33
    object QrySoggCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QrySoggRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Size = 60
    end
    object QrySoggINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 80
    end
    object QrySoggNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QrySoggCITTA: TStringField
      FieldName = 'CITTA'
      Size = 60
    end
    object QrySoggCAP: TStringField
      FieldName = 'CAP'
      Size = 5
    end
    object QrySoggPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
    object QrySoggTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
    object QrySoggCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Size = 30
    end
    object QrySoggPARTITAIVA: TStringField
      FieldName = 'PARTITAIVA'
      Size = 16
    end
    object QrySoggCODICEFISCALE: TStringField
      FieldName = 'CODICEFISCALE'
      Size = 16
    end
    object QrySoggNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QrySoggNOTEPRIVATE: TMemoField
      FieldName = 'NOTEPRIVATE'
      BlobType = ftMemo
    end
  end
  object SourceSogg: TDataSource
    AutoEdit = False
    DataSet = QrySogg
    Left = 742
    Top = 33
  end
  object QryParamFoglioLavoro: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRATICA'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DeleteSQL.Strings = (
      'DELETE FROM ALLEGATI_MANUT'
      'WHERE '
      '  ID = :OLD_ID')
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT * FROM GET_PARAM_FOGLIO_LAVORO(:ID_PRATICA)')
    Left = 714
    Top = 379
    object QryParamFoglioLavoroFL_LOGO_INTESTAZIONE: TStringField
      FieldName = 'FL_LOGO_INTESTAZIONE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_TITOLO: TStringField
      FieldName = 'FL_TITOLO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_PRESCRIZIONI: TStringField
      FieldName = 'FL_DATI_PRESCRIZIONI'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_CHIAMATA: TStringField
      FieldName = 'FL_DATI_CHIAMATA'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_APPUNTAMENTO: TStringField
      FieldName = 'FL_DATI_APPUNTAMENTO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_SOGGETTO: TStringField
      FieldName = 'FL_DATI_SOGGETTO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_SOGGETTO_NOTE: TStringField
      FieldName = 'FL_DATI_SOGGETTO_NOTE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_IMPIANTO: TStringField
      FieldName = 'FL_DATI_IMPIANTO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_ABBONAMENTO: TStringField
      FieldName = 'FL_DATI_ABBONAMENTO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_IMMOBILE: TStringField
      FieldName = 'FL_DATI_IMMOBILE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_RESPIMP: TStringField
      FieldName = 'FL_DATI_RESPIMP'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_PROP_UT_AMM: TStringField
      FieldName = 'FL_DATI_PROP_UT_AMM'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_PROPRIETARIO: TStringField
      FieldName = 'FL_DATI_PROPRIETARIO'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_UTENTE: TStringField
      FieldName = 'FL_DATI_UTENTE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_INSTALLATORE: TStringField
      FieldName = 'FL_DATI_INSTALLATORE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_IMPIANTO_NOTE: TStringField
      FieldName = 'FL_DATI_IMPIANTO_NOTE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_APPARECCHI: TStringField
      FieldName = 'FL_DATI_APPARECCHI'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_APPARECCHI_SEPARATI: TStringField
      FieldName = 'FL_DATI_APPARECCHI_SEPARATI'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_OP: TStringField
      FieldName = 'FL_DATI_OP'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_OP_SOLODAFARE: TStringField
      FieldName = 'FL_DATI_OP_SOLODAFARE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_PRECEDENTI: TStringField
      FieldName = 'FL_DATI_PRECEDENTI'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_NUMULTINTERV: TIntegerField
      FieldName = 'FL_DATI_NUMULTINTERV'
    end
    object QryParamFoglioLavoroFL_DATI_RAPPINT: TStringField
      FieldName = 'FL_DATI_RAPPINT'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_MERCE: TStringField
      FieldName = 'FL_DATI_MERCE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_ALTRESPESE: TStringField
      FieldName = 'FL_DATI_ALTRESPESE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_FIRME: TStringField
      FieldName = 'FL_DATI_FIRME'
      Size = 1
    end
    object QryParamFoglioLavoroFL_LOGO_PIEDE: TStringField
      FieldName = 'FL_LOGO_PIEDE'
      Size = 1
    end
    object QryParamFoglioLavoroFL_COPIE: TIntegerField
      FieldName = 'FL_COPIE'
    end
    object QryParamFoglioLavoroFL_LABEL_APPUNTAMENTO: TStringField
      FieldName = 'FL_LABEL_APPUNTAMENTO'
      Size = 30
    end
    object QryParamFoglioLavoroFL_LABEL_CHIAMATA: TStringField
      FieldName = 'FL_LABEL_CHIAMATA'
      Size = 30
    end
    object QryParamFoglioLavoroFL_LABEL_CLIENTE: TStringField
      FieldName = 'FL_LABEL_CLIENTE'
      Size = 30
    end
    object QryParamFoglioLavoroFL_LABEL_LUOGO: TStringField
      FieldName = 'FL_LABEL_LUOGO'
      Size = 30
    end
    object QryParamFoglioLavoroFL_LABEL_MOTIVO: TStringField
      FieldName = 'FL_LABEL_MOTIVO'
      Size = 30
    end
    object QryParamFoglioLavoroFL_LABEL_NOTE: TStringField
      FieldName = 'FL_LABEL_NOTE'
      Size = 30
    end
    object QryParamFoglioLavoroFL_DATI_INTESTAZFATTURA: TStringField
      FieldName = 'FL_DATI_INTESTAZFATTURA'
      FixedChar = True
      Size = 1
    end
    object QryParamFoglioLavoroFL_MESSAGGIO: TMemoField
      FieldName = 'FL_MESSAGGIO'
      BlobType = ftMemo
      Size = 1000
    end
    object QryParamFoglioLavoroFL_MESSAGGIO_ALTEZZA: TIntegerField
      FieldName = 'FL_MESSAGGIO_ALTEZZA'
    end
    object QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA: TIntegerField
      FieldName = 'FL_DATI_RAPPINT_NUMRIGHEDATAORA'
    end
    object QryParamFoglioLavoroFL_DATI_RAPPINT_ALTEZZARELAZINT: TIntegerField
      FieldName = 'FL_DATI_RAPPINT_ALTEZZARELAZINT'
    end
    object QryParamFoglioLavoroFL_DATI_RAPPINT_STATO: TStringField
      FieldName = 'FL_DATI_RAPPINT_STATO'
      FixedChar = True
      Size = 1
    end
    object QryParamFoglioLavoroFL_DATI_RICHIEDENTE: TStringField
      FieldName = 'FL_DATI_RICHIEDENTE'
      FixedChar = True
      Size = 1
    end
    object QryParamFoglioLavoroFL_LABEL_RICHIEDENTE: TStringField
      FieldName = 'FL_LABEL_RICHIEDENTE'
      Size = 30
    end
  end
  object ReportDesignerDialog1: TReportDesignerDialog
    LabelSettings.FirstLabel = 0
    LabelSettings.LabelCount = 0
    ShowFilterBeforePrint = False
    UseDataModules = True
    UseCurrentDatasets = True
    SaveLoadPrinterSetup = False
    ScriptsEnabled = True
    PrepareAutomatically = False
    PrintIfEmpty = True
    PrinterSettings.Copies = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    UsePrinterSettings = True
    UseModalPreview = False
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    Version = '1.59.0'
    SQLSettings.DelimiterType = delCustom
    UserSettings = [AllowSQLEdit, AllowDatasetEdit, AllowNewCalcFields, AllowBlockEdit, AllowScriptEdit]
    EditorSettings = [AutoEditAfterInsert, ShowDatafieldListbox, DatafieldsSorted, ShowScriptIndicator]
    DefaultFileExtension = '.QR2'
    DefaultFileFilter = 'Reports|*.QR2'
    Left = 192
    Top = 8
  end
  object SourceParamFoglioLavoro: TDataSource
    AutoEdit = False
    DataSet = QryParamFoglioLavoro
    Left = 742
    Top = 379
  end
  object PopupMenuAzzeraCantiereImpianto: TPopupMenu
    Left = 312
    Top = 328
    object Deselezionacantiereimpianto1: TMenuItem
      Caption = 'Deseleziona cantiere/impianto'
      OnClick = Deselezionacantiereimpianto1Click
    end
  end
  object PopupMenuAnnullaAppuntamento: TPopupMenu
    Left = 328
    Top = 392
    object AnnullaApuntamento1: TMenuItem
      Caption = 'Annulla appuntamento'
      OnClick = AnnullaApuntamento1Click
    end
  end
end
