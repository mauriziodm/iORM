inherited ModelPannelliWizardForm: TModelPannelliWizardForm
  Caption = 'ModelPannelliWizardForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
  end
  inherited ClientArea: TScrollBox
    object PanelSicurezza: TPanel
      Left = 0
      Top = 398
      Width = 686
      Height = 188
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
      object RichEditSicurezza: TRichEdit
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
          
            'Prima di continuare l'#39'operazione '#232' consigliabile effettuare una ' +
            'copia di sicurezza dei dati '
          'dell'#39'azienda.'
          
            'Cliccare su "Copia di sicurezza" per effettuare la copia, altrim' +
            'enti su "Continua senza copia '
          'di sicurezza" per continuare ignorando il consiglio.')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Panel13: TPanel
        Left = 484
        Top = 163
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
      object Panel14: TPanel
        Left = 4
        Top = 163
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
          OnClick = AvantiGruppo1Click
        end
      end
    end
    object PanelGruppo1: TPanel
      Left = 0
      Top = 6
      Width = 686
      Height = 109
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object LabelGruppo1: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 107
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
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
      object TitoloGruppo1: TRichEdit
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
          'Titolo')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 607
        Top = 85
        Width = 72
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        TabOrder = 0
        object AvantiGruppo1: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiGruppo1Click
        end
      end
    end
  end
end
