inherited ViewIngredient: TViewIngredient
  inherited PanelMain: TPanel
    object Label1: TLabel [0]
      Left = 10
      Top = 61
      Width = 130
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
      Width = 130
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
      Top = 140
      Width = 130
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Unit of measure'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited PanelTop: TPanel
      inherited LabelTitle: TLabel
        Caption = 'Ingredient'
      end
    end
    object DBEditID: TDBEdit
      Left = 154
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
      Left = 154
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
    object DBEditUnitOfMeasure: TDBEdit
      Left = 154
      Top = 140
      Width = 95
      Height = 25
      BorderStyle = bsNone
      Color = clInactiveBorder
      DataField = 'UnitOfMeasure'
      DataSource = SourceMaster
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  inherited BSMaster: TioModelDataSet
    object BSMasterID: TIntegerField
      FieldName = 'ID'
    end
    object BSMasterName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object BSMasterUnitOfMeasure: TStringField
      FieldName = 'UnitOfMeasure'
      Size = 10
    end
  end
end
