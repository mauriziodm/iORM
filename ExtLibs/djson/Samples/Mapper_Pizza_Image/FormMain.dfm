object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 815
  ClientWidth = 1127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 150
    Align = alTop
    BevelOuter = bvNone
    Color = 12895428
    ParentBackground = False
    TabOrder = 0
    object Shape1: TShape
      Left = 507
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Shape2: TShape
      Left = 590
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Label1: TLabel
      Left = 514
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Single object'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 596
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Object List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape3: TShape
      Left = 684
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Label3: TLabel
      Left = 690
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Other ex.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 0
      Top = 125
      Width = 1127
      Height = 25
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'NOTE: Custom serializer declared for String type  (class "TStrin' +
        'gCustomSerializer"), this serializer serialize string as reverse' +
        'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 116
      ExplicitWidth = 1085
    end
    object Shape6: TShape
      Left = 944
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Shape7: TShape
      Left = 1027
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Label7: TLabel
      Left = 951
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'BSON Single'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 1031
      Top = 36
      Width = 77
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'BSON Obj.List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioGroupSerializationMode: TRadioGroup
      Left = 159
      Top = 47
      Width = 216
      Height = 73
      Caption = 'Serialization mode'
      ItemIndex = 0
      Items.Strings = (
        'Java script JSON serialization (default)'
        'Data contract JSON serialization')
      TabOrder = 0
    end
    object RadioGroupSerializationType: TRadioGroup
      Left = 16
      Top = 47
      Width = 139
      Height = 73
      Caption = 'Serialization type'
      ItemIndex = 0
      Items.Strings = (
        'By properties (default)'
        'By fields')
      TabOrder = 1
    end
    object CheckBoxTypeAnnotations: TCheckBox
      Left = 390
      Top = 65
      Width = 112
      Height = 17
      Caption = 'Type annotations'
      TabOrder = 2
    end
    object CheckBoxCustomSerializers: TCheckBox
      Left = 390
      Top = 93
      Width = 112
      Height = 17
      Caption = 'Custom serializers'
      TabOrder = 3
    end
    object ButtonSerializeSignleObject: TButton
      Left = 514
      Top = 55
      Width = 71
      Height = 30
      Caption = 'Serialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonSerializeSignleObjectClick
    end
    object ButtonDeserializeSignleObject: TButton
      Left = 514
      Top = 86
      Width = 71
      Height = 30
      Caption = 'Deserialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = ButtonDeserializeSignleObjectClick
    end
    object ButtonSerializeObjectList: TButton
      Left = 596
      Top = 55
      Width = 71
      Height = 30
      Caption = 'Serialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = ButtonSerializeObjectListClick
    end
    object ButtonDeserializeObjectList: TButton
      Left = 596
      Top = 86
      Width = 71
      Height = 30
      Caption = 'Deserialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = ButtonDeserializeObjectListClick
    end
    object ButtonOtherSerialize1: TButton
      Left = 690
      Top = 55
      Width = 71
      Height = 30
      Caption = 'Serialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = ButtonOtherSerialize1Click
    end
    object ButtonOtherDeserialize1: TButton
      Left = 690
      Top = 86
      Width = 71
      Height = 30
      Caption = 'Deserialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = ButtonOtherDeserialize1Click
    end
    object RadioGroupEngine: TRadioGroup
      Left = 16
      Top = 5
      Width = 359
      Height = 32
      Caption = 'JSON serialization engine'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Delphi DOM'
        'Delphi Stream'
        'Json Data Obj.')
      TabOrder = 10
    end
    object ButtonSerializeBSONSingleObject: TButton
      Left = 951
      Top = 55
      Width = 71
      Height = 30
      Caption = 'Serialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = ButtonSerializeBSONSingleObjectClick
    end
    object ButtonDeserializeBSONSignleObject: TButton
      Left = 951
      Top = 86
      Width = 71
      Height = 30
      Caption = 'Deserialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = ButtonDeserializeBSONSignleObjectClick
    end
    object ButtonSerializeBSONObjectList: TButton
      Left = 1033
      Top = 55
      Width = 71
      Height = 30
      Caption = 'Serialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = ButtonSerializeBSONObjectListClick
    end
    object ButtonDeserializeBSONObjectList: TButton
      Left = 1033
      Top = 86
      Width = 71
      Height = 30
      Caption = 'Deserialize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      OnClick = ButtonDeserializeBSONObjectListClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 1127
    Height = 665
    Align = alClient
    BevelOuter = bvNone
    Caption = '+'
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 665
      Align = alLeft
      BevelOuter = bvNone
      Color = 14803425
      ParentBackground = False
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 185
        Height = 185
        Align = alTop
        Stretch = True
        ExplicitTop = -1
      end
      object Image2: TImage
        Left = 0
        Top = 185
        Width = 185
        Height = 185
        Align = alTop
        Stretch = True
        ExplicitLeft = 72
        ExplicitTop = 339
      end
      object Image4: TImage
        Left = 0
        Top = 555
        Width = 185
        Height = 185
        Align = alTop
        Stretch = True
        ExplicitLeft = 40
        ExplicitTop = 571
      end
      object Image3: TImage
        Left = 0
        Top = 370
        Width = 185
        Height = 185
        Align = alTop
        Stretch = True
        ExplicitTop = 364
      end
    end
    object Memo1: TMemo
      Left = 185
      Top = 0
      Width = 942
      Height = 665
      Align = alClient
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
end
