inherited AzzeramentoMagazzinoForm: TAzzeramentoMagazzinoForm
  Top = 112
  Caption = 'AzzeramentoMagazzinoForm'
  ClientHeight = 676
  ClientWidth = 784
  ExplicitWidth = 784
  ExplicitHeight = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    inherited PanelSicurezza: TPanel
      inherited Panel13: TPanel
        ParentBackground = False
      end
      inherited Panel14: TPanel
        ParentBackground = False
      end
    end
    inherited PanelGruppo1: TPanel
      Height = 392
      ExplicitHeight = 392
      inherited LabelGruppo1: TLabel
        Height = 390
        ExplicitHeight = 390
      end
      inherited TitoloGruppo1: TRichEdit
        Height = 27
        Lines.Strings = (
          'Azzeramento giacenze di magazzino')
        ExplicitHeight = 27
      end
      inherited Panel7: TPanel
        Left = 79
        Top = 365
        ParentBackground = False
        Visible = False
        ExplicitLeft = 79
        ExplicitTop = 365
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 104
        Top = 94
        Width = 569
        Height = 251
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Vorrei che le giacenze del magazzino                            ' +
            '            fossero azzerate '
          
            'al primo istante del  giorno                             e che q' +
            'uindi il programma non tenga '
          
            'pi'#249' conto, ai fini del calcolo delle giacenze, dei documenti con' +
            ' data precedente.'
          ''
          
            'Dopo questa operazione i documenti con data precedente a quella ' +
            'specificata '
          
            'non avranno pi'#249' alcun effetto sulle giacenze di magazzino e quin' +
            'di potr'#242' '
          
            'tranquillamente modificarli o eliminarli senza conseguenze sul m' +
            'agazzino.'
          ''
          
            'Per quanto sopra scritto, non potr'#242' pi'#249' richiedere un inventario' +
            ' con data '
          'precedente a quella di consolidamento.'
          ''
          'Le modifiche effettuate saranno IRREVERSIBILI!')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 52
        Width = 598
        Height = 27
        TabStop = False
        Alignment = taCenter
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'LEGGERE ATTENTAMENTE !!!')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object fMagazzino: TcxComboBox
        Tag = -1
        Left = 372
        Top = 93
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Properties.DropDownAutoWidth = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownWidth = 249
        Properties.ImmediatePost = True
        Properties.Sorted = True
        Properties.OnInitPopup = fMagazzinoPropertiesInitPopup
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Color = 16053492
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Height = 22
        Width = 150
      end
      object fData: TcxDateEdit
        Tag = -1
        Left = 295
        Top = 115
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsNone
        Style.Color = 16053492
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsDefault
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Height = 20
        Width = 106
      end
      object Panel12: TPanel
        Left = 417
        Top = 361
        Width = 263
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 6
        object AvviaChiusura: TSpeedButton
          Left = 1
          Top = 1
          Width = 259
          Height = 16
          Cursor = crHandPoint
          Caption = 'Effettua la chiusura di magazzino (consolidamento)'
          Flat = True
          OnClick = AvviaChiusuraClick
        end
      end
    end
  end
  object StoredProc1: TIBOStoredProc
    Params = <
      item
        DataType = ftString
        Name = 'IN_UTENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_COD_MAG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IN_DATA_RICHIESTA'
        ParamType = ptInput
      end>
    StoredProcHasDML = True
    StoredProcName = 'MAG_AZZERAMENTO_MAGAZZINO'
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    Left = 128
    Top = 120
  end
end
