inherited PuzzleToolsForm: TPuzzleToolsForm
  Left = 23
  Top = 106
  Caption = 'PuzzleToolsForm'
  ClientHeight = 656
  ClientWidth = 269
  Enabled = False
  OldCreateOrder = True
  OnResize = FormResize
  ExplicitWidth = 269
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited Sfondo: TPanel
    Ctl3D = False
    ParentCtl3D = False
    object cxPageControl1: TcxPageControl
      Left = 8
      Top = 8
      Width = 201
      Height = 529
      Cursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = TabDatiApparecchi
      Properties.CustomButtons.Buttons = <>
      Properties.ShowFrame = True
      Properties.Style = 8
      Properties.TabPosition = tpLeft
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabSlants.Positions = [spLeft, spRight]
      LookAndFeel.NativeStyle = False
      OnChange = cxPageControl1Change
      ClientRectBottom = 528
      ClientRectLeft = 26
      ClientRectRight = 200
      ClientRectTop = 1
      object TabMaterialiApparecchi: TcxTabSheet
        Caption = ' Materiali/Apparecchi '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ImageIndex = 0
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object NavBarMateriali: TdxNavBar
          Left = 0
          Top = 0
          Width = 174
          Height = 527
          Align = alClient
          ActiveGroupIndex = -1
          TabOrder = 0
          View = 13
          OptionsBehavior.Common.AllowSelectLinks = True
          OptionsImage.LargeImages = ImageListPerDimensionare
          OptionsImage.SmallImages = ImageListPerDimensionare
          OptionsStyle.DefaultStyles.GroupHeader.BackColor = clNone
          OptionsStyle.DefaultStyles.GroupHeader.BackColor2 = clNone
          OptionsStyle.DefaultStyles.GroupHeader.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.GroupHeader.Font.Color = clWindowText
          OptionsStyle.DefaultStyles.GroupHeader.Font.Height = -9
          OptionsStyle.DefaultStyles.GroupHeader.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.GroupHeader.Font.Style = [fsBold]
          OptionsStyle.DefaultStyles.GroupHeader.AssignedValues = [savFont]
          OptionsStyle.DefaultStyles.Item.BackColor = clWhite
          OptionsStyle.DefaultStyles.Item.BackColor2 = clWhite
          OptionsStyle.DefaultStyles.Item.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.Item.Font.Color = clWindowText
          OptionsStyle.DefaultStyles.Item.Font.Height = -9
          OptionsStyle.DefaultStyles.Item.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.Item.Font.Style = []
          OptionsStyle.DefaultStyles.Item.AssignedValues = [savFont]
          OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor2 = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Color = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Height = -11
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Style = [fsBold]
          OptionsStyle.DefaultStyles.NavigationPaneHeader.AssignedValues = [savFont]
          OnLinkClick = NavBarMaterialiLinkClick
        end
      end
      object TabMuri: TcxTabSheet
        Caption = ' Muri e altro'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object NavBarMuri: TdxNavBar
          Left = 0
          Top = 0
          Width = 174
          Height = 527
          Align = alClient
          ActiveGroupIndex = -1
          TabOrder = 0
          View = 13
          OptionsBehavior.Common.AllowSelectLinks = True
          OptionsImage.LargeImages = ImageListPerDimensionare
          OptionsImage.SmallImages = ImageListPerDimensionare
          OptionsStyle.DefaultStyles.GroupHeader.BackColor = clNone
          OptionsStyle.DefaultStyles.GroupHeader.BackColor2 = clNone
          OptionsStyle.DefaultStyles.GroupHeader.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.GroupHeader.Font.Color = clWindowText
          OptionsStyle.DefaultStyles.GroupHeader.Font.Height = -9
          OptionsStyle.DefaultStyles.GroupHeader.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.GroupHeader.Font.Style = [fsBold]
          OptionsStyle.DefaultStyles.GroupHeader.AssignedValues = [savFont]
          OptionsStyle.DefaultStyles.Item.BackColor = clWhite
          OptionsStyle.DefaultStyles.Item.BackColor2 = clWhite
          OptionsStyle.DefaultStyles.Item.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.Item.Font.Color = clWindowText
          OptionsStyle.DefaultStyles.Item.Font.Height = -9
          OptionsStyle.DefaultStyles.Item.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.Item.Font.Style = []
          OptionsStyle.DefaultStyles.Item.AssignedValues = [savFont]
          OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.BackColor2 = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Charset = ANSI_CHARSET
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Color = clNone
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Height = -11
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Name = 'Verdana'
          OptionsStyle.DefaultStyles.NavigationPaneHeader.Font.Style = [fsBold]
          OptionsStyle.DefaultStyles.NavigationPaneHeader.AssignedValues = [savFont]
          OnLinkClick = NavBarMaterialiLinkClick
        end
      end
      object TabDatiMateriali: TcxTabSheet
        Caption = 'New Materiali'
        ImageIndex = 2
        TabVisible = False
        DesignSize = (
          174
          527)
        object cxLabel26: TcxLabel
          Left = 5
          Top = 10
          Caption = 'Rif.'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel27: TcxLabel
          Left = 5
          Top = 58
          Caption = 'Ubicazione'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel28: TcxLabel
          Left = 5
          Top = 106
          Caption = 'Componente'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel29: TcxLabel
          Left = 5
          Top = 154
          Caption = 'Materiale'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel30: TcxLabel
          Left = 5
          Top = 202
          Caption = 'Quantit'#224' n'#176
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel31: TcxLabel
          Left = 5
          Top = 250
          Caption = 'Diametro mm'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel32: TcxLabel
          Left = 5
          Top = 298
          Caption = 'Lunghezza m'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel33: TcxLabel
          Left = 5
          Top = 346
          Caption = 'Installazione'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel34: TcxLabel
          Left = 5
          Top = 394
          Caption = 'Certificazione'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel35: TcxLabel
          Left = 7
          Top = 406
          AutoSize = False
          Caption = 
            'Attestati / marchi / certificati di prova (obblig. per materiali' +
            ' non previsti dalla norma inst.)'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.StyleController = LabelStyleController
          Style.TextStyle = []
          Style.IsFontAssigned = True
          Properties.WordWrap = True
          Transparent = True
          Height = 42
          Width = 164
        end
        object Mat_Riferimento: TcxTextEdit
          Left = 4
          Top = 24
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ReadOnly = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 10
          Text = 'Mat_Riferimento'
          Width = 167
        end
        object Mat_Ubicazione: TcxComboBox
          Left = 4
          Top = 72
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_UbicazionePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 11
          Text = 'Mat_Ubicazione'
          Width = 167
        end
        object Mat_Componente: TcxComboBox
          Left = 4
          Top = 120
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_ComponentePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 12
          Text = 'Mat_Componente'
          Width = 167
        end
        object Mat_Materiale: TcxComboBox
          Left = 4
          Top = 168
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_MaterialePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 13
          Text = 'Mat_Materiale'
          Width = 167
        end
        object Mat_Diametro: TcxComboBox
          Left = 4
          Top = 264
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_DiametroPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 15
          Text = 'Mat_Diametro'
          Width = 167
        end
        object Mat_Installazione: TcxComboBox
          Left = 4
          Top = 360
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_InstallazionePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 17
          Text = 'Mat_Installazione'
          Width = 167
        end
        object Mat_Certificazione: TcxComboBox
          Left = 4
          Top = 445
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = Mat_CertificazionePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 18
          Text = 'Mat_Certificazione'
          Width = 167
        end
        object Mat_Qta: TcxCurrencyEdit
          Left = 4
          Top = 216
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.AssignedValues.DisplayFormat = True
          Properties.DecimalPlaces = 4
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          TabOrder = 14
          Width = 167
        end
        object Mat_Lunghezza: TcxCurrencyEdit
          Left = 4
          Top = 312
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DecimalPlaces = 6
          Properties.DisplayFormat = '0.######;-0.######'
          Properties.OnEditValueChanged = Mat_UbicazionePropertiesEditValueChanged
          Style.HotTrack = False
          Style.StyleController = EditStyleController
          TabOrder = 16
          Width = 167
        end
      end
      object TabDatiApparecchi: TcxTabSheet
        Caption = 'New Apparecchi'
        ImageIndex = 3
        TabVisible = False
        DesignSize = (
          174
          527)
        object cxLabel36: TcxLabel
          Left = 5
          Top = 58
          Caption = 'Ubicazione'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel37: TcxLabel
          Left = 5
          Top = 106
          Caption = 'Apparecchiatura'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel38: TcxLabel
          Left = 5
          Top = 202
          Caption = 'Modello/Marca'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel39: TcxLabel
          Left = 5
          Top = 250
          Caption = 'Portata termica KW'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel40: TcxLabel
          Left = 5
          Top = 298
          Caption = 'Tipo di collegamento'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel41: TcxLabel
          Left = 5
          Top = 346
          Caption = 'Installato/Preesist./Installabile'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel42: TcxLabel
          Left = 5
          Top = 394
          Caption = 'Ventilazione cm2'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel43: TcxLabel
          Left = 5
          Top = 442
          Caption = 'Scarico'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel44: TcxLabel
          Left = 5
          Top = 10
          Caption = 'Rif.'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object App_Riferimento: TcxTextEdit
          Left = 4
          Top = 24
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 9
          Text = 'App_Riferimento'
          Width = 167
        end
        object App_Ubicazione: TcxComboBox
          Left = 4
          Top = 72
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_UbicazionePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 10
          Text = 'App_Ubicazione'
          Width = 167
        end
        object App_Componente: TcxComboBox
          Left = 4
          Top = 120
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_ComponentePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 12
          Text = 'App_Componente'
          Width = 167
        end
        object cxLabel45: TcxLabel
          Left = 5
          Top = 154
          Caption = 'Tipo'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object App_Tipo: TcxComboBox
          Left = 4
          Top = 168
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_TipoPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 13
          Text = 'App_Tipo'
          Width = 167
        end
        object App_Modello: TcxComboBox
          Left = 4
          Top = 216
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_ModelloPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 14
          Text = 'App_Modello'
          Width = 167
        end
        object App_TipoCollegamento: TcxComboBox
          Left = 4
          Top = 312
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_TipoCollegamentoPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 16
          Text = 'App_TipoCollegamento'
          Width = 167
        end
        object App_Installato: TcxComboBox
          Left = 4
          Top = 360
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_InstallatoPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 17
          Text = 'App_Installato'
          Width = 167
        end
        object App_Ventilazione: TcxComboBox
          Left = 4
          Top = 408
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_VentilazionePropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 18
          Text = 'App_Ventilazione'
          Width = 167
        end
        object App_Scarico: TcxComboBox
          Left = 4
          Top = 456
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_ScaricoPropertiesInitPopup
          Style.BorderStyle = ebsNone
          Style.Color = 16768477
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 19
          Text = 'App_Scarico'
          Width = 167
        end
        object App_Portata: TcxCurrencyEdit
          Left = 4
          Top = 264
          RepositoryItem = DM1.EdPropQta
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DecimalPlaces = 6
          Properties.DisplayFormat = '0.######;-0.######'
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = EditStyleController
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 15
          Width = 167
        end
      end
    end
  end
  object Q: TIB_Cursor [1]
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      
        'SELECT DESCRIZIONE, CATEGORIA, MATERIALEAPPARECCHIO, TIPO, BITMA' +
        'PFILENAME, BITMAPFILENAME2, RIFLETTER'
      'FROM APPARECCHI'
      
        'WHERE (MATERIALEAPPARECCHIO = '#39'M'#39' OR MATERIALEAPPARECCHIO  = '#39'A'#39 +
        ')'
      'AND SEZIONE = :P_SEZIONE'
      'ORDER BY CATEGORIA, DESCRIZIONE')
    Left = 72
    Top = 8
  end
  object QMuri: TIB_Cursor [2]
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      
        'SELECT DESCRIZIONE, CATEGORIA, MATERIALEAPPARECCHIO, TIPO, BITMA' +
        'PFILENAME, BITMAPFILENAME2, RIFLETTER'
      'FROM APPARECCHI'
      'WHERE MATERIALEAPPARECCHIO = '#39'W'#39
      'AND SEZIONE = :P_SEZIONE'
      'ORDER BY CATEGORIA, DESCRIZIONE')
    Left = 104
    Top = 8
  end
  inherited LabelStyleController: TcxEditStyleController
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Height = -9
    Style.Font.Name = 'Verdana'
    Style.TextColor = clNavy
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Left = 8
    PixelsPerInch = 96
  end
  inherited EditStyleController: TcxEditStyleController
    Style.Color = 16768477
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Height = -9
    Style.LookAndFeel.Kind = lfOffice11
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.Kind = lfOffice11
    Left = 40
    PixelsPerInch = 96
  end
  object QMatApp: TIB_Cursor
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      
        'SELECT DESCRIZIONE, CATEGORIA, MATERIALEAPPARECCHIO, TIPO, BITMA' +
        'PFILENAME, BITMAPFILENAME2, RIFLETTER'
      'FROM APPARECCHI'
      'WHERE DESCRIZIONE = :P_DESCRIZIONE'
      'AND SEZIONE = :P_SEZIONE'
      'ORDER BY CATEGORIA, DESCRIZIONE')
    Left = 136
    Top = 8
  end
  object ImageListPerDimensionare: TImageList
    Height = 10
    Width = 10
    Left = 208
    Top = 8
  end
end
