inherited ProductViewVertical: TProductViewVertical
  inherited cxLabel1: TcxLabel
    AnchorX = 128
  end
  inherited cxLabel2: TcxLabel
    AnchorX = 128
  end
  inherited cxDBTextEdit2: TcxDBTextEdit
    TabOrder = 15
  end
  inherited cxLabel3: TcxLabel
    AnchorX = 128
  end
  inherited cxDBTextEdit3: TcxDBTextEdit
    TabOrder = 12
  end
  inherited cxLabel4: TcxLabel
    AnchorX = 128
  end
  inherited cxLabel7: TcxLabel
    AnchorX = 331
  end
  inherited cxLabel8: TcxLabel
    AnchorX = 331
  end
  inherited cxLabel6: TcxLabel
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
    TabOrder = 11
  end
  inherited cxDBTextEdit4: TcxDBTextEdit
    ExplicitHeight = 25
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
