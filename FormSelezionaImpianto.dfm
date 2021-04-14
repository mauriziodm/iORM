inherited SelezionaImpiantoForm: TSelezionaImpiantoForm
  Left = 569
  Top = 186
  Caption = 'SelezionaImpiantoForm'
  ClientHeight = 657
  ClientWidth = 786
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton [0]
    Left = 1
    Top = 1
    Width = 11
    Height = 11
    Cursor = crHandPoint
    Flat = True
    Glyph.Data = {
      36010000424D6A01000000000000B60000002800000009000000090000000100
      100003000000B400000000000000000000001000000000000000007C0000E003
      00001F0000000000000000008000008000000080800080000000800080008080
      0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
      0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
      00001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7F000000000000
      00000000FF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F100000001F7C10001000100010001000100010001F7C0000}
  end
  object SpeedButton2: TSpeedButton [1]
    Left = 16
    Top = 1
    Width = 11
    Height = 11
    Cursor = crHandPoint
    Flat = True
    Glyph.Data = {
      36010000424D6A01000000000000B60000002800000009000000090000000100
      100003000000B400000000000000000000001000000000000000007C0000E003
      00001F0000000000000000008000008000000080800080000000800080008080
      0000C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
      0000FFFFFF001F7C10001000100010001000100010001F7C00001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F1000
      00001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7F000000000000
      00000000FF7F100000001000FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000
      FF7FFF7FFF7F0000FF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F100000001F7C10001000100010001000100010001F7C0000}
  end
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonNuovo: TSpeedButton
      OnClick = RxSpeedButtonNuovoClick
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = False
    end
    inherited RxSpeedButtonTrova: TSpeedButton
      Enabled = True
    end
    inherited RxSpeedButtonResetQuery: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonResetQueryClick
    end
    inherited RxSpeedButtonVisualizza: TSpeedButton
      Enabled = False
    end
  end
  inherited ClientArea: TScrollBox
    inherited PanelFiltri: TPanel
      Top = 462
      Height = 124
      Visible = True
      ExplicitTop = 462
      ExplicitHeight = 124
      object Label47: TLabel
        Left = 611
        Top = 39
        Width = 73
        Height = 85
        Alignment = taCenter
        AutoSize = False
        Caption = 'Al'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label48: TLabel
        Left = 537
        Top = 39
        Width = 74
        Height = 85
        Alignment = taCenter
        AutoSize = False
        Caption = 'Dal'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object AssOtt: TSpeedButton
        Tag = 10
        Left = 611
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Ott'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssNov: TSpeedButton
        Tag = 11
        Left = 635
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Nov'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssDic: TSpeedButton
        Tag = 12
        Left = 659
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Dic'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssAgo: TSpeedButton
        Tag = 8
        Left = 563
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Ago'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssLug: TSpeedButton
        Tag = 7
        Left = 539
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Lug'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssGiu: TSpeedButton
        Tag = 6
        Left = 659
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Giu'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssMag: TSpeedButton
        Tag = 5
        Left = 635
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Mag'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssGen: TSpeedButton
        Tag = 1
        Left = 539
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Gen'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssFeb: TSpeedButton
        Tag = 2
        Left = 563
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Feb'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssMar: TSpeedButton
        Tag = 3
        Left = 587
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Mar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssApr: TSpeedButton
        Tag = 4
        Left = 611
        Top = 88
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Apr'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object AssMesiTutti: TSpeedButton
        Left = 539
        Top = 70
        Width = 72
        Height = 16
        Cursor = crHandPoint
        Hint = 
          'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
          'o.'
        Caption = 'Tutti'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssMesiTuttiClick
        OnMouseUp = AssMesiTuttiMouseUp
      end
      object AssMesiNessuno: TSpeedButton
        Left = 611
        Top = 70
        Width = 72
        Height = 16
        Cursor = crHandPoint
        Hint = 
          'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
          'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
          'li anni).'
        Caption = 'Nessuno'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssMesiNessunoClick
        OnMouseUp = AssMesiNessunoMouseUp
      end
      object AssSet: TSpeedButton
        Tag = 9
        Left = 587
        Top = 105
        Width = 24
        Height = 17
        Cursor = crHandPoint
        Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
        AllowAllUp = True
        GroupIndex = 600
        Caption = 'Set'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = AssGenClick
        OnMouseUp = AssGenMouseUp
      end
      object BitBtnAssDal: TSpeedButtonRollOver
        Left = 593
        Top = 54
        Width = 14
        Height = 13
        Cursor = crHandPoint
        Glyph.Data = {
          FA0A0000424DFA0A0000000000003600000028000000460000000D0000000100
          180000000000C40A0000120B0000120B00000000000000000000FAE0DAFAE0DA
          FAE0DAF4D4CBE4B19CE1A288E19A7BE19A7BE1A287E4B19BF4D4CAFAE0DAFAE0
          DAFAE0DAFAE0DAFAE0DAFAE0DAF9DED8F5D8CFF4D4CBF2D1C7F2D1C7F4D4CBF5
          D7CFF9DED7FAE0DAFAE0DAFAE0DAFAE0DAFAE0DAFAE0DAF5D8D2E8BBADE3A993
          E19B7CE19B7CE3A993E8BBADF5D8D2FAE0DAFAE0DAFAE0DAFAE0DAFAE0DAFAE0
          DAE7CAD2C79AADCE9493E09A7CE09A7CCE9493C79AADE7CAD2FAE0DAFAE0DAFA
          E0DAFAE0DAFAE0DAFAE0DAE8CBD1C89BACCF9493E09A7CE09A7CCF9493C89AAC
          E8CAD1FAE0DAFAE0DAFAE0DA0000FAE0DAFAE0DAE8BAA9E19B7CE0A38ADFB09E
          DFBAADDFBBAFDFB1A0E0A389E19A7CE8BAA9FAE0DAFAE0DAFAE0DAFAE0DAF6D9
          D1F2D2C8F4D4CCF6D9D1F8DCD6F8DCD6F6D9D1F4D4CBF2D1C7F6D9D1FAE0DAFA
          E0DAFAE0DAFAE0DAE8C0B9E19C7EE0A999DFBEC1DFCEE1DFD0E5E0C1C5E1A998
          E19B7CE8C1B9FAE0DAFAE0DAFAE0DAFAE0DACEA6B9DE997EC79098A583C08A78
          DF8677E3A181C4C89097E09A7CCEA6B9FAE0DAFAE0DAFAE0DAFAE0DACFA7B8DF
          997EC89198A684C08C7BDE897AE2A383C3C99197E09A7CCFA7B8FAE0DAFAE0DA
          0000FAE0DAE9BCABE19F82E1BAACE1C8C1E1C8C1E1C8C1E1C8C0E1C8C0E1C8C0
          E1BAACE19D80E9BBAAFAE0DAFAE0DAF6D9D2F3D3C9F8DBD4FAE0DAFAE0DAF9DF
          D9F9DFD9F9DED8F8DED8F6DAD2F3D2C8F6D9D1FAE0DAFAE0DAE6BEB9E0A088D7
          C0D4D3D0FAD3D0FAD4D0FAD4D0FAD4D0FAD4D0FAD8C1D5E09E83E6BEB9FAE0DA
          FAE0DAD2AAB9D797889E86D3827EF8827EF8827EF8817EF8817EF8817EF89D86
          D3DB9883D1A9B9FAE0DAFAE0DAD3AAB8D89888A189D28581F78581F78581F785
          81F78581F78581F7A088D3DB9883D2AAB8FAE0DA0000F2D0C6E19D7FE3C2B5E4
          CEC7E4CEC7E4CEC7E4CDC7E4CDC7E4CDC7E4CDC7E4CDC7E3BCAEE19C7EF2D0C6
          F8DDD6F3D2C8F8DCD5FAE0D9FAE0DAFAE0D9F9DFD9F9DFD9F8DED8F8DED8F8DE
          D7F6D9D2F3D2C8F8DDD6EECFCDE09C82CEBBDCC8C5FAC8C5FAC8C5FAC8C5FAC8
          C5FAC9C6FAC9C6FAC9C6FAD1B7D0E09C80EECFCEE6C7CDDD9982A38FDB908CF9
          908CF9908CF98F8CF98F8CF98F8CF98F8CF98F8BF9AA90CFDD9980E5C6CEE6C7
          CDDD9982A692DB9390F89390F89390F89390F8928FF8928FF8928FF8928FF8AC
          92CEDE9980E6C7CD0000E6B29CE3AF99E7D3CEE7D3CEE7D3CEE7D3CDE7D3CDE7
          D3CDE7D3CDE7D3CDE7D3CDE7D3CDE3AE97E6B29CF5D6CEF5D6CEF9DFD9F9DFD9
          F9DFD9F9DFD9F9DFD9F9DED8F8DED8F8DED8F8DED7F8DDD7F4D5CCF5D6CDDCAC
          A7D4A6A9BDBAFABDBAFABDBAFABEBAFABEBAFABEBAFABEBAFABEBAFABEBBFABE
          BBFAD5A5A7DCACA7D5A4A7C99AA99E9AF99E9AF99E9AF99D9AF99D9AF99D9AF9
          9D9AF99D99F99D99F99D99F9CA9AA6D4A4A7D5A5A7CA9CA9A19EF9A19EF9A19E
          F9A19EF9A09DF9A09DF9A09DF9A09DF9A09DF9A09DF9CB9BA6D5A5A70000E29E
          81E9CCC1EBD9D4211FF9211FF9EBD9D40000FF0000FFEAD9D30000FF0000FFEA
          D9D3E7C5B7E29E81F3D2C8F7DCD4F9DED8F1D0C6F1D0C6F9DFD9F0CDC2EFCDC2
          F8DED8EFCDC2EFCCC2F7DDD7F6D9D2F3D2C8DE9B83BCABDEB2AFF91919FE1919
          FEB3AFF90000FF0000FFB3B0FA0000FF0000FFB3B0FAC2A9D2DE9C84DE9B83B7
          A6DEACA9F91818FE1818FEABA8F90000FF0000FFABA7F90000FF0000FFABA7F9
          BBA3D1DD9B84DE9B83BAA9DFAFACFA1918FE1918FEAFACFA0000FF0000FFAEAC
          FA0000FF0000FFADABFABDA6D2DD9B840000E19A7BEDD9D2EEDFDB221FFA221F
          FAEEDFDA0000FF0000FFEEDEDA0000FF0000FFEEDEDAECD4CCE19B7CF2D1C7F8
          DDD6F8DED8F1CFC5F1CFC5F8DED8EFCDC2EFCDC2F8DED8EFCCC2EFCCC2F7DDD6
          F6DBD4F2D1C7E19A7BADA3EEA8A4F91817FE1817FEA8A5F90000FF0000FFA8A5
          F90000FF0000FFA9A5F9B1A3E7E09A7CE19A7BBEB4EEBAB7F91A1AFE1A1AFEB9
          B6F90000FF0000FFB9B5F90000FF0000FFB8B5F9BEB1E7E19A7CE19A7BBFB7EF
          BCBAFB1B1AFE1B1AFEBCBAFB0000FF0000FFBCBAFB0000FF0000FFBBB9FBC1B4
          E8E19A7D0000E29F82EDD2C7F1E5E1F1E4E1F1E4E1F1E4E1F1E4E1F1E4E0F1E4
          E0F1E4E0F1E4E0F1E4E0ECCDC1E2A083F3D2C8F6DAD4F8DED8F8DED8F8DED8F8
          DED8F8DED8F8DED8F8DDD7F8DDD7F7DDD6F7DCD6F6D9D2F3D2C8DC9A84AD99D9
          9C99F99D99F99D99F99D99F99D99F99E9AF99E9AF99E9AF99E9AF99E9AF9B39A
          D2DC9A84DF9D84CEBAD9C8C5F9C7C4F9C7C4F9C7C4F9C7C4F9C7C3F9C7C3F9C7
          C3F9C7C3F9C6C3F9CEB6D2DF9D84DF9D84D0BDDCCAC9FCCAC9FCCAC8FCCAC8FC
          CAC8FCCAC8FCC9C7FCC9C7FCC9C7FCC9C7FCD0B9D4DF9D850000EAB8A2E9BAA6
          F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7F4EAE7E7B4
          9EE9B8A2F5D6CEF4D6CEF8DED7F8DED7F8DED7F8DED7F8DED7F8DDD7F8DDD7F7
          DDD6F7DCD6F7DCD6F4D5CCF5D6CDD2A2A8C295AD928EF9928EF9928EF9928FF9
          928FF9928FF9928FF9938FF9938FF9938FF9C896A4D2A2A8E2B2A8DDB1ADD5D2
          F9D5D2F9D5D2F9D5D2F9D5D1F9D5D1F9D5D1F9D5D1F9D4D1F9D4D1F9DDACA4E1
          B2A8E2B3A8DDB2AED8D7FDD7D6FDD7D6FDD7D6FDD7D6FDD7D6FCD7D6FCD7D6FC
          D7D6FCD6D5FCDDADA5E2B3A80000F5D6CBE3A184F3DED7F8F0EEF8F0EEF8F0ED
          F8F0EDF8F0EDF8F0EDF7EFEDF7EFEDF1D9CFE29E81F5D6CBF8DDD6F3D2C8F6DA
          D4F8DDD7F8DDD7F8DDD7F8DDD7F7DDD7F7DDD6F7DCD6F7DCD6F5D9D2F3D2C8F8
          DDD6E4C5CDDA98859988DF8783F98783F98783F98783F98884F98884F98884F9
          8884F99F8BD8DC9981E4C5CDF2D3CEE1A085E3D2E0E3E0FAE3E0FAE3E0FAE3E0
          FAE3E0FAE3E0FAE2DFFAE2DFFAE2CDD9E19E81F2D3CEF2D4CEE1A086E4D5E2E5
          E4FDE5E4FDE5E4FDE5E4FDE5E4FDE5E4FDE5E4FDE4E3FDE3D0DBE19E82F2D4CE
          0000FAE0DAEFC7B7E3A184F5DFD6FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4
          F5DFD6E3A184EFC7B7FAE0DAFAE0DAF6D9D1F3D2C8F6DAD3F7DDD6F7DDD6F7DD
          D6F7DCD6F7DCD6F7DCD6F6D9D2F3D2C8F6D8D1FAE0DAFAE0DAD0A8B9D9978495
          80DA7C78F97D79F97D79F97D79F97D79F97D79F99681DADA9884D1A8B9FAE0DA
          FAE0DAEDC5B9E2A084EDD9DBF1EEFAF1EEFAF1EEFAF1EEFAF0EDFAF0EDFAECD8
          DBE2A084ECC5B9FAE0DAFAE0DAEEC6BAE2A185EFDDDEF3F3FEF3F3FEF2F2FEF2
          F2FEF2F2FEF2F1FEEEDCDEE2A085EDC6BAFAE0DA0000FAE0DAFAE0DAF0C8B8E3
          A082EAB7A0F4D8CDF9EBE5FAECE7F3D7CBE9B39CE29D7FF0C8B8FAE0DAFAE0DA
          FAE0DAFAE0DAF6D9D1F3D2C8F4D4CCF5D8D1F6DAD4F6DAD4F5D8D0F4D4CBF2D2
          C8F6D8D0FAE0DAFAE0DAFAE0DAFAE0DACDA5B8DA9782C08DA0997DCC8374E483
          75E69B7ECBC48F9CDD987FCDA5B8FAE0DAFAE0DAFAE0DAFAE0DAF0C8B8E3A082
          EAB7A0F4D8CDF9EBE5FAECE7F3D7CBE9B39CE29D7FF0C8B8FAE0DAFAE0DAFAE0
          DAFAE0DAF0C9BAE3A083EAB8A2F4DBD0FAEEE9FAF0EBF4DACEE9B49DE29E80F0
          C9BAFAE0DAFAE0DA0000FAE0DAFAE0DAFAE0DAF7DAD2EDC0AEE7AC93E19B7CE1
          9B7CE7AC93EDC0ADF7DAD2FAE0DAFAE0DAFAE0DAFAE0DAFAE0DAFAE0DAF9DED7
          F5D7CEF3D4CAF2D1C7F2D1C7F3D3CAF5D7CEF9DED7FAE0DAFAE0DAFAE0DAFAE0
          DAFAE0DAFAE0DAE7CAD2C79AAECF9493E0997CE0997CCF9493C89AADE7CAD2FA
          E0DAFAE0DAFAE0DAFAE0DAFAE0DAFAE0DAF7DAD2EDC0AEE7AC93E19B7CE19B7C
          E7AC93EDC0ADF7DAD2FAE0DAFAE0DAFAE0DAFAE0DAFAE0DAFAE0DAF7DBD2EDC1
          AEE7AD94E19B7DE19B7DE7AD94EDC0AEF7DBD2FAE0DAFAE0DAFAE0DA0000}
      end
      object BitBtnAssAl: TSpeedButtonRollOver
        Left = 667
        Top = 54
        Width = 14
        Height = 13
        Cursor = crHandPoint
        Glyph.Data = {
          6E0E0000424D6E0E0000000000003600000028000000460000000D0000000100
          200000000000380E000000000000000000000000000000000000FAE0DA00FAE0
          DA00FAE0DA00F4D4CB00E4B19C00E1A28800E19A7B00E19A7B00E1A28700E4B1
          9B00F4D4CA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00F9DE
          D800F5D8CF00F4D4CB00F2D1C700F2D1C700F4D4CB00F5D7CF00F9DED700FAE0
          DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00F5D8D200E8BBAD00E3A9
          9300E19B7C00E19B7C00E3A99300E8BBAD00F5D8D200FAE0DA00FAE0DA00FAE0
          DA00FAE0DA00FAE0DA00FAE0DA00E7CAD200C79AAD00CE949300E09A7C00E09A
          7C00CE949300C79AAD00E7CAD200FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0
          DA00FAE0DA00E8CBD100C89BAC00CF949300E09A7C00E09A7C00CF949300C89A
          AC00E8CAD100FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00E8BAA900E19B
          7C00E0A38A00DFB09E00DFBAAD00DFBBAF00DFB1A000E0A38900E19A7C00E8BA
          A900FAE0DA00FAE0DA00FAE0DA00FAE0DA00F6D9D100F2D2C800F4D4CC00F6D9
          D100F8DCD600F8DCD600F6D9D100F4D4CB00F2D1C700F6D9D100FAE0DA00FAE0
          DA00FAE0DA00FAE0DA00E8C0B900E19C7E00E0A99900DFBEC100DFCEE100DFD0
          E500E0C1C500E1A99800E19B7C00E8C1B900FAE0DA00FAE0DA00FAE0DA00FAE0
          DA00CEA6B900DE997E00C7909800A583C0008A78DF008677E300A181C400C890
          9700E09A7C00CEA6B900FAE0DA00FAE0DA00FAE0DA00FAE0DA00CFA7B800DF99
          7E00C8919800A684C0008C7BDE00897AE200A383C300C9919700E09A7C00CFA7
          B800FAE0DA00FAE0DA00FAE0DA00E9BCAB00E19F8200E1BAAC00E1C8C100E1C8
          C100E1C8C100E1C8C000E1C8C000E1C8C000E1BAAC00E19D8000E9BBAA00FAE0
          DA00FAE0DA00F6D9D200F3D3C900F8DBD400FAE0DA00FAE0DA00F9DFD900F9DF
          D900F9DED800F8DED800F6DAD200F3D2C800F6D9D100FAE0DA00FAE0DA00E6BE
          B900E0A08800D7C0D400D3D0FA00D3D0FA00D4D0FA00D4D0FA00D4D0FA00D4D0
          FA00D8C1D500E09E8300E6BEB900FAE0DA00FAE0DA00D2AAB900D79788009E86
          D300827EF800827EF800827EF800817EF800817EF800817EF8009D86D300DB98
          8300D1A9B900FAE0DA00FAE0DA00D3AAB800D8988800A189D2008581F7008581
          F7008581F7008581F7008581F7008581F700A088D300DB988300D2AAB800FAE0
          DA00F2D0C600E19D7F00E3C2B500E4CEC700E4CEC700E4CEC700E4CDC700E4CD
          C700E4CDC700E4CDC700E4CDC700E3BCAE00E19C7E00F2D0C600F8DDD600F3D2
          C800F8DCD500FAE0D900FAE0DA00FAE0D900F9DFD900F9DFD900F8DED800F8DE
          D800F8DED700F6D9D200F3D2C800F8DDD600EECFCD00E09C8200CEBBDC00C8C5
          FA00C8C5FA00C8C5FA00C8C5FA00C8C5FA00C9C6FA00C9C6FA00C9C6FA00D1B7
          D000E09C8000EECFCE00E6C7CD00DD998200A38FDB00908CF900908CF900908C
          F9008F8CF9008F8CF9008F8CF9008F8CF9008F8BF900AA90CF00DD998000E5C6
          CE00E6C7CD00DD998200A692DB009390F8009390F8009390F8009390F800928F
          F800928FF800928FF800928FF800AC92CE00DE998000E6C7CD00E6B29C00E3AF
          9900E7D3CE00E7D3CE00E7D3CE00E7D3CD00E7D3CD00E7D3CD00E7D3CD00E7D3
          CD00E7D3CD00E7D3CD00E3AE9700E6B29C00F5D6CE00F5D6CE00F9DFD900F9DF
          D900F9DFD900F9DFD900F9DFD900F9DED800F8DED800F8DED800F8DED700F8DD
          D700F4D5CC00F5D6CD00DCACA700D4A6A900BDBAFA00BDBAFA00BDBAFA00BEBA
          FA00BEBAFA00BEBAFA00BEBAFA00BEBAFA00BEBBFA00BEBBFA00D5A5A700DCAC
          A700D5A4A700C99AA9009E9AF9009E9AF9009E9AF9009D9AF9009D9AF9009D9A
          F9009D9AF9009D99F9009D99F9009D99F900CA9AA600D4A4A700D5A5A700CA9C
          A900A19EF900A19EF900A19EF900A19EF900A09DF900A09DF900A09DF900A09D
          F900A09DF900A09DF900CB9BA600D5A5A700E29E8100E9CCC100EBD9D400211F
          F900211FF900EBD9D4000000FF000000FF00EAD9D3000000FF000000FF00EAD9
          D300E7C5B700E29E8100F3D2C800F7DCD400F9DED800F1D0C600F1D0C600F9DF
          D900F0CDC200EFCDC200F8DED800EFCDC200EFCCC200F7DDD700F6D9D200F3D2
          C800DE9B8300BCABDE00B2AFF9001919FE001919FE00B3AFF9000000FF000000
          FF00B3B0FA000000FF000000FF00B3B0FA00C2A9D200DE9C8400DE9B8300B7A6
          DE00ACA9F9001818FE001818FE00ABA8F9000000FF000000FF00ABA7F9000000
          FF000000FF00ABA7F900BBA3D100DD9B8400DE9B8300BAA9DF00AFACFA001918
          FE001918FE00AFACFA000000FF000000FF00AEACFA000000FF000000FF00ADAB
          FA00BDA6D200DD9B8400E19A7B00EDD9D200EEDFDB00221FFA00221FFA00EEDF
          DA000000FF000000FF00EEDEDA000000FF000000FF00EEDEDA00ECD4CC00E19B
          7C00F2D1C700F8DDD600F8DED800F1CFC500F1CFC500F8DED800EFCDC200EFCD
          C200F8DED800EFCCC200EFCCC200F7DDD600F6DBD400F2D1C700E19A7B00ADA3
          EE00A8A4F9001817FE001817FE00A8A5F9000000FF000000FF00A8A5F9000000
          FF000000FF00A9A5F900B1A3E700E09A7C00E19A7B00BEB4EE00BAB7F9001A1A
          FE001A1AFE00B9B6F9000000FF000000FF00B9B5F9000000FF000000FF00B8B5
          F900BEB1E700E19A7C00E19A7B00BFB7EF00BCBAFB001B1AFE001B1AFE00BCBA
          FB000000FF000000FF00BCBAFB000000FF000000FF00BBB9FB00C1B4E800E19A
          7D00E29F8200EDD2C700F1E5E100F1E4E100F1E4E100F1E4E100F1E4E100F1E4
          E000F1E4E000F1E4E000F1E4E000F1E4E000ECCDC100E2A08300F3D2C800F6DA
          D400F8DED800F8DED800F8DED800F8DED800F8DED800F8DED800F8DDD700F8DD
          D700F7DDD600F7DCD600F6D9D200F3D2C800DC9A8400AD99D9009C99F9009D99
          F9009D99F9009D99F9009D99F9009E9AF9009E9AF9009E9AF9009E9AF9009E9A
          F900B39AD200DC9A8400DF9D8400CEBAD900C8C5F900C7C4F900C7C4F900C7C4
          F900C7C4F900C7C3F900C7C3F900C7C3F900C7C3F900C6C3F900CEB6D200DF9D
          8400DF9D8400D0BDDC00CAC9FC00CAC9FC00CAC8FC00CAC8FC00CAC8FC00CAC8
          FC00C9C7FC00C9C7FC00C9C7FC00C9C7FC00D0B9D400DF9D8500EAB8A200E9BA
          A600F4EAE700F4EAE700F4EAE700F4EAE700F4EAE700F4EAE700F4EAE700F4EA
          E700F4EAE700F4EAE700E7B49E00E9B8A200F5D6CE00F4D6CE00F8DED700F8DE
          D700F8DED700F8DED700F8DED700F8DDD700F8DDD700F7DDD600F7DCD600F7DC
          D600F4D5CC00F5D6CD00D2A2A800C295AD00928EF900928EF900928EF900928F
          F900928FF900928FF900928FF900938FF900938FF900938FF900C896A400D2A2
          A800E2B2A800DDB1AD00D5D2F900D5D2F900D5D2F900D5D2F900D5D1F900D5D1
          F900D5D1F900D5D1F900D4D1F900D4D1F900DDACA400E1B2A800E2B3A800DDB2
          AE00D8D7FD00D7D6FD00D7D6FD00D7D6FD00D7D6FD00D7D6FC00D7D6FC00D7D6
          FC00D7D6FC00D6D5FC00DDADA500E2B3A800F5D6CB00E3A18400F3DED700F8F0
          EE00F8F0EE00F8F0ED00F8F0ED00F8F0ED00F8F0ED00F7EFED00F7EFED00F1D9
          CF00E29E8100F5D6CB00F8DDD600F3D2C800F6DAD400F8DDD700F8DDD700F8DD
          D700F8DDD700F7DDD700F7DDD600F7DCD600F7DCD600F5D9D200F3D2C800F8DD
          D600E4C5CD00DA9885009988DF008783F9008783F9008783F9008783F9008884
          F9008884F9008884F9008884F9009F8BD800DC998100E4C5CD00F2D3CE00E1A0
          8500E3D2E000E3E0FA00E3E0FA00E3E0FA00E3E0FA00E3E0FA00E3E0FA00E2DF
          FA00E2DFFA00E2CDD900E19E8100F2D3CE00F2D4CE00E1A08600E4D5E200E5E4
          FD00E5E4FD00E5E4FD00E5E4FD00E5E4FD00E5E4FD00E5E4FD00E4E3FD00E3D0
          DB00E19E8200F2D4CE00FAE0DA00EFC7B700E3A18400F5DFD600FBF5F400FBF5
          F400FBF5F400FBF5F400FBF5F400FBF5F400F5DFD600E3A18400EFC7B700FAE0
          DA00FAE0DA00F6D9D100F3D2C800F6DAD300F7DDD600F7DDD600F7DDD600F7DC
          D600F7DCD600F7DCD600F6D9D200F3D2C800F6D8D100FAE0DA00FAE0DA00D0A8
          B900D99784009580DA007C78F9007D79F9007D79F9007D79F9007D79F9007D79
          F9009681DA00DA988400D1A8B900FAE0DA00FAE0DA00EDC5B900E2A08400EDD9
          DB00F1EEFA00F1EEFA00F1EEFA00F1EEFA00F0EDFA00F0EDFA00ECD8DB00E2A0
          8400ECC5B900FAE0DA00FAE0DA00EEC6BA00E2A18500EFDDDE00F3F3FE00F3F3
          FE00F2F2FE00F2F2FE00F2F2FE00F2F1FE00EEDCDE00E2A08500EDC6BA00FAE0
          DA00FAE0DA00FAE0DA00F0C8B800E3A08200EAB7A000F4D8CD00F9EBE500FAEC
          E700F3D7CB00E9B39C00E29D7F00F0C8B800FAE0DA00FAE0DA00FAE0DA00FAE0
          DA00F6D9D100F3D2C800F4D4CC00F5D8D100F6DAD400F6DAD400F5D8D000F4D4
          CB00F2D2C800F6D8D000FAE0DA00FAE0DA00FAE0DA00FAE0DA00CDA5B800DA97
          8200C08DA000997DCC008374E4008375E6009B7ECB00C48F9C00DD987F00CDA5
          B800FAE0DA00FAE0DA00FAE0DA00FAE0DA00F0C8B800E3A08200EAB7A000F4D8
          CD00F9EBE500FAECE700F3D7CB00E9B39C00E29D7F00F0C8B800FAE0DA00FAE0
          DA00FAE0DA00FAE0DA00F0C9BA00E3A08300EAB8A200F4DBD000FAEEE900FAF0
          EB00F4DACE00E9B49D00E29E8000F0C9BA00FAE0DA00FAE0DA00FAE0DA00FAE0
          DA00FAE0DA00F7DAD200EDC0AE00E7AC9300E19B7C00E19B7C00E7AC9300EDC0
          AD00F7DAD200FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00F9DE
          D700F5D7CE00F3D4CA00F2D1C700F2D1C700F3D3CA00F5D7CE00F9DED700FAE0
          DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0DA00E7CAD200C79AAE00CF94
          9300E0997C00E0997C00CF949300C89AAD00E7CAD200FAE0DA00FAE0DA00FAE0
          DA00FAE0DA00FAE0DA00FAE0DA00F7DAD200EDC0AE00E7AC9300E19B7C00E19B
          7C00E7AC9300EDC0AD00F7DAD200FAE0DA00FAE0DA00FAE0DA00FAE0DA00FAE0
          DA00FAE0DA00F7DBD200EDC1AE00E7AD9400E19B7D00E19B7D00E7AD9400EDC0
          AE00F7DBD200FAE0DA00FAE0DA00FAE0DA00}
      end
      object StaticText32: TStaticText
        Left = 289
        Top = 68
        Width = 238
        Height = 18
        AutoSize = False
        Caption = ' Localit'#224
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object StaticText29: TStaticText
        Left = 289
        Top = 42
        Width = 238
        Height = 18
        AutoSize = False
        Caption = ' Modello'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object AssAl: TMaskEdit
        Left = 614
        Top = 55
        Width = 50
        Height = 12
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        EditMask = ' !99/99/\2\000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 11
        ParentFont = False
        TabOrder = 2
        Text = '   /  /20  '
        OnKeyPress = FilterIndirizzoKeyPress
      end
      object AssDal: TMaskEdit
        Left = 540
        Top = 55
        Width = 50
        Height = 12
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        EditMask = ' !99/99/\2\000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 11
        ParentFont = False
        TabOrder = 3
        Text = '   /  /20  '
        OnKeyPress = FilterIndirizzoKeyPress
      end
      object StaticText20: TStaticText
        Left = 0
        Top = 85
        Width = 279
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 4
      end
      object FilterAbbonati: TCheckListBox
        Left = 1
        Top = 86
        Width = 277
        Height = 14
        Cursor = crHandPoint
        OnClickCheck = FilterAbbonatiClickCheck
        BorderStyle = bsNone
        Color = 16575977
        Columns = 2
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 14
        Items.Strings = (
          'Abbonati'
          'NON Abbonati')
        ParentCtl3D = False
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 5
        OnExit = FilterAbbonatiExit
        OnMouseUp = FilterAbbonatiMouseUp
      end
      object StaticText27: TStaticText
        Left = 0
        Top = 105
        Width = 279
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 6
      end
      object FilterInScadenza: TCheckListBox
        Left = 1
        Top = 106
        Width = 277
        Height = 14
        Cursor = crHandPoint
        OnClickCheck = FilterAbbonatiClickCheck
        BorderStyle = bsNone
        Color = 16575977
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 14
        Items.Strings = (
          'Solo con manutenzione in SCADENZA')
        ParentCtl3D = False
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 7
        OnExit = FilterAbbonatiExit
        OnMouseUp = FilterAbbonatiMouseUp
      end
      object StaticText28: TStaticText
        Left = 289
        Top = 25
        Width = 238
        Height = 18
        AutoSize = False
        Caption = ' Costruttore'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 8
      end
      object FilterCostruttore: TcxComboBox
        Left = 353
        Top = 24
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.Sorted = True
        Properties.OnInitPopup = FilterCostruttorePropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 9
        Height = 20
        Width = 175
      end
      object FilterModello: TcxComboBox
        Left = 353
        Top = 41
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.OnInitPopup = FilterModelloPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 10
        Height = 20
        Width = 175
      end
      object FilterLocalita: TcxComboBox
        Left = 353
        Top = 67
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.OnInitPopup = FilterLocalitaPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 11
        Height = 20
        Width = 175
      end
      object StaticText36: TStaticText
        Left = 417
        Top = 102
        Width = 110
        Height = 18
        AutoSize = False
        Caption = ' CAP'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 12
      end
      object StaticText39: TStaticText
        Left = 1
        Top = 42
        Width = 279
        Height = 18
        AutoSize = False
        Caption = ' Periodicit'#224'  (GG)'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 13
      end
      object StaticText42: TStaticText
        Left = 1
        Top = 25
        Width = 279
        Height = 18
        AutoSize = False
        Caption = ' Tipo impianto'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 14
      end
      object FilterTipoImpianto: TcxComboBox
        Left = 94
        Top = 24
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.Items.Strings = (
          'Caldaia'
          'Generico'
          'Macchina per freddo')
        Properties.Sorted = True
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 15
        Height = 20
        Width = 187
      end
      object FilterPeriodicita: TcxComboBox
        Left = 94
        Top = 41
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.OnInitPopup = FilterPeriodicitaPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 16
        Height = 20
        Width = 187
      end
      object StaticText23: TStaticText
        Left = 537
        Top = 21
        Width = 147
        Height = 18
        AutoSize = False
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 17
      end
      object FilterTipoData: TcxComboBox
        Left = 536
        Top = 20
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.Items.Strings = (
          'Prossimo intervento'
          'Ultimo intervento')
        Properties.Sorted = True
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 18
        Text = 'Prossimo intervento'
        Height = 20
        Width = 149
      end
      object FilterCAP: TcxComboBox
        Left = 448
        Top = 101
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.OnInitPopup = FilterCAPPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 19
        Height = 20
        Width = 80
      end
      object StaticText57: TStaticText
        Left = 289
        Top = 85
        Width = 238
        Height = 18
        AutoSize = False
        Caption = ' Via'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 20
      end
      object StaticText58: TStaticText
        Left = 289
        Top = 103
        Width = 132
        Height = 18
        AutoSize = False
        Caption = ' N'#176' civico'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 21
      end
      object FilterIndirizzo: TEdit
        Left = 355
        Top = 86
        Width = 171
        Height = 16
        Hint = 
          'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
          'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        OnKeyPress = FilterIndirizzoKeyPress
      end
      object FilterNumCivico: TEdit
        Left = 355
        Top = 103
        Width = 59
        Height = 16
        Hint = 
          'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
          'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnKeyPress = FilterIndirizzoKeyPress
      end
      object StaticText69: TStaticText
        Left = 1
        Top = 59
        Width = 279
        Height = 18
        AutoSize = False
        Caption = ' Tipo contratto'
        Color = 16441562
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 24
      end
      object FilterTipoContratto: TcxComboBox
        Left = 94
        Top = 58
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediateDropDownWhenKeyPressed = False
        Properties.OnInitPopup = FilterTipoContrattoPropertiesInitPopup
        Style.BorderStyle = ebsNone
        Style.Color = 16575977
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -9
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.PopupBorderStyle = epbsSingle
        Style.IsFontAssigned = True
        TabOrder = 25
        Height = 20
        Width = 187
      end
    end
    inherited GridQ: TcxGrid
      Height = 462
      ExplicitHeight = 462
      inherited tvQ: TcxGridDBTableView
        OnEndDrag = tvQEndDrag
        OnCustomDrawCell = tvQCustomDrawCell
        DataController.DataModeController.GridMode = False
        DataController.KeyFieldNames = 'TIPO;CODICE;DATAAPERTURA'
        DataController.OnGroupingChanged = tvQDataControllerGroupingChanged
        DataController.OnSortingChanged = tvQDataControllerSortingChanged
        OptionsCustomize.ColumnSorting = True
        Styles.Background = nil
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Selection = nil
        Styles.Footer = nil
        Styles.Group = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
        object tvQABBONATO: TcxGridDBColumn
          Caption = 'Abb.'
          DataBinding.FieldName = 'ABBONATO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.AllowGrayed = True
          Properties.ValueChecked = 'T'
          Properties.ValueGrayed = 'S'
          Properties.ValueUnchecked = 'F'
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Width = 27
        end
        object tvQSTATO: TcxGridDBColumn
          Caption = 'Stato'
          DataBinding.FieldName = 'STATO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvQRAGIONESOCIALE: TcxGridDBColumn
          Caption = 'Proprietario'
          DataBinding.FieldName = 'RAGIONESOCIALE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Width = 130
        end
        object tvQCOSTRUTTORE: TcxGridDBColumn
          Caption = 'Costruttore'
          DataBinding.FieldName = 'COSTRUTTORE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Width = 65
        end
        object tvQMODELLO: TcxGridDBColumn
          Caption = 'Modello'
          DataBinding.FieldName = 'MODELLO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Width = 70
        end
        object tvQMATRICOLA: TcxGridDBColumn
          Caption = 'Matricola'
          DataBinding.FieldName = 'MATRICOLA'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object tvQRAGSOCUT: TcxGridDBColumn
          Caption = 'Utente/Occupante'
          DataBinding.FieldName = 'RAGSOCUT'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 130
        end
        object tvQBREVEDESCRIZIONECALDAIA: TcxGridDBColumn
          Caption = 'Breve desc. apparecchio'
          DataBinding.FieldName = 'BREVEDESCRIZIONECALDAIA'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Width = 250
        end
        object tvQTIPOIMPIANTO: TcxGridDBColumn
          Caption = 'Tipo impianto'
          DataBinding.FieldName = 'TIPOIMPIANTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 110
        end
        object tvQPERIODICITA: TcxGridDBColumn
          Caption = 'Period.'
          DataBinding.FieldName = 'PERIODICITA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object tvQIMPORTOCONTRATTO: TcxGridDBColumn
          Caption = 'Importo'
          DataBinding.FieldName = 'IMPORTOCONTRATTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object tvQTIPOCONTRATTO: TcxGridDBColumn
          Caption = 'Contr.'
          DataBinding.FieldName = 'TIPOCONTRATTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 35
        end
        object tvQCELLULARE: TcxGridDBColumn
          Caption = 'Cellulare'
          DataBinding.FieldName = 'CELLULARE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvQTELEFONO: TcxGridDBColumn
          Caption = 'Telefono'
          DataBinding.FieldName = 'TELEFONO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvQCAPIMM: TcxGridDBColumn
          Caption = 'CAP'
          DataBinding.FieldName = 'CAPIMM'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 40
        end
        object tvQCOMUNEIMM: TcxGridDBColumn
          Caption = 'Localit'#224' utenza'
          DataBinding.FieldName = 'COMUNEIMM'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 120
        end
        object tvQDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBColumn
          Caption = 'Appuntamento'
          DataBinding.FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.Content = DM1.tvAnotherContent1Bold
          Width = 90
        end
        object tvQPROSSIMOINTERVENTOPREVISTO: TcxGridDBColumn
          Caption = 'Prox.entro'
          DataBinding.FieldName = 'PROSSIMOINTERVENTOPREVISTO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Styles.Content = DM1.tvAnotherContent1Bold
          Width = 56
        end
        object tvQDATAULTIMAPROVACOMBUSTIONE: TcxGridDBColumn
          Caption = 'U.comb'
          DataBinding.FieldName = 'DATAULTIMAPROVACOMBUSTIONE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Styles.Content = DM1.tvAnotherContent1
          Width = 42
        end
        object tvQDATAULTIMAPULIZIA: TcxGridDBColumn
          Caption = 'U.manu'
          DataBinding.FieldName = 'DATAULTIMAPULIZIA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Styles.Content = DM1.tvAnotherContent1
          Width = 42
        end
        object tvQDATAINSTALLAZIONE: TcxGridDBColumn
          Caption = 'Install.'
          DataBinding.FieldName = 'DATAINSTALLAZIONE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 1
          Styles.Content = DM1.tvAnotherContent1
          Width = 40
        end
      end
    end
  end
  inherited Q: TIBOQuery
    OnCalcFields = QCalcFields
    SQL.Strings = (
      'SELECT'
      '      P.TIPO,'
      '      P.CODICE,'
      '      P.DATAAPERTURA,'
      
        '      CAST(P.CLIENTE || '#39' - '#39' || C.RAGIONESOCIALE AS VARCHAR(60)' +
        ' )  AS RAGIONESOCIALE,'
      '      C.Telefono,'
      '      C.Cellulare,'
      '      P.Costruttore,'
      '      P.Modello,'
      '      P.DataInstallazione,'
      '      P.ComuneIMM,'
      '      P.CAPImm,'
      '      P.Abbonato,'
      '      P.TipoContratto,'
      '      P.ImportoContratto,'
      '      P.TipoImpianto,'
      '      P.Periodicita,'
      '      P.BreveDescrizioneCaldaia,'
      '      P.Matricola,'
      
        '      (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Intervento'#39' AND (I.TIPOINTERVENTO = '#39'C'#39' OR I.TIPOINTE' +
        'RVENTO = '#39'D'#39')) AS DataUltimaPulizia,'
      
        '      (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Intervento'#39' AND I.TIPOINTERVENTO = '#39'C'#39') AS DataUltima' +
        'ProvaCombustione,'
      
        '      (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Intervento'#39' AND (I.TIPOINTERVENTO = '#39'C'#39' OR I.TIPOINTE' +
        'RVENTO = '#39'D'#39')) + 365 AS ProssimoInterventoPrevisto,'
      
        '      (SELECT MIN(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PR' +
        'ATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA  AND I.TIPO' +
        'IMPEGNO = '#39'Appuntam.'#39' AND (I.TIPOINTERVENTO = '#39'C'#39' OR I.TIPOINTER' +
        'VENTO = '#39'D'#39')) AS DataOraProssimoAppuntamento,'
      '      P.RAGSOCUT,'
      '      P.CLIENTE'
      'FROM PRATICHE P'
      'LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE'
      '')
    object QTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QCODICE: TIntegerField
      FieldName = 'CODICE'
      Required = True
    end
    object QDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
      Required = True
    end
    object QRAGIONESOCIALE: TStringField
      FieldName = 'RAGIONESOCIALE'
      ReadOnly = True
      Size = 60
    end
    object QTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
    object QCELLULARE: TStringField
      FieldName = 'CELLULARE'
      Size = 30
    end
    object QCOSTRUTTORE: TStringField
      FieldName = 'COSTRUTTORE'
      Size = 45
    end
    object QMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 30
    end
    object QDATAINSTALLAZIONE: TDateTimeField
      FieldName = 'DATAINSTALLAZIONE'
    end
    object QCOMUNEIMM: TStringField
      FieldName = 'COMUNEIMM'
      Size = 25
    end
    object QCAPIMM: TStringField
      FieldName = 'CAPIMM'
      Size = 5
    end
    object QABBONATO: TStringField
      FieldName = 'ABBONATO'
      Size = 1
    end
    object QTIPOCONTRATTO: TStringField
      FieldName = 'TIPOCONTRATTO'
    end
    object QIMPORTOCONTRATTO: TIBOFloatField
      FieldName = 'IMPORTOCONTRATTO'
    end
    object QTIPOIMPIANTO: TStringField
      FieldName = 'TIPOIMPIANTO'
    end
    object QPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QBREVEDESCRIZIONECALDAIA: TStringField
      FieldName = 'BREVEDESCRIZIONECALDAIA'
      Size = 200
    end
    object QMATRICOLA: TStringField
      FieldName = 'MATRICOLA'
      Size = 30
    end
    object QDATAULTIMAPULIZIA: TDateTimeField
      FieldName = 'DATAULTIMAPULIZIA'
      ReadOnly = True
    end
    object QDATAULTIMAPROVACOMBUSTIONE: TDateTimeField
      FieldName = 'DATAULTIMAPROVACOMBUSTIONE'
      ReadOnly = True
    end
    object QPROSSIMOINTERVENTOPREVISTO: TDateTimeField
      FieldName = 'PROSSIMOINTERVENTOPREVISTO'
      ReadOnly = True
    end
    object QDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField
      FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
      ReadOnly = True
    end
    object QRAGSOCUT: TStringField
      FieldName = 'RAGSOCUT'
      Size = 60
    end
    object QSTATO: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATO'
      Calculated = True
    end
    object QCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
  end
end
