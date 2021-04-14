inherited StampeCantieriForm: TStampeCantieriForm
  Left = 586
  Top = 210
  Caption = 'StampeCantieriForm'
  ClientHeight = 734
  ClientWidth = 787
  OldCreateOrder = True
  ExplicitWidth = 787
  ExplicitHeight = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedButtonStampa: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonStampaClick
      OnMouseUp = RxSpeedButtonStampaMouseUp
    end
  end
  inherited ClientArea: TScrollBox
    object cxLabel2: TcxLabel
      Left = 0
      Top = -11
      Caption = 'Stampe riepilogative cantieri'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = 14737632
      Style.Font.Height = -48
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object PanelGruppo1: TPanel
      Left = 0
      Top = 63
      Width = 686
      Height = 69
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object LabelGruppo1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 69
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 75
        Top = 6
        Width = 118
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Generale')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object eNomeStampa: TcxComboBox
        Left = 187
        Top = 30
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Properties.OnChange = eNomeStampaPropertiesChange
        Properties.OnInitPopup = eNomeStampaPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel12: TcxLabel
        Left = 100
        Top = 31
        Caption = 'Nome stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object Panel8: TPanel
        Left = 534
        Top = 44
        Width = 149
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        object BtnSalva: TSpeedButton
          Left = 1
          Top = 2
          Width = 145
          Height = 15
          Cursor = crHandPoint
          Caption = 'Salva impostazioni stampa'
          Flat = True
          OnClick = BtnSalvaClick
        end
      end
      object cxLabel13: TcxLabel
        Left = 354
        Top = 18
        Caption = 'Dalla data'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel14: TcxLabel
        Left = 363
        Top = 42
        Caption = 'alla data'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object eDallaData: TcxDateEdit
        Left = 419
        Top = 16
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 110
      end
      object eAllaData: TcxDateEdit
        Left = 419
        Top = 39
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 110
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 142
      Width = 686
      Height = 86
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 86
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '2'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Shape1: TShape
        Left = 583
        Top = 56
        Width = 94
        Height = 19
        Brush.Style = bsClear
      end
      object eMatAppStampa: TcxCheckBox
        Tag = 102
        Left = 97
        Top = 34
        Cursor = crHandPoint
        Caption = 'Stampa elenco materiali/apparecchi'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        State = cbsChecked
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 281
      end
      object eMatAppVista: TcxComboBox
        Left = 297
        Top = 55
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel1: TcxLabel
        Left = 100
        Top = 56
        Caption = 'Vista da utilizzare per la stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 75
        Top = 6
        Width = 422
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Materiali/Apparecchi')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object eMatAppEsplosa: TcxRadioButton
        Left = 587
        Top = 57
        Width = 41
        Height = 17
        Cursor = crHandPoint
        Caption = 'SI'
        TabOrder = 4
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
      end
      object eMatAppNonEsplosa: TcxRadioButton
        Left = 635
        Top = 57
        Width = 41
        Height = 17
        Cursor = crHandPoint
        Caption = 'NO'
        Checked = True
        TabOrder = 5
        TabStop = True
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
      end
      object cxLabel3: TcxLabel
        Left = 476
        Top = 56
        Caption = 'Stampa esplosa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 238
      Width = 686
      Height = 142
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 142
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object eOperaElencoStampa: TcxCheckBox
        Tag = 102
        Left = 97
        Top = 34
        Cursor = crHandPoint
        Caption = 'Stampa elenco manodopera'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 281
      end
      object eOperaElencoVista: TcxComboBox
        Left = 297
        Top = 55
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel4: TcxLabel
        Left = 100
        Top = 56
        Caption = 'Vista da utilizzare per la stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RichEdit3: TRichEdit
        Tag = -1
        Left = 75
        Top = 6
        Width = 422
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Manodopera')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object cxLabel5: TcxLabel
        Left = 476
        Top = 56
        Caption = 'Stampa esplosa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object eOperaAdaStampa: TcxCheckBox
        Tag = 102
        Left = 97
        Top = 90
        Cursor = crHandPoint
        Caption = 'Stampa ADA manodopera'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 281
      end
      object eOperaAdaVista: TcxComboBox
        Left = 297
        Top = 111
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel6: TcxLabel
        Left = 100
        Top = 112
        Caption = 'Vista da utilizzare per la stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel7: TcxLabel
        Left = 476
        Top = 112
        Caption = 'Stampa esplosa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object Panel4: TPanel
        Left = 583
        Top = 56
        Width = 94
        Height = 18
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 9
        object eOperaElencoEsplosa: TcxRadioButton
          Left = 2
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'SI'
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
        object eOperaElencononEsplosa: TcxRadioButton
          Left = 51
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'NO'
          Checked = True
          TabOrder = 1
          TabStop = True
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
      end
      object Panel5: TPanel
        Left = 583
        Top = 112
        Width = 94
        Height = 18
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 10
        object eOperaAdaEsplosa: TcxRadioButton
          Left = 2
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'SI'
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
        object eOperaAdaNonEsplosa: TcxRadioButton
          Left = 51
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'NO'
          Checked = True
          TabOrder = 1
          TabStop = True
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 390
      Width = 686
      Height = 142
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 142
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '4'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object eSpeseElencoStampa: TcxCheckBox
        Tag = 102
        Left = 97
        Top = 34
        Cursor = crHandPoint
        Caption = 'Stampa elenco spese'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 281
      end
      object eSpeseElencoVista: TcxComboBox
        Left = 297
        Top = 55
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel8: TcxLabel
        Left = 100
        Top = 56
        Caption = 'Vista da utilizzare per la stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object RichEdit4: TRichEdit
        Tag = -1
        Left = 75
        Top = 6
        Width = 422
        Height = 25
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Altre spese')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object cxLabel9: TcxLabel
        Left = 476
        Top = 56
        Caption = 'Stampa esplosa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object eSpeseAdaStampa: TcxCheckBox
        Tag = 102
        Left = 97
        Top = 90
        Cursor = crHandPoint
        Caption = 'Stampa ADA spese'
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 281
      end
      object eSpeseAdaVista: TcxComboBox
        Left = 297
        Top = 111
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsSingle
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Text = 'Default'
        Height = 20
        Width = 150
      end
      object cxLabel10: TcxLabel
        Left = 100
        Top = 112
        Caption = 'Vista da utilizzare per la stampa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel11: TcxLabel
        Left = 476
        Top = 112
        Caption = 'Stampa esplosa'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object Panel6: TPanel
        Left = 583
        Top = 56
        Width = 94
        Height = 18
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 9
        object eSpeseElencoEsplosa: TcxRadioButton
          Left = 2
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'SI'
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
        object eSpeseElencoNonEsplosa: TcxRadioButton
          Left = 51
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'NO'
          Checked = True
          TabOrder = 1
          TabStop = True
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
      end
      object Panel7: TPanel
        Left = 583
        Top = 112
        Width = 94
        Height = 18
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 10
        object eSpeseAdaEsplosa: TcxRadioButton
          Left = 2
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'SI'
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
        object eSpeseAdaNonEsplosa: TcxRadioButton
          Left = 51
          Top = 0
          Width = 41
          Height = 17
          Cursor = crHandPoint
          Caption = 'NO'
          Checked = True
          TabOrder = 1
          TabStop = True
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
        end
      end
    end
    object PanelSalvaStampa: TPanel
      Left = 333
      Top = 443
      Width = 236
      Height = 129
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = False
      UseDockManager = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      Visible = False
      OnEnter = PanelSalvaStampaEnter
      OnExit = PanelSalvaStampaExit
      object Label67: TLabel
        Left = 0
        Top = 0
        Width = 234
        Height = 16
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Salva impostazioni stampa'
        Color = 2856447
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label69: TLabel
        Left = 8
        Top = 50
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nome stampa:'
      end
      object BitBtn2: TBitBtn
        Left = 41
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Annulla'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object eNomeStampaSaving: TEdit
        Left = 83
        Top = 46
        Width = 142
        Height = 19
        Color = 14286847
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 121
        Top = 96
        Width = 75
        Height = 25
        Caption = 'OK'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  object QryPratToPrint: TIBOQuery
    Params = <
      item
        DataType = ftDateTime
        Name = 'P_DATAINIZIALE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'P_DATAFINALE'
        ParamType = ptInput
      end>
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM PRATICHE WHERE'
      'CODICE = :CODICE'
      'AND DATAAPERTURA = :DATAAPERTURA')
    IB_Connection = DM1.DBAzienda
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT P.CODICE, P.DATAAPERTURA'
      'FROM PRATICHE P'
      'WHERE P.TIPO = '#39'P'#39
      '  AND ('
      
        '           (SELECT COUNT(*) FROM PRVORDCL T WHERE T.PRATICA = P.' +
        'CODICE AND T.DATAPRATICA1 = P.DATAAPERTURA AND T.DATADOCUMENTO >' +
        '= :P_DATAINIZIALE AND T.DATADOCUMENTO <= :P_DATAFINALE AND T.SEG' +
        'NOOPERAZIONECANTIERE IS NOT NULL  AND T.SEGNOOPERAZIONECANTIERE ' +
        '<> '#39'='#39') > 0'
      
        '        OR (SELECT COUNT(*) FROM RAPGIORNRIGHI O WHERE O.CODCANT' +
        'IERE = P.CODICE AND O.DATACANTIERE = P.DATAAPERTURA AND O.DATADO' +
        'C >= :P_DATAINIZIALE AND O.DATADOC <= :P_DATAFINALE) > 0'
      
        '        OR (SELECT COUNT(*) FROM RAPGIORNRIGHISPESE S WHERE S.CO' +
        'DCANTIERE = P.CODICE AND S.DATACANTIERE = P.DATAAPERTURA AND S.D' +
        'ATADOC >= :P_DATAINIZIALE AND S.DATADOC <= :P_DATAFINALE) > 0'
      '      )'
      '')
    FieldOptions = []
    Left = 606
    Top = 16
    object QryPratToPrintCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QryPratToPrintDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
      Required = True
    end
  end
end
