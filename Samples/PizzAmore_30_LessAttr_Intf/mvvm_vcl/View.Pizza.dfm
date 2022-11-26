inherited ViewPizza: TViewPizza
  inherited PanelMain: TPanel
    object Label1: TLabel [0]
      Left = 10
      Top = 61
      Width = 100
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 10
      Top = 101
      Width = 100
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 10
      Top = 164
      Width = 100
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 10
      Top = 228
      Width = 100
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Image'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited PanelTop: TPanel
      inherited LabelTitle: TLabel
        Caption = 'Pizza'
      end
    end
    object DBEditID: TDBEdit
      Left = 122
      Top = 61
      Width = 55
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'ID'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEditName: TDBEdit
      Left = 122
      Top = 101
      Width = 250
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Name'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEditPrice: TDBEdit
      Left = 122
      Top = 164
      Width = 95
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Price'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBImage: TDBImage
      Left = 120
      Top = 228
      Width = 250
      Height = 250
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'Image'
      DataSource = SourceMaster
      Stretch = True
      TabOrder = 5
    end
  end
  inherited BSMaster: TioModelDataSet
    object MDSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object MDSMasterName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object MDSMasterPrice: TCurrencyField
      FieldName = 'Price'
    end
    object MDSMasterImage: TGraphicField
      FieldName = 'Image'
      BlobType = ftGraphic
    end
  end
end
