inherited ChiusuraMagazzinoForm: TChiusuraMagazzinoForm
  Left = 647
  Top = 85
  Caption = 'ChiusuraMagazzinoForm'
  ClientHeight = 649
  ClientWidth = 756
  ExplicitWidth = 756
  ExplicitHeight = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    TabOrder = 1
  end
  inherited ClientArea: TScrollBox
    TabOrder = 0
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
        Width = 598
        Height = 27
        Lines.Strings = (
          'Chiusura magazzino (consolidamento)')
        TabOrder = 3
        ExplicitWidth = 598
        ExplicitHeight = 27
      end
      inherited Panel7: TPanel
        Left = 106
        Top = 361
        ParentBackground = False
        TabOrder = 2
        Visible = False
        ExplicitLeft = 106
        ExplicitTop = 361
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
        TabOrder = 4
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
            '            fossero consolidate '
          
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
        TabOrder = 5
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
        TabOrder = 6
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
        TabOrder = 0
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
        TabOrder = 1
        Height = 20
        Width = 106
      end
    end
  end
  object QryDelMag: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'DELETE FROM MAGAZZINI')
    Left = 240
    Top = 472
  end
  object QrySetRighiChiusi: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'UPDATE RIGHIPRV R SET'
      'R.MAG_CHIUSURA = :P_DATACHIUSURA'
      'WHERE R.MAG_CHIUSURA IS NULL'
      'AND R.DATADOCUMENTO < :P_DATACHIUSURA')
    Left = 472
    Top = 472
  end
  object QryCopyMag: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      
        'INSERT INTO MAGAZZINI_TEMP (CODICEARTICOLO, CODICEMAGAZZINO, GIA' +
        'CENZA)'
      ''
      
        '   SELECT MA.CODICEARTICOLO, MA.CODICEMAGAZZINO, SUM(MA.GIACENZA' +
        ') AS GIACENZA'
      ''
      '   FROM MAG_ART MA'
      ''
      '   WHERE MA.DATADOCUMENTO < :P_DATACHIUSURA'
      ''
      '   GROUP BY MA.CODICEARTICOLO, MA.CODICEMAGAZZINO'
      '')
    Left = 136
    Top = 472
  end
  object QryDelMagTemp: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'DELETE FROM MAGAZZINI_TEMP')
    Left = 40
    Top = 472
  end
  object QryNewMag: TIB_Cursor
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      
        'INSERT INTO MAGAZZINI (CODICEARTICOLO, CODICEMAGAZZINO, GIACENZA' +
        ', IMPEGNATO, ORDINATO, DISPONIBILE, SINCHRO)'
      ''
      '   SELECT'
      '      MT.CODICEARTICOLO,'
      '      MT.CODICEMAGAZZINO,'
      '      MT.GIACENZA,'
      '      0 AS IMPEGNATO,'
      '      0 AS ORDINATO,'
      '      0 AS DISPONIBILE,'
      '      '#39'M'#39
      '   FROM MAGAZZINI_TEMP MT'
      '   WHERE MT.GIACENZA <> 0'
      '')
    Left = 352
    Top = 472
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
    StoredProcName = 'MAG_CHIUSURA_GENERALE'
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    Left = 128
    Top = 120
  end
end
