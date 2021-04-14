inherited TabPartitarioForm: TTabPartitarioForm
  Left = 555
  Top = 224
  Caption = 'TabPartitarioForm'
  ClientHeight = 675
  ClientWidth = 792
  Color = clWhite
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 792
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlPartitario: TcxPageControl
    Left = 0
    Top = 0
    Width = 685
    Height = 571
    Cursor = crHandPoint
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = TabPartSoggetti
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 9
    OnChange = PageControlPartitarioChange
    ClientRectBottom = 571
    ClientRectRight = 685
    ClientRectTop = 21
    object TabPartSoggetti: TcxTabSheet
      Caption = ' Soggetti '
      ImageIndex = 0
      object PanelPartitario: TPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          685
          550)
        object PanelPartFiltri: TPanel
          Left = 0
          Top = 392
          Width = 685
          Height = 158
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          OnResize = PanelPartFiltriResize
          object SubPanelPartFiltri: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 158
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Label25: TLabel
              Left = 611
              Top = 35
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
            object Label77: TLabel
              Left = 537
              Top = 35
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
            object PartFilterSet: TSpeedButton
              Tag = 9
              Left = 587
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterOtt: TSpeedButton
              Tag = 10
              Left = 611
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterNov: TSpeedButton
              Tag = 11
              Left = 635
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterDic: TSpeedButton
              Tag = 12
              Left = 659
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterAgo: TSpeedButton
              Tag = 8
              Left = 563
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterLug: TSpeedButton
              Tag = 7
              Left = 539
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterGiu: TSpeedButton
              Tag = 6
              Left = 659
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterMag: TSpeedButton
              Tag = 5
              Left = 635
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterGen: TSpeedButton
              Tag = 1
              Left = 539
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterFeb: TSpeedButton
              Tag = 2
              Left = 563
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterMar: TSpeedButton
              Tag = 3
              Left = 587
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterApr: TSpeedButton
              Tag = 4
              Left = 611
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartFilterGenClick
              OnMouseUp = PartFilterGenMouseUp
            end
            object PartFilterMesiTutti: TSpeedButton
              Left = 539
              Top = 66
              Width = 65
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
              OnClick = PartFilterMesiTuttiClick
              OnMouseUp = PartFilterMesiTuttiMouseUp
            end
            object PartFilterMesiNessuno: TSpeedButton
              Left = 604
              Top = 66
              Width = 55
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
              OnClick = PartFilterMesiNessunoClick
              OnMouseUp = PartFilterMesiNessunoMouseUp
            end
            object SBPartFilterOpenClose: TSpeedButtonRollOver
              Left = 1
              Top = 3
              Width = 19
              Height = 27
              Cursor = crHandPoint
              OnClick = SBPartFilterOpenCloseClick
            end
            object SpeedButton21: TSpeedButton
              Left = 662
              Top = 66
              Width = 21
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
                'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
                'li anni).'
              Caption = 'M+'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton21Click
            end
            object StaticText11: TStaticText
              Left = 175
              Top = 35
              Width = 219
              Height = 16
              AutoSize = False
              Caption = ' Banca'
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
            object StaticText8: TStaticText
              Left = 0
              Top = 61
              Width = 242
              Height = 73
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
              TabOrder = 12
              Transparent = False
            end
            object PartFilterInclude: TCheckListBox
              Left = 1
              Top = 62
              Width = 240
              Height = 71
              Cursor = crHandPoint
              OnClickCheck = PartFilterIncludeClickCheck
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
                'Visualizza i DDT non ancora fatturati (Dare)'
                'Visualizza le Ricevute Fiscali (Dare)'
                'Visualizza gli Interventi (Avere)'
                'Visualizza i movimenti di primanota (Avere)'
                'Escludi Fatt.acqui. e relativi movimenti')
              ParentCtl3D = False
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 5
              OnExit = PartFilterIncludeExit
              OnMouseUp = PartFilterIncludeMouseUp
            end
            object StaticText80: TStaticText
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
              TabOrder = 13
              Transparent = False
            end
            object PartFilterDescrizione: TEdit
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
              TabOrder = 0
              OnKeyPress = PartFilterDescrizioneKeyPress
            end
            object LabelPartAgente: TStaticText
              Left = -2
              Top = 142
              Width = 169
              Height = 16
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
              TabOrder = 10
              Transparent = False
            end
            object PartFilterAgente: TcxComboBox
              Left = 70
              Top = 141
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartFilterAgentePropertiesEditValueChanged
              Properties.OnInitPopup = PartFilterAgentePropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 98
            end
            object LabelPartAgente2: TStaticText
              Left = 172
              Top = 142
              Width = 167
              Height = 16
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
              TabOrder = 14
              Transparent = False
            end
            object PartFilterAgente2: TcxComboBox
              Left = 244
              Top = 141
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartFilterAgente2PropertiesEditValueChanged
              Properties.OnInitPopup = PartFilterAgente2PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartAgente3: TStaticText
              Left = 345
              Top = 142
              Width = 167
              Height = 16
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
              TabOrder = 15
              Transparent = False
            end
            object PartFilterAgente3: TcxComboBox
              Left = 417
              Top = 141
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartFilterAgente3PropertiesEditValueChanged
              Properties.OnInitPopup = PartFilterAgente3PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartAgente4: TStaticText
              Left = 517
              Top = 142
              Width = 167
              Height = 16
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
              TabOrder = 16
              Transparent = False
            end
            object PartFilterAgente4: TcxComboBox
              Left = 589
              Top = 141
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = PartFilterAgente4PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object StaticText35: TStaticText
              Left = 0
              Top = 35
              Width = 170
              Height = 16
              AutoSize = False
              Caption = ' Tipo soggetto'
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
            object PartFilterTipoSoggetto: TcxComboBox
              Left = 75
              Top = 34
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsEditFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.Sorted = True
              Properties.OnInitPopup = PartFilterTipoSoggettoPropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object PartFilterBanca: TcxComboBox
              Left = 213
              Top = 34
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsEditFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.Sorted = True
              Properties.OnInitPopup = cxComboBox1PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 182
            end
            object PartFilterDal: TcxDateEdit
              Left = 539
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 3
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
            object PartFilterAl: TcxDateEdit
              Left = 611
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 4
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
            object StaticText1: TStaticText
              Left = 248
              Top = 61
              Width = 242
              Height = 44
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
              TabOrder = 18
            end
            object PartFilterOther: TCheckListBox
              Left = 249
              Top = 62
              Width = 240
              Height = 42
              Cursor = crHandPoint
              OnClickCheck = PartFilterIncludeClickCheck
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
                'Visualizza i righi del documento sulle note'
                'Solo cant./pratiche aperte'
                'Non considerare i bolli in fattura')
              ParentCtl3D = False
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 19
              OnExit = PartFilterIncludeExit
              OnMouseUp = PartFilterIncludeMouseUp
            end
          end
        end
        object GridPart: TcxGrid
          Left = 0
          Top = 35
          Width = 685
          Height = 302
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = MenuGrids
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object tvPart: TcxGridTableView
            OnDblClick = tvPartDblClick
            OnEndDrag = tvPartEndDrag
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCustomDrawCell = tvPartCustomDrawCell
            OnCustomDrawPartBackground = tvPartCustomDrawPartBackground
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartDARE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartAVERE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems2GetText
                Column = tvPartSALDO
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnGroupingChanged = tvPartDataControllerGroupingChanged
            DataController.OnSortingChanged = tvPartDataControllerSortingChanged
            DateTimeHandling.Grouping = dtgByMonth
            FilterRow.InfoText = 'Clicca qui per definire un filtro'
            FilterRow.ApplyChanges = fracImmediately
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupSummaryLayout = gslAlignWithColumns
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvPartCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvPartCustomDrawGroupCell
            object tvPartTEMPID: TcxGridColumn
              Caption = 'ID'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soAscending
            end
            object tvPartDATA: TcxGridColumn
              Caption = 'Data'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 80
            end
            object tvPartDESCRIZIONE: TcxGridColumn
              Caption = 'Descrizione'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object tvPartDARE: TcxGridColumn
              Caption = 'Dare'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartAVERE: TcxGridColumn
              Caption = 'Avere'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartSALDO: TcxGridColumn
              Caption = 'Saldo mov.'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              VisibleForCustomization = False
              Width = 120
            end
            object tvPartBANCA: TcxGridColumn
              Caption = 'Banca'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartNOTE: TcxGridColumn
              Caption = 'Note'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvPartDOCTIPO: TcxGridColumn
              Caption = 'Tipo doc.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartDOCNUM: TcxGridColumn
              Caption = 'N'#176' doc.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartDOCREG: TcxGridColumn
              Caption = 'Reg.'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartDOCDATA: TcxGridColumn
              Caption = 'Data doc.'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartSOGGETTO: TcxGridColumn
              Caption = 'Soggetto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 150
            end
            object tvPartRIFPRATICA: TcxGridColumn
              Caption = 'Cabtiere/Impianto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvPartAGENTE: TcxGridColumn
              Caption = 'Agente1'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAGENTE2: TcxGridColumn
              Caption = 'Agente2'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAGENTE3: TcxGridColumn
              Caption = 'Agente3'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAGENTE4: TcxGridColumn
              Caption = 'Agente4'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartSTATODESCRIZIONE: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvPartSTATOFOREGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvPartSTATOBACKGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
          end
          object lvPart: TcxGridLevel
            GridView = tvPart
          end
        end
        object Panel23: TPanel
          Left = 629
          Top = 48
          Width = 28
          Height = 14
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 16037544
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object PartSoggCollapseButton: TSpeedButton
            Left = 1
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
              00001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = PartSoggCollapseButtonClick
          end
          object PartSoggExpandButton: TSpeedButton
            Left = 16
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F1000
              00001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000
              FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = PartSoggExpandButtonClick
          end
        end
        object Panel21: TPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            685
            35)
          object Label78: TLabel
            Left = 323
            Top = 14
            Width = 51
            Height = 15
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = '  Riporti'
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Label83: TLabel
            Left = 384
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label84: TLabel
            Left = 476
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label85: TLabel
            Left = 588
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object RiportoDare: TcxCurrencyEdit
            Left = 382
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object RiportoAvere: TcxCurrencyEdit
            Left = 474
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object RiportoSaldo: TcxCurrencyEdit
            Left = 587
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object RiportoSegno: TcxTextEdit
            Left = 572
            Top = 13
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Height = 18
            Width = 18
          end
        end
        object Panel25: TPanel
          Left = 0
          Top = 337
          Width = 685
          Height = 55
          Align = alBottom
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 4
          DesignSize = (
            685
            55)
          object Label79: TLabel
            Left = 269
            Top = 36
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label87: TLabel
            Left = 385
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label88: TLabel
            Left = 477
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object LabelTotSaldo: TLabel
            Left = 589
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Shape25: TShape
            Left = 0
            Top = 0
            Width = 685
            Height = 1
            Align = alTop
            Brush.Style = bsClear
          end
          object Label90: TLabel
            Left = 269
            Top = 15
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali del periodo'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object PanelFido: TPanel
            Left = 0
            Top = 1
            Width = 249
            Height = 54
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 8
            Visible = False
            object Label80: TLabel
              Left = 6
              Top = 35
              Width = 112
              Height = 12
              Caption = 'Importo fido concesso'
              Color = 8963327
              Font.Charset = ANSI_CHARSET
              Font.Color = 5131854
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object TotPartFido: TcxCurrencyEdit
              Left = 129
              Top = 32
              TabStop = False
              AutoSize = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 18
              Width = 70
            end
          end
          object TotDare: TcxCurrencyEdit
            Left = 383
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object TotAvere: TcxCurrencyEdit
            Left = 475
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object TotSaldo: TcxCurrencyEdit
            Left = 588
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object TotPerDare: TcxCurrencyEdit
            Left = 383
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 18
            Width = 90
          end
          object TotPerAvere: TcxCurrencyEdit
            Left = 475
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Height = 18
            Width = 90
          end
          object TotPerSaldo: TcxCurrencyEdit
            Left = 588
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Height = 18
            Width = 90
          end
          object TotSegno: TcxTextEdit
            Left = 573
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Height = 18
            Width = 18
          end
          object TotPerSegno: TcxTextEdit
            Left = 573
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Height = 18
            Width = 18
          end
        end
      end
    end
    object TabPartIva: TcxTabSheet
      Caption = ' IVA '
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          685
          550)
        object PanelPartIvaFiltri: TPanel
          Left = 0
          Top = 407
          Width = 685
          Height = 143
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          OnResize = PanelPartFiltriResize
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 143
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Label1: TLabel
              Left = 611
              Top = 35
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
            object Label4: TLabel
              Left = 537
              Top = 35
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
            object PartIvaFilterSet: TSpeedButton
              Tag = 9
              Left = 587
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterOtt: TSpeedButton
              Tag = 10
              Left = 611
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterNov: TSpeedButton
              Tag = 11
              Left = 635
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterDic: TSpeedButton
              Tag = 12
              Left = 659
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterAgo: TSpeedButton
              Tag = 8
              Left = 563
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterLug: TSpeedButton
              Tag = 7
              Left = 539
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterGiu: TSpeedButton
              Tag = 6
              Left = 659
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterMag: TSpeedButton
              Tag = 5
              Left = 635
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterGen: TSpeedButton
              Tag = 1
              Left = 539
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterFeb: TSpeedButton
              Tag = 2
              Left = 563
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterMar: TSpeedButton
              Tag = 3
              Left = 587
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterApr: TSpeedButton
              Tag = 4
              Left = 611
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartIvaFilterGenClick
              OnMouseUp = PartIvaFilterGenMouseUp
            end
            object PartIvaFilterMesiTutti: TSpeedButton
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
              OnClick = PartIvaFilterMesiTuttiClick
              OnMouseUp = PartIvaFilterMesiTuttiMouseUp
            end
            object PartIvaFilterMesiNessuno: TSpeedButton
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
              OnClick = PartIvaFilterMesiNessunoClick
              OnMouseUp = PartIvaFilterMesiNessunoMouseUp
            end
            object SBPartIvaFilterOpenClose: TSpeedButtonRollOver
              Left = 1
              Top = 3
              Width = 19
              Height = 27
              Cursor = crHandPoint
              OnClick = SBPartIvaFilterOpenCloseClick
            end
            object StaticText68: TStaticText
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
              TabOrder = 1
              Transparent = False
            end
            object PartIvaFilterDescrizione: TEdit
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
              TabOrder = 0
              OnKeyPress = PartFilterDescrizioneKeyPress
            end
            object LabelPartIvaAgente: TStaticText
              Left = -2
              Top = 127
              Width = 169
              Height = 16
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
              TabOrder = 2
              Transparent = False
            end
            object PartIvaFilterAgente: TcxComboBox
              Left = 70
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartIvaFilterAgentePropertiesEditValueChanged
              Properties.OnInitPopup = PartIvaFilterAgentePropertiesInitPopup
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
              TabOrder = 3
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 98
            end
            object LabelPartIvaAgente2: TStaticText
              Left = 172
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 4
              Transparent = False
            end
            object PartIvaFilterAgente2: TcxComboBox
              Left = 244
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartIvaFilterAgente2PropertiesEditValueChanged
              Properties.OnInitPopup = PartIvaFilterAgente2PropertiesInitPopup
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
              TabOrder = 5
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartIvaAgente3: TStaticText
              Left = 345
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 6
              Transparent = False
            end
            object PartIvaFilterAgente3: TcxComboBox
              Left = 417
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartIvaFilterAgente3PropertiesEditValueChanged
              Properties.OnInitPopup = PartIvaFilterAgente3PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartIvaAgente4: TStaticText
              Left = 517
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 8
              Transparent = False
            end
            object PartIvaFilterAgente4: TcxComboBox
              Left = 589
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = PartIvaFilterAgente4PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object PartIvaFilterDal: TcxDateEdit
              Left = 539
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 10
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
            object PartIvaFilterAl: TcxDateEdit
              Left = 611
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 11
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
          end
        end
        object GridPartIva: TcxGrid
          Left = 0
          Top = 35
          Width = 685
          Height = 317
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = MenuGrids
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = True
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object tvPartIva: TcxGridTableView
            OnDblClick = tvPartDblClick
            OnEndDrag = tvPartEndDrag
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCustomDrawCell = tvPartIvaCustomDrawCell
            OnCustomDrawPartBackground = tvPartCustomDrawPartBackground
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartIvaDARE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartIvaAVERE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems2GetText
                Column = tvPartIvaSALDO
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnGroupingChanged = tvPartIvaDataControllerGroupingChanged
            DataController.OnSortingChanged = tvPartIvaDataControllerSortingChanged
            DateTimeHandling.Grouping = dtgByMonth
            FilterRow.InfoText = 'Clicca qui per definire un filtro'
            FilterRow.ApplyChanges = fracImmediately
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupSummaryLayout = gslAlignWithColumns
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvPartCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvPartCustomDrawGroupCell
            object tvPartIvaTEMPID: TcxGridColumn
              Caption = 'ID'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soAscending
            end
            object tvPartIvaDATA: TcxGridColumn
              Caption = 'Data'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 80
            end
            object tvPartIvaDESCRIZIONE: TcxGridColumn
              Caption = 'Descrizione'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object tvPartIvaDARE: TcxGridColumn
              Caption = 'Dare'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartIvaAVERE: TcxGridColumn
              Caption = 'Avere'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartIvaSALDO: TcxGridColumn
              Caption = 'Saldo mov.'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taRightJustify
              Styles.Content = DM1.tvAnotherContent1Bold
              VisibleForCustomization = False
              Width = 120
            end
            object tvPartIvaBANCA: TcxGridColumn
              Caption = 'Banca'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartIvaNOTE: TcxGridColumn
              Caption = 'Note'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 250
            end
            object tvPartIvaDOCTIPO: TcxGridColumn
              Caption = 'Tipo doc.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartIvaDOCNUM: TcxGridColumn
              Caption = 'N'#176' doc.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartIvaDOCREG: TcxGridColumn
              Caption = 'DOCREG'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartIvaDOCDATA: TcxGridColumn
              Caption = 'Data doc.'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartIvaSOGGETTO: TcxGridColumn
              Caption = 'Soggetto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 150
            end
            object tvPartIvaRIFPRATICA: TcxGridColumn
              Caption = 'Cantiere/Impianto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvPartIvaAGENTE: TcxGridColumn
              Caption = 'Agente1'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartIvaAGENTE2: TcxGridColumn
              Caption = 'Agente2'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartIvaAGENTE3: TcxGridColumn
              Caption = 'Agente3'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartIvaAGENTE4: TcxGridColumn
              Caption = 'Agente4'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartIvaSTATODESCRIZIONE: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvPartIvaSTATOFOREGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvPartIvaSTATOBACKGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
          end
          object lvPartIva: TcxGridLevel
            GridView = tvPartIva
          end
        end
        object Panel9: TPanel
          Left = 629
          Top = 48
          Width = 28
          Height = 14
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 16037544
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object PartIvaCollapseButton: TSpeedButton
            Left = 1
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
              00001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = PartIvaCollapseButtonClick
          end
          object PartIvaExpandButton: TSpeedButton
            Left = 16
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F1000
              00001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000
              FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = PartIvaExpandButtonClick
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            685
            35)
          object Label9: TLabel
            Left = 323
            Top = 14
            Width = 51
            Height = 15
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = '  Riporti'
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Label11: TLabel
            Left = 384
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label13: TLabel
            Left = 476
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label19: TLabel
            Left = 588
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object RiportoPartIvaDare: TcxCurrencyEdit
            Left = 382
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object RiportoPartIvaAvere: TcxCurrencyEdit
            Left = 474
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object RiportoPartIvaSaldo: TcxCurrencyEdit
            Left = 587
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object RiportoPartIvaSegno: TcxTextEdit
            Left = 572
            Top = 13
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Height = 18
            Width = 18
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 352
          Width = 685
          Height = 55
          Align = alBottom
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 4
          DesignSize = (
            685
            55)
          object Label31: TLabel
            Left = 269
            Top = 36
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label49: TLabel
            Left = 385
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label52: TLabel
            Left = 477
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label62: TLabel
            Left = 589
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Shape3: TShape
            Left = 0
            Top = 0
            Width = 685
            Height = 1
            Align = alTop
            Brush.Style = bsClear
          end
          object Label63: TLabel
            Left = 269
            Top = 15
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali del periodo'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Panel22: TPanel
            Left = 0
            Top = 1
            Width = 249
            Height = 54
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 8
            Visible = False
            object Label64: TLabel
              Left = 6
              Top = 35
              Width = 112
              Height = 12
              Caption = 'Importo fido concesso'
              Color = 8963327
              Font.Charset = ANSI_CHARSET
              Font.Color = 5131854
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object cxCurrencyEdit4: TcxCurrencyEdit
              Left = 129
              Top = 32
              TabStop = False
              AutoSize = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 18
              Width = 70
            end
          end
          object TotPartIvaDare: TcxCurrencyEdit
            Left = 383
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object TotPartIvaAvere: TcxCurrencyEdit
            Left = 475
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object TotPartIvaSaldo: TcxCurrencyEdit
            Left = 588
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object TotPartIvaPerDare: TcxCurrencyEdit
            Left = 383
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 18
            Width = 90
          end
          object TotPartIvaPerAvere: TcxCurrencyEdit
            Left = 475
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Height = 18
            Width = 90
          end
          object TotPartIvaPerSaldo: TcxCurrencyEdit
            Left = 588
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Height = 18
            Width = 90
          end
          object TotPartIvaSegno: TcxTextEdit
            Left = 573
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Height = 18
            Width = 18
          end
          object TotPartIvaPerSegno: TcxTextEdit
            Left = 573
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 13822463
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Height = 18
            Width = 18
          end
        end
      end
    end
    object TabPartAltro: TcxTabSheet
      Caption = ' Altri conti '
      ImageIndex = 2
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          685
          550)
        object PanelPartAltroFiltri: TPanel
          Left = 0
          Top = 367
          Width = 685
          Height = 183
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          OnResize = PanelPartFiltriResize
          object Panel30: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 183
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Label65: TLabel
              Left = 611
              Top = 35
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
            object Label66: TLabel
              Left = 537
              Top = 35
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
            object PartAltroFilterSet: TSpeedButton
              Tag = 9
              Left = 587
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterOtt: TSpeedButton
              Tag = 10
              Left = 611
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterNov: TSpeedButton
              Tag = 11
              Left = 635
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterDic: TSpeedButton
              Tag = 12
              Left = 659
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterAgo: TSpeedButton
              Tag = 8
              Left = 563
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterLug: TSpeedButton
              Tag = 7
              Left = 539
              Top = 101
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterGiu: TSpeedButton
              Tag = 6
              Left = 659
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterMag: TSpeedButton
              Tag = 5
              Left = 635
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterGen: TSpeedButton
              Tag = 1
              Left = 539
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterFeb: TSpeedButton
              Tag = 2
              Left = 563
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterMar: TSpeedButton
              Tag = 3
              Left = 587
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterApr: TSpeedButton
              Tag = 4
              Left = 611
              Top = 84
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 50
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
              OnClick = PartAltroFilterGenClick
              OnMouseUp = PartAltroFilterGenMouseUp
            end
            object PartAltroFilterMesiTutti: TSpeedButton
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
              OnClick = PartAltroFilterMesiTuttiClick
              OnMouseUp = PartAltroFilterMesiTuttiMouseUp
            end
            object PartAltroFilterMesiNessuno: TSpeedButton
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
              OnClick = PartAltroFilterMesiNessunoClick
              OnMouseUp = PartAltroFilterMesiNessunoMouseUp
            end
            object SBPartAltroFilterOpenClose: TSpeedButtonRollOver
              Left = 1
              Top = 3
              Width = 19
              Height = 27
              Cursor = crHandPoint
              OnClick = SBPartAltroFilterOpenCloseClick
            end
            object StaticText85: TStaticText
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
              TabOrder = 3
              Transparent = False
            end
            object PartAltroFilterDescrizione: TEdit
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
              TabOrder = 0
              OnKeyPress = PartFilterDescrizioneKeyPress
            end
            object PartAltroFilterLabelTipo1: TStaticText
              Left = 0
              Top = 150
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 1'
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
            object PartAltroFilterTipo1: TcxComboBox
              Left = 72
              Top = 149
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              Width = 155
            end
            object PartAltroFilterLabelTipo2: TStaticText
              Left = 229
              Top = 150
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 2'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 14
              Transparent = False
            end
            object PartAltroFilterTipo2: TcxComboBox
              Left = 301
              Top = 149
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              TabOrder = 15
              Height = 17
              Width = 155
            end
            object PartAltroFilterLabelTipo3: TStaticText
              Left = 458
              Top = 150
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 3'
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
            object PartAltroFilterTipo3: TcxComboBox
              Left = 530
              Top = 149
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              Height = 17
              Width = 155
            end
            object PartAltroFilterLabelTipo4: TStaticText
              Left = 0
              Top = 168
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 4'
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
            object PartAltroFilterTipo4: TcxComboBox
              Left = 72
              Top = 167
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              TabOrder = 19
              Height = 17
              Width = 155
            end
            object PartAltroFilterLabelTipo5: TStaticText
              Left = 229
              Top = 168
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 5'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 20
              Transparent = False
            end
            object PartAltroFilterTipo5: TcxComboBox
              Left = 301
              Top = 167
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              Height = 17
              Width = 155
            end
            object PartAltroFilterLabelTipo6: TStaticText
              Left = 458
              Top = 168
              Width = 226
              Height = 15
              AutoSize = False
              Caption = ' Tipo 6'
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
            object PartAltroFilterTipo6: TcxComboBox
              Left = 530
              Top = 167
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = PartAltroFilterTipo1PropertiesInitPopup
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
              TabOrder = 23
              Height = 17
              Width = 155
            end
            object LabelPartAltroAgente: TStaticText
              Left = -2
              Top = 127
              Width = 169
              Height = 16
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
              TabOrder = 5
              Transparent = False
            end
            object PartAltroFilterAgente: TcxComboBox
              Left = 70
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartAltroFilterAgentePropertiesEditValueChanged
              Properties.OnInitPopup = PartAltroFilterAgentePropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 98
            end
            object LabelPartAltroAgente2: TStaticText
              Left = 172
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 7
              Transparent = False
            end
            object PartAltroFilterAgente2: TcxComboBox
              Left = 244
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartAltroFilterAgente2PropertiesEditValueChanged
              Properties.OnInitPopup = PartAltroFilterAgente2PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartAltroAgente3: TStaticText
              Left = 345
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 9
              Transparent = False
            end
            object PartAltroFilterAgente3: TcxComboBox
              Left = 417
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnEditValueChanged = PartAltroFilterAgente3PropertiesEditValueChanged
              Properties.OnInitPopup = PartAltroFilterAgente3PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object LabelPartAltroAgente4: TStaticText
              Left = 517
              Top = 127
              Width = 167
              Height = 16
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
              TabOrder = 11
              Transparent = False
            end
            object PartAltroFilterAgente4: TcxComboBox
              Left = 589
              Top = 126
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = PartAltroFilterAgente4PropertiesInitPopup
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
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 96
            end
            object PartAltroFilterDal: TcxDateEdit
              Left = 539
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 1
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
            object PartAltroFilterAl: TcxDateEdit
              Left = 611
              Top = 47
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 2
              OnKeyPress = PartFilterDescrizioneKeyPress
              Height = 18
              Width = 72
            end
          end
        end
        object GridPartAltro: TcxGrid
          Left = 0
          Top = 35
          Width = 685
          Height = 277
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = MenuGrids
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = True
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object tvPartAltro: TcxGridTableView
            OnDblClick = tvPartDblClick
            OnEndDrag = tvPartEndDrag
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCustomDrawCell = tvPartAltroCustomDrawCell
            OnCustomDrawPartBackground = tvPartCustomDrawPartBackground
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartAltroDARE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                Column = tvPartAltroAVERE
              end
              item
                Format = '#,0.00'
                Kind = skSum
                OnGetText = tvPartTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems2GetText
                Column = tvPartAltroSALDO
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnGroupingChanged = tvPartAltroDataControllerGroupingChanged
            DataController.OnSortingChanged = tvPartAltroDataControllerSortingChanged
            DateTimeHandling.Grouping = dtgByMonth
            FilterRow.InfoText = 'Clicca qui per definire un filtro'
            FilterRow.ApplyChanges = fracImmediately
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupSummaryLayout = gslAlignWithColumns
            Styles.StyleSheet = DM1.MasterTableViewStyleSheet
            OnCustomDrawColumnHeader = tvPartCustomDrawColumnHeader
            OnCustomDrawGroupCell = tvPartCustomDrawGroupCell
            object tvPartAltroTEMPID: TcxGridColumn
              Caption = 'ID'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soAscending
            end
            object tvPartAltroDATA: TcxGridColumn
              Caption = 'Data'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 80
            end
            object tvPartAltroDESCRIZIONE: TcxGridColumn
              Caption = 'Descrizione'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 300
            end
            object tvPartAltroDARE: TcxGridColumn
              Caption = 'Dare'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartAltroAVERE: TcxGridColumn
              Caption = 'Avere'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              Width = 100
            end
            object tvPartAltroSALDO: TcxGridColumn
              Caption = 'Saldo mov.'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              OnGetDisplayText = tvPartDAREGetDisplayText
              GroupSummaryAlignment = taRightJustify
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvAnotherContent1Bold
              VisibleForCustomization = False
              Width = 120
            end
            object tvPartAltroBANCA: TcxGridColumn
              Caption = 'Banca'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAltroNOTE: TcxGridColumn
              Caption = 'Note'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 250
            end
            object tvPartAltroDOCTIPO: TcxGridColumn
              Caption = 'Tipo doc.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartAltroDOCNUM: TcxGridColumn
              Caption = 'N'#176' doc.'
              DataBinding.ValueType = 'LargeInt'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartAltroDOCREG: TcxGridColumn
              Caption = 'Reg.'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartAltroDOCDATA: TcxGridColumn
              Caption = 'Data doc.'
              DataBinding.ValueType = 'DateTime'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
            end
            object tvPartAltroTIPO1: TcxGridColumn
              Caption = 'Tipo 1'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroTIPO2: TcxGridColumn
              Caption = 'Tipo 2'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroTIPO3: TcxGridColumn
              Caption = 'Tipo 3'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroTIPO4: TcxGridColumn
              Caption = 'Tipo 4'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroTIPO5: TcxGridColumn
              Caption = 'Tipo 5'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroTIPO6: TcxGridColumn
              Caption = 'Tipo 6'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvPartAltroSOGGETTO: TcxGridColumn
              Caption = 'Soggetto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 150
            end
            object tvPartAltroRIFPRATICA: TcxGridColumn
              Caption = 'Cantiere/Impianto'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvPartAltroAGENTE: TcxGridColumn
              Caption = 'Agente1'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAltroAGENTE2: TcxGridColumn
              Caption = 'Agente2'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAltroAGENTE3: TcxGridColumn
              Caption = 'Agente3'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAltroAGENTE4: TcxGridColumn
              Caption = 'Agente4'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvPartAltroSTATODESCRIZIONE: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvPartAltroSTATOBACKGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvPartAltroSTATOFOREGROUND: TcxGridColumn
              Caption = 'Stato'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
          end
          object lvPartAltro: TcxGridLevel
            GridView = tvPartAltro
          end
        end
        object Panel36: TPanel
          Left = 629
          Top = 48
          Width = 28
          Height = 14
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 16037544
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object SpeedButton59: TSpeedButton
            Left = 1
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
              00001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000
              FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = SpeedButton59Click
          end
          object PartAltroExpandButton: TSpeedButton
            Left = 16
            Top = 1
            Width = 11
            Height = 11
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              36010000424D6A01000000000000B60000002800000009000000090000000100
              100003000000B400000000000000000000001000000000000000007C0000E003
              00001F0000000000000000008000008000000080800080000000800080008080
              0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
              0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
              FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F1000
              00001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7F000000000000
              00000000FF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000
              FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
              FF7F100000001F7C10001000100010001000100010001F7C0000}
            OnClick = PartAltroExpandButtonClick
          end
        end
        object Panel37: TPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            685
            35)
          object Label67: TLabel
            Left = 323
            Top = 14
            Width = 51
            Height = 15
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = '  Riporti'
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
          end
          object Label68: TLabel
            Left = 384
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label71: TLabel
            Left = 476
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label73: TLabel
            Left = 588
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object RiportoPartAltroDare: TcxCurrencyEdit
            Left = 382
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object RiportoPartAltroAvere: TcxCurrencyEdit
            Left = 474
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object RiportoPartAltroSaldo: TcxCurrencyEdit
            Left = 587
            Top = 13
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object RiportoPartAltroSegno: TcxTextEdit
            Left = 572
            Top = 13
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Height = 18
            Width = 18
          end
        end
        object Panel38: TPanel
          Left = 0
          Top = 312
          Width = 685
          Height = 55
          Align = alBottom
          BevelOuter = bvNone
          Color = 15329769
          ParentBackground = False
          TabOrder = 4
          DesignSize = (
            685
            55)
          object Label74: TLabel
            Left = 269
            Top = 36
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Label75: TLabel
            Left = 385
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Dare'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label82: TLabel
            Left = 477
            Top = 2
            Width = 86
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Avere'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Label95: TLabel
            Left = 589
            Top = 2
            Width = 88
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Saldo'
            Color = 8963327
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object Shape4: TShape
            Left = 0
            Top = 0
            Width = 685
            Height = 1
            Align = alTop
            Brush.Style = bsClear
          end
          object Label123: TLabel
            Left = 269
            Top = 15
            Width = 97
            Height = 14
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Totali del periodo'
            Color = 15329769
            Font.Charset = ANSI_CHARSET
            Font.Color = 5131854
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object Panel39: TPanel
            Left = 0
            Top = 1
            Width = 249
            Height = 54
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 8
            Visible = False
            object Label124: TLabel
              Left = 6
              Top = 35
              Width = 112
              Height = 12
              Caption = 'Importo fido concesso'
              Color = 8963327
              Font.Charset = ANSI_CHARSET
              Font.Color = 5131854
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object cxCurrencyEdit14: TcxCurrencyEdit
              Left = 129
              Top = 32
              TabStop = False
              AutoSize = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DisplayFormat = #8364' ,0.00;'#8364' -,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 18
              Width = 70
            end
          end
          object TotPartAltroDare: TcxCurrencyEdit
            Left = 383
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 18
            Width = 90
          end
          object TotPartAltroAvere: TcxCurrencyEdit
            Left = 475
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 18
            Width = 90
          end
          object TotPartAltroSaldo: TcxCurrencyEdit
            Left = 588
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Height = 18
            Width = 90
          end
          object TotPartAltroPerDare: TcxCurrencyEdit
            Left = 383
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 18
            Width = 90
          end
          object TotPartAltroPerAvere: TcxCurrencyEdit
            Left = 475
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderStyle = ebsNone
            Style.Color = 16250871
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 4
            Height = 18
            Width = 90
          end
          object TotPartAltroPerSaldo: TcxCurrencyEdit
            Left = 588
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Height = 18
            Width = 90
          end
          object TotPartAltroSegno: TcxTextEdit
            Left = 573
            Top = 34
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Height = 18
            Width = 18
          end
          object TotPartAltroPerSegno: TcxTextEdit
            Left = 573
            Top = 14
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Style.BorderColor = 8963327
            Style.BorderStyle = ebsSingle
            Style.Color = 13822463
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = [fsBold]
            Style.HotTrack = False
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.BorderColor = 8963327
            StyleDisabled.Color = 8963327
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Height = 18
            Width = 18
          end
        end
      end
    end
  end
  object MenuGrids: TPopupMenu
    OnPopup = MenuGridsPopup
    Left = 127
    Top = 200
    object Selezionavista1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Seleziona vista'
      OnClick = Selezionavista1Click
    end
    object Salvaimpostazionicolonne1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Salva la vista attuale'
      OnClick = Salvaimpostazionicolonne1Click
    end
    object Ripristinacolonneeliminate1: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Ripristina colonne eliminate'
      OnClick = Ripristinacolonneeliminate1Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object Esportainformatotesto1: TMenuItem
      Caption = 'Esporta in formato testo'
      OnClick = Esportainformatotesto1Click
    end
    object EsportainformatoExcel1: TMenuItem
      Caption = 'Esporta in formato Excel'
      OnClick = EsportainformatoExcel1Click
    end
  end
end
