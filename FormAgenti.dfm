inherited AgentiForm: TAgentiForm
  Left = 72
  Top = 189
  Caption = 'AgentiForm'
  ClientHeight = 782
  ClientWidth = 800
  ExplicitWidth = 800
  ExplicitHeight = 782
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Top = 66
    Height = 455
    ExplicitTop = 66
    ExplicitHeight = 455
    object PanelGruppo1: TPanel [0]
      Left = 0
      Top = 0
      Width = 686
      Height = 171
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
        Height = 171
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
        Width = 90
        Height = 12
        Caption = 'Nome/Descrizione'
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
        Top = 93
        Width = 75
        Height = 12
        Caption = 'Qualifica/Note'
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
      object LabelLinkedToNome: TLabel
        Left = 110
        Top = 133
        Width = 65
        Height = 12
        Caption = 'Collegato a...'
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
        Left = 75
        Top = 20
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
      object DBENome: TDBEdit
        Left = 246
        Top = 51
        Width = 250
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'NOME'
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
      object DBEQualifica: TDBEdit
        Left = 246
        Top = 91
        Width = 419
        Height = 21
        Cursor = crIBeam
        AutoSize = False
        Color = 16250871
        Ctl3D = False
        DataField = 'QUALIFICA'
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
      object dbeLinkedToNome: TcxDBComboBox
        Left = 245
        Top = 130
        AutoSize = False
        BeepOnEnter = False
        DataBinding.DataField = 'LINKEDTONOME'
        DataBinding.DataSource = DS
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.OnInitPopup = dbeLinkedToNomePropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        StyleDisabled.BorderColor = clBlack
        TabOrder = 3
        Height = 23
        Width = 252
      end
    end
    inherited PanelGriglia: TPanel
      Top = 177
      Height = 278
      ExplicitTop = 177
      ExplicitHeight = 278
      inherited GridList: TcxGrid
        Height = 278
        ExplicitHeight = 278
        inherited tvList: TcxGridDBTableView
          DataController.DetailKeyFieldNames = 'NOME'
          DataController.KeyFieldNames = 'NOME'
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
          OptionsCustomize.ColumnFiltering = True
          OptionsView.CellAutoHeight = True
          OptionsView.GridLines = glNone
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          object tvListNOME: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            SortIndex = 1
            SortOrder = soAscending
          end
          object tvListLINKEDTONOME: TcxGridDBColumn
            Caption = 'Collegato a...'
            DataBinding.FieldName = 'LINKEDTONOME'
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = tvListLINKEDTONOMECustomDrawCell
            OnGetDisplayText = tvListLINKEDTONOMEGetDisplayText
            BestFitMaxWidth = 150
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            MinWidth = 150
            Options.HorzSizing = False
            SortIndex = 0
            SortOrder = soAscending
            Width = 150
          end
        end
      end
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM AGENTI'
      'WHERE NOME = :OLD_NOME'
      '')
    EditSQL.Strings = (
      'UPDATE AGENTI SET'
      ''
      '      NOME = :NOME,'
      '      CODICE = :CODICE,'
      '      QUALIFICA = :QUALIFICA,'
      '      LINKEDTONOME = :LINKEDTONOME'
      ''
      'WHERE NOME = :OLD_NOME'
      ''
      '')
    SQL.Strings = (
      'SELECT * FROM AGENTI')
    object QNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 25
    end
    object QSINCHRO: TStringField
      FieldName = 'SINCHRO'
      Size = 1
    end
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object QQUALIFICA: TStringField
      FieldName = 'QUALIFICA'
      Size = 100
    end
    object QLINKEDTONOME: TStringField
      FieldName = 'LINKEDTONOME'
      Size = 25
    end
  end
  inherited dxPrinter: TdxComponentPrinter
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 42422.918538159720000000
      AssignedFormatValues = []
      BuiltInReportLink = True
    end
  end
  object MenuStampe: TPopupMenu
    Left = 400
    Top = 40
    object Stampaetichettecliente1: TMenuItem
      Caption = 'Stampa etichette'
      OnClick = Stampaetichettecliente1Click
    end
  end
end
