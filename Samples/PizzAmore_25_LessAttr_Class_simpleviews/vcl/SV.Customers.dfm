object CustomersSimpleView: TCustomersSimpleView
  Left = 0
  Top = 0
  Width = 579
  Height = 347
  TabOrder = 0
  DesignSize = (
    579
    347)
  object Label1: TLabel
    Left = 3
    Top = 3
    Width = 253
    Height = 32
    Caption = 'CustomersSimpleView'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 3
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 87
    Width = 565
    Height = 250
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 323
    Top = 56
    Width = 94
    Height = 25
    Caption = 'SetDataObject'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DS: TioDataSetMaster
    AsDefault = True
    TypeName = 'TCustomer'
    LoadType = ltManual
    Paging.CurrentPageOfFormat = '%d/%d'
    Left = 152
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = DS
    Left = 248
    Top = 56
  end
end
