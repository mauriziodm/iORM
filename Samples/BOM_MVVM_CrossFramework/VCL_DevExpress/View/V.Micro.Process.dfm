inherited MicroProcessView: TMicroProcessView
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
    inherited PanelTime: TPanel
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 65
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Time (min)'
        ExplicitWidth = 49
      end
      object cxDBLabel5: TcxDBLabel
        Left = 0
        Top = 13
        Align = alClient
        DataBinding.DataField = 'Time'
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
        Height = 49
        Width = 65
        AnchorX = 33
        AnchorY = 38
      end
    end
    inherited PanelCost: TPanel
      inherited cxDBLabel3: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorX = 33
        AnchorY = 38
      end
    end
  end
  inherited MDSItem: TioModelDataSet
    Left = 125
  end
  inherited MDSArticle: TioModelDataSet
    object MDSArticleTime: TIntegerField
      FieldName = 'Time'
    end
  end
  inherited DSItem: TDataSource
    Left = 124
  end
end
