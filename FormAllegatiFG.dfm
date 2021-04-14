inherited AllegatiFGForm: TAllegatiFGForm
  Left = 24
  Top = 123
  AutoSize = True
  Caption = 'Allegato F o G'
  ClientHeight = 742
  ClientWidth = 1225
  ExplicitWidth = 1225
  ExplicitHeight = 742
  PixelsPerInch = 96
  TextHeight = 13
  object Label33: TLabel [0]
    Left = 6
    Top = 17
    Width = 101
    Height = 12
    Caption = 'Generatore di calore'
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedModifica: TSpeedButton
      Enabled = True
      OnClick = RxSpeedModificaClick
    end
    inherited RxSpeedButtonStampa: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonStampaClick
      OnMouseUp = RxSpeedButtonStampaMouseUp
    end
    object Button1: TButton
      Left = 32
      Top = 40
      Width = 75
      Height = 17
      Caption = 'Designer'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  inherited ClientArea: TScrollBox
    Left = 1
    Top = 59
    Height = 683
    HorzScrollBar.Range = 661
    VertScrollBar.Range = 6000
    AutoScroll = False
    ExplicitLeft = 1
    ExplicitTop = 59
    ExplicitHeight = 683
    object Panel_G_UbicazioneImpianto: TPanel
      Left = 1
      Top = 98
      Width = 661
      Height = 73
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      object Label267: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' UBICAZIONE DELL'#39'IMPIANTO'
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
      object Label268: TLabel
        Left = 6
        Top = 36
        Width = 47
        Height = 14
        AutoSize = False
        Caption = 'Comune'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label269: TLabel
        Left = 6
        Top = 54
        Width = 19
        Height = 14
        AutoSize = False
        Caption = 'via'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label271: TLabel
        Left = 384
        Top = 54
        Width = 35
        Height = 14
        AutoSize = False
        Caption = 'piano'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label272: TLabel
        Left = 451
        Top = 54
        Width = 81
        Height = 14
        AutoSize = False
        Caption = 'int.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label275: TLabel
        Left = 255
        Top = 36
        Width = 79
        Height = 14
        AutoSize = False
        Caption = 'Zona/Quartiere'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label276: TLabel
        Left = 316
        Top = 54
        Width = 31
        Height = 14
        AutoSize = False
        Caption = 'scala'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label332: TLabel
        Left = 458
        Top = 36
        Width = 47
        Height = 14
        AutoSize = False
        Caption = 'CAP'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label333: TLabel
        Left = 553
        Top = 36
        Width = 47
        Height = 14
        AutoSize = False
        Caption = 'Prov.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label334: TLabel
        Left = 255
        Top = 54
        Width = 47
        Height = 14
        AutoSize = False
        Caption = 'n'#176
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape29: TShape
        Left = 632
        Top = 11
        Width = 1
        Height = 69
        Pen.Color = clWhite
      end
      object Label335: TLabel
        Left = 506
        Top = 54
        Width = 34
        Height = 12
        Caption = 'palazz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label167: TLabel
        Left = 6
        Top = 18
        Width = 120
        Height = 14
        AutoSize = False
        Caption = 'Codice/Targa impianto'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label168: TLabel
        Left = 382
        Top = 18
        Width = 178
        Height = 14
        AutoSize = False
        Caption = 'Potenza termica nominale tot. max'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label169: TLabel
        Left = 608
        Top = 18
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dbeComuneImm: TcxDBButtonEdit
        Left = 53
        Top = 33
        AutoSize = False
        DataBinding.DataField = 'COMUNEIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              424DE6010000000000003600000028000000090000000C000000010020000000
              000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
              FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
              FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
              EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
              29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
              CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
              29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
              29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
              CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
              29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
              EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
              EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
              EFFFFFFFFF00}
            Kind = bkGlyph
          end>
        Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.ButtonTransparency = ebtAlways
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 200
      end
      object dbeZonaImm: TcxDBComboBox
        Left = 335
        Top = 33
        AutoSize = False
        DataBinding.DataField = 'ZONAIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.OnInitPopup = dbeZonaImmPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 115
      end
      object dbeCapImm: TcxDBButtonEdit
        Left = 484
        Top = 33
        AutoSize = False
        DataBinding.DataField = 'CAPIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              424DE6010000000000003600000028000000090000000C000000010020000000
              000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
              FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
              FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
              EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
              29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
              CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
              29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
              29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
              CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
              29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
              EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
              EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
              EFFFFFFFFF00}
            Kind = bkGlyph
          end>
        Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtAlways
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 60
      end
      object dbeProvinciaImm: TcxDBButtonEdit
        Left = 581
        Top = 33
        AutoSize = False
        DataBinding.DataField = 'PROVINCIAIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              424DE6010000000000003600000028000000090000000C000000010020000000
              000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
              FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
              FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
              EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
              29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
              CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
              29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
              29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
              CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
              29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
              EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
              EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
              EFFFFFFFFF00}
            Kind = bkGlyph
          end>
        Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtAlways
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 50
      end
      object dbeIndirizzoImm: TcxDBButtonEdit
        Left = 53
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'INDIRIZZOIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              424DE6010000000000003600000028000000090000000C000000010020000000
              000000000000C40E0000C40E00000000000000000000FFFFFF00FFFFFF00FFFF
              FF00E7EBE7FF292829FFE7EBE7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00737973FF292829FF737973FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B5B2B5FF292829FFD6CBCEFF292829FFB5B2B5FFFFFFFF00FFFF
              FF00FFFFFF00EFEBEFFF5A695AFF949294FFD6CBCEFF949294FF5A695AFFEFEB
              EFFFFFFFFF00F7F7F7FF8C9E8CFF292829FFD6CBCEFFD6CBCEFFD6CBCEFF2928
              29FF8C9E8CFFF7F7F7FFD6D7D6FF292829FFD6CBCEFFD6CBCEFFD6CBCEFFD6CB
              CEFFD6CBCEFF292829FFD6D7D6FF292829FFD6CBCEFFD6CBCEFF949294FF2928
              29FF949294FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CBCEFF2928
              29FF292829FF292829FFD6CBCEFFD6CBCEFF292829FF292829FFD6CBCEFFD6CB
              CEFF949294FF292829FF949294FFD6CBCEFFD6CBCEFF292829FFBDCFBDFF2928
              29FFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFFD6CBCEFF292829FFB5BEB5FFEFF3
              EFFF73A273FF292829FFD6CBCEFFD6CBCEFFD6CBCEFF292829FF739E73FFEFF3
              EFFFFFFFFF00EFEFEFFF8CA28CFF292829FF292829FF292829FF8CA28CFFEFEF
              EFFFFFFFFF00}
            Kind = bkGlyph
          end>
        Properties.OnButtonClick = dbeComuneImmPropertiesButtonClick
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtAlways
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 200
      end
      object dbeNumCivicoImm: TcxDBTextEdit
        Left = 270
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'NUMCIVICOIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 45
      end
      object dbeScalaImm: TcxDBTextEdit
        Left = 345
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'SCALAIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 35
      end
      object dbePianoImm: TcxDBTextEdit
        Left = 413
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'PIANOIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 35
      end
      object dbeInternoImm: TcxDBTextEdit
        Left = 468
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'INTERNOIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 35
      end
      object dbeStrCertImageCombo: TcxDBImageComboBox
        Left = 631
        Top = 16
        TabStop = False
        AutoSize = False
        DataBinding.DataField = 'COMPUTED_STR_CERTIFIED_IMM'
        DataBinding.DataSource = SourceAll
        ParentColor = True
        Properties.Images = DM2.StrCertifiedPanelImages
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.Items = <
          item
          end
          item
            ImageIndex = 1
            Value = 'F'
          end
          item
            ImageIndex = 0
            Value = 'T'
          end>
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.ButtonStyle = btsUltraFlat
        Style.ButtonTransparency = ebtHideInactive
        TabOrder = 12
        Height = 33
        Width = 30
      end
      object dbePalazzinaImm: TcxDBTextEdit
        Left = 540
        Top = 51
        AutoSize = False
        DataBinding.DataField = 'PALAZZOIMM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 11
        Height = 18
        Width = 91
      end
      object dbeCodiceCatasto: TcxDBTextEdit
        Left = 125
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'CODICECATASTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 250
      end
      object dbePotenzaNominale: TcxDBTextEdit
        Left = 557
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'POTENZANOMINALEMAX'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 50
      end
    end
    object Panel_G_Proprietario: TPanel
      Left = 1
      Top = 2155
      Width = 661
      Height = 57
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      object Label226: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' PROPRIETARIO'
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
      object Label228: TLabel
        Left = 6
        Top = 18
        Width = 76
        Height = 12
        Caption = 'Nome/Rag.soc.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label229: TLabel
        Left = 6
        Top = 36
        Width = 43
        Height = 12
        Caption = 'Indirizzo'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label230: TLabel
        Left = 227
        Top = 36
        Width = 11
        Height = 12
        Caption = 'n'#176
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label234: TLabel
        Left = 503
        Top = 18
        Width = 23
        Height = 12
        Caption = 'CAP'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label235: TLabel
        Left = 294
        Top = 18
        Width = 41
        Height = 12
        Caption = 'Comune'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label236: TLabel
        Left = 575
        Top = 18
        Width = 47
        Height = 12
        Caption = 'Provincia'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label237: TLabel
        Left = 293
        Top = 36
        Width = 18
        Height = 12
        Caption = 'Tel.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label239: TLabel
        Left = 533
        Top = 36
        Width = 19
        Height = 12
        Caption = 'C.F.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object SBProprietario: TSpeedButtonRollOver
        Left = 643
        Top = 1
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
        OnClick = SBProprietarioClick
      end
      object SBEspandiProprietario: TSpeedButtonRollOver
        Left = 626
        Top = 1
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
        OnClick = SBEspandiProprietarioClick
      end
      object DBText3: TDBText
        Left = 580
        Top = 0
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'PROPCODICE'
        DataSource = SourceAll
        DragMode = dmAutomatic
        Font.Charset = ANSI_CHARSET
        Font.Color = 13421772
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label240: TLabel
        Left = 411
        Top = 36
        Width = 23
        Height = 12
        Caption = 'Cell.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dbePropRagSoc: TDBEdit
        Left = 86
        Top = 18
        Width = 200
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPDENOMINAZIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit53: TDBEdit
        Left = 52
        Top = 36
        Width = 170
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPINDIRIZZO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit54: TDBEdit
        Left = 242
        Top = 36
        Width = 44
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPNUMCIVICO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit58: TDBEdit
        Left = 529
        Top = 18
        Width = 40
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPCAP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit59: TDBEdit
        Left = 337
        Top = 18
        Width = 160
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPLOCALITA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit60: TDBEdit
        Left = 626
        Top = 18
        Width = 30
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPPROVINCIA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit61: TDBEdit
        Left = 315
        Top = 36
        Width = 90
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPTELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit63: TDBEdit
        Left = 556
        Top = 36
        Width = 100
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPCODICEFISCALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit64: TDBEdit
        Left = 438
        Top = 36
        Width = 90
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROPCELLULARE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_G_ResponsabileImpianto: TPanel
      Left = 1
      Top = 177
      Width = 661
      Height = 176
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object Label251: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' RESPONSABILE DELL'#39'IMPIANTO'
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
      object Label253: TLabel
        Left = 4
        Top = 84
        Width = 43
        Height = 12
        Caption = 'Indirizzo'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label254: TLabel
        Left = 231
        Top = 84
        Width = 11
        Height = 12
        Caption = 'n'#176
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label261: TLabel
        Left = 524
        Top = 84
        Width = 23
        Height = 12
        Caption = 'CAP'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label262: TLabel
        Left = 297
        Top = 84
        Width = 41
        Height = 12
        Caption = 'Comune'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label263: TLabel
        Left = 596
        Top = 84
        Width = 25
        Height = 12
        Caption = 'Prov.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label264: TLabel
        Left = 4
        Top = 102
        Width = 42
        Height = 12
        Caption = 'Telefono'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label266: TLabel
        Left = 219
        Top = 102
        Width = 23
        Height = 12
        Caption = 'Cell.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBText9: TDBText
        Left = 580
        Top = 0
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'CODICERESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = 13421772
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object SBEspandiRespImp: TSpeedButtonRollOver
        Left = 626
        Top = 1
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
        OnClick = SBEspandiRespImpClick
      end
      object SBRespImp: TSpeedButtonRollOver
        Left = 643
        Top = 1
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
        OnClick = SBRespImpClick
      end
      object LabelRagioneSociale: TLabel
        Left = 133
        Top = 28
        Width = 84
        Height = 14
        AutoSize = False
        Caption = 'Ragione sociale'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelNome: TLabel
        Left = 451
        Top = 37
        Width = 52
        Height = 14
        AutoSize = False
        Caption = 'Nome'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelCognome: TLabel
        Left = 133
        Top = 39
        Width = 108
        Height = 14
        AutoSize = False
        Caption = 'Cognome o Rag.Soc.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelTipoPersona: TLabel
        Left = 3
        Top = 22
        Width = 46
        Height = 26
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo persona'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape101: TShape
        Left = 124
        Top = 35
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Shape102: TShape
        Left = 123
        Top = 16
        Width = 1
        Height = 38
        Pen.Color = clGray
      end
      object Label393: TLabel
        Left = 161
        Top = 55
        Width = 74
        Height = 12
        Caption = 'Codice Fiscale'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label394: TLabel
        Left = 422
        Top = 55
        Width = 58
        Height = 12
        Caption = 'Partita IVA'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object eIndirizzoRespImp: TDBEdit
        Left = 56
        Top = 84
        Width = 170
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'INDIRIZZORESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eNumCivicoRespImp: TDBEdit
        Left = 246
        Top = 84
        Width = 44
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'NUMCIVICORESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eCAPRespImp: TDBEdit
        Left = 550
        Top = 84
        Width = 40
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CAPRESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eCittaRespImp: TDBEdit
        Left = 340
        Top = 84
        Width = 179
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CITTARESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eProvinciaRespImp: TDBEdit
        Left = 625
        Top = 84
        Width = 30
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PROVINCIARESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eTelefonoRespImp: TDBEdit
        Left = 56
        Top = 102
        Width = 150
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TELEFONORESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eCellulareRespImp: TDBEdit
        Left = 246
        Top = 102
        Width = 150
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CELLULARERESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DbeInQualitaDi: TcxDBRadioGroup
        Left = 79
        Top = 129
        Cursor = crHandPoint
        Caption = '  in qualit'#224' di   '
        DataBinding.DataField = 'INQUALITADIRESPIMP'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Columns = 4
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Proprietario'
            Value = 'Proprietario'
          end
          item
            Caption = 'Occupante'
            Value = 'Occupante'
          end
          item
            Caption = 'Terzo responsabile'
            Value = 'Terzo responsabile'
          end
          item
            Caption = 'Amministratore'
            Value = 'Amministratore'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 38
        Width = 506
      end
      object dbeNaturaGiuridica: TcxDBRadioGroup
        Left = 48
        Top = 13
        Cursor = crHandPoint
        DataBinding.DataField = 'NATURAGIURIDICARESPIMP'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.DefaultValue = ''
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Fisica'
            Value = 'F'
          end
          item
            Caption = 'Giuridica'
            Value = 'G'
          end>
        Properties.OnChange = dbeNaturaGiuridicaPropertiesChange
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGray
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 41
        Width = 75
      end
      object eRagSocRespImp: TDBEdit
        Left = 242
        Top = 19
        Width = 411
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'RAGSOCRESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eNomeRespImp: TDBEdit
        Left = 485
        Top = 37
        Width = 168
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'NOMERESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = eCognomeRespImpKeyPress
      end
      object eCognomeRespImp: TDBEdit
        Left = 242
        Top = 37
        Width = 201
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'COGNOMERESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = eCognomeRespImpKeyPress
      end
      object eCodiceFiscaleRespImp: TDBEdit
        Left = 242
        Top = 55
        Width = 162
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CODICEFISCALERESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object ePIVARespImp: TDBEdit
        Left = 485
        Top = 55
        Width = 168
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'PARTITAIVARESPIMP'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_G_IdentificazioneImpianto: TPanel
      Left = 1
      Top = 2258
      Width = 661
      Height = 193
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 10
      Visible = False
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' IDENTIFICAZIONE DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object DBText1: TDBText
        Left = 580
        Top = 0
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'GENCAL_ID'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = 13421772
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 6
        Top = 18
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Costruttore'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 198
        Top = 18
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label21: TLabel
        Left = 430
        Top = 18
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label22: TLabel
        Left = 235
        Top = 58
        Width = 120
        Height = 12
        Alignment = taRightJustify
        Caption = 'Pot. nominale utile (KW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label68: TLabel
        Left = 6
        Top = 38
        Width = 89
        Height = 12
        Caption = 'Anno di fabbricaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label69: TLabel
        Left = 180
        Top = 77
        Width = 135
        Height = 12
        Caption = 'Marcatura efficienza energ.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label72: TLabel
        Left = 6
        Top = 143
        Width = 104
        Height = 14
        AutoSize = False
        Caption = 'Fluido termov.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label73: TLabel
        Left = 6
        Top = 58
        Width = 87
        Height = 12
        Caption = 'Locale instazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label44: TLabel
        Left = 378
        Top = 38
        Width = 120
        Height = 12
        Caption = 'Catasto impianti/codice'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label80: TLabel
        Left = 416
        Top = 58
        Width = 170
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pot. nominale focolare (KW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label82: TLabel
        Left = 166
        Top = 38
        Width = 105
        Height = 14
        AutoSize = False
        Caption = 'Data di installazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label180: TLabel
        Left = 421
        Top = 77
        Width = 135
        Height = 12
        Alignment = taRightJustify
        Caption = 'Volumetria riscaldata (m3)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label181: TLabel
        Left = 6
        Top = 77
        Width = 47
        Height = 12
        AutoSize = False
        Caption = 'Tipologia'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label2: TLabel
        Left = 6
        Top = 112
        Width = 20
        Height = 12
        Caption = 'Uso'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape1: TShape
        Left = 35
        Top = 106
        Width = 1
        Height = 28
        Pen.Color = clGray
      end
      object Shape2: TShape
        Left = 35
        Top = 133
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 35
        Top = 105
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 31
        Top = 119
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Label3: TLabel
        Left = 6
        Top = 172
        Width = 45
        Height = 12
        Caption = 'Consumi:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 66
        Top = 172
        Width = 82
        Height = 12
        Caption = 'Stagione attuale'
        Color = clGreen
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
        Left = 212
        Top = 172
        Width = 87
        Height = 12
        Caption = 'Consumi (m3/kg)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 374
        Top = 172
        Width = 72
        Height = 12
        Caption = 'Stagione prec.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 510
        Top = 172
        Width = 87
        Height = 12
        Caption = 'Consumi (m3/kg)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object GenCal_Matricola: TDBEdit
        Left = 481
        Top = 18
        Width = 174
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_PotenzaNominale: TDBEdit
        Left = 359
        Top = 58
        Width = 60
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object GenCal_TipoCamera: TcxDBRadioGroup
        Left = 178
        Top = 97
        Cursor = crHandPoint
        Caption = '  Camera  '
        DataBinding.DataField = 'GENCAL_TIPOCAMERA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Tipo B  (camera aperta)'
            Value = 'Tipo B'
          end
          item
            Caption = 'Tipo C  (camera stagna)'
            Value = 'Tipo C'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 61
        Width = 156
      end
      object GenCal_Tiraggio: TcxDBRadioGroup
        Left = 339
        Top = 97
        Cursor = crHandPoint
        Caption = '  Tiraggio  '
        DataBinding.DataField = 'GENCAL_TIPOTIRAGGIO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Naturale'
            Value = 'Naturale'
          end
          item
            Caption = 'Forzato'
            Value = 'Forzato'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 16
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 61
        Width = 77
      end
      object GenCal_Combustibile: TcxDBRadioGroup
        Left = 421
        Top = 97
        Cursor = crHandPoint
        Caption = '  Combustibile  '
        DataBinding.DataField = 'GENCAL_COMBUSTIBILE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Gas di rete'
            Value = 'Gas di rete'
          end
          item
            Caption = 'GPL'
            Value = 'GPL'
          end
          item
            Caption = 'Gasolio'
            Value = 'Gasolio'
          end
          item
            Caption = 'Kerosene'
            Value = 'Kerosene'
          end
          item
            Caption = 'Olio combustibile'
            Value = 'Olio combustibile'
          end
          item
            Caption = 'Altro'
            Value = 'Altro'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 17
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 61
        Width = 235
      end
      object GenCal_CombustibileAltro: TDBEdit
        Left = 586
        Top = 141
        Width = 67
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_COMBUSTIBILEALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object PanelCostruttore: TPanel
        Left = 69
        Top = 18
        Width = 120
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object GenCal_Costruttore: TDBComboBox
          Left = -2
          Top = -3
          Width = 125
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object PanelModello: TPanel
        Left = 242
        Top = 18
        Width = 180
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object GenCal_Modello: TDBComboBox
          Left = -2
          Top = -3
          Width = 185
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object GenCal_AnnoCostruzione: TDBEdit
        Left = 100
        Top = 38
        Width = 44
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_ANNOCOSTRUZIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object PanelMarcaEfficEnerg: TPanel
        Left = 318
        Top = 77
        Width = 90
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        object GenCal_MarcaEfficienzaEnerg: TDBComboBox
          Left = -2
          Top = -3
          Width = 95
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MARCAEFFICENERGETICA'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_MarcaEfficienzaEnergDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object GenCal_UsoAcquaSanitaria: TcxDBCheckBox
        Left = 39
        Top = 116
        Caption = 'Acqua calda sanitaria'
        DataBinding.DataField = 'GENCAL_ACQUASANITARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object PanelFluidoTermovettore: TPanel
        Left = 79
        Top = 143
        Width = 95
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
        object GenCal_FluidoTermovettore: TDBComboBox
          Left = -2
          Top = -3
          Width = 100
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_FLUIDOTERMOVETTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_FluidoTermovettoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object PanelLocaleInstallazione: TPanel
        Left = 98
        Top = 58
        Width = 109
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        object GenCal_LocaleInstallazione: TDBComboBox
          Left = -2
          Top = -3
          Width = 114
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_UBICAZIONE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_LocaleInstallazioneDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object GenCal_UsoRiscaldamento: TcxDBCheckBox
        Left = 39
        Top = 102
        Caption = 'Riscaldamento'
        DataBinding.DataField = 'GENCAL_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_CodiceCatastoImpianti: TDBEdit
        Left = 502
        Top = 38
        Width = 153
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CODICECATASTO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_PotenzaNominaleFocolare: TDBEdit
        Left = 591
        Top = 57
        Width = 64
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICAFOCOLARE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object GenCal_VolumetriaRiscaldata: TDBEdit
        Left = 561
        Top = 77
        Width = 94
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_VOLUMETRIARISC'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object GenCal_Tipologia: TDBEdit
        Left = 57
        Top = 77
        Width = 118
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_TIPOLOGIA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        Visible = False
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_DataInstallazione: TcxDBDateEdit
        Left = 270
        Top = 36
        AutoSize = False
        DataBinding.DataField = 'GENCAL_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object GenCal_Consumi1_Stagione: TDBEdit
        Left = 152
        Top = 172
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI1_STAGIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_Consumi1_M3KG: TDBEdit
        Left = 302
        Top = 172
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI1_M3KG'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object GenCal_Consumi2_Stagione: TDBEdit
        Left = 450
        Top = 172
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI2_STAGIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object GenCal_Consumi2_M3KG: TDBEdit
        Left = 600
        Top = 172
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI2_M3KG'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 22
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
    end
    object Panel_F_IdentificazioneImpianto: TPanel
      Left = 1
      Top = 2460
      Width = 661
      Height = 284
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 11
      Visible = False
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' IDENTIFICAZIONE DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object DBText2: TDBText
        Left = 580
        Top = 0
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'GENCAL_ID'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = 13421772
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 88
        Top = 18
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Costruttore'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 270
        Top = 18
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 449
        Top = 18
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 6
        Top = 57
        Width = 120
        Height = 12
        Alignment = taRightJustify
        Caption = 'Pot. nominale utile (KW)'
        Color = clGreen
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
        Top = 37
        Width = 89
        Height = 12
        Caption = 'Anno di fabbricaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label14: TLabel
        Left = 6
        Top = 76
        Width = 135
        Height = 12
        Caption = 'Marcatura efficienza energ.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 237
        Top = 76
        Width = 104
        Height = 14
        AutoSize = False
        Caption = 'Fluido termov.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 212
        Top = 197
        Width = 87
        Height = 12
        Caption = 'Locale instazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 376
        Top = 37
        Width = 120
        Height = 12
        Caption = 'Catasto impianti/codice'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 168
        Top = 57
        Width = 170
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pot. nominale focolare (KW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label23: TLabel
        Left = 166
        Top = 37
        Width = 105
        Height = 14
        AutoSize = False
        Caption = 'Data di installazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label24: TLabel
        Left = 177
        Top = 216
        Width = 122
        Height = 12
        Alignment = taRightJustify
        Caption = 'Volumetria riscald. (m3)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label25: TLabel
        Left = 6
        Top = 95
        Width = 47
        Height = 12
        AutoSize = False
        Caption = 'Tipologia'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object Label26: TLabel
        Left = 6
        Top = 205
        Width = 20
        Height = 12
        Caption = 'Uso'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape5: TShape
        Left = 33
        Top = 195
        Width = 1
        Height = 35
        Pen.Color = clGray
      end
      object Shape6: TShape
        Left = 33
        Top = 230
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Shape7: TShape
        Left = 33
        Top = 195
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Shape8: TShape
        Left = 29
        Top = 212
        Width = 5
        Height = 1
        Pen.Color = clGray
      end
      object Label27: TLabel
        Left = 6
        Top = 263
        Width = 123
        Height = 12
        Caption = 'Consumi di combustibile:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 141
        Top = 263
        Width = 44
        Height = 12
        Caption = 'Stagione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 249
        Top = 263
        Width = 87
        Height = 12
        Caption = 'Consumi (m3/kg)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label30: TLabel
        Left = 402
        Top = 263
        Width = 44
        Height = 12
        Caption = 'Stagione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label31: TLabel
        Left = 510
        Top = 263
        Width = 87
        Height = 12
        Caption = 'Consumi (m3/kg)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label32: TLabel
        Left = 6
        Top = 18
        Width = 71
        Height = 12
        Caption = 'Gen. di calore:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label34: TLabel
        Left = 6
        Top = 134
        Width = 76
        Height = 12
        Caption = 'Bruc. abbinato:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label35: TLabel
        Left = 88
        Top = 134
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Costruttore'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label36: TLabel
        Left = 270
        Top = 134
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label37: TLabel
        Left = 449
        Top = 134
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label38: TLabel
        Left = 6
        Top = 153
        Width = 89
        Height = 12
        Caption = 'Anno di fabbricaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label39: TLabel
        Left = 6
        Top = 172
        Width = 99
        Height = 12
        Caption = 'Campo di funz. (kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label40: TLabel
        Left = 364
        Top = 153
        Width = 47
        Height = 12
        AutoSize = False
        Caption = 'Tipologia'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label151: TLabel
        Left = 161
        Top = 153
        Width = 105
        Height = 14
        AutoSize = False
        Caption = 'Data di installazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label153: TLabel
        Left = 172
        Top = 171
        Width = 7
        Height = 16
        Caption = '-'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object F_GenCal_Matricola: TDBEdit
        Left = 500
        Top = 18
        Width = 155
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_PotenzaNominale: TDBEdit
        Left = 130
        Top = 57
        Width = 60
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_GenCal_Tiraggio: TcxDBRadioGroup
        Left = 579
        Top = 53
        Cursor = crHandPoint
        Caption = '  Tiraggio  '
        DataBinding.DataField = 'GENCAL_TIPOTIRAGGIO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Naturale'
            Value = 'Naturale'
          end
          item
            Caption = 'Forzato'
            Value = 'Forzato'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 57
        Width = 77
      end
      object F_GenCal_Combustibile: TcxDBRadioGroup
        Left = 421
        Top = 182
        Cursor = crHandPoint
        Caption = '  Combustibile  '
        DataBinding.DataField = 'GENCAL_COMBUSTIBILE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Gas di rete'
            Value = 'Gas di rete'
          end
          item
            Caption = 'GPL'
            Value = 'GPL'
          end
          item
            Caption = 'Gasolio'
            Value = 'Gasolio'
          end
          item
            Caption = 'Kerosene'
            Value = 'Kerosene'
          end
          item
            Caption = 'Olio combustibile'
            Value = 'Olio combustibile'
          end
          item
            Caption = 'Altro'
            Value = 'Altro'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 25
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 61
        Width = 235
      end
      object F_GenCal_CombustibileAltro: TDBEdit
        Left = 586
        Top = 226
        Width = 67
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_COMBUSTIBILEALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 26
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_PanelCostruttore: TPanel
        Left = 151
        Top = 18
        Width = 110
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object F_GenCal_Costruttore: TDBComboBox
          Left = -2
          Top = -3
          Width = 115
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_PanelModello: TPanel
        Left = 314
        Top = 18
        Width = 127
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object F_GenCal_Modello: TDBComboBox
          Left = -2
          Top = -3
          Width = 132
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_GenCal_AnnoCostruzione: TDBEdit
        Left = 100
        Top = 37
        Width = 44
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_ANNOCOSTRUZIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_PanelMarcaEfficEnerg: TPanel
        Left = 144
        Top = 76
        Width = 80
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
        object F_GenCal_MarcaEfficienzaEnerg: TDBComboBox
          Left = -2
          Top = -3
          Width = 85
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MARCAEFFICENERGETICA'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_MarcaEfficienzaEnergDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_GenCal_UsoAcquaSanitaria: TcxDBCheckBox
        Left = 35
        Top = 212
        Caption = 'Acqua calda sanitaria'
        DataBinding.DataField = 'GENCAL_ACQUASANITARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 22
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_PanelFluidoTermovettore: TPanel
        Left = 312
        Top = 76
        Width = 95
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
        object F_GenCal_FluidoTermovettore: TDBComboBox
          Left = -2
          Top = -3
          Width = 100
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_FLUIDOTERMOVETTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_FluidoTermovettoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_PanelLocaleInstallazione: TPanel
        Left = 304
        Top = 197
        Width = 109
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelModello'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 23
        object F_GenCal_LocaleInstallazione: TDBComboBox
          Left = -2
          Top = -3
          Width = 114
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_UBICAZIONE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_LocaleInstallazioneDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_GenCal_UsoRiscaldamento: TcxDBCheckBox
        Left = 35
        Top = 193
        Caption = 'Riscaldamento'
        DataBinding.DataField = 'GENCAL_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 21
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_CodiceCatastoImpianti: TDBEdit
        Left = 500
        Top = 37
        Width = 155
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CODICECATASTO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_PotenzaNominaleFocolare: TDBEdit
        Left = 343
        Top = 56
        Width = 64
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICAFOCOLARE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_GenCal_VolumetriaRiscaldata: TDBEdit
        Left = 304
        Top = 216
        Width = 94
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_VOLUMETRIARISC'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 24
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_GenCal_Tipologia: TDBEdit
        Left = 57
        Top = 95
        Width = 118
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_TIPOLOGIA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        Visible = False
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_DataInstallazione: TcxDBDateEdit
        Left = 270
        Top = 35
        AutoSize = False
        DataBinding.DataField = 'GENCAL_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object F_GenCal_Consumi1_Stagione: TDBEdit
        Left = 189
        Top = 263
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI1_STAGIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 27
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_Consumi1_M3KG: TDBEdit
        Left = 339
        Top = 263
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI1_M3KG'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 28
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_GenCal_Consumi2_Stagione: TDBEdit
        Left = 450
        Top = 263
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI2_STAGIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 29
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_GenCal_Consumi2_M3KG: TDBEdit
        Left = 600
        Top = 263
        Width = 55
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_CONSUMI2_M3KG'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 30
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_GenCal_TipoCamera: TcxDBRadioGroup
        Left = 421
        Top = 53
        Cursor = crHandPoint
        Caption = '  Camera  '
        DataBinding.DataField = 'GENCAL_TIPOCAMERA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Tipo B  (camera aperta)'
            Value = 'Tipo B'
          end
          item
            Caption = 'Tipo C  (camera stagna)'
            Value = 'Tipo C'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 57
        Width = 153
      end
      object F_Bruc_Matricola: TDBEdit
        Left = 500
        Top = 134
        Width = 155
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BRUC_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_Bruc_PanelCostruttore: TPanel
        Left = 151
        Top = 134
        Width = 110
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
        object F_Bruc_Costruttore: TDBComboBox
          Left = -2
          Top = -3
          Width = 115
          Height = 20
          Color = 16250871
          DataField = 'BRUC_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = F_Bruc_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_Bruc_PanelModello: TPanel
        Left = 314
        Top = 134
        Width = 127
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
        object F_Bruc_Modello: TDBComboBox
          Left = -2
          Top = -3
          Width = 132
          Height = 20
          Color = 16250871
          DataField = 'BRUC_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = F_Bruc_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object F_Bruc_AnnoCostruzione: TDBEdit
        Left = 100
        Top = 153
        Width = 44
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BRUC_ANNOCOSTRUZIONE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_Bruc_CampoFunzionamento: TDBEdit
        Left = 109
        Top = 172
        Width = 60
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BRUC_CAMPOFUNZIONAMENTO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object F_Bruc_Tipologia: TDBEdit
        Left = 415
        Top = 153
        Width = 240
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BRUC_TIPOLOGIA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object F_Bruc_DataInstallazione: TcxDBDateEdit
        Left = 265
        Top = 151
        AutoSize = False
        DataBinding.DataField = 'BRUC_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 17
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 85
      end
      object F_Bruc_CampoFunzionamento2: TDBEdit
        Left = 181
        Top = 172
        Width = 60
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BRUC_CAMPOFUNZIONAMENTO2'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
    end
    object Panel_G_EsameVisivoImpianto: TPanel
      Left = 1
      Top = 2750
      Width = 661
      Height = 402
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 12
      Visible = False
      object Shape14: TShape
        Left = 331
        Top = 309
        Width = 324
        Height = 84
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape13: TShape
        Left = 331
        Top = 20
        Width = 324
        Height = 290
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape12: TShape
        Left = 6
        Top = 266
        Width = 326
        Height = 127
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape11: TShape
        Left = 6
        Top = 161
        Width = 326
        Height = 106
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape10: TShape
        Left = 6
        Top = 90
        Width = 326
        Height = 72
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape9: TShape
        Left = 6
        Top = 20
        Width = 326
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label41: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' ESAME VISIVO DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object Label42: TLabel
        Left = 11
        Top = 24
        Width = 226
        Height = 12
        Caption = 'B - DOCUMENTAZIONE TECNICA DI CORREDO'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label50: TLabel
        Left = 11
        Top = 94
        Width = 258
        Height = 12
        Caption = 'C - ESAME VISIVO DEL LOCALE DI INSTALLAZIONE'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label54: TLabel
        Left = 11
        Top = 165
        Width = 206
        Height = 12
        Caption = 'D - ESAME VISIVO DEI CANALI DA FUMO'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label60: TLabel
        Left = 11
        Top = 270
        Width = 275
        Height = 12
        Caption = 'E - CONTR. EVACUAZ. DEI PRODOTTI DELLA COMBUST.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label47: TLabel
        Left = 336
        Top = 24
        Width = 184
        Height = 12
        Caption = 'F - CONTROLLO DELL'#39'APPARECCHIO'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label85: TLabel
        Left = 336
        Top = 313
        Width = 164
        Height = 12
        Caption = 'G - CONTROLLO DELL'#39'IMPIANTO'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label89: TLabel
        Left = 274
        Top = 24
        Width = 9
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label90: TLabel
        Left = 287
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label91: TLabel
        Left = 301
        Top = 24
        Width = 18
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label92: TLabel
        Left = 609
        Top = 24
        Width = 9
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label93: TLabel
        Left = 622
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label94: TLabel
        Left = 636
        Top = 24
        Width = 18
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label95: TLabel
        Left = 611
        Top = 313
        Width = 7
        Height = 12
        Caption = 'P'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label96: TLabel
        Left = 624
        Top = 313
        Width = 8
        Height = 12
        Caption = 'N'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label97: TLabel
        Left = 635
        Top = 313
        Width = 16
        Height = 12
        Caption = 'NA'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object SBInserimentoFacilitato: TSpeedButton
        Left = 540
        Top = 0
        Width = 120
        Height = 14
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 100
        Caption = 'Inserimento facilitato'
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = SBInserimentoFacilitatoClick
      end
      object Panel2: TPanel
        Left = 7
        Top = 39
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label45: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dichiarazione di conformit'#224' dell'#39'impianto'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeB1: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_DICHCONFIMP'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel3: TPanel
        Left = 7
        Top = 56
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label43: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto d'#39'impianto'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeB2: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRETTOIMPIANTO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel4: TPanel
        Left = 7
        Top = 73
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          324
          17)
        object Label46: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto d'#39'uso e manutenzione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeB3: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOCALD'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel8: TPanel
        Left = 7
        Top = 110
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          324
          17)
        object Label51: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Idoneit'#224' del locale di installazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object Label70: TLabel
          Left = 310
          Top = 2
          Width = 12
          Height = 12
          Anchors = [akTop, akRight]
          Caption = 'ES'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object dbeC1: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_IDONLOCALEINSTALLAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Transparent = True
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel9: TPanel
        Left = 7
        Top = 127
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 4
        DesignSize = (
          324
          17)
        object Label52: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Adeguate dimensioni aperture ventilazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeC2: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ADEGDIMENSVENTILAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel10: TPanel
        Left = 7
        Top = 144
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 5
        DesignSize = (
          324
          17)
        object Label53: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Aperture di ventilazione libere da ostruzioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeC3: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_APERTVENTILAZLIBERE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel11: TPanel
        Left = 7
        Top = 181
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 6
        DesignSize = (
          324
          17)
        object Label55: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Pendenza corretta'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeD1: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'D_PENDENZACORRETTA'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel12: TPanel
        Left = 7
        Top = 198
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 7
        DesignSize = (
          324
          17)
        object Label56: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Sezioni corrette'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeD2: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'D_SEZIONICORRETTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel13: TPanel
        Left = 7
        Top = 215
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 8
        DesignSize = (
          324
          17)
        object Label57: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Curve corrette'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeD3: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'D_CURVECORRETTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel15: TPanel
        Left = 7
        Top = 232
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 9
        DesignSize = (
          324
          17)
        object Label58: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Lunghezza corretta'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeD4: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'D_LUNGHEZZACORRETTA'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel16: TPanel
        Left = 7
        Top = 249
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 10
        DesignSize = (
          324
          17)
        object Label59: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Buono stato di conservazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeD5: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'D_BUONOSTATOCONSERVAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel17: TPanel
        Left = 7
        Top = 285
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 11
        DesignSize = (
          324
          17)
        object Label61: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Scarico in camino singolo'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeE1: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_SCARICOCAMINOSINGOLO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel19: TPanel
        Left = 7
        Top = 302
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 12
        DesignSize = (
          324
          17)
        object Label62: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Scarico in canna fumaria collettiva ramificata'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeE2: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_SCARICOCANNAFUMCOLLRAMIF'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel20: TPanel
        Left = 7
        Top = 319
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 13
        DesignSize = (
          324
          17)
        object Label63: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'L'#39'apparecchio scarica a parete'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeE3: TcxDBRadioGroup
          Left = 258
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_APPSCARICAAPARETE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel21: TPanel
        Left = 7
        Top = 336
        Width = 324
        Height = 28
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 14
        DesignSize = (
          324
          28)
        object Label64: TLabel
          Left = 5
          Top = 14
          Width = 254
          Height = 10
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'non esistono riflussi dei fumi nel locale'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object Label66: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 12
          AutoSize = False
          Caption = 'Per apparecchio a tiraggio naturale:'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object dbeE4: TcxDBRadioGroup
          Left = 258
          Top = -1
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_NORIFLUSSIFUMILOCALE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel22: TPanel
        Left = 7
        Top = 364
        Width = 324
        Height = 28
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 15
        DesignSize = (
          324
          28)
        object Label65: TLabel
          Left = 5
          Top = 14
          Width = 254
          Height = 10
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'assenza di perdite dai condotti di scarico'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object Label67: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 12
          AutoSize = False
          Caption = 'Per apparecchio a tiraggio forzato:'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object dbeE5: TcxDBRadioGroup
          Left = 258
          Top = -1
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_NOPERDITECONDOTTISCARICO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel6: TPanel
        Left = 332
        Top = 67
        Width = 322
        Height = 28
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 17
        DesignSize = (
          322
          28)
        object Label49: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 
            'Dispositivo rompitiraggio-antivento privo di evidenti tracce di ' +
            'deterioramento, ossidazione e/o corrosione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF2: TcxDBRadioGroup
          Left = 268
          Top = -2
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPROMPITIRAGGIONODETERIOR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel7: TPanel
        Left = 332
        Top = 95
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 18
        DesignSize = (
          322
          17)
        object Label71: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Scambiatore lato fumi pulito'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF3: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SCAMBLATOFUMOPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel23: TPanel
        Left = 332
        Top = 112
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 19
        DesignSize = (
          322
          17)
        object Label74: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Accensione e funzionamento regolari'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF4: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ACCENSFUNZAMREGOLARI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel24: TPanel
        Left = 332
        Top = 129
        Width = 322
        Height = 28
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 20
        DesignSize = (
          322
          28)
        object Label75: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dispositivi di comando e regolazione funzionanti correttamente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF5: TcxDBRadioGroup
          Left = 268
          Top = -2
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPCOMANDOREGOLAZFUNZCORR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel25: TPanel
        Left = 332
        Top = 157
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 21
        DesignSize = (
          322
          17)
        object Label76: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Assenza di perdite e ossidazioni dai/sui raccordi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF6: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ASSENZAPERDITEOSSIDAZRACC'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel26: TPanel
        Left = 332
        Top = 174
        Width = 322
        Height = 28
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 22
        DesignSize = (
          322
          28)
        object Label77: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Valvola di sicurezza contro la sovrapressione a scarico libero'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF7: TcxDBRadioGroup
          Left = 268
          Top = -2
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VALVOLASICUREZZASOVRAPRESS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel27: TPanel
        Left = 332
        Top = 202
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 23
        DesignSize = (
          322
          17)
        object Label78: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Vaso di espansione carico'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF8: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VASOESPANSIONECARICO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel28: TPanel
        Left = 332
        Top = 219
        Width = 322
        Height = 28
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 24
        DesignSize = (
          322
          28)
        object Label79: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dispositivi di sisurezza non manomessi e/o cortocircuitati'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF9: TcxDBRadioGroup
          Left = 268
          Top = -2
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPSICUREZZANONMANOMESSI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel5: TPanel
        Left = 332
        Top = 39
        Width = 322
        Height = 28
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 16
        DesignSize = (
          322
          28)
        object Label48: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 
            'Ugelli del bruciatore principale e del bruciatore pilota (se esi' +
            'ste) puliti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF1: TcxDBRadioGroup
          Left = 268
          Top = -1
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_UGELLIPULITI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel29: TPanel
        Left = 332
        Top = 247
        Width = 322
        Height = 28
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 25
        DesignSize = (
          322
          28)
        object Label81: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 24
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 
            'Organi soggetti a sollecitazioni termiche integri e senza segni ' +
            'di usura e/o deformazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF10: TcxDBRadioGroup
          Left = 268
          Top = -2
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ORGSOGGSOLLECITAZTERMINTEGRI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel30: TPanel
        Left = 332
        Top = 275
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 26
        DesignSize = (
          322
          17)
        object Label83: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Circuito aria pulito e libero da qualsiasi impedimento'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF11: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_CIRCUITOARIAPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel31: TPanel
        Left = 332
        Top = 292
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 27
        DesignSize = (
          322
          17)
        object Label84: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Guarnizione di accoppiamento al generatore integra'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeF12: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_GUARNIZACCOPIAMINTEGRA'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel32: TPanel
        Left = 332
        Top = 328
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 28
        DesignSize = (
          322
          17)
        object Label86: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Controllo assenza fughe di gas'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeG1: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_CONTROLLOASSENZAFUGHEGAS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel33: TPanel
        Left = 332
        Top = 345
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 29
        DesignSize = (
          322
          17)
        object Label87: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Verifica visiva coibentazioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeG2: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCOIBENTAZIONI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel34: TPanel
        Left = 332
        Top = 362
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 30
        DesignSize = (
          322
          17)
        object Label88: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Verifica efficienza evacuazione fumi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbeG3: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCAMINO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object EditInserimentoFacilitato: TEdit
        Left = 304
        Top = 3
        Width = 65
        Height = 19
        Color = clFuchsia
        TabOrder = 31
        Text = 'EditInserimentoFacilitato'
        Visible = False
        OnExit = EditInserimentoFacilitatoExit
        OnKeyUp = EditInserimentoFacilitatoKeyUp
      end
    end
    object Panel_F_DocumentazioneTecnicaCorredo: TPanel
      Left = 1
      Top = 3158
      Width = 661
      Height = 219
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 13
      Visible = False
      object Shape20: TShape
        Left = 6
        Top = 20
        Width = 351
        Height = 190
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label98: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' DOCUMENTAZIONE TECNICA A CORREDO   (Canc. per azzerare)'
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
      object Label99: TLabel
        Left = 99
        Top = 24
        Width = 56
        Height = 12
        Caption = 'Documento'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label105: TLabel
        Left = 260
        Top = 24
        Width = 45
        Height = 12
        Caption = 'Presente'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label106: TLabel
        Left = 312
        Top = 24
        Width = 42
        Height = 12
        Caption = 'Assente'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape15: TShape
        Left = 356
        Top = 20
        Width = 299
        Height = 190
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label109: TLabel
        Left = 488
        Top = 24
        Width = 24
        Height = 12
        Caption = 'Note'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object SBInserimentoFacilitato_F: TSpeedButton
        Left = 540
        Top = 0
        Width = 120
        Height = 14
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 101
        Caption = 'Inserimento facilitato'
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = SBInserimentoFacilitato_FClick
      end
      object Panel35: TPanel
        Left = 7
        Top = 39
        Width = 349
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 0
        DesignSize = (
          349
          17)
        object Label114: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto di centrale'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B1: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRETTOIMPIANTO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel36: TPanel
        Left = 7
        Top = 56
        Width = 349
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 2
        DesignSize = (
          349
          17)
        object Label115: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Rapporto di controllo ex UNI 10435 (imp. a gas)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B2: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_RAPPCONTRTECN10435'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel37: TPanel
        Left = 7
        Top = 73
        Width = 349
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 4
        DesignSize = (
          349
          17)
        object Label116: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Certificazione ex UNI 8364'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B3: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_CERTUNI8364'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 356
        Top = 38
        AutoSize = False
        DataBinding.DataField = 'B_LIBRETTOIMPIANTO_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 14541539
        Style.BorderStyle = ebsSingle
        Style.Color = 14541539
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 356
        Top = 55
        AutoSize = False
        DataBinding.DataField = 'B_RAPPCONTRTECN10435_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 15329769
        Style.BorderStyle = ebsSingle
        Style.Color = 15329769
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 356
        Top = 72
        AutoSize = False
        DataBinding.DataField = 'B_CERTUNI8364_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 14541539
        Style.BorderStyle = ebsSingle
        Style.Color = 14541539
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object Panel1: TPanel
        Left = 7
        Top = 90
        Width = 349
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 6
        DesignSize = (
          349
          17)
        object Label100: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dichiaraz. di conformit'#224' / Dichiaraz. di rispondenza'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B4: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_DICHCONFIMP'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel38: TPanel
        Left = 7
        Top = 107
        Width = 349
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 8
        DesignSize = (
          349
          17)
        object Label101: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto uso e manutenzione bruciatore'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B5: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOBRUCIATORE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel39: TPanel
        Left = 7
        Top = 124
        Width = 349
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 10
        DesignSize = (
          349
          17)
        object Label102: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto uso e manutenzione caldaia'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B6: TcxDBRadioGroup
          Left = 263
          Top = -10
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOCALD'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel40: TPanel
        Left = 7
        Top = 141
        Width = 349
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 12
        DesignSize = (
          349
          17)
        object Label103: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Schemi funzionali idarulici'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B7: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_SCHEMIFUNZIDRAUL'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel41: TPanel
        Left = 7
        Top = 158
        Width = 349
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 14
        DesignSize = (
          349
          17)
        object Label104: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Schemi funzionali elettrici'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B8: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_SCHEMIFUNZELETTR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel42: TPanel
        Left = 7
        Top = 175
        Width = 349
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 16
        DesignSize = (
          349
          17)
        object Label107: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Certificato prevenzione incendi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B9: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_CERTPREVINCENDI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object Panel43: TPanel
        Left = 7
        Top = 192
        Width = 349
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 18
        DesignSize = (
          349
          17)
        object Label108: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Pratica ISPESL'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_B10: TcxDBRadioGroup
          Left = 263
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_PRATICAISPESL'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 110
        end
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 356
        Top = 89
        AutoSize = False
        DataBinding.DataField = 'B_DICHCONFIMP_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 15329769
        Style.BorderStyle = ebsSingle
        Style.Color = 15329769
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 356
        Top = 106
        AutoSize = False
        DataBinding.DataField = 'B_LIBRUSOBRUCIATORE_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 14541539
        Style.BorderStyle = ebsSingle
        Style.Color = 14541539
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 356
        Top = 123
        AutoSize = False
        DataBinding.DataField = 'B_LIBRUSOCALD_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 15329769
        Style.BorderStyle = ebsSingle
        Style.Color = 15329769
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 356
        Top = 140
        AutoSize = False
        DataBinding.DataField = 'B_SCHEMIFUNZIDRAUL_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 14541539
        Style.BorderStyle = ebsSingle
        Style.Color = 14541539
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 356
        Top = 157
        AutoSize = False
        DataBinding.DataField = 'B_SCHEMIFUNZELETTR_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 15329769
        Style.BorderStyle = ebsSingle
        Style.Color = 15329769
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 356
        Top = 174
        AutoSize = False
        DataBinding.DataField = 'B_CERTPREVINCENDI_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 14541539
        Style.BorderStyle = ebsSingle
        Style.Color = 14541539
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 17
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 356
        Top = 191
        AutoSize = False
        DataBinding.DataField = 'B_PRATICAISPESL_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderColor = 15329769
        Style.BorderStyle = ebsSingle
        Style.Color = 15329769
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 19
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 19
        Width = 299
      end
      object EditInserimentoFacilitato_F: TEdit
        Left = 304
        Top = 3
        Width = 65
        Height = 19
        Color = clFuchsia
        TabOrder = 20
        Text = 'EditInserimentoFacilitato'
        Visible = False
        OnExit = EditInserimentoFacilitato_FExit
        OnKeyUp = EditInserimentoFacilitato_FKeyUp
      end
    end
    object Panel_F_EsameVisivoImpianto: TPanel
      Left = 2
      Top = 3755
      Width = 661
      Height = 206
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 14
      Visible = False
      object Shape16: TShape
        Left = 6
        Top = 20
        Width = 316
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label110: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 
          ' ESAME VISIVO E CONTROLLO DELLA CENTRALE TERMICA E DELL'#39'IMPIANTO' +
          '   (Canc. per azzerare)'
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
      object Label111: TLabel
        Left = 11
        Top = 24
        Width = 95
        Height = 12
        Caption = '1. Centrale termica'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape17: TShape
        Left = 6
        Top = 90
        Width = 316
        Height = 19
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape18: TShape
        Left = 6
        Top = 113
        Width = 316
        Height = 54
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape19: TShape
        Left = 6
        Top = 161
        Width = 316
        Height = 36
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape21: TShape
        Left = 321
        Top = 20
        Width = 334
        Height = 120
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape23: TShape
        Left = 321
        Top = 139
        Width = 334
        Height = 20
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape24: TShape
        Left = 321
        Top = 158
        Width = 334
        Height = 20
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape25: TShape
        Left = 321
        Top = 177
        Width = 334
        Height = 20
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Panel45: TPanel
        Left = 7
        Top = 39
        Width = 314
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 0
        DesignSize = (
          314
          17)
        object Label118: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Idoneit'#224' del locale di installazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C11: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_IDONLOCALEINSTALLAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel46: TPanel
        Left = 7
        Top = 56
        Width = 314
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          314
          17)
        object Label119: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Adeguate dimensioni aperture ventilaz.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C12: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ADEGDIMENSVENTILAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel47: TPanel
        Left = 7
        Top = 73
        Width = 314
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 2
        DesignSize = (
          314
          17)
        object Label120: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Aperture di ventilaz. libere da ostruzioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C13: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_APERTVENTILAZLIBERE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel48: TPanel
        Left = 7
        Top = 91
        Width = 314
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          314
          17)
        object Label121: TLabel
          Left = 4
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '2. Esame visivo linee elettriche'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C20: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ESAMEVISIVOLINEEELETTRICHE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'sodd.'
              Value = 'T'
            end
            item
              Caption = 'non s.'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel49: TPanel
        Left = 7
        Top = 109
        Width = 314
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 4
        DesignSize = (
          314
          17)
        object Label122: TLabel
          Left = 4
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '3. Bruciatore'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
      end
      object Panel50: TPanel
        Left = 7
        Top = 127
        Width = 314
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 5
        DesignSize = (
          314
          17)
        object Label123: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Ugelli puliti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C31: TcxDBRadioGroup
          Left = 209
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_UGELLIPULITI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel51: TPanel
        Left = 7
        Top = 144
        Width = 314
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 6
        DesignSize = (
          314
          17)
        object Label124: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Funzionamento corretto'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C32: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_BRUCFUNZIONAMCORRETTO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel52: TPanel
        Left = 7
        Top = 162
        Width = 314
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 7
        DesignSize = (
          314
          17)
        object Label125: TLabel
          Left = 4
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '4. Generatore di calore'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
      end
      object Panel53: TPanel
        Left = 7
        Top = 179
        Width = 314
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 8
        DesignSize = (
          314
          17)
        object Label126: TLabel
          Left = 5
          Top = 2
          Width = 265
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Scambiatore lato fumi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C41: TcxDBRadioGroup
          Left = 209
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SCAMBLATOFUMOPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel54: TPanel
        Left = 322
        Top = 22
        Width = 332
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 9
        DesignSize = (
          332
          17)
        object Label113: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Accensione e funzionamento regolari'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C42: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ACCENSFUNZAMREGOLARI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel55: TPanel
        Left = 322
        Top = 39
        Width = 332
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 10
        DesignSize = (
          332
          17)
        object Label117: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Disp. di com. e regol. funzionanti correttam.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C43: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPCOMANDOREGOLAZFUNZCORR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel56: TPanel
        Left = 322
        Top = 56
        Width = 332
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 11
        DesignSize = (
          332
          17)
        object Label127: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Assenza di perdite e ossidaz. dai/sui racc.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C44: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ASSENZAPERDITEOSSIDAZRACC'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel57: TPanel
        Left = 322
        Top = 73
        Width = 332
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 12
        DesignSize = (
          332
          17)
        object Label128: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Disp. di sicurezza non manom. e/o cortoc.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C45: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPSICUREZZANONMANOMESSI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel58: TPanel
        Left = 322
        Top = 90
        Width = 332
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 13
        DesignSize = (
          332
          17)
        object Label129: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '- Vaso di esp. carico e/o in ordine per il funz.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C46: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VASOESPANSIONECARICO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel59: TPanel
        Left = 322
        Top = 107
        Width = 332
        Height = 32
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 14
        DesignSize = (
          332
          32)
        object Label130: TLabel
          Left = 5
          Top = 2
          Width = 225
          Height = 28
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 
            '- Organi sogg. a sollecitaz. termiche integri e senza segni di u' +
            'sura e/o deformazione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C47: TcxDBRadioGroup
          Left = 227
          Top = -1
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ORGSOGGSOLLECITAZTERMINTEGRI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'si'
              Value = 'T'
            end
            item
              Caption = 'no'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel44: TPanel
        Left = 322
        Top = 140
        Width = 332
        Height = 18
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 15
        DesignSize = (
          332
          18)
        object Label112: TLabel
          Left = 4
          Top = 3
          Width = 265
          Height = 14
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '5. Controllo assenze fughe di gas'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C50: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_CONTROLLOASSENZAFUGHEGAS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'sodd.'
              Value = 'T'
            end
            item
              Caption = 'non s.'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel60: TPanel
        Left = 322
        Top = 159
        Width = 332
        Height = 18
        BevelOuter = bvNone
        Color = 14541539
        TabOrder = 16
        DesignSize = (
          332
          18)
        object Label131: TLabel
          Left = 4
          Top = 3
          Width = 265
          Height = 14
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '6. Esame visivo delle coibentazioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C60: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCOIBENTAZIONI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'sodd.'
              Value = 'T'
            end
            item
              Caption = 'non s.'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
      object Panel61: TPanel
        Left = 322
        Top = 178
        Width = 332
        Height = 18
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 17
        DesignSize = (
          332
          18)
        object Label132: TLabel
          Left = 4
          Top = 3
          Width = 265
          Height = 14
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = '7. Esame visivo camino e canale da fumo'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object dbe_F_C70: TcxDBRadioGroup
          Left = 227
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCAMINO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'sodd.'
              Value = 'T'
            end
            item
              Caption = 'non s.'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 105
        end
      end
    end
    object Panel_G_ControlloRendimentoCombustione: TPanel
      Left = 1
      Top = 3408
      Width = 661
      Height = 97
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 15
      Visible = False
      object Shape26: TShape
        Left = 50
        Top = 22
        Width = 49
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape36: TShape
        Left = 564
        Top = 22
        Width = 52
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape35: TShape
        Left = 520
        Top = 22
        Width = 45
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape34: TShape
        Left = 349
        Top = 22
        Width = 48
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape31: TShape
        Left = 233
        Top = 22
        Width = 70
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape30: TShape
        Left = 198
        Top = 22
        Width = 36
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape28: TShape
        Left = 163
        Top = 22
        Width = 36
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape27: TShape
        Left = 98
        Top = 22
        Width = 66
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label133: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CONTROLLO DEL RENDIMENTO DI COMBUSTIONE'
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
      object Label134: TLabel
        Left = 51
        Top = 24
        Width = 47
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Temp. fumi'#13#10'('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label135: TLabel
        Left = 98
        Top = 24
        Width = 66
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Temp. aria comburente ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label136: TLabel
        Left = 161
        Top = 24
        Width = 41
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'O2'#13#10'(%)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label137: TLabel
        Left = 196
        Top = 24
        Width = 41
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'CO2'#13#10'(%)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label138: TLabel
        Left = 235
        Top = 24
        Width = 66
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Bacharach (n'#176')'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label139: TLabel
        Left = 350
        Top = 24
        Width = 46
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'CO corretto (ppm)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label140: TLabel
        Left = 518
        Top = 24
        Width = 50
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Rend. comb.'#13#10'(%)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label141: TLabel
        Left = 565
        Top = 24
        Width = 50
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Rend.min di legge (%)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape32: TShape
        Left = 6
        Top = 22
        Width = 45
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label216: TLabel
        Left = 4
        Top = 24
        Width = 50
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Modulo termico'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape111: TShape
        Left = 615
        Top = 22
        Width = 39
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label287: TLabel
        Left = 616
        Top = 24
        Width = 37
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'NOx (ppm)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape152: TShape
        Left = 302
        Top = 22
        Width = 48
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label416: TLabel
        Left = 303
        Top = 24
        Width = 46
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'CO fumi secchi (ppm)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape153: TShape
        Left = 396
        Top = 22
        Width = 65
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label417: TLabel
        Left = 397
        Top = 24
        Width = 63
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Portata combustib. (m3/h)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape154: TShape
        Left = 460
        Top = 22
        Width = 61
        Height = 68
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label418: TLabel
        Left = 461
        Top = 24
        Width = 59
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pot. term. effettiva (kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label419: TLabel
        Left = 253
        Top = 67
        Width = 7
        Height = 16
        Alignment = taCenter
        Caption = '-'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label421: TLabel
        Left = 277
        Top = 67
        Width = 7
        Height = 16
        Alignment = taCenter
        Caption = '-'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object dbeAnFumi_TempFumi: TcxDBTextEdit
        Tag = -1
        Left = 51
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_TEMPFUMI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 47
      end
      object dbeAnFumi_TempAmbiente: TcxDBTextEdit
        Tag = -1
        Left = 99
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_TEMPAMBIENTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 64
      end
      object dbeAnFumi_O2_Perc: TcxDBTextEdit
        Tag = -1
        Left = 164
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_O2_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 34
      end
      object dbeAnFumi_CO2_Perc: TcxDBTextEdit
        Tag = -1
        Left = 199
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_CO2_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 34
      end
      object dbeAnFumi_Bacharach: TcxDBTextEdit
        Tag = -1
        Left = 234
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_BACHARACH_NUM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 20
      end
      object dbeAnFumi_CO_ppm: TcxDBTextEdit
        Tag = -1
        Left = 350
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_CO_PPM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 46
      end
      object dbeAnFumi_RendCombustione_Perc: TcxDBTextEdit
        Tag = -1
        Left = 521
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_RENDIMENTO_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 43
      end
      object dbeAnFumi_RendMinimo: TcxDBTextEdit
        Tag = -1
        Left = 564
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_RENDMINIMOLEGGE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 50
      end
      object PanelAnalisiFumiEffettuata: TPanel
        Left = 410
        Top = -3
        Width = 247
        Height = 16
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          247
          16)
        object dbeAnalisiFumiEffettuata: TcxDBRadioGroup
          Left = -6
          Top = -8
          Cursor = crHandPoint
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataBinding.DataField = 'ANFUMI_EFFETTUATO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'EFFETTUATO'
              Value = 'T'
            end
            item
              Caption = 'NON EFFETTUATO'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Properties.OnChange = dbeAnalisiFumiEffettuataPropertiesChange
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsUltraFlat
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 261
        end
      end
      object dbeAnFumi_ModuloTermico: TcxDBTextEdit
        Tag = -1
        Left = 7
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_MODULOTERMICO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 43
      end
      object dbeAnFumi_NOX_ppm: TcxDBTextEdit
        Tag = -1
        Left = 616
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_NOX_PPM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 37
      end
      object dbeAnFumi_Bacharach2: TcxDBTextEdit
        Tag = -1
        Left = 258
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_BACHARACH_NUM2'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 20
      end
      object dbeAnFumi_Bacharach3: TcxDBTextEdit
        Tag = -1
        Left = 282
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_BACHARACH_NUM3'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 20
      end
      object dbeAnFumi_COFumiSecchi_ppm: TcxDBTextEdit
        Tag = -1
        Left = 303
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_CUFUMISECCHI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 46
      end
      object dbeAnFumi_PortataComb_m3h: TcxDBTextEdit
        Tag = -1
        Left = 397
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_PORTATACOMBUSTIBILE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 63
      end
      object dbeAnFumi_PotTermEff_kw: TcxDBTextEdit
        Tag = -1
        Left = 461
        Top = 64
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_PORTATATERMICAEFFETTIVA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 59
      end
    end
    object Panel_G_Osservazioni: TPanel
      Left = 1
      Top = 3965
      Width = 661
      Height = 57
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 18
      Visible = False
      object Label142: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' OSSERVAZIONI'
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
      object cxDBMemoOsservazioni: TcxDBMemo
        Left = 5
        Top = 18
        DataBinding.DataField = 'OSSERVAZIONI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 33
        Width = 652
      end
    end
    object Panel_G_Raccomandazioni: TPanel
      Left = 1
      Top = 4033
      Width = 661
      Height = 70
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 19
      Visible = False
      object Label143: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' RACCOMANDAZIONI'
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
      object Label144: TLabel
        Left = 301
        Top = -1
        Width = 353
        Height = 12
        Caption = 
          '(In attesa di questi interventi l'#39'impianto pu'#242' essere messo in f' +
          'unzione)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label154: TLabel
        Left = 110
        Top = 53
        Width = 24
        Height = 12
        Caption = 'Data'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label155: TLabel
        Left = 242
        Top = 53
        Width = 24
        Height = 12
        Caption = 'Note'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object cxDBMemoRaccomandazioni: TcxDBMemo
        Left = 5
        Top = 18
        DataBinding.DataField = 'RACCOMANDAZIONI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 33
        Width = 652
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 2
        Top = 49
        Caption = 'Fatto / Risolto'
        DataBinding.DataField = 'RACCOMANDAZIONI_FATTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 137
        Top = 50
        AutoSize = False
        DataBinding.DataField = 'RACCOMANDAZIONI_FATTO_DATA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 272
        Top = 50
        AutoSize = False
        DataBinding.DataField = 'RACCOMANDAZIONI_FATTO_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 385
      end
    end
    object Panel_G_Prescrizioni: TPanel
      Left = 1
      Top = 4200
      Width = 661
      Height = 96
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 20
      Visible = False
      object Label145: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' PRESCRIZIONI'
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
      object Label146: TLabel
        Left = 111
        Top = -1
        Width = 461
        Height = 12
        Caption = 
          'L'#39'apparecchio pu'#242' essere messo in servizio ai fini dell'#39'efficien' +
          'za energetica e della sicurezza:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label147: TLabel
        Left = 6
        Top = 17
        Width = 648
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'In mancanza di prescrizioni esplicite, il tecnico dichiara che l' +
          #39'apparecchio pu'#242' essere messo in servizio ed usato normalmente s' +
          'enza compromettere la sicurezza delle persone, degli animali e d' +
          'ei beni.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label156: TLabel
        Left = 110
        Top = 79
        Width = 24
        Height = 12
        Caption = 'Data'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label157: TLabel
        Left = 242
        Top = 79
        Width = 24
        Height = 12
        Caption = 'Note'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Panel63: TPanel
        Left = 575
        Top = -3
        Width = 80
        Height = 16
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        DesignSize = (
          80
          16)
        object dbeImpiantoPuoFunzionare: TcxDBRadioGroup
          Left = -6
          Top = -8
          Cursor = crHandPoint
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataBinding.DataField = 'IMPPUOFUNZIONARE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'SI'
              Value = 'T'
            end
            item
              Caption = 'NO'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Properties.OnChange = dbeImpiantoPuoFunzionarePropertiesChange
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsUltraFlat
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 94
        end
      end
      object dbePrescrizioni: TcxDBMemo
        Tag = -1
        Left = 5
        Top = 44
        DataBinding.DataField = 'PRESCRIZIONI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 33
        Width = 652
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 2
        Top = 75
        Caption = 'Fatto / Risolto'
        DataBinding.DataField = 'PRESCRIZIONI_FATTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 137
        Top = 76
        AutoSize = False
        DataBinding.DataField = 'PRESCRIZIONI_FATTO_DATA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object cxDBTextEdit12: TcxDBTextEdit
        Left = 272
        Top = 76
        AutoSize = False
        DataBinding.DataField = 'PRESCRIZIONI_FATTO_NOTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 385
      end
    end
    object Panel_G_Tecnico: TPanel
      Left = 1
      Top = 4301
      Width = 661
      Height = 78
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 21
      Visible = False
      object Label148: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' TECNICO CHE HA EFFETTUATO IL CONTROLLO'
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
      object Label149: TLabel
        Left = 6
        Top = 18
        Width = 88
        Height = 12
        Caption = 'Nome e Cognome'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object SBTecnico: TSpeedButtonRollOver
        Left = 643
        Top = 1
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
        OnClick = SBTecnicoClick
      end
      object DBText4: TDBText
        Left = 580
        Top = 0
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'TECNICO_RESOURCEID'
        DataSource = SourceAll
        DragMode = dmAutomatic
        Font.Charset = ANSI_CHARSET
        Font.Color = 13421772
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label158: TLabel
        Left = 6
        Top = 38
        Width = 80
        Height = 12
        Caption = 'Ragione Sociale'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label159: TLabel
        Left = 297
        Top = 38
        Width = 43
        Height = 12
        Caption = 'Indirizzo'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label160: TLabel
        Left = 6
        Top = 56
        Width = 42
        Height = 12
        Caption = 'Telefono'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label161: TLabel
        Left = 265
        Top = 56
        Width = 172
        Height = 12
        Caption = 'Estremi del documento di qualifica'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dbeTecnicoNome: TDBEdit
        Left = 102
        Top = 18
        Width = 200
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_NOMECOGNOME'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTecnicoRagSoc: TDBEdit
        Left = 94
        Top = 38
        Width = 197
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_RAGSOC'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTecnicoIndirizzo: TDBEdit
        Left = 345
        Top = 38
        Width = 310
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_INDIRIZZO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTecnicoTelefono: TDBEdit
        Left = 54
        Top = 56
        Width = 200
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTecnicoEstremiDocQualifica: TDBEdit
        Left = 441
        Top = 56
        Width = 214
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_ESTREMIDOCQUALIFICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeUsaTecnicoIntervento: TcxDBCheckBox
        Left = 402
        Top = -5
        Caption = 'Usa quello dell'#39'intervento'
        DataBinding.DataField = 'TECNICO_DAIMPEGNO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taRightJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clMaroon
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object PanelNumDataDocumento: TPanel
      Left = 1
      Top = 3
      Width = 674
      Height = 85
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      Visible = False
      DesignSize = (
        674
        85)
      object Shape22: TShape
        Left = 479
        Top = 43
        Width = 51
        Height = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = 13822463
        Pen.Color = 427007
      end
      object ShapeDocumento: TShape
        Left = 0
        Top = -1
        Width = 515
        Height = 86
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = 13822463
        Pen.Color = 427007
      end
      object LabelData: TLabel
        Left = 6
        Top = 21
        Width = 89
        Height = 12
        Caption = 'Data del controllo'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LabelDocumento: TLabel
        Left = 0
        Top = 0
        Width = 515
        Height = 14
        AutoSize = False
        Caption = '  ALLEGATO - G'
        Color = 427007
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        OnDblClick = LabelDocumentoDblClick
      end
      object LabelCantiere: TLabel
        Left = 6
        Top = 44
        Width = 45
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'Impianto'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label152: TLabel
        Left = 211
        Top = 21
        Width = 131
        Height = 12
        Caption = 'Orario di arrivo e partenza'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label165: TLabel
        Left = 6
        Top = 65
        Width = 34
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'Pagina'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label166: TLabel
        Left = 90
        Top = 65
        Width = 9
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'di'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label170: TLabel
        Left = 142
        Top = 65
        Width = 27
        Height = 12
        Anchors = [akLeft, akBottom]
        Caption = 'copie'
        Font.Charset = ANSI_CHARSET
        Font.Color = 427007
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object eDataControllo: TcxDBDateEdit
        Left = 102
        Top = 16
        DataBinding.DataField = 'DATACONTROLLO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtNone
        Style.IsFontAssigned = True
        StyleDisabled.Color = 16250871
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 100
      end
      object eOrarioArrivo: TcxDBTimeEdit
        Left = 345
        Top = 16
        DataBinding.DataField = 'DATAORAARRIVO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtNone
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 70
      end
      object eOrarioPartenza: TcxDBTimeEdit
        Left = 412
        Top = 16
        DataBinding.DataField = 'DATAORAPARTENZA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonTransparency = ebtNone
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 70
      end
      object cxDBTextEdit19: TcxDBTextEdit
        Tag = -1
        Left = 59
        Top = 41
        TabStop = False
        Anchors = [akLeft, akBottom]
        DataBinding.DataField = 'PRATICA_FULL'
        DataBinding.DataSource = SourcePrat
        ParentFont = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Color = 13822463
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 422
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 374
        Top = -4
        Caption = 'Data e ora da intervento'
        DataBinding.DataField = 'DATAORADAIMPEGNO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taRightJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clWhite
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object PanelStatoAvanzamento: TPanel
        Left = 522
        Top = -1
        Width = 139
        Height = 86
        BevelOuter = bvNone
        Color = 13822463
        TabOrder = 8
        object Label150: TLabel
          Left = 0
          Top = 0
          Width = 139
          Height = 15
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Avanzamento'
          Color = 427007
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          ExplicitTop = 1
        end
        object Panel62: TPanel
          Left = 0
          Top = 15
          Width = 139
          Height = 71
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object cxDBRadioGroup60: TcxDBRadioGroup
            Left = -1
            Top = -7
            Cursor = crHandPoint
            DataBinding.DataField = 'STATOAVANZAMENTO'
            DataBinding.DataSource = SourceAll
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Caption = 'Da stampare'
                Value = 10
              end
              item
                Caption = 'Stampato'
                Value = 20
              end
              item
                Caption = 'Completato'
                Value = 30
              end
              item
                Caption = 'Inviato internet'
                Value = 40
              end
              item
                Caption = 'Consegnato cartaceo'
                Value = 50
              end>
            Style.BorderColor = 427007
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -9
            Style.Font.Name = 'Verdana'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = False
            Style.TextColor = 427007
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Height = 79
            Width = 141
          end
        end
      end
      object ePag: TcxDBTextEdit
        Tag = -1
        Left = 59
        Top = 62
        TabStop = False
        Anchors = [akLeft, akBottom]
        DataBinding.DataField = 'PAG'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Color = 13822463
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 30
      end
      object ePagDi: TcxDBTextEdit
        Tag = -1
        Left = 101
        Top = 62
        TabStop = False
        Anchors = [akLeft, akBottom]
        DataBinding.DataField = 'PAGDI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Color = 13822463
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 30
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 173
        Top = 62
        DataBinding.DataField = 'COPIE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.SpinButtons.Position = sbpHorzLeftRight
        Properties.UseLeftAlignmentOnEditing = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Width = 40
      end
    end
    object PanelBollino: TPanel
      Left = 1
      Top = 4389
      Width = 661
      Height = 57
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 22
      Visible = False
      object Label162: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' BOLLINO E FIRME'
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
      object Label163: TLabel
        Left = 6
        Top = 18
        Width = 133
        Height = 12
        Caption = 'Bollino (prefisso - numero)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label164: TLabel
        Left = 190
        Top = 12
        Width = 9
        Height = 23
        Caption = '-'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object dbeBollinoPrefisso: TDBEdit
        Left = 148
        Top = 18
        Width = 40
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BOLLINO_PREFISSO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeBollinoNumero: TDBEdit
        Left = 201
        Top = 18
        Width = 454
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'BOLLINO_NUMERO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeFirmaResponsabilePresente: TcxDBCheckBox
        Left = 2
        Top = 33
        Caption = 'Firma del responsabile dell'#39'impianto presente'
        DataBinding.DataField = 'FIRMAPRESENTE_RESPONSABILE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeFirmaDelTecnicoPresente: TcxDBCheckBox
        Left = 290
        Top = 33
        Caption = 'Firma del tecnico presente'
        DataBinding.DataField = 'FIRMAPRESENTE_TECNICO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE1_DocTecnicaCorredo: TPanel
      Left = 1
      Top = 365
      Width = 661
      Height = 81
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      object Shape33: TShape
        Left = 331
        Top = 20
        Width = 324
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape40: TShape
        Left = 6
        Top = 20
        Width = 326
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label182: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' DOCUMENTAZIONE TECNICA A CORREDO   (Canc. per azzerare)'
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
      object Label192: TLabel
        Left = 290
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label193: TLabel
        Left = 311
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label195: TLabel
        Left = 615
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label196: TLabel
        Left = 635
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object PanelDicConfPresente: TPanel
        Left = 7
        Top = 39
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label201: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dichiarazione di conformit'#224' presente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object eDichConfPresente: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_DICHCONFIMP'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelLibrettoImpPresente: TPanel
        Left = 7
        Top = 56
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label202: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Libretto impianto presente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup2: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRETTOIMPIANTO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelLibrettoCompilato: TPanel
        Left = 332
        Top = 56
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          322
          17)
        object Label220: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = 'Libretto compilato in tutte le sue parti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup17: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRETTOIMPIANTOCOMPILATO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelLibrUsoManutPresenti: TPanel
        Left = 332
        Top = 39
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          322
          17)
        object Label232: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = 'Libretti uso/manutenzione presenti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup25: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOCALD'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
    end
    object Panel_RCEE1_TrattamentoAcqua: TPanel
      Left = 1
      Top = 628
      Width = 661
      Height = 56
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 6
      Visible = False
      object Label183: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' TRATTAMENTO DELL'#39'ACQUA'
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
      object LabelTrattAcqua_Riscaldamento: TLabel
        Left = 239
        Top = 18
        Width = 147
        Height = 12
        Alignment = taRightJustify
        Caption = 'Trattamento in riscaldamento'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label188: TLabel
        Left = 6
        Top = 18
        Width = 126
        Height = 12
        Caption = 'Durezza totale dell'#39'acqua'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label189: TLabel
        Left = 194
        Top = 18
        Width = 20
        Height = 12
        Caption = '('#176'fr)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object LabelTrattAcqua_ACS: TLabel
        Left = 238
        Top = 36
        Width = 148
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Trattamento in ACS'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBEdit10: TDBEdit
        Left = 143
        Top = 17
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O_DUREZZATOTALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTrattAcqua_Riscaldamento: TcxDBComboBox
        Left = 390
        Top = 15
        AutoSize = False
        DataBinding.DataField = 'TH2O_TRATTRISCALDAM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Items.Strings = (
          'NON RICHIESTO'
          'ASSENTE'
          'FILTRAZIONE'
          'ADDOLCIMENTO'
          'COND. CHIMICO'
          'FILTRAZIONE + ADDOLCIMENTO'
          'FILTRAZIONE + COND. CHIMICO'
          'COND. CHIMICO + ADDOLCIMENTO'
          'GLOBALE')
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 267
      end
      object dbeTrattAcqua_ACS: TcxDBComboBox
        Left = 390
        Top = 33
        AutoSize = False
        DataBinding.DataField = 'TH2O_TRATTACS'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Items.Strings = (
          'NON RICHIESTO'
          'ASSENTE'
          'FILTRAZIONE'
          'ADDOLCIMENTO'
          'COND. CHIMICO'
          'FILTRAZIONE + ADDOLCIMENTO'
          'FILTRAZIONE + COND. CHIMICO'
          'COND. CHIMICO + ADDOLCIMENTO'
          'GLOBALE')
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 267
      end
    end
    object Panel_RCEE1_ControlloImpianto: TPanel
      Left = 1
      Top = 930
      Width = 661
      Height = 116
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 8
      Visible = False
      object Shape37: TShape
        Left = 331
        Top = 20
        Width = 324
        Height = 90
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape42: TShape
        Left = 6
        Top = 20
        Width = 326
        Height = 90
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label191: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CONTROLLO DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object Label204: TLabel
        Left = 283
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label205: TLabel
        Left = 296
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label206: TLabel
        Left = 310
        Top = 24
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label207: TLabel
        Left = 609
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label208: TLabel
        Left = 622
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label209: TLabel
        Left = 636
        Top = 24
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object PanelInstIntLocaleIdoneo: TPanel
        Left = 7
        Top = 39
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label213: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Per installazione interna: in locale idoneo'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup3: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_IDONLOCALEINSTALLAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelInstExtGeratoriIdonei: TPanel
        Left = 7
        Top = 56
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label214: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Per installazione esterna: generatori idonei'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup4: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_EXTINST_GENERATOREIDONEO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelApertVentilazLibere: TPanel
        Left = 7
        Top = 73
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          324
          17)
        object Label215: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Aperture di ventilaz./aeraz. libere da ostruzioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup5: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_APERTVENTILAZLIBERE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelCanaleFumoIdoneo: TPanel
        Left = 332
        Top = 39
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 4
        DesignSize = (
          322
          17)
        object Label245: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Canale da fumo o condotti idonei (esame visivo)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup21: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCAMINO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelSistRegolazTempFunzionante: TPanel
        Left = 332
        Top = 56
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 5
        DesignSize = (
          322
          17)
        object Label246: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Sistema di regolazione temp. ambiente funzionante'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup22: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SISTIREGOLAZTEMPFUNZIONANTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelAdeguateDimensAperture: TPanel
        Left = 7
        Top = 90
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          324
          17)
        object Label197: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Adeguate dimensioni aperture di ventilaz./aeraz.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup6: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ADEGDIMENSVENTILAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelNoPerditeCombLiquido: TPanel
        Left = 332
        Top = 73
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 6
        DesignSize = (
          322
          17)
        object Label198: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Assenza di perdite di combustibile liquido'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup7: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ASSENZAPERDITECOMBLIQUIDO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelIdoneaTenutaGeneratore: TPanel
        Left = 332
        Top = 90
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 7
        DesignSize = (
          322
          17)
        object Label199: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Idonea tenuta imp. int. e raccordi con il generatore'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup8: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_GUARNIZACCOPIAMINTEGRA'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
    end
    object Panel_RCEE1_GruppoTermico: TPanel
      Left = 1
      Top = 1048
      Width = 661
      Height = 252
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 9
      Visible = False
      object Label194: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 
          ' CONTROLLO E VERIFICA ENERGETICA DEL GRUPPO TERMICO   (Canc. per' +
          ' azzerare)'
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
      object Label200: TLabel
        Left = 6
        Top = 36
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Fabbricante'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label203: TLabel
        Left = 6
        Top = 54
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label210: TLabel
        Left = 6
        Top = 72
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label211: TLabel
        Left = 367
        Top = 72
        Width = 122
        Height = 12
        Caption = 'Pot. term. nominale utile'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label212: TLabel
        Left = 337
        Top = 229
        Width = 159
        Height = 12
        Caption = 'Depressione nel canale da fumo'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label221: TLabel
        Left = 367
        Top = 54
        Width = 176
        Height = 12
        Caption = 'Pot. term. nominale max al focolare'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label222: TLabel
        Left = 166
        Top = 18
        Width = 72
        Height = 12
        Caption = 'Data installaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label242: TLabel
        Left = 6
        Top = 18
        Width = 95
        Height = 12
        Caption = 'Gruppo termico GT'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label243: TLabel
        Left = 608
        Top = 54
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label244: TLabel
        Left = 608
        Top = 72
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape43: TShape
        Left = 331
        Top = 100
        Width = 324
        Height = 123
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label219: TLabel
        Left = 609
        Top = 104
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label247: TLabel
        Left = 622
        Top = 104
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label248: TLabel
        Left = 636
        Top = 104
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label217: TLabel
        Left = 559
        Top = 229
        Width = 21
        Height = 12
        Caption = '(Pa)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object eGTMatricola: TDBEdit
        Left = 71
        Top = 72
        Width = 256
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eGTPotNominaleUtile: TDBEdit
        Left = 552
        Top = 72
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object eGTTipoTiraggio: TcxDBRadioGroup
        Left = 208
        Top = 164
        Cursor = crHandPoint
        Caption = ' Modalit'#224' evac. fumi '
        DataBinding.DataField = 'GENCAL_TIPOTIRAGGIO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Naturale'
            Value = 'Naturale'
          end
          item
            Caption = 'Forzato'
            Value = 'Forzato'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 60
        Width = 119
      end
      object eGTCombustibile: TcxDBRadioGroup
        Left = 6
        Top = 164
        Cursor = crHandPoint
        Caption = '  Combustibile  '
        DataBinding.DataField = 'GENCAL_COMBUSTIBILE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'GPL'
            Value = 'GPL'
          end
          item
            Caption = 'Gasolio'
            Value = 'Gasolio'
          end
          item
            Caption = 'Gas naturale'
            Value = 'Gas di rete'
          end
          item
            Caption = 'Altro'
            Value = 'Altro'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 60
        Width = 199
      end
      object PanelGTFabbricante: TPanel
        Left = 71
        Top = 36
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object DBComboBox1: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object PanelGTModello: TPanel
        Left = 71
        Top = 54
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object DBComboBox2: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object eGTTiraggio: TDBEdit
        Left = 503
        Top = 228
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'ANFUMI_TIRAGGIO_PA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eGTAcquaSanitaria: TcxDBCheckBox
        Left = 175
        Top = 227
        Caption = 'Produzione ACS'
        DataBinding.DataField = 'GENCAL_ACQUASANITARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eGTRiscaldamento: TcxDBCheckBox
        Left = 10
        Top = 227
        Caption = 'Climatizzazione invernale'
        DataBinding.DataField = 'GENCAL_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eGTPotNominaleFocolare: TDBEdit
        Left = 552
        Top = 54
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICAFOCOLARE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object eDataInstallazione: TcxDBDateEdit
        Left = 240
        Top = 16
        AutoSize = False
        DataBinding.DataField = 'GENCAL_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object eGruppoTermicoGT: TDBEdit
        Left = 107
        Top = 18
        Width = 45
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_GRUPPOTERMICO_GT'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object eTipoGruppoTermico: TcxDBRadioGroup
        Left = 342
        Top = 13
        Cursor = crHandPoint
        DataBinding.DataField = 'GENCAL_TIPOLOGIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Gruppo termico singolo'
            Value = 'SINGOLO'
          end
          item
            Caption = 'Tubo/nastro radiante'
            Value = 'TUBO/NASTRO'
          end
          item
            Caption = 'Gruppo termico modulare'
            Value = 'MODULARE'
          end
          item
            Caption = 'Generatore d'#39'aria calda'
            Value = 'ARIA CALDA'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 41
        Width = 307
      end
      object PanelDispComandoRegolasFunzionanti: TPanel
        Left = 332
        Top = 119
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 15
        DesignSize = (
          322
          17)
        object Label249: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Disp. di comando e regolaz. funzionanti correttam.te'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup13: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPCOMANDOREGOLAZFUNZCORR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelDispSicurezzaNonManomessi: TPanel
        Left = 332
        Top = 136
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 16
        DesignSize = (
          322
          17)
        object Label250: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Disp. di sicurezza non manomessi e/o cortocircuitati'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup14: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPSICUREZZANONMANOMESSI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelValvolaSicurezzaSoprìvrapress: TPanel
        Left = 332
        Top = 153
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 17
        DesignSize = (
          322
          17)
        object Label255: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Valvola di sicurezza alla sovrapress. a scarico libero'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup15: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VALVOLASICUREZZASOVRAPRESS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelScambPulito: TPanel
        Left = 332
        Top = 170
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 18
        DesignSize = (
          322
          17)
        object Label256: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Controllato e pulito lo scambiatore lato fumi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup16: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SCAMBLATOFUMOPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelPresRiflusso: TPanel
        Left = 332
        Top = 187
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 19
        DesignSize = (
          322
          17)
        object Label227: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Presenza riflusso dei prodotti della combustione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup18: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_NORIFLUSSIFUMILOCALE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object PanelRisultContrUNI10389: TPanel
        Left = 332
        Top = 204
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 20
        DesignSize = (
          322
          17)
        object Label231: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Risult.contr, sec. UNI 10389-1, conformi alla legge'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup19: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_RISCTRLUNI10389_1'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object dbeTipologia2: TcxDBRadioGroup
        Left = 6
        Top = 94
        Cursor = crHandPoint
        Caption = ' Tipologia '
        DataBinding.DataField = 'GENCAL_TIPOLOGIA2'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Tradizionale/Standard'
            Value = 'Tradizionale'
          end
          item
            Caption = 'Condensaz.'
            Value = 'Condensazione'
          end
          item
            Caption = 'Altro/Bassa temperatura'
            Value = 'Altro'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 60
        Width = 321
      end
      object eGTCombustibileAltro: TDBEdit
        Left = 155
        Top = 204
        Width = 45
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_COMBUSTIBILEALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeTipologia2Altro: TDBEdit
        Left = 187
        Top = 133
        Width = 135
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_TIPOLOGIA2_ALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE1_CheckList: TPanel
      Left = 1
      Top = 1910
      Width = 661
      Height = 117
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 17
      Visible = False
      object Label218: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CHECK-LIST'
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
      object Label223: TLabel
        Left = 6
        Top = 18
        Width = 648
        Height = 33
        AutoSize = False
        Caption = 
          'Elenco dei possibli interventi, dei quali va valutata la conveni' +
          'enza economica, che qualora applicabili all'#39'impianto, potrebbero' +
          ' comportare un miglioramento della prestazione energetica:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object cxDBCheckBox16: TcxDBCheckBox
        Left = 23
        Top = 45
        Caption = 'L'#39'adozione di valcole termostatiche sui corpi scaldanti'
        DataBinding.DataField = 'CHKLST_ADOZVALVTERMOST'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox26: TcxDBCheckBox
        Left = 23
        Top = 61
        Caption = 
          'L'#39'isolamento della rete di distribuzione nei locali non riscalda' +
          'ti'
        DataBinding.DataField = 'CHKLST_ISOLAMRETEDISTRIB'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox27: TcxDBCheckBox
        Left = 23
        Top = 77
        Caption = 
          'L'#39'introduzione di un sistema di trattamento dell'#39'acqua calda san' +
          'itaria e per il riscaldamento, ove assente'
        DataBinding.DataField = 'CHKLST_SISTTRATTAMACQUA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox28: TcxDBCheckBox
        Left = 23
        Top = 93
        Caption = 
          'La sostituzione di un sistema di regolazione on/off con un siste' +
          'ma programmabile su pi'#249' livelli di temperatura'
        DataBinding.DataField = 'CHKLST_SOSTSISTREGOLAZ'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE1_Lombardia_TH2O: TPanel
      Left = 1
      Top = 4458
      Width = 661
      Height = 105
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 7
      Visible = False
      object Shape38: TShape
        Left = 4
        Top = 5
        Width = 188
        Height = 47
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label173: TLabel
        Left = 5
        Top = 7
        Width = 186
        Height = 42
        Alignment = taCenter
        AutoSize = False
        Caption = 'Acqua di reintegro nel circuito dell'#39'impianto termico'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object Shape39: TShape
        Left = 191
        Top = 5
        Width = 95
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label174: TLabel
        Left = 192
        Top = 6
        Width = 93
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Esercizio'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape41: TShape
        Left = 285
        Top = 5
        Width = 124
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label175: TLabel
        Left = 286
        Top = 6
        Width = 122
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lettura iniziale (l)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape44: TShape
        Left = 408
        Top = 5
        Width = 124
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label176: TLabel
        Left = 409
        Top = 6
        Width = 122
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lettura finale (l)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape45: TShape
        Left = 531
        Top = 5
        Width = 125
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label177: TLabel
        Left = 532
        Top = 6
        Width = 123
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consumo totale (l)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape46: TShape
        Left = 191
        Top = 19
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label178: TLabel
        Left = 236
        Top = 20
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape47: TShape
        Left = 191
        Top = 35
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label179: TLabel
        Left = 236
        Top = 36
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape48: TShape
        Left = 4
        Top = 51
        Width = 188
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label185: TLabel
        Left = 5
        Top = 52
        Width = 186
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Nome prodotto trattamento acqua'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape49: TShape
        Left = 4
        Top = 81
        Width = 188
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape50: TShape
        Left = 4
        Top = 65
        Width = 188
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape51: TShape
        Left = 191
        Top = 51
        Width = 95
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label186: TLabel
        Left = 192
        Top = 52
        Width = 93
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Esercizio'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape52: TShape
        Left = 191
        Top = 65
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label187: TLabel
        Left = 236
        Top = 66
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape53: TShape
        Left = 191
        Top = 81
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label224: TLabel
        Left = 236
        Top = 82
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 16250871
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape54: TShape
        Left = 285
        Top = 51
        Width = 84
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label225: TLabel
        Left = 286
        Top = 52
        Width = 82
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Qt'#224' consumata'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape55: TShape
        Left = 368
        Top = 51
        Width = 34
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label233: TLabel
        Left = 369
        Top = 52
        Width = 32
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'u.m.'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape56: TShape
        Left = 401
        Top = 51
        Width = 89
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label238: TLabel
        Left = 402
        Top = 52
        Width = 87
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Circ.imp.termico'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape57: TShape
        Left = 489
        Top = 51
        Width = 84
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label241: TLabel
        Left = 490
        Top = 52
        Width = 82
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Circ.ACS'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape58: TShape
        Left = 572
        Top = 51
        Width = 84
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label257: TLabel
        Left = 573
        Top = 52
        Width = 82
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Altri ausiliari'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape59: TShape
        Left = 285
        Top = 35
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape60: TShape
        Left = 285
        Top = 19
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape61: TShape
        Left = 408
        Top = 35
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape62: TShape
        Left = 408
        Top = 19
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape63: TShape
        Left = 531
        Top = 35
        Width = 125
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape64: TShape
        Left = 531
        Top = 19
        Width = 125
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape65: TShape
        Left = 285
        Top = 81
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape66: TShape
        Left = 285
        Top = 65
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape67: TShape
        Left = 368
        Top = 81
        Width = 34
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape68: TShape
        Left = 368
        Top = 65
        Width = 34
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape69: TShape
        Left = 401
        Top = 65
        Width = 89
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape70: TShape
        Left = 401
        Top = 81
        Width = 89
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape71: TShape
        Left = 489
        Top = 65
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape72: TShape
        Left = 489
        Top = 81
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape73: TShape
        Left = 572
        Top = 65
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape74: TShape
        Left = 572
        Top = 81
        Width = 84
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object DBEdit1: TDBEdit
        Left = 192
        Top = 20
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO1_ESERCIZIO1'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit2: TDBEdit
        Left = 243
        Top = 20
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO1_ESERCIZIO2'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit3: TDBEdit
        Left = 192
        Top = 36
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO2_ESERCIZIO1'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit4: TDBEdit
        Left = 243
        Top = 36
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO2_ESERCIZIO2'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit5: TDBEdit
        Left = 5
        Top = 66
        Width = 186
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O1_NOMEPRODOTTO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit6: TDBEdit
        Left = 5
        Top = 82
        Width = 186
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O2_NOMEPRODOTTO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 66
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O1_ESERCIZIO1'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit8: TDBEdit
        Left = 243
        Top = 66
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O1_ESERCIZIO2'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit9: TDBEdit
        Left = 192
        Top = 82
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O2_ESERCIZIO1'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit11: TDBEdit
        Left = 243
        Top = 82
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O2_ESERCIZIO2'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit12: TDBEdit
        Left = 286
        Top = 20
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO1_LETTURAINIZIALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit13: TDBEdit
        Left = 286
        Top = 36
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO2_LETTURAINIZIALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit14: TDBEdit
        Left = 409
        Top = 20
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO1_LETTURAFINALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit15: TDBEdit
        Left = 409
        Top = 36
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO2_LETTURAFINALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit16: TDBEdit
        Left = 532
        Top = 20
        Width = 123
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO1_CONSUMOTOTALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit17: TDBEdit
        Left = 532
        Top = 36
        Width = 123
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'H2OREINTEGRO2_CONSUMOTOTALE'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit18: TDBEdit
        Left = 286
        Top = 66
        Width = 82
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O1_QTACONSUMATA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit19: TDBEdit
        Left = 286
        Top = 82
        Width = 82
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O2_QTACONSUMATA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit20: TDBEdit
        Left = 369
        Top = 66
        Width = 32
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O1_UM'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit21: TDBEdit
        Left = 369
        Top = 82
        Width = 32
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TH2O2_UM'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 22
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox4: TcxDBCheckBox
        Left = 435
        Top = 63
        DataBinding.DataField = 'TH2O1_CIRCUITO_IMPTERMICO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 15
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox5: TcxDBCheckBox
        Left = 435
        Top = 79
        DataBinding.DataField = 'TH2O2_CIRCUITO_IMPTERMICO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 23
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox6: TcxDBCheckBox
        Left = 522
        Top = 63
        DataBinding.DataField = 'TH2O1_CIRCUITO_ACS'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 16
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox7: TcxDBCheckBox
        Left = 522
        Top = 79
        DataBinding.DataField = 'TH2O2_CIRCUITO_ACS'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 24
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox8: TcxDBCheckBox
        Left = 605
        Top = 63
        DataBinding.DataField = 'TH2O1_CIRCUITO_ALTRO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 17
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox9: TcxDBCheckBox
        Left = 605
        Top = 79
        DataBinding.DataField = 'TH2O2_CIRCUITO_ALTRO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 25
        Transparent = True
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE1_Lombardia_GruppoTermico1: TPanel
      Left = 1
      Top = 4577
      Width = 661
      Height = 61
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 16
      Visible = False
      object Shape109: TShape
        Left = 332
        Top = 5
        Width = 324
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape110: TShape
        Left = 4
        Top = 5
        Width = 329
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label289: TLabel
        Left = 292
        Top = 9
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label290: TLabel
        Left = 313
        Top = 9
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label291: TLabel
        Left = 616
        Top = 9
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label292: TLabel
        Left = 636
        Top = 9
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Panel64: TPanel
        Left = 5
        Top = 24
        Width = 327
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          327
          17)
        object Label293: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Rispetta l'#39'indice di Bacharach:'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup1: TcxDBRadioGroup
          Left = 277
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_DICHCONFIMP'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel65: TPanel
        Left = 5
        Top = 41
        Width = 327
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          327
          17)
        object Label294: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'CO fumi secchi e senz'#39'aria <= 1000 ppm:'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup9: TcxDBRadioGroup
          Left = 277
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRETTOIMPIANTO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel66: TPanel
        Left = 333
        Top = 41
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          322
          17)
        object Label295: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = '- - -'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
          WordWrap = True
        end
        object cxDBRadioGroup10: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Visible = False
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel67: TPanel
        Left = 333
        Top = 24
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          322
          17)
        object Label296: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = 'Rendimento <= del rendimento minimo di legge'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup11: TcxDBRadioGroup
          Left = 273
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOCALD'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
    end
    object Panel_RCEE1_Lombardia_GruppoTermico2: TPanel
      Left = 1
      Top = 4653
      Width = 661
      Height = 104
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 23
      Visible = False
      object Shape112: TShape
        Left = 4
        Top = 5
        Width = 94
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label288: TLabel
        Left = 5
        Top = 6
        Width = 92
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Combustibile'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape113: TShape
        Left = 4
        Top = 35
        Width = 94
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape114: TShape
        Left = 4
        Top = 19
        Width = 94
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape115: TShape
        Left = 97
        Top = 5
        Width = 34
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label297: TLabel
        Left = 98
        Top = 6
        Width = 32
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'u.m.'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape116: TShape
        Left = 97
        Top = 35
        Width = 34
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape117: TShape
        Left = 97
        Top = 19
        Width = 34
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape118: TShape
        Left = 130
        Top = 5
        Width = 95
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label298: TLabel
        Left = 131
        Top = 6
        Width = 93
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Esercizio'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape119: TShape
        Left = 130
        Top = 19
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label299: TLabel
        Left = 175
        Top = 20
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape120: TShape
        Left = 130
        Top = 35
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label300: TLabel
        Left = 175
        Top = 36
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape121: TShape
        Left = 224
        Top = 5
        Width = 109
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label301: TLabel
        Left = 225
        Top = 6
        Width = 107
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Acquisti'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape122: TShape
        Left = 224
        Top = 35
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape123: TShape
        Left = 224
        Top = 19
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape124: TShape
        Left = 332
        Top = 5
        Width = 109
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label302: TLabel
        Left = 333
        Top = 6
        Width = 107
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Scorta iniziale'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape125: TShape
        Left = 332
        Top = 35
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape126: TShape
        Left = 332
        Top = 19
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape127: TShape
        Left = 440
        Top = 5
        Width = 109
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label303: TLabel
        Left = 441
        Top = 6
        Width = 107
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Scorta finale'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape128: TShape
        Left = 440
        Top = 35
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape129: TShape
        Left = 440
        Top = 19
        Width = 109
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape130: TShape
        Left = 548
        Top = 5
        Width = 108
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label304: TLabel
        Left = 549
        Top = 6
        Width = 106
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consumo'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape131: TShape
        Left = 548
        Top = 35
        Width = 108
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape132: TShape
        Left = 548
        Top = 19
        Width = 108
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape133: TShape
        Left = 4
        Top = 51
        Width = 188
        Height = 47
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label305: TLabel
        Left = 5
        Top = 53
        Width = 186
        Height = 42
        Alignment = taCenter
        AutoSize = False
        Caption = 'Elettricit'#224
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object Shape134: TShape
        Left = 191
        Top = 51
        Width = 95
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label306: TLabel
        Left = 192
        Top = 52
        Width = 93
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Esercizio'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape135: TShape
        Left = 285
        Top = 51
        Width = 124
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label307: TLabel
        Left = 286
        Top = 52
        Width = 122
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lettura iniziale (kWh)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape136: TShape
        Left = 408
        Top = 51
        Width = 124
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label308: TLabel
        Left = 409
        Top = 52
        Width = 122
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lettura finale (kWh)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape137: TShape
        Left = 531
        Top = 51
        Width = 125
        Height = 15
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label309: TLabel
        Left = 532
        Top = 52
        Width = 123
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consumo totale (kWh)'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        WordWrap = True
      end
      object Shape138: TShape
        Left = 191
        Top = 65
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label310: TLabel
        Left = 236
        Top = 66
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape139: TShape
        Left = 191
        Top = 81
        Width = 95
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Label311: TLabel
        Left = 236
        Top = 82
        Width = 4
        Height = 12
        Alignment = taCenter
        Caption = '/'
        Color = 15329769
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape140: TShape
        Left = 285
        Top = 81
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape141: TShape
        Left = 285
        Top = 65
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape142: TShape
        Left = 408
        Top = 81
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape143: TShape
        Left = 408
        Top = 65
        Width = 124
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape144: TShape
        Left = 531
        Top = 81
        Width = 125
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object Shape145: TShape
        Left = 531
        Top = 65
        Width = 125
        Height = 17
        Brush.Color = 15329769
        Pen.Color = clGray
      end
      object DBEdit48: TDBEdit
        Left = 5
        Top = 20
        Width = 92
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit49: TDBEdit
        Left = 5
        Top = 36
        Width = 92
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit50: TDBEdit
        Left = 98
        Top = 20
        Width = 32
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit51: TDBEdit
        Left = 98
        Top = 36
        Width = 32
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit52: TDBEdit
        Left = 131
        Top = 20
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit55: TDBEdit
        Left = 182
        Top = 20
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit56: TDBEdit
        Left = 131
        Top = 36
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit57: TDBEdit
        Left = 182
        Top = 36
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit62: TDBEdit
        Left = 225
        Top = 20
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit65: TDBEdit
        Left = 225
        Top = 36
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit66: TDBEdit
        Left = 333
        Top = 20
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit67: TDBEdit
        Left = 333
        Top = 36
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit68: TDBEdit
        Left = 441
        Top = 20
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit69: TDBEdit
        Left = 441
        Top = 36
        Width = 107
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit70: TDBEdit
        Left = 549
        Top = 20
        Width = 106
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit71: TDBEdit
        Left = 549
        Top = 36
        Width = 106
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit72: TDBEdit
        Left = 192
        Top = 66
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit73: TDBEdit
        Left = 243
        Top = 66
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit74: TDBEdit
        Left = 192
        Top = 82
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit75: TDBEdit
        Left = 243
        Top = 82
        Width = 42
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 22
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit76: TDBEdit
        Left = 286
        Top = 66
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit77: TDBEdit
        Left = 286
        Top = 82
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 23
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit78: TDBEdit
        Left = 409
        Top = 66
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit79: TDBEdit
        Left = 409
        Top = 82
        Width = 122
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 24
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit80: TDBEdit
        Left = 532
        Top = 66
        Width = 123
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit81: TDBEdit
        Left = 532
        Top = 82
        Width = 123
        Height = 15
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'TECNICO_TELEFONO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 25
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE2_ControlloImpianto: TPanel
      Left = 1
      Top = 690
      Width = 661
      Height = 97
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 24
      Visible = False
      object Shape75: TShape
        Left = 331
        Top = 20
        Width = 324
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape76: TShape
        Left = 6
        Top = 20
        Width = 326
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label258: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CONTROLLO DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object Label259: TLabel
        Left = 283
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label260: TLabel
        Left = 296
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label270: TLabel
        Left = 310
        Top = 24
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label273: TLabel
        Left = 609
        Top = 24
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label274: TLabel
        Left = 622
        Top = 24
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label277: TLabel
        Left = 636
        Top = 24
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Panel18: TPanel
        Left = 7
        Top = 39
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label278: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Locale di installazione idoneo'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup12: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_IDONLOCALEINSTALLAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel68: TPanel
        Left = 7
        Top = 56
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label279: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Dimensioni aperture di ventilazione adeguate'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup20: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ADEGDIMENSVENTILAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel69: TPanel
        Left = 7
        Top = 73
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          324
          17)
        object Label280: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Aperture di ventilazione libere da ostruzioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup23: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_APERTVENTILAZLIBERE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel70: TPanel
        Left = 332
        Top = 39
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          322
          17)
        object Label281: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Linee elettriche idonee'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup24: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ESAMEVISIVOLINEEELETTRICHE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel71: TPanel
        Left = 332
        Top = 56
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 4
        DesignSize = (
          322
          17)
        object Label282: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Coibentazioni ideonee'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup26: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCOIBENTAZIONI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel73: TPanel
        Left = 332
        Top = 73
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 5
      end
    end
    object Panel_RCEE2_GruppoFrigo: TPanel
      Left = 1
      Top = 1682
      Width = 661
      Height = 222
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 25
      Visible = False
      object Label283: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 
          ' CONTROLLO E VERIFICA ENERGETICA DEL GRUPPO FRIGO/POMPA DI CALOR' +
          'E   (Canc. per azzerare)'
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
      object Label284: TLabel
        Left = 6
        Top = 36
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Fabbricante'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label285: TLabel
        Left = 6
        Top = 54
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label286: TLabel
        Left = 6
        Top = 72
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label312: TLabel
        Left = 338
        Top = 54
        Width = 215
        Height = 12
        Caption = 'Potenza termica nominale in riscaldamento'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label314: TLabel
        Left = 338
        Top = 36
        Width = 229
        Height = 12
        Caption = 'Potenza frigorifera nominale in raffrescamento'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label315: TLabel
        Left = 166
        Top = 18
        Width = 72
        Height = 12
        Caption = 'Data installaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label316: TLabel
        Left = 6
        Top = 18
        Width = 78
        Height = 12
        Caption = 'Gruppo frigo GF'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label317: TLabel
        Left = 628
        Top = 36
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label318: TLabel
        Left = 628
        Top = 54
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape77: TShape
        Left = 331
        Top = 92
        Width = 324
        Height = 123
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label319: TLabel
        Left = 609
        Top = 96
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label320: TLabel
        Left = 622
        Top = 96
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label321: TLabel
        Left = 636
        Top = 96
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label329: TLabel
        Left = 338
        Top = 72
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'N'#176' circuiti'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label330: TLabel
        Left = 6
        Top = 91
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Servizi:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label331: TLabel
        Left = 6
        Top = 110
        Width = 137
        Height = 12
        Caption = 'Prova eseguita in modalit'#224':'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBEdit22: TDBEdit
        Left = 71
        Top = 72
        Width = 256
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit23: TDBEdit
        Left = 572
        Top = 54
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object dbeFrigoTipologia: TcxDBRadioGroup
        Left = 6
        Top = 129
        Cursor = crHandPoint
        Caption = ' Tipologia di generatore: '
        DataBinding.DataField = 'GENCAL_TIPOLOGIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Ad assorbimento per recupero del calore'
            Value = 'Ad assorbimento per recupero del calore'
          end
          item
            Caption = 'Ad assorb. a fiamma diretta con combust.'
            Value = 'Ad assorbimento a fiamma diretta con combustibile'
          end
          item
            Caption = 'A ciclo di compress. mot. elettrico'
            Value = 'A ciclo di compressione con motore elettrico'
          end
          item
            Caption = 'A ciclo di compress. mot. endoterm. comb.'
            Value = 'A ciclo di compressione con motore endotermico con combustibile'
          end>
        Properties.OnChange = cxDBRadioGroup28PropertiesChange
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 87
        Width = 322
      end
      object Panel72: TPanel
        Left = 71
        Top = 36
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object DBComboBox3: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object Panel74: TPanel
        Left = 71
        Top = 54
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object DBComboBox4: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object cxDBCheckBox10: TcxDBCheckBox
        Left = 254
        Top = 87
        Caption = 'Prod. ACS'
        DataBinding.DataField = 'GENCAL_ACQUASANITARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox11: TcxDBCheckBox
        Left = 51
        Top = 87
        Caption = 'Climat. invernale'
        DataBinding.DataField = 'GENCAL_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit25: TDBEdit
        Left = 572
        Top = 36
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'FRIGO_POTENZAFRIGORIFERA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object cxDBDateEdit3: TcxDBDateEdit
        Left = 240
        Top = 16
        AutoSize = False
        DataBinding.DataField = 'GENCAL_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object DBEdit26: TDBEdit
        Left = 107
        Top = 18
        Width = 45
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_GRUPPOTERMICO_GT'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object Panel75: TPanel
        Left = 332
        Top = 111
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 15
        DesignSize = (
          322
          17)
        object Label323: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Assenza perdite di gas refrigerante'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup30: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_CONTROLLOASSENZAFUGHEGAS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel76: TPanel
        Left = 332
        Top = 128
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 16
        DesignSize = (
          322
          17)
        object Label324: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Filtri puliti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup31: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_UGELLIPULITI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel77: TPanel
        Left = 332
        Top = 145
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 17
        DesignSize = (
          322
          17)
        object Label325: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Pres. app. aut. rilevaz. dir. fughe refrig. (leak det.)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup32: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPSICUREZZANONMANOMESSI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel78: TPanel
        Left = 332
        Top = 162
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 18
        DesignSize = (
          322
          17)
        object Label326: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Pres. app. aut. rilevaz. indir. fughe refrig. (par, term)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup33: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VALVOLASICUREZZASOVRAPRESS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel79: TPanel
        Left = 332
        Top = 179
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 19
        DesignSize = (
          322
          17)
        object Label327: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Scambiatori di calore puliti e liberi da incrostazioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup34: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SCAMBLATOFUMOPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object DBEdit28: TDBEdit
        Left = 396
        Top = 72
        Width = 45
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'FRIGO_NUMCIRCUITI'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox12: TcxDBCheckBox
        Left = 160
        Top = 87
        Caption = 'Climat. estiva'
        DataBinding.DataField = 'FRIGO_RAFFRESCAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox13: TcxDBCheckBox
        Left = 160
        Top = 106
        Caption = 'Raffrescam.'
        DataBinding.DataField = 'MODPROVA_RAFFRESCAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox14: TcxDBCheckBox
        Left = 254
        Top = 106
        Caption = 'Riscaldam.'
        DataBinding.DataField = 'MODPROVA_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object dbeFrigoCombustibileAltro: TDBEdit
        Left = 248
        Top = 165
        Width = 74
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_COMBUSTIBILEALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
    end
    object PanelFrigoAnalisiRendimento: TPanel
      Left = 1
      Top = 3572
      Width = 661
      Height = 99
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 26
      Visible = False
      object Shape78: TShape
        Left = 6
        Top = 22
        Width = 46
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape79: TShape
        Left = 465
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape80: TShape
        Left = 396
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape81: TShape
        Left = 327
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape82: TShape
        Left = 258
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape83: TShape
        Left = 189
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape84: TShape
        Left = 120
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape85: TShape
        Left = 51
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label322: TLabel
        Left = 7
        Top = 24
        Width = 44
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'N'#176' circuito'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label328: TLabel
        Left = 51
        Top = 24
        Width = 70
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'Surriscald.'#13#10'('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label336: TLabel
        Left = 118
        Top = 24
        Width = 75
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sottoraffred.'#13#10'('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label337: TLabel
        Left = 187
        Top = 24
        Width = 75
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T condens.'#13#10'('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label338: TLabel
        Left = 256
        Top = 24
        Width = 75
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T evapor.'#13#10'('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label339: TLabel
        Left = 328
        Top = 24
        Width = 71
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T ing. lato est. ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label340: TLabel
        Left = 394
        Top = 24
        Width = 71
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T usc. lato est. ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label341: TLabel
        Left = 463
        Top = 24
        Width = 75
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T ing. lato utenze ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape86: TShape
        Left = 603
        Top = 22
        Width = 52
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label342: TLabel
        Left = 601
        Top = 24
        Width = 57
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = ' P assorb. (kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape87: TShape
        Left = 534
        Top = 22
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label343: TLabel
        Left = 538
        Top = 24
        Width = 63
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T usc. lato utenze ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label414: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CONTROLLO DEL RENDIMENTO'
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
      object cxDBTextEdit13: TcxDBTextEdit
        Left = 10
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_TEMPFUMI'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 38
      end
      object cxDBTextEdit14: TcxDBTextEdit
        Left = 55
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_TEMPAMBIENTE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit15: TcxDBTextEdit
        Left = 124
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_O2_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit16: TcxDBTextEdit
        Left = 193
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_CO2_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit17: TcxDBTextEdit
        Left = 262
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_BACHARACH_NUM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit18: TcxDBTextEdit
        Left = 331
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_CO_PPM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit20: TcxDBTextEdit
        Left = 400
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_RENDIMENTO_PERC'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 58
      end
      object cxDBTextEdit21: TcxDBTextEdit
        Left = 468
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_RENDMINIMOLEGGE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit22: TcxDBTextEdit
        Left = 607
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_MODULOTERMICO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 44
      end
      object cxDBTextEdit23: TcxDBTextEdit
        Left = 538
        Top = 53
        AutoSize = False
        DataBinding.DataField = 'ANFUMI_NOX_PPM'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object Panel110: TPanel
        Left = 410
        Top = -3
        Width = 247
        Height = 16
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 10
        DesignSize = (
          247
          16)
        object cxDBRadioGroup71: TcxDBRadioGroup
          Left = -6
          Top = -8
          Cursor = crHandPoint
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataBinding.DataField = 'ANFUMI_EFFETTUATO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'EFFETTUATO'
              Value = 'T'
            end
            item
              Caption = 'NON EFFETTUATO'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Properties.OnChange = dbeAnalisiFumiEffettuataPropertiesChange
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsUltraFlat
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 261
        end
      end
    end
    object PanelFrigoAnalisiRendimentoEstLombardia: TPanel
      Left = 1
      Top = 3677
      Width = 661
      Height = 70
      BevelOuter = bvNone
      Color = 15329769
      ParentBackground = False
      TabOrder = 27
      object Shape88: TShape
        Left = 6
        Top = 6
        Width = 89
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label344: TLabel
        Left = 6
        Top = 8
        Width = 89
        Height = 53
        Alignment = taCenter
        AutoSize = False
        Caption = 'Se usata torre di raffraddamento o raffreddatore a fluido'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape89: TShape
        Left = 94
        Top = 6
        Width = 60
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label345: TLabel
        Left = 97
        Top = 8
        Width = 57
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T uscita fluido ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape90: TShape
        Left = 153
        Top = 6
        Width = 77
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label346: TLabel
        Left = 153
        Top = 8
        Width = 78
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T bulbo umido aria ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape91: TShape
        Left = 279
        Top = 6
        Width = 80
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label347: TLabel
        Left = 279
        Top = 8
        Width = 80
        Height = 53
        Alignment = taCenter
        AutoSize = False
        Caption = 'Se usato scambiatore di calore intermedio'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape92: TShape
        Left = 358
        Top = 6
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label348: TLabel
        Left = 359
        Top = 8
        Width = 71
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T ing. lato est. ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape93: TShape
        Left = 427
        Top = 6
        Width = 70
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label349: TLabel
        Left = 425
        Top = 8
        Width = 71
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T usc. lato est. ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape94: TShape
        Left = 496
        Top = 6
        Width = 80
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label350: TLabel
        Left = 494
        Top = 8
        Width = 85
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T ing. lato macchina ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Shape95: TShape
        Left = 575
        Top = 6
        Width = 80
        Height = 57
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label351: TLabel
        Left = 579
        Top = 8
        Width = 73
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = 'T usc. lato macchina ('#176'C)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object cxDBTextEdit24: TcxDBTextEdit
        Left = 98
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'TORAF_TEMPUSCFLUIDO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 52
      end
      object cxDBTextEdit25: TcxDBTextEdit
        Left = 157
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'TORAF_TEMPBULBOUMIDOARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 69
      end
      object cxDBTextEdit26: TcxDBTextEdit
        Left = 362
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'SCAMBINT_TEMPINGLATOEXT'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 62
      end
      object cxDBTextEdit27: TcxDBTextEdit
        Left = 431
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'SCAMBINT_TEMPUSCLATOEXT'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 58
      end
      object cxDBTextEdit28: TcxDBTextEdit
        Left = 499
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'SCAMBINT_TEMPINGLATOMACCHINA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 72
      end
      object cxDBTextEdit29: TcxDBTextEdit
        Left = 579
        Top = 37
        AutoSize = False
        DataBinding.DataField = 'SCAMBINT_TEMPUSCLATOMACCHINA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.BorderColor = 16250871
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
        Height = 23
        Width = 72
      end
    end
    object Panel_RCEE2_CheckList: TPanel
      Left = 1
      Top = 2033
      Width = 661
      Height = 117
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 28
      Visible = False
      object Label313: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CHECK-LIST'
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
      object Label352: TLabel
        Left = 6
        Top = 18
        Width = 648
        Height = 33
        AutoSize = False
        Caption = 
          'Elenco dei possibli interventi, dei quali va valutata la conveni' +
          'enza economica, che qualora applicabili all'#39'impianto, potrebbero' +
          ' comportare un miglioramento della prestazione energetica:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object cxDBCheckBox15: TcxDBCheckBox
        Left = 23
        Top = 45
        Caption = 
          'La sostituzione di generatori a regolazione on/off, con altri di' +
          ' pari potenza a pi'#249' gradini o a regolazione continua'
        DataBinding.DataField = 'CHKLST_ADOZVALVTERMOST'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox17: TcxDBCheckBox
        Left = 23
        Top = 93
        Caption = 
          'L'#39'isolamento dei canali di distribuzione aria fredda/calda nei l' +
          'ocali non climatizzati'
        DataBinding.DataField = 'CHKLST_ISOLAMRETEDISTRIB'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox18: TcxDBCheckBox
        Left = 23
        Top = 77
        Caption = 
          'L'#39'isolamento della rete di distribuzione acqua refrigerata/calda' +
          ' nei locali non climatizzati'
        DataBinding.DataField = 'CHKLST_SISTTRATTAMACQUA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox19: TcxDBCheckBox
        Left = 23
        Top = 61
        Caption = 
          'La sostituzione di un sistema di regolazione on/off con un siste' +
          'ma programmabile su pi'#249' livelli di temperatura'
        DataBinding.DataField = 'CHKLST_SOSTSISTREGOLAZ'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
    end
    object Panel_RCEE1B_ControlloImpianto: TPanel
      Left = 1
      Top = 788
      Width = 661
      Height = 139
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 29
      Visible = False
      object Shape97: TShape
        Left = 6
        Top = 20
        Width = 326
        Height = 113
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label184: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' CONTROLLO DELL'#39'IMPIANTO   (Canc. per azzerare)'
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
      object Label190: TLabel
        Left = 283
        Top = 19
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label353: TLabel
        Left = 296
        Top = 19
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label354: TLabel
        Left = 310
        Top = 19
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label355: TLabel
        Left = 609
        Top = 19
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label356: TLabel
        Left = 622
        Top = 19
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label357: TLabel
        Left = 636
        Top = 19
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape96: TShape
        Left = 331
        Top = 20
        Width = 324
        Height = 113
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Panel80: TPanel
        Left = 7
        Top = 31
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label358: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Per installazione interna: in locale idoneo'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup27: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_IDONLOCALEINSTALLAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel81: TPanel
        Left = 7
        Top = 48
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label359: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Per installazione esterna: generatori idonei'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup28: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_EXTINST_GENERATOREIDONEO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel82: TPanel
        Left = 7
        Top = 65
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          324
          17)
        object Label360: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Aperture di ventilaz./aeraz. libere da ostruzioni'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup29: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_APERTVENTILAZLIBERE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel83: TPanel
        Left = 332
        Top = 31
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 5
        DesignSize = (
          322
          17)
        object Label361: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Canale da fumo o condotti idonei (esame visivo)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup35: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ESAMEVISIVOCAMINO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel84: TPanel
        Left = 332
        Top = 48
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 6
        DesignSize = (
          322
          17)
        object Label362: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Sistema di regolazione temp. ambiente funzionante'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup36: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SISTIREGOLAZTEMPFUNZIONANTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel85: TPanel
        Left = 7
        Top = 82
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          324
          17)
        object Label363: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Adeguate dimensioni aperture di ventilaz./aeraz.'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup37: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ADEGDIMENSVENTILAZ'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel86: TPanel
        Left = 332
        Top = 65
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 7
        DesignSize = (
          322
          17)
        object Label364: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Idonea tenuta imp. int. e raccordi con il generatore'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup38: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_GUARNIZACCOPIAMINTEGRA'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel87: TPanel
        Left = 332
        Top = 82
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 8
        DesignSize = (
          322
          17)
        object Label365: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Pulizia camino effettuata secondo UNI 10847'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup39: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_ASSENZAPERDITECOMBLIQUIDO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel102: TPanel
        Left = 332
        Top = 114
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 10
        DesignSize = (
          322
          17)
        object Label171: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Organi soggetti a sollecitazione termiche integri'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup57: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_ORGSOGGSOLLECITAZTERMINTEGRI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel103: TPanel
        Left = 332
        Top = 98
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 9
        DesignSize = (
          322
          17)
        object Label172: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Presente separaz. idraulica tra generatori (se rich.)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup58: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_CERTUNI8364'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel104: TPanel
        Left = 7
        Top = 98
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 4
        DesignSize = (
          324
          17)
        object Label252: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Idoneit'#224' stoccaggio/deposito combustibile solido'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup59: TcxDBRadioGroup
          Left = 267
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'C_ESAMEVISIVOLINEEELETTRICHE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
    end
    object Panel_RCEE1B_GruppoTermico: TPanel
      Left = 1
      Top = 1328
      Width = 661
      Height = 323
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 30
      Visible = False
      object Shape100: TShape
        Left = 5
        Top = 176
        Width = 651
        Height = 139
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label366: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 
          ' CONTROLLO E VERIFICA ENERGETICA DEL GRUPPO TERMICO   (Canc. per' +
          ' azzerare)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitLeft = -133
        ExplicitTop = -147
      end
      object Label367: TLabel
        Left = 6
        Top = 36
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Fabbricante'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label368: TLabel
        Left = 336
        Top = 36
        Width = 67
        Height = 14
        AutoSize = False
        Caption = 'Modello'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label369: TLabel
        Left = 6
        Top = 54
        Width = 55
        Height = 14
        AutoSize = False
        Caption = 'Matricola'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label370: TLabel
        Left = 336
        Top = 18
        Width = 122
        Height = 12
        Caption = 'Pot. term. nominale utile'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label371: TLabel
        Left = 336
        Top = 54
        Width = 159
        Height = 12
        Caption = 'Depressione nel canale da fumo'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label373: TLabel
        Left = 166
        Top = 18
        Width = 72
        Height = 12
        Caption = 'Data installaz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label374: TLabel
        Left = 6
        Top = 18
        Width = 95
        Height = 12
        Caption = 'Gruppo termico GT'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label376: TLabel
        Left = 521
        Top = 18
        Width = 23
        Height = 12
        Caption = '(kW)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label380: TLabel
        Left = 558
        Top = 54
        Width = 21
        Height = 12
        Caption = '(Pa)'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label372: TLabel
        Left = 16
        Top = 159
        Width = 41
        Height = 12
        Caption = 'Servizi: '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Shape99: TShape
        Left = 5
        Top = 73
        Width = 651
        Height = 104
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape98: TShape
        Left = 332
        Top = 176
        Width = 324
        Height = 120
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label377: TLabel
        Left = 610
        Top = 180
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label378: TLabel
        Left = 623
        Top = 180
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label379: TLabel
        Left = 637
        Top = 180
        Width = 17
        Height = 12
        Caption = 'n.c.'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object DBEdit24: TDBEdit
        Left = 71
        Top = 54
        Width = 256
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_MATRICOLA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object DBEdit27: TDBEdit
        Left = 465
        Top = 18
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_POTENZATERMICA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object Panel88: TPanel
        Left = 71
        Top = 36
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'PanelCostruttore'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object DBComboBox5: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_COSTRUTTORE'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_CostruttoreDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object Panel89: TPanel
        Left = 382
        Top = 36
        Width = 256
        Height = 14
        BevelOuter = bvNone
        Caption = 'Panel1'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        object DBComboBox6: TDBComboBox
          Left = -2
          Top = -3
          Width = 261
          Height = 20
          Color = 16250871
          DataField = 'GENCAL_MODELLO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnDropDown = GenCal_ModelloDropDown
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object DBEdit29: TDBEdit
        Left = 502
        Top = 54
        Width = 50
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'ANFUMI_TIRAGGIO_PA'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox20: TcxDBCheckBox
        Left = 251
        Top = 155
        Caption = 'Produzione ACS'
        DataBinding.DataField = 'GENCAL_ACQUASANITARIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox21: TcxDBCheckBox
        Left = 64
        Top = 155
        Caption = 'Climatizzazione invernale'
        DataBinding.DataField = 'GENCAL_RISCALDAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBDateEdit4: TcxDBDateEdit
        Left = 240
        Top = 16
        AutoSize = False
        DataBinding.DataField = 'GENCAL_DATAINSTALLAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsNone
        Style.Color = 16250871
        Style.Edges = []
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 18
        Width = 90
      end
      object DBEdit31: TDBEdit
        Left = 107
        Top = 18
        Width = 45
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_GRUPPOTERMICO_GT'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBRadioGroup42: TcxDBRadioGroup
        Left = 7
        Top = 74
        Cursor = crHandPoint
        DataBinding.DataField = 'GENCAL_TIPOLOGIA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 4
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Caldaia (UNI EN 303-5)'
            Value = 'Caldaia (UNI EN 303-5)'
          end
          item
            Caption = 'Stufa (UNI EN 13240)'
            Value = 'Stufa (UNI EN 13240)'
          end
          item
            Caption = 'Stufa ad acc. (U.EN 15250)'
            Value = 'Stufa ad accumulo (UNI EN 15250)'
          end
          item
            Caption = 'Termocucina (U.EN 12815)'
            Value = 'Termocucina (UNI EN 12815)'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 7
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 20
        Width = 647
      end
      object cxDBRadioGroup49: TcxDBRadioGroup
        Left = 7
        Top = 134
        Cursor = crHandPoint
        DataBinding.DataField = 'GENCAL_TIPOLOGIA2'
        DataBinding.DataSource = SourceAll
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Tradizionale'
            Value = 'Tradizionale'
          end
          item
            Caption = 'A condensazione'
            Value = 'Condensazione'
          end
          item
            Caption = 'Altro'
            Value = 'Altro'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsNone
        Style.Color = 14541539
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 11
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 20
        Width = 647
      end
      object DBEdit33: TDBEdit
        Left = 501
        Top = 138
        Width = 150
        Height = 13
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_TIPOLOGIA2_ALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBRadioGroup40: TcxDBRadioGroup
        Left = 7
        Top = 94
        Cursor = crHandPoint
        DataBinding.DataField = 'GENCAL_TIPOCAMERA'
        DataBinding.DataSource = SourceAll
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Caminetto aperto (UNI EN 13229)'
            Value = 'Caminetto aperto (UNI EN 13229)'
          end
          item
            Caption = 'Caminetto chiuso (UNI EN 13229)'
            Value = 'Caminetto chiuso (UNI EN 13229)'
          end
          item
            Caption = 'Inserto caminetto (UNI EN 13229)'
            Value = 'Inserto caminetto (UNI EN 13229)'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsNone
        Style.Color = 14541539
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 8
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 20
        Width = 647
      end
      object cxDBRadioGroup41: TcxDBRadioGroup
        Left = 7
        Top = 114
        Cursor = crHandPoint
        DataBinding.DataField = 'GENCAL_TIPOTIRAGGIO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Stufa assemb. in opera (U.EN 15544)'
            Value = 'Stufa assemblata in opera (UNI EN 15544)'
          end
          item
            Caption = 'Stufa a pellet (UNI EN 14785)'
            Value = 'Stufa a pellet (UNI EN 14785)'
          end
          item
            Caption = 'Altro'
            Value = 'Altro'
          end>
        Style.BorderColor = clGray
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 9
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 20
        Width = 647
      end
      object DBEdit30: TDBEdit
        Left = 501
        Top = 118
        Width = 150
        Height = 13
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'GENCAL_TIPOTIRAGGIO_ALTRO'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object cxDBCheckBox22: TcxDBCheckBox
        Left = 435
        Top = 155
        Caption = 'Cucina'
        DataBinding.DataField = 'GENCAL_CUCINA'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 15
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
      end
      object Panel90: TPanel
        Left = 333
        Top = 195
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 24
        DesignSize = (
          322
          17)
        object Label381: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Disp. di comando e regolaz. funzionanti correttam.te'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup43: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPCOMANDOREGOLAZFUNZCORR'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel91: TPanel
        Left = 333
        Top = 212
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 25
        DesignSize = (
          322
          17)
        object Label382: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Disp. di sicurezza non manomessi e/o cortocircuitati'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup44: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_DISPSICUREZZANONMANOMESSI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel92: TPanel
        Left = 333
        Top = 229
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 26
        DesignSize = (
          322
          17)
        object Label383: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Valvola di sicurezza alla sovrapress. a scarico libero'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup45: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VALVOLASICUREZZASOVRAPRESS'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel93: TPanel
        Left = 333
        Top = 246
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 27
        DesignSize = (
          322
          17)
        object Label384: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Controllato e pulito lo scambiatore lato fumi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup46: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_SCAMBLATOFUMOPULITO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel94: TPanel
        Left = 333
        Top = 263
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 28
        DesignSize = (
          322
          17)
        object Label385: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Presenza riflusso dei prodotti della combustione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup47: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'E_NORIFLUSSIFUMILOCALE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel95: TPanel
        Left = 333
        Top = 280
        Width = 322
        Height = 15
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 29
        DesignSize = (
          322
          15)
        object Label386: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 11
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Risult.contr, sec. UNI 10683, conformi alla legge'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
          ExplicitHeight = 13
        end
        object cxDBRadioGroup48: TcxDBRadioGroup
          Left = 268
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'G_RISCTRLUNI10389_1'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel14: TPanel
        Left = 7
        Top = 195
        Width = 323
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 17
        DesignSize = (
          323
          17)
        object Label375: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Marcatura CE apparecchio'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup50: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          DataBinding.DataField = 'GENCAL_MARCATURACE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Presente'
              Value = 'Presente'
            end
            item
              Caption = 'Assente'
              Value = 'Assente'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel96: TPanel
        Left = 7
        Top = 212
        Width = 323
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 18
        DesignSize = (
          323
          17)
        object Label387: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Placca camino'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup51: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'GENCAL_PLACCACAMINO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Presente'
              Value = 'Presente'
            end
            item
              Caption = 'Assente'
              Value = 'Assente'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel97: TPanel
        Left = 7
        Top = 229
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 19
        DesignSize = (
          322
          17)
        object Label388: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Modalit'#224' di evacuaz. fumi'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup52: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          DataBinding.DataField = 'GENCAL_MODEVACUAZFUMI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Naturale'
              Value = 'Naturale'
            end
            item
              Caption = 'Forzata'
              Value = 'Forzata'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel98: TPanel
        Left = 7
        Top = 246
        Width = 323
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 20
        DesignSize = (
          323
          17)
        object Label389: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Aria comburente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup53: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'GENCAL_ARIACOMBURENTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Da esterno'
              Value = 'Da esterno'
            end
            item
              Caption = 'Da locale inst.'
              Value = 'Da loc.ins'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel99: TPanel
        Left = 7
        Top = 263
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 21
        DesignSize = (
          322
          17)
        object Label390: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Controllo aria comburente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup54: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          DataBinding.DataField = 'GENCAL_CONTRARIACOMBURENTE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Aut.'
              Value = 'Automatico'
            end
            item
              Caption = 'SemiA.'
              Value = 'Semiautom.'
            end
            item
              Caption = 'Man.'
              Value = 'Manuale'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel100: TPanel
        Left = 7
        Top = 280
        Width = 323
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 22
        DesignSize = (
          323
          17)
        object Label391: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Caricamento combustibile'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup55: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'GENCAL_CARICACOMBUSTIBILE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Aut.'
              Value = 'Automatico'
            end
            item
              Caption = 'Man.'
              Value = 'Manuale'
            end
            item
              Caption = 'Au/Man'
              Value = 'Aut./Man.'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
      object Panel101: TPanel
        Left = 7
        Top = 297
        Width = 647
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 23
        DesignSize = (
          647
          17)
        object Label392: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Combustibile'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup56: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          DataBinding.DataField = 'GENCAL_COMBUSTIBILE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 5
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Legna'
              Value = 'Legna'
            end
            item
              Caption = 'Pellet'
              Value = 'Pellet'
            end
            item
              Caption = 'Bricchette'
              Value = 'Bricchette'
            end
            item
              Caption = 'Cippato'
              Value = 'Cippato'
            end
            item
              Caption = 'Altro'
              Value = 'Altro'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 431
        end
        object DBEdit34: TDBEdit
          Left = 544
          Top = 2
          Width = 102
          Height = 12
          AutoSize = False
          BorderStyle = bsNone
          Color = 16250871
          Ctl3D = False
          DataField = 'GENCAL_COMBUSTIBILEALTRO'
          DataSource = SourceAll
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
        end
      end
      object Panel105: TPanel
        Left = 7
        Top = 178
        Width = 323
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 16
        DesignSize = (
          323
          17)
        object Label404: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Vaso di espansione'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup65: TcxDBRadioGroup
          Left = 141
          Top = -9
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'F_VASOESPANSIONECARICO'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Aperto'
              Value = 'T'
            end
            item
              Caption = 'Chiuso'
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 182
        end
      end
    end
    object Panel_RCEE1B_Toscana_DocTecnicaCorredo: TPanel
      Left = 1
      Top = 445
      Width = 661
      Height = 67
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
      object Shape103: TShape
        Left = 331
        Top = 3
        Width = 324
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape104: TShape
        Left = 6
        Top = 3
        Width = 326
        Height = 55
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label395: TLabel
        Left = 287
        Top = 7
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label396: TLabel
        Left = 299
        Top = 7
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label397: TLabel
        Left = 610
        Top = 7
        Width = 8
        Height = 12
        Caption = 'si'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label398: TLabel
        Left = 622
        Top = 7
        Width = 12
        Height = 12
        Caption = 'no'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label265: TLabel
        Left = 315
        Top = 7
        Width = 12
        Height = 12
        Caption = 'na'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label403: TLabel
        Left = 637
        Top = 7
        Width = 12
        Height = 12
        Caption = 'na'
        Color = 14015197
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Panel106: TPanel
        Left = 7
        Top = 22
        Width = 324
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          324
          17)
        object Label399: TLabel
          Left = 5
          Top = 2
          Width = 269
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Istruzioni uso e manutenzione dell'#39'impianto presenti'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup61: TcxDBRadioGroup
          Left = 270
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_LIBRUSOBRUCIATORE'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 2
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 38
        end
      end
      object Panel107: TPanel
        Left = 7
        Top = 39
        Width = 324
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          324
          17)
        object Label400: TLabel
          Left = 5
          Top = 2
          Width = 254
          Height = 13
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'SCIA o CPI antincendio'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup62: TcxDBRadioGroup
          Left = 270
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_CERTPREVINCENDI'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'T'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel108: TPanel
        Left = 332
        Top = 39
        Width = 322
        Height = 17
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          322
          17)
        object Label401: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = 'Pratica INAIL (ex ISPESL)'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup63: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_PRATICAISPESL'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
      object Panel109: TPanel
        Left = 332
        Top = 22
        Width = 322
        Height = 17
        BevelOuter = bvNone
        Color = 14541539
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          322
          17)
        object Label402: TLabel
          Left = 5
          Top = 2
          Width = 270
          Height = 13
          AutoSize = False
          Caption = 'Documentazione art. 284 del Dlgs 152/06 presente'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
        end
        object cxDBRadioGroup64: TcxDBRadioGroup
          Left = 268
          Top = -8
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          DataBinding.DataField = 'B_RAPPCONTRTECN10435'
          DataBinding.DataSource = SourceAll
          ParentFont = False
          Properties.ClearKey = 46
          Properties.Columns = 3
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Value = 'T'
            end
            item
              Value = 'F'
            end
            item
              Value = 'N'
            end>
          Properties.ReadOnly = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -9
          Style.Font.Name = 'Verdana'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clGray
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnEnter = dbePropRagSocEnter
          OnExit = dbePropRagSocExit
          Height = 31
          Width = 54
        end
      end
    end
    object PanelTermoregolazione: TPanel
      Left = 1
      Top = 4763
      Width = 661
      Height = 107
      BevelOuter = bvNone
      Color = 15329769
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 31
      Visible = False
      DesignSize = (
        661
        107)
      object Label405: TLabel
        Left = 0
        Top = 0
        Width = 661
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 
          ' SISTEMI DI TERMOREGOLAZIONE E CONTABILIZZAZIONE DEL CALORE (sol' +
          'o per impianti centralizzati)'
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
      object Label406: TLabel
        Left = 6
        Top = 23
        Width = 105
        Height = 12
        Caption = 'Tipo di distribuzione:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label407: TLabel
        Left = 6
        Top = 45
        Width = 90
        Height = 12
        Caption = 'Contabilizzazione:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label408: TLabel
        Left = 101
        Top = 45
        Width = 144
        Height = 12
        Caption = 'Unit'#224' immobiliari contabilizz.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label409: TLabel
        Left = 371
        Top = 45
        Width = 109
        Height = 12
        Caption = 'Tipologia contabilizz.:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label410: TLabel
        Left = 6
        Top = 67
        Width = 92
        Height = 12
        Caption = 'Termoregolazione:'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label411: TLabel
        Left = 101
        Top = 67
        Width = 139
        Height = 12
        Caption = 'Valvole termostatiche pres.'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label412: TLabel
        Left = 371
        Top = 67
        Width = 163
        Height = 12
        Caption = 'Altri sistemi di termoregolazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label413: TLabel
        Left = 6
        Top = 88
        Width = 373
        Height = 12
        Caption = 
          'Corretto funzionamento dei sistemi di contabilizzazione e termor' +
          'egolazione'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object cxDBRadioGroup69: TcxDBRadioGroup
        Left = 384
        Top = 78
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CONTREG_CORRETTOFUNZIONAMENTO'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'si'
            Value = 'T'
          end
          item
            Caption = 'no'
            Value = 'F'
          end
          item
            Caption = 'na'
            Value = 'N'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 5
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 31
        Width = 114
      end
      object cxDBRadioGroup66: TcxDBRadioGroup
        Left = 243
        Top = 35
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CONTREG_UNITAIMMCONTABILIZATE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'si'
            Value = 'T'
          end
          item
            Caption = 'no'
            Value = 'F'
          end
          item
            Caption = 'na'
            Value = 'N'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 31
        Width = 114
      end
      object cxDBRadioGroup67: TcxDBRadioGroup
        Left = 482
        Top = 35
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CONTREG_TIPOCONTABILIZZAZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Diretta'
            Value = 'D'
          end
          item
            Caption = 'Indiretta'
            Value = 'I'
          end
          item
            Caption = 'na'
            Value = 'N'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 31
        Width = 216
      end
      object cxDBRadioGroup68: TcxDBRadioGroup
        Left = 243
        Top = 57
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CONTREG_VALVOLETERMOSTATPRES'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 3
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'si'
            Value = 'T'
          end
          item
            Caption = 'no'
            Value = 'F'
          end
          item
            Caption = 'na'
            Value = 'N'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 3
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 31
        Width = 114
      end
      object DBEdit32: TDBEdit
        Left = 542
        Top = 67
        Width = 112
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Color = 16250871
        Ctl3D = False
        DataField = 'CONTREG_ALTRISISTTERMOREGOLAZ'
        DataSource = SourceAll
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        OnKeyPress = dbeAnFumi_TempFumiKeyPress
      end
      object cxDBRadioGroup70: TcxDBRadioGroup
        Left = 117
        Top = 13
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CONTREG_TIPODISTRIBUZIONE'
        DataBinding.DataSource = SourceAll
        ParentFont = False
        Properties.ClearKey = 46
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'A distribuzione verticale'
            Value = 'V'
          end
          item
            Caption = 'A distribuzione orizzontale'
            Value = 'O'
          end>
        Properties.ReadOnly = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = dbePropRagSocEnter
        OnExit = dbePropRagSocExit
        Height = 31
        Width = 331
      end
    end
  end
  inherited FormMainPanel: TPanel
    Left = 688
    Top = 114
    ExplicitLeft = 688
    ExplicitTop = 114
    inherited SplitterAllegati: TcxSplitter
      Width = 537
      ExplicitWidth = 537
    end
  end
  object QryAll: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'AM.ID=REQUIRED'
      'AM.TIPO=REQUIRED')
    DeleteSQL.Strings = (
      'DELETE FROM ALLEGATI_MANUT'
      'WHERE '
      '  ID = :OLD_ID')
    EditSQL.Strings = (
      'UPDATE ALLEGATI_MANUT SET'
      '      ID = :ID,'
      '      TIPO = :TIPO,'
      '      STATOAVANZAMENTO = :STATOAVANZAMENTO,'
      '      COPIE = :COPIE,'
      '      DATACONTROLLO = :DATACONTROLLO,'
      '      DATAORAARRIVO = :DATAORAARRIVO,'
      '      DATAORAPARTENZA = :DATAORAPARTENZA,'
      '      IDIMPEGNO = :IDIMPEGNO,'
      '      CODICECATASTO = :CODICECATASTO,'
      '      CODICEISTATCOMUNEIMM = :CODICEISTATCOMUNEIMM,'
      '      COMUNEIMM = :COMUNEIMM,'
      '      CAPIMM = :CAPIMM,'
      '      ZONAIMM = :ZONAIMM,'
      '      INDIRIZZOIMM = :INDIRIZZOIMM,'
      '      NUMCIVICOIMM = :NUMCIVICOIMM,'
      '      PIANOIMM = :PIANOIMM,'
      '      INTERNOIMM = :INTERNOIMM,'
      '      SCALAIMM = :SCALAIMM,'
      '      PALAZZOIMM = :PALAZZOIMM,'
      '      PROVINCIAIMM = :PROVINCIAIMM,'
      '      CodiceRespImp = :CodiceRespImp,'
      '      RagSocRespImp = :RagSocRespImp,'
      '      IndirizzoRespImp = :IndirizzoRespImp,'
      '      NumCivicoRespImp = :NumCivicoRespImp,'
      '      CapRespImp = :CapRespImp,'
      '      CittaRespImp = :CittaRespImp,'
      '      ProvinciaRespImp = :ProvinciaRespImp,'
      '      TelefonoRespImp = :TelefonoRespImp,'
      '      CellulareRespImp = :CellulareRespImp,'
      '      CodiceFiscaleRespImp = :CodiceFiscaleRespImp,'
      '      InQualitaDiRespImp = :InQualitaDiRespImp,'
      '      PropCodice = :PropCodice,'
      '      PropDenominazione = :PropDenominazione,'
      '      PropIndirizzo = :PropIndirizzo,'
      '      PropNumCivico = :PropNumCivico,'
      '      PropCAP = :PropCAP,'
      '      PropLocalita = :PropLocalita,'
      '      PropProvincia = :PropProvincia,'
      '      PropTelefono = :PropTelefono,'
      '      PropCellulare = :PropCellulare,'
      '      PropCodiceFiscale = :PropCodiceFiscale,'
      '      GENCAL_ID = :GENCAL_ID,'
      '      GENCAL_COSTRUTTORE = :GENCAL_COSTRUTTORE,'
      '      GENCAL_MODELLO = :GENCAL_MODELLO,'
      '      GENCAL_MATRICOLA = :GENCAL_MATRICOLA,'
      '      GENCAL_TIPOLOGIA = :GENCAL_TIPOLOGIA,'
      '      GENCAL_TIPOCAMERA = :GENCAL_TIPOCAMERA,'
      '      GENCAL_TIPOTIRAGGIO = :GENCAL_TIPOTIRAGGIO,'
      '      GENCAL_TIPOTIRAGGIO_ALTRO = :GENCAL_TIPOTIRAGGIO_ALTRO,'
      '      GENCAL_ANNOCOSTRUZIONE = :GENCAL_ANNOCOSTRUZIONE,'
      
        '      GENCAL_POTENZATERMICAFOCOLARE = :GENCAL_POTENZATERMICAFOCO' +
        'LARE,'
      '      GENCAL_POTENZATERMICA = :GENCAL_POTENZATERMICA,'
      
        '      GENCAL_MARCAEFFICENERGETICA = :GENCAL_MARCAEFFICENERGETICA' +
        ','
      '      GENCAL_RISCALDAMENTO = :GENCAL_RISCALDAMENTO,'
      '      GENCAL_ACQUASANITARIA = :GENCAL_ACQUASANITARIA,'
      '      GENCAL_CUCINA = :GENCAL_CUCINA,'
      '      GENCAL_COMBUSTIBILE = :GENCAL_COMBUSTIBILE,'
      '      GENCAL_COMBUSTIBILEALTRO = :GENCAL_COMBUSTIBILEALTRO,'
      '      GENCAL_UBICAZIONE = :GENCAL_UBICAZIONE,'
      '      GENCAL_DATAINSTALLAZIONE = :GENCAL_DATAINSTALLAZIONE,'
      '      GENCAL_VOLUMETRIARISC = :GENCAL_VOLUMETRIARISC,'
      '      GENCAL_FLUIDOTERMOVETTORE = :GENCAL_FLUIDOTERMOVETTORE,'
      '      GENCAL_CONSUMI1_STAGIONE = :GENCAL_CONSUMI1_STAGIONE,'
      '      GENCAL_CONSUMI1_M3KG = :GENCAL_CONSUMI1_M3KG,'
      '      GENCAL_CONSUMI2_STAGIONE = :GENCAL_CONSUMI2_STAGIONE,'
      '      GENCAL_CONSUMI2_M3KG = :GENCAL_CONSUMI2_M3KG,'
      '      GENCAL_MARCATURACE = :GENCAL_MARCATURACE,'
      '      GENCAL_PLACCACAMINO = :GENCAL_PLACCACAMINO,'
      '      GENCAL_MODEVACUAZFUMI = :GENCAL_MODEVACUAZFUMI,'
      '      GENCAL_ARIACOMBURENTE = :GENCAL_ARIACOMBURENTE,'
      '      GENCAL_CONTRARIACOMBURENTE = :GENCAL_CONTRARIACOMBURENTE,'
      '      GENCAL_CARICACOMBUSTIBILE = :GENCAL_CARICACOMBUSTIBILE,'
      '      BRUC_ID = :BRUC_ID,'
      '      BRUC_COSTRUTTORE = :BRUC_COSTRUTTORE,'
      '      BRUC_MODELLO = :BRUC_MODELLO,'
      '      BRUC_MATRICOLA = :BRUC_MATRICOLA,'
      '      BRUC_TIPOLOGIA = :BRUC_TIPOLOGIA,'
      '      BRUC_ANNOCOSTRUZIONE = :BRUC_ANNOCOSTRUZIONE,'
      '      BRUC_DATAINSTALLAZIONE = :BRUC_DATAINSTALLAZIONE,'
      '      BRUC_CAMPOFUNZIONAMENTO = :BRUC_CAMPOFUNZIONAMENTO,'
      '      BRUC_CAMPOFUNZIONAMENTO2 = :BRUC_CAMPOFUNZIONAMENTO2,'
      '      B_LIBRETTOIMPIANTO = :B_LIBRETTOIMPIANTO,'
      '      B_LIBRETTOIMPIANTO_NOTE = :B_LIBRETTOIMPIANTO_NOTE,'
      '      B_RAPPCONTRTECN10435 = :B_RAPPCONTRTECN10435,'
      '      B_RAPPCONTRTECN10435_NOTE = :B_RAPPCONTRTECN10435_NOTE,'
      '      B_DICHCONFIMP = :B_DICHCONFIMP,'
      '      B_DICHCONFIMP_NOTE = :B_DICHCONFIMP_NOTE,'
      '      B_LIBRUSOCALD = :B_LIBRUSOCALD,'
      '      B_LIBRUSOCALD_NOTE = :B_LIBRUSOCALD_NOTE,'
      '      B_LIBRUSOBRUCIATORE = :B_LIBRUSOBRUCIATORE,'
      '      B_LIBRUSOBRUCIATORE_NOTE = :B_LIBRUSOBRUCIATORE_NOTE,'
      '      B_PRATICAISPESL = :B_PRATICAISPESL,'
      '      B_PRATICAISPESL_NOTE = :B_PRATICAISPESL_NOTE,'
      '      B_CERTPREVINCENDI = :B_CERTPREVINCENDI,'
      '      B_CERTPREVINCENDI_NOTE = :B_CERTPREVINCENDI_NOTE,'
      '      B_CERTUNI8364 = :B_CERTUNI8364,'
      '      B_CERTUNI8364_NOTE = :B_CERTUNI8364_NOTE,'
      '      B_SCHEMIFUNZIDRAUL = :B_SCHEMIFUNZIDRAUL,'
      '      B_SCHEMIFUNZIDRAUL_NOTE = :B_SCHEMIFUNZIDRAUL_NOTE,'
      '      B_SCHEMIFUNZELETTR = :B_SCHEMIFUNZELETTR,'
      '      B_SCHEMIFUNZELETTR_NOTE = :B_SCHEMIFUNZELETTR_NOTE,'
      '      C_IDONLOCALEINSTALLAZ = :C_IDONLOCALEINSTALLAZ,'
      '      C_ADEGDIMENSVENTILAZ = :C_ADEGDIMENSVENTILAZ,'
      '      C_APERTVENTILAZLIBERE = :C_APERTVENTILAZLIBERE,'
      
        '      C_ESAMEVISIVOLINEEELETTRICHE = :C_ESAMEVISIVOLINEEELETTRIC' +
        'HE,'
      '      C_BRUCFUNZIONAMCORRETTO = :C_BRUCFUNZIONAMCORRETTO,'
      '      D_PENDENZACORRETTA = :D_PENDENZACORRETTA,'
      '      D_SEZIONICORRETTE = :D_SEZIONICORRETTE,'
      '      D_CURVECORRETTE = :D_CURVECORRETTE,'
      '      D_LUNGHEZZACORRETTA = :D_LUNGHEZZACORRETTA,'
      '      D_BUONOSTATOCONSERVAZ = :D_BUONOSTATOCONSERVAZ,'
      '      E_SCARICOCAMINOSINGOLO = :E_SCARICOCAMINOSINGOLO,'
      '      E_SCARICOCANNAFUMCOLLRAMIF = :E_SCARICOCANNAFUMCOLLRAMIF,'
      '      E_APPSCARICAAPARETE = :E_APPSCARICAAPARETE,'
      '      E_NORIFLUSSIFUMILOCALE = :E_NORIFLUSSIFUMILOCALE,'
      '      E_NOPERDITECONDOTTISCARICO = :E_NOPERDITECONDOTTISCARICO,'
      '      F_UGELLIPULITI = :F_UGELLIPULITI,'
      '      F_SCAMBLATOFUMOPULITO = :F_SCAMBLATOFUMOPULITO,'
      '      F_ACCENSFUNZAMREGOLARI = :F_ACCENSFUNZAMREGOLARI,'
      
        '      F_DISPCOMANDOREGOLAZFUNZCORR = :F_DISPCOMANDOREGOLAZFUNZCO' +
        'RR,'
      
        '      F_ASSENZAPERDITEOSSIDAZRACC = :F_ASSENZAPERDITEOSSIDAZRACC' +
        ','
      
        '      F_DISPSICUREZZANONMANOMESSI = :F_DISPSICUREZZANONMANOMESSI' +
        ','
      '      F_VASOESPANSIONECARICO = :F_VASOESPANSIONECARICO,'
      
        '      F_ORGSOGGSOLLECITAZTERMINTEGRI = :F_ORGSOGGSOLLECITAZTERMI' +
        'NTEGRI,'
      
        '      F_DISPROMPITIRAGGIONODETERIOR = :F_DISPROMPITIRAGGIONODETE' +
        'RIOR,'
      
        '      F_VALVOLASICUREZZASOVRAPRESS = :F_VALVOLASICUREZZASOVRAPRE' +
        'SS,'
      '      F_CIRCUITOARIAPULITO = :F_CIRCUITOARIAPULITO,'
      '      F_GUARNIZACCOPIAMINTEGRA = :F_GUARNIZACCOPIAMINTEGRA,'
      '      G_CONTROLLOASSENZAFUGHEGAS = :G_CONTROLLOASSENZAFUGHEGAS,'
      '      G_ESAMEVISIVOCOIBENTAZIONI = :G_ESAMEVISIVOCOIBENTAZIONI,'
      '      G_ESAMEVISIVOCAMINO = :G_ESAMEVISIVOCAMINO,'
      '      ANFUMI_EFFETTUATO = :ANFUMI_EFFETTUATO,'
      '      ANFUMI_TEMPFUMI = :ANFUMI_TEMPFUMI,'
      '      ANFUMI_TEMPAMBIENTE = :ANFUMI_TEMPAMBIENTE,'
      '      ANFUMI_O2_PERC = :ANFUMI_O2_PERC,'
      '      ANFUMI_CO2_PERC = :ANFUMI_CO2_PERC,'
      '      ANFUMI_BACHARACH_NUM = :ANFUMI_BACHARACH_NUM,'
      '      ANFUMI_BACHARACH_NUM2 = :ANFUMI_BACHARACH_NUM2,'
      '      ANFUMI_BACHARACH_NUM3 = :ANFUMI_BACHARACH_NUM3,'
      '      ANFUMI_CO_PPM = :ANFUMI_CO_PPM,'
      '      ANFUMI_CO_PERC = :ANFUMI_CO_PERC,'
      '      ANFUMI_RENDIMENTO_PERC = :ANFUMI_RENDIMENTO_PERC,'
      '      ANFUMI_TIRAGGIO_PA = :ANFUMI_TIRAGGIO_PA,'
      
        '      ANFUMI_PORTATATERMICAEFFETTIVA = :ANFUMI_PORTATATERMICAEFF' +
        'ETTIVA,'
      '      OSSERVAZIONI = :OSSERVAZIONI,'
      '      RACCOMANDAZIONI = :RACCOMANDAZIONI,'
      '      RACCOMANDAZIONI_FATTO = :RACCOMANDAZIONI_FATTO,'
      '      RACCOMANDAZIONI_FATTO_DATA = :RACCOMANDAZIONI_FATTO_DATA,'
      '      RACCOMANDAZIONI_FATTO_NOTE = :RACCOMANDAZIONI_FATTO_NOTE,'
      '      PRESCRIZIONI = :PRESCRIZIONI,'
      '      PRESCRIZIONI_FATTO = :PRESCRIZIONI_FATTO,'
      '      PRESCRIZIONI_FATTO_DATA = :PRESCRIZIONI_FATTO_DATA,'
      '      PRESCRIZIONI_FATTO_NOTE = :PRESCRIZIONI_FATTO_NOTE,'
      '      IMPPUOFUNZIONARE = :IMPPUOFUNZIONARE,'
      '      TECNICO_RESOURCEID = :TECNICO_RESOURCEID,'
      '      TECNICO_NOMECOGNOME = :TECNICO_NOMECOGNOME,'
      '      TECNICO_RAGSOC = :TECNICO_RAGSOC,'
      '      TECNICO_INDIRIZZO = :TECNICO_INDIRIZZO,'
      '      TECNICO_TELEFONO = :TECNICO_TELEFONO,'
      
        '      TECNICO_ESTREMIDOCQUALIFICA = :TECNICO_ESTREMIDOCQUALIFICA' +
        ','
      '      DATAORADAIMPEGNO = :DATAORADAIMPEGNO,'
      '      TECNICO_DAIMPEGNO = :TECNICO_DAIMPEGNO,'
      '      BOLLINO_PREFISSO = :BOLLINO_PREFISSO,'
      '      BOLLINO_NUMERO = :BOLLINO_NUMERO,'
      '      FIRMAPRESENTE_RESPONSABILE = :FIRMAPRESENTE_RESPONSABILE,'
      '      FIRMAPRESENTE_TECNICO = :FIRMAPRESENTE_TECNICO,'
      ''
      '        NATURAGIURIDICARESPIMP = :NATURAGIURIDICARESPIMP,'
      '        NOMERESPIMP = :NOMERESPIMP,'
      '        COGNOMERESPIMP = :COGNOMERESPIMP,'
      
        '        B_LIBRETTOIMPIANTOCOMPILATO = :B_LIBRETTOIMPIANTOCOMPILA' +
        'TO,'
      
        '        C_EXTINST_GENERATOREIDONEO = :C_EXTINST_GENERATOREIDONEO' +
        ','
      
        '        F_SISTIREGOLAZTEMPFUNZIONANTE = :F_SISTIREGOLAZTEMPFUNZI' +
        'ONANTE,'
      
        '        G_ASSENZAPERDITECOMBLIQUIDO = :G_ASSENZAPERDITECOMBLIQUI' +
        'DO,'
      '        G_RISCTRLUNI10389_1 = :G_RISCTRLUNI10389_1,'
      '        ANFUMI_RENDMINIMOLEGGE = :ANFUMI_RENDMINIMOLEGGE,'
      '        ANFUMI_MODULOTERMICO = :ANFUMI_MODULOTERMICO,'
      '        CHKLST_ADOZVALVTERMOST = :CHKLST_ADOZVALVTERMOST,'
      '        CHKLST_ISOLAMRETEDISTRIB = :CHKLST_ISOLAMRETEDISTRIB,'
      '        CHKLST_SISTTRATTAMACQUA = :CHKLST_SISTTRATTAMACQUA,'
      '        CHKLST_SOSTSISTREGOLAZ = :CHKLST_SOSTSISTREGOLAZ,'
      '        TH2O_DUREZZATOTALE = :TH2O_DUREZZATOTALE,'
      '        TH2O_TRATTRISCALDAM = :TH2O_TRATTRISCALDAM,'
      '        TH2O_TRATTACS = :TH2O_TRATTACS,'
      '        PAG = :PAG,'
      '        PAGDI = :PAGDI,'
      '        POTENZANOMINALEMAX = :POTENZANOMINALEMAX,'
      '        PARTITAIVARESPIMP = :PARTITAIVARESPIMP,'
      '        GENCAL_GRUPPOTERMICO_GT = :GENCAL_GRUPPOTERMICO_GT,'
      ''
      '        GENCAL_TIPOLOGIA2 = :GENCAL_TIPOLOGIA2,'
      '        GENCAL_TIPOLOGIA2_ALTRO = :GENCAL_TIPOLOGIA2_ALTRO,'
      ''
      '        ANFUMI_CUFUMISECCHI = :ANFUMI_CUFUMISECCHI,'
      
        '        ANFUMI_PORTATACOMBUSTIBILE = :ANFUMI_PORTATACOMBUSTIBILE' +
        ','
      '        ANFUMI_RISPETTA_BACHARACH = :ANFUMI_RISPETTA_BACHARACH,'
      
        '        ANFUMI_RISPETTA_CO_FUMISECCHI = :ANFUMI_RISPETTA_CO_FUMI' +
        'SECCHI,'
      
        '        ANFUMI_RISPETTA_RENDIMENTO = :ANFUMI_RISPETTA_RENDIMENTO' +
        ','
      '        ANFUMI_NOX_PPM = :ANFUMI_NOX_PPM,'
      ''
      '        H2OREINTEGRO1_ESERCIZIO1 = :H2OREINTEGRO1_ESERCIZIO1,'
      '        H2OREINTEGRO1_ESERCIZIO2 = :H2OREINTEGRO1_ESERCIZIO2,'
      
        '        H2OREINTEGRO1_LETTURAINIZIALE = :H2OREINTEGRO1_LETTURAIN' +
        'IZIALE,'
      
        '        H2OREINTEGRO1_LETTURAFINALE = :H2OREINTEGRO1_LETTURAFINA' +
        'LE,'
      
        '        H2OREINTEGRO1_CONSUMOTOTALE = :H2OREINTEGRO1_CONSUMOTOTA' +
        'LE,'
      ''
      '        H2OREINTEGRO2_ESERCIZIO1 = :H2OREINTEGRO2_ESERCIZIO1,'
      '        H2OREINTEGRO2_ESERCIZIO2 = :H2OREINTEGRO2_ESERCIZIO2,'
      
        '        H2OREINTEGRO2_LETTURAINIZIALE = :H2OREINTEGRO2_LETTURAIN' +
        'IZIALE,'
      
        '        H2OREINTEGRO2_LETTURAFINALE = :H2OREINTEGRO2_LETTURAFINA' +
        'LE,'
      
        '        H2OREINTEGRO2_CONSUMOTOTALE = :H2OREINTEGRO2_CONSUMOTOTA' +
        'LE,'
      ''
      '        TH2O1_NOMEPRODOTTO = :TH2O1_NOMEPRODOTTO,'
      '        TH2O1_ESERCIZIO1 = :TH2O1_ESERCIZIO1,'
      '        TH2O1_ESERCIZIO2 = :TH2O1_ESERCIZIO2,'
      '        TH2O1_QTACONSUMATA = :TH2O1_QTACONSUMATA,'
      '        TH2O1_UM = :TH2O1_UM,'
      '        TH2O1_CIRCUITO_IMPTERMICO = :TH2O1_CIRCUITO_IMPTERMICO,'
      '        TH2O1_CIRCUITO_ACS = :TH2O1_CIRCUITO_ACS,'
      '        TH2O1_CIRCUITO_ALTRO = :TH2O1_CIRCUITO_ALTRO,'
      ''
      '        TH2O2_NOMEPRODOTTO = :TH2O2_NOMEPRODOTTO,'
      '        TH2O2_ESERCIZIO1 = :TH2O2_ESERCIZIO1,'
      '        TH2O2_ESERCIZIO2 = :TH2O2_ESERCIZIO2,'
      '        TH2O2_QTACONSUMATA = :TH2O2_QTACONSUMATA,'
      '        TH2O2_UM = :TH2O2_UM,'
      '        TH2O2_CIRCUITO_IMPTERMICO = :TH2O2_CIRCUITO_IMPTERMICO,'
      '        TH2O2_CIRCUITO_ACS = :TH2O2_CIRCUITO_ACS,'
      '        TH2O2_CIRCUITO_ALTRO = :TH2O2_CIRCUITO_ALTRO,'
      ''
      '        COMBUSTIBILE1_NOME = :COMBUSTIBILE1_NOME,'
      '        COMBUSTIBILE1_UM = :COMBUSTIBILE1_UM,'
      '        COMBUSTIBILE1_ESERCIZIO1 = :COMBUSTIBILE1_ESERCIZIO1,'
      '        COMBUSTIBILE1_ESERCIZIO2 = :COMBUSTIBILE1_ESERCIZIO2,'
      '        COMBUSTIBILE1_ACQUISTI = :COMBUSTIBILE1_ACQUISTI,'
      
        '        COMBUSTIBILE1_LETTURAINIZIALE = :COMBUSTIBILE1_LETTURAIN' +
        'IZIALE,'
      
        '        COMBUSTIBILE1_LETTURAFINALE = :COMBUSTIBILE1_LETTURAFINA' +
        'LE,'
      '        COMBUSTIBILE1_CONSUMO = :COMBUSTIBILE1_CONSUMO,'
      ''
      '        COMBUSTIBILE2_NOME = :COMBUSTIBILE2_NOME,'
      '        COMBUSTIBILE2_UM = :COMBUSTIBILE2_UM,'
      '        COMBUSTIBILE2_ESERCIZIO1 = :COMBUSTIBILE2_ESERCIZIO1,'
      '        COMBUSTIBILE2_ESERCIZIO2 = :COMBUSTIBILE2_ESERCIZIO2,'
      '        COMBUSTIBILE2_ACQUISTI = :COMBUSTIBILE2_ACQUISTI,'
      
        '        COMBUSTIBILE2_LETTURAINIZIALE = :COMBUSTIBILE2_LETTURAIN' +
        'IZIALE,'
      
        '        COMBUSTIBILE2_LETTURAFINALE = :COMBUSTIBILE2_LETTURAFINA' +
        'LE,'
      '        COMBUSTIBILE2_CONSUMO = :COMBUSTIBILE2_CONSUMO,'
      ''
      '        ELETTRICITA1_ESERCIZIO1 = :ELETTRICITA1_ESERCIZIO1,'
      '        ELETTRICITA1_ESERCIZIO2 = :ELETTRICITA1_ESERCIZIO2,'
      
        '        ELETTRICITA1_LETTURAINIZIALE = :ELETTRICITA1_LETTURAINIZ' +
        'IALE,'
      
        '        ELETTRICITA1_LETTURAFINALE = :ELETTRICITA1_LETTURAFINALE' +
        ','
      
        '        ELETTRICITA1_CONSUMOTOTALE = :ELETTRICITA1_CONSUMOTOTALE' +
        ','
      ''
      '        ELETTRICITA2_ESERCIZIO1 = :ELETTRICITA2_ESERCIZIO1,'
      '        ELETTRICITA2_ESERCIZIO2 = :ELETTRICITA2_ESERCIZIO2,'
      
        '        ELETTRICITA2_LETTURAINIZIALE = :ELETTRICITA2_LETTURAINIZ' +
        'IALE,'
      
        '        ELETTRICITA2_LETTURAFINALE = :ELETTRICITA2_LETTURAFINALE' +
        ','
      
        '        ELETTRICITA2_CONSUMOTOTALE = :ELETTRICITA2_CONSUMOTOTALE' +
        ','
      ''
      '      FRIGO_NUMCIRCUITI = :FRIGO_NUMCIRCUITI,'
      '      FRIGO_POTENZAFRIGORIFERA = :FRIGO_POTENZAFRIGORIFERA,'
      '      FRIGO_RAFFRESCAMENTO = :FRIGO_RAFFRESCAMENTO,'
      '      MODPROVA_RAFFRESCAMENTO = :MODPROVA_RAFFRESCAMENTO,'
      '      MODPROVA_RISCALDAMENTO = :MODPROVA_RISCALDAMENTO,'
      '      TORAF_TEMPUSCFLUIDO = :TORAF_TEMPUSCFLUIDO,'
      '      TORAF_TEMPBULBOUMIDOARIA = :TORAF_TEMPBULBOUMIDOARIA,'
      '      SCAMBINT_TEMPINGLATOEXT = :SCAMBINT_TEMPINGLATOEXT,'
      '      SCAMBINT_TEMPUSCLATOEXT = :SCAMBINT_TEMPUSCLATOEXT,'
      
        '      SCAMBINT_TEMPINGLATOMACCHINA = :SCAMBINT_TEMPINGLATOMACCHI' +
        'NA,'
      
        '      SCAMBINT_TEMPUSCLATOMACCHINA = :SCAMBINT_TEMPUSCLATOMACCHI' +
        'NA,'
      ''
      '      CONTREG_TIPODISTRIBUZIONE = :CONTREG_TIPODISTRIBUZIONE,'
      
        '      CONTREG_UNITAIMMCONTABILIZATE = :CONTREG_UNITAIMMCONTABILI' +
        'ZATE,'
      
        '      CONTREG_VALVOLETERMOSTATPRES = :CONTREG_VALVOLETERMOSTATPR' +
        'ES,'
      
        '      CONTREG_TIPOCONTABILIZZAZIONE = :CONTREG_TIPOCONTABILIZZAZ' +
        'IONE,'
      
        '      CONTREG_ALTRISISTTERMOREGOLAZ = :CONTREG_ALTRISISTTERMOREG' +
        'OLAZ,'
      
        '      CONTREG_CORRETTOFUNZIONAMENTO = :CONTREG_CORRETTOFUNZIONAM' +
        'ENTO'
      ''
      'WHERE'
      '  ID = :OLD_ID'
      ''
      '')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAll
    InsertSQL.Strings = (
      'INSERT INTO ALLEGATI_MANUT'
      '('
      '      ID,'
      '      TIPO,'
      '      STATOAVANZAMENTO,'
      '      COPIE,'
      '      DATACONTROLLO,'
      '      DATAORAARRIVO,'
      '      DATAORAPARTENZA,'
      '      IDIMPEGNO,'
      '      CODICECATASTO,'
      '      CODICEISTATCOMUNEIMM,'
      '      COMUNEIMM,'
      '      CAPIMM,'
      '      ZONAIMM,'
      '      INDIRIZZOIMM,'
      '      NUMCIVICOIMM,'
      '      PIANOIMM,'
      '      INTERNOIMM,'
      '      SCALAIMM,'
      '      PALAZZOIMM,'
      '      PROVINCIAIMM,'
      '      CodiceRespImp,'
      '      RagSocRespImp,'
      '      IndirizzoRespImp,'
      '      NumCivicoRespImp,'
      '      CapRespImp,'
      '      CittaRespImp,'
      '      ProvinciaRespImp,'
      '      TelefonoRespImp,'
      '      CellulareRespImp,'
      '      CodiceFiscaleRespImp,'
      '      InQualitaDiRespImp,'
      '      PropCodice,'
      '      PropDenominazione,'
      '      PropIndirizzo,'
      '      PropNumCivico,'
      '      PropCAP,'
      '      PropLocalita,'
      '      PropProvincia,'
      '      PropTelefono,'
      '      PropCellulare,'
      '      PropCodiceFiscale,'
      '      GENCAL_ID,'
      '      GENCAL_COSTRUTTORE,'
      '      GENCAL_MODELLO,'
      '      GENCAL_MATRICOLA,'
      '      GENCAL_TIPOLOGIA,'
      '      GENCAL_TIPOCAMERA,'
      '      GENCAL_TIPOTIRAGGIO,'
      '      GENCAL_TIPOTORAGGIO_ALTRO,'
      '      GENCAL_ANNOCOSTRUZIONE,'
      '      GENCAL_POTENZATERMICAFOCOLARE,'
      '      GENCAL_POTENZATERMICA,'
      '      GENCAL_MARCAEFFICENERGETICA,'
      '      GENCAL_RISCALDAMENTO,'
      '      GENCAL_ACQUASANITARIA,'
      '      GENCAL_CUCINA,'
      '      GENCAL_COMBUSTIBILE,'
      '      GENCAL_COMBUSTIBILEALTRO,'
      '      GENCAL_UBICAZIONE,'
      '      GENCAL_DATAINSTALLAZIONE,'
      '      GENCAL_VOLUMETRIARISC,'
      '      GENCAL_FLUIDOTERMOVETTORE,'
      '      GENCAL_CONSUMI1_STAGIONE,'
      '      GENCAL_CONSUMI1_M3KG,'
      '      GENCAL_CONSUMI2_STAGIONE,'
      '      GENCAL_CONSUMI2_M3KG,'
      '      GENCAL_MARCATURACE,'
      '      GENCAL_PLACCACAMINO,'
      '      GENCAL_MODEVACUAZFUMI,'
      '      GENCAL_ARIACOMBURENTE,'
      '      GENCAL_CONTRARIACOMBURENTE,'
      '      GENCAL_CARICACOMBUSTIBILE,'
      '      BRUC_ID,'
      '      BRUC_COSTRUTTORE,'
      '      BRUC_MODELLO,'
      '      BRUC_MATRICOLA,'
      '      BRUC_TIPOLOGIA,'
      '      BRUC_ANNOCOSTRUZIONE,'
      '      BRUC_DATAINSTALLAZIONE,'
      '      BRUC_CAMPOFUNZIONAMENTO,'
      '      BRUC_CAMPOFUNZIONAMENTO2,'
      '      B_LIBRETTOIMPIANTO,'
      '      B_LIBRETTOIMPIANTO_NOTE,'
      '      B_RAPPCONTRTECN10435,'
      '      B_RAPPCONTRTECN10435_NOTE,'
      '      B_DICHCONFIMP,'
      '      B_DICHCONFIMP_NOTE,'
      '      B_LIBRUSOCALD,'
      '      B_LIBRUSOCALD_NOTE,'
      '      B_LIBRUSOBRUCIATORE,'
      '      B_LIBRUSOBRUCIATORE_NOTE,'
      '      B_PRATICAISPESL,'
      '      B_PRATICAISPESL_NOTE,'
      '      B_CERTPREVINCENDI,'
      '      B_CERTPREVINCENDI_NOTE,'
      '      B_CERTUNI8364,'
      '      B_CERTUNI8364_NOTE,'
      '      B_SCHEMIFUNZIDRAUL,'
      '      B_SCHEMIFUNZIDRAUL_NOTE,'
      '      B_SCHEMIFUNZELETTR,'
      '      B_SCHEMIFUNZELETTR_NOTE,'
      '      C_IDONLOCALEINSTALLAZ,'
      '      C_ADEGDIMENSVENTILAZ,'
      '      C_APERTVENTILAZLIBERE,'
      '      C_ESAMEVISIVOLINEEELETTRICHE,'
      '      C_BRUCFUNZIONAMCORRETTO,'
      '      D_PENDENZACORRETTA,'
      '      D_SEZIONICORRETTE,'
      '      D_CURVECORRETTE,'
      '      D_LUNGHEZZACORRETTA,'
      '      D_BUONOSTATOCONSERVAZ,'
      '      E_SCARICOCAMINOSINGOLO,'
      '      E_SCARICOCANNAFUMCOLLRAMIF,'
      '      E_APPSCARICAAPARETE,'
      '      E_NORIFLUSSIFUMILOCALE,'
      '      E_NOPERDITECONDOTTISCARICO,'
      '      F_UGELLIPULITI,'
      '      F_SCAMBLATOFUMOPULITO,'
      '      F_ACCENSFUNZAMREGOLARI,'
      '      F_DISPCOMANDOREGOLAZFUNZCORR,'
      '      F_ASSENZAPERDITEOSSIDAZRACC,'
      '      F_DISPSICUREZZANONMANOMESSI,'
      '      F_VASOESPANSIONECARICO,'
      '      F_ORGSOGGSOLLECITAZTERMINTEGRI,'
      '      F_DISPROMPITIRAGGIONODETERIOR,'
      '      F_VALVOLASICUREZZASOVRAPRESS,'
      '      F_CIRCUITOARIAPULITO,'
      '      F_GUARNIZACCOPIAMINTEGRA,'
      '      G_CONTROLLOASSENZAFUGHEGAS,'
      '      G_ESAMEVISIVOCOIBENTAZIONI,'
      '      G_ESAMEVISIVOCAMINO,'
      '      ANFUMI_EFFETTUATO,'
      '      ANFUMI_TEMPFUMI,'
      '      ANFUMI_TEMPAMBIENTE,'
      '      ANFUMI_O2_PERC,'
      '      ANFUMI_CO2_PERC,'
      '      ANFUMI_BACHARACH_NUM,'
      '      ANFUMI_BACHARACH_NUM2,'
      '      ANFUMI_BACHARACH_NUM3,'
      '      ANFUMI_CO_PPM,'
      '      ANFUMI_CO_PERC,'
      '      ANFUMI_RENDIMENTO_PERC,'
      '      ANFUMI_TIRAGGIO_PA,'
      '      ANFUMI_PORTATATERMICAEFFETTIVA,'
      '      OSSERVAZIONI,'
      '      RACCOMANDAZIONI,'
      '      RACCOMANDAZIONI_FATTO,'
      '      RACCOMANDAZIONI_FATTO_DATA,'
      '      RACCOMANDAZIONI_FATTO_NOTE,'
      '      PRESCRIZIONI,'
      '      PRESCRIZIONI_FATTO,'
      '      PRESCRIZIONI_FATTO_DATA,'
      '      PRESCRIZIONI_FATTO_NOTE,'
      '      IMPPUOFUNZIONARE,'
      '      TECNICO_RESOURCEID,'
      '      TECNICO_NOMECOGNOME,'
      '      TECNICO_RAGSOC,'
      '      TECNICO_INDIRIZZO,'
      '      TECNICO_TELEFONO,'
      '      TECNICO_ESTREMIDOCQUALIFICA,'
      '      DATAORADAIMPEGNO,'
      '      TECNICO_DAIMPEGNO,'
      '      BOLLINO_PREFISSO,'
      '      BOLLINO_NUMERO,'
      '      FIRMAPRESENTE_RESPONSABILE,'
      '      FIRMAPRESENTE_TECNICO,'
      ''
      '        NATURAGIURIDICARESPIMP,'
      '        NOMERESPIMP,'
      '        COGNOMERESPIMP,'
      '        GENCAL_TIPOGRUPPOTERMICO,'
      '        B_LIBRETTOIMPIANTOCOMPILATO,'
      '        C_EXTINST_GENERATOREIDONEO,'
      '        F_SISTIREGOLAZTEMPFUNZIONANTE,'
      '        G_ASSENZAPERDITECOMBLIQUIDO,'
      '        G_RISCTRLUNI10389_1,'
      '        ANFUMI_RENDMINIMOLEGGE,'
      '        ANFUMI_MODULOTERMICO,'
      '        CHKLST_ADOZVALVTERMOST,'
      '        CHKLST_ISOLAMRETEDISTRIB,'
      '        CHKLST_SISTTRATTAMACQUA,'
      '        CHKLST_SOSTSISTREGOLAZ,'
      '        TH2O_DUREZZATOTALE,'
      '        TH2O_TRATTRISCALDAM,'
      '        TH2O_TRATTACS,'
      '        PAG,'
      '        PAGDI,'
      '        POTENZANOMINALEMAX,'
      '        PARTITAIVARESPIMP,'
      '        GENCAL_GRUPPOTERMICO_GT,'
      ''
      '        GENCAL_TIPOLOGIA2,'
      '        GENCAL_TIPOLOGIA2_ALTRO,'
      ''
      '        ANFUMI_CUFUMISECCHI,'
      '        ANFUMI_PORTATACOMBUSTIBILE,'
      '        ANFUMI_RISPETTA_BACHARACH,'
      '        ANFUMI_RISPETTA_CO_FUMISECCHI,'
      '        ANFUMI_RISPETTA_RENDIMENTO,'
      '        ANFUMI_NOX_PPM,'
      ''
      '        H2OREINTEGRO1_ESERCIZIO1,'
      '        H2OREINTEGRO1_ESERCIZIO2,'
      '        H2OREINTEGRO1_LETTURAINIZIALE,'
      '        H2OREINTEGRO1_LETTURAFINALE,'
      '        H2OREINTEGRO1_CONSUMOTOTALE,'
      ''
      '        H2OREINTEGRO2_ESERCIZIO1,'
      '        H2OREINTEGRO2_ESERCIZIO2,'
      '        H2OREINTEGRO2_LETTURAINIZIALE,'
      '        H2OREINTEGRO2_LETTURAFINALE,'
      '        H2OREINTEGRO2_CONSUMOTOTALE,'
      ''
      '        TH2O1_NOMEPRODOTTO,'
      '        TH2O1_ESERCIZIO1,'
      '        TH2O1_ESERCIZIO2,'
      '        TH2O1_QTACONSUMATA,'
      '        TH2O1_UM,'
      '        TH2O1_CIRCUITO_IMPTERMICO,'
      '        TH2O1_CIRCUITO_ACS,'
      '        TH2O1_CIRCUITO_ALTRO,'
      ''
      '        TH2O2_NOMEPRODOTTO,'
      '        TH2O2_ESERCIZIO1,'
      '        TH2O2_ESERCIZIO2,'
      '        TH2O2_QTACONSUMATA,'
      '        TH2O2_UM,'
      '        TH2O2_CIRCUITO_IMPTERMICO,'
      '        TH2O2_CIRCUITO_ACS,'
      '        TH2O2_CIRCUITO_ALTRO,'
      ''
      '        COMBUSTIBILE1_NOME,'
      '        COMBUSTIBILE1_UM,'
      '        COMBUSTIBILE1_ESERCIZIO1,'
      '        COMBUSTIBILE1_ESERCIZIO2,'
      '        COMBUSTIBILE1_ACQUISTI,'
      '        COMBUSTIBILE1_LETTURAINIZIALE,'
      '        COMBUSTIBILE1_LETTURAFINALE,'
      '        COMBUSTIBILE1_CONSUMO,'
      ''
      '        COMBUSTIBILE2_NOME,'
      '        COMBUSTIBILE2_UM,'
      '        COMBUSTIBILE2_ESERCIZIO1,'
      '        COMBUSTIBILE2_ESERCIZIO2,'
      '        COMBUSTIBILE2_ACQUISTI,'
      '        COMBUSTIBILE2_LETTURAINIZIALE,'
      '        COMBUSTIBILE2_LETTURAFINALE,'
      '        COMBUSTIBILE2_CONSUMO,'
      ''
      '        ELETTRICITA1_ESERCIZIO1,'
      '        ELETTRICITA1_ESERCIZIO2,'
      '        ELETTRICITA1_LETTURAINIZIALE,'
      '        ELETTRICITA1_LETTURAFINALE,'
      '        ELETTRICITA1_CONSUMOTOTALE,'
      ''
      '        ELETTRICITA2_ESERCIZIO1,'
      '        ELETTRICITA2_ESERCIZIO2,'
      '        ELETTRICITA2_LETTURAINIZIALE,'
      '        ELETTRICITA2_LETTURAFINALE,'
      '        ELETTRICITA2_CONSUMOTOTALE,'
      ''
      '      FRIGO_NUMCIRCUITI,'
      '      FRIGO_POTENZAFRIGORIFERA,'
      '      FRIGO_RAFFRESCAMENTO,'
      '      MODPROVA_RAFFRESCAMENTO,'
      '      MODPROVA_RISCALDAMENTO,'
      '      TORAF_TEMPUSCFLUIDO,'
      '      TORAF_TEMPBULBOUMIDOARIA,'
      '      SCAMBINT_TEMPINGLATOEXT,'
      '      SCAMBINT_TEMPUSCLATOEXT,'
      '      SCAMBINT_TEMPINGLATOMACCHINA,'
      '      SCAMBINT_TEMPUSCLATOMACCHINA,'
      ''
      '      CONTREG_TIPODISTRIBUZIONE,'
      '      CONTREG_UNITAIMMCONTABILIZATE,'
      '      CONTREG_VALVOLETERMOSTATPRES,'
      '      CONTREG_TIPOCONTABILIZZAZIONE,'
      '      CONTREG_ALTRISISTTERMOREGOLAZ,'
      '      CONTREG_CORRETTOFUNZIONAMENTO'
      ')'
      'VALUES'
      '('
      '      :ID,'
      '      :TIPO,'
      '      :STATOAVANZAMENTO,'
      '      :COPIE,'
      '      :DATACONTROLLO,'
      '      :DATAORAARRIVO,'
      '      :DATAORAPARTENZA,'
      '      :IDIMPEGNO,'
      '      :CODICECATASTO,'
      '      :CODICEISTATCOMUNEIMM,'
      '      :COMUNEIMM,'
      '      :CAPIMM,'
      '      :ZONAIMM,'
      '      :INDIRIZZOIMM,'
      '      :NUMCIVICOIMM,'
      '      :PIANOIMM,'
      '      :INTERNOIMM,'
      '      :SCALAIMM,'
      '      :PALAZZOIMM,'
      '      :PROVINCIAIMM,'
      '      :CodiceRespImp,'
      '      :RagSocRespImp,'
      '      :IndirizzoRespImp,'
      '      :NumCivicoRespImp,'
      '      :CapRespImp,'
      '      :CittaRespImp,'
      '      :ProvinciaRespImp,'
      '      :TelefonoRespImp,'
      '      :CellulareRespImp,'
      '      :CodiceFiscaleRespImp,'
      '      :InQualitaDiRespImp,'
      '      :PropCodice,'
      '      :PropDenominazione,'
      '      :PropIndirizzo,'
      '      :PropNumCivico,'
      '      :PropCAP,'
      '      :PropLocalita,'
      '      :PropProvincia,'
      '      :PropTelefono,'
      '      :PropCellulare,'
      '      :PropCodiceFiscale,'
      '      :GENCAL_ID,'
      '      :GENCAL_COSTRUTTORE,'
      '      :GENCAL_MODELLO,'
      '      :GENCAL_MATRICOLA,'
      '      :GENCAL_TIPOLOGIA,'
      '      :GENCAL_TIPOCAMERA,'
      '      :GENCAL_TIPOTIRAGGIO,'
      '      :GENCAL_TIPOTIRAGGIO_ALTRO,'
      '      :GENCAL_ANNOCOSTRUZIONE,'
      '      :GENCAL_POTENZATERMICAFOCOLARE,'
      '      :GENCAL_POTENZATERMICA,'
      '      :GENCAL_MARCAEFFICENERGETICA,'
      '      :GENCAL_RISCALDAMENTO,'
      '      :GENCAL_ACQUASANITARIA,'
      '      :GENCAL_CUCINA,'
      '      :GENCAL_COMBUSTIBILE,'
      '      :GENCAL_COMBUSTIBILEALTRO,'
      '      :GENCAL_UBICAZIONE,'
      '      :GENCAL_DATAINSTALLAZIONE,'
      '      :GENCAL_VOLUMETRIARISC,'
      '      :GENCAL_FLUIDOTERMOVETTORE,'
      '      :GENCAL_CONSUMI1_STAGIONE,'
      '      :GENCAL_CONSUMI1_M3KG,'
      '      :GENCAL_CONSUMI2_STAGIONE,'
      '      :GENCAL_CONSUMI2_M3KG,'
      '      :GENCAL_MARCATURACE,'
      '      :GENCAL_PLACCACAMINO,'
      '      :GENCAL_MODEVACUAZFUMI,'
      '      :GENCAL_ARIACOMBURENTE,'
      '      :GENCAL_CONTRARIACOMBURENTE,'
      '      :GENCAL_CARICACOMBUSTIBILE,'
      '      :BRUC_ID,'
      '      :BRUC_COSTRUTTORE,'
      '      :BRUC_MODELLO,'
      '      :BRUC_MATRICOLA,'
      '      :BRUC_TIPOLOGIA,'
      '      :BRUC_ANNOCOSTRUZIONE,'
      '      :BRUC_DATAINSTALLAZIONE,'
      '      :BRUC_CAMPOFUNZIONAMENTO,'
      '      :BRUC_CAMPOFUNZIONAMENTO2,'
      '      :B_LIBRETTOIMPIANTO,'
      '      :B_LIBRETTOIMPIANTO_NOTE,'
      '      :B_RAPPCONTRTECN10435,'
      '      :B_RAPPCONTRTECN10435_NOTE,'
      '      :B_DICHCONFIMP,'
      '      :B_DICHCONFIMP_NOTE,'
      '      :B_LIBRUSOCALD,'
      '      :B_LIBRUSOCALD_NOTE,'
      '      :B_LIBRUSOBRUCIATORE,'
      '      :B_LIBRUSOBRUCIATORE_NOTE,'
      '      :B_PRATICAISPESL,'
      '      :B_PRATICAISPESL_NOTE,'
      '      :B_CERTPREVINCENDI,'
      '      :B_CERTPREVINCENDI_NOTE,'
      '      :B_CERTUNI8364,'
      '      :B_CERTUNI8364_NOTE,'
      '      :B_SCHEMIFUNZIDRAUL,'
      '      :B_SCHEMIFUNZIDRAUL_NOTE,'
      '      :B_SCHEMIFUNZELETTR,'
      '      :B_SCHEMIFUNZELETTR_NOTE,'
      '      :C_IDONLOCALEINSTALLAZ,'
      '      :C_ADEGDIMENSVENTILAZ,'
      '      :C_APERTVENTILAZLIBERE,'
      '      :C_ESAMEVISIVOLINEEELETTRICHE,'
      '      :C_BRUCFUNZIONAMCORRETTO,'
      '      :D_PENDENZACORRETTA,'
      '      :D_SEZIONICORRETTE,'
      '      :D_CURVECORRETTE,'
      '      :D_LUNGHEZZACORRETTA,'
      '      :D_BUONOSTATOCONSERVAZ,'
      '      :E_SCARICOCAMINOSINGOLO,'
      '      :E_SCARICOCANNAFUMCOLLRAMIF,'
      '      :E_APPSCARICAAPARETE,'
      '      :E_NORIFLUSSIFUMILOCALE,'
      '      :E_NOPERDITECONDOTTISCARICO,'
      '      :F_UGELLIPULITI,'
      '      :F_SCAMBLATOFUMOPULITO,'
      '      :F_ACCENSFUNZAMREGOLARI,'
      '      :F_DISPCOMANDOREGOLAZFUNZCORR,'
      '      :F_ASSENZAPERDITEOSSIDAZRACC,'
      '      :F_DISPSICUREZZANONMANOMESSI,'
      '      :F_VASOESPANSIONECARICO,'
      '      :F_ORGSOGGSOLLECITAZTERMINTEGRI,'
      '      :F_DISPROMPITIRAGGIONODETERIOR,'
      '      :F_VALVOLASICUREZZASOVRAPRESS,'
      '      :F_CIRCUITOARIAPULITO,'
      '      :F_GUARNIZACCOPIAMINTEGRA,'
      '      :G_CONTROLLOASSENZAFUGHEGAS,'
      '      :G_ESAMEVISIVOCOIBENTAZIONI,'
      '      :G_ESAMEVISIVOCAMINO,'
      '      :ANFUMI_EFFETTUATO,'
      '      :ANFUMI_TEMPFUMI,'
      '      :ANFUMI_TEMPAMBIENTE,'
      '      :ANFUMI_O2_PERC,'
      '      :ANFUMI_CO2_PERC,'
      '      :ANFUMI_BACHARACH_NUM,'
      '      :ANFUMI_BACHARACH_NUM2,'
      '      :ANFUMI_BACHARACH_NUM3,'
      '      :ANFUMI_CO_PPM,'
      '      :ANFUMI_CO_PERC,'
      '      :ANFUMI_RENDIMENTO_PERC,'
      '      :ANFUMI_TIRAGGIO_PA,'
      '      :ANFUMI_PORTATATERMICAEFFETTIVA,'
      '      :OSSERVAZIONI,'
      '      :RACCOMANDAZIONI,'
      '      :RACCOMANDAZIONI_FATTO,'
      '      :RACCOMANDAZIONI_FATTO_DATA,'
      '      :RACCOMANDAZIONI_FATTO_NOTE,'
      '      :PRESCRIZIONI,'
      '      :PRESCRIZIONI_FATTO,'
      '      :PRESCRIZIONI_FATTO_DATA,'
      '      :PRESCRIZIONI_FATTO_NOTE,'
      '      :IMPPUOFUNZIONARE,'
      '      :TECNICO_RESOURCEID,'
      '      :TECNICO_NOMECOGNOME,'
      '      :TECNICO_RAGSOC,'
      '      :TECNICO_INDIRIZZO,'
      '      :TECNICO_TELEFONO,'
      '      :TECNICO_ESTREMIDOCQUALIFICA,'
      '      :DATAORADAIMPEGNO,'
      '      :TECNICO_DAIMPEGNO,'
      '      :BOLLINO_PREFISSO,'
      '      :BOLLINO_NUMERO,'
      '      :FIRMAPRESENTE_RESPONSABILE,'
      '      :FIRMAPRESENTE_TECNICO,'
      ''
      '        :NATURAGIURIDICARESPIMP,'
      '        :NOMERESPIMP,'
      '        :COGNOMERESPIMP,'
      '        :B_LIBRETTOIMPIANTOCOMPILATO,'
      '        :C_EXTINST_GENERATOREIDONEO,'
      '        :F_SISTIREGOLAZTEMPFUNZIONANTE,'
      '        :G_ASSENZAPERDITECOMBLIQUIDO,'
      '        :G_RISCTRLUNI10389_1,'
      '        :ANFUMI_RENDMINIMOLEGGE,'
      '        :ANFUMI_MODULOTERMICO,'
      '        :CHKLST_ADOZVALVTERMOST,'
      '        :CHKLST_ISOLAMRETEDISTRIB,'
      '        :CHKLST_SISTTRATTAMACQUA,'
      '        :CHKLST_SOSTSISTREGOLAZ,'
      '        :TH2O_DUREZZATOTALE,'
      '        :TH2O_TRATTRISCALDAM,'
      '        :TH2O_TRATTACS,'
      '        :PAG,'
      '        :PAGDI,'
      '        :POTENZANOMINALEMAX,'
      '        :PARTITAIVARESPIMP,'
      '        :GENCAL_GRUPPOTERMICO_GT'
      ''
      '        :GENCAL_TIPOLOGIA2,'
      '        :GENCAL_TIPOLOGIA2_ALTRO,'
      ''
      '        :ANFUMI_CUFUMISECCHI,'
      '        :ANFUMI_PORTATACOMBUSTIBILE,'
      '        :ANFUMI_RISPETTA_BACHARACH,'
      '        :ANFUMI_RISPETTA_CO_FUMISECCHI,'
      '        :ANFUMI_RISPETTA_RENDIMENTO,'
      '        :ANFUMI_NOX_PPM,'
      ''
      '        :H2OREINTEGRO1_ESERCIZIO1,'
      '        :H2OREINTEGRO1_ESERCIZIO2,'
      '        :H2OREINTEGRO1_LETTURAINIZIALE,'
      '        :H2OREINTEGRO1_LETTURAFINALE,'
      '        :H2OREINTEGRO1_CONSUMOTOTALE,'
      ''
      '        :H2OREINTEGRO2_ESERCIZIO1,'
      '        :H2OREINTEGRO2_ESERCIZIO2,'
      '        :H2OREINTEGRO2_LETTURAINIZIALE,'
      '        :H2OREINTEGRO2_LETTURAFINALE,'
      '        :H2OREINTEGRO2_CONSUMOTOTALE,'
      ''
      '        :TH2O1_NOMEPRODOTTO,'
      '        :TH2O1_ESERCIZIO1,'
      '        :TH2O1_ESERCIZIO2,'
      '        :TH2O1_QTACONSUMATA,'
      '        :TH2O1_UM,'
      '        :TH2O1_CIRCUITO_IMPTERMICO,'
      '        :TH2O1_CIRCUITO_ACS,'
      '        :TH2O1_CIRCUITO_ALTRO,'
      ''
      '        :TH2O2_NOMEPRODOTTO,'
      '        :TH2O2_ESERCIZIO1,'
      '        :TH2O2_ESERCIZIO2,'
      '        :TH2O2_QTACONSUMATA,'
      '        :TH2O2_UM,'
      '        :TH2O2_CIRCUITO_IMPTERMICO,'
      '        :TH2O2_CIRCUITO_ACS,'
      '        :TH2O2_CIRCUITO_ALTRO,'
      ''
      '        :COMBUSTIBILE1_NOME,'
      '        :COMBUSTIBILE1_UM,'
      '        :COMBUSTIBILE1_ESERCIZIO1,'
      '        :COMBUSTIBILE1_ESERCIZIO2,'
      '        :COMBUSTIBILE1_ACQUISTI,'
      '        :COMBUSTIBILE1_LETTURAINIZIALE,'
      '        :COMBUSTIBILE1_LETTURAFINALE,'
      '        :COMBUSTIBILE1_CONSUMO,'
      ''
      '        :COMBUSTIBILE2_NOME,'
      '        :COMBUSTIBILE2_UM,'
      '        :COMBUSTIBILE2_ESERCIZIO1,'
      '        :COMBUSTIBILE2_ESERCIZIO2,'
      '        :COMBUSTIBILE2_ACQUISTI,'
      '        :COMBUSTIBILE2_LETTURAINIZIALE,'
      '        :COMBUSTIBILE2_LETTURAFINALE,'
      '        :COMBUSTIBILE2_CONSUMO,'
      ''
      '        :ELETTRICITA1_ESERCIZIO1,'
      '        :ELETTRICITA1_ESERCIZIO2,'
      '        :ELETTRICITA1_LETTURAINIZIALE,'
      '        :ELETTRICITA1_LETTURAFINALE,'
      '        :ELETTRICITA1_CONSUMOTOTALE,'
      ''
      '        :ELETTRICITA2_ESERCIZIO1,'
      '        :ELETTRICITA2_ESERCIZIO2,'
      '        :ELETTRICITA2_LETTURAINIZIALE,'
      '        :ELETTRICITA2_LETTURAFINALE,'
      '        :ELETTRICITA2_CONSUMOTOTALE,'
      ''
      '      :FRIGO_NUMCIRCUITI,'
      '      :FRIGO_POTENZAFRIGORIFERA,'
      '      :FRIGO_RAFFRESCAMENTO,'
      '      :MODPROVA_RAFFRESCAMENTO,'
      '      :MODPROVA_RISCALDAMENTO,'
      '      :TORAF_TEMPUSCFLUIDO,'
      '      :TORAF_TEMPBULBOUMIDOARIA,'
      '      :SCAMBINT_TEMPINGLATOEXT,'
      '      :SCAMBINT_TEMPUSCLATOEXT,'
      '      :SCAMBINT_TEMPINGLATOMACCHINA,'
      '      :SCAMBINT_TEMPUSCLATOMACCHINA'
      ''
      '      :CONTREG_TIPODISTRIBUZIONE,'
      '      :CONTREG_UNITAIMMCONTABILIZATE,'
      '      :CONTREG_VALVOLETERMOSTATPRES,'
      '      :CONTREG_TIPOCONTABILIZZAZIONE,'
      '      :CONTREG_ALTRISISTTERMOREGOLAZ,'
      '      :CONTREG_CORRETTOFUNZIONAMENTO'
      ')'
      '')
    PessimisticLocking = True
    RecordCountAccurate = True
    AfterOpen = QryAllAfterOpen
    OnCalcFields = QryAllCalcFields
    SQL.Strings = (
      'SELECT *'
      'FROM ALLEGATI_MANUT AM'
      'WHERE AM.ID = :P_ID'
      '')
    Left = 144
    Top = 9
    object QryAllID: TIntegerField
      FieldName = 'ID'
      Origin = 'ALLEGATI_MANUT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryAllTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'ALLEGATI_MANUT.TIPO'
      Required = True
      Size = 60
    end
    object QryAllDATACONTROLLO: TDateTimeField
      FieldName = 'DATACONTROLLO'
      Origin = 'ALLEGATI_MANUT.DATACONTROLLO'
    end
    object QryAllDATAORAARRIVO: TDateTimeField
      FieldName = 'DATAORAARRIVO'
      Origin = 'ALLEGATI_MANUT.DATAORAARRIVO'
    end
    object QryAllDATAORAPARTENZA: TDateTimeField
      FieldName = 'DATAORAPARTENZA'
      Origin = 'ALLEGATI_MANUT.DATAORAPARTENZA'
    end
    object QryAllIDIMPEGNO: TIntegerField
      FieldName = 'IDIMPEGNO'
      Origin = 'ALLEGATI_MANUT.IDIMPEGNO'
    end
    object QryAllCODICECATASTO: TStringField
      FieldName = 'CODICECATASTO'
      Origin = 'ALLEGATI_MANUT.CODICECATASTO'
      Size = 50
    end
    object QryAllCODICEISTATCOMUNEIMM: TStringField
      FieldName = 'CODICEISTATCOMUNEIMM'
      Origin = 'ALLEGATI_MANUT.CODICEISTATCOMUNEIMM'
      Size = 10
    end
    object QryAllCOMUNEIMM: TStringField
      FieldName = 'COMUNEIMM'
      Origin = 'ALLEGATI_MANUT.COMUNEIMM'
      Size = 60
    end
    object QryAllCAPIMM: TStringField
      FieldName = 'CAPIMM'
      Origin = 'ALLEGATI_MANUT.CAPIMM'
      Size = 5
    end
    object QryAllZONAIMM: TStringField
      FieldName = 'ZONAIMM'
      Origin = 'ALLEGATI_MANUT.ZONAIMM'
      Size = 30
    end
    object QryAllINDIRIZZOIMM: TStringField
      FieldName = 'INDIRIZZOIMM'
      Origin = 'ALLEGATI_MANUT.INDIRIZZOIMM'
      Size = 80
    end
    object QryAllNUMCIVICOIMM: TStringField
      FieldName = 'NUMCIVICOIMM'
      Origin = 'ALLEGATI_MANUT.NUMCIVICOIMM'
      Size = 10
    end
    object QryAllPIANOIMM: TStringField
      FieldName = 'PIANOIMM'
      Origin = 'ALLEGATI_MANUT.PIANOIMM'
      Size = 10
    end
    object QryAllINTERNOIMM: TStringField
      FieldName = 'INTERNOIMM'
      Origin = 'ALLEGATI_MANUT.INTERNOIMM'
      Size = 10
    end
    object QryAllPALAZZOIMM: TStringField
      FieldName = 'PALAZZOIMM'
      Origin = 'ALLEGATI_MANUT.PALAZZOIMM'
      Size = 30
    end
    object QryAllSCALAIMM: TStringField
      FieldName = 'SCALAIMM'
      Origin = 'ALLEGATI_MANUT.SCALAIMM'
      Size = 10
    end
    object QryAllPROVINCIAIMM: TStringField
      FieldName = 'PROVINCIAIMM'
      Origin = 'ALLEGATI_MANUT.PROVINCIAIMM'
      Size = 3
    end
    object QryAllCODICERESPIMP: TIntegerField
      FieldName = 'CODICERESPIMP'
      Origin = 'ALLEGATI_MANUT.CODICERESPIMP'
      OnChange = QryAllCODICERESPIMPChange
    end
    object QryAllRAGSOCRESPIMP: TStringField
      FieldName = 'RAGSOCRESPIMP'
      Origin = 'ALLEGATI_MANUT.RAGSOCRESPIMP'
      Size = 60
    end
    object QryAllINDIRIZZORESPIMP: TStringField
      FieldName = 'INDIRIZZORESPIMP'
      Origin = 'ALLEGATI_MANUT.INDIRIZZORESPIMP'
      Size = 80
    end
    object QryAllNUMCIVICORESPIMP: TStringField
      FieldName = 'NUMCIVICORESPIMP'
      Origin = 'ALLEGATI_MANUT.NUMCIVICORESPIMP'
      Size = 10
    end
    object QryAllCAPRESPIMP: TStringField
      FieldName = 'CAPRESPIMP'
      Origin = 'ALLEGATI_MANUT.CAPRESPIMP'
      Size = 5
    end
    object QryAllCITTARESPIMP: TStringField
      FieldName = 'CITTARESPIMP'
      Origin = 'ALLEGATI_MANUT.CITTARESPIMP'
      Size = 60
    end
    object QryAllPROVINCIARESPIMP: TStringField
      FieldName = 'PROVINCIARESPIMP'
      Origin = 'ALLEGATI_MANUT.PROVINCIARESPIMP'
      Size = 3
    end
    object QryAllTELEFONORESPIMP: TStringField
      FieldName = 'TELEFONORESPIMP'
      Origin = 'ALLEGATI_MANUT.TELEFONORESPIMP'
      Size = 30
    end
    object QryAllCELLULARERESPIMP: TStringField
      FieldName = 'CELLULARERESPIMP'
      Origin = 'ALLEGATI_MANUT.CELLULARERESPIMP'
      Size = 30
    end
    object QryAllCODICEFISCALERESPIMP: TStringField
      FieldName = 'CODICEFISCALERESPIMP'
      Origin = 'ALLEGATI_MANUT.CODICEFISCALERESPIMP'
      Size = 16
    end
    object QryAllINQUALITADIRESPIMP: TStringField
      FieldName = 'INQUALITADIRESPIMP'
      Origin = 'ALLEGATI_MANUT.INQUALITADIRESPIMP'
    end
    object QryAllPROPCODICE: TIntegerField
      FieldName = 'PROPCODICE'
      Origin = 'ALLEGATI_MANUT.PROPCODICE'
      OnChange = QryAllPROPCODICEChange
    end
    object QryAllPROPDENOMINAZIONE: TStringField
      FieldName = 'PROPDENOMINAZIONE'
      Origin = 'ALLEGATI_MANUT.PROPDENOMINAZIONE'
      Size = 60
    end
    object QryAllPROPINDIRIZZO: TStringField
      FieldName = 'PROPINDIRIZZO'
      Origin = 'ALLEGATI_MANUT.PROPINDIRIZZO'
      Size = 80
    end
    object QryAllPROPNUMCIVICO: TStringField
      FieldName = 'PROPNUMCIVICO'
      Origin = 'ALLEGATI_MANUT.PROPNUMCIVICO'
      Size = 10
    end
    object QryAllPROPCAP: TStringField
      FieldName = 'PROPCAP'
      Origin = 'ALLEGATI_MANUT.PROPCAP'
      Size = 5
    end
    object QryAllPROPLOCALITA: TStringField
      FieldName = 'PROPLOCALITA'
      Origin = 'ALLEGATI_MANUT.PROPLOCALITA'
      Size = 60
    end
    object QryAllPROPPROVINCIA: TStringField
      FieldName = 'PROPPROVINCIA'
      Origin = 'ALLEGATI_MANUT.PROPPROVINCIA'
      Size = 3
    end
    object QryAllPROPTELEFONO: TStringField
      FieldName = 'PROPTELEFONO'
      Origin = 'ALLEGATI_MANUT.PROPTELEFONO'
      Size = 30
    end
    object QryAllPROPCELLULARE: TStringField
      FieldName = 'PROPCELLULARE'
      Origin = 'ALLEGATI_MANUT.PROPCELLULARE'
      Size = 30
    end
    object QryAllPROPCODICEFISCALE: TStringField
      FieldName = 'PROPCODICEFISCALE'
      Origin = 'ALLEGATI_MANUT.PROPCODICEFISCALE'
      Size = 16
    end
    object QryAllGENCAL_ID: TIntegerField
      FieldName = 'GENCAL_ID'
      Origin = 'ALLEGATI_MANUT.GENCAL_ID'
    end
    object QryAllGENCAL_COSTRUTTORE: TStringField
      FieldName = 'GENCAL_COSTRUTTORE'
      Origin = 'ALLEGATI_MANUT.GENCAL_COSTRUTTORE'
      Size = 45
    end
    object QryAllGENCAL_MODELLO: TStringField
      FieldName = 'GENCAL_MODELLO'
      Origin = 'ALLEGATI_MANUT.GENCAL_MODELLO'
      Size = 30
    end
    object QryAllGENCAL_MATRICOLA: TStringField
      FieldName = 'GENCAL_MATRICOLA'
      Origin = 'ALLEGATI_MANUT.GENCAL_MATRICOLA'
      Size = 30
    end
    object QryAllGENCAL_TIPOLOGIA: TStringField
      FieldName = 'GENCAL_TIPOLOGIA'
      Origin = 'ALLEGATI_MANUT.GENCAL_TIPOLOGIA'
      Size = 80
    end
    object QryAllGENCAL_TIPOCAMERA: TStringField
      FieldName = 'GENCAL_TIPOCAMERA'
      Origin = 'ALLEGATI_MANUT.GENCAL_TIPOCAMERA'
      Size = 80
    end
    object QryAllGENCAL_TIPOTIRAGGIO: TStringField
      FieldName = 'GENCAL_TIPOTIRAGGIO'
      Origin = 'ALLEGATI_MANUT.GENCAL_TIPOTIRAGGIO'
      Size = 80
    end
    object QryAllGENCAL_ANNOCOSTRUZIONE: TIntegerField
      FieldName = 'GENCAL_ANNOCOSTRUZIONE'
      Origin = 'ALLEGATI_MANUT.GENCAL_ANNOCOSTRUZIONE'
    end
    object QryAllGENCAL_MARCAEFFICENERGETICA: TStringField
      FieldName = 'GENCAL_MARCAEFFICENERGETICA'
      Origin = 'ALLEGATI_MANUT.GENCAL_MARCAEFFICENERGETICA'
      Size = 10
    end
    object QryAllGENCAL_RISCALDAMENTO: TStringField
      FieldName = 'GENCAL_RISCALDAMENTO'
      Origin = 'ALLEGATI_MANUT.GENCAL_RISCALDAMENTO'
      Size = 1
    end
    object QryAllGENCAL_ACQUASANITARIA: TStringField
      FieldName = 'GENCAL_ACQUASANITARIA'
      Origin = 'ALLEGATI_MANUT.GENCAL_ACQUASANITARIA'
      Size = 1
    end
    object QryAllGENCAL_COMBUSTIBILE: TStringField
      FieldName = 'GENCAL_COMBUSTIBILE'
      Origin = 'ALLEGATI_MANUT.GENCAL_COMBUSTIBILE'
    end
    object QryAllGENCAL_COMBUSTIBILEALTRO: TStringField
      FieldName = 'GENCAL_COMBUSTIBILEALTRO'
      Origin = 'ALLEGATI_MANUT.GENCAL_COMBUSTIBILEALTRO'
    end
    object QryAllGENCAL_UBICAZIONE: TStringField
      FieldName = 'GENCAL_UBICAZIONE'
      Origin = 'ALLEGATI_MANUT.GENCAL_UBICAZIONE'
      Size = 30
    end
    object QryAllGENCAL_DATAINSTALLAZIONE: TDateTimeField
      FieldName = 'GENCAL_DATAINSTALLAZIONE'
      Origin = 'ALLEGATI_MANUT.GENCAL_DATAINSTALLAZIONE'
    end
    object QryAllGENCAL_FLUIDOTERMOVETTORE: TStringField
      FieldName = 'GENCAL_FLUIDOTERMOVETTORE'
      Origin = 'ALLEGATI_MANUT.GENCAL_FLUIDOTERMOVETTORE'
      Size = 15
    end
    object QryAllGENCAL_POTENZATERMICAFOCOLARE: TIBOFloatField
      FieldName = 'GENCAL_POTENZATERMICAFOCOLARE'
      Origin = 'ALLEGATI_MANUT.GENCAL_POTENZATERMICAFOCOLARE'
    end
    object QryAllGENCAL_POTENZATERMICA: TIBOFloatField
      FieldName = 'GENCAL_POTENZATERMICA'
      Origin = 'ALLEGATI_MANUT.GENCAL_POTENZATERMICA'
    end
    object QryAllGENCAL_VOLUMETRIARISC: TIBOFloatField
      FieldName = 'GENCAL_VOLUMETRIARISC'
      Origin = 'ALLEGATI_MANUT.GENCAL_VOLUMETRIARISC'
    end
    object QryAllGENCAL_CONSUMI1_STAGIONE: TStringField
      FieldName = 'GENCAL_CONSUMI1_STAGIONE'
      Origin = 'ALLEGATI_MANUT.GENCAL_CONSUMI1_STAGIONE'
      Size = 10
    end
    object QryAllGENCAL_CONSUMI1_M3KG: TIBOFloatField
      FieldName = 'GENCAL_CONSUMI1_M3KG'
      Origin = 'ALLEGATI_MANUT.GENCAL_CONSUMI1_M3KG'
    end
    object QryAllGENCAL_CONSUMI2_STAGIONE: TStringField
      FieldName = 'GENCAL_CONSUMI2_STAGIONE'
      Origin = 'ALLEGATI_MANUT.GENCAL_CONSUMI2_STAGIONE'
      Size = 10
    end
    object QryAllGENCAL_CONSUMI2_M3KG: TIBOFloatField
      FieldName = 'GENCAL_CONSUMI2_M3KG'
      Origin = 'ALLEGATI_MANUT.GENCAL_CONSUMI2_M3KG'
    end
    object QryAllBRUC_ID: TIntegerField
      FieldName = 'BRUC_ID'
      Origin = 'ALLEGATI_MANUT.BRUC_ID'
    end
    object QryAllBRUC_COSTRUTTORE: TStringField
      FieldName = 'BRUC_COSTRUTTORE'
      Origin = 'ALLEGATI_MANUT.BRUC_COSTRUTTORE'
      Size = 45
    end
    object QryAllBRUC_MODELLO: TStringField
      FieldName = 'BRUC_MODELLO'
      Origin = 'ALLEGATI_MANUT.BRUC_MODELLO'
      Size = 30
    end
    object QryAllBRUC_MATRICOLA: TStringField
      FieldName = 'BRUC_MATRICOLA'
      Origin = 'ALLEGATI_MANUT.BRUC_MATRICOLA'
      Size = 30
    end
    object QryAllBRUC_TIPOLOGIA: TStringField
      FieldName = 'BRUC_TIPOLOGIA'
      Origin = 'ALLEGATI_MANUT.BRUC_TIPOLOGIA'
    end
    object QryAllBRUC_ANNOCOSTRUZIONE: TIntegerField
      FieldName = 'BRUC_ANNOCOSTRUZIONE'
      Origin = 'ALLEGATI_MANUT.BRUC_ANNOCOSTRUZIONE'
    end
    object QryAllBRUC_DATAINSTALLAZIONE: TDateTimeField
      FieldName = 'BRUC_DATAINSTALLAZIONE'
      Origin = 'ALLEGATI_MANUT.BRUC_DATAINSTALLAZIONE'
    end
    object QryAllBRUC_CAMPOFUNZIONAMENTO: TIBOFloatField
      FieldName = 'BRUC_CAMPOFUNZIONAMENTO'
      Origin = 'ALLEGATI_MANUT.BRUC_CAMPOFUNZIONAMENTO'
    end
    object QryAllBRUC_CAMPOFUNZIONAMENTO2: TIBOFloatField
      Alignment = taLeftJustify
      FieldName = 'BRUC_CAMPOFUNZIONAMENTO2'
      Origin = 'ALLEGATI_MANUT.BRUC_CAMPOFUNZIONAMENTO2'
    end
    object QryAllB_LIBRETTOIMPIANTO: TStringField
      FieldName = 'B_LIBRETTOIMPIANTO'
      Origin = 'ALLEGATI_MANUT.B_LIBRETTOIMPIANTO'
      Size = 1
    end
    object QryAllB_LIBRETTOIMPIANTO_NOTE: TStringField
      FieldName = 'B_LIBRETTOIMPIANTO_NOTE'
      Origin = 'ALLEGATI_MANUT.B_LIBRETTOIMPIANTO_NOTE'
      Size = 60
    end
    object QryAllB_RAPPCONTRTECN10435: TStringField
      FieldName = 'B_RAPPCONTRTECN10435'
      Origin = 'ALLEGATI_MANUT.B_RAPPCONTRTECN10435'
      Size = 1
    end
    object QryAllB_RAPPCONTRTECN10435_NOTE: TStringField
      FieldName = 'B_RAPPCONTRTECN10435_NOTE'
      Origin = 'ALLEGATI_MANUT.B_RAPPCONTRTECN10435_NOTE'
      Size = 60
    end
    object QryAllB_DICHCONFIMP: TStringField
      FieldName = 'B_DICHCONFIMP'
      Origin = 'ALLEGATI_MANUT.B_DICHCONFIMP'
      Size = 1
    end
    object QryAllB_DICHCONFIMP_NOTE: TStringField
      FieldName = 'B_DICHCONFIMP_NOTE'
      Origin = 'ALLEGATI_MANUT.B_DICHCONFIMP_NOTE'
      Size = 60
    end
    object QryAllB_LIBRUSOCALD: TStringField
      FieldName = 'B_LIBRUSOCALD'
      Origin = 'ALLEGATI_MANUT.B_LIBRUSOCALD'
      Size = 1
    end
    object QryAllB_LIBRUSOCALD_NOTE: TStringField
      FieldName = 'B_LIBRUSOCALD_NOTE'
      Origin = 'ALLEGATI_MANUT.B_LIBRUSOCALD_NOTE'
      Size = 60
    end
    object QryAllB_LIBRUSOBRUCIATORE: TStringField
      FieldName = 'B_LIBRUSOBRUCIATORE'
      Origin = 'ALLEGATI_MANUT.B_LIBRUSOBRUCIATORE'
      Size = 1
    end
    object QryAllB_LIBRUSOBRUCIATORE_NOTE: TStringField
      FieldName = 'B_LIBRUSOBRUCIATORE_NOTE'
      Origin = 'ALLEGATI_MANUT.B_LIBRUSOBRUCIATORE_NOTE'
      Size = 60
    end
    object QryAllB_PRATICAISPESL: TStringField
      FieldName = 'B_PRATICAISPESL'
      Origin = 'ALLEGATI_MANUT.B_PRATICAISPESL'
      Size = 1
    end
    object QryAllB_PRATICAISPESL_NOTE: TStringField
      FieldName = 'B_PRATICAISPESL_NOTE'
      Origin = 'ALLEGATI_MANUT.B_PRATICAISPESL_NOTE'
      Size = 60
    end
    object QryAllB_CERTPREVINCENDI: TStringField
      FieldName = 'B_CERTPREVINCENDI'
      Origin = 'ALLEGATI_MANUT.B_CERTPREVINCENDI'
      Size = 1
    end
    object QryAllB_CERTPREVINCENDI_NOTE: TStringField
      FieldName = 'B_CERTPREVINCENDI_NOTE'
      Origin = 'ALLEGATI_MANUT.B_CERTPREVINCENDI_NOTE'
      Size = 60
    end
    object QryAllB_CERTUNI8364: TStringField
      FieldName = 'B_CERTUNI8364'
      Origin = 'ALLEGATI_MANUT.B_CERTUNI8364'
      Size = 1
    end
    object QryAllB_CERTUNI8364_NOTE: TStringField
      FieldName = 'B_CERTUNI8364_NOTE'
      Origin = 'ALLEGATI_MANUT.B_CERTUNI8364_NOTE'
      Size = 60
    end
    object QryAllB_SCHEMIFUNZIDRAUL: TStringField
      FieldName = 'B_SCHEMIFUNZIDRAUL'
      Origin = 'ALLEGATI_MANUT.B_SCHEMIFUNZIDRAUL'
      Size = 1
    end
    object QryAllB_SCHEMIFUNZIDRAUL_NOTE: TStringField
      FieldName = 'B_SCHEMIFUNZIDRAUL_NOTE'
      Origin = 'ALLEGATI_MANUT.B_SCHEMIFUNZIDRAUL_NOTE'
      Size = 60
    end
    object QryAllB_SCHEMIFUNZELETTR: TStringField
      FieldName = 'B_SCHEMIFUNZELETTR'
      Origin = 'ALLEGATI_MANUT.B_SCHEMIFUNZELETTR'
      Size = 1
    end
    object QryAllB_SCHEMIFUNZELETTR_NOTE: TStringField
      FieldName = 'B_SCHEMIFUNZELETTR_NOTE'
      Origin = 'ALLEGATI_MANUT.B_SCHEMIFUNZELETTR_NOTE'
      Size = 60
    end
    object QryAllC_IDONLOCALEINSTALLAZ: TStringField
      FieldName = 'C_IDONLOCALEINSTALLAZ'
      Origin = 'ALLEGATI_MANUT.C_IDONLOCALEINSTALLAZ'
      Size = 1
    end
    object QryAllC_ADEGDIMENSVENTILAZ: TStringField
      FieldName = 'C_ADEGDIMENSVENTILAZ'
      Origin = 'ALLEGATI_MANUT.C_ADEGDIMENSVENTILAZ'
      Size = 1
    end
    object QryAllC_APERTVENTILAZLIBERE: TStringField
      FieldName = 'C_APERTVENTILAZLIBERE'
      Origin = 'ALLEGATI_MANUT.C_APERTVENTILAZLIBERE'
      Size = 1
    end
    object QryAllC_ESAMEVISIVOLINEEELETTRICHE: TStringField
      FieldName = 'C_ESAMEVISIVOLINEEELETTRICHE'
      Origin = 'ALLEGATI_MANUT.C_ESAMEVISIVOLINEEELETTRICHE'
      Size = 1
    end
    object QryAllC_BRUCFUNZIONAMCORRETTO: TStringField
      FieldName = 'C_BRUCFUNZIONAMCORRETTO'
      Origin = 'ALLEGATI_MANUT.C_BRUCFUNZIONAMCORRETTO'
      Size = 1
    end
    object QryAllD_PENDENZACORRETTA: TStringField
      FieldName = 'D_PENDENZACORRETTA'
      Origin = 'ALLEGATI_MANUT.D_PENDENZACORRETTA'
      Size = 1
    end
    object QryAllD_SEZIONICORRETTE: TStringField
      FieldName = 'D_SEZIONICORRETTE'
      Origin = 'ALLEGATI_MANUT.D_SEZIONICORRETTE'
      Size = 1
    end
    object QryAllD_CURVECORRETTE: TStringField
      FieldName = 'D_CURVECORRETTE'
      Origin = 'ALLEGATI_MANUT.D_CURVECORRETTE'
      Size = 1
    end
    object QryAllD_LUNGHEZZACORRETTA: TStringField
      FieldName = 'D_LUNGHEZZACORRETTA'
      Origin = 'ALLEGATI_MANUT.D_LUNGHEZZACORRETTA'
      Size = 1
    end
    object QryAllD_BUONOSTATOCONSERVAZ: TStringField
      FieldName = 'D_BUONOSTATOCONSERVAZ'
      Origin = 'ALLEGATI_MANUT.D_BUONOSTATOCONSERVAZ'
      Size = 1
    end
    object QryAllE_SCARICOCAMINOSINGOLO: TStringField
      FieldName = 'E_SCARICOCAMINOSINGOLO'
      Origin = 'ALLEGATI_MANUT.E_SCARICOCAMINOSINGOLO'
      Size = 1
    end
    object QryAllE_SCARICOCANNAFUMCOLLRAMIF: TStringField
      FieldName = 'E_SCARICOCANNAFUMCOLLRAMIF'
      Origin = 'ALLEGATI_MANUT.E_SCARICOCANNAFUMCOLLRAMIF'
      Size = 1
    end
    object QryAllE_APPSCARICAAPARETE: TStringField
      FieldName = 'E_APPSCARICAAPARETE'
      Origin = 'ALLEGATI_MANUT.E_APPSCARICAAPARETE'
      Size = 1
    end
    object QryAllE_NORIFLUSSIFUMILOCALE: TStringField
      FieldName = 'E_NORIFLUSSIFUMILOCALE'
      Origin = 'ALLEGATI_MANUT.E_NORIFLUSSIFUMILOCALE'
      Size = 1
    end
    object QryAllE_NOPERDITECONDOTTISCARICO: TStringField
      FieldName = 'E_NOPERDITECONDOTTISCARICO'
      Origin = 'ALLEGATI_MANUT.E_NOPERDITECONDOTTISCARICO'
      Size = 1
    end
    object QryAllF_UGELLIPULITI: TStringField
      FieldName = 'F_UGELLIPULITI'
      Origin = 'ALLEGATI_MANUT.F_UGELLIPULITI'
      Size = 1
    end
    object QryAllF_SCAMBLATOFUMOPULITO: TStringField
      FieldName = 'F_SCAMBLATOFUMOPULITO'
      Origin = 'ALLEGATI_MANUT.F_SCAMBLATOFUMOPULITO'
      Size = 1
    end
    object QryAllF_ACCENSFUNZAMREGOLARI: TStringField
      FieldName = 'F_ACCENSFUNZAMREGOLARI'
      Origin = 'ALLEGATI_MANUT.F_ACCENSFUNZAMREGOLARI'
      Size = 1
    end
    object QryAllF_DISPCOMANDOREGOLAZFUNZCORR: TStringField
      FieldName = 'F_DISPCOMANDOREGOLAZFUNZCORR'
      Origin = 'ALLEGATI_MANUT.F_DISPCOMANDOREGOLAZFUNZCORR'
      Size = 1
    end
    object QryAllF_ASSENZAPERDITEOSSIDAZRACC: TStringField
      FieldName = 'F_ASSENZAPERDITEOSSIDAZRACC'
      Origin = 'ALLEGATI_MANUT.F_ASSENZAPERDITEOSSIDAZRACC'
      Size = 1
    end
    object QryAllF_DISPSICUREZZANONMANOMESSI: TStringField
      FieldName = 'F_DISPSICUREZZANONMANOMESSI'
      Origin = 'ALLEGATI_MANUT.F_DISPSICUREZZANONMANOMESSI'
      Size = 1
    end
    object QryAllF_VASOESPANSIONECARICO: TStringField
      FieldName = 'F_VASOESPANSIONECARICO'
      Origin = 'ALLEGATI_MANUT.F_VASOESPANSIONECARICO'
      Size = 1
    end
    object QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI: TStringField
      FieldName = 'F_ORGSOGGSOLLECITAZTERMINTEGRI'
      Origin = 'ALLEGATI_MANUT.F_ORGSOGGSOLLECITAZTERMINTEGRI'
      Size = 1
    end
    object QryAllF_DISPROMPITIRAGGIONODETERIOR: TStringField
      FieldName = 'F_DISPROMPITIRAGGIONODETERIOR'
      Origin = 'ALLEGATI_MANUT.F_DISPROMPITIRAGGIONODETERIOR'
      Size = 1
    end
    object QryAllF_VALVOLASICUREZZASOVRAPRESS: TStringField
      FieldName = 'F_VALVOLASICUREZZASOVRAPRESS'
      Origin = 'ALLEGATI_MANUT.F_VALVOLASICUREZZASOVRAPRESS'
      Size = 1
    end
    object QryAllF_CIRCUITOARIAPULITO: TStringField
      FieldName = 'F_CIRCUITOARIAPULITO'
      Origin = 'ALLEGATI_MANUT.F_CIRCUITOARIAPULITO'
      Size = 1
    end
    object QryAllF_GUARNIZACCOPIAMINTEGRA: TStringField
      FieldName = 'F_GUARNIZACCOPIAMINTEGRA'
      Origin = 'ALLEGATI_MANUT.F_GUARNIZACCOPIAMINTEGRA'
      Size = 1
    end
    object QryAllG_CONTROLLOASSENZAFUGHEGAS: TStringField
      FieldName = 'G_CONTROLLOASSENZAFUGHEGAS'
      Origin = 'ALLEGATI_MANUT.G_CONTROLLOASSENZAFUGHEGAS'
      Size = 1
    end
    object QryAllG_ESAMEVISIVOCOIBENTAZIONI: TStringField
      FieldName = 'G_ESAMEVISIVOCOIBENTAZIONI'
      Origin = 'ALLEGATI_MANUT.G_ESAMEVISIVOCOIBENTAZIONI'
      Size = 1
    end
    object QryAllG_ESAMEVISIVOCAMINO: TStringField
      FieldName = 'G_ESAMEVISIVOCAMINO'
      Origin = 'ALLEGATI_MANUT.G_ESAMEVISIVOCAMINO'
      Size = 1
    end
    object QryAllANFUMI_EFFETTUATO: TStringField
      FieldName = 'ANFUMI_EFFETTUATO'
      Origin = 'ALLEGATI_MANUT.ANFUMI_EFFETTUATO'
      Size = 1
    end
    object QryAllANFUMI_TEMPFUMI: TIBOFloatField
      FieldName = 'ANFUMI_TEMPFUMI'
      Origin = 'ALLEGATI_MANUT.ANFUMI_TEMPFUMI'
    end
    object QryAllANFUMI_TEMPAMBIENTE: TIBOFloatField
      FieldName = 'ANFUMI_TEMPAMBIENTE'
      Origin = 'ALLEGATI_MANUT.ANFUMI_TEMPAMBIENTE'
    end
    object QryAllANFUMI_O2_PERC: TIBOFloatField
      FieldName = 'ANFUMI_O2_PERC'
      Origin = 'ALLEGATI_MANUT.ANFUMI_O2_PERC'
    end
    object QryAllANFUMI_CO2_PERC: TIBOFloatField
      FieldName = 'ANFUMI_CO2_PERC'
      Origin = 'ALLEGATI_MANUT.ANFUMI_CO2_PERC'
    end
    object QryAllANFUMI_BACHARACH_NUM: TIBOFloatField
      FieldName = 'ANFUMI_BACHARACH_NUM'
      Origin = 'ALLEGATI_MANUT.ANFUMI_BACHARACH_NUM'
    end
    object QryAllANFUMI_CO_PPM: TIBOFloatField
      FieldName = 'ANFUMI_CO_PPM'
      Origin = 'ALLEGATI_MANUT.ANFUMI_CO_PPM'
    end
    object QryAllANFUMI_CO_PERC: TIBOFloatField
      FieldName = 'ANFUMI_CO_PERC'
      Origin = 'ALLEGATI_MANUT.ANFUMI_CO_PERC'
    end
    object QryAllANFUMI_RENDIMENTO_PERC: TIBOFloatField
      FieldName = 'ANFUMI_RENDIMENTO_PERC'
      Origin = 'ALLEGATI_MANUT.ANFUMI_RENDIMENTO_PERC'
    end
    object QryAllANFUMI_TIRAGGIO_PA: TIBOFloatField
      FieldName = 'ANFUMI_TIRAGGIO_PA'
      Origin = 'ALLEGATI_MANUT.ANFUMI_TIRAGGIO_PA'
    end
    object QryAllOSSERVAZIONI: TStringField
      FieldName = 'OSSERVAZIONI'
      Origin = 'ALLEGATI_MANUT.OSSERVAZIONI'
      Size = 255
    end
    object QryAllRACCOMANDAZIONI: TStringField
      FieldName = 'RACCOMANDAZIONI'
      Origin = 'ALLEGATI_MANUT.RACCOMANDAZIONI'
      Size = 255
    end
    object QryAllRACCOMANDAZIONI_FATTO: TStringField
      FieldName = 'RACCOMANDAZIONI_FATTO'
      Origin = 'ALLEGATI_MANUT.RACCOMANDAZIONI_FATTO'
      Size = 1
    end
    object QryAllRACCOMANDAZIONI_FATTO_DATA: TDateTimeField
      FieldName = 'RACCOMANDAZIONI_FATTO_DATA'
      Origin = 'ALLEGATI_MANUT.RACCOMANDAZIONI_FATTO_DATA'
    end
    object QryAllRACCOMANDAZIONI_FATTO_NOTE: TStringField
      FieldName = 'RACCOMANDAZIONI_FATTO_NOTE'
      Origin = 'ALLEGATI_MANUT.RACCOMANDAZIONI_FATTO_NOTE'
      Size = 60
    end
    object QryAllPRESCRIZIONI: TStringField
      FieldName = 'PRESCRIZIONI'
      Origin = 'ALLEGATI_MANUT.PRESCRIZIONI'
      Size = 255
    end
    object QryAllPRESCRIZIONI_FATTO: TStringField
      FieldName = 'PRESCRIZIONI_FATTO'
      Origin = 'ALLEGATI_MANUT.PRESCRIZIONI_FATTO'
      Size = 1
    end
    object QryAllPRESCRIZIONI_FATTO_DATA: TDateTimeField
      FieldName = 'PRESCRIZIONI_FATTO_DATA'
      Origin = 'ALLEGATI_MANUT.PRESCRIZIONI_FATTO_DATA'
    end
    object QryAllPRESCRIZIONI_FATTO_NOTE: TStringField
      FieldName = 'PRESCRIZIONI_FATTO_NOTE'
      Origin = 'ALLEGATI_MANUT.PRESCRIZIONI_FATTO_NOTE'
      Size = 60
    end
    object QryAllIMPPUOFUNZIONARE: TStringField
      FieldName = 'IMPPUOFUNZIONARE'
      Origin = 'ALLEGATI_MANUT.IMPPUOFUNZIONARE'
      Size = 1
    end
    object QryAllTECNICO_RESOURCEID: TIntegerField
      FieldName = 'TECNICO_RESOURCEID'
      Origin = 'ALLEGATI_MANUT.TECNICO_RESOURCEID'
    end
    object QryAllTECNICO_NOMECOGNOME: TStringField
      FieldName = 'TECNICO_NOMECOGNOME'
      Origin = 'ALLEGATI_MANUT.TECNICO_NOMECOGNOME'
      Size = 60
    end
    object QryAllTECNICO_RAGSOC: TStringField
      FieldName = 'TECNICO_RAGSOC'
      Origin = 'ALLEGATI_MANUT.TECNICO_RAGSOC'
      Size = 60
    end
    object QryAllTECNICO_INDIRIZZO: TStringField
      FieldName = 'TECNICO_INDIRIZZO'
      Origin = 'ALLEGATI_MANUT.TECNICO_INDIRIZZO'
      Size = 100
    end
    object QryAllTECNICO_TELEFONO: TStringField
      FieldName = 'TECNICO_TELEFONO'
      Origin = 'ALLEGATI_MANUT.TECNICO_TELEFONO'
      Size = 30
    end
    object QryAllTECNICO_ESTREMIDOCQUALIFICA: TStringField
      FieldName = 'TECNICO_ESTREMIDOCQUALIFICA'
      Origin = 'ALLEGATI_MANUT.TECNICO_ESTREMIDOCQUALIFICA'
      Size = 60
    end
    object QryAllDATAORADAIMPEGNO: TStringField
      FieldName = 'DATAORADAIMPEGNO'
      Origin = 'ALLEGATI_MANUT.DATAORADAIMPEGNO'
      OnChange = QryAllDATAORADAIMPEGNOChange
      Size = 1
    end
    object QryAllTECNICO_DAIMPEGNO: TStringField
      FieldName = 'TECNICO_DAIMPEGNO'
      Origin = 'ALLEGATI_MANUT.TECNICO_DAIMPEGNO'
      OnChange = QryAllTECNICO_DAIMPEGNOChange
      Size = 1
    end
    object QryAllSTATOAVANZAMENTO: TSmallintField
      FieldName = 'STATOAVANZAMENTO'
      Origin = 'ALLEGATI_MANUT.STATOAVANZAMENTO'
    end
    object QryAllINDIRIZZORESPIMP_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'INDIRIZZORESPIMP_FULL'
      Size = 200
      Calculated = True
    end
    object QryAllPROPINDIRIZZO_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'PROPINDIRIZZO_FULL'
      Size = 200
      Calculated = True
    end
    object QryAllTECNICO_INDIRIZZO_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'TECNICO_INDIRIZZO_FULL'
      Size = 200
      Calculated = True
    end
    object QryAllCOMPUTED_STR_CERTIFIED_IMM: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_STR_CERTIFIED_IMM'
      Size = 1
      Calculated = True
    end
    object QryAllPROPCODICEISTATCOMUNE: TStringField
      FieldName = 'PROPCODICEISTATCOMUNE'
      Origin = 'ALLEGATI_MANUT.PROPCODICEISTATCOMUNE'
      Size = 10
    end
    object QryAllCODICEISTATCOMUNERESPIMP: TStringField
      FieldName = 'CODICEISTATCOMUNERESPIMP'
      Origin = 'ALLEGATI_MANUT.CODICEISTATCOMUNERESPIMP'
      Size = 10
    end
    object QryAllBOLLINO_PREFISSO: TStringField
      FieldName = 'BOLLINO_PREFISSO'
      Origin = 'ALLEGATI_MANUT.BOLLINO_PREFISSO'
      Size = 4
    end
    object QryAllBOLLINO_NUMERO: TStringField
      FieldName = 'BOLLINO_NUMERO'
      Origin = 'ALLEGATI_MANUT.BOLLINO_NUMERO'
      Size = 50
    end
    object QryAllBOLLINO_CALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'BOLLINO_CALC'
      Size = 30
      Calculated = True
    end
    object QryAllFIRMAPRESENTE_RESPONSABILE: TStringField
      FieldName = 'FIRMAPRESENTE_RESPONSABILE'
      Origin = 'ALLEGATI_MANUT.FIRMAPRESENTE_RESPONSABILE'
      Size = 1
    end
    object QryAllFIRMAPRESENTE_TECNICO: TStringField
      FieldName = 'FIRMAPRESENTE_TECNICO'
      Origin = 'ALLEGATI_MANUT.FIRMAPRESENTE_TECNICO'
      Size = 1
    end
    object QryAllNATURAGIURIDICARESPIMP: TStringField
      FieldName = 'NATURAGIURIDICARESPIMP'
      Origin = 'ALLEGATI_MANUT.NATURAGIURIDICARESPIMP'
      FixedChar = True
      Size = 1
    end
    object QryAllNOMERESPIMP: TStringField
      FieldName = 'NOMERESPIMP'
      Origin = 'ALLEGATI_MANUT.NOMERESPIMP'
      Size = 60
    end
    object QryAllCOGNOMERESPIMP: TStringField
      FieldName = 'COGNOMERESPIMP'
      Origin = 'ALLEGATI_MANUT.COGNOMERESPIMP'
      Size = 60
    end
    object QryAllB_LIBRETTOIMPIANTOCOMPILATO: TStringField
      FieldName = 'B_LIBRETTOIMPIANTOCOMPILATO'
      Origin = 'ALLEGATI_MANUT.B_LIBRETTOIMPIANTOCOMPILATO'
      FixedChar = True
      Size = 1
    end
    object QryAllC_EXTINST_GENERATOREIDONEO: TStringField
      FieldName = 'C_EXTINST_GENERATOREIDONEO'
      Origin = 'ALLEGATI_MANUT.C_EXTINST_GENERATOREIDONEO'
      FixedChar = True
      Size = 1
    end
    object QryAllF_SISTIREGOLAZTEMPFUNZIONANTE: TStringField
      FieldName = 'F_SISTIREGOLAZTEMPFUNZIONANTE'
      Origin = 'ALLEGATI_MANUT.F_SISTIREGOLAZTEMPFUNZIONANTE'
      FixedChar = True
      Size = 1
    end
    object QryAllG_ASSENZAPERDITECOMBLIQUIDO: TStringField
      FieldName = 'G_ASSENZAPERDITECOMBLIQUIDO'
      Origin = 'ALLEGATI_MANUT.G_ASSENZAPERDITECOMBLIQUIDO'
      FixedChar = True
      Size = 1
    end
    object QryAllG_RISCTRLUNI10389_1: TStringField
      FieldName = 'G_RISCTRLUNI10389_1'
      Origin = 'ALLEGATI_MANUT.G_RISCTRLUNI10389_1'
      FixedChar = True
      Size = 1
    end
    object QryAllANFUMI_RENDMINIMOLEGGE: TIBOFloatField
      FieldName = 'ANFUMI_RENDMINIMOLEGGE'
      Origin = 'ALLEGATI_MANUT.ANFUMI_RENDMINIMOLEGGE'
    end
    object QryAllANFUMI_MODULOTERMICO: TStringField
      FieldName = 'ANFUMI_MODULOTERMICO'
      Origin = 'ALLEGATI_MANUT.ANFUMI_MODULOTERMICO'
      Size = 8
    end
    object QryAllCHKLST_ADOZVALVTERMOST: TStringField
      FieldName = 'CHKLST_ADOZVALVTERMOST'
      Origin = 'ALLEGATI_MANUT.CHKLST_ADOZVALVTERMOST'
      FixedChar = True
      Size = 1
    end
    object QryAllCHKLST_ISOLAMRETEDISTRIB: TStringField
      FieldName = 'CHKLST_ISOLAMRETEDISTRIB'
      Origin = 'ALLEGATI_MANUT.CHKLST_ISOLAMRETEDISTRIB'
      FixedChar = True
      Size = 1
    end
    object QryAllCHKLST_SISTTRATTAMACQUA: TStringField
      FieldName = 'CHKLST_SISTTRATTAMACQUA'
      Origin = 'ALLEGATI_MANUT.CHKLST_SISTTRATTAMACQUA'
      FixedChar = True
      Size = 1
    end
    object QryAllCHKLST_SOSTSISTREGOLAZ: TStringField
      FieldName = 'CHKLST_SOSTSISTREGOLAZ'
      Origin = 'ALLEGATI_MANUT.CHKLST_SOSTSISTREGOLAZ'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O_DUREZZATOTALE: TIBOFloatField
      FieldName = 'TH2O_DUREZZATOTALE'
      Origin = 'ALLEGATI_MANUT.TH2O_DUREZZATOTALE'
    end
    object QryAllTH2O_TRATTRISCALDAM: TStringField
      FieldName = 'TH2O_TRATTRISCALDAM'
      Origin = 'ALLEGATI_MANUT.TH2O_TRATTRISCALDAM'
      FixedChar = True
      Size = 30
    end
    object QryAllTH2O_TRATTACS: TStringField
      FieldName = 'TH2O_TRATTACS'
      Origin = 'ALLEGATI_MANUT.TH2O_TRATTACS'
      FixedChar = True
      Size = 30
    end
    object QryAllPAG: TStringField
      FieldName = 'PAG'
      Origin = 'ALLEGATI_MANUT.PAG'
      Size = 3
    end
    object QryAllPAGDI: TStringField
      FieldName = 'PAGDI'
      Origin = 'ALLEGATI_MANUT.PAGDI'
      Size = 3
    end
    object QryAllPOTENZANOMINALEMAX: TIBOFloatField
      FieldName = 'POTENZANOMINALEMAX'
      Origin = 'ALLEGATI_MANUT.POTENZANOMINALEMAX'
    end
    object QryAllPARTITAIVARESPIMP: TStringField
      FieldName = 'PARTITAIVARESPIMP'
      Origin = 'ALLEGATI_MANUT.PARTITAIVARESPIMP'
      Size = 11
    end
    object QryAllGENCAL_GRUPPOTERMICO_GT: TStringField
      FieldName = 'GENCAL_GRUPPOTERMICO_GT'
      Origin = 'ALLEGATI_MANUT.GENCAL_GRUPPOTERMICO_GT'
      Size = 10
    end
    object QryAllGENCAL_TIPOLOGIA2: TStringField
      FieldName = 'GENCAL_TIPOLOGIA2'
      Origin = 'ALLEGATI_MANUT.GENCAL_TIPOLOGIA2'
    end
    object QryAllGENCAL_TIPOLOGIA2_ALTRO: TStringField
      FieldName = 'GENCAL_TIPOLOGIA2_ALTRO'
      Origin = 'ALLEGATI_MANUT.GENCAL_TIPOLOGIA2_ALTRO'
    end
    object QryAllANFUMI_CUFUMISECCHI: TIBOFloatField
      FieldName = 'ANFUMI_CUFUMISECCHI'
      Origin = 'ALLEGATI_MANUT.ANFUMI_CUFUMISECCHI'
    end
    object QryAllANFUMI_PORTATACOMBUSTIBILE: TIBOFloatField
      FieldName = 'ANFUMI_PORTATACOMBUSTIBILE'
      Origin = 'ALLEGATI_MANUT.ANFUMI_PORTATACOMBUSTIBILE'
    end
    object QryAllANFUMI_RISPETTA_BACHARACH: TStringField
      FieldName = 'ANFUMI_RISPETTA_BACHARACH'
      Origin = 'ALLEGATI_MANUT.ANFUMI_RISPETTA_BACHARACH'
      FixedChar = True
      Size = 1
    end
    object QryAllANFUMI_RISPETTA_CO_FUMISECCHI: TStringField
      FieldName = 'ANFUMI_RISPETTA_CO_FUMISECCHI'
      Origin = 'ALLEGATI_MANUT.ANFUMI_RISPETTA_CO_FUMISECCHI'
      FixedChar = True
      Size = 1
    end
    object QryAllANFUMI_RISPETTA_RENDIMENTO: TStringField
      FieldName = 'ANFUMI_RISPETTA_RENDIMENTO'
      Origin = 'ALLEGATI_MANUT.ANFUMI_RISPETTA_RENDIMENTO'
      FixedChar = True
      Size = 1
    end
    object QryAllANFUMI_NOX_PPM: TIBOFloatField
      FieldName = 'ANFUMI_NOX_PPM'
      Origin = 'ALLEGATI_MANUT.ANFUMI_NOX_PPM'
    end
    object QryAllH2OREINTEGRO1_ESERCIZIO1: TStringField
      FieldName = 'H2OREINTEGRO1_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO1_ESERCIZIO1'
      Size = 4
    end
    object QryAllH2OREINTEGRO1_ESERCIZIO2: TStringField
      FieldName = 'H2OREINTEGRO1_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO1_ESERCIZIO2'
      Size = 4
    end
    object QryAllH2OREINTEGRO1_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO1_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO1_LETTURAINIZIALE'
    end
    object QryAllH2OREINTEGRO1_LETTURAFINALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO1_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO1_LETTURAFINALE'
    end
    object QryAllH2OREINTEGRO1_CONSUMOTOTALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO1_CONSUMOTOTALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO1_CONSUMOTOTALE'
    end
    object QryAllH2OREINTEGRO2_ESERCIZIO1: TStringField
      FieldName = 'H2OREINTEGRO2_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO2_ESERCIZIO1'
      Size = 4
    end
    object QryAllH2OREINTEGRO2_ESERCIZIO2: TStringField
      FieldName = 'H2OREINTEGRO2_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO2_ESERCIZIO2'
      Size = 4
    end
    object QryAllH2OREINTEGRO2_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO2_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO2_LETTURAINIZIALE'
    end
    object QryAllH2OREINTEGRO2_LETTURAFINALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO2_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO2_LETTURAFINALE'
    end
    object QryAllH2OREINTEGRO2_CONSUMOTOTALE: TIBOFloatField
      FieldName = 'H2OREINTEGRO2_CONSUMOTOTALE'
      Origin = 'ALLEGATI_MANUT.H2OREINTEGRO2_CONSUMOTOTALE'
    end
    object QryAllTH2O1_NOMEPRODOTTO: TStringField
      FieldName = 'TH2O1_NOMEPRODOTTO'
      Origin = 'ALLEGATI_MANUT.TH2O1_NOMEPRODOTTO'
      Size = 30
    end
    object QryAllTH2O1_ESERCIZIO1: TStringField
      FieldName = 'TH2O1_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.TH2O1_ESERCIZIO1'
      Size = 4
    end
    object QryAllTH2O1_ESERCIZIO2: TStringField
      FieldName = 'TH2O1_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.TH2O1_ESERCIZIO2'
      Size = 4
    end
    object QryAllTH2O1_QTACONSUMATA: TIBOFloatField
      FieldName = 'TH2O1_QTACONSUMATA'
      Origin = 'ALLEGATI_MANUT.TH2O1_QTACONSUMATA'
    end
    object QryAllTH2O1_UM: TStringField
      FieldName = 'TH2O1_UM'
      Origin = 'ALLEGATI_MANUT.TH2O1_UM'
      Size = 3
    end
    object QryAllTH2O1_CIRCUITO_IMPTERMICO: TStringField
      FieldName = 'TH2O1_CIRCUITO_IMPTERMICO'
      Origin = 'ALLEGATI_MANUT.TH2O1_CIRCUITO_IMPTERMICO'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O1_CIRCUITO_ACS: TStringField
      FieldName = 'TH2O1_CIRCUITO_ACS'
      Origin = 'ALLEGATI_MANUT.TH2O1_CIRCUITO_ACS'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O1_CIRCUITO_ALTRO: TStringField
      FieldName = 'TH2O1_CIRCUITO_ALTRO'
      Origin = 'ALLEGATI_MANUT.TH2O1_CIRCUITO_ALTRO'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O2_NOMEPRODOTTO: TStringField
      FieldName = 'TH2O2_NOMEPRODOTTO'
      Origin = 'ALLEGATI_MANUT.TH2O2_NOMEPRODOTTO'
      Size = 30
    end
    object QryAllTH2O2_ESERCIZIO1: TStringField
      FieldName = 'TH2O2_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.TH2O2_ESERCIZIO1'
      Size = 4
    end
    object QryAllTH2O2_ESERCIZIO2: TStringField
      FieldName = 'TH2O2_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.TH2O2_ESERCIZIO2'
      Size = 4
    end
    object QryAllTH2O2_QTACONSUMATA: TIBOFloatField
      FieldName = 'TH2O2_QTACONSUMATA'
      Origin = 'ALLEGATI_MANUT.TH2O2_QTACONSUMATA'
    end
    object QryAllTH2O2_UM: TStringField
      FieldName = 'TH2O2_UM'
      Origin = 'ALLEGATI_MANUT.TH2O2_UM'
      Size = 3
    end
    object QryAllTH2O2_CIRCUITO_IMPTERMICO: TStringField
      FieldName = 'TH2O2_CIRCUITO_IMPTERMICO'
      Origin = 'ALLEGATI_MANUT.TH2O2_CIRCUITO_IMPTERMICO'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O2_CIRCUITO_ACS: TStringField
      FieldName = 'TH2O2_CIRCUITO_ACS'
      Origin = 'ALLEGATI_MANUT.TH2O2_CIRCUITO_ACS'
      FixedChar = True
      Size = 1
    end
    object QryAllTH2O2_CIRCUITO_ALTRO: TStringField
      FieldName = 'TH2O2_CIRCUITO_ALTRO'
      Origin = 'ALLEGATI_MANUT.TH2O2_CIRCUITO_ALTRO'
      FixedChar = True
      Size = 1
    end
    object QryAllCOMBUSTIBILE1_NOME: TStringField
      FieldName = 'COMBUSTIBILE1_NOME'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_NOME'
    end
    object QryAllCOMBUSTIBILE1_UM: TStringField
      FieldName = 'COMBUSTIBILE1_UM'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_UM'
      Size = 3
    end
    object QryAllCOMBUSTIBILE1_ESERCIZIO1: TStringField
      FieldName = 'COMBUSTIBILE1_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_ESERCIZIO1'
      Size = 4
    end
    object QryAllCOMBUSTIBILE1_ESERCIZIO2: TStringField
      FieldName = 'COMBUSTIBILE1_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_ESERCIZIO2'
      Size = 4
    end
    object QryAllCOMBUSTIBILE1_ACQUISTI: TIBOFloatField
      FieldName = 'COMBUSTIBILE1_ACQUISTI'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_ACQUISTI'
    end
    object QryAllCOMBUSTIBILE1_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'COMBUSTIBILE1_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_LETTURAINIZIALE'
    end
    object QryAllCOMBUSTIBILE1_LETTURAFINALE: TIBOFloatField
      FieldName = 'COMBUSTIBILE1_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_LETTURAFINALE'
    end
    object QryAllCOMBUSTIBILE1_CONSUMO: TIBOFloatField
      FieldName = 'COMBUSTIBILE1_CONSUMO'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE1_CONSUMO'
    end
    object QryAllCOMBUSTIBILE2_NOME: TStringField
      FieldName = 'COMBUSTIBILE2_NOME'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_NOME'
    end
    object QryAllCOMBUSTIBILE2_UM: TStringField
      FieldName = 'COMBUSTIBILE2_UM'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_UM'
      Size = 3
    end
    object QryAllCOMBUSTIBILE2_ESERCIZIO1: TStringField
      FieldName = 'COMBUSTIBILE2_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_ESERCIZIO1'
      Size = 4
    end
    object QryAllCOMBUSTIBILE2_ESERCIZIO2: TStringField
      FieldName = 'COMBUSTIBILE2_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_ESERCIZIO2'
      Size = 4
    end
    object QryAllCOMBUSTIBILE2_ACQUISTI: TIBOFloatField
      FieldName = 'COMBUSTIBILE2_ACQUISTI'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_ACQUISTI'
    end
    object QryAllCOMBUSTIBILE2_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'COMBUSTIBILE2_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_LETTURAINIZIALE'
    end
    object QryAllCOMBUSTIBILE2_LETTURAFINALE: TIBOFloatField
      FieldName = 'COMBUSTIBILE2_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_LETTURAFINALE'
    end
    object QryAllCOMBUSTIBILE2_CONSUMO: TIBOFloatField
      FieldName = 'COMBUSTIBILE2_CONSUMO'
      Origin = 'ALLEGATI_MANUT.COMBUSTIBILE2_CONSUMO'
    end
    object QryAllELETTRICITA1_ESERCIZIO1: TStringField
      FieldName = 'ELETTRICITA1_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA1_ESERCIZIO1'
      Size = 4
    end
    object QryAllELETTRICITA1_ESERCIZIO2: TStringField
      FieldName = 'ELETTRICITA1_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA1_ESERCIZIO2'
      Size = 4
    end
    object QryAllELETTRICITA1_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'ELETTRICITA1_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA1_LETTURAINIZIALE'
    end
    object QryAllELETTRICITA1_LETTURAFINALE: TIBOFloatField
      FieldName = 'ELETTRICITA1_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA1_LETTURAFINALE'
    end
    object QryAllELETTRICITA1_CONSUMOTOTALE: TIBOFloatField
      FieldName = 'ELETTRICITA1_CONSUMOTOTALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA1_CONSUMOTOTALE'
    end
    object QryAllELETTRICITA2_ESERCIZIO1: TStringField
      FieldName = 'ELETTRICITA2_ESERCIZIO1'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA2_ESERCIZIO1'
      Size = 4
    end
    object QryAllELETTRICITA2_ESERCIZIO2: TStringField
      FieldName = 'ELETTRICITA2_ESERCIZIO2'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA2_ESERCIZIO2'
      Size = 4
    end
    object QryAllELETTRICITA2_LETTURAINIZIALE: TIBOFloatField
      FieldName = 'ELETTRICITA2_LETTURAINIZIALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA2_LETTURAINIZIALE'
    end
    object QryAllELETTRICITA2_LETTURAFINALE: TIBOFloatField
      FieldName = 'ELETTRICITA2_LETTURAFINALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA2_LETTURAFINALE'
    end
    object QryAllELETTRICITA2_CONSUMOTOTALE: TIBOFloatField
      FieldName = 'ELETTRICITA2_CONSUMOTOTALE'
      Origin = 'ALLEGATI_MANUT.ELETTRICITA2_CONSUMOTOTALE'
    end
    object QryAllFRIGO_NUMCIRCUITI: TIntegerField
      FieldName = 'FRIGO_NUMCIRCUITI'
      Origin = 'ALLEGATI_MANUT.FRIGO_NUMCIRCUITI'
    end
    object QryAllFRIGO_POTENZAFRIGORIFERA: TIBOFloatField
      FieldName = 'FRIGO_POTENZAFRIGORIFERA'
      Origin = 'ALLEGATI_MANUT.FRIGO_POTENZAFRIGORIFERA'
    end
    object QryAllFRIGO_RAFFRESCAMENTO: TStringField
      FieldName = 'FRIGO_RAFFRESCAMENTO'
      Origin = 'ALLEGATI_MANUT.FRIGO_RAFFRESCAMENTO'
      FixedChar = True
      Size = 1
    end
    object QryAlMODPROVA_RAFFRESCAMENTO: TStringField
      FieldName = 'MODPROVA_RAFFRESCAMENTO'
      Origin = 'ALLEGATI_MANUT.MODPROVA_RAFFRESCAMENTO'
      FixedChar = True
      Size = 1
    end
    object QryAlMODPROVA_RISCALDAMENTO: TStringField
      FieldName = 'MODPROVA_RISCALDAMENTO'
      Origin = 'ALLEGATI_MANUT.MODPROVA_RISCALDAMENTO'
      FixedChar = True
      Size = 1
    end
    object QryAllTORAF_TEMPUSCFLUIDO: TIBOFloatField
      FieldName = 'TORAF_TEMPUSCFLUIDO'
      Origin = 'ALLEGATI_MANUT.TORAF_TEMPUSCFLUIDO'
    end
    object QryAllTORAF_TEMPBULBOUMIDOARIA: TIBOFloatField
      FieldName = 'TORAF_TEMPBULBOUMIDOARIA'
      Origin = 'ALLEGATI_MANUT.TORAF_TEMPBULBOUMIDOARIA'
    end
    object QryAllSCAMBINT_TEMPINGLATOEXT: TIBOFloatField
      FieldName = 'SCAMBINT_TEMPINGLATOEXT'
      Origin = 'ALLEGATI_MANUT.SCAMBINT_TEMPINGLATOEXT'
    end
    object QryAllSCAMBINT_TEMPUSCLATOEXT: TIBOFloatField
      FieldName = 'SCAMBINT_TEMPUSCLATOEXT'
      Origin = 'ALLEGATI_MANUT.SCAMBINT_TEMPUSCLATOEXT'
    end
    object QryAllSCAMBINT_TEMPINGLATOMACCHINA: TIBOFloatField
      FieldName = 'SCAMBINT_TEMPINGLATOMACCHINA'
      Origin = 'ALLEGATI_MANUT.SCAMBINT_TEMPINGLATOMACCHINA'
    end
    object QryAllSCAMBINT_TEMPUSCLATOMACCHINA: TIBOFloatField
      FieldName = 'SCAMBINT_TEMPUSCLATOMACCHINA'
      Origin = 'ALLEGATI_MANUT.SCAMBINT_TEMPUSCLATOMACCHINA'
    end
    object QryAllGENCAL_TIPOTIRAGGIO_ALTRO: TStringField
      FieldName = 'GENCAL_TIPOTIRAGGIO_ALTRO'
    end
    object QryAllGENCAL_CUCINA: TStringField
      FieldName = 'GENCAL_CUCINA'
      FixedChar = True
      Size = 1
    end
    object QryAllGENCAL_MARCATURACE: TStringField
      FieldName = 'GENCAL_MARCATURACE'
      Size = 10
    end
    object QryAllGENCAL_PLACCACAMINO: TStringField
      FieldName = 'GENCAL_PLACCACAMINO'
      Size = 10
    end
    object QryAllGENCAL_MODEVACUAZFUMI: TStringField
      FieldName = 'GENCAL_MODEVACUAZFUMI'
      Size = 10
    end
    object QryAllGENCAL_ARIACOMBURENTE: TStringField
      FieldName = 'GENCAL_ARIACOMBURENTE'
      Size = 10
    end
    object QryAllGENCAL_CONTRARIACOMBURENTE: TStringField
      FieldName = 'GENCAL_CONTRARIACOMBURENTE'
      Size = 10
    end
    object QryAllGENCAL_CARICACOMBUSTIBILE: TStringField
      FieldName = 'GENCAL_CARICACOMBUSTIBILE'
      Size = 10
    end
    object QryAllCOPIE: TSmallintField
      FieldName = 'COPIE'
    end
    object QryAllANFUMI_PORTATATERMICAEFFETTIVA: TIBOFloatField
      FieldName = 'ANFUMI_PORTATATERMICAEFFETTIVA'
    end
    object QryAllCONTREG_TIPODISTRIBUZIONE: TStringField
      FieldName = 'CONTREG_TIPODISTRIBUZIONE'
      FixedChar = True
      Size = 1
    end
    object QryAllCONTREG_UNITAIMMCONTABILIZATE: TStringField
      FieldName = 'CONTREG_UNITAIMMCONTABILIZATE'
      FixedChar = True
      Size = 1
    end
    object QryAllCONTREG_VALVOLETERMOSTATPRES: TStringField
      FieldName = 'CONTREG_VALVOLETERMOSTATPRES'
      FixedChar = True
      Size = 1
    end
    object QryAllCONTREG_TIPOCONTABILIZZAZIONE: TStringField
      FieldName = 'CONTREG_TIPOCONTABILIZZAZIONE'
      FixedChar = True
      Size = 1
    end
    object QryAllCONTREG_ALTRISISTTERMOREGOLAZ: TStringField
      FieldName = 'CONTREG_ALTRISISTTERMOREGOLAZ'
      Size = 30
    end
    object QryAllCONTREG_CORRETTOFUNZIONAMENTO: TStringField
      FieldName = 'CONTREG_CORRETTOFUNZIONAMENTO'
      FixedChar = True
      Size = 1
    end
    object QryAllANFUMI_BACHARACH_NUM2: TIBOFloatField
      FieldName = 'ANFUMI_BACHARACH_NUM2'
    end
    object QryAllANFUMI_BACHARACH_NUM3: TIBOFloatField
      FieldName = 'ANFUMI_BACHARACH_NUM3'
    end
  end
  object SourceAll: TDataSource
    AutoEdit = False
    DataSet = QryAll
    Left = 173
    Top = 9
  end
  object TransAll: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 115
    Top = 9
  end
  object QryPrat: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_PA_ID'
        ParamType = ptInput
      end>
    EditSQL.Strings = (
      '')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAll
    LockSQL.Strings = (
      'UPDATE ALLEGATI_MANUT SET'
      'ID = ID'
      'WHERE ID =: OLD_ID')
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      
        ' CAST(P.CODICE || '#39' - '#39' || P.DATAAPERTURA || '#39' - '#39' || P.DESCRIZI' +
        'ONE AS VARCHAR(200)) AS PRATICA_FULL,'
      
        ' P.CODICE, P.DATAAPERTURA, P.ID, P.CATASTO_SEZIONE_IMM, P.CATAST' +
        'O_FOGLIO_IMM, P.CATASTO_PARTICELLA_IMM, P.CATASTO_SUB_IMM,'
      ' P.POD, P.PDR, P.PROXVISITAENTRO,'
      ' PFG.*'
      'FROM PRATAPPARECCHI PA'
      'LEFT JOIN PRATICHE P ON (P.ID = PA.IDPRATICA)'
      'LEFT JOIN GET_PARAM_ALLEGATIFG(P.ID) PFG ON (1=1)'
      'WHERE PA.ID = :P_PA_ID'
      ''
      '')
    Left = 256
    Top = 9
    object QryPratPRATICA_FULL: TStringField
      FieldName = 'PRATICA_FULL'
      ReadOnly = True
      Size = 200
    end
    object QryPratCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object QryPratDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
    end
    object QryPratID: TIntegerField
      FieldName = 'ID'
    end
    object QryPratDEFAULTALLEGATIFGPRINTERNAME: TStringField
      FieldName = 'DEFAULTALLEGATIFGPRINTERNAME'
      Size = 30
    end
    object QryPratDEFAULTALLEGATOFFILENAME: TStringField
      FieldName = 'DEFAULTALLEGATOFFILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATOGFILENAME: TStringField
      FieldName = 'DEFAULTALLEGATOGFILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATORCEE1FILENAME: TStringField
      FieldName = 'DEFAULTALLEGATORCEE1FILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATORCEE1BFILENAME: TStringField
      FieldName = 'DEFAULTALLEGATORCEE1BFILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATORCEE2FILENAME: TStringField
      FieldName = 'DEFAULTALLEGATORCEE2FILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATORCEE3FILENAME: TStringField
      FieldName = 'DEFAULTALLEGATORCEE3FILENAME'
      Size = 50
    end
    object QryPratDEFAULTALLEGATORCEE4FILENAME: TStringField
      FieldName = 'DEFAULTALLEGATORCEE4FILENAME'
      Size = 50
    end
    object QryPratCATASTO_SEZIONE_IMM: TStringField
      FieldName = 'CATASTO_SEZIONE_IMM'
    end
    object QryPratCATASTO_FOGLIO_IMM: TStringField
      FieldName = 'CATASTO_FOGLIO_IMM'
    end
    object QryPratCATASTO_PARTICELLA_IMM: TStringField
      FieldName = 'CATASTO_PARTICELLA_IMM'
    end
    object QryPratCATASTO_SUB_IMM: TStringField
      FieldName = 'CATASTO_SUB_IMM'
    end
    object QryPratPOD: TStringField
      FieldName = 'POD'
    end
    object QryPratPDR: TStringField
      FieldName = 'PDR'
    end
    object QryPratPROXVISITAENTRO: TDateTimeField
      FieldName = 'PROXVISITAENTRO'
    end
  end
  object SourcePrat: TDataSource
    AutoEdit = False
    DataSet = QryPrat
    Left = 285
    Top = 9
  end
  object SP_AggiornaTecnico: TIB_StoredProc
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAll
    SQL.Strings = (
      'EXECUTE PROCEDURE IMP_AGGIORNA_TECNICO_ALL'
      '  ?IMP_AGGIORNA_TECNICO_ALL.IN_IDIMPEGNO,'
      '  ?IMP_AGGIORNA_TECNICO_ALL.IN_CODICETECNICO')
    ParamNames.Strings = (
      'IN_IDIMPEGNO'
      'IN_CODICETECNICO')
    StoredProcName = 'IMP_AGGIORNA_TECNICO_ALL'
    Left = 202
    Top = 9
  end
  object MenuStampe: TPopupMenu
    Left = 512
    Top = 9
    object StampaKITperiltecnico1: TMenuItem
      Caption = 'Stampa KIT per il tecnico'
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Fogliodilavoro1: TMenuItem
      Caption = 'Foglio di lavoro'
      Visible = False
    end
    object Rapportointerventiprecedenti1: TMenuItem
      Caption = 'Rapporto interventi precedenti'
      Visible = False
    end
    object AllegatoGfrontespizio1: TMenuItem
      Caption = 'Allegato G - (frontespizio)'
      Visible = False
      OnClick = AllegatoGfrontespizio1Click
    end
    object AllegatoGRetro1: TMenuItem
      Caption = 'Allegato G - (Retro)'
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object AllegatoHfrontespizio1: TMenuItem
      Caption = 'Allegato H - (frontespizio)'
      Visible = False
    end
    object AllegatoHRetro1: TMenuItem
      Caption = 'Allegato H - (Retro)'
      Visible = False
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Stampaallegato1: TMenuItem
      Caption = 'Rapporto di controllo di efficienza energetica'
      OnClick = Stampaallegato1Click
    end
  end
  object QryImpStm: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
    EditSQL.Strings = (
      '')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAll
    LockSQL.Strings = (
      'UPDATE ALLEGATI_MANUT SET'
      'ID = ID'
      'WHERE ID =: OLD_ID')
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      
        '  CAST(   (CASE WHEN(AM.DATAORADAIMPEGNO <> '#39'F'#39') THEN I.DATAORAI' +
        'NTERVENTO ELSE AM.DATACONTROLLO END)   AS TIMESTAMP) AS DATACONT' +
        'ROLLO,'
      
        '  CAST(   (CASE WHEN(AM.DATAORADAIMPEGNO <> '#39'F'#39') THEN I.DATAORAI' +
        'NTERVENTO ELSE AM.DATAORAARRIVO END)   AS TIMESTAMP) AS DATAORAA' +
        'RRIVO,'
      
        '  CAST(   (CASE WHEN(AM.DATAORADAIMPEGNO <> '#39'F'#39') THEN I.DATAORAF' +
        'INEINTERVENTO ELSE AM.DATAORAPARTENZA END)   AS TIMESTAMP) AS DA' +
        'TAORAPARTENZA,'
      
        '  CAST(   TRIM(COALESCE(AM.OSSERVAZIONI,'#39#39'))  AS VARCHAR(1000)) ' +
        'AS OSSERVAZIONI,'
      
        '  CAST(   TRIM(COALESCE(AM.RACCOMANDAZIONI,'#39#39'))  AS VARCHAR(1000' +
        ')) AS RACCOMANDAZIONI,'
      
        '  CAST(   TRIM(COALESCE(AM.PRESCRIZIONI,'#39#39'))  AS VARCHAR(1000)) ' +
        'AS PRESCRIZIONI'
      'FROM ALLEGATI_MANUT AM'
      'LEFT JOIN IMPEGNI I ON (I.MASTER_ID = AM.IDIMPEGNO)'
      'WHERE AM.ID = :P_ID'
      ''
      '')
    Left = 336
    Top = 9
    object QryImpStmDATACONTROLLO: TDateTimeField
      FieldName = 'DATACONTROLLO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QryImpStmDATAORAARRIVO: TDateTimeField
      FieldName = 'DATAORAARRIVO'
      ReadOnly = True
      DisplayFormat = 'hh:nn'
    end
    object QryImpStmDATAORAPARTENZA: TDateTimeField
      FieldName = 'DATAORAPARTENZA'
      ReadOnly = True
      DisplayFormat = 'hh:nn'
    end
    object QryImpStmOSSERVAZIONI: TStringField
      FieldName = 'OSSERVAZIONI'
      Size = 1000
    end
    object QryImpStmRACCOMANDAZIONI: TStringField
      FieldName = 'RACCOMANDAZIONI'
      Size = 1000
    end
    object QryImpStmPRESCRIZIONI: TStringField
      FieldName = 'PRESCRIZIONI'
      Size = 1000
    end
  end
  object SourceImp: TDataSource
    AutoEdit = False
    DataSet = QryImpStm
    Left = 365
    Top = 9
  end
  object ReportDesignerDialog1: TReportDesignerDialog
    LabelSettings.FirstLabel = 0
    LabelSettings.LabelCount = 0
    ShowFilterBeforePrint = False
    UseDataModules = False
    UseCurrentDatasets = True
    SaveLoadPrinterSetup = False
    ScriptsEnabled = True
    PrepareAutomatically = False
    PrintIfEmpty = True
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    UsePrinterSettings = True
    UseModalPreview = False
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    Version = '1.59.0'
    SQLSettings.DelimiterType = delCustom
    UserSettings = [AllowSQLEdit, AllowDatasetEdit, AllowBlockEdit, AllowScriptEdit]
    EditorSettings = [AutoEditAfterInsert, ShowDatafieldListbox, DatafieldsSorted, ShowScriptIndicator]
    DefaultFileExtension = '.QR2'
    DefaultFileFilter = 'Reports|*.QR2'
    Left = 448
    Top = 8
  end
  object QryDatiAzie: TIBOQuery
    EditSQL.Strings = (
      '')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAll
    LockSQL.Strings = (
      'UPDATE ALLEGATI_MANUT SET'
      'ID = ID'
      'WHERE ID =: OLD_ID')
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT FIRST 1 '
      '  RAGIONESOCIALE,'
      '  P_IVA,'
      '  INDIRIZZO,'
      '  NUMCIVICO,'
      '  CITTA,'
      '  PROVINCIA'
      'FROM DATIAZIE'
      '')
    Left = 576
    Top = 9
    object QryDatiAzieRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      Required = True
      Size = 50
    end
    object QryDatiAzieP_IVA: TStringField
      FieldName = 'P_IVA'
      Size = 11
    end
    object QryDatiAzieINDIRIZZO: TStringField
      FieldName = 'INDIRIZZO'
      Size = 50
    end
    object QryDatiAzieNUMCIVICO: TStringField
      FieldName = 'NUMCIVICO'
      Size = 10
    end
    object QryDatiAzieCITTA: TStringField
      FieldName = 'CITTA'
      Size = 50
    end
    object QryDatiAziePROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 3
    end
  end
  object SourceDatiAzie: TDataSource
    AutoEdit = False
    DataSet = QryDatiAzie
    Left = 605
    Top = 9
  end
end
