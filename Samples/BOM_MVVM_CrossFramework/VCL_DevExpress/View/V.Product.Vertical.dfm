inherited ProductViewVertical: TProductViewVertical
  inherited cxDBTextEdit1: TcxDBTextEdit
    Style.IsFontAssigned = True
  end
  inherited cxLabel1: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxLabel2: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit2: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 15
  end
  inherited cxLabel3: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxDBTextEdit3: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 13
  end
  inherited cxLabel4: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  inherited cxLabel7: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 331
  end
  inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
    Style.IsFontAssigned = True
    TabOrder = 1
  end
  inherited cxLabel8: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 331
  end
  inherited cxDBCurrencyEdit3: TcxDBCurrencyEdit
    Style.IsFontAssigned = True
  end
  inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Style.IsFontAssigned = True
    TabOrder = 2
  end
  inherited cxLabel6: TcxLabel
    Style.IsFontAssigned = True
    AnchorX = 128
  end
  object ScrollBox1: TScrollBox [14]
    Left = 14
    Top = 255
    Width = 422
    Height = 39
    VertScrollBar.Style = ssHotTrack
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 12
  end
  inherited cxDBTextEdit4: TcxDBTextEdit
    Style.IsFontAssigned = True
    TabOrder = 3
  end
  object BOMVCProvider: TioViewContextProvider
    OnAfterRequest = BOMVCProviderioOnAfterRequest
    OnRelease = BOMVCProviderioOnRelease
    OnRequest = BOMVCProviderioOnRequest
    RegisterAsDefault = False
    Left = 306
    Top = 44
  end
end
