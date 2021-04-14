inherited SelezionaPraticheImpiantiForm: TSelezionaPraticheImpiantiForm
  Left = 570
  Top = 229
  Caption = 'SelezionaPraticheImpiantiForm'
  ClientHeight = 689
  ClientWidth = 743
  OldCreateOrder = True
  ExplicitWidth = 743
  ExplicitHeight = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonTrovaClick
    end
    inherited RxSpeedButtonResetQuery: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonResetQueryClick
    end
    inherited RxSpeedButtonHelp: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonHelpClick
    end
  end
  inherited ClientArea: TScrollBox
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 686
      Height = 586
      Cursor = crHandPoint
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabCantieri
      Properties.CustomButtons.Buttons = <>
      Properties.HotTrack = True
      Properties.Style = 8
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabSlants.Positions = [spLeft, spRight]
      TabSlants.Kind = skCutCorner
      TabSlants.Positions = [spLeft, spRight]
      OnChange = cxPageControl1Change
      ExplicitLeft = 2
      ExplicitTop = 3
      ClientRectBottom = 586
      ClientRectRight = 686
      ClientRectTop = 27
      object TabCantieri: TcxTabSheet
        Caption = ' Cantieri '
        ImageIndex = 0
        object PanelPratFiltri: TPanel
          Left = 0
          Top = 376
          Width = 686
          Height = 183
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          object Label34: TLabel
            Left = 611
            Top = 34
            Width = 73
            Height = 85
            Alignment = taCenter
            AutoSize = False
            Caption = 'Al'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object Label33: TLabel
            Left = 537
            Top = 34
            Width = 74
            Height = 85
            Alignment = taCenter
            AutoSize = False
            Caption = 'Dal'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object PratOtt: TSpeedButton
            Tag = 10
            Left = 611
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Ott'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratNov: TSpeedButton
            Tag = 11
            Left = 635
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Nov'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratDic: TSpeedButton
            Tag = 12
            Left = 659
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Dic'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratAgo: TSpeedButton
            Tag = 8
            Left = 563
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Ago'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratLug: TSpeedButton
            Tag = 7
            Left = 539
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Lug'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratGiu: TSpeedButton
            Tag = 6
            Left = 659
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Giu'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratMag: TSpeedButton
            Tag = 5
            Left = 635
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Mag'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratGen: TSpeedButton
            Tag = 1
            Left = 539
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Gen'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratFeb: TSpeedButton
            Tag = 2
            Left = 563
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Feb'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratMar: TSpeedButton
            Tag = 3
            Left = 587
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Mar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratApr: TSpeedButton
            Tag = 4
            Left = 611
            Top = 84
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Apr'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object PratMesiTutti: TSpeedButton
            Left = 539
            Top = 66
            Width = 72
            Height = 16
            Cursor = crHandPoint
            Hint = 
              'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
              'o.'
            Caption = 'Predefinito'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratMesiTuttiClick
            OnMouseUp = PratMesiTuttiMouseUp
          end
          object PratMesiNessuno: TSpeedButton
            Left = 611
            Top = 66
            Width = 72
            Height = 16
            Cursor = crHandPoint
            Hint = 
              'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
              'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
              'li anni).'
            Caption = 'Nessuno'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratMesiNessunoClick
            OnMouseUp = PratMesiNessunoMouseUp
          end
          object PratSet: TSpeedButton
            Tag = 9
            Left = 587
            Top = 101
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Set'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = PratGenClick
            OnMouseUp = PratGenMouseUp
          end
          object SBPratFilterOpenClose: TSpeedButtonRollOver
            Left = 1
            Top = 3
            Width = 19
            Height = 27
            Cursor = crHandPoint
            OnClick = SBPratFilterOpenCloseClick
          end
          object StaticText40: TStaticText
            Left = 0
            Top = 35
            Width = 114
            Height = 15
            AutoSize = False
            Caption = ' Codice'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
            Transparent = False
          end
          object PratCodice: TEdit
            Left = 39
            Top = 36
            Width = 74
            Height = 13
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnKeyPress = PratCodiceKeyPress
          end
          object StaticText43: TStaticText
            Left = 0
            Top = 89
            Width = 102
            Height = 30
            Alignment = taCenter
            AutoSize = False
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 9
            Transparent = False
          end
          object CantieriApertiChiusi: TCheckListBox
            Left = 1
            Top = 90
            Width = 100
            Height = 28
            Cursor = crHandPoint
            OnClickCheck = CantieriApertiChiusiClickCheck
            BorderStyle = bsNone
            Color = 15266815
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Cantieri aperti'
              'Cantieri chiusi')
            ParentCtl3D = False
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 10
            OnExit = CantieriApertiChiusiExit
            OnKeyPress = PratCodiceKeyPress
            OnMouseUp = CantieriApertiChiusiMouseUp
          end
          object StaticText55: TStaticText
            Left = 0
            Top = 62
            Width = 180
            Height = 16
            AutoSize = False
            Caption = ' Solo con stato'
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
          object PratStato: TcxComboBox
            Left = 76
            Top = 61
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.OnInitPopup = PratStatoPropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 7
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 105
          end
          object StaticText2: TStaticText
            Left = 32
            Top = 13
            Width = 330
            Height = 16
            AutoSize = False
            Caption = ' Trova'
            Color = 28895
            Font.Charset = ANSI_CHARSET
            Font.Color = 12902911
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
          object PratDescrizione: TEdit
            Left = 68
            Top = 14
            Width = 293
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnKeyPress = PratCodiceKeyPress
          end
          object PratSelezione: TCheckListBox
            Left = 368
            Top = 11
            Width = 319
            Height = 14
            Cursor = crHandPoint
            OnClickCheck = CantieriApertiChiusiClickCheck
            BorderStyle = bsNone
            Columns = 2
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Solo soggetto selezionato'
              'Solo intestatario documento')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 2
            OnExit = CantieriApertiChiusiExit
            OnKeyPress = PratCodiceKeyPress
            OnMouseUp = PratSelezioneMouseUp
          end
          object PanelFilterCategorieCantieri: TPanel
            Left = 0
            Top = 147
            Width = 684
            Height = 38
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 19
            object PratLabelCategCant1: TStaticText
              Left = 0
              Top = 2
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.1'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Transparent = False
            end
            object PratCategCant1: TcxComboBox
              Left = 102
              Top = 1
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = PratCategCant1PropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 17
              Width = 125
            end
            object PratLabelCategCant2: TStaticText
              Left = 229
              Top = 2
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.2'
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
            object PratCategCant2: TcxComboBox
              Left = 331
              Top = 1
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = PratCategCant1PropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 1
              Height = 17
              Width = 125
            end
            object PratLabelCategCant3: TStaticText
              Left = 458
              Top = 2
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.3'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              Transparent = False
            end
            object PratCategCant3: TcxComboBox
              Left = 560
              Top = 1
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 2
              Height = 17
              Width = 125
            end
            object PratLabelCategCant4: TStaticText
              Left = 0
              Top = 21
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.4'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 9
              Transparent = False
            end
            object PratCategCant4: TcxComboBox
              Left = 102
              Top = 20
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 6
              Height = 17
              Width = 125
            end
            object PratLabelCategCant5: TStaticText
              Left = 229
              Top = 21
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.5'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 10
              Transparent = False
            end
            object PratCategCant5: TcxComboBox
              Left = 331
              Top = 20
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 7
              Height = 17
              Width = 125
            end
            object PratLabelCategCant6: TStaticText
              Left = 458
              Top = 21
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Categ.Cant.6'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 11
              Transparent = False
            end
            object PratCategCant6: TcxComboBox
              Left = 560
              Top = 20
              AutoSize = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 8
              Height = 17
              Width = 125
            end
          end
          object LabelPratAgente: TStaticText
            Left = -2
            Top = 130
            Width = 169
            Height = 15
            AutoSize = False
            Caption = ' Agente'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 15
            Transparent = False
          end
          object PratAgente: TcxComboBox
            Left = 70
            Top = 129
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Sorted = True
            Properties.OnEditValueChanged = PratAgentePropertiesEditValueChanged
            Properties.OnInitPopup = PratAgentePropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 11
            Height = 17
            Width = 98
          end
          object LabelPratAgente2: TStaticText
            Left = 172
            Top = 130
            Width = 167
            Height = 15
            AutoSize = False
            Caption = ' Agente2'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 16
            Transparent = False
          end
          object PratAgente2: TcxComboBox
            Left = 244
            Top = 129
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Sorted = True
            Properties.OnEditValueChanged = PratAgente2PropertiesEditValueChanged
            Properties.OnInitPopup = PratAgente2PropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 12
            Height = 17
            Width = 96
          end
          object LabelPratAgente3: TStaticText
            Left = 344
            Top = 130
            Width = 167
            Height = 15
            AutoSize = False
            Caption = ' Agente3'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 17
            Transparent = False
          end
          object PratAgente3: TcxComboBox
            Left = 416
            Top = 129
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Sorted = True
            Properties.OnEditValueChanged = PratAgente3PropertiesEditValueChanged
            Properties.OnInitPopup = PratAgente3PropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 13
            Height = 17
            Width = 96
          end
          object LabelPratAgente4: TStaticText
            Left = 517
            Top = 130
            Width = 167
            Height = 15
            AutoSize = False
            Caption = ' Agente4'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 18
            Transparent = False
          end
          object PratAgente4: TcxComboBox
            Left = 589
            Top = 129
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Sorted = True
            Properties.OnInitPopup = PratAgente4PropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 14
            Height = 17
            Width = 96
          end
          object PratDal: TcxDateEdit
            Left = 539
            Top = 47
            RepositoryItem = DM1.EdPropFilterDateEdit
            AutoSize = False
            ParentFont = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
            TabOrder = 5
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 72
          end
          object PratAl: TcxDateEdit
            Left = 611
            Top = 47
            RepositoryItem = DM1.EdPropFilterDateEdit
            AutoSize = False
            ParentFont = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
            TabOrder = 6
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 72
          end
        end
        object GridSelezioneCantiere: TcxGrid
          Left = 0
          Top = 0
          Width = 686
          Height = 376
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = MenuGriglia
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = True
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object tvSelezioneCantiere: TcxGridDBTableView
            DragMode = dmAutomatic
            OnDblClick = tvSelezioneCantiereDblClick
            OnEndDrag = tvSelezioneCantiereEndDrag
            OnKeyPress = tvSelezioneCantiereKeyPress
            Navigator.Buttons.CustomButtons = <>
            OnCustomDrawCell = tvSelezioneCantiereCustomDrawCell
            OnCustomDrawPartBackground = tvSelezioneCantiereCustomDrawPartBackground
            DataController.DataSource = SourcePratiche
            DataController.KeyFieldNames = 'CODICE;DATAAPERTURA'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnGroupingChanged = tvPratDataControllerGroupingChanged
            DataController.OnSortingChanged = tvPratDataControllerSortingChanged
            OptionsBehavior.DragHighlighting = False
            OptionsBehavior.DragOpening = False
            OptionsBehavior.DragScrolling = False
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.BestFitMaxRecordCount = 50
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.DataRowHeight = 21
            OptionsView.GridLines = glVertical
            OptionsView.HeaderEndEllipsis = True
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvSelezioneCantiereCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvSelezioneCantiereCustomDrawGroupCell
            object tvSelezioneCantiereCODICE: TcxGridDBColumn
              Caption = 'Cant. N'#176
              DataBinding.FieldName = 'CODICE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object tvSelezioneCantiereDESCRIZIONE: TcxGridDBColumn
              Caption = 'Oggetto - Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object tvSelezioneCantiereDATAAPERTURA: TcxGridDBColumn
              Caption = 'Aperto il'
              DataBinding.FieldName = 'DATAAPERTURA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soDescending
              Width = 70
            end
            object tvSelezioneCantiereDATACHIUSURA: TcxGridDBColumn
              Caption = 'Chiuso il'
              DataBinding.FieldName = 'DATACHIUSURA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvSelezioneCantiereSTATODESCRIZIONE: TcxGridDBColumn
              Caption = 'Stato'
              DataBinding.FieldName = 'STATODESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvSelezioneCantiereRAGIONESOCIALE: TcxGridDBColumn
              Caption = 'Intestatario'
              DataBinding.FieldName = 'RAGIONESOCIALE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Width = 150
            end
            object tvSelezioneCantiereSTATOFOREGROUND: TcxGridDBColumn
              Caption = 'SFg'
              DataBinding.FieldName = 'STATOFOREGROUND'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object tvSelezioneCantiereSTATOBACKGROUND: TcxGridDBColumn
              Caption = 'SBg'
              DataBinding.FieldName = 'STATOBACKGROUND'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object tvSelezioneCantiereCATEGCANT1: TcxGridDBColumn
              Caption = 'Categoria 1'
              DataBinding.FieldName = 'CATEGCANT1'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereCATEGCANT2: TcxGridDBColumn
              Caption = 'Categoria 2'
              DataBinding.FieldName = 'CATEGCANT2'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereCATEGCANT3: TcxGridDBColumn
              Caption = 'Categoria 3'
              DataBinding.FieldName = 'CATEGCANT3'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereCATEGCANT4: TcxGridDBColumn
              Caption = 'Categoria 4'
              DataBinding.FieldName = 'CATEGCANT4'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereCATEGCANT5: TcxGridDBColumn
              Caption = 'Categoria 5'
              DataBinding.FieldName = 'CATEGCANT5'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereCATEGCANT6: TcxGridDBColumn
              Caption = 'Categoria 6'
              DataBinding.FieldName = 'CATEGCANT6'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvSelezioneCantiereAGENTE: TcxGridDBColumn
              Caption = 'Agente'
              DataBinding.FieldName = 'AGENTE'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object tvSelezioneCantiereAGENTE2: TcxGridDBColumn
              Caption = 'Agente2'
              DataBinding.FieldName = 'AGENTE2'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object tvSelezioneCantiereAGENTE3: TcxGridDBColumn
              Caption = 'Agente3'
              DataBinding.FieldName = 'AGENTE3'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object tvSelezioneCantiereAGENTE4: TcxGridDBColumn
              Caption = 'Agente4'
              DataBinding.FieldName = 'AGENTE4'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
          end
          object lvPrat: TcxGridLevel
            GridView = tvSelezioneCantiere
            Options.DetailFrameColor = clBlack
          end
        end
      end
      object TabImpianti: TcxTabSheet
        Caption = ' Impianti '
        ImageIndex = 1
        object PanelAssFiltri: TPanel
          Left = 0
          Top = 411
          Width = 686
          Height = 148
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Label47: TLabel
            Left = 611
            Top = 49
            Width = 73
            Height = 85
            Alignment = taCenter
            AutoSize = False
            Caption = 'Al'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object Label48: TLabel
            Left = 537
            Top = 49
            Width = 74
            Height = 85
            Alignment = taCenter
            AutoSize = False
            Caption = 'Dal'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object AssOtt: TSpeedButton
            Tag = 10
            Left = 611
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Ott'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssNov: TSpeedButton
            Tag = 11
            Left = 635
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Nov'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssDic: TSpeedButton
            Tag = 12
            Left = 659
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Dic'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssAgo: TSpeedButton
            Tag = 8
            Left = 563
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Ago'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssLug: TSpeedButton
            Tag = 7
            Left = 539
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Lug'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssGiu: TSpeedButton
            Tag = 6
            Left = 659
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Giu'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssMag: TSpeedButton
            Tag = 5
            Left = 635
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Mag'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssGen: TSpeedButton
            Tag = 1
            Left = 539
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Gen'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssFeb: TSpeedButton
            Tag = 2
            Left = 563
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Feb'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssMar: TSpeedButton
            Tag = 3
            Left = 587
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Mar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssApr: TSpeedButton
            Tag = 4
            Left = 611
            Top = 98
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Apr'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object AssMesiTutti: TSpeedButton
            Left = 539
            Top = 80
            Width = 72
            Height = 16
            Cursor = crHandPoint
            Hint = 
              'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
              'o.'
            Caption = 'Predefinito'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssMesiTuttiClick
            OnMouseUp = AssMesiTuttiMouseUp
          end
          object AssMesiNessuno: TSpeedButton
            Left = 611
            Top = 80
            Width = 72
            Height = 16
            Cursor = crHandPoint
            Hint = 
              'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
              'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
              'li anni).'
            Caption = 'Nessuno'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssMesiNessunoClick
            OnMouseUp = AssMesiNessunoMouseUp
          end
          object AssSet: TSpeedButton
            Tag = 9
            Left = 587
            Top = 115
            Width = 24
            Height = 17
            Cursor = crHandPoint
            Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
            AllowAllUp = True
            GroupIndex = 600
            Caption = 'Set'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = AssGenClick
            OnMouseUp = AssGenMouseUp
          end
          object SBAssFilterOpenClose: TSpeedButtonRollOver
            Left = 1
            Top = 3
            Width = 19
            Height = 27
            Cursor = crHandPoint
            OnClick = SBAssFilterOpenCloseClick
          end
          object StaticText32: TStaticText
            Left = 289
            Top = 111
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Localit'#224
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 22
            Transparent = False
          end
          object StaticText29: TStaticText
            Left = 289
            Top = 73
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Modello'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 16
            Transparent = False
          end
          object StaticText20: TStaticText
            Left = 0
            Top = 111
            Width = 280
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 23
            Transparent = False
          end
          object FilterAbbonati: TCheckListBox
            Left = 1
            Top = 112
            Width = 278
            Height = 14
            Cursor = crHandPoint
            OnClickCheck = FilterAbbonatiClickCheck
            BorderStyle = bsNone
            Color = 15266815
            Columns = 2
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Abbonati'
              'NON Abbonati')
            ParentCtl3D = False
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 24
            OnExit = FilterAbbonatiExit
            OnKeyPress = PratCodiceKeyPress
            OnMouseUp = FilterAbbonatiMouseUp
          end
          object StaticText27: TStaticText
            Left = 0
            Top = 130
            Width = 280
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 27
            Transparent = False
          end
          object FilterInScadenza: TCheckListBox
            Left = 1
            Top = 131
            Width = 278
            Height = 14
            Cursor = crHandPoint
            OnClickCheck = FilterAbbonatiClickCheck
            BorderStyle = bsNone
            Color = 15266815
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Solo con manutenzione in SCADENZA')
            ParentCtl3D = False
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 28
            OnExit = FilterAbbonatiExit
            OnKeyPress = PratCodiceKeyPress
            OnMouseUp = FilterAbbonatiMouseUp
          end
          object StaticText28: TStaticText
            Left = 289
            Top = 54
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Costruttore'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 12
            Transparent = False
          end
          object FilterCostruttore: TcxComboBox
            Left = 353
            Top = 53
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Sorted = True
            Properties.OnInitPopup = FilterCostruttorePropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 10
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 175
          end
          object FilterModello: TcxComboBox
            Left = 353
            Top = 72
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.OnInitPopup = FilterModelloPropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 14
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 175
          end
          object FilterLocalita: TcxComboBox
            Left = 353
            Top = 110
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.OnInitPopup = FilterLocalitaPropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 21
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 175
          end
          object StaticText39: TStaticText
            Left = 1
            Top = 73
            Width = 279
            Height = 16
            AutoSize = False
            Caption = ' Periodicit'#224'  (GG)'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 15
            Transparent = False
          end
          object StaticText42: TStaticText
            Left = 1
            Top = 54
            Width = 279
            Height = 16
            AutoSize = False
            Caption = ' Tipo impianto'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 11
            Transparent = False
          end
          object FilterTipoImpianto: TcxComboBox
            Left = 94
            Top = 53
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Items.Strings = (
              'Caldaia'
              'Generico'
              'Macchina per freddo')
            Properties.Sorted = True
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 9
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 187
          end
          object FilterPeriodicita: TcxComboBox
            Left = 94
            Top = 72
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.OnInitPopup = FilterPeriodicitaPropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 13
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 187
          end
          object StaticText23: TStaticText
            Left = 537
            Top = 31
            Width = 147
            Height = 18
            AutoSize = False
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 3
            Transparent = False
          end
          object FilterTipoData: TcxComboBox
            Left = 538
            Top = 33
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.Items.Strings = (
              'Prossimo intervento'
              'Ultimo intervento')
            Properties.Sorted = True
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 4
            Text = 'Prossimo intervento'
            Height = 18
            Width = 145
          end
          object StaticText57: TStaticText
            Left = 289
            Top = 130
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Via'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 25
            Transparent = False
          end
          object FilterIndirizzo: TEdit
            Left = 355
            Top = 131
            Width = 171
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 26
            OnKeyPress = PratCodiceKeyPress
          end
          object StaticText69: TStaticText
            Left = 1
            Top = 92
            Width = 279
            Height = 16
            AutoSize = False
            Caption = ' Tipo contratto'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 18
            Transparent = False
          end
          object FilterTipoContratto: TcxComboBox
            Left = 94
            Top = 91
            AutoSize = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.ImmediateDropDownWhenKeyPressed = False
            Properties.OnInitPopup = FilterTipoContrattoPropertiesInitPopup
            Style.BorderStyle = ebsNone
            Style.Color = 15266815
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 17
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 187
          end
          object StaticText75: TStaticText
            Left = 30
            Top = 10
            Width = 330
            Height = 16
            AutoSize = False
            Caption = ' Trova'
            Color = 28895
            Font.Charset = ANSI_CHARSET
            Font.Color = 12902911
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
          object FilterAssTrova: TEdit
            Left = 66
            Top = 11
            Width = 293
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnKeyPress = PratCodiceKeyPress
          end
          object FilterSelezione: TCheckListBox
            Left = 367
            Top = 11
            Width = 319
            Height = 22
            Cursor = crHandPoint
            OnClickCheck = CantieriApertiChiusiClickCheck
            BorderStyle = bsNone
            Columns = 2
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ItemHeight = 14
            Items.Strings = (
              'Solo soggetto selezionato'
              'Solo intestatario documento')
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 2
            OnKeyPress = PratCodiceKeyPress
            OnMouseUp = PratSelezioneMouseUp
          end
          object StaticText1: TStaticText
            Left = 1
            Top = 35
            Width = 279
            Height = 16
            AutoSize = False
            Caption = ' N'#176' impianto'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            Transparent = False
          end
          object FilterCodiceImpianto: TEdit
            Left = 96
            Top = 36
            Width = 183
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnKeyPress = FilterCodiceImpiantoKeyPress
          end
          object StaticText50: TStaticText
            Left = 289
            Top = 35
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Cod.catasto'
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
          object FilterCodiceCatasto: TEdit
            Left = 355
            Top = 36
            Width = 171
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnKeyPress = PratCodiceKeyPress
          end
          object StaticText11: TStaticText
            Left = 289
            Top = 92
            Width = 238
            Height = 16
            AutoSize = False
            Caption = ' Matricola'
            Color = 11064319
            Font.Charset = ANSI_CHARSET
            Font.Color = 25542
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 19
            Transparent = False
          end
          object FilterMatricola: TEdit
            Left = 355
            Top = 93
            Width = 171
            Height = 14
            Hint = 
              'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
              'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
            AutoSize = False
            BorderStyle = bsNone
            Color = 15266815
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 20
            OnKeyPress = PratCodiceKeyPress
          end
          object AssDal: TcxDateEdit
            Left = 538
            Top = 61
            RepositoryItem = DM1.EdPropFilterDateEdit
            AutoSize = False
            ParentFont = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
            TabOrder = 29
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 72
          end
          object AssAl: TcxDateEdit
            Left = 611
            Top = 61
            RepositoryItem = DM1.EdPropFilterDateEdit
            AutoSize = False
            ParentFont = False
            Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
            TabOrder = 30
            OnKeyPress = PratCodiceKeyPress
            Height = 18
            Width = 72
          end
        end
        object GridSelezioneImpianti: TcxGrid
          Left = 0
          Top = 0
          Width = 686
          Height = 411
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = MenuGriglia
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = True
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object tvSelezioneImpianti: TcxGridDBTableView
            DragMode = dmAutomatic
            OnDblClick = tvSelezioneImpiantiDblClick
            OnEndDrag = tvSelezioneImpiantiEndDrag
            OnKeyPress = tvSelezioneCantiereKeyPress
            Navigator.Buttons.CustomButtons = <>
            OnCustomDrawCell = tvSelezioneImpiantiCustomDrawCell
            OnCustomDrawPartBackground = tvSelezioneImpiantiCustomDrawPartBackground
            DataController.DataSource = DSQ
            DataController.KeyFieldNames = 'TIPO;CODICE;DATAAPERTURA'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnGroupingChanged = tvQDataControllerGroupingChanged
            DataController.OnSortingChanged = tvQDataControllerSortingChanged
            OptionsBehavior.DragHighlighting = False
            OptionsBehavior.DragOpening = False
            OptionsBehavior.DragScrolling = False
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.BestFitMaxRecordCount = 50
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.DataRowHeight = 21
            OptionsView.GridLines = glVertical
            OptionsView.HeaderEndEllipsis = True
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvSelezioneImpiantiCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvSelezioneImpiantiCustomDrawGroupCell
            object tvSelezioneImpiantiABBONATO: TcxGridDBColumn
              Caption = 'Abb.'
              DataBinding.FieldName = 'ABBONATO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.AllowGrayed = True
              Properties.ValueChecked = 'T'
              Properties.ValueGrayed = 'S'
              Properties.ValueUnchecked = 'F'
              OnCustomDrawCell = tvSelezioneImpiantiABBONATOCustomDrawCell
              HeaderAlignmentHorz = taCenter
              MinWidth = 1
              Width = 30
            end
            object tvSelezioneImpiantiSTATO: TcxGridDBColumn
              Caption = 'Stato'
              DataBinding.FieldName = 'STATO'
              PropertiesClassName = 'TcxTextEditProperties'
              FooterAlignmentHorz = taRightJustify
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvSelezioneImpiantiDESCRIZIONE: TcxGridDBColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvSelezioneImpiantiDATAULTIMOINTERVENTO: TcxGridDBColumn
              Caption = 'Ult.visita'
              DataBinding.FieldName = 'DATAULTIMOINTERVENTO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.SaveTime = False
              Properties.ShowTime = False
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1
              Width = 60
            end
            object tvSelezioneImpiantiPROXVISITAENTRO: TcxGridDBColumn
              Caption = 'Prox.entro'
              DataBinding.FieldName = 'PROXVISITAENTRO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.SaveTime = False
              Properties.ShowTime = False
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 70
            end
            object tvSelezioneImpiantiDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBColumn
              Caption = 'Appuntamento'
              DataBinding.FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 90
            end
            object tvSelezioneImpiantiRAGIONESOCIALE: TcxGridDBColumn
              Caption = 'Proprietario'
              DataBinding.FieldName = 'RAGIONESOCIALE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              MinWidth = 1
              Width = 130
            end
            object tvSelezioneImpiantiRAGSOCUT: TcxGridDBColumn
              Caption = 'Utente/Occupante'
              DataBinding.FieldName = 'RAGSOCUT'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 130
            end
            object tvSelezioneImpiantiCOMUNEIMM: TcxGridDBColumn
              Caption = 'Localit'#224' utenza'
              DataBinding.FieldName = 'COMUNEIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object tvSelezioneImpiantiINDIRIZZOIMM: TcxGridDBColumn
              Caption = 'Indirizzo utenza'
              DataBinding.FieldName = 'INDIRIZZOIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvSelezioneImpiantiCAPIMM: TcxGridDBColumn
              Caption = 'CAP'
              DataBinding.FieldName = 'CAPIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 40
            end
            object tvSelezioneImpiantiPROVINCIAIMM: TcxGridDBColumn
              Caption = 'Prv.'
              DataBinding.FieldName = 'PROVINCIAIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 30
            end
            object tvSelezioneImpiantiPERIODICITA: TcxGridDBColumn
              Caption = 'Period.'
              DataBinding.FieldName = 'PERIODICITA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 45
            end
            object tvSelezioneImpiantiIMPORTOCONTRATTO: TcxGridDBColumn
              Caption = 'Importo'
              DataBinding.FieldName = 'IMPORTOCONTRATTO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object tvSelezioneImpiantiTIPOCONTRATTO: TcxGridDBColumn
              Caption = 'Contr.'
              DataBinding.FieldName = 'TIPOCONTRATTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 35
            end
            object tvSelezioneImpiantiTELEFONO: TcxGridDBColumn
              Caption = 'Telefono'
              DataBinding.FieldName = 'TELEFONO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvSelezioneImpiantiCELLULARE: TcxGridDBColumn
              Caption = 'Cellulare'
              DataBinding.FieldName = 'CELLULARE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvSelezioneImpiantiTIPOIMPIANTO: TcxGridDBColumn
              Caption = 'Tipo impianto'
              DataBinding.FieldName = 'TIPOIMPIANTO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 110
            end
            object tvSelezioneImpiantiTIPO: TcxGridDBColumn
              DataBinding.FieldName = 'TIPO'
              Visible = False
              VisibleForCustomization = False
            end
            object tvSelezioneImpiantiCODICE: TcxGridDBColumn
              DataBinding.FieldName = 'CODICE'
              Visible = False
              VisibleForCustomization = False
            end
            object tvSelezioneImpiantiDATAAPERTURA: TcxGridDBColumn
              DataBinding.FieldName = 'DATAAPERTURA'
              Visible = False
              VisibleForCustomization = False
            end
            object tvSelezioneImpiantiCLIENTE: TcxGridDBColumn
              DataBinding.FieldName = 'CLIENTE'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object lvQ: TcxGridLevel
            GridView = tvSelezioneImpianti
            Options.DetailFrameColor = clBlack
          end
        end
      end
    end
  end
  object QryPratiche: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM PRATICHE WHERE'
      'CODICE = :CODICE'
      'AND DATAAPERTURA = :DATAAPERTURA')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransPratiche
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT '
      '       P.TIPO'
      '     , P.CODICE'
      '     , P.ID'
      '     , P.DESCRIZIONE'
      '     , P.DATAAPERTURA'
      '     , P.DATACHIUSURA'
      '     , P.STATODESCRIZIONE'
      
        '     , CAST(P.CLIENTE || '#39' - '#39' || C.RAGIONESOCIALE AS VARCHAR(60' +
        ') )  AS RAGIONESOCIALE'
      '     , P.STATOFOREGROUND'
      '     , P.STATOBACKGROUND'
      '     , P.CLIENTE'
      '     , C.RAGIONESOCIALE AS RAGSOC'
      '     , P.CATEGCANT1'
      '     , P.CATEGCANT2'
      '     , P.CATEGCANT3'
      '     , P.CATEGCANT4'
      '     , P.CATEGCANT5'
      '     , P.CATEGCANT6'
      '     , AGENTE'
      '     , AGENTE2'
      '     , AGENTE3'
      '     , AGENTE4'
      'FROM PRATICHE P'
      'LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE')
    FieldOptions = []
    Left = 623
    Top = 6
    object QryPraticheCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object QryPraticheDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryPraticheDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
      Required = True
    end
    object QryPraticheDATACHIUSURA: TDateTimeField
      FieldName = 'DATACHIUSURA'
    end
    object QryPraticheSTATODESCRIZIONE: TStringField
      FieldName = 'STATODESCRIZIONE'
      Size = 10
    end
    object QryPraticheRAGIONESOCIALE: TStringField
      DisplayWidth = 80
      FieldName = 'RAGIONESOCIALE'
      ReadOnly = True
      Size = 80
    end
    object QryPraticheSTATOFOREGROUND: TStringField
      FieldName = 'STATOFOREGROUND'
      Size = 10
    end
    object QryPraticheSTATOBACKGROUND: TStringField
      FieldName = 'STATOBACKGROUND'
      Size = 10
    end
    object QryPraticheTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QryPraticheCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QryPraticheRAGSOC: TStringField
      FieldName = 'RAGSOC'
      Size = 60
    end
    object QryPraticheCATEGCANT1: TStringField
      FieldName = 'CATEGCANT1'
      Size = 30
    end
    object QryPraticheCATEGCANT2: TStringField
      FieldName = 'CATEGCANT2'
      Size = 30
    end
    object QryPraticheCATEGCANT3: TStringField
      FieldName = 'CATEGCANT3'
      Size = 30
    end
    object QryPraticheCATEGCANT4: TStringField
      FieldName = 'CATEGCANT4'
      Size = 30
    end
    object QryPraticheCATEGCANT5: TStringField
      FieldName = 'CATEGCANT5'
      Size = 30
    end
    object QryPraticheCATEGCANT6: TStringField
      FieldName = 'CATEGCANT6'
      Size = 30
    end
    object QryPraticheAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 25
    end
    object QryPraticheAGENTE2: TStringField
      FieldName = 'AGENTE2'
      Size = 25
    end
    object QryPraticheAGENTE3: TStringField
      FieldName = 'AGENTE3'
      Size = 25
    end
    object QryPraticheAGENTE4: TStringField
      FieldName = 'AGENTE4'
      Size = 25
    end
    object QryPraticheID: TIntegerField
      FieldName = 'ID'
    end
  end
  object SourcePratiche: TDataSource
    AutoEdit = False
    DataSet = QryPratiche
    Left = 652
    Top = 6
  end
  object DSQ: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 541
    Top = 32
  end
  object Q: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransQ
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    OnCalcFields = QCalcFields
    SQL.Strings = (
      'SELECT'
      '      P.TIPO,'
      '      P.CODICE,'
      '      P.DATAAPERTURA,'
      '      P.ID,'
      '      P.DESCRIZIONE,'
      
        '      CAST(P.CLIENTE || '#39' - '#39' || C.RAGIONESOCIALE AS VARCHAR(60)' +
        ' )  AS RAGIONESOCIALE,'
      '      C.Telefono,'
      '      C.Cellulare,'
      '      P.ProvinciaIMM,'
      '      P.ComuneIMM,'
      '      P.CAPImm,'
      '      P.CONTRATTO_STATO AS ABBONATO,'
      '      P.CONTRATTO_TIPO AS TIPOCONTRATTO,'
      '      P.CONTRATTO_IMPORTO AS IMPORTOCONTRATTO,'
      '      P.TipoImpianto,'
      '      P.Periodicita,'
      '      P.RAGSOCUT,'
      '      P.CLIENTE,'
      '      P.PROXVISITAENTRO,'
      
        '      (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Intervento'#39') AS DataUltimoIntervento,'
      
        '      (SELECT MIN(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Appuntam.'#39') AS DataOraProssimoAppuntamento,'
      '      CAST(P.INDIRIZZOIMM AS VARCHAR(60)) AS INDIRIZZOIMM'
      'FROM PRATICHE P'
      'LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE')
    FieldOptions = []
    Left = 512
    Top = 32
    object QTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
      Required = True
    end
    object QDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      ReadOnly = True
      Size = 60
    end
    object QTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
    object QCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Size = 30
    end
    object QPROVINCIAIMM: TStringField
      FieldName = 'PROVINCIAIMM'
      Size = 3
    end
    object QCOMUNEIMM: TStringField
      FieldName = 'COMUNEIMM'
      Size = 25
    end
    object QCAPIMM: TStringField
      FieldName = 'CAPIMM'
      Size = 5
    end
    object QABBONATO: TStringField
      FieldName = 'ABBONATO'
      Size = 1
    end
    object QTIPOCONTRATTO: TStringField
      FieldName = 'TIPOCONTRATTO'
      Size = 60
    end
    object QIMPORTOCONTRATTO: TIBOFloatField
      FieldName = 'IMPORTOCONTRATTO'
    end
    object QTIPOIMPIANTO: TStringField
      FieldName = 'TIPOIMPIANTO'
    end
    object QPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QRAGSOCUT: TStringField
      FieldName = 'RAGSOCUT'
      Size = 60
    end
    object QCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QPROXVISITAENTRO: TDateTimeField
      FieldName = 'PROXVISITAENTRO'
    end
    object QDATAULTIMOINTERVENTO: TDateTimeField
      FieldName = 'DATAULTIMOINTERVENTO'
      ReadOnly = True
    end
    object QDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField
      FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
      ReadOnly = True
    end
    object QINDIRIZZOIMM: TStringField
      FieldName = 'INDIRIZZOIMM'
      ReadOnly = True
      Size = 60
    end
    object QSTATO: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATO'
      Calculated = True
    end
    object QID: TIntegerField
      FieldName = 'ID'
    end
  end
  object MenuGriglia: TPopupMenu
    OnPopup = MenuGrigliaPopup
    Left = 158
    Top = 22
    object Selezionavista1: TMenuItem
      Caption = 'Seleziona vista'
      OnClick = Selezionavista1Click
    end
    object Salvalavistaattuale1: TMenuItem
      Caption = 'Salva la vista attuale'
      OnClick = Salvalavistaattuale1Click
    end
    object Ripristinacolonneeliminate1: TMenuItem
      Caption = 'Ripristina colonne eliminate'
      OnClick = Ripristinacolonneeliminate1Click
    end
  end
  object TransQ: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 483
    Top = 32
  end
  object TransPratiche: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 594
    Top = 6
  end
end
