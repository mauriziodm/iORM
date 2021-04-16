object FattDifferitaForm: TFattDifferitaForm
  Left = 547
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'FattDifferitaForm'
  ClientHeight = 834
  ClientWidth = 717
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
    Top = 62
    Width = 686
    Height = 771
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object PanelModo: TPanel
      Left = 0
      Top = 7
      Width = 686
      Height = 109
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelModo: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 107
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 74
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'In quale modo devono essere scelti i documenti da fatturare?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Zoom = 100
      end
      object ModoCompetenza: TRadioButton
        Left = 128
        Top = 43
        Width = 141
        Height = 17
        Caption = 'Per mese di competenza'
        Checked = True
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object ModoDate: TRadioButton
        Left = 303
        Top = 43
        Width = 64
        Height = 17
        Caption = 'Per data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object ModoManuale: TRadioButton
        Left = 395
        Top = 43
        Width = 283
        Height = 17
        Caption = 'Solo i documenti gi'#224' portati manualmente in bacheca'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Panel7: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 3
        object AvantiModo: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiModoClick
        end
      end
    end
    object PanelMeseCompetenza: TPanel
      Left = 0
      Top = 121
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      object LabelMeseCompetenza: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 109
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 74
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Quali mesi (di competenza) devono essere fatturati?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Zoom = 100
      end
      object Panel8: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object AvantiCompetenza: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiModoClick
        end
      end
      object CompGen: TCheckBox
        Left = 194
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Gennaio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object CompFeb: TCheckBox
        Left = 194
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Febbraio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object CompMar: TCheckBox
        Left = 274
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Marzo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object CompApr: TCheckBox
        Left = 274
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Aprile'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object CompMag: TCheckBox
        Left = 354
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Maggio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object CompGiu: TCheckBox
        Left = 354
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Giugno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object CompLug: TCheckBox
        Left = 434
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Luglio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object CompAgo: TCheckBox
        Left = 434
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Agosto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object CompSet: TCheckBox
        Left = 514
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Settembre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object CompOtt: TCheckBox
        Left = 514
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Ottobre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object CompNov: TCheckBox
        Left = 594
        Top = 39
        Width = 70
        Height = 17
        Caption = 'Novembre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object CompDic: TCheckBox
        Left = 594
        Top = 63
        Width = 70
        Height = 17
        Caption = 'Dicembre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
    end
    object PanelDate: TPanel
      Left = 0
      Top = 236
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      object LabelDate: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 109
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
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
        Top = 6
        Width = 454
        Height = 74
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Devono essere fatturati i documenti emessi dalla data         '
          '               '
          
            '                                                                ' +
            '              fino al')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Zoom = 100
      end
      object Panel6: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object AvantiDate: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiModoClick
        end
      end
      object FattDal: TcxDateEdit
        Left = 537
        Top = 8
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = clWhite
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 110
      end
      object FattAl: TcxDateEdit
        Left = 537
        Top = 55
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = clWhite
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 110
      end
    end
    object PanelCopie: TPanel
      Left = 0
      Top = 351
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object LabelCopie: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 109
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 84
        Top = 45
        Width = 453
        Height = 24
        Caption = 'Quante copie si desiderano stampare per ogni fattura?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 84
        Top = 80
        Width = 379
        Height = 24
        Caption = 'Aggiornare automaticamente lo scadenzario?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 84
        Top = 6
        Width = 157
        Height = 24
        Caption = 'Data di fatturazione'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 363
        Top = 6
        Width = 68
        Height = 24
        Caption = 'Causale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Copie: TEdit
        Left = 554
        Top = 48
        Width = 25
        Height = 22
        AutoSize = False
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '2'
      end
      object Panel5: TPanel
        Left = 578
        Top = 45
        Width = 16
        Height = 27
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 7
      end
      object ScadSi: TRadioButton
        Left = 497
        Top = 86
        Width = 37
        Height = 17
        Caption = 'SI'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = True
      end
      object ScadNo: TRadioButton
        Left = 545
        Top = 86
        Width = 37
        Height = 17
        Caption = 'NO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Panel9: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 6
        object AvantiCopie: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiModoClick
        end
      end
      object UpDown1: TUpDown
        Left = 579
        Top = 48
        Width = 14
        Height = 24
        Cursor = crHandPoint
        Associate = Copie
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 14
        Constraints.MinHeight = 24
        Constraints.MinWidth = 14
        Position = 2
        TabOrder = 3
      end
      object DataFatturazione: TcxDateEdit
        Left = 244
        Top = 7
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = clWhite
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 110
      end
      object Causale: TcxButtonEdit
        Left = 437
        Top = 7
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = CausalePropertiesButtonClick
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 242
      end
    end
    object PanelFine: TPanel
      Left = 0
      Top = 466
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      object LabelFine: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 109
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'X'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -96
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object RichEdit5: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 74
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Bene, ora tutto '#232' pronto per la fatturazione, per iniziare clicc' +
            'are sul '
          'pulsante "Inizia fatturazione".')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Zoom = 100
      end
      object Panel12: TPanel
        Left = 563
        Top = 85
        Width = 116
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object IniziaFatturazione: TSpeedButton
          Left = 1
          Top = 2
          Width = 112
          Height = 15
          Cursor = crHandPoint
          Caption = 'Inizia fatturazione'
          Flat = True
          OnClick = IniziaFatturazioneClick
        end
      end
      object Panel11: TPanel
        Left = 488
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        object Annulla: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Annulla'
          Flat = True
          OnClick = AnnullaClick
        end
      end
    end
    object PanelSicurezza: TPanel
      Left = 0
      Top = 581
      Width = 686
      Height = 188
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
      object RichEdit6: TRichEdit
        Tag = -1
        Left = 10
        Top = 6
        Width = 653
        Height = 142
        TabStop = False
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'A T T E N Z I O N E !!!'
          ''
          
            'Prima di continuare la fatturazione differita di fine mese '#232' con' +
            'sigliabile effettuare una copia '
          'di '
          'sicurezza dei dati dell'#39'azienda.'
          ''
          
            'Cliccare su "Copia di sicurezza" per effettuare la copia, altrim' +
            'enti su "Continua senza copia '
          'di sicurezza" per continuare ignorando il consiglio.')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Zoom = 100
      end
      object Panel13: TPanel
        Left = 484
        Top = 163
        Width = 195
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object SiCopia: TSpeedButton
          Left = 1
          Top = 2
          Width = 191
          Height = 15
          Cursor = crHandPoint
          Caption = 'Copia di sicurezza (consigliato)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SiCopiaClick
        end
      end
      object Panel14: TPanel
        Left = 4
        Top = 163
        Width = 245
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        object NoCopia: TSpeedButton
          Left = 1
          Top = 2
          Width = 241
          Height = 15
          Cursor = crHandPoint
          Caption = 'Continua senza copia di sicurezza (sconsigliato)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = NoCopiaClick
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
    ParentBackground = False
    TabOrder = 1
    object RxSpeedButtonResetQuery: TSpeedButton
      Left = 312
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Azzera i filtri di ricerca'
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
      Hint = 'Visualizza / Apri'
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
    object RxSpeedButtonUscita: TSpeedButton
      Left = 2
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Pagina precedenre'
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
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object RxSpeedButtonNuovo: TSpeedButton
      Left = 162
      Top = 2
      Width = 49
      Height = 42
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
      Hint = 'Elimina / Cancella'
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
      Hint = 'Esegui la ricerca / Trova'
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
      Hint = 'Stampa'
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
  end
end
