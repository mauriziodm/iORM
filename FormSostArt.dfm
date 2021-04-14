object SostArtForm: TSostArtForm
  Left = 534
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'SostArtForm'
  ClientHeight = 629
  ClientWidth = 722
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
    Height = 555
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object PanelArticoloDaSostituire: TPanel
      Left = 0
      Top = 7
      Width = 686
      Height = 109
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object LabelArticoloDaSostituire: TLabel
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
      object BitBtnSubSogg: TSpeedButtonRollOver
        Left = 356
        Top = 45
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
        OnClick = BitBtnSubSoggClick
      end
      object Label1: TLabel
        Left = 128
        Top = 46
        Width = 76
        Height = 12
        Caption = 'Codice articolo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 209
        Top = 64
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'NB: Avviare la selezione dell'#39'articolo cliccando sul pulsante...'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object RichEdit1: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 27
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Qual'#39#232' l'#39'articolo da sostituire?')
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
        ParentBackground = False
        TabOrder = 0
        object AvantiArticoloDaSostituire: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiArticoloDaSostituireClick
        end
      end
      object TECodiceArticoloDaSostituire: TEdit
        Left = 209
        Top = 44
        Width = 143
        Height = 17
        AutoSize = False
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnEnter = TECodiceArticoloDaSostituireEnter
        OnExit = TECodiceArticoloDaSostituireExit
      end
      object TEDescrizioneArticoloDaSostituire: TEdit
        Tag = -1
        Left = 379
        Top = 45
        Width = 299
        Height = 15
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '- - -'
      end
    end
    object PanelArticoloSostituto: TPanel
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
      object LabelArticoloSostituto: TLabel
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
      object SpeedButtonRollOver1: TSpeedButtonRollOver
        Left = 356
        Top = 45
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
        OnClick = SpeedButtonRollOver1Click
      end
      object Label2: TLabel
        Left = 128
        Top = 46
        Width = 76
        Height = 12
        Caption = 'Codice articolo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 209
        Top = 64
        Width = 400
        Height = 16
        AutoSize = False
        Caption = 'NB: Avviare la selezione dell'#39'articolo cliccando sul pulsante...'
        Color = clOlive
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object RichEdit2: TRichEdit
        Tag = -1
        Left = 83
        Top = 6
        Width = 575
        Height = 24
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Con quale nuovo articolo deve essere sostituito?')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
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
        object AvantiArticoloSostituto: TSpeedButton
          Left = 1
          Top = 2
          Width = 68
          Height = 15
          Cursor = crHandPoint
          Caption = 'Avanti >'
          Flat = True
          OnClick = AvantiArticoloSostitutoClick
        end
      end
      object TECodiceArticoloSostituto: TEdit
        Left = 209
        Top = 44
        Width = 143
        Height = 17
        AutoSize = False
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnEnter = TECodiceArticoloDaSostituireEnter
        OnExit = TECodiceArticoloDaSostituireExit
      end
      object TEDescrizioneArticoloSostituto: TEdit
        Tag = -1
        Left = 379
        Top = 45
        Width = 299
        Height = 15
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '- - -'
      end
    end
    object PanelFine: TPanel
      Left = 0
      Top = 235
      Width = 686
      Height = 109
      BevelOuter = bvNone
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 2
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
        Height = 59
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Bene, ora tutto '#232' pronto per la sostituzione dell'#39'articolo, per ' +
            'iniziare '
          'cliccare sul pulsante "Inizia sostituzione articolo".')
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Panel12: TPanel
        Left = 525
        Top = 85
        Width = 154
        Height = 20
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object IniziaSostituzioneArticolo: TSpeedButton
          Left = 1
          Top = 2
          Width = 150
          Height = 15
          Cursor = crHandPoint
          Caption = 'Inizia sostituzione articolo'
          Flat = True
          OnClick = IniziaSostituzioneArticoloClick
        end
      end
      object Panel11: TPanel
        Left = 450
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
    object PanelSicurezza: TPanel
      Left = 0
      Top = 350
      Width = 686
      Height = 188
      Color = 14737632
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object RichEdit6: TRichEdit
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
          
            'Prima di continuare la sostituzione di uno o pi'#249' articoli '#232' cons' +
            'igliabile effettuare una copia di '
          'sicurezza dei dati dell'#39'azienda.'
          ''
          
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
        ParentBackground = False
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
        ParentBackground = False
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
    object RxSpeedButtonNuovo: TSpeedButton
      Left = 162
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Nuovo / Aggiungi'
      AllowAllUp = True
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
    object RxSpeedButtonElimina: TSpeedButton
      Left = 212
      Top = 2
      Width = 49
      Height = 42
      Hint = 'Elimina / Cancella'
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
end
