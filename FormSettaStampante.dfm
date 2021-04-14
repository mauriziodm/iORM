object SettaStampanteForm: TSettaStampanteForm
  Left = 304
  Top = 770
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '(Impostazioni di stampa)'
  ClientHeight = 200
  ClientWidth = 296
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 200
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 8097749
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Stamp.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 10
      Top = 40
      Width = 276
      Height = 148
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
      object LCDCopie: TLabel
        Left = 146
        Top = 24
        Width = 73
        Height = 43
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -37
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object LCDPagDa: TLabel
        Left = 111
        Top = 104
        Width = 51
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object LCDPagA: TLabel
        Left = 195
        Top = 104
        Width = 51
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object StaticText2: TStaticText
        Left = 119
        Top = 85
        Width = 40
        Height = 16
        AutoSize = False
        Caption = 'da pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 166
        Top = 9
        Width = 48
        Height = 11
        AutoSize = False
        Caption = 'COPIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object StaticText3: TStaticText
        Left = 206
        Top = 85
        Width = 34
        Height = 17
        AutoSize = False
        Caption = 'a pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 220
        Top = 27
        Width = 23
        Height = 43
        BevelOuter = bvLowered
        Color = clGreen
        TabOrder = 3
        object SBCopieUp: TSpeedButton
          Left = 2
          Top = 2
          Width = 19
          Height = 19
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333333333000003333333333300000333333333330
            0000000000000000000030000000003000003300000003300000333000003330
            000033330003333000003333303333300000}
          OnClick = SBCopieUpClick
        end
        object SBCopieDown: TSpeedButton
          Left = 2
          Top = 22
          Width = 19
          Height = 19
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333033333000003333000333300000333000003330
            0000330000000330000030000000003000000000000000000000333333333330
            000033333333333000003333333333300000}
          OnClick = SBCopieDownClick
        end
      end
      object Panel4: TPanel
        Left = 162
        Top = 101
        Width = 19
        Height = 35
        BevelOuter = bvLowered
        Color = clMaroon
        TabOrder = 4
        object SBPagDaUp: TSpeedButton
          Left = 2
          Top = 2
          Width = 15
          Height = 15
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333333333000003333333333300000333333333330
            0000000000000000000030000000003000003300000003300000333000003330
            000033330003333000003333303333300000}
          OnClick = SBPagDaUpClick
        end
        object SBPagDaDown: TSpeedButton
          Left = 2
          Top = 18
          Width = 15
          Height = 15
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333033333000003333000333300000333000003330
            0000330000000330000030000000003000000000000000000000333333333330
            000033333333333000003333333333300000}
          OnClick = SBPagDaDownClick
        end
      end
      object Panel5: TPanel
        Left = 246
        Top = 101
        Width = 19
        Height = 35
        BevelOuter = bvLowered
        Color = clMaroon
        TabOrder = 5
        object SBPagAUp: TSpeedButton
          Left = 2
          Top = 2
          Width = 15
          Height = 15
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333333333000003333333333300000333333333330
            0000000000000000000030000000003000003300000003300000333000003330
            000033330003333000003333303333300000}
          OnClick = SBPagAUpClick
        end
        object SBPagADown: TSpeedButton
          Left = 2
          Top = 18
          Width = 15
          Height = 15
          Glyph.Data = {
            CE000000424DCE0000000000000076000000280000000B0000000B0000000100
            0400000000005800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
            0000333333333330000033333033333000003333000333300000333000003330
            0000330000000330000030000000003000000000000000000000333333333330
            000033333333333000003333333333300000}
          OnClick = SBPagADownClick
        end
      end
      object BitBtn3: TBitBtn
        Left = 4
        Top = 4
        Width = 104
        Height = 89
        Caption = 'STAMPA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        Layout = blGlyphTop
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
      end
      object BitBtn1: TBitBtn
        Left = 4
        Top = 93
        Width = 104
        Height = 51
        Caption = 'Annulla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = bkCancel
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
      end
    end
    object ListaStampanti: TComboBox
      Left = 46
      Top = 11
      Width = 240
      Height = 21
      Style = csDropDownList
      Color = 13056
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
