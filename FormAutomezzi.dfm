inherited AutomezziForm: TAutomezziForm
  Left = 175
  Caption = 'AutomezziForm'
  ClientHeight = 702
  ClientWidth = 812
  ExplicitWidth = 812
  ExplicitHeight = 702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 622
    ExplicitHeight = 622
    object PanelGruppo1: TPanel [0]
      Left = 0
      Top = 0
      Width = 686
      Height = 137
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
        Height = 137
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
        Width = 29
        Height = 12
        Caption = 'Marca'
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
        Width = 38
        Height = 12
        Caption = 'Modello'
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
        Top = 101
        Width = 28
        Height = 12
        Caption = 'Targa'
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
      object DBText1: TDBText
        Left = 616
        Top = 6
        Width = 65
        Height = 17
        Alignment = taRightJustify
        DataField = 'CODICE'
        DataSource = DS
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 16
        Width = 534
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
          'Dati identificativi')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEMarca: TDBEdit
        Left = 246
        Top = 51
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'MARCA'
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
      object DBEModello: TDBEdit
        Left = 246
        Top = 75
        Width = 219
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'MODELLO'
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
      object DBEdit2: TDBEdit
        Left = 246
        Top = 99
        Width = 117
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'TARGA'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object Panel1: TPanel [1]
      Left = 0
      Top = 147
      Width = 686
      Height = 214
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 214
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
      object Label5: TLabel
        Left = 110
        Top = 56
        Width = 73
        Height = 12
        Caption = 'Scadenza bollo'
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
      object Label6: TLabel
        Left = 110
        Top = 80
        Width = 115
        Height = 12
        Caption = 'Scadenza assicurazione'
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
      object Label7: TLabel
        Left = 110
        Top = 176
        Width = 117
        Height = 12
        Caption = 'Prox. manutenzione KM'
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
      object Label8: TLabel
        Left = 110
        Top = 104
        Width = 100
        Height = 12
        Caption = 'Prox. collaudo entro'
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
      object Label9: TLabel
        Left = 110
        Top = 128
        Width = 110
        Height = 12
        Caption = 'Prox. bollino blu entro'
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
      object Label10: TLabel
        Left = 110
        Top = 152
        Width = 52
        Height = 12
        Caption = 'KM attuali'
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
          'Dati operativi e di manutenzione')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit4: TDBEdit
        Left = 246
        Top = 171
        Width = 101
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'PROSSIMAMANUTENZIONEKM'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 246
        Top = 147
        Width = 101
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'KMATTUALI'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object eScadenzaBollo: TcxDBDateEdit
        Left = 245
        Top = 50
        AutoSize = False
        DataBinding.DataField = 'SCADENZABOLLO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 23
        Width = 119
      end
      object eScadenzaAssicurazione: TcxDBDateEdit
        Left = 245
        Top = 74
        AutoSize = False
        DataBinding.DataField = 'SCADENZAASSICURAZIONE'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 23
        Width = 119
      end
      object eProxCollaudoEntro: TcxDBDateEdit
        Left = 245
        Top = 98
        AutoSize = False
        DataBinding.DataField = 'PROSSIMOCOLLAUDO'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 2
        Height = 23
        Width = 119
      end
      object eProxBollinoEntro: TcxDBDateEdit
        Left = 245
        Top = 122
        AutoSize = False
        DataBinding.DataField = 'PROSSIMOBOLLINOBLU'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 3
        Height = 23
        Width = 119
      end
    end
    object Panel2: TPanel [2]
      Left = 0
      Top = 371
      Width = 686
      Height = 137
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      object Label14: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 137
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
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
      object RichEdit3: TRichEdit
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
          'Note'
          '')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBMemo1: TDBMemo
        Left = 246
        Top = 51
        Width = 427
        Height = 70
        Color = 16250871
        DataField = 'NOTE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    inherited PanelGriglia: TPanel
      Top = 540
      Height = 82
      ExplicitTop = 540
      ExplicitHeight = 82
      inherited GridList: TcxGrid
        Height = 82
        ExplicitHeight = 82
        inherited tvList: TcxGridDBTableView
          DataController.DetailKeyFieldNames = 'CODICE'
          DataController.KeyFieldNames = 'CODICE'
          OptionsView.ColumnAutoWidth = False
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          object tvListCODICE: TcxGridDBColumn
            Caption = 'Cod.'
            DataBinding.FieldName = 'CODICE'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object tvListMARCA: TcxGridDBColumn
            Caption = 'Marca'
            DataBinding.FieldName = 'MARCA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListMODELLO: TcxGridDBColumn
            Caption = 'Modello'
            DataBinding.FieldName = 'MODELLO'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListTARGA: TcxGridDBColumn
            Caption = 'Targa'
            DataBinding.FieldName = 'TARGA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object tvListSCADENZABOLLO: TcxGridDBColumn
            Caption = 'Sc. bollo'
            DataBinding.FieldName = 'SCADENZABOLLO'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListSCADENZAASSICURAZIONE: TcxGridDBColumn
            Caption = 'Sc. assicuraz.'
            DataBinding.FieldName = 'SCADENZAASSICURAZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListPROSSIMOCOLLAUDO: TcxGridDBColumn
            Caption = 'Prox. collaudo'
            DataBinding.FieldName = 'PROSSIMOCOLLAUDO'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListPROSSIMOBOLLINOBLU: TcxGridDBColumn
            Caption = 'Prox. b.blu'
            DataBinding.FieldName = 'PROSSIMOBOLLINOBLU'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListPROSSIMAMANUTENZIONEKM: TcxGridDBColumn
            Caption = 'Prox. manut. KM'
            DataBinding.FieldName = 'PROSSIMAMANUTENZIONEKM'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object tvListKMATTUALI: TcxGridDBColumn
            Caption = 'KM attuali'
            DataBinding.FieldName = 'KMATTUALI'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object tvListNOTE: TcxGridDBColumn
            Caption = 'Note'
            DataBinding.FieldName = 'NOTE'
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
      'DELETE FROM AUTOMEZZI'
      'WHERE CODICE = :OLD_CODICE'
      '')
    EditSQL.Strings = (
      'UPDATE AUTOMEZZI SET'
      ''
      '      Codice = :Codice ,'
      '      Marca  = :Marca  ,'
      '      Modello = :Modello ,'
      '      Targa = :Targa ,'
      '      ScadenzaBollo = :ScadenzaBollo ,'
      '      ScadenzaAssicurazione = :ScadenzaAssicurazione ,'
      '      ProssimaManutenzioneKm  = :ProssimaManutenzioneKm  ,'
      '      ProssimoCollaudo = :ProssimoCollaudo ,'
      '      ProssimoBollinoBlu  = :ProssimoBollinoBlu  ,'
      '      KmAttuali  = :KmAttuali  ,'
      '      Note = :Note '
      ''
      'WHERE CODICE = :OLD_CODICE'
      ''
      '')
    BeforePost = QBeforePost
    SQL.Strings = (
      'SELECT * FROM AUTOMEZZI')
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QMARCA: TStringField
      FieldName = 'MARCA'
      Size = 40
    end
    object QMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 40
    end
    object QTARGA: TStringField
      FieldName = 'TARGA'
      Size = 10
    end
    object QSCADENZABOLLO: TDateTimeField
      FieldName = 'SCADENZABOLLO'
      EditMask = '!99/99/00;1;_'
    end
    object QSCADENZAASSICURAZIONE: TDateTimeField
      FieldName = 'SCADENZAASSICURAZIONE'
      EditMask = '!99/99/00;1;_'
    end
    object QPROSSIMAMANUTENZIONEKM: TIntegerField
      FieldName = 'PROSSIMAMANUTENZIONEKM'
    end
    object QPROSSIMOCOLLAUDO: TDateTimeField
      FieldName = 'PROSSIMOCOLLAUDO'
      EditMask = '!99/99/00;1;_'
    end
    object QPROSSIMOBOLLINOBLU: TDateTimeField
      FieldName = 'PROSSIMOBOLLINOBLU'
      EditMask = '!99/99/00;1;_'
    end
    object QKMATTUALI: TIntegerField
      FieldName = 'KMATTUALI'
    end
    object QNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
    end
    object QSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42668.814007326390000000
      AssignedFormatValues = []
      BuiltInReportLink = True
    end
  end
end
