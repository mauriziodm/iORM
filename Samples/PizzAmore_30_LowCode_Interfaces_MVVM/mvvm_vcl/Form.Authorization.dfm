object AuthorizationForm: TAuthorizationForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'AuthorizationForm'
  ClientHeight = 621
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 247
    Top = 46
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Select'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 247
    Top = 70
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '(read)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 359
    Top = 46
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Insert'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 357
    Top = 70
    Width = 104
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '(create new)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 471
    Top = 46
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 471
    Top = 70
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '(modify)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 583
    Top = 46
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 583
    Top = 70
    Width = 100
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '(delete)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 709
    DesignSize = (
      713
      40)
    object ButtonBack: TSpeedButton
      Left = 0
      Top = 0
      Width = 50
      Height = 40
      Action = acBack
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelTitle: TLabel
      Left = 104
      Top = 7
      Width = 497
      Height = 21
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Authorization'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 505
    end
  end
  object GroupBoxOrder: TGroupBox
    Left = 8
    Top = 96
    Width = 697
    Height = 161
    Caption = 'Order'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object LabelOrder: TLabel
      Left = 24
      Top = 34
      Width = 103
      Height = 25
      Caption = 'TOrder class'
    end
    object LabelOrderRow: TLabel
      Left = 24
      Top = 74
      Width = 138
      Height = 25
      Caption = 'TOrderRow class'
    end
    object LabelOrderCustomer: TLabel
      Left = 24
      Top = 111
      Width = 135
      Height = 25
      Caption = 'TCustomer class'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 134
      Width = 222
      Height = 21
      Caption = '(AuthorizationContext = '#39'order'#39')'
      FocusControl = GroupBoxCustomer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object SwitchOrderSelect: TToggleSwitch
      Left = 262
      Top = 34
      Width = 82
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      State = tssOn
      TabOrder = 0
      OnClick = SwitchClick
    end
    object SwitchOrderRowSelect: TToggleSwitch
      Left = 262
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 1
      OnClick = SwitchClick
    end
    object SwitchOrderCustomerSelect: TToggleSwitch
      Left = 262
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 2
      OnClick = SwitchClick
    end
    object SwitchOrderInsert: TToggleSwitch
      Left = 376
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 3
      OnClick = SwitchClick
    end
    object SwitchOrderUpdate: TToggleSwitch
      Left = 490
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 4
      OnClick = SwitchClick
    end
    object SwitchOrderDelete: TToggleSwitch
      Left = 604
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 5
      OnClick = SwitchClick
    end
    object SwitchOrderRowInsert: TToggleSwitch
      Left = 376
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 6
      OnClick = SwitchClick
    end
    object SwitchOrderRowUpdate: TToggleSwitch
      Left = 490
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 7
      OnClick = SwitchClick
    end
    object SwitchOrderRowDelete: TToggleSwitch
      Left = 604
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 8
      OnClick = SwitchClick
    end
    object SwitchOrderCustomerInsert: TToggleSwitch
      Left = 376
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 9
      OnClick = SwitchClick
    end
    object SwitchOrderCustomerUpdate: TToggleSwitch
      Left = 490
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 10
      OnClick = SwitchClick
    end
    object SwitchOrderCustomerDelete: TToggleSwitch
      Left = 604
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 11
      OnClick = SwitchClick
    end
  end
  object GroupBoxCustomer: TGroupBox
    Left = 8
    Top = 272
    Width = 697
    Height = 73
    Caption = 'Customer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object LabelCustomer: TLabel
      Left = 24
      Top = 34
      Width = 135
      Height = 25
      Caption = 'TCustomer class'
    end
    object SwitchCustomerSelect: TToggleSwitch
      Left = 262
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 0
      OnClick = SwitchClick
    end
    object SwitchCustomerInsert: TToggleSwitch
      Left = 376
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 1
      OnClick = SwitchClick
    end
    object SwitchCustomerUpdate: TToggleSwitch
      Left = 490
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 2
      OnClick = SwitchClick
    end
    object SwitchCustomerDelete: TToggleSwitch
      Left = 604
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 3
      OnClick = SwitchClick
    end
  end
  object GroupBoxPizza: TGroupBox
    Left = 8
    Top = 369
    Width = 697
    Height = 153
    Caption = 'Pizza'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object LabelPizza: TLabel
      Left = 24
      Top = 34
      Width = 99
      Height = 25
      Caption = 'TPizza class'
    end
    object LabelPizzaIngredientRiw: TLabel
      Left = 24
      Top = 74
      Width = 221
      Height = 25
      Caption = 'TPizzaIngredientRow class'
    end
    object LabelIngredient: TLabel
      Left = 24
      Top = 114
      Width = 142
      Height = 25
      Caption = 'TIngredient class'
    end
    object SwitchPizzaSelect: TToggleSwitch
      Left = 262
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 0
      OnClick = SwitchClick
    end
    object SwitchPizzaIngredientRowSelect: TToggleSwitch
      Left = 262
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 1
      OnClick = SwitchClick
    end
    object SwitchIngredientSelect: TToggleSwitch
      Left = 262
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 2
      OnClick = SwitchClick
    end
    object SwitchPizzaInsert: TToggleSwitch
      Left = 376
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 3
      OnClick = SwitchClick
    end
    object SwitchPizzaUpdate: TToggleSwitch
      Left = 490
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 4
      OnClick = SwitchClick
    end
    object SwitchPizzaDelete: TToggleSwitch
      Left = 604
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 5
      OnClick = SwitchClick
    end
    object SwitchPizzaIngredientRowInsert: TToggleSwitch
      Left = 376
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 6
      OnClick = SwitchClick
    end
    object SwitchPizzaIngredientRowUpdate: TToggleSwitch
      Left = 490
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 7
      OnClick = SwitchClick
    end
    object SwitchPizzaIngredientRowDelete: TToggleSwitch
      Left = 604
      Top = 74
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 8
      OnClick = SwitchClick
    end
    object SwitchIngredientInsert: TToggleSwitch
      Left = 376
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 9
      OnClick = SwitchClick
    end
    object SwitchIngredientUpdate: TToggleSwitch
      Left = 490
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 10
      OnClick = SwitchClick
    end
    object SwitchIngredientDelete: TToggleSwitch
      Left = 604
      Top = 114
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 11
      OnClick = SwitchClick
    end
  end
  object GroupBoxETM: TGroupBox
    Left = 8
    Top = 536
    Width = 697
    Height = 73
    Caption = 'ETM (Entity Time Machine)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object LabelEtnRepository: TLabel
      Left = 24
      Top = 34
      Width = 175
      Height = 25
      Caption = 'TEtmRepository class'
    end
    object SwitchEtmSelect: TToggleSwitch
      Left = 262
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 0
      OnClick = SwitchClick
    end
    object SwitchEtmUpdate: TToggleSwitch
      Left = 490
      Top = 34
      Width = 82
      Height = 27
      State = tssOn
      TabOrder = 1
      OnClick = SwitchClick
    end
  end
  object ActionList1: TActionList
    Left = 248
    Top = 48
    object acBack: TioBSCloseQuery
      Category = 'iORM - BS'
      Caption = 'Back'
    end
  end
end
