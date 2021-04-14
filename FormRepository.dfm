inherited RepositoryForm: TRepositoryForm
  Left = 159
  Top = 265
  Caption = 'RepositoryForm'
  ClientHeight = 741
  ClientWidth = 734
  ExplicitWidth = 734
  ExplicitHeight = 741
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 623
    ExplicitHeight = 623
    object PanelGruppo1: TPanel [0]
      Left = 0
      Top = 0
      Width = 686
      Height = 427
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      DesignSize = (
        686
        427)
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 427
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
        Left = 104
        Top = 53
        Width = 48
        Height = 12
        Caption = 'Nome file'
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
        Left = 81
        Top = 20
        Width = 130
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
          'Repository')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Zoom = 100
      end
      object DBEMarca: TDBEdit
        Left = 158
        Top = 51
        Width = 250
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOMEFILE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object eSezione: TcxComboBox
        Left = 465
        Top = 71
        ParentFont = False
        Properties.DropDownRows = 38
        Properties.Sorted = True
        Properties.OnEditValueChanged = eSezionePropertiesEditValueChanged
        Properties.OnInitPopup = eSezionePropertiesInitPopup
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 200
      end
      object eMemo: TcxDBRichEdit
        Left = 80
        Top = 89
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataBinding.DataField = 'CONTENUTO'
        DataBinding.DataSource = DS
        Properties.MemoMode = True
        Properties.ScrollBars = ssVertical
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.HotTrack = False
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Height = 326
        Width = 585
      end
    end
    inherited PanelGriglia: TPanel
      Top = 427
      Height = 196
      ExplicitTop = 427
      ExplicitHeight = 196
      inherited GridList: TcxGrid
        Top = 41
        Height = 155
        ExplicitTop = 41
        ExplicitHeight = 155
        inherited tvList: TcxGridDBTableView
          OptionsData.Deleting = False
          OptionsView.CellAutoHeight = True
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          Styles.Selection = nil
          object tvListNOMEFILE: TcxGridDBColumn
            Caption = 'Nome file'
            DataBinding.FieldName = 'NOMEFILE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListFILEPATH: TcxGridDBColumn
            Caption = 'Azienda'
            DataBinding.FieldName = 'FILEPATH'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListVERSIONE: TcxGridDBColumn
            Caption = 'Versione'
            DataBinding.FieldName = 'VERSIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object tvListTIPOFILE: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'TIPOFILE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
        end
      end
      object PanelTop: TPanel
        Left = 0
        Top = 0
        Width = 686
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        object Panel18: TPanel
          Left = 521
          Top = 14
          Width = 165
          Height = 20
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object ButtonRepository: TSpeedButton
            Left = 1
            Top = 2
            Width = 161
            Height = 15
            Cursor = crHandPoint
            Caption = 'LDE Embedded Params Editor'
            Flat = True
            OnClick = ButtonRepositoryClick
          end
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    ParentBackground = False
    inherited RxSpeedButtonNuovo: TSpeedButton
      Enabled = False
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = False
    end
  end
  inherited Q: TIBOQuery
    EditSQL.Strings = (
      'UPDATE REPOSITORY SET'
      ''
      '      NOMEFILE = :NOMEFILE,'
      '      FILEPATH = :FILEPATH,'
      '      VERSIONE = :VERSIONE,'
      '      TIPOFILE = :TIPOFILE,'
      '      CONTENUTO = :CONTENUTO'
      '      '
      ''
      'WHERE NOMEFILE = :OLD_NOMEFILE'
      '  AND FILEPATH = :OLD_FILEPATH'
      ''
      '')
    IB_Connection = DM1.DBGenerale
    BeforePost = QBeforePost
    SQL.Strings = (
      'SELECT *'
      'FROM REPOSITORY'
      'WHERE TIPOFILE='#39'INI'#39)
    object QNOMEFILE: TStringField
      FieldName = 'NOMEFILE'
      Required = True
      Size = 100
    end
    object QVERSIONE: TIntegerField
      FieldName = 'VERSIONE'
    end
    object QTIPOFILE: TStringField
      FieldName = 'TIPOFILE'
      Size = 3
    end
    object QCONTENUTO: TBlobField
      FieldName = 'CONTENUTO'
      Size = 8
    end
    object QFILEPATH: TStringField
      FieldName = 'FILEPATH'
      Size = 100
    end
    object QALTROFILE1: TBlobField
      FieldName = 'ALTROFILE1'
      Size = 8
    end
    object QALTROFILE2: TBlobField
      FieldName = 'ALTROFILE2'
      Size = 8
    end
    object QALTROFILE3: TBlobField
      FieldName = 'ALTROFILE3'
      Size = 8
    end
    object QALTROFILE4: TBlobField
      FieldName = 'ALTROFILE4'
      Size = 8
    end
    object QALTROFILE5: TBlobField
      FieldName = 'ALTROFILE5'
      Size = 8
    end
    object QALTROFILE6: TBlobField
      FieldName = 'ALTROFILE6'
      Size = 8
    end
  end
  inherited MenuGriglia: TPopupMenu
    object Conversioni1: TMenuItem [0]
      Caption = 'Conversioni'
      object ConversionegeneratoridicaloredaallegatiFGaRCEE11: TMenuItem
        Caption = 
          'Conversione generatori di calore da allegati F/G a RCEE1 (solo 1' +
          ' volta)'
        OnClick = ConversionegeneratoridicaloredaallegatiFGaRCEE11Click
      end
      object Conversioneimpiantipernuovagestioneassistenzasolo1volta1: TMenuItem
        Caption = 
          'Conversione impianti per nuova gestione assistenza (solo 1 volta' +
          ')'
        OnClick = Conversioneimpiantipernuovagestioneassistenzasolo1volta1Click
      end
      object Conver1: TMenuItem
        Caption = 'Conversione soggetti persona fisica/giuridica (solo 1 volta)'
        OnClick = Conver1Click
      end
    end
    object N1: TMenuItem [1]
      Caption = '-'
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42611.818217731480000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
