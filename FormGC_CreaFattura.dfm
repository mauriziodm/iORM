object GC_CreaFatturaForm: TGC_CreaFatturaForm
  Left = 9
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Creazione Automatica Fattura'
  ClientHeight = 623
  ClientWidth = 316
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 44
    Top = 512
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'OK!'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
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
    ModalResult = 1
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 164
    Top = 512
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Annulla'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
  end
  object eTipoRicarico: TcxRadioGroup
    Left = 16
    Top = 18
    Cursor = crHandPoint
    ParentFont = False
    Properties.Columns = 2
    Properties.DefaultValue = 'RICARICOLISTINO1'
    Properties.ImmediatePost = True
    Properties.Items = <
      item
        Caption = 'Fattura di ACCONTO'
        Value = 'COSTO'
      end
      item
        Caption = 'Fattura A SALDO'
        Value = 'RICARICO'
      end>
    ItemIndex = 0
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -9
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Height = 52
    Width = 284
  end
  object Panel1: TPanel
    Left = 17
    Top = 16
    Width = 282
    Height = 15
    BevelOuter = bvNone
    TabOrder = 3
    object Label6: TLabel
      Left = 0
      Top = 0
      Width = 282
      Height = 15
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tipo di fattura'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = 16762566
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
  end
end
