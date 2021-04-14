object AggiornaOpForm: TAggiornaOpForm
  Left = 353
  Top = 384
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = ' Conferma'
  ClientHeight = 584
  ClientWidth = 733
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape5: TShape
    Left = 16
    Top = 411
    Width = 700
    Height = 120
    Brush.Color = 16759739
  end
  object Label2: TLabel
    Left = 151
    Top = 545
    Width = 242
    Height = 16
    Caption = 'Confermi le modifiche apportate?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 98
    Top = 462
    Width = 137
    Height = 16
    Caption = 'Prossima visita entro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 247
    Top = 421
    Width = 1
    Height = 103
    Brush.Style = bsClear
    Pen.Color = clBlue
  end
  object Shape2: TShape
    Left = 247
    Top = 523
    Width = 8
    Height = 1
    Brush.Style = bsClear
    Pen.Color = clBlue
  end
  object Shape3: TShape
    Left = 247
    Top = 421
    Width = 8
    Height = 1
    Brush.Style = bsClear
    Pen.Color = clBlue
  end
  object Shape4: TShape
    Left = 240
    Top = 471
    Width = 8
    Height = 1
    Brush.Style = bsClear
    Pen.Color = clBlue
  end
  object Label3: TLabel
    Left = 370
    Top = 425
    Width = 257
    Height = 13
    Caption = '- Prima scadenza nelle Operazioni Pianificate'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 370
    Top = 443
    Width = 252
    Height = 13
    Caption = '- Come da periodicit'#224' nella scheda impianto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 370
    Top = 461
    Width = 140
    Height = 13
    Caption = '- Scadenza del contratto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 9
    AutoSize = False
    Caption = 'Conferma documento e aggiornamento scheda impianto'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taCenter
    Height = 27
    Width = 713
    AnchorX = 365
  end
  object GridOP: TcxGrid
    Left = 16
    Top = 43
    Width = 700
    Height = 369
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    RootLevelOptions.DetailFrameColor = clBlack
    RootLevelOptions.DetailFrameWidth = 1
    object btvOP: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = btvOPCustomDrawCell
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsView.NoDataToDisplayInfoText = 'Nessuna operazione pianificata effettuata!'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = 10066329
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.GroupRowStyle = grsOffice11
      OptionsView.RowSeparatorColor = 10066329
      OptionsView.BandHeaders = False
      OptionsView.FixedBandSeparatorColor = 10066329
      Styles.Content = DM1.tvContentGrayArial8
      Styles.StyleSheet = DM1.btvGCMaster
      OnCustomDrawGroupCell = btvOPCustomDrawGroupCell
      Bands = <
        item
          Caption = 'Operazioni pianificate'
        end
        item
          Caption = 'Era'
          Visible = False
        end
        item
          Caption = 'Diventa'
        end>
      object btvOPDAEFFETTUARE: TcxGridBandedColumn
        Caption = 'Da fare'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taLeftJustify
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvOPEFFETTUATA: TcxGridBandedColumn
        Caption = 'Fatto'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taLeftJustify
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvOPIDPRATICA: TcxGridBandedColumn
        Caption = 'ID pratica'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object btvOPIDOPPRATICA: TcxGridBandedColumn
        Caption = 'ID Op. pratica'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object btvOPIDAPPARECCHIOPRAT: TcxGridBandedColumn
        Caption = 'ID apparecchio'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = 'Tipo'
            HeaderAlignment = taCenter
            SortOrder = soAscending
            Width = 110
            FieldName = 'TIPOAPPARECCHIO'
          end
          item
            Caption = 'Apparecchio'
            HeaderAlignment = taCenter
            SortOrder = soAscending
            Width = 300
            FieldName = 'COMPUTED_APPARECCHIO_FULL'
          end
          item
            Caption = 'Costruito'
            HeaderAlignment = taCenter
            Width = 60
            FieldName = 'ANNOCOSTRUZIONE'
          end
          item
            Caption = 'Installato'
            HeaderAlignment = taCenter
            Width = 70
            FieldName = 'DATAINSTALLAZIONE'
          end
          item
            Caption = 'Collaudo'
            HeaderAlignment = taCenter
            Width = 70
            FieldName = 'DATACOLLAUDO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = SourcePratApp
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Width = 250
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object btvOPIDOP: TcxGridBandedColumn
        Caption = 'Codice'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 84
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object btvOPDESCRIZIONE: TcxGridBandedColumn
        Caption = 'Descrizione'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 302
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object btvOPMINUTIPREVISTI: TcxGridBandedColumn
        Caption = 'Minuti'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object btvOPULTIMA: TcxGridBandedColumn
        Caption = 'Ultima eff.'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ShowTime = False
        OnGetDisplayText = btvOPULTIMAGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 65
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvOPPROSSIMA: TcxGridBandedColumn
        Caption = 'Scadenza'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ShowTime = False
        OnGetDisplayText = btvOPULTIMAGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 65
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvOPNEXT_ULTIMA: TcxGridBandedColumn
        Caption = 'Attuale'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ShowTime = False
        OnGetDisplayText = btvOPULTIMAGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvOPPERIODICITA: TcxGridBandedColumn
        Caption = 'Period.'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDisplayText = btvOPPERIODICITAGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvOPNEXT_PROSSIMA: TcxGridBandedColumn
        Caption = 'Prox.scadenza'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ShowTime = False
        OnGetDisplayText = btvOPULTIMAGetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.FilteringPopup = False
        Styles.Content = DM1.tvContent
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object btvOPTIPOAPPARECCHIO: TcxGridBandedColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'TIPOAPPARECCHIO'
          end>
        Properties.ListSource = SourcePratApp
        Visible = False
        VisibleForCustomization = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object btvOPCOSTRUTTORE: TcxGridBandedColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'COSTRUTTORE'
          end>
        Properties.ListSource = SourcePratApp
        Visible = False
        VisibleForCustomization = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object btvOPMODELLO: TcxGridBandedColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'MODELLO'
          end>
        Properties.ListSource = SourcePratApp
        Visible = False
        VisibleForCustomization = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object btvOPMATRICOLA: TcxGridBandedColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'MATRICOLA'
          end>
        Properties.ListSource = SourcePratApp
        Visible = False
        VisibleForCustomization = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object btvOPUBICAZIONE: TcxGridBandedColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'UBICAZIONE'
          end>
        Properties.ListSource = SourcePratApp
        Visible = False
        VisibleForCustomization = False
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
    end
    object lvOP: TcxGridLevel
      GridView = btvOP
    end
  end
  object dbeProxVisita: TcxDateEdit
    Left = 359
    Top = 481
    AutoSize = False
    EditValue = 0d
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.DateButtons = []
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.PostPopupValueOnTab = True
    Properties.ShowTime = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.OnChange = dbeProxVisitaPropertiesChange
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    TabOrder = 2
    Height = 23
    Width = 132
  end
  object BtnSI: TBitBtn
    Left = 402
    Top = 539
    Width = 100
    Height = 30
    Caption = 'SI'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BtnSIClick
  end
  object BtnAnnulla: TBitBtn
    Left = 616
    Top = 539
    Width = 100
    Height = 30
    Caption = 'Annulla'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = BtnAnnullaClick
  end
  object BtnNO: TBitBtn
    Left = 509
    Top = 539
    Width = 100
    Height = 30
    Cancel = True
    Caption = '&No'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 5
    OnClick = BtnNOClick
  end
  object rbProxVisita_OP: TcxRadioButton
    Left = 256
    Top = 424
    Width = 109
    Height = 17
    Caption = '- - -'
    Font.Charset = ANSI_CHARSET
    Font.Color = 196
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = rbProxVisita_AltroClick
    LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object rbProxVisita_Impianto: TcxRadioButton
    Left = 256
    Top = 442
    Width = 109
    Height = 17
    Caption = '- - -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = rbProxVisita_AltroClick
    LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object rbProxVisita_Contratto: TcxRadioButton
    Left = 256
    Top = 460
    Width = 109
    Height = 17
    Caption = '- - -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = rbProxVisita_AltroClick
    LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object rbProxVisita_Altro: TcxRadioButton
    Left = 256
    Top = 483
    Width = 102
    Height = 17
    Caption = 'Altra data:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = rbProxVisita_AltroClick
    LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object rbProxVisita_NonAggiornare: TcxRadioButton
    Left = 256
    Top = 507
    Width = 449
    Height = 17
    Caption = 'Non aggiornare la data della prox. visita'
    Font.Charset = ANSI_CHARSET
    Font.Color = 196
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = rbProxVisita_AltroClick
    LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object cxButton1: TcxButton
    Left = 522
    Top = 459
    Width = 65
    Height = 18
    Cursor = crHandPoint
    Caption = 'Rinnova'
    Colors.Normal = 16753828
    Colors.Hot = 16753828
    TabOrder = 11
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = cxButton1Click
  end
  object cbTutteLeOP: TcxCheckBox
    Left = 17
    Top = 410
    Caption = 'Tutte le Operazioni Pianificate'
    ParentFont = False
    Properties.OnChange = cbTutteLeOPPropertiesChange
    Style.BorderColor = clBlue
    Style.BorderStyle = ebsUltraFlat
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.TextColor = clBlue
    Style.IsFontAssigned = True
    TabOrder = 12
    Transparent = True
  end
  object SourcePratApp: TDataSource
    AutoEdit = False
    DataSet = ImpegnoForm.QryPratApp
    Left = 46
    Top = 125
  end
end
