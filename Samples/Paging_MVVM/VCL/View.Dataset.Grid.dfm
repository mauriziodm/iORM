inherited ViewDatasetGrid: TViewDatasetGrid
  object DBGrid1: TDBGrid [0]
    Left = 3
    Top = 50
    Width = 294
    Height = 447
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSArticles
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Width = 70
        Visible = True
      end>
  end
  inherited ViewPanelTop: TPanel
    TabOrder = 1
    inherited LabelTitle: TLabel
      Caption = 'Dataset Grid'
    end
  end
end
