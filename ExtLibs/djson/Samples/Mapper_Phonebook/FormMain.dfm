object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 808
  ClientWidth = 1130
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 1130
    Height = 153
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
    object Shape3: TShape
      Left = 684
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
    object Shape4: TShape
      Left = 767
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Label4: TLabel
      Left = 773
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Other ex.2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape5: TShape
      Left = 850
      Top = 27
      Width = 84
      Height = 95
      Brush.Style = bsClear
      Pen.Color = 14803425
    end
    object Label5: TLabel
      Left = 856
      Top = 36
      Width = 71
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Other ex.3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 0
      Top = 128
      Width = 1130
      Height = 25
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'NOTE: Custom serializer defined in "TPhoneNumberCustomSerializer' +
        '" and registered by "djSerializer" attribute '
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
      Left = 384
      Top = 16
      Width = 121
      Height = 17
      Caption = 'Type annotations'
      TabOrder = 2
    end
    object CheckBoxCustomSerializers: TCheckBox
      Left = 384
      Top = 44
      Width = 121
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
    object ButtonOtherSerialize2: TButton
      Left = 773
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
      TabOrder = 10
      OnClick = ButtonOtherSerialize2Click
    end
    object ButtonOtherDeserialize2: TButton
      Left = 773
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
      TabOrder = 11
      OnClick = ButtonOtherDeserialize2Click
    end
    object ButtonOtherSerialize3: TButton
      Left = 856
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
      TabOrder = 12
      OnClick = ButtonOtherSerialize3Click
    end
    object ButtonOtherDeserialize3: TButton
      Left = 856
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
      TabOrder = 13
      OnClick = ButtonOtherDeserialize3Click
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
      TabOrder = 14
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
      TabOrder = 15
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
      TabOrder = 16
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
      TabOrder = 17
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
      TabOrder = 18
      OnClick = ButtonDeserializeBSONObjectListClick
    end
    object CheckBoxEmptyStringAsNull: TCheckBox
      Left = 384
      Top = 59
      Width = 121
      Height = 45
      Caption = 'Empty string as NULL'
      TabOrder = 19
    end
    object CheckBoxEmptyCharAsNull: TCheckBox
      Left = 384
      Top = 88
      Width = 121
      Height = 45
      Caption = 'Empty char as NULL'
      TabOrder = 20
    end
  end
  object Memo1: TMemo
    Left = 171
    Top = 153
    Width = 959
    Height = 655
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 153
    Width = 171
    Height = 655
    Align = alLeft
    BevelOuter = bvNone
    Color = 12895428
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      171
      655)
    object RadioGroupDateTimeFormat: TRadioGroup
      Left = 16
      Top = 6
      Width = 139
      Height = 98
      Anchors = [akLeft, akTop, akRight]
      Caption = 'DateTime format'
      ItemIndex = 0
      Items.Strings = (
        'ISO8601'
        'Unix'
        'DMVC')
      TabOrder = 0
      OnClick = RadioGroupDateTimeFormatClick
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 131
      Width = 139
      Height = 422
      Anchors = [akLeft, akTop, akRight]
      Caption = 'ISO 8601 params'
      TabOrder = 1
      object Label9: TLabel
        Left = 0
        Top = 22
        Width = 139
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Date'
        Color = 14408667
        ParentColor = False
        Transparent = False
      end
      object Label10: TLabel
        Left = 0
        Top = 91
        Width = 139
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Time'
        Color = 14408667
        ParentColor = False
        Transparent = False
      end
      object Label11: TLabel
        Left = 0
        Top = 318
        Width = 139
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Timezone'
        Color = 14408667
        ParentColor = False
        Transparent = False
      end
      object EditDateSeparator: TLabeledEdit
        Left = 91
        Top = 43
        Width = 40
        Height = 22
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'Date separator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 0
      end
      object EditTimePrefix: TLabeledEdit
        Left = 91
        Top = 137
        Width = 40
        Height = 22
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Time prefix'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 1
      end
      object EditTimeSeparator: TLabeledEdit
        Left = 91
        Top = 165
        Width = 40
        Height = 22
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = 'Time separator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 2
      end
      object EditMillisecSeparator: TLabeledEdit
        Left = 91
        Top = 193
        Width = 40
        Height = 22
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Millisec.separator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 3
      end
      object EditZulu: TLabeledEdit
        Left = 91
        Top = 221
        Width = 40
        Height = 22
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'Zulu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 4
      end
      object CheckBoxSeconds: TCheckBox
        Left = 46
        Top = 249
        Width = 58
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Seconds'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CheckBoxMillisec: TCheckBox
        Left = 32
        Top = 272
        Width = 72
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Milliseconds'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CheckBoxUTCTime: TCheckBox
        Left = 42
        Top = 112
        Width = 62
        Height = 17
        Alignment = taLeftJustify
        Caption = 'UTC time'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object EditTimezonePrefix: TLabeledEdit
        Left = 91
        Top = 340
        Width = 40
        Height = 22
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Timezone prefix'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 8
      end
      object EditTimezoneSeparator: TLabeledEdit
        Left = 91
        Top = 368
        Width = 40
        Height = 22
        EditLabel.Width = 69
        EditLabel.Height = 13
        EditLabel.Caption = 'Timezone sep.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 9
      end
      object CheckBoxTimezoneIgnore: TCheckBox
        Left = 10
        Top = 396
        Width = 94
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Timezone ignore'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
    end
  end
end
