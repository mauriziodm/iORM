inherited PuzzleToolsTermoForm: TPuzzleToolsTermoForm
  Left = 851
  Caption = 'PuzzleToolsTermoForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Sfondo: TPanel
    inherited cxPageControl1: TcxPageControl
      Properties.ActivePage = TabMaterialiApparecchi
      inherited TabMaterialiApparecchi: TcxTabSheet
        ExplicitLeft = 26
        ExplicitTop = 1
        ExplicitWidth = 174
        ExplicitHeight = 527
      end
      inherited TabMuri: TcxTabSheet
        ExplicitLeft = 26
        ExplicitTop = 1
        ExplicitWidth = 174
        ExplicitHeight = 527
      end
      inherited TabDatiMateriali: TcxTabSheet
        inherited cxLabel35: TcxLabel
          Style.IsFontAssigned = True
        end
        inherited Mat_Riferimento: TcxTextEdit
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Ubicazione: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Componente: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Materiale: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Diametro: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Installazione: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Certificazione: TcxComboBox
          Style.IsFontAssigned = True
          ExplicitHeight = 20
        end
        inherited Mat_Qta: TcxCurrencyEdit
          ExplicitHeight = 20
        end
        inherited Mat_Lunghezza: TcxCurrencyEdit
          ExplicitHeight = 20
        end
      end
      inherited TabDatiApparecchi: TcxTabSheet
        inherited cxLabel36: TcxLabel
          Top = 48
          ExplicitTop = 48
        end
        inherited cxLabel37: TcxLabel
          Top = 86
          ExplicitTop = 86
        end
        inherited cxLabel38: TcxLabel
          Top = 162
          ExplicitTop = 162
        end
        inherited cxLabel39: TcxLabel
          Top = 200
          ExplicitTop = 200
        end
        inherited cxLabel40: TcxLabel
          Top = 238
          ExplicitTop = 238
        end
        inherited cxLabel41: TcxLabel
          Top = 276
          ExplicitTop = 276
        end
        inherited cxLabel42: TcxLabel
          Left = 149
          Visible = False
          ExplicitLeft = 149
        end
        inherited cxLabel43: TcxLabel
          Left = 149
          Visible = False
          ExplicitLeft = 149
        end
        inherited App_Riferimento: TcxTextEdit
          Style.IsFontAssigned = True
        end
        inherited App_Ubicazione: TcxComboBox
          Top = 62
          Style.IsFontAssigned = True
          TabOrder = 11
          ExplicitTop = 62
        end
        inherited App_Componente: TcxComboBox
          Top = 100
          Style.IsFontAssigned = True
          ExplicitTop = 100
        end
        object cxLabel46: TcxLabel [12]
          Left = 5
          Top = 316
          Caption = 'N'#176' elementi'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel47: TcxLabel [13]
          Left = 5
          Top = 354
          Caption = 'N'#176' colonne'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel48: TcxLabel [14]
          Left = 5
          Top = 392
          Caption = 'Interasse'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel49: TcxLabel [15]
          Left = 5
          Top = 430
          Caption = 'Superficie di scambio'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel50: TcxLabel [16]
          Left = 5
          Top = 468
          Caption = 'N'#176' liveli temperatura'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object App_NumElementi: TcxComboBox [17]
          Left = 4
          Top = 330
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_NumElementiPropertiesInitPopup
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
          Text = 'App_NumElementi'
          OnKeyPress = App_NumLivelliTempKeyPress
          Width = 167
        end
        object App_NumColonne: TcxComboBox [18]
          Left = 4
          Top = 368
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_NumColonnePropertiesInitPopup
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
          Text = 'App_NumColonne'
          OnKeyPress = App_NumLivelliTempKeyPress
          Width = 167
        end
        inherited cxLabel45: TcxLabel
          Top = 124
          ExplicitTop = 124
        end
        inherited App_Tipo: TcxComboBox
          Top = 138
          Style.IsFontAssigned = True
          ExplicitTop = 138
        end
        inherited App_Modello: TcxComboBox
          Top = 176
          Style.IsFontAssigned = True
          ExplicitTop = 176
        end
        inherited App_TipoCollegamento: TcxComboBox
          Top = 252
          Style.IsFontAssigned = True
          ExplicitTop = 252
        end
        inherited App_Installato: TcxComboBox
          Top = 290
          Style.IsFontAssigned = True
          ExplicitTop = 290
        end
        object App_NumLivelliTemp: TcxComboBox [24]
          Left = 4
          Top = 482
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Sorted = True
          Properties.OnEditValueChanged = App_UbicazionePropertiesEditValueChanged
          Properties.OnInitPopup = App_NumLivelliTempPropertiesInitPopup
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
          TabOrder = 22
          Text = 'App_NumLivelliTemp'
          OnKeyPress = App_NumLivelliTempKeyPress
          Width = 167
        end
        inherited App_Ventilazione: TcxComboBox
          Left = 148
          Properties.OnEditValueChanged = nil
          Properties.OnInitPopup = nil
          Style.IsFontAssigned = True
          TabOrder = 23
          Visible = False
          ExplicitLeft = 148
        end
        inherited App_Scarico: TcxComboBox
          Left = 148
          Properties.OnEditValueChanged = nil
          Properties.OnInitPopup = nil
          Style.IsFontAssigned = True
          TabOrder = 29
          Visible = False
          ExplicitLeft = 148
        end
        inherited App_Portata: TcxCurrencyEdit
          Top = 214
          RepositoryItem = nil
          ExplicitTop = 214
        end
        object App_Interasse: TcxCurrencyEdit
          Left = 4
          Top = 406
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
          TabOrder = 20
          Width = 167
        end
        object App_SuperficieScambio: TcxCurrencyEdit
          Left = 4
          Top = 444
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
          TabOrder = 21
          Width = 167
        end
      end
    end
  end
  inherited LabelStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
end
