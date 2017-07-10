inherited MicroProductView: TMicroProductView
  inherited ClientArea: TPanel
    inherited Panel1: TPanel
      inherited cxDBLabel2: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorY = 16
      end
      inherited cxDBLabel1: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorY = 16
      end
      inherited cxDBLabel4: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorX = 363
        AnchorY = 16
      end
    end
    inherited PanelProcessCost: TPanel
      inherited cxDBSpinEdit1: TcxDBSpinEdit
        Style.IsFontAssigned = True
      end
    end
    inherited PanelMaterialCost: TPanel
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 65
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Mat.Cost'
        ExplicitWidth = 44
      end
      object cxDBLabel6: TcxDBLabel
        Left = 0
        Top = 13
        Align = alClient
        DataBinding.DataField = 'MaterialCost'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        Height = 48
        Width = 65
        AnchorX = 33
        AnchorY = 37
      end
    end
    inherited PanelTime: TPanel
      inherited cxDBLabel5: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorX = 33
        AnchorY = 37
      end
    end
    inherited PanelCost: TPanel
      inherited cxDBLabel3: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorX = 33
        AnchorY = 37
      end
    end
    inherited Panel2: TPanel
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 65
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Proc.Cost'
        ExplicitWidth = 47
      end
      object cxDBLabel7: TcxDBLabel
        Left = 0
        Top = 13
        Align = alClient
        DataBinding.DataField = 'ProcessCost'
        DataBinding.DataSource = DSArticle
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        Height = 48
        Width = 65
        AnchorX = 33
        AnchorY = 37
      end
    end
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleMaterialCost: TCurrencyField
      FieldName = 'MaterialCost'
    end
    object MDSArticleProcessCost: TCurrencyField
      FieldName = 'ProcessCost'
    end
  end
end
