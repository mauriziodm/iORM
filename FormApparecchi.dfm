inherited ApparecchiForm: TApparecchiForm
  Left = 24
  Top = 176
  Caption = 'ApparecchiForm'
  ClientHeight = 698
  ClientWidth = 831
  ExplicitWidth = 831
  ExplicitHeight = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Width = 729
    Height = 630
    ExplicitWidth = 729
    ExplicitHeight = 630
    object PanelGruppo2: TPanel [0]
      Left = 0
      Top = 201
      Width = 686
      Height = 346
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
        Height = 346
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
      object Label3: TLabel
        Left = 110
        Top = 45
        Width = 83
        Height = 16
        AutoSize = False
        Caption = 'File immagine'
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
      object Image1: TImage
        Left = 246
        Top = 72
        Width = 105
        Height = 105
        AutoSize = True
      end
      object Image2: TImage
        Left = 246
        Top = 224
        Width = 105
        Height = 105
        AutoSize = True
      end
      object LabelBitmapFileName2: TLabel
        Left = 110
        Top = 197
        Width = 83
        Height = 16
        AutoSize = False
        Caption = 'File immagine 2'
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
      object RichEdit2: TRichEdit
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
          'Rappresentazione grafica')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEBitmapFileName: TDBEdit
        Left = 246
        Top = 43
        Width = 427
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'BITMAPFILENAME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEBitmapFileName2: TDBEdit
        Left = 246
        Top = 195
        Width = 427
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'BITMAPFILENAME2'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBETipo: TcxDBRadioGroup
        Left = 392
        Top = 5
        DataBinding.DataField = 'TIPO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Normale'
            Value = 0
          end
          item
            Caption = 'Composto (tubi, muri)'
            Value = 1
          end>
        Style.BorderColor = clNone
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 33
        Width = 273
      end
    end
    object PanelGruppo1: TPanel [1]
      Left = 1
      Top = 4
      Width = 686
      Height = 191
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 191
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
        Top = 53
        Width = 400
        Height = 16
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
      object Label1: TLabel
        Left = 110
        Top = 77
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'Categoria'
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
        Top = 109
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'Lettera per riferimento'
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
      object Label5: TLabel
        Left = 110
        Top = 141
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'Sezione'
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
          'Dati del Materiale/Apparecchio')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEDescrizione: TDBEdit
        Left = 246
        Top = 51
        Width = 123
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'DESCRIZIONE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBECategoria: TcxDBComboBox
        Left = 245
        Top = 74
        AutoSize = False
        DataBinding.DataField = 'CATEGORIA'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Apparecchi'
          'Collettori'
          'Corpi scaldanti'
          'Etichette'
          'Flange'
          'Giunti'
          'Giunzioni'
          'Muri'
          'Nipples'
          'Raccordi'
          'Riduzioni'
          'Sanitari'
          'Scarico fumi'
          'Simboli agg.'
          'Sonde'
          'Stoccaggio'
          'Termostati'
          'Tubi'
          'Valvole'
          'Varie'
          'Ventilazioe aerazione')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Height = 23
        Width = 125
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 98
        Top = 154
        DataBinding.DataField = 'MATERIALEAPPARECCHIO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Materiale'
            Value = 'M'
          end
          item
            Caption = 'Apparecchio'
            Value = 'A'
          end
          item
            Caption = 'Muro'
            Value = 'W'
          end>
        Style.BorderColor = clNone
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 3
        Height = 33
        Width = 327
      end
      object DBELettera: TcxDBComboBox
        Left = 245
        Top = 106
        AutoSize = False
        DataBinding.DataField = 'RIFLETTER'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E'
          'F'
          'G'
          'H'
          'I'
          'J'
          'K'
          'L'
          'M'
          'N'
          'O'
          'P'
          'Q'
          'R'
          'S'
          'T'
          'U'
          'V'
          'W'
          'X'
          'Y'
          'Z')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 23
        Width = 44
      end
      object DBESezione: TcxDBComboBox
        Left = 245
        Top = 138
        AutoSize = False
        DataBinding.DataField = 'SEZIONE'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'GAS'
          'IDRO'
          'TERMO')
        Properties.Sorted = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Height = 23
        Width = 125
      end
    end
    inherited PanelGriglia: TPanel
      Top = 540
      Width = 729
      Height = 90
      ExplicitTop = 540
      ExplicitWidth = 729
      ExplicitHeight = 90
      inherited GridList: TcxGrid
        Width = 729
        Height = 90
        ExplicitWidth = 729
        ExplicitHeight = 90
        inherited tvList: TcxGridDBTableView
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          object tvListDESCRIZIONE: TcxGridDBColumn
            Caption = 'Descrizione'
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListCATEGORIA: TcxGridDBColumn
            Caption = 'Categoria'
            DataBinding.FieldName = 'CATEGORIA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListMATERIALEAPPARECCHIO: TcxGridDBColumn
            Caption = 'Tipo'
            DataBinding.FieldName = 'MATERIALEAPPARECCHIO'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListSINCHRO: TcxGridDBColumn
            DataBinding.FieldName = 'SINCHRO'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
        end
      end
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM APPARECCHI'
      'WHERE DESCRIZIONE = :OLD_DESCRIZIONE')
    EditSQL.Strings = (
      'UPDATE APPARECCHI SET'
      ' DESCRIZIONE = :DESCRIZIONE,'
      ' CATEGORIA = :CATEGORIA,'
      ' MATERIALEAPPARECCHIO = :MATERIALEAPPARECCHIO,'
      ' BITMAPFILENAME = :BITMAPFILENAME,'
      ' BITMAPFILENAME2 = :BITMAPFILENAME2,'
      ' TIPO = :TIPO,'
      ' RIFLETTER = :RIFLETTER,'
      ' SINCHRO = :SINCHRO,'
      ' SEZIONE = :SEZIONE'
      'WHERE DESCRIZIONE = :OLD_DESCRIZIONE'
      ''
      ' ')
    AfterScroll = QAfterScroll
    SQL.Strings = (
      'SELECT * FROM APPARECCHI')
    object QDESCRIZIONE: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRIZIONE'
      Required = True
      Size = 30
    end
    object QCATEGORIA: TStringField
      DisplayWidth = 30
      FieldName = 'CATEGORIA'
      Size = 30
    end
    object QMATERIALEAPPARECCHIO: TStringField
      FieldName = 'MATERIALEAPPARECCHIO'
      OnChange = QMATERIALEAPPARECCHIOChange
      Size = 1
    end
    object QSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QBITMAPFILENAME: TStringField
      FieldName = 'BITMAPFILENAME'
      OnChange = QBITMAPFILENAMEChange
      Size = 60
    end
    object QTIPO: TSmallintField
      FieldName = 'TIPO'
      OnChange = QTIPOChange
    end
    object QBITMAPFILENAME2: TStringField
      FieldName = 'BITMAPFILENAME2'
      Size = 60
    end
    object QRIFLETTER: TStringField
      FieldName = 'RIFLETTER'
      Required = True
      Size = 1
    end
    object QSEZIONE: TStringField
      FieldName = 'SEZIONE'
      Size = 10
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42422.905214050920000000
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
  end
end
