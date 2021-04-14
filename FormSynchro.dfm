object SynchroForm: TSynchroForm
  Left = 3
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = '(Importazione)'
  ClientHeight = 770
  ClientWidth = 814
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
    Height = 923
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object PanelMezzo: TPanel
      Left = 0
      Top = 7
      Width = 686
      Height = 109
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelMezzo: TLabel
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
          'Con quale mezzo vuoi effettuare la sincronizzazione?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object MezzoInternet: TRadioButton
        Left = 128
        Top = 43
        Width = 73
        Height = 17
        Caption = 'Internet'
        Ctl3D = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object MezzoDisco: TRadioButton
        Left = 231
        Top = 43
        Width = 64
        Height = 17
        Caption = 'Disco'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
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
        TabOrder = 2
        object AvantiMezzo: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiMezzoClick
        end
      end
    end
    object PanelDrive: TPanel
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
      object LabelDrive: TLabel
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
      object PanelCopriArchivi: TPanel
        Left = 71
        Top = 50
        Width = 522
        Height = 56
        BevelOuter = bvNone
        Color = clYellow
        ParentBackground = False
        TabOrder = 7
      end
      object Panel10: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object AvantiDrive: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiMezzoClick
        end
      end
      object RichEdit3: TRichEdit
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
          'Quale unit'#224' vuoi utilizzare?'
          ''
          'E quali archivi vuoi esportare?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object TabClienti: TCheckBox
        Left = 128
        Top = 84
        Width = 70
        Height = 17
        Caption = 'Clienti'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object TabArticoli: TCheckBox
        Left = 218
        Top = 84
        Width = 70
        Height = 17
        Caption = 'Articoli'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object TabDocumenti: TCheckBox
        Left = 306
        Top = 84
        Width = 74
        Height = 17
        Caption = 'Documenti'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object TabCondVend: TCheckBox
        Left = 398
        Top = 84
        Width = 171
        Height = 17
        Caption = 'Condizioni di vendita/acquisto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Panel6: TPanel
        Left = 324
        Top = 9
        Width = 151
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 6
        object Drive: TDriveComboBox
          Left = -2
          Top = -2
          Width = 153
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnEnter = MezzoInternetEnter
          OnExit = MezzoInternetExit
        end
      end
    end
    object PanelFine: TPanel
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
          
            'Bene, ora tutto '#232' pronto per la sincronizzazione, per iniziare i' +
            'nserire '
          
            'il disco nel drive e cliccare sul pulsante "Inizia sincronizzazi' +
            'one".')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel13: TPanel
        Left = 553
        Top = 85
        Width = 126
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object IniziaFatturazione: TSpeedButton
          Left = 1
          Top = 2
          Width = 122
          Height = 15
          Cursor = crHandPoint
          Caption = 'Inizia sincronizzazione'
          Flat = True
          OnClick = IniziaFatturazioneClick
        end
      end
      object Panel14: TPanel
        Left = 478
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
    object PanelImportExport: TPanel
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
      object LabelImportExport: TLabel
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
      object TREImportExport: TRichEdit
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
          'Desideri ESPORTARE i dati aggiornati di questa stazione oppure '
          'IMPORTARE i dati provenienti da altre postazioni?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
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
        object AvantiImportExport: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiMezzoClick
        end
      end
      object Esportare: TRadioButton
        Left = 128
        Top = 64
        Width = 450
        Height = 17
        Caption = 'ESPORTARE     (crea il disco da importare su altre postazioni)'
        Checked = True
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Importare: TRadioButton
        Left = 128
        Top = 84
        Width = 450
        Height = 17
        Caption = 
          'IMPORTARE     (importa i dati presenti sul disco proveniente da ' +
          'un'#39'altra postazione)'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
    end
    object PanelAggiornaListino1: TPanel
      Left = 0
      Top = 583
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
      object LabelAggiornaListino1: TLabel
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
      object REAggList: TRichEdit
        Tag = -1
        Left = 84
        Top = 2
        Width = 574
        Height = 99
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Ora Lev@nte avvier'#224' la procedura per l'#39'aggiornamento automatico'
          
            'del listino attraverso Internet.  Per iniziare cliccare sul puls' +
            'ante'
          '"Inizia aggiornamento automatico del listino".')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 424
        Top = 85
        Width = 255
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object SBAvviaAggiornaListino: TSpeedButton
          Left = 1
          Top = 2
          Width = 251
          Height = 15
          Cursor = crHandPoint
          Caption = 'Inizia aggiornamento automatico del listino'
          Flat = True
          OnClick = SBAvviaAggiornaListinoClick
        end
      end
      object Panel4: TPanel
        Left = 349
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        object SpeedButton2: TSpeedButton
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
    object PanelAggiornaListino2: TPanel
      Left = 1
      Top = 467
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
      object LabelAggiornaListino2: TLabel
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
        Left = 215
        Top = 50
        Width = 44
        Height = 12
        Caption = 'Listino 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 303
        Top = 50
        Width = 44
        Height = 12
        Caption = 'Listino 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 391
        Top = 50
        Width = 44
        Height = 12
        Caption = 'Listino 3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 479
        Top = 50
        Width = 44
        Height = 12
        Caption = 'Listino 4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 259
        Top = 74
        Width = 12
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 347
        Top = 74
        Width = 12
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 435
        Top = 73
        Width = 13
        Height = 17
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 523
        Top = 74
        Width = 12
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object RichEdit4: TRichEdit
        Tag = -1
        Left = 83
        Top = -1
        Width = 575
        Height = 45
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Quali ricarichi si desiderano applicare per ottenere i 4 listini' +
            ' di '
          'vendita?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
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
        TabOrder = 0
        object AvantiRIcarichi: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiMezzoClick
        end
      end
      object Ricarico1: TEdit
        Left = 217
        Top = 72
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
        Text = '0'
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Panel2: TPanel
        Left = 241
        Top = 70
        Width = 16
        Height = 27
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 3
      end
      object UpDown1: TUpDown
        Left = 242
        Top = 72
        Width = 14
        Height = 24
        Cursor = crHandPoint
        Associate = Ricarico1
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 14
        Constraints.MinHeight = 24
        Constraints.MinWidth = 14
        TabOrder = 4
      end
      object Ricarico2: TEdit
        Left = 305
        Top = 72
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
        TabOrder = 5
        Text = '0'
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Panel11: TPanel
        Left = 329
        Top = 70
        Width = 16
        Height = 27
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 6
      end
      object UpDown2: TUpDown
        Left = 330
        Top = 72
        Width = 14
        Height = 24
        Cursor = crHandPoint
        Associate = Ricarico2
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 14
        Constraints.MinHeight = 24
        Constraints.MinWidth = 14
        TabOrder = 7
      end
      object Ricarico3: TEdit
        Left = 393
        Top = 72
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
        TabOrder = 8
        Text = '0'
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Panel12: TPanel
        Left = 417
        Top = 70
        Width = 16
        Height = 27
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 9
      end
      object UpDown3: TUpDown
        Left = 418
        Top = 72
        Width = 14
        Height = 24
        Cursor = crHandPoint
        Associate = Ricarico3
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 14
        Constraints.MinHeight = 24
        Constraints.MinWidth = 14
        TabOrder = 10
      end
      object Ricarico4: TEdit
        Left = 481
        Top = 72
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
        TabOrder = 11
        Text = '0'
        OnEnter = MezzoInternetEnter
        OnExit = MezzoInternetExit
      end
      object Panel17: TPanel
        Left = 505
        Top = 70
        Width = 16
        Height = 27
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 12
      end
      object UpDown4: TUpDown
        Left = 506
        Top = 72
        Width = 14
        Height = 24
        Cursor = crHandPoint
        Associate = Ricarico4
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 14
        Constraints.MinHeight = 24
        Constraints.MinWidth = 14
        TabOrder = 13
      end
    end
    object PanelSicurezza: TPanel
      Left = 0
      Top = 715
      Width = 686
      Height = 220
      Color = 14737632
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      object RichEdit6: TRichEdit
        Tag = -1
        Left = 10
        Top = 14
        Width = 653
        Height = 163
        TabStop = False
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'A T T E N Z I O N E !!!'
          ''
          
            'Prima di continuare con l'#39'operazione '#232' INDISPENSABILE effettuare' +
            ' una copia di '
          
            'sicurezza degli archivi dell'#39'azienda. Se l'#39'operazione non andass' +
            'e a buon fine potrebbero, '
          'infatti, verificarsi delle perdite di dati.'
          ''
          
            'Cliccare su "Copia di sicurezza" per effettuare la copia, altrim' +
            'enti su "Continua senza copia '
          'di sicurezza" per continuare ignorando il consiglio.')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel15: TPanel
        Left = 474
        Top = 195
        Width = 195
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
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
      object Panel16: TPanel
        Left = 4
        Top = 195
        Width = 245
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
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
  object Esporta: TIB_Export
    BooleanTrueText = 'T'
    BooleanFalseText = 'F'
    Dataset = Qry
    DateTimeFormat = 'dd/MM/yyyy h:mm'
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'h:mm'
    Delimiter = #167
    Filename = 'C:\MAGAZZINI.TXT'
    Separator = '|'
    CreateSchemaFile = False
    IncludeHeaders = True
    IncludeCRLF = True
    Left = 634
    Top = 2
  end
  object Qry: TIB_Query
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'SELECT * FROM MAGAZZINI')
    Left = 666
    Top = 2
  end
  object ZLB1: TZLBArchive
    CompressionLevel = fcMaximum
    Left = 664
    Top = 32
  end
  object Importa: TIB_Import
    FieldsFirst = True
    FieldDelimiter = '|'
    StringSeparat = #167
    CommitTransaction = False
    ImportMode = mAppend
    ImportFormat = ifASCII
    NotifyCount = 233
    OnPrePost = ImportaPrePost
    OnNotifyCount = ImportaNotifyCount
    Left = 626
    Top = 34
  end
  object QDel: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    Left = 584
    Top = 24
  end
end
