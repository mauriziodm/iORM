object PrimanotaForm: TPrimanotaForm
  Left = 451
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = '(Primanota)'
  ClientHeight = 782
  ClientWidth = 829
  Color = clPurple
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
    TabOrder = 0
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
      Cursor = crHandPoint
      Hint = 'Cancella la categoria dall'#39'archivio'
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
  object FormMainPanel: TPanel
    Left = 0
    Top = 68
    Width = 713
    Height = 693
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object ClientArea: TPanel
      Left = 0
      Top = 0
      Width = 685
      Height = 586
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object PanelCassa: TPanel
        Left = 0
        Top = 175
        Width = 183
        Height = 74
        BevelOuter = bvNone
        Color = 15329769
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 2
        object Label4: TLabel
          Left = 6
          Top = 17
          Width = 40
          Height = 14
          AutoSize = False
          Caption = 'Entrate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 6
          Top = 34
          Width = 40
          Height = 14
          AutoSize = False
          Caption = 'Uscite'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 183
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' CASSA'
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
        object DBEdit4: TDBEdit
          Left = 55
          Top = 17
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'CassaEntrate'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 55
          Top = 34
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'CassaUscite'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
      end
      object PanelFuoriCassa: TPanel
        Left = 253
        Top = 175
        Width = 183
        Height = 74
        BevelOuter = bvNone
        Color = 15329769
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 3
        object Label12: TLabel
          Left = 6
          Top = 17
          Width = 41
          Height = 14
          AutoSize = False
          Caption = 'Entrate'
          Color = clOlive
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
          Left = 6
          Top = 34
          Width = 41
          Height = 14
          AutoSize = False
          Caption = 'Uscite'
          Color = clOlive
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
          Left = 6
          Top = 54
          Width = 37
          Height = 14
          AutoSize = False
          Caption = 'Banca'
          Color = clOlive
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 183
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' FUORI CASSA'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBEdit9: TDBEdit
          Left = 55
          Top = 17
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'FuoriEntrate'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit10: TDBEdit
          Left = 55
          Top = 34
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'FuoriUscite'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
        object PanelBanca: TPanel
          Left = 55
          Top = 54
          Width = 120
          Height = 14
          BevelOuter = bvNone
          Caption = 'PanelBanca'
          ParentColor = True
          TabOrder = 2
          object DBComboBanca: TDBComboBox
            Left = -2
            Top = -3
            Width = 125
            Height = 20
            Color = 16250871
            DataField = 'DescFuori'
            DataSource = SourcePrimanota
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Sorted = True
            TabOrder = 0
            OnDropDown = DBComboBancaDropDown
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
          end
        end
      end
      object PanelAbbuoni: TPanel
        Left = 502
        Top = 175
        Width = 183
        Height = 74
        BevelOuter = bvNone
        Color = 15329769
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 4
        object Label15: TLabel
          Left = 6
          Top = 17
          Width = 31
          Height = 14
          AutoSize = False
          Caption = 'Attivi'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 6
          Top = 34
          Width = 40
          Height = 14
          AutoSize = False
          Caption = 'Passivi'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 183
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' ABBUONI'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBEdit11: TDBEdit
          Left = 55
          Top = 17
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'AbbuoniAttivi'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit12: TDBEdit
          Left = 55
          Top = 34
          Width = 120
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'AbbuoniPassivi'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit4KeyPress
        end
      end
      object PanelOperazione: TPanel
        Left = -1
        Top = 80
        Width = 686
        Height = 74
        BevelOuter = bvNone
        Color = 15329769
        ParentBackground = False
        TabOrder = 1
        object Label44: TLabel
          Left = 0
          Top = 0
          Width = 686
          Height = 13
          Align = alTop
          AutoSize = False
          Caption = ' OPERAZIONE'
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
        object Label1: TLabel
          Left = 6
          Top = 17
          Width = 63
          Height = 14
          AutoSize = False
          Caption = 'Descrizione '
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 6
          Top = 35
          Width = 27
          Height = 14
          AutoSize = False
          Caption = 'Note '
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object LabelStatoDocumento: TLabel
          Left = 567
          Top = 35
          Width = 31
          Height = 15
          AutoSize = False
          Caption = ' Stato '
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object BitBtnSelezioneStato: TSpeedButtonRollOver
          Left = 664
          Top = 35
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
          OnClick = BitBtnSelezioneStatoClick
        end
        object DbeNote: TDBEdit
          Left = 70
          Top = 35
          Width = 450
          Height = 14
          Cursor = crIBeam
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'Note'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
        end
        object Panel1: TPanel
          Left = 70
          Top = 17
          Width = 450
          Height = 14
          BevelOuter = bvNone
          TabOrder = 0
          object Descrizione: TDBComboBox
            Left = -2
            Top = -3
            Width = 455
            Height = 20
            Color = 16250871
            DataField = 'Descrizione'
            DataSource = SourcePrimanota
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnDropDown = DescrizioneDropDown
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
          end
        end
        object DBEditStatoDocumento: TDBEdit
          Left = 602
          Top = 35
          Width = 60
          Height = 14
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'STATODESCRIZIONE'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopupMenuAzzeramentoStato
          ReadOnly = True
          TabOrder = 2
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          OnKeyUp = DBEditStatoDocumentoKeyUp
        end
        object PanelAgenti: TPanel
          Left = -3
          Top = 52
          Width = 689
          Height = 17
          BevelOuter = bvNone
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 3
          object LabelAgente: TLabel
            Left = 6
            Top = 1
            Width = 63
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Agente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object LabelAgente2: TLabel
            Left = 172
            Top = 1
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
            Left = 339
            Top = 1
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
            Left = 506
            Top = 1
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
          object dbeAgente: TcxDBComboBox
            Left = 69
            Top = -1
            AutoSize = False
            DataBinding.DataField = 'AGENTE'
            DataBinding.DataSource = SourcePrimanota
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Sorted = True
            Properties.OnEditValueChanged = dbeAgentePropertiesEditValueChanged
            Properties.OnInitPopup = dbeAgentePropertiesInitPopup
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
            Height = 19
            Width = 102
          end
          object dbeAgente2: TcxDBComboBox
            Left = 235
            Top = -1
            AutoSize = False
            DataBinding.DataField = 'AGENTE2'
            DataBinding.DataSource = SourcePrimanota
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
            TabOrder = 1
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
            Height = 19
            Width = 102
          end
          object dbeAgente3: TcxDBComboBox
            Left = 402
            Top = -1
            AutoSize = False
            DataBinding.DataField = 'AGENTE3'
            DataBinding.DataSource = SourcePrimanota
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
            TabOrder = 2
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
            Height = 19
            Width = 102
          end
          object dbeAgente4: TcxDBComboBox
            Left = 569
            Top = -1
            AutoSize = False
            DataBinding.DataField = 'AGENTE4'
            DataBinding.DataSource = SourcePrimanota
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
            TabOrder = 3
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
            Height = 19
            Width = 102
          end
        end
      end
      object PanelPratiche: TPanel
        Left = -1
        Top = 373
        Width = 686
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
        TabOrder = 5
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
          Width = 686
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
        object BitBtnPratica1_Old: TSpeedButtonRollOver
          Left = 6
          Top = 17
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
          OnClick = BitBtnPratica1_OldClick
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
          DataSource = SourcePrimanota
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
        object DBEdit2: TDBEdit
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
          DataSource = SourcePrimanota
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
          Width = 294
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
      object PanelNumDataDocumento: TPanel
        Left = -1
        Top = 0
        Width = 686
        Height = 58
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 686
          Height = 58
          Brush.Color = 13822463
          Pen.Color = 427007
        end
        object LabelDocumento: TLabel
          Left = 0
          Top = 0
          Width = 686
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Registrazione di primanota'
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
        object Label17: TLabel
          Left = 458
          Top = 17
          Width = 48
          Height = 15
          AutoSize = False
          Caption = 'Soggetto'
          Color = clTeal
          Font.Charset = ANSI_CHARSET
          Font.Color = 427007
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Shape6: TShape
          Left = 452
          Top = 12
          Width = 1
          Height = 46
          Brush.Color = 13822463
          Pen.Color = 427007
        end
        object DBText1: TDBText
          Left = 630
          Top = 0
          Width = 52
          Height = 13
          Alignment = taCenter
          Color = 427007
          DataField = 'Cliente'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = 13822463
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 6
          Top = 17
          Width = 81
          Height = 12
          Caption = 'Data operazione'
          Color = 13822463
          Font.Charset = ANSI_CHARSET
          Font.Color = 427007
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object BitBtnCliente: TSpeedButtonRollOver
          Left = 651
          Top = 17
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
          OnClick = BitBtnClienteClick
        end
        object BitBtnEspandiCliente: TSpeedButtonRollOver
          Left = 668
          Top = 17
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
          OnClick = BitBtnEspandiClienteClick
        end
        object PanelCantiere: TPanel
          Left = 6
          Top = 35
          Width = 444
          Height = 19
          BevelOuter = bvNone
          Color = 13822463
          TabOrder = 2
          object LabelCantiere: TLabel
            Left = 0
            Top = 3
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
            Left = 426
            Top = 3
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
          object DbeDescrizioneCantiere: TcxTextEdit
            Left = 97
            Top = 0
            AutoSize = False
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
            StyleDisabled.Color = 16250871
            TabOrder = 0
            Text = '- - -'
            OnEnter = DBEdit1Enter
            OnExit = DBEdit1Exit
            OnKeyPress = DbeDescrizioneCantiereKeyPress
            Height = 19
            Width = 329
          end
        end
        object DBEdit1: TDBEdit
          Tag = -1
          Left = 6
          Top = 0
          Width = 50
          Height = 13
          Cursor = crIBeam
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          Color = 427007
          Ctl3D = False
          DataField = 'Codice'
          DataSource = SourcePrimanota
          Font.Charset = ANSI_CHARSET
          Font.Color = 13822463
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
        end
        object DBERagSocCli: TEdit
          Left = 507
          Top = 17
          Width = 142
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
          TabOrder = 1
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
        end
        object DBEDataMovimento: TcxDBDateEdit
          Left = 103
          Top = 15
          AutoSize = False
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = SourcePrimanota
          ParentFont = False
          Properties.ImmediatePost = True
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
          TabOrder = 0
          OnEnter = DBEdit1Enter
          OnExit = DBEdit1Exit
          Height = 18
          Width = 100
        end
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = -5
        Top = 264
        Cursor = crHandPoint
        Caption = 'Esportato'
        DataBinding.DataField = 'EXPORTED'
        DataBinding.DataSource = SourcePrimanota
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 6
        Width = 121
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 140
        Top = 264
        Cursor = crHandPoint
        Caption = 'Movimento relativo a una Fattura di Acquisto'
        DataBinding.DataField = 'RELATIVOFATTACQUI'
        DataBinding.DataSource = SourcePrimanota
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 7
        Width = 309
      end
    end
    object PanelAllegati: TPanel
      Left = 0
      Top = 652
      Width = 713
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
    end
    object SplitterAllegati: TcxSplitter
      Left = 0
      Top = 644
      Width = 713
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
  object QueryPrimanota: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_CODICE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATA'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    EditSQL.Strings = (
      'update primanot'
      'set'
      '  Codice = :Codice,'
      '  Data = :Data,'
      '  Descrizione = :Descrizione,'
      '  CassaEntrate = :CassaEntrate,'
      '  CassaUscite = :CassaUscite,'
      '  FuoriEntrate = :FuoriEntrate,'
      '  FuoriUscite = :FuoriUscite,'
      '  DescFuori = :DescFuori,'
      '  AbbuoniAttivi = :AbbuoniAttivi,'
      '  AbbuoniPassivi = :AbbuoniPassivi,'
      '  Note = :Note,'
      '  Cliente = :Cliente,'
      '  Pratica = :Pratica,'
      '  Pratica2 = :Pratica2,'
      '  Pratica3 = :Pratica3,'
      '  DataPratica1 = :DataPratica1,'
      '  DataPratica2 = :DataPratica2,'
      '  DataPratica3 = :DataPratica3,'
      '  StatoDescrizione = :StatoDescrizione,'
      '  StatoForeground = :StatoForeground,'
      '  StatoBackground = :StatoBackground,'
      '  Agente = :Agente,'
      '  Agente2 = :Agente2,'
      '  Agente3 = :Agente3,'
      '  Agente4 = :Agente4,'
      '  Exported = :Exported,'
      '  RelativoFattAcqui = :RelativoFattAcqui'
      'where'
      '  Codice = :OLD_Codice and'
      '  Data = :OLD_Data')
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      ''
      'FROM PRIMANOT'
      ''
      'WHERE CODICE = :P_CODICE '
      '  AND DATA = :P_DATA')
    FieldOptions = []
    Left = 586
    Top = 2
    object QueryPrimanotaCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QueryPrimanotaDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object QueryPrimanotaDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QueryPrimanotaCASSAENTRATE: TIBOFloatField
      FieldName = 'CASSAENTRATE'
      currency = True
    end
    object QueryPrimanotaCASSAUSCITE: TIBOFloatField
      FieldName = 'CASSAUSCITE'
      currency = True
    end
    object QueryPrimanotaFUORIENTRATE: TIBOFloatField
      FieldName = 'FUORIENTRATE'
      currency = True
    end
    object QueryPrimanotaFUORIUSCITE: TIBOFloatField
      FieldName = 'FUORIUSCITE'
      currency = True
    end
    object QueryPrimanotaDESCFUORI: TStringField
      FieldName = 'DESCFUORI'
    end
    object QueryPrimanotaABBUONIATTIVI: TIBOFloatField
      FieldName = 'ABBUONIATTIVI'
      currency = True
    end
    object QueryPrimanotaABBUONIPASSIVI: TIBOFloatField
      FieldName = 'ABBUONIPASSIVI'
      currency = True
    end
    object QueryPrimanotaNOTE: TStringField
      FieldName = 'NOTE'
      Size = 60
    end
    object QueryPrimanotaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = QueryPrimanota2CLIENTEChange
    end
    object QueryPrimanotaPRATICA: TIntegerField
      FieldName = 'PRATICA'
      OnChange = QueryPrimanotaPRATICAChange
    end
    object QueryPrimanotaPRATICA2: TIntegerField
      FieldName = 'PRATICA2'
    end
    object QueryPrimanotaPRATICA3: TIntegerField
      FieldName = 'PRATICA3'
    end
    object QueryPrimanotaDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QueryPrimanotaDATAPRATICA2: TDateTimeField
      FieldName = 'DATAPRATICA2'
    end
    object QueryPrimanotaDATAPRATICA3: TDateTimeField
      FieldName = 'DATAPRATICA3'
    end
    object QueryPrimanotaSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QueryPrimanotaSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QueryPrimanotaSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QueryPrimanotaAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QueryPrimanotaAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QueryPrimanotaAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QueryPrimanotaAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QueryPrimanotaEXPORTED: TStringField
      FieldName = 'EXPORTED'
      FixedChar = True
      Size = 1
    end
    object QueryPrimanotaRELATIVOFATTACQUI: TStringField
      FieldName = 'RELATIVOFATTACQUI'
      FixedChar = True
      Size = 1
    end
  end
  object SourcePrimanota: TDataSource
    AutoEdit = False
    DataSet = QueryPrimanota
    Left = 614
    Top = 2
  end
  object PopupMenuAzzeramentoStato: TPopupMenu
    Left = 616
    Top = 120
    object AzzeraStato1: TMenuItem
      Caption = 'Azzera stato'
      OnClick = AzzeraStato1Click
    end
  end
end
