inherited SelezioneStradarioForm: TSelezioneStradarioForm
  Left = 48
  Top = 191
  Caption = 'SelezioneStradarioForm'
  ClientHeight = 639
  ClientWidth = 744
  ExplicitWidth = 744
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    Height = 559
    ExplicitHeight = 559
    inherited PanelGriglia: TPanel
      Top = 159
      ExplicitTop = 159
      inherited GridList: TcxGrid
        Height = 350
        ExplicitHeight = 350
        inherited tvList: TcxGridDBTableView
          DataController.DataModeController.GridMode = True
          FilterRow.Visible = False
          FilterRow.ApplyChanges = fracOnCellExit
          OptionsView.CellAutoHeight = True
          Styles.Background = nil
          Styles.Content = nil
          Styles.ContentEven = nil
          Styles.ContentOdd = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Group = nil
          Styles.GroupByBox = nil
          Styles.Header = nil
          object tvListDENOMINAZIONECOMUNE: TcxGridDBColumn
            Caption = 'Comune'
            DataBinding.FieldName = 'DENOMINAZIONECOMUNE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            MinWidth = 150
            Options.HorzSizing = False
            Width = 150
          end
          object tvListDENOMINAZIONESTRADACOMPLETA: TcxGridDBColumn
            Caption = 'Strada, Viale, Piazza ecc.'
            DataBinding.FieldName = 'DENOMINAZIONESTRADACOMPLETA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object tvListSIGLAPROVINCIA: TcxGridDBColumn
            Caption = 'Prov.'
            DataBinding.FieldName = 'SIGLAPROVINCIA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 40
            Options.HorzSizing = False
            Width = 40
          end
          object tvListDENOMINAZIONEPROVINCIA: TcxGridDBColumn
            Caption = 'Prov.estesa'
            DataBinding.FieldName = 'DENOMINAZIONEPROVINCIA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            MinWidth = 100
            Options.HorzSizing = False
            Width = 100
          end
          object tvListCAP: TcxGridDBColumn
            Caption = 'Cap'
            DataBinding.FieldName = 'CAP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            MinWidth = 50
            Options.HorzSizing = False
            Width = 50
          end
          object tvListDENOMINAZIONEREGIONE: TcxGridDBColumn
            Caption = 'Regione'
            DataBinding.FieldName = 'DENOMINAZIONEREGIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            MinWidth = 120
            Options.HorzSizing = False
            Width = 120
          end
          object tvListCODICEISTATCOMUNECOMPLETO: TcxGridDBColumn
            Caption = 'Codice ISTAT comune'
            DataBinding.FieldName = 'CODICEISTATCOMUNECOMPLETO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            VisibleForCustomization = False
          end
        end
      end
      inherited PanelFiltri: TPanel
        Top = 350
        Height = 50
        ExplicitTop = 350
        ExplicitHeight = 50
        inherited SubPanelFiltri: TPanel
          Width = 686
          Height = 44
          ExplicitWidth = 686
          ExplicitHeight = 44
          object StaticText22: TStaticText
            Left = 0
            Top = 9
            Width = 162
            Height = 15
            AutoSize = False
            Caption = ' Comune'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
          object FilterComune: TEdit
            Tag = -1
            Left = 50
            Top = 10
            Width = 111
            Height = 13
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnKeyPress = FilterComuneKeyPress
          end
          object StaticText1: TStaticText
            Left = 168
            Top = 9
            Width = 228
            Height = 15
            AutoSize = False
            Caption = ' Strada, viale, piazza...'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            Transparent = False
          end
          object FilterStrada: TEdit
            Tag = -1
            Left = 284
            Top = 10
            Width = 111
            Height = 13
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnKeyPress = FilterComuneKeyPress
          end
          object StaticText2: TStaticText
            Left = 402
            Top = 9
            Width = 108
            Height = 15
            AutoSize = False
            Caption = ' Sigla provincia'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            Transparent = False
          end
          object FilterSiglaProvincia: TEdit
            Tag = -1
            Left = 483
            Top = 10
            Width = 26
            Height = 13
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnKeyPress = FilterComuneKeyPress
          end
          object StaticText3: TStaticText
            Left = 516
            Top = 9
            Width = 169
            Height = 15
            AutoSize = False
            Caption = ' Provincia estesa'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
            Transparent = False
          end
          object FilterProvinciaEstesa: TEdit
            Tag = -1
            Left = 608
            Top = 10
            Width = 76
            Height = 13
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnKeyPress = FilterComuneKeyPress
          end
          object StaticText4: TStaticText
            Left = 0
            Top = 29
            Width = 101
            Height = 15
            AutoSize = False
            Caption = ' CAP'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 8
            Transparent = False
          end
          object FilterCAP: TEdit
            Tag = -1
            Left = 50
            Top = 30
            Width = 50
            Height = 13
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            OnKeyPress = FilterComuneKeyPress
          end
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonVisualizza: TSpeedButton
      Enabled = False
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      Enabled = False
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = False
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      Enabled = True
    end
  end
  inherited Q: TIBOQuery
    SQL.Strings = (
      'SELECT * FROM STRADARIO_LIST_VIEW')
    object QCODICEISTATCOMUNECOMPLETO: TStringField
      FieldName = 'CODICEISTATCOMUNECOMPLETO'
      Size = 10
    end
    object QDENOMINAZIONESTRADACOMPLETA: TStringField
      FieldName = 'DENOMINAZIONESTRADACOMPLETA'
      Size = 80
    end
    object QDENOMINAZIONECOMUNE: TStringField
      FieldName = 'DENOMINAZIONECOMUNE'
      Size = 60
    end
    object QSIGLAPROVINCIA: TStringField
      FieldName = 'SIGLAPROVINCIA'
      Size = 3
    end
    object QDENOMINAZIONEREGIONE: TStringField
      FieldName = 'DENOMINAZIONEREGIONE'
      Size = 60
    end
    object QCAP: TStringField
      FieldName = 'CAP'
      Size = 10
    end
    object QDENOMINAZIONEPROVINCIA: TStringField
      FieldName = 'DENOMINAZIONEPROVINCIA'
      Size = 60
    end
  end
end
