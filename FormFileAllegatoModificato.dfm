object FileAllegatoModificatoForm: TFileAllegatoModificatoForm
  Left = 42
  Top = 133
  BorderStyle = bsNone
  Caption = 'File allegato modificato'
  ClientHeight = 397
  ClientWidth = 444
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    444
    397)
  PixelsPerInch = 96
  TextHeight = 16
  object Shape5: TShape
    Left = 0
    Top = 0
    Width = 444
    Height = 397
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = clBlue
    Pen.Width = 2
  end
  object Shape4: TShape
    Left = 33
    Top = 324
    Width = 378
    Height = 44
    Cursor = crArrow
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 10790143
    Pen.Color = clRed
    Shape = stRoundRect
  end
  object Shape3: TShape
    Left = 33
    Top = 244
    Width = 378
    Height = 44
    Cursor = crArrow
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 16758711
    Pen.Color = clBlue
    Shape = stRoundRect
  end
  object Shape2: TShape
    Left = 33
    Top = 180
    Width = 378
    Height = 44
    Cursor = crArrow
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 16758711
    Pen.Color = clBlue
    Shape = stRoundRect
  end
  object Shape1: TShape
    Left = 33
    Top = 116
    Width = 378
    Height = 44
    Cursor = crArrow
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 16758711
    Pen.Color = clBlue
    Shape = stRoundRect
  end
  object LabelTitolo: TLabel
    Left = 7
    Top = 20
    Width = 429
    Height = 28
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Vedo che hai modificato il file,'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10289152
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object LabelSottotitolo: TLabel
    Left = 7
    Top = 60
    Width = 429
    Height = 28
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'cosa vuoi che faccia?'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10289152
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object NoteLabel1: TLabel
    Left = 36
    Top = 140
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Il nuovo file sostituir'#224' il vecchio che andr'#224' perduto.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel1Click
    OnMouseEnter = MainLabel1MouseEnter
    OnMouseLeave = MainLabel1MouseLeave
  end
  object MainLabel1: TLabel
    Left = 36
    Top = 121
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Sostituisci il file precedente (stesso protocollo)'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10289152
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel1Click
    OnMouseEnter = MainLabel1MouseEnter
    OnMouseLeave = MainLabel1MouseLeave
  end
  object NoteLabel2: TLabel
    Left = 36
    Top = 204
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      'Mantiene il vecchio e il nuovo come versioni diverse dello stess' +
      'o file.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel2Click
    OnMouseEnter = MainLabel2MouseEnter
    OnMouseLeave = MainLabel2MouseLeave
  end
  object MainLabel2: TLabel
    Left = 36
    Top = 185
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Salvalo come nuova versione dello stesso protocollo'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10289152
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel2Click
    OnMouseEnter = MainLabel2MouseEnter
    OnMouseLeave = MainLabel2MouseLeave
  end
  object NoteLabel3: TLabel
    Left = 36
    Top = 268
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Lo considera un documento ex-novo indipendente dal precedente.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel3Click
    OnMouseEnter = MainLabel3MouseEnter
    OnMouseLeave = MainLabel3MouseLeave
  end
  object MainLabel3: TLabel
    Left = 36
    Top = 249
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Salvalo come nuovo protocollo'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10289152
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel3Click
    OnMouseEnter = MainLabel3MouseEnter
    OnMouseLeave = MainLabel3MouseLeave
  end
  object NoteLabel4: TLabel
    Left = 36
    Top = 348
    Width = 372
    Height = 19
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Mantiene il vecchio, le nuove modifiche andranno perdute.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 236
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel4Click
    OnMouseEnter = MainLabel4MouseEnter
    OnMouseLeave = MainLabel4MouseLeave
  end
  object MainLabel4: TLabel
    Left = 36
    Top = 329
    Width = 372
    Height = 19
    Cursor = crHandPoint
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Non salvarlo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    OnClick = MainLabel4Click
    OnMouseEnter = MainLabel4MouseEnter
    OnMouseLeave = MainLabel4MouseLeave
  end
end
