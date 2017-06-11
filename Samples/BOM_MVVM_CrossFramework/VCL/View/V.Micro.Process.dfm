inherited MicroProcessView: TMicroProcessView
  Height = 102
  ExplicitHeight = 102
  DesignSize = (
    451
    102)
  inherited ClientArea: TPanel
    ExplicitHeight = 93
    inherited Panel1: TPanel
      ExplicitWidth = 445
      inherited cxDBLabel2: TcxDBLabel
        Style.IsFontAssigned = True
        AnchorY = 16
      end
      inherited cxDBLabel1: TcxDBLabel
        Style.IsFontAssigned = True
        ExplicitWidth = 248
        AnchorY = 16
      end
      inherited cxDBLabel4: TcxDBLabel
        Style.IsFontAssigned = True
        ExplicitLeft = 337
        AnchorX = 363
        AnchorY = 16
      end
    end
    inherited PanelProcessCost: TPanel
      ExplicitLeft = 323
      ExplicitHeight = 64
      inherited cxDBSpinEdit1: TcxDBSpinEdit
        Style.IsFontAssigned = True
      end
    end
    inherited PanelTime: TPanel
      ExplicitHeight = 64
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
        ExplicitHeight = 51
        Height = 48
        Width = 65
        AnchorX = 33
        AnchorY = 37
      end
    end
    inherited PanelCost: TPanel
      ExplicitHeight = 64
      inherited cxDBLabel3: TcxDBLabel
        Style.IsFontAssigned = True
        ExplicitHeight = 51
        AnchorX = 33
        AnchorY = 37
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
