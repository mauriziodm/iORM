inherited TabImpiantiForm: TTabImpiantiForm
  Left = 624
  Top = 142
  Caption = 'TabImpiantiForm'
  ClientHeight = 647
  ClientWidth = 736
  Color = clWhite
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 736
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlAssistenze: TcxPageControl
    Left = 0
    Top = 0
    Width = 685
    Height = 590
    Cursor = crHandPoint
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = TabAssElenco
    Properties.CustomButtons.Buttons = <>
    Properties.NavigatorPosition = npLeftBottom
    Properties.Style = 9
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OnChange = PageControlAssistenzeChange
    ClientRectBottom = 590
    ClientRectRight = 685
    ClientRectTop = 21
    object TabAssElenco: TcxTabSheet
      Caption = '   Elenco   '
      ImageIndex = 0
      object PanelAssistenze: TPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 569
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          685
          569)
        object GridAssistenze: TcxGrid
          Left = 0
          Top = 53
          Width = 685
          Height = 347
          Align = alClient
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          PopupMenu = MenuElencoClienti
          TabOrder = 1
          LevelTabs.Style = 10
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelOptions.DetailFrameColor = clBlack
          RootLevelOptions.DetailFrameWidth = 1
          object btvAssistenze: TcxGridDBBandedTableView
            DragMode = dmAutomatic
            OnDblClick = btvAssistenzeDblClick
            OnMouseDown = btvAssistenzeMouseDown
            OnMouseMove = btvAssistenzeMouseMove
            Navigator.Buttons.CustomButtons = <>
            FilterBox.Visible = fvNever
            OnCustomDrawCell = btvAssistenzeCustomDrawCell
            OnCustomDrawPartBackground = btvAssistenzeCustomDrawPartBackground
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataSource = SourceAss
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skCount
                Position = spFooter
                OnGetText = btvAssistenzeTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText
                FieldName = 'TIPOIMPIANTO'
                Column = btvAssistenzeTIPOIMPIANTO
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'TIPOIMPIANTO'
                Column = btvAssistenzeTIPOIMPIANTO
              end>
            DataController.Summary.SummaryGroups = <>
            DataController.Summary.OnAfterSummary = btvAssistenzeDataControllerSummaryAfterSummary
            DataController.OnDetailCollapsed = btvAssistenzeDataControllerDetailCollapsed
            DataController.OnDetailExpanding = btvAssistenzeDataControllerDetailExpanding
            DateTimeHandling.Grouping = dtgByMonth
            FilterRow.InfoText = 'Clicca qui per definire un filtro di ricerca'
            FilterRow.SeparatorColor = 16037544
            FilterRow.ApplyChanges = fracImmediately
            OptionsBehavior.CellHints = True
            OptionsBehavior.ColumnHeaderHints = False
            OptionsBehavior.ExpandMasterRowOnDblClick = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.BandsQuickCustomization = True
            OptionsData.DeletingConfirmation = False
            OptionsSelection.CellSelect = False
            OptionsView.FocusRect = False
            OptionsView.GridLineColor = 13882323
            OptionsView.GridLines = glNone
            OptionsView.GroupRowStyle = grsOffice11
            OptionsView.RowSeparatorColor = clBlack
            OptionsView.FixedBandSeparatorColor = clBlack
            Styles.ContentEven = DM1.PrintContentEven
            Styles.ContentOdd = DM1.PrintContentOdd
            Styles.FilterBox = DM1.tvGroupByBox
            Styles.FilterRowInfoText = DM1.tvGroupByBox
            Styles.Footer = DM1.tvContent
            Styles.GroupSummary = DM1.tvContent
            Styles.StyleSheet = DM1.btvGCMaster
            OnCustomDrawGroupCell = btvAssistenzeCustomDrawGroupCell
            Bands = <
              item
                Caption = 'Stato'
                Options.HoldOwnColumnsOnly = True
                Options.Sizing = False
                Styles.Content = DM1.tvDisContent
              end
              item
                Caption = 'Impianto'
                Options.HoldOwnColumnsOnly = True
                Width = 250
              end
              item
                Caption = 'Ubicazione'
                Options.HoldOwnColumnsOnly = True
                Width = 292
              end
              item
                Caption = 'Visite / Appuntamento'
                Options.HoldOwnColumnsOnly = True
                Options.Sizing = False
                Styles.Content = DM1.tvDisContent
                Width = 165
              end
              item
                Caption = 'Contratto / Abbonamento'
                Options.HoldOwnColumnsOnly = True
                Options.Sizing = False
                Width = 218
              end
              item
                Caption = 'Responsabile'
                Options.HoldOwnColumnsOnly = True
                Width = 260
              end
              item
                Caption = 'Proprietario'
                Options.HoldOwnColumnsOnly = True
                Visible = False
                Width = 150
              end
              item
                Caption = 'Utente / Occupante'
                Options.HoldOwnColumnsOnly = True
                Visible = False
                Width = 150
              end
              item
                Caption = 'Amministratore'
                Options.HoldOwnColumnsOnly = True
                Visible = False
                Width = 150
              end
              item
                Caption = 'Highlights'
                Styles.Content = DM1.tvDisContent
                Visible = False
                Width = 300
              end
              item
                Caption = 'Altro'
                Options.HoldOwnColumnsOnly = True
                Visible = False
                VisibleForCustomization = False
                Width = 180
              end>
            object btvAssistenzeICON_URGENTE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'EXIST_URGENTI'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 0
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000000E87FEFF53A2
                F3FF4B9CECFF4B9CEDFF4B9CEDFF4B9CEDFF4B9CEDFF4B9CEDFF4B9CEDFF4B9C
                EDFF4B9CEDFF4B9CEDFF4B9CEDFF4B9CEDFF53A2F3FF0E87FEFF52A2F2FF2587
                CBFF018EDDFF0190DEFF0192DFFF0193DFFF0193E0FF0193E0FF0193E0FF0193
                DFFF0193DFFF0192DFFF0190DEFF028EDCFF2B89CBFF53A2F3FF529EE7FF0190
                DFFF00A2F5FF00A7F7FF00A9F8FF00ABF9FF00ABFAFF00ABFAFF00ABFAFF00AB
                FAFF00ABF9FF00A9F8FF00A7F7FF00A2F5FF028DDAFF58A2EAFF50A0F1FF1387
                CFFF00A5F5FF00A9F8FF00ADFAFF00AFFBFF00ACF8FF006DADFF0064A4FF00AA
                F5FF00AFFBFF00ADFAFF00A9F8FF00A5F5FF1987CEFF52A2F2FF49A0F8FF4B93
                D0FF0A9FECFF13AEFAFF12B1FCFF0DB3FDFF0596DCFF003870FF003870FF0098
                DFFF00B1FDFF00AEFBFF00AAF9FF0199E8FF5297D4FF3A99FAFF0080FFFF5EA5
                EEFF218CD1FF28B1FAFF2BB6FCFF2FB9FEFF32B9FDFF2083C2FF1687C7FF01B3
                FEFF00B1FDFF00AEFBFF00A9F8FF1988CEFF52A2F2FF0080FFFF0080FFFF3A99
                F9FF4C93D1FF29A7EFFF34B6FCFF37B9FDFF3BBBFEFF2A91D1FF2E92D0FF3BBB
                FEFF0CB2FCFF00ABFAFF019BE9FF5397D4FF3A99FAFF0080FFFF0080FFFF0080
                FFFF5EA5EEFF288ED1FF3CB6FBFF40B9FDFF44BBFEFF2076B2FF267BB7FF4FBD
                FEFF4DBBFDFF0DABF8FF1A88CEFF5FA8EFFF0080FFFF0080FFFF0080FFFF0080
                FFFF3A99F9FF4C93D1FF3AABEFFF49BAFCFF4CBCFEFF135A94FF19609AFF58BE
                FEFF5BBDFDFF37A7EBFF5397D4FF3A99FAFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF5EA5EEFF3090D2FF51BAFCFF53BAFBFF043F77FF07437BFF5EBD
                FCFF63BDFDFF3790D0FF5FA8EFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF3A99F9FF4D94D1FF4BAEF1FF4BA4E2FF003870FF003870FF56A9
                E7FF54AEEDFF5497D4FF2B93FBFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF5EA5EEFF3791D2FF4696D4FF003870FF003870FF529C
                D8FF3A90D1FF52A2F2FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF2B93FBFF4D94D1FF54A9E8FF2869A3FF3071AAFF59AC
                EAFF5497D4FF2B93FBFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0E87FEFF5EA5EEFF3D93D3FF74C0FDFF77C1FEFF3D90
                D1FF52A2F2FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF2B93FBFF5498D4FF499EDEFF479CDCFF599C
                D7FF2B93FBFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF479FF7FF64A5E6FF64A7E8FF3999
                F8FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF}
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              VisibleForCustomization = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
              IsCaptionAssigned = True
            end
            object btvAssistenzeICON_PRESCRIZIONE: TcxGridDBBandedColumn
              Tag = 2
              DataBinding.FieldName = 'EXIST_PRESCRIZIONI'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 2
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000000B85FEFF3799
                FBFF3D99F6FF3793F3FF3793F3FF3793F3FF3793F3FF3793F3FF3793F3FF3793
                F3FF3793F3FF3793F3FF3793F3FF3B98F5FF429EFAFF0B85FEFF3799FBFF2B76
                D3FF004AC2FF004AC5FF014BC5FF014BC5FF004AC5FF004AC5FF004AC5FF004A
                C5FF004AC5FF004AC5FF004AC5FF004AC2FF226DCDFF429EFAFF3D99F6FF004A
                C4FF004ACEFF1660D5FF448EEAFF448EEAFF448EEAFF0F59D2FF004ACEFF004A
                CEFF004ACEFF004ACEFF004ACEFF004ACEFF004AC4FF3B97F5FF3793F3FF004A
                C9FF004AD1FF256FDDFF6BB5FFFF6BB5FFFF6BB5FFFF1964D7FF004AD1FF004A
                D1FF004AD1FF004AD1FF004AD1FF004AD1FF004AC9FF3793F3FF3793F3FF004A
                CCFF004AD3FF256FDEFF6BB5FFFF6BB5FFFF6BB5FFFF1964DAFF004AD3FF004A
                D3FF004AD3FF004AD3FF004AD3FF004AD3FF004ACCFF3793F3FF3793F4FF004A
                CFFF004AD6FF2570E0FF6BB5FFFF6BB5FFFF6BB5FFFF1964DBFF004AD6FF004A
                D6FF004AD6FF004AD6FF004AD6FF004AD6FF004ACFFF3793F4FF3793F4FF004A
                D3FF004ADAFF2570E2FF6BB5FFFF6BB5FFFF6BB5FFFF438DEBFF3680E7FF347F
                E7FF2772E2FF0A54D9FF004ADAFF004ADAFF004AD3FF3793F4FF3793F5FF014B
                D6FF054FDFFF2872E5FF6BB5FFFF6BB5FFFF6BB5FFFF6BB5FFFF6BB5FFFF6BB5
                FFFF6BB5FFFF64AEFBFF206BE2FF0550DFFF014BD6FF3793F5FF3793F5FF0A54
                DCFF1A64E8FF3781ECFF6BB5FFFF6BB5FFFF6BB5FFFF62ACFAFF61ABFAFF6AB4
                FEFF6BB5FFFF6BB5FFFF62ACFBFF1E69E6FF0A54DCFF3793F5FF3793F5FF0C57
                E0FF206BECFF3A84EFFF6BB5FFFF6BB5FFFF6BB5FFFF347FECFF236DEAFF408A
                EFFF6BB5FFFF6BB5FFFF6BB5FFFF317BECFF0C57E0FF3793F5FF3793F5FF0E59
                E3FF2772F0FF3F89F1FF6BB5FFFF6BB5FFFF6BB5FFFF3882EFFF2873EFFF3F89
                F0FF6BB5FFFF6BB5FFFF6BB5FFFF3781F0FF0F59E3FF3793F5FF3793F5FF115B
                E6FF2E78F3FF438DF4FF6BB5FFFF6BB5FFFF6BB5FFFF5FA9FAFF5DA7FAFF69B3
                FEFF6BB5FFFF6BB5FFFF68B2FEFF337DF1FF125CE6FF3793F5FF3793F6FF135E
                E9FF337EF6FF4690F5FF6BB5FFFF6BB5FFFF6BB5FFFF6BB5FFFF6BB5FFFF6BB5
                FFFF6BB5FFFF6AB4FEFF4D97F6FF347EF5FF155FE9FF3793F6FF3D99F8FF0B55
                E6FF3781F8FF428CF7FF58A2FAFF58A2FAFF58A2FAFF58A2FAFF58A2FAFF57A1
                FAFF529CF8FF448EF6FF3983F8FF3781F8FF0A55E6FF3B97F8FF3799FBFF2B76
                E6FF0C57E7FF1661ECFF1661ECFF1661ECFF1661ECFF1661ECFF1661ECFF1661
                ECFF1661ECFF1661ECFF1661ECFF0B55E7FF226DE3FF3799FBFF0B85FEFF3799
                FBFF3D99F8FF3793F6FF3793F6FF3793F6FF3793F6FF3793F6FF3793F6FF3793
                F6FF3793F6FF3793F6FF3793F6FF3B98F8FF3799FBFF0B85FEFF}
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              VisibleForCustomization = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 1
              IsCaptionAssigned = True
            end
            object btvAssistenzeICON_CHIAMATA: TcxGridDBBandedColumn
              Tag = 1
              DataBinding.FieldName = 'EXIST_CHIAMATE'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 1
                  Value = 'T'
                end
                item
                  ImageIndex = 5
                  Value = 'A'
                end>
              Properties.ShowDescriptions = False
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000000080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF188AFDFF3798F8FF3096
                DFFF2090CFFF208FCFFF3496E3FF3196FBFF0884FEFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF2993FBFF3798E6FF0A89B9FF0087
                AFFF0087AFFF0087AFFF0187B0FF2E93DDFF218FFCFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF2993FBFF2E93DDFF0287B1FF0087AFFF0087
                AFFF0087AFFF0087AFFF0087AFFF1688C5FF2993FBFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF188BFDFF3496E3FF0187B0FF0087AFFF0087AFFF0087
                AFFF0087AFFF0087AFFF0886B7FF3193F2FF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0884FEFF3D9AF5FF0788B6FF0087AFFF0187B0FF2A8DD9FF298D
                D8FF0386B2FF0787B6FF3796EEFF0884FEFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF2993FBFF208FCFFF0087AFFF0087AFFF258CD4FF1087FEFF0884
                FEFF1587FAFF1689FAFF0884FEFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0884FEFF3496F5FF0487B3FF0087AFFF1187C0FF208EFBFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF218EFCFF2590D4FF0087AFFF0187B0FF2890F2FF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF3095FAFF0A88B9FF0087AFFF178AC6FF188AFDFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0884
                FEFF3496ECFF0087AFFF0087AFFF3092DFFF0884FEFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF218F
                FCFF2A92D9FF0087AFFF0087AFFF168BC5FF2590F8FF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF3196
                FBFF228ED1FF0087AFFF0087AFFF0087AFFF0E88BDFF188AFCFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF3196
                FBFF228ED1FF0087AFFF0087AFFF0087AFFF0387B2FF1689FBFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF218F
                FCFF2E93DDFF0087AFFF0087AFFF0087AFFF0387B2FF1789FBFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0884
                FEFF3898F8FF178CC6FF0087AFFF0087AFFF0986B8FF188AFCFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0884FEFF3898F8FF2B93DAFF168DC5FF3396E2FF1087FEFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF}
              HeaderGlyphAlignmentHorz = taRightJustify
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
              IsCaptionAssigned = True
            end
            object btvAssistenzeICON_ALLEGATO: TcxGridDBBandedColumn
              Tag = 3
              DataBinding.FieldName = 'EXIST_ALLEGATITOSEND'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 3
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000001288FEFF1F8D
                F9FF1184F8FF1084F7FF1084F7FF1084F7FF1084F7FF1084F7FF1084F7FF1084
                F7FF1084F7FF1084F7FF1084F7FF1084F7FF2D90F1FF168AFEFF2893FBFF2B76
                C0FF4D97E1FF569CE1FF569BE1FF559BE1FF559BE1FF559BE1FF559BE1FF559B
                E1FF559BE1FF569BE1FF569BE1FF4C96E0FF256AB0FF3596F7FF2893FBFF2279
                CFFF83BBF2FF86BEF5FF87BFF7FF88C0F7FF88C0F8FF88C0F8FF88C0F8FF88C0
                F8FF88C0F7FF87BFF7FF86BEF6FF83BBF3FF266CB2FF3496F7FF2893FBFF1E7B
                D6FF84BBF3FF70A8E0FF5D95CDFF5F97CFFF639BD3FF659DD5FF659DD5FF649C
                D4FF6199D0FF5E96CEFF73ABE3FF84BCF3FF296FB4FF3496F7FF2893FBFF1F7B
                D7FF83BBF2FF4F87BFFF5D95CDFF73ABE2FF75ACE3FF76AEE5FF76AEE6FF75AD
                E4FF73ABE3FF5B93CBFF568DC5FF84BBF3FF2970B5FF3496F7FF2893FBFF1E7B
                D6FF83BAF2FF4981B9FF71A9E0FF88BFF6FF7CB4ECFF6FA6DEFF6FA6DEFF7FB6
                EDFF88BFF7FF6DA5DDFF4F87BFFF83BAF2FF296FB4FF3496F7FF1F8EFCFF1F7C
                D7FF83B9F0FF69A0D7FF7CB3EAFF88BDF5FF6197CFFF255E95FF255E95FF689F
                D6FF88BDF5FF7BB1E9FF6DA4DAFF83BAF1FF296FB4FF3496F7FF1C8CFCFF1F7C
                D7FF83B9F0FF88BDF4FF88BDF5FF88BDF5FF5C93CAFF195189FF195289FF649B
                D1FF86BCF3FF86BCF2FF85BBF2FF83B9EFFF2970B5FF3496F7FF1C8CFCFF207C
                D8FF84BAF0FF88BDF5FF88BDF5FF88BDF4FF6197CEFF175087FF104980FF6197
                CEFF86BBF1FF85BBF1FF85BBF1FF83B8EFFF2A70B6FF3496F7FF1C8CFCFF207D
                D8FF85BAF1FF89BFF5FF85BAF1FF72A8DFFF538AC2FF2B649BFF175087FF467C
                B2FF689CD3FF82B7ECFF86BAF0FF83B7EDFF2A70B6FF3496F7FF1C8CFCFF207D
                D8FF85BAF0FF8ABFF5FF8ABFF5FF669DD4FF3D76ADFF356DA5FF2B649BFF1951
                89FF5B8FC5FF86B9EFFF86BAEFFF85B8EDFF2B71B6FF1E8CFAFF1C8CFCFF207D
                D8FF85BAF0FF8AC0F5FF8AC0F5FF89BEF4FF649AD1FF3D75ADFF346DA4FF5B90
                C6FF85B8ECFF86B9EDFF85B8ECFF83B7EBFF2B71B6FF2590FAFF1C8CFCFF217D
                D9FF85BAF0FF8BC0F5FF8BC0F5FF8ABFF5FF88BDF2FF5F96CDFF5E94CBFF87B9
                EFFF85B7EBFF4490DCFF177FE6FF287FD4FF3976B2FF3496F8FF1C8CFCFF1D7F
                DEFF85B9EFFF8BC0F5FF8BC0F5FF8ABEF4FF8ABDF2FF88BBEFFF88BAEFFF88B9
                EDFF70A7E0FF147FE8FF1788F9FF1084F6FF238AEEFF148AFEFF1C8CFCFF147F
                E9FF6DA5DFFF7AAEE4FF7BB0E6FF7BAFE5FF7AAEE3FF7AAEE3FF79ABE1FF78A9
                DEFF2E8CEAFF1681EBFF1D83E8FF1F7EDDFF1488FCFF168AFEFF148AFEFF1D8C
                FAFF1F89F2FF288BEFFF288BEEFF2D8CECFF1786F5FF1987F5FF1987F5FF1987
                F5FF1284F8FF1C8AF8FF1986F3FF1C8CFCFF1389FEFF178AFEFF}
              HeaderGlyphAlignmentHorz = taRightJustify
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 1
              IsCaptionAssigned = True
            end
            object btvAssistenzeICON_CORRISPNOPAG: TcxGridDBBandedColumn
              DataBinding.FieldName = 'EXIST_RIFDOC_CORRISPNOPAG'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 9
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000000080FFFF018D
                FEFF048CC5FF0186F9FF0080FFFF018DFDFF048EC9FF0491D6FF0080FFFF0491
                D6FF0495D7FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF018D
                FDFF047CA4FF028CE9FF0085FFFF0491D0FF047AA1FF0485B8FF0080FFFF0485
                B8FF0489C0FF0189FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF018D
                FDFF047CA4FF0493DBFF0396F4FF047DA6FF047BA1FF0485B8FF0080FFFF0485
                B8FF0487BCFF0398F8FF018CFCFF018DFEFF0080FFFF0080FFFF0080FFFF018D
                FDFF047CA4FF0394D5FF0487BBFF0480ADFF0486B9FF0485B8FF0080FFFF0485
                B8FF047BA3FF047EB2FF047FA9FF0485B8FF0397F6FF0080FFFF0080FFFF018D
                FDFF047CA4FF0484B4FF047BA3FF0394E8FF0489C0FF0485B8FF0080FFFF0485
                B8FF0485C1FF0080FFFF0080FFFF0380BEFF048BC3FF018EFFFF0080FFFF018D
                FDFF047CA4FF047AA1FF0488C7FF0085FFFF0489C0FF0485B8FF0080FFFF0485
                B8FF0387CDFF0080FFFF0080FFFF0383C5FF0487BBFF018EFFFF0080FFFF018D
                FDFF047CA4FF047EA9FF0084FEFF0080FFFF0489C0FF0485B8FF0080FFFF0485
                B8FF047DA6FF0482B1FF0480ACFF047BA3FF0494DFFF0080FFFF0080FFFF0085
                FFFF028DECFF0187FAFF0080FFFF0080FFFF0186FAFF0186F9FF0080FFFF0189
                F5FF038FE6FF038FE6FF038FE8FF018AF9FF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0188FDFF0189F5FF0189F5FF0188
                FDFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0391EAFF047EA9FF047FAAFF047EA9FF047E
                A9FF0290F1FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF018CFCFF047EA7FF048DD0FF018DFDFF0291FBFF0484
                B5FF0485B6FF0085FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0392ECFF047BA1FF028FF7FF0080FFFF0080FFFF0188
                FCFF0188FCFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0391EBFF047BA3FF018CFBFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF028FF8FF047CA4FF028BF0FF0080FFFF0080FFFF028C
                E9FF028CE9FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0189FFFF048DC8FF047EA7FF0389D2FF0388CFFF047C
                A4FF0492D0FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080
                FFFF0080FFFF0080FFFF0080FFFF018DFEFF0495E2FF048BC2FF048BC2FF0495
                E2FF0189FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF}
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              VisibleForCustomization = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
              IsCaptionAssigned = True
            end
            object btvAssistenzeICON_SCADSOFF: TcxGridDBBandedColumn
              DataBinding.FieldName = 'EXIST_SCADSOFF'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 7
                  Value = 'T'
                end>
              OnGetCellHint = btvAssistenzeICON_SCADSOFFGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderGlyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000000000000000000000000000000000000082FF004FFF
                0082FF0082FF0B87FE1D83E6156DC10C5BA80D5CA9156EC11E85E80A86FF0082
                FF0082FF004CFF004CFF004CFF004EFF0056FF1A80E9045098034C94034C9403
                4C94034C94034C94034C9404519A1A81EC0056FF004EFF004CFF0082FF0056FF
                004CFF0049D700499C024B91034C94135CA21D67AD1B64AB09539A0049A10049
                E7004CFF0056FF0082FF0082FF1981EB0049D60049F60049DD1059DA6EB8FF6E
                B8FF6EB8FF6EB8FF62ABFF0049EE0049FF004AE61882EF0082FF0785FF004C96
                0049980049DB0750FF6CB6FF4C95FF367FC5216BB2226CC6024CFF0049FF0049
                EA00499D014F9A0584FF1B85EA0049910049910953A76EB8FF0B55FF0049E700
                49910049910049E70049FF0049E900499B0049910049911B87EE1470C8004991
                2B74BB5DA6EC6EB8FF2F78FE0049EF0049C90049CB0049FF0049E400499A0049
                910049910049911775D00B60B10049912973BA6EB8FF6EB8FF6EB8FF6EB7FF65
                AEFF5DA7FF61ABFF2973C00049910049910049910049910F66B90B60B1004991
                2D77BE357FC56EB8FF539DEA0049D30049FF0049FA0049C90049930049910049
                910049910049910F66B91672CA0049912973B969B3F96EB8FF6BB5FF5CA6FF6E
                B8FF6EB8FF65AEFF3881F00049930049910049910049911876D11C87EC004991
                0049911C65B96EB8FF438CFF0049CE0049960049960049C20049F20049D60049
                9A0049910049911B87F10785FF06549E024C9F0049DE064FFF6EB8FF6BB5FF37
                80C8246DB4266FBD135CFC0049F30049DB024C9F0957A30484FF0082FF1A83EF
                0049DE0049F80049E02F78CD6EB8FF6EB8FF6EB8FF6EB8FF69B3FF0049E90049
                EF004ADB1984F30082FF0082FF0056FF004AFF004ADF0953A60C569D0D579E1D
                67AD2973B9256FB4135CA20953A6004ADD004AFF0056FF0082FF004FFF004AFF
                0056FF1D84EE125EA60F59A00F59A00F59A00F59A00F59A00F59A0125EA81B85
                F10056FF004EFF004CFF004CFF004FFF0082FF0082FF0A86FF2088ED1E77CC19
                6AB9196BB91E79CF2089EE0886FF0082FF0082FF004FFF004FFF}
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Options.VertSizing = False
              VisibleForCustomization = False
              Width = 22
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 1
              IsCaptionAssigned = True
            end
            object btvAssistenzeTIPOIMPIANTO: TcxGridDBBandedColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'TIPOIMPIANTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taBottomJustify
              BestFitMaxWidth = 80
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 85
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 85
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 1
            end
            object btvAssistenzeCOMPUTED_STATO: TcxGridDBBandedColumn
              Caption = 'Stato'
              DataBinding.FieldName = 'COMPUTED_STATO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 85
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              VisibleForCustomization = False
              Width = 85
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvAssistenzeCODICE: TcxGridDBBandedColumn
              Caption = 'Codice'
              DataBinding.FieldName = 'CODICE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 45
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 45
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeDATAAPERTURA: TcxGridDBBandedColumn
              Caption = 'Data apert.'
              DataBinding.FieldName = 'DATAAPERTURA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 65
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 65
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvAssistenzeDESCRIZIONE: TcxGridDBBandedColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 200
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvAssistenzeCODICECATASTO: TcxGridDBBandedColumn
              Caption = 'Codice catasto'
              DataBinding.FieldName = 'CODICECATASTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              BestFitMaxWidth = 85
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 85
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 85
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvAssistenzeNOTE: TcxGridDBBandedColumn
              Caption = 'Note'
              DataBinding.FieldName = 'COMPUTED_NOTE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 200
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeNOTEPRIVATEEXISTS: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NOTEPRIVATEEXISTS'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.Alignment = taCenter
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Visible = False
              BestFitMaxWidth = 20
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 20
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeSTR_CERTIFIED_IMM: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STR_CERTIFIED_IMM'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 6
                  Value = 'T'
                end>
              Properties.PopupAlignment = taCenter
              BestFitMaxWidth = 24
              HeaderAlignmentHorz = taCenter
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000000000000000000000000000000000000082FFFF0082
                FFFF0082FFFF0082FFFF0082FFFF0082FFFF319AFFFF0051A5FF2996FFFF0082
                FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF0082FFFF0082FFFF108EFFFF186DBDFF0051A5FF186DBDFF0082
                FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF0082FFFF0082FFFF319AFFFF0055ADFF0086A5FF0055ADFF319A
                FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF0082FFFF2996FFFF0865B5FF0079A5FF00A2A5FF007DA5FF0865
                B5FF108EFFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF0886FFFF2986E7FF0051A5FF009AA5FF00A6A5FF009EA5FF0051
                A5FF2986E7FF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF2996FFFF085DADFF007DA5FF00A6A5FF00A6A5FF00A6A5FF007D
                A5FF085DADFF2996FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF1892FFFF1875C6FF0071A5FF009EA5FF00A6A5FF00A6A5FF00A6A5FF009E
                A5FF0071A5FF1875C6FF108EFFFF0082FFFF0082FFFF0082FFFF0082FFFF0886
                FFFF298EE7FF0051A5FF009AA5FF00A6A5FF00A6A5FF00A6A5FF00A6A5FF00A6
                A5FF009AA5FF0051A5FF298EE7FF0082FFFF0082FFFF0082FFFF0082FFFF1892
                FFFF1069BDFF0075A5FF00A6A5FF00A6A5FF008EA5FF007DA5FF008EA5FF00A6
                A5FF00A6A5FF0079A5FF1069BDFF1892FFFF0082FFFF0082FFFF0082FFFF1892
                FFFF0065ADFF009EA5FF00A6A5FF009EA5FF0061A5FF0051A5FF0061A5FF009E
                A5FF00A6A5FF009EA5FF0065ADFF1892FFFF0082FFFF0082FFFF0082FFFF1892
                FFFF0065ADFF009EA5FF00A6A5FF009EA5FF0055A5FF0051A5FF0055A5FF009E
                A5FF00A6A5FF009EA5FF0065ADFF1892FFFF0082FFFF0082FFFF0082FFFF1892
                FFFF0865ADFF0096A5FF00A6A5FF00A6A5FF006DA5FF0065A5FF006DA5FF00A6
                A5FF00A6A5FF0096A5FF0065ADFF1892FFFF0082FFFF0082FFFF0082FFFF108E
                FFFF297DD6FF007DA5FF00A2A5FF00A6A5FF00A2A5FF009AA5FF00A2A5FF00A6
                A5FF00A2A5FF007DA5FF297DCEFF0886FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF2996FFFF086DB5FF008EA5FF009EA5FF00A6A5FF00A6A5FF00A6A5FF009E
                A5FF008EA5FF086DB5FF2996FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF39A2FFFF0069ADFF0082ADFF009AA5FF009AA5FF009AA5FF0086
                ADFF0065ADFF319AFFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082
                FFFF0082FFFF0082FFFF39A2FFFF106DBDFF005DADFF005DA5FF005DADFF1069
                BDFF39A2FFFF0082FFFF0082FFFF0082FFFF0082FFFF0082FFFF}
              HeaderGlyphAlignmentHorz = taCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 20
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.RowIndex = 1
              IsCaptionAssigned = True
            end
            object btvAssistenzeCOMUNEIMM: TcxGridDBBandedColumn
              Caption = 'Comune'
              DataBinding.FieldName = 'COMUNEIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 154
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeZONAIMM: TcxGridDBBandedColumn
              Caption = 'Zona'
              DataBinding.FieldName = 'ZONAIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 91
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 91
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvAssistenzeINDIRIZZOIMM: TcxGridDBBandedColumn
              Caption = 'Indirizzo'
              DataBinding.FieldName = 'INDIRIZZOIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 200
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzePROVINCIAIMM: TcxGridDBBandedColumn
              Caption = 'Prov'
              DataBinding.FieldName = 'PROVINCIAIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              BestFitMaxWidth = 28
              HeaderAlignmentVert = vaCenter
              MinWidth = 28
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 28
              Position.BandIndex = 2
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvAssistenzeCAPIMM: TcxGridDBBandedColumn
              Caption = 'Cap'
              DataBinding.FieldName = 'CAPIMM'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              BestFitMaxWidth = 50
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 50
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 50
              Position.BandIndex = 2
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvAssistenzeDATAULTIMOINTERVENTO: TcxGridDBBandedColumn
              Caption = 'Ultima'
              DataBinding.FieldName = 'DATAULTIMOINTERVENTO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ShowTime = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 60
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 60
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzePERIODICITA: TcxGridDBBandedColumn
              Caption = 'Per.'
              DataBinding.FieldName = 'PERIODICITA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 30
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 30
              Position.BandIndex = 3
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvAssistenzePROXVISITAENTRO: TcxGridDBBandedColumn
              Caption = 'Prox. entro'
              DataBinding.FieldName = 'PROXVISITAENTRO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 76
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 76
              Position.BandIndex = 3
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBBandedColumn
              Caption = 'Appuntamento'
              DataBinding.FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              OnGetDataText = btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTOGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Width = 130
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeCOMPUTED_CONTRATTO_SCADUTO: TcxGridDBBandedColumn
              Tag = 4
              Caption = 'Sc'
              DataBinding.FieldName = 'COMPUTED_CONTRATTO_SCADUTO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 4
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 20
              Position.BandIndex = 4
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeCONTRATTO_DISDETTA_RICEVUTA: TcxGridDBBandedColumn
              Tag = 4
              Caption = 'Ds'
              DataBinding.FieldName = 'CONTRATTO_DISDETTA_RICEVUTA'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 4
                  Value = 'T'
                end>
              Properties.ShowDescriptions = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 20
              Position.BandIndex = 4
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeCONTRATTO_STATO: TcxGridDBBandedColumn
              Caption = 'Stato'
              DataBinding.FieldName = 'CONTRATTO_STATO'
              PropertiesClassName = 'TcxTextEditProperties'
              OnGetDataText = btvAssistenzeCONTRATTO_STATOGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 133
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 133
              Position.BandIndex = 4
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvAssistenzeCONTRATTO_TIPO: TcxGridDBBandedColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'CONTRATTO_TIPO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 133
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 133
              Position.BandIndex = 4
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeCONTRATTO_IMPORTO: TcxGridDBBandedColumn
              Caption = 'Importo (ic)'
              DataBinding.FieldName = 'CONTRATTO_IMPORTONETTOIVACOMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              OnGetDisplayText = btvAssistenzeCONTRATTO_IMPORTOGetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 65
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 65
              Position.BandIndex = 4
              Position.ColIndex = 2
              Position.RowIndex = 1
            end
            object btvAssistenzeCONTRATTO_VALIDITA_FINE: TcxGridDBBandedColumn
              Caption = 'Scadenza'
              DataBinding.FieldName = 'CONTRATTO_VALIDITA_FINE'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.SaveTime = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 65
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 65
              Position.BandIndex = 4
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvAssistenzeRIFRESPIMP: TcxGridDBBandedColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'RIFRESPIMP'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 5
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeINQUALITADIRESPIMP: TcxGridDBBandedColumn
              Caption = 'In qualit'#224' di'
              DataBinding.FieldName = 'INQUALITADIRESPIMP'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 80
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.HorzSizing = False
              Width = 80
              Position.BandIndex = 5
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeTELEFONORESPIMP: TcxGridDBBandedColumn
              Caption = 'Telefono'
              DataBinding.FieldName = 'TELEFONORESPIMP'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              OnGetDataText = btvAssistenzeTELEFONORESPIMPGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 5
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeCELLULARERESPIMP: TcxGridDBBandedColumn
              Caption = 'Cellulare'
              DataBinding.FieldName = 'CELLULARERESPIMP'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              VisibleForCustomization = False
              Position.BandIndex = 5
              Position.ColIndex = 2
              Position.RowIndex = 1
            end
            object btvAssistenzeRIFPROP: TcxGridDBBandedColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'RIFPROP'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 6
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeTELEFONOPROP: TcxGridDBBandedColumn
              Caption = 'Telefono'
              DataBinding.FieldName = 'TELEFONOPROP'
              PropertiesClassName = 'TcxTextEditProperties'
              OnGetDataText = btvAssistenzeTELEFONOPROPGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 6
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeCELLULAREPROP: TcxGridDBBandedColumn
              Caption = 'Cellulare'
              DataBinding.FieldName = 'CELLULAREPROP'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              VisibleForCustomization = False
              Position.BandIndex = 6
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeRIFUT: TcxGridDBBandedColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'RIFUT'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 7
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeTELEFONOUT: TcxGridDBBandedColumn
              Caption = 'Telefono'
              DataBinding.FieldName = 'TELEFONOUT'
              PropertiesClassName = 'TcxTextEditProperties'
              OnGetDataText = btvAssistenzeTELEFONOUTGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 7
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeCELLULAREUT: TcxGridDBBandedColumn
              Caption = 'Cellulare'
              DataBinding.FieldName = 'CELLULAREUT'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              VisibleForCustomization = False
              Position.BandIndex = 7
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeRIFINST: TcxGridDBBandedColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'RIFINST'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 8
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeTELEFONOINST: TcxGridDBBandedColumn
              Caption = 'Telefono'
              DataBinding.FieldName = 'TELEFONOINST'
              PropertiesClassName = 'TcxTextEditProperties'
              OnGetDataText = btvAssistenzeTELEFONOINSTGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Position.BandIndex = 8
              Position.ColIndex = 0
              Position.RowIndex = 1
            end
            object btvAssistenzeCELLULAREINST: TcxGridDBBandedColumn
              Caption = 'Cellulare'
              DataBinding.FieldName = 'CELLULAREINST'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              VisibleForCustomization = False
              Position.BandIndex = 8
              Position.ColIndex = 1
              Position.RowIndex = 1
            end
            object btvAssistenzeID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              VisibleForCustomization = False
              Position.BandIndex = 10
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvAssistenzeRESOURCEID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RESOURCEID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 10
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvAssistenzeRESOURCENAME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RESOURCENAME'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 10
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvAssistenzeHIGHLIGHTS: TcxGridDBBandedColumn
              Caption = 'Highlights'
              DataBinding.FieldName = 'HIGHLIGHTS'
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Position.BandIndex = 9
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
            end
          end
          object btvOP: TcxGridDBBandedTableView
            Synchronization = False
            OnDblClick = btvAssistenzeDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.OnDetailFirst = btvOPDataControllerDataModeControllerDetailFirst
            DataController.DataSource = SourceOP
            DataController.DetailKeyFieldNames = 'IDPRATICA'
            DataController.KeyFieldNames = 'ID'
            DataController.MasterKeyFieldNames = 'ID'
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DateTimeHandling.Grouping = dtgByMonth
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLineColor = 11731033
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.RowSeparatorColor = 11731033
            OptionsView.BandHeaders = False
            OptionsView.FixedBandSeparatorColor = 11731033
            Styles.Content = DM1.tvArtDetail_Content
            Styles.StyleSheet = DM1.btvArtDetail
            OnCustomDrawGroupCell = btvOPCustomDrawGroupCell
            Bands = <
              item
                Caption = 'Codice'
                Options.Sizing = False
              end
              item
                Caption = 'Descrizione'
              end
              item
                Caption = 'Date'
                Options.Sizing = False
              end
              item
                Caption = 'Note'
                Options.Sizing = False
              end
              item
                Caption = 'Altro'
                Options.Sizing = False
                Visible = False
              end>
            object btvOPIDOP: TcxGridDBBandedColumn
              Caption = 'Codice'
              DataBinding.FieldName = 'IDOP'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 80
              Options.HorzSizing = False
              Width = 80
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvOPDESCRIZIONE: TcxGridDBBandedColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 204
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvOPIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              MinWidth = 64
              Options.HorzSizing = False
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvOPMINUTIPREVISTI: TcxGridDBBandedColumn
              Caption = 'Min'
              DataBinding.FieldName = 'MINUTIPREVISTI'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 25
              Options.HorzSizing = False
              Width = 25
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvOPPERIODICITA: TcxGridDBBandedColumn
              Caption = 'Period.'
              DataBinding.FieldName = 'PERIODICITA'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 40
              Options.HorzSizing = False
              Width = 40
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvOPGG_AUTOSEL: TcxGridDBBandedColumn
              Caption = 'GGA'
              DataBinding.FieldName = 'GG_AUTOSEL'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.HorzSizing = False
              Width = 30
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvOPULTIMA: TcxGridDBBandedColumn
              Caption = 'Ultima'
              DataBinding.FieldName = 'ULTIMA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ShowTime = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 85
              Options.HorzSizing = False
              Width = 85
              Position.BandIndex = 2
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvOPPROSSIMA: TcxGridDBBandedColumn
              Caption = 'Prox. entro'
              DataBinding.FieldName = 'PROSSIMA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ShowTime = False
              OnCustomDrawCell = btvOPPROSSIMACustomDrawCell
              HeaderAlignmentHorz = taCenter
              MinWidth = 85
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 85
              Position.BandIndex = 2
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvOPNOTE: TcxGridDBBandedColumn
              Caption = 'Note'
              DataBinding.FieldName = 'NOTE'
              PropertiesClassName = 'TcxMemoProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 203
              Options.HorzSizing = False
              Width = 203
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvOPPRZUNITIVACOMP: TcxGridDBBandedColumn
              Caption = 'Prezzo (ic)'
              DataBinding.FieldName = 'PRZUNITNETTOIVACOMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = #8364' ,0.00;-'#8364' ,0.00'
              OnCustomDrawCell = btvOPPRZUNITIVACOMPCustomDrawCell
              OnGetDisplayText = btvOPPRZUNITIVACOMPGetDisplayText
              HeaderAlignmentHorz = taCenter
              MinWidth = 70
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 70
              Position.BandIndex = 3
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvOPADDEBITA: TcxGridDBBandedColumn
              Caption = '+'
              DataBinding.FieldName = 'ADDEBITA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 16
              Options.HorzSizing = False
              Width = 16
              Position.BandIndex = 3
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvOPINABBONAMENTO: TcxGridDBBandedColumn
              Caption = 'Abb.'
              DataBinding.FieldName = 'INABBONAMENTO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.HorzSizing = False
              Width = 30
              Position.BandIndex = 3
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvOPID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 64
              Options.HorzSizing = False
              Position.BandIndex = 4
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvOPIDPRATICA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDPRATICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 64
              Options.HorzSizing = False
              Position.BandIndex = 4
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvOPTIPOAPPARECCHIO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TIPOAPPARECCHIO'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 184
              Options.HorzSizing = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvOPCOSTRUTTORE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COSTRUTTORE'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 274
              Options.HorzSizing = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvOPMODELLO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'MODELLO'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 184
              Options.HorzSizing = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object btvOPMATRICOLA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'MATRICOLA'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 184
              Options.HorzSizing = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object btvOPUBICAZIONE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'UBICAZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              MinWidth = 184
              Options.HorzSizing = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object btvOPNUMAPPARECCHI: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NUMAPPARECCHI'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 4
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
          end
          object btvPrecInt: TcxGridDBBandedTableView
            OnDblClick = btvAssistenzeDblClick
            Navigator.Buttons.CustomButtons = <>
            OnCustomDrawCell = btvPrecIntCustomDrawCell
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.OnDetailFirst = btvPrecIntDataControllerDataModeControllerDetailFirst
            DataController.DataSource = SourceIntPrec
            DataController.DetailKeyFieldNames = 'PRATICA;DATAPRATICA1'
            DataController.MasterKeyFieldNames = 'CODICE;DATAAPERTURA'
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnCompare = btvPrecIntDataControllerCompare
            DateTimeHandling.Grouping = dtgByMonth
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLineColor = 11731033
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.RowSeparatorColor = 11731033
            OptionsView.BandHeaders = False
            OptionsView.FixedBandSeparatorColor = 11731033
            Styles.StyleSheet = DM1.btvArtDetail
            OnCustomDrawGroupCell = btvPrecIntCustomDrawGroupCell
            Bands = <
              item
                Caption = 'Interventi precedenti'
              end>
            object btvPrecIntTIPORECORD: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TIPORECORD'
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 3
              SortOrder = soAscending
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvPrecIntMASTER_ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'MASTER_ID'
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soDescending
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvPrecIntTIPODOC: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TIPODOC'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvPrecIntNUMDOC: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NUMDOC'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvPrecIntREGDOC: TcxGridDBBandedColumn
              DataBinding.FieldName = 'REGDOC'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object btvPrecIntDATADOC: TcxGridDBBandedColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DATADOC'
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soDescending
              VisibleForCustomization = False
              Width = 68
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object btvPrecIntCODICE: TcxGridDBBandedColumn
              Caption = 'Codice'
              DataBinding.FieldName = 'CODICE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              MinWidth = 80
              Options.HorzSizing = False
              Width = 80
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object btvPrecIntDESCRIZIONE: TcxGridDBBandedColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 306
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object btvPrecIntUM: TcxGridDBBandedColumn
              DataBinding.FieldName = 'UM'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object btvPrecIntQTA: TcxGridDBBandedColumn
              Caption = 'Qt'#224
              DataBinding.FieldName = 'QTA'
              RepositoryItem = DM1.EdPropQta
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              MinWidth = 30
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 30
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object btvPrecIntPRZUNIT: TcxGridDBBandedColumn
              Caption = 'Prz.unit.'
              DataBinding.FieldName = 'PRZUNIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 56
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object btvPrecIntPRZUNITIVACOMP: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PRZUNITIVACOMP'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object btvPrecIntS1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'S1'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object btvPrecIntS2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'S2'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object btvPrecIntS3: TcxGridDBBandedColumn
              DataBinding.FieldName = 'S3'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object btvPrecIntIMPORTO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IMPORTO'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object btvPrecIntIMPORTOIVACOMP: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IMPORTOIVACOMP'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object btvPrecIntTECNICO_NOME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TECNICO_NOME'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object btvPrecIntIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 2
              SortOrder = soDescending
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object btvPrecIntCALC_PRZUNITNETTO: TcxGridDBBandedColumn
              Caption = 'Prz.unit.'
              DataBinding.FieldName = 'CALC_PRZUNITNETTO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              Visible = False
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 56
              Position.BandIndex = 0
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object btvPrecIntCALC_PRZUNITIVACOMPNETTO: TcxGridDBBandedColumn
              Caption = 'Prz.unit.ic'
              DataBinding.FieldName = 'CALC_PRZUNITIVACOMPNETTO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;-,0.00'
              OnGetDisplayText = btvPrecIntQTAGetDisplayText
              HeaderAlignmentHorz = taCenter
              MinWidth = 70
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 70
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object btvPrecIntPRATICA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PRATICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object btvPrecIntDATAPRATICA1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DATAPRATICA1'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object btvPrecIntAPPARECCHIO_FULL: TcxGridDBBandedColumn
              Caption = 'Apparecchio'
              DataBinding.FieldName = 'APPARECCHIO_FULL'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              OnGetDisplayText = btvPrecIntAPPARECCHIO_FULLGetDisplayText
              HeaderAlignmentHorz = taCenter
              Width = 300
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object btvPrecIntGUID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GUID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 24
              Position.RowIndex = 0
            end
            object btvPrecIntIDALLEGATOFG: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDALLEGATOFG'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 25
              Position.RowIndex = 0
            end
            object btvPrecIntINABBONAMENTO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'INABBONAMENTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 26
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_TIPO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_TIPO'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 27
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_NUM: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_NUM'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 28
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_REG: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_REG'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 29
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_DATA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_DATA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ShowTime = False
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 30
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_CORRISPNOPAG: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_CORRISPNOPAG'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 31
              Position.RowIndex = 0
            end
            object btvPrecIntRIFDOC_TOTALEDOCUMENTO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RIFDOC_TOTALEDOCUMENTO'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 32
              Position.RowIndex = 0
            end
          end
          object btvPresc: TcxGridDBBandedTableView
            OnDblClick = btvAssistenzeDblClick
            Navigator.Buttons.CustomButtons = <>
            OnEditing = btvPrescEditing
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.SmartRefresh = True
            DataController.DataModeController.OnDetailFirst = btvPrescDataControllerDataModeControllerDetailFirst
            DataController.DataSource = SourcePresc
            DataController.DetailKeyFieldNames = 'PRATICA;DATAPRATICA1'
            DataController.KeyFieldNames = 'UNIQUEKEYFIELD'
            DataController.MasterKeyFieldNames = 'CODICE;DATAAPERTURA'
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DateTimeHandling.Grouping = dtgByMonth
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsSelection.MultiSelect = True
            OptionsView.FocusRect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLineColor = 11731033
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            OptionsView.RowSeparatorColor = 11731033
            OptionsView.BandHeaders = False
            OptionsView.FixedBandSeparatorColor = 11731033
            Styles.StyleSheet = DM1.btvArtDetail
            Bands = <
              item
                Caption = 'Risolto'
              end
              item
                Caption = 'RAccomandazioni / Prescrizioni'
              end>
            object btvPrescCODICE: TcxGridDBBandedColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'CODICE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              OnCustomDrawCell = btvPrescCODICECustomDrawCell
              HeaderAlignmentHorz = taCenter
              Width = 631
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object btvPrescDESCRIZIONE: TcxGridDBBandedColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'DESCRIZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              OnCustomDrawCell = btvPrescDESCRIZIONECustomDrawCell
              HeaderAlignmentHorz = taCenter
              Width = 343
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 1
            end
            object btvPrescDATADOC: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DATADOC'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object btvPrescTECNICO_NOME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TECNICO_NOME'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object btvPrescRISOLTO: TcxGridDBBandedColumn
              Caption = 'Fatto'
              DataBinding.FieldName = 'FATTO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.OnEditValueChanged = btvPrescRISOLTOPropertiesEditValueChanged
              OnCustomDrawCell = btvPrescRISOLTOCustomDrawCell
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 25
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.LineCount = 3
              Position.RowIndex = 0
            end
            object btvPrescTIPORECORD: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TIPORECORD'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object btvPrescIDIMPEGNO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDIMPEGNO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object btvPrescIDALLEGATO: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDALLEGATO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object btvPrescUNIQUEKEYFIELD: TcxGridDBBandedColumn
              DataBinding.FieldName = 'UNIQUEKEYFIELD'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object btvPrescIDAPPARECCHIOPRAT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDAPPARECCHIOPRAT'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object btvPrescAPPARECCHIO_FULL: TcxGridDBBandedColumn
              Caption = 'Apparecchio'
              DataBinding.FieldName = 'APPARECCHIO_FULL'
              PropertiesClassName = 'TcxTextEditProperties'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Width = 250
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object btvPrescFATTO_DATA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FATTO_DATA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object btvPrescFATTO_NOTE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FATTO_NOTE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object btvPrescPRATICA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PRATICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object btvPrescDATAPRATICA1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DATAPRATICA1'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
          end
          object tvImpegni: TcxGridDBTableView
            DragMode = dmAutomatic
            OnDblClick = btvAssistenzeDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.OnDetailFirst = tvImpegniDataControllerDataModeControllerDetailFirst
            DataController.DataSource = SourceImp
            DataController.DetailKeyFieldNames = 'PRATICA;DATAPRATICA1'
            DataController.KeyFieldNames = 'ID'
            DataController.MasterKeyFieldNames = 'CODICE;DATAAPERTURA'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DateTimeHandling.Grouping = dtgByMonth
            OptionsBehavior.CellHints = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.FocusRect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLineColor = 11731033
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.RowSeparatorColor = 11731033
            Styles.Background = DM1.tvArtDetail_Background
            Styles.Content = DM1.tvArtDetail_Content
            Styles.Selection = DM1.tvArtDetail_Selection
            Styles.Footer = DM1.tvArtDetail_Footer
            Styles.Group = DM1.tvArtDetail_Group
            Styles.GroupByBox = DM1.tvArtDetail_GroupByBox
            Styles.Header = DM1.tvArtDetail_Header
            object tvImpegniEXISTS_URGENTI: TcxGridDBColumn
              DataBinding.FieldName = 'EXISTS_URGENTI'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 0
                  Value = 'T'
                end>
              OnGetCellHint = tvImpegniEXISTS_URGENTIGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Styles.Header = DM1.tvArtDetail_ContentHighlight
              Width = 22
              IsCaptionAssigned = True
            end
            object tvImpegniEXISTS_STAMPATO: TcxGridDBColumn
              DataBinding.FieldName = 'EXISTS_STAMPATO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = DM2.ImpiantiListImages
              Properties.ImmediatePost = True
              Properties.Items = <
                item
                  Description = 'Azzera'
                end
                item
                  Value = 'F'
                end
                item
                  ImageIndex = 11
                  Value = 'T'
                end>
              OnGetCellHint = tvImpegniEXISTS_URGENTIGetCellHint
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              MinWidth = 22
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Styles.Header = DM1.tvArtDetail_ContentHighlight
              Width = 22
              IsCaptionAssigned = True
            end
            object tvImpegniTIPOIMPEGNO: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'TIPOIMPEGNO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 90
            end
            object tvImpegniID: TcxGridDBColumn
              Caption = 'N'#176
              DataBinding.FieldName = 'ID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object tvImpegniREGISTRO: TcxGridDBColumn
              Caption = 'R'
              DataBinding.FieldName = 'REGISTRO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 20
            end
            object tvImpegniEVENTMESSAGE: TcxGridDBColumn
              Caption = 'Descrizione'
              DataBinding.FieldName = 'EVENTMESSAGE'
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              Width = 175
            end
            object tvImpegniSTART: TcxGridDBColumn
              Caption = 'Appuntamento'
              DataBinding.FieldName = 'START'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Styles.Header = DM1.tvArtDetail_ContentHighlight
              Width = 80
            end
            object tvImpegniLOCATION: TcxGridDBColumn
              Caption = 'Luogo/Note'
              DataBinding.FieldName = 'LOCATION'
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object tvImpegniTIPOINTERVENTO: TcxGridDBColumn
              Caption = 'Tipo intervento'
              DataBinding.FieldName = 'TIPOINTERVENTO'
              PropertiesClassName = 'TcxCheckComboBoxProperties'
              Properties.EditValueFormat = cvfCaptions
              Properties.Items = <
                item
                  Description = 'Collaudo'
                end
                item
                  Description = 'Prima accensione'
                end
                item
                  Description = 'Manutenzione'
                end
                item
                  Description = 'Prova combustione'
                end
                item
                  Description = 'Guasto'
                end>
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvImpegniTECNICO: TcxGridDBColumn
              Caption = 'Tecnico'
              DataBinding.FieldName = 'TECNICO'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 100
            end
            object tvImpegniDATAORACHIAMATA: TcxGridDBColumn
              Caption = 'Chiamata'
              DataBinding.FieldName = 'DATAORACHIAMATA'
              PropertiesClassName = 'TcxDateEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object tvImpegniPARENTID: TcxGridDBColumn
              DataBinding.FieldName = 'PARENTID'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvImpegniPRATICA: TcxGridDBColumn
              DataBinding.FieldName = 'PRATICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvImpegniDATAPRATICA1: TcxGridDBColumn
              DataBinding.FieldName = 'DATAPRATICA1'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
          end
          object tvApp: TcxGridDBTableView
            OnDblClick = btvAssistenzeDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.OnDetailFirst = tvAppDataControllerDataModeControllerDetailFirst
            DataController.DataSource = SourcePratApp
            DataController.DetailKeyFieldNames = 'IDPRATICA'
            DataController.KeyFieldNames = 'ID'
            DataController.MasterKeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DateTimeHandling.Grouping = dtgByMonth
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.Appending = True
            OptionsSelection.CellSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.FocusRect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 30
            OptionsView.GridLineColor = 11731033
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            OptionsView.RowSeparatorColor = 11731033
            Styles.Background = DM1.tvArtDetail_Background
            Styles.Content = DM1.tvArtDetail_Content
            Styles.Selection = DM1.tvArtDetail_Selection
            Styles.Footer = DM1.tvArtDetail_Footer
            Styles.Group = DM1.tvArtDetail_Group
            Styles.GroupByBox = DM1.tvArtDetail_GroupByBox
            Styles.Header = DM1.tvArtDetail_Header
            object tvAppTIPOAPPARECCHIO: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'TIPOAPPARECCHIO'
              PropertiesClassName = 'TcxTextEditProperties'
              OnCustomDrawCell = tvAppTIPOAPPARECCHIOCustomDrawCell
              HeaderAlignmentHorz = taCenter
              MinWidth = 115
              Options.HorzSizing = False
              Width = 115
            end
            object tvAppCOMPUTED_APPARECCHIO_FULL: TcxGridDBColumn
              Caption = 'Apparecchio'
              DataBinding.FieldName = 'COMPUTED_APPARECCHIO_FULL'
              PropertiesClassName = 'TcxTextEditProperties'
              OnCustomDrawCell = tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell
              HeaderAlignmentHorz = taCenter
              Width = 249
            end
            object tvAppANNOCOSTRUZIONE: TcxGridDBColumn
              Caption = 'Costruito'
              DataBinding.FieldName = 'ANNOCOSTRUZIONE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              OnCustomDrawCell = tvAppANNOCOSTRUZIONECustomDrawCell
              BestFitMaxWidth = 12
              HeaderAlignmentHorz = taCenter
              MinWidth = 12
              Options.HorzSizing = False
              Width = 12
            end
            object tvAppGARANZIA_SCADENZA: TcxGridDBColumn
              Caption = 'Garanzia'
              DataBinding.FieldName = 'GARANZIA_SCADENZA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              OnCustomDrawCell = tvAppGARANZIA_SCADENZACustomDrawCell
              HeaderAlignmentHorz = taCenter
              MinWidth = 186
              Options.HorzSizing = False
              Styles.Content = DM1.tvArtDetail_ContentHighlight
              Width = 186
            end
            object tvAppID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOSTRUTTORE: TcxGridDBColumn
              DataBinding.FieldName = 'COSTRUTTORE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppMODELLO: TcxGridDBColumn
              DataBinding.FieldName = 'MODELLO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppMATRICOLA: TcxGridDBColumn
              DataBinding.FieldName = 'MATRICOLA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppUBICAZIONE: TcxGridDBColumn
              DataBinding.FieldName = 'UBICAZIONE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppDATAINSTALLAZIONE: TcxGridDBColumn
              DataBinding.FieldName = 'DATAINSTALLAZIONE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppDATACOLLAUDO: TcxGridDBColumn
              DataBinding.FieldName = 'DATACOLLAUDO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppDISMESSO: TcxGridDBColumn
              DataBinding.FieldName = 'DISMESSO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppIDAPPABBINATO: TcxGridDBColumn
              DataBinding.FieldName = 'IDAPPABBINATO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_ABBINATO: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_ABBINATO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_ORDER1: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_ORDER1'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_ORDER2: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_ORDER2'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPOTENZATERMICA: TcxGridDBColumn
              DataBinding.FieldName = 'POTENZATERMICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPOTENZATERMICA2: TcxGridDBColumn
              DataBinding.FieldName = 'POTENZATERMICA2'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppTIPOCAMERA: TcxGridDBColumn
              DataBinding.FieldName = 'TIPOCAMERA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMBUSTIBILE: TcxGridDBColumn
              DataBinding.FieldName = 'COMBUSTIBILE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMBUSTIBILEALTRO: TcxGridDBColumn
              DataBinding.FieldName = 'COMBUSTIBILEALTRO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppGARANZIA_NOTE: TcxGridDBColumn
              DataBinding.FieldName = 'GARANZIA_NOTE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppGARANZIA_MESI: TcxGridDBColumn
              DataBinding.FieldName = 'GARANZIA_MESI'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppGARANZIA_MESI_ESTENSIONE: TcxGridDBColumn
              DataBinding.FieldName = 'GARANZIA_MESI_ESTENSIONE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_INGARANZIA: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_INGARANZIA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppDISMESSO_DATA: TcxGridDBColumn
              DataBinding.FieldName = 'DISMESSO_DATA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppDISMESSO_NOTE: TcxGridDBColumn
              DataBinding.FieldName = 'DISMESSO_NOTE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppVOLTAGGIOELETTRICO: TcxGridDBColumn
              DataBinding.FieldName = 'VOLTAGGIOELETTRICO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPOTENZAELETTRICA: TcxGridDBColumn
              DataBinding.FieldName = 'POTENZAELETTRICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPORTATA: TcxGridDBColumn
              DataBinding.FieldName = 'PORTATA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPREVALENZA: TcxGridDBColumn
              DataBinding.FieldName = 'PREVALENZA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppREFRIGERANTE: TcxGridDBColumn
              DataBinding.FieldName = 'REFRIGERANTE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCARICA: TcxGridDBColumn
              DataBinding.FieldName = 'CARICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppPOTENZAFRIGORIFERA: TcxGridDBColumn
              DataBinding.FieldName = 'POTENZAFRIGORIFERA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_GARANZIA: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_GARANZIA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppCOMPUTED_GARANZIA_NOTE: TcxGridDBColumn
              DataBinding.FieldName = 'COMPUTED_GARANZIA_NOTE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
            object tvAppIDPRATICA: TcxGridDBColumn
              DataBinding.FieldName = 'IDPRATICA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
            end
          end
          object lvAssistenze: TcxGridLevel
            GridView = btvAssistenze
            Options.DetailFrameColor = 11731033
            Options.DetailFrameWidth = 2
            Options.DetailTabsPosition = dtpTop
            Styles.Tab = DM1.tvArtDetail_Content
            Styles.TabsBackground = DM1.tvArtDetail_GroupByBox
            object lvOP: TcxGridLevel
              Caption = 'Operazioni pianificate'
              GridView = btvOP
            end
            object lvPrecedenti: TcxGridLevel
              Caption = 'Precedenti'
              GridView = btvPrecInt
            end
            object lvPrescriz: TcxGridLevel
              Caption = 'Prescrizioni / Raccomandazioni'
              GridView = btvPresc
            end
            object lvApp: TcxGridLevel
              Caption = 'Apparecchi'
              GridView = tvApp
            end
            object lvImpegni: TcxGridLevel
              Caption = 'Chiamate / Appuntamenti'
              GridView = tvImpegni
            end
          end
        end
        object PanelAssFiltri: TPanel
          Left = 0
          Top = 400
          Width = 685
          Height = 169
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          OnResize = PanelAssFiltriResize
          object SubPanelAssFiltri: TPanel
            Left = 0
            Top = 0
            Width = 686
            Height = 169
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 0
            object Label47: TLabel
              Left = 611
              Top = 73
              Width = 73
              Height = 85
              Alignment = taCenter
              AutoSize = False
              Caption = 'Al'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label48: TLabel
              Left = 537
              Top = 73
              Width = 74
              Height = 85
              Alignment = taCenter
              AutoSize = False
              Caption = 'Dal'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object AssOtt: TSpeedButton
              Tag = 10
              Left = 611
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Ott'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Nov'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Dic'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Ago'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Lug'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Giu'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Mag'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Gen'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Feb'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Mar'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 122
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Apr'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 104
              Width = 65
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              Caption = 'Predefinito'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Left = 604
              Top = 104
              Width = 55
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
                'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
                'li anni).'
              Caption = 'Nessuno'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
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
              Top = 139
              Width = 24
              Height = 17
              Cursor = crHandPoint
              Hint = 'Clicca qu'#39' per visualizzare solo i'#13#10'documenti del mese indicato.'
              AllowAllUp = True
              GroupIndex = 600
              Caption = 'Set'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = AssGenClick
              OnMouseUp = AssGenMouseUp
            end
            object SBAssFilterOpenClose: TSpeedButtonRollOver
              Left = 1
              Top = 3
              Width = 19
              Height = 27
              Cursor = crHandPoint
              OnClick = SBAssFilterOpenCloseClick
            end
            object AssSaveDateFilter: TSpeedButton
              Left = 662
              Top = 104
              Width = 21
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare i documenti'#13#10'senza alcun filtro di m' +
                'ese o anno.'#13#10'(Visualizza i documenti di tutti i mesi'#13#10'di tutti g' +
                'li anni).'
              Caption = 'M+'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = AssSaveDateFilterClick
            end
            object LabelImpiantiCount: TLabel
              Left = 364
              Top = 11
              Width = 21
              Height = 12
              Caption = '- - -'
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object StaticText32: TStaticText
              Left = 289
              Top = 111
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Comune'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 16
              Transparent = False
            end
            object StaticText29: TStaticText
              Left = 289
              Top = 73
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Modello'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 17
              Transparent = False
            end
            object StaticText20: TStaticText
              Left = 0
              Top = 130
              Width = 280
              Height = 33
              Alignment = taCenter
              AutoSize = False
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 18
              Transparent = False
            end
            object FilterAbbonati: TCheckListBox
              Left = 1
              Top = 131
              Width = 278
              Height = 31
              Cursor = crHandPoint
              OnClickCheck = FilterAbbonatiClickCheck
              BorderStyle = bsNone
              Color = 15266815
              Columns = 2
              Ctl3D = False
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ItemHeight = 14
              Items.Strings = (
                'Abbonati'
                'NON Abbonati'
                'Sospesi'
                'Dismessi')
              ParentCtl3D = False
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 6
              OnExit = FilterAbbonatiExit
              OnMouseUp = FilterAbbonatiMouseUp
            end
            object StaticText27: TStaticText
              Left = 289
              Top = 149
              Width = 238
              Height = 16
              Alignment = taCenter
              AutoSize = False
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 19
              Transparent = False
            end
            object FilterInScadenza: TCheckListBox
              Left = 290
              Top = 150
              Width = 236
              Height = 14
              Cursor = crHandPoint
              OnClickCheck = FilterAbbonatiClickCheck
              BorderStyle = bsNone
              Color = 15266815
              Ctl3D = False
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ItemHeight = 14
              Items.Strings = (
                'Solo con manutenzione in SCADENZA')
              ParentCtl3D = False
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 13
              OnExit = FilterAbbonatiExit
              OnMouseUp = FilterAbbonatiMouseUp
            end
            object StaticText28: TStaticText
              Left = 289
              Top = 54
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Costruttore'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 20
              Transparent = False
            end
            object FilterCostruttore: TcxComboBox
              Left = 353
              Top = 53
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Sorted = True
              Properties.OnInitPopup = FilterCostruttorePropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 8
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 175
            end
            object FilterModello: TcxComboBox
              Left = 353
              Top = 72
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = FilterModelloPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 9
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 175
            end
            object FilterLocalita: TcxComboBox
              Left = 353
              Top = 110
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.OnInitPopup = FilterLocalitaPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 11
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 175
            end
            object StaticText39: TStaticText
              Left = 1
              Top = 73
              Width = 279
              Height = 16
              AutoSize = False
              Caption = ' Periodicit'#224'  (GG)'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 21
              Transparent = False
            end
            object StaticText42: TStaticText
              Left = 1
              Top = 54
              Width = 279
              Height = 16
              AutoSize = False
              Caption = ' Tipo impianto'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 22
              Transparent = False
            end
            object FilterTipoImpianto: TcxComboBox
              Left = 94
              Top = 53
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.Items.Strings = (
                'Centrale termica'
                'Climatizzazione'
                'Generico'
                'Refrigerazione'
                'Riscaldamento')
              Properties.Sorted = True
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 2
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 187
            end
            object FilterPeriodicita: TcxComboBox
              Left = 94
              Top = 72
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.OnInitPopup = FilterPeriodicitaPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 3
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 187
            end
            object StaticText23: TStaticText
              Left = 537
              Top = 35
              Width = 147
              Height = 19
              AutoSize = False
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 23
              Transparent = False
            end
            object FilterTipoData: TcxComboBox
              Left = 538
              Top = 36
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownRows = 25
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Items.Strings = (
                'Prossimo intervento'
                'Ultimo intervento'
                'Operazioni Pianificate')
              Properties.OnChange = FilterTipoDataPropertiesChange
              Properties.OnInitPopup = FilterTipoDataPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.TextColor = clBlack
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 14
              Text = 'Prossimo intervento'
              Height = 19
              Width = 145
            end
            object StaticText57: TStaticText
              Left = 289
              Top = 130
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Via'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 24
              Transparent = False
            end
            object FilterIndirizzo: TEdit
              Left = 355
              Top = 131
              Width = 171
              Height = 14
              Hint = 
                'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
                'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
              AutoSize = False
              BorderStyle = bsNone
              Color = 15266815
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnKeyPress = FilterAssTrovaKeyPress
            end
            object StaticText69: TStaticText
              Left = 1
              Top = 111
              Width = 279
              Height = 16
              AutoSize = False
              Caption = ' Tec. preferito'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 25
              Transparent = False
            end
            object FilterTecnicoPreferito: TcxComboBox
              Left = 94
              Top = 110
              AutoSize = False
              ParentFont = False
              Properties.DropDownAutoWidth = False
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownRows = 32
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.Sorted = True
              Properties.OnInitPopup = FilterTecnicoPreferitoPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 5
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 187
            end
            object StaticText75: TStaticText
              Left = 30
              Top = 10
              Width = 330
              Height = 16
              AutoSize = False
              Caption = ' Trova'
              Color = 28895
              Font.Charset = ANSI_CHARSET
              Font.Color = 12902911
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 26
              Transparent = False
            end
            object FilterAssTrova: TEdit
              Left = 66
              Top = 11
              Width = 293
              Height = 14
              Hint = 
                'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
                'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
              AutoSize = False
              BorderStyle = bsNone
              Color = 15266815
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = FilterAssTrovaKeyPress
            end
            object StaticText11: TStaticText
              Left = 289
              Top = 92
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Matricola'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 27
              Transparent = False
            end
            object FilterMatricola: TEdit
              Left = 355
              Top = 93
              Width = 171
              Height = 14
              Hint = 
                'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
                'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
              AutoSize = False
              BorderStyle = bsNone
              Color = 15266815
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              OnKeyPress = FilterAssTrovaKeyPress
            end
            object StaticText36: TStaticText
              Left = 1
              Top = 35
              Width = 279
              Height = 16
              AutoSize = False
              Caption = ' N'#176' impianto'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 28
              Transparent = False
            end
            object FilterCodiceImpianto: TEdit
              Left = 96
              Top = 36
              Width = 183
              Height = 14
              Hint = 
                'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
                'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
              AutoSize = False
              BorderStyle = bsNone
              Color = 15266815
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = FilterAssTrovaKeyPress
            end
            object StaticText50: TStaticText
              Left = 289
              Top = 35
              Width = 238
              Height = 16
              AutoSize = False
              Caption = ' Cod.catasto'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 29
              Transparent = False
            end
            object FilterCodiceCatasto: TEdit
              Left = 355
              Top = 36
              Width = 171
              Height = 14
              Hint = 
                'Inserisci qu'#236' una o pi'#249' parole da ricercare'#13#10'nei documenti (cerc' +
                'a nei campi: Oggetto,'#13#10'Argomento, Provenienza, Note).'
              AutoSize = False
              BorderStyle = bsNone
              Color = 15266815
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnKeyPress = FilterAssTrovaKeyPress
            end
            object StaticText1: TStaticText
              Left = 1
              Top = 92
              Width = 279
              Height = 16
              AutoSize = False
              Caption = ' Tipo contratto'
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 30
              Transparent = False
            end
            object FilterTipoContratto: TcxComboBox
              Left = 94
              Top = 91
              AutoSize = False
              ParentFont = False
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.ImmediatePost = True
              Properties.Sorted = True
              Properties.OnInitPopup = FilterTipoContrattoPropertiesInitPopup
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 4
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 187
            end
            object AssDal: TcxDateEdit
              Left = 538
              Top = 85
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 31
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 72
            end
            object AssAl: TcxDateEdit
              Left = 611
              Top = 85
              RepositoryItem = DM1.EdPropFilterDateEdit
              AutoSize = False
              ParentFont = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters_Date
              TabOrder = 32
              OnKeyPress = FilterAssTrovaKeyPress
              Height = 18
              Width = 72
            end
            object StaticText2: TStaticText
              Left = 537
              Top = 54
              Width = 147
              Height = 19
              AutoSize = False
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 33
              Transparent = False
            end
            object FilterTipoDataOP: TcxComboBox
              Left = 538
              Top = 55
              AutoSize = False
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.ImmediateDropDownWhenKeyPressed = False
              Properties.Items.Strings = (
                'Prossima volta'
                'Ultima volta (impianto)'
                'Ultima volta (intervento)')
              Style.BorderStyle = ebsNone
              Style.Color = 15266815
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.StyleController = DMStyles.cxEditStyleController_Filters
              Style.TextColor = clBlack
              Style.PopupBorderStyle = epbsSingle
              Style.IsFontAssigned = True
              TabOrder = 15
              Text = 'Prossima volta'
              Visible = False
              Height = 19
              Width = 145
            end
          end
        end
        object Panel18: TPanel
          Left = 598
          Top = 61
          Width = 67
          Height = 21
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 16037544
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object SpeedButton17: TSpeedButton
            Left = 1
            Top = 1
            Width = 20
            Height = 19
            Cursor = crHandPoint
            Hint = 'Chiude tutte le righe'
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000000000FFFF0FFFFFFFFFF0FFFF0FFFFFFFFF
              F0FFFF0FFFFFFFFFF0FFFF0FFFFFFFFFF0FFFF0FF000000FF0FFFF0FF000000F
              F0FFFF0FFFFFFFFFF0FFFF0FFFFFFFFFF0FFFF0FFFFFFFFFF0FFFF0FFFFFFFFF
              F0FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton17Click
          end
          object SpeedButton18: TSpeedButton
            Left = 22
            Top = 1
            Width = 20
            Height = 19
            Cursor = crHandPoint
            Hint = 'Espande tutti le righe'
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000000000FFFF0FFFFFFFFFF0FFFF0FFFFFFFFF
              F0FFFF0FFFF00FFFF0FFFF0FFFF00FFFF0FFFF0FF000000FF0FFFF0FF000000F
              F0FFFF0FFFF00FFFF0FFFF0FFFF00FFFF0FFFF0FFFFFFFFFF0FFFF0FFFFFFFFF
              F0FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton18Click
          end
          object SBFilterRow: TSpeedButton
            Left = 43
            Top = 1
            Width = 20
            Height = 19
            Cursor = crHandPoint
            Hint = 'Attiva/Disattiva la riga dei filtri'
            AllowAllUp = True
            GroupIndex = 100
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFF0FF0FFFFFFFFFFFF0FF0FF
              FFFFFFFFFF0FF0FFFFFFFFFFFF0FF0FFFFFFFFFFFF0000FFFFFFFFFFF08FF80F
              FFFFFFFF08FFFF80FFFFFFF08FFFFFF80FFFFF000000000000FFF0FFFFFFFFFF
              FF0FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SBFilterRowClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 536
          Top = 32
          Width = 33
          Height = 1
          Caption = 'GroupBox1'
          TabOrder = 3
        end
        object PanelSelezioneColonne: TPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 53
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          OnResize = PanelSelezioneColonneResize
          object SubPanelSelezioneColonne: TPanel
            Left = 0
            Top = 4
            Width = 684
            Height = 46
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 0
            object Label2: TLabel
              Left = 15
              Top = 0
              Width = 654
              Height = 44
              Alignment = taCenter
              AutoSize = False
              Color = 11064319
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Shape1: TShape
              Left = 17
              Top = 2
              Width = 650
              Height = 40
              Brush.Style = bsClear
              Pen.Color = 28895
            end
            object SbGcVisMem1: TSpeedButton
              Left = 69
              Top = 5
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '1'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem4: TSpeedButton
              Left = 414
              Top = 5
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '4'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem2: TSpeedButton
              Left = 184
              Top = 5
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '2'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem5: TSpeedButton
              Left = 529
              Top = 5
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '5'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem3: TSpeedButton
              Left = 299
              Top = 5
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '3'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMemAdd: TSpeedButton
              Left = 644
              Top = 5
              Width = 21
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              AllowAllUp = True
              GroupIndex = 11111
              Caption = '+'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMemAddClick
            end
            object Label3: TLabel
              Left = 17
              Top = 3
              Width = 50
              Height = 39
              Alignment = taCenter
              AutoSize = False
              Caption = 'Memorie'
              Color = 28895
              Font.Charset = ANSI_CHARSET
              Font.Color = 12902911
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              Layout = tlCenter
            end
            object SbGcVisMem6: TSpeedButton
              Left = 69
              Top = 23
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '6'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem7: TSpeedButton
              Left = 184
              Top = 23
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '7'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem8: TSpeedButton
              Left = 299
              Top = 23
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '8'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem9: TSpeedButton
              Left = 414
              Top = 23
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '9'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMem10: TSpeedButton
              Left = 529
              Top = 23
              Width = 114
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              GroupIndex = 199
              Caption = '10'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMem1Click
              OnMouseUp = SbGcVisMem1MouseUp
            end
            object SbGcVisMemSetPredef: TSpeedButton
              Left = 644
              Top = 23
              Width = 21
              Height = 16
              Cursor = crHandPoint
              Hint = 
                'Clicca qu'#236' per visualizzare tutti i'#13#10'documenti dell'#39'anno in cors' +
                'o.'
              AllowAllUp = True
              GroupIndex = 11111
              Caption = 'P'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = 25542
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = SbGcVisMemSetPredefClick
            end
          end
        end
      end
    end
    object TabAssMappa: TcxTabSheet
      Caption = '   Mappa   '
      ImageIndex = 4
    end
  end
  object QryAss: TIBOQuery
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM PRATICHE WHERE'
      'CODICE = :CODICE'
      'AND DATAAPERTURA = :DATAAPERTURA')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforeDelete = QryAssBeforeDelete
    OnCalcFields = QryAssCalcFields
    SQL.Strings = (
      'SELECT * FROM IMPIANTI_LIST_VIEW')
    FieldOptions = []
    Left = 101
    Top = 188
    object QryAssID: TIntegerField
      FieldName = 'ID'
    end
    object QryAssCODICE: TIntegerField
      FieldName = 'CODICE'
    end
    object QryAssDATAAPERTURA: TDateTimeField
      FieldName = 'DATAAPERTURA'
    end
    object QryAssTIPOIMPIANTO: TStringField
      FieldName = 'TIPOIMPIANTO'
    end
    object QryAssDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryAssCODICECATASTO: TStringField
      FieldName = 'CODICECATASTO'
      Size = 50
    end
    object QryAssNOTE: TStringField
      FieldName = 'NOTE'
      Size = 1000
    end
    object QryAssNOTEPRIVATEEXISTS: TStringField
      FieldName = 'NOTEPRIVATEEXISTS'
      Size = 1
    end
    object QryAssINDIRIZZOIMM: TStringField
      FieldName = 'INDIRIZZOIMM'
      Size = 100
    end
    object QryAssZONAIMM: TStringField
      FieldName = 'ZONAIMM'
      Size = 30
    end
    object QryAssCOMUNEIMM: TStringField
      FieldName = 'COMUNEIMM'
      Size = 25
    end
    object QryAssPROVINCIAIMM: TStringField
      FieldName = 'PROVINCIAIMM'
      Size = 3
    end
    object QryAssCAPIMM: TStringField
      FieldName = 'CAPIMM'
      Size = 5
    end
    object QryAssDATAULTIMOINTERVENTO: TDateTimeField
      FieldName = 'DATAULTIMOINTERVENTO'
    end
    object QryAssPROXVISITAENTRO: TDateTimeField
      FieldName = 'PROXVISITAENTRO'
    end
    object QryAssPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QryAssDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField
      FieldName = 'DATAORAPROSSIMOAPPUNTAMENTO'
    end
    object QryAssCONTRATTO_STATO: TStringField
      FieldName = 'CONTRATTO_STATO'
      Size = 1
    end
    object QryAssCONTRATTO_TIPO: TStringField
      FieldName = 'CONTRATTO_TIPO'
      Size = 60
    end
    object QryAssCONTRATTO_IMPORTO: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTO'
    end
    object QryAssCONTRATTO_IMPORTONETTO: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTONETTO'
    end
    object QryAssCONTRATTO_IMPORTONETTOIVACOMP: TIBOFloatField
      FieldName = 'CONTRATTO_IMPORTONETTOIVACOMP'
    end
    object QryAssCONTRATTO_VALIDITA_FINE: TDateTimeField
      FieldName = 'CONTRATTO_VALIDITA_FINE'
    end
    object QryAssCONTRATTO_DISDETTA_RICEVUTA: TStringField
      FieldName = 'CONTRATTO_DISDETTA_RICEVUTA'
      Size = 1
    end
    object QryAssCODICERESPIMP: TIntegerField
      FieldName = 'CODICERESPIMP'
    end
    object QryAssRIFRESPIMP: TStringField
      FieldName = 'RIFRESPIMP'
      Size = 80
    end
    object QryAssINQUALITADIRESPIMP: TStringField
      FieldName = 'INQUALITADIRESPIMP'
    end
    object QryAssTELEFONORESPIMP: TStringField
      FieldName = 'TELEFONORESPIMP'
      Size = 30
    end
    object QryAssCELLULARERESPIMP: TStringField
      FieldName = 'CELLULARERESPIMP'
      Size = 30
    end
    object QryAssCODICEPROP: TIntegerField
      FieldName = 'CODICEPROP'
    end
    object QryAssRIFPROP: TStringField
      FieldName = 'RIFPROP'
      Size = 80
    end
    object QryAssTELEFONOPROP: TStringField
      FieldName = 'TELEFONOPROP'
      Size = 30
    end
    object QryAssCELLULAREPROP: TStringField
      FieldName = 'CELLULAREPROP'
      Size = 30
    end
    object QryAssCODICEUT: TIntegerField
      FieldName = 'CODICEUT'
    end
    object QryAssRIFUT: TStringField
      FieldName = 'RIFUT'
      Size = 80
    end
    object QryAssTELEFONOUT: TStringField
      FieldName = 'TELEFONOUT'
      Size = 30
    end
    object QryAssCELLULAREUT: TStringField
      FieldName = 'CELLULAREUT'
      Size = 30
    end
    object QryAssCODICEINST: TIntegerField
      FieldName = 'CODICEINST'
    end
    object QryAssRIFINST: TStringField
      FieldName = 'RIFINST'
      Size = 80
    end
    object QryAssTELEFONOINST: TStringField
      FieldName = 'TELEFONOINST'
      Size = 30
    end
    object QryAssCELLULAREINST: TStringField
      FieldName = 'CELLULAREINST'
      Size = 30
    end
    object QryAssEXIST_PRESCRIZIONI: TStringField
      FieldName = 'EXIST_PRESCRIZIONI'
      Size = 1
    end
    object QryAssEXIST_URGENTI: TStringField
      FieldName = 'EXIST_URGENTI'
      Size = 1
    end
    object QryAssEXIST_CHIAMATE: TStringField
      FieldName = 'EXIST_CHIAMATE'
      Size = 1
    end
    object QryAssEXIST_ALLEGATITOSEND: TStringField
      FieldName = 'EXIST_ALLEGATITOSEND'
      Size = 1
    end
    object QryAssEXIST_RIFDOC_CORRISPNOPAG: TStringField
      FieldName = 'EXIST_RIFDOC_CORRISPNOPAG'
      Size = 1
    end
    object QryAssEXIST_SCADSOFF: TStringField
      FieldName = 'EXIST_SCADSOFF'
      Size = 1
    end
    object QryAssSTR_CERTIFIED_IMM: TStringField
      FieldName = 'STR_CERTIFIED_IMM'
      Size = 1
    end
    object QryAssRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QryAssRESOURCENAME: TStringField
      FieldName = 'RESOURCENAME'
      Size = 255
    end
    object QryAssCOMPUTED_CONTRATTO_SCADUTO: TStringField
      FieldName = 'COMPUTED_CONTRATTO_SCADUTO'
      ReadOnly = True
      Size = 1
    end
    object QryAssCOMPUTED_STATO: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_STATO'
      Calculated = True
    end
    object QryAssCOMPUTED_NOTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_NOTE'
      Size = 1100
      Calculated = True
    end
    object QryAssHIGHLIGHTS: TStringField
      FieldName = 'HIGHLIGHTS'
      Size = 1000
    end
  end
  object SourceAss: TDataSource
    AutoEdit = False
    DataSet = QryAss
    Left = 130
    Top = 188
  end
  object MenuAssistenze: TPopupMenu
    Left = 160
    Top = 188
    object Centraletermica1: TMenuItem
      Caption = 'Centrale termica   (Pot. >= 35 kW)'
    end
    object Riscaldamento1: TMenuItem
      Caption = 'Riscaldamento   (caldaia < 35 kW)'
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object Climatizzazione1: TMenuItem
      Caption = 'Climatizzazione'
    end
    object Refrigerazione1: TMenuItem
      Caption = 'Refrigerazione'
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object Generico1: TMenuItem
      Caption = 'Generico'
    end
  end
  object TransAss: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 72
    Top = 188
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = GridAssistenze
    PopupMenus = <
      item
        GridView = btvAssistenze
        HitTypes = [gvhtBandHeader]
        Index = 0
        PopupMenu = BandHeaderMenu
      end>
    UseBuiltInPopupMenus = False
    AlwaysFireOnPopup = True
    Left = 360
    Top = 4
  end
  object BandHeaderMenu: TPopupMenu
    OnPopup = BandHeaderMenuPopup
    Left = 389
    Top = 4
    object BandHeaderMenuItemFissaNONE: TMenuItem
      Caption = 'Normale'
      Checked = True
      GroupIndex = 100
      RadioItem = True
      OnClick = BandHeaderMenuItemFissaNONEClick
    end
    object BandHeaderMenuItemFissaSX: TMenuItem
      Caption = 'Fissa a sinistra'
      GroupIndex = 100
      RadioItem = True
      OnClick = BandHeaderMenuItemFissaNONEClick
    end
    object BandHeaderMenuItemFissaDX: TMenuItem
      Caption = 'Fissa a destra'
      GroupIndex = 100
      RadioItem = True
      OnClick = BandHeaderMenuItemFissaNONEClick
    end
  end
  object ImageList_PratApp: TImageList
    Height = 9
    Width = 10
    Left = 320
    Top = 128
    Bitmap = {
      494C01010100030004000A000900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000028000000090000000100200000000000A005
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000028000000090000000100010000000000480000000000000000000000
      000000000000000000000000FFFFFF009F000000000000008E00000000000000
      C440000000000000E0C0000000000000F1C0000000000000E0C0000000000000
      C4400000000000008E000000000000009F000000000000000000000000000000
      0000000000000000000000000000}
  end
  object QryOP: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRATICA'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM OPPRATICA'
      'WHERE'
      '   ID = :OLD_ID'
      '')
    EditSQL.Strings = (
      'UPDATE OPPRATICA SET'
      '      ID = :ID,'
      '      IDPRATICA = :IDPRATICA,'
      '      IDAPPARECCHIOPRAT = :IDAPPARECCHIOPRAT,'
      '      IDOP = :IDOP,'
      '      DESCRIZIONE = :DESCRIZIONE,'
      '      NOTE = :NOTE,'
      '      PERIODICITA = :PERIODICITA,'
      '      MINUTIPREVISTI = :MINUTIPREVISTI,'
      '      ULTIMA = :ULTIMA,'
      '      PROSSIMA = :PROSSIMA,'
      '      PRZUNIT = :PRZUNIT,'
      '      ADDEBITA = :ADDEBITA,'
      '      INABBONAMENTO = :INABBONAMENTO,'
      '      GG_AUTOSEL = :GG_AUTOSEL'
      ''
      'WHERE ID = :OLD_ID')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    InsertSQL.Strings = (
      'INSERT INTO OPPRATICA'
      '('
      '      ID,'
      '      IDPRATICA,'
      '      IDAPPARECCHIOPRAT,'
      '      IDOP,'
      '      DESCRIZIONE,'
      '      NOTE,'
      '      PERIODICITA,'
      '      MINUTIPREVISTI,'
      '      ULTIMA,'
      '      PROSSIMA,'
      '      PRZUNIT,'
      '      ADDEBITA,'
      '      INABBONAMENTO,'
      '      GG_AUTOSEL'
      ')'
      'VALUES'
      '('
      '      :ID,'
      '      :IDPRATICA,'
      '      :IDAPPARECCHIOPRAT,'
      '      :IDOP,'
      '      :DESCRIZIONE,'
      '      :NOTE,'
      '      :PERIODICITA,'
      '      :MINUTIPREVISTI,'
      '      :ULTIMA,'
      '      :PROSSIMA,'
      '      :PRZUNIT,'
      '      :ADDEBITA,'
      '      :INABBONAMENTO,'
      '      :GG_AUTOSEL'
      ')'
      ''
      '')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT OPP.*, PA.TIPOAPPARECCHIO, PA.COSTRUTTORE, PA.MODELLO, PA' +
        '.MATRICOLA, PA.UBICAZIONE,'
      
        '  (SELECT COUNT(*) FROM PRATAPPARECCHI PA2 WHERE PA2.IDPRATICA =' +
        ' OPP.IDPRATICA) AS NUMAPPARECCHI'
      'FROM OPPRATICA OPP'
      'LEFT JOIN PRATAPPARECCHI PA ON (PA.ID = OPP.IDAPPARECCHIOPRAT)'
      'WHERE OPP.IDPRATICA = :IDPRATICA'
      '  AND COALESCE(PA.DISMESSO,'#39'F'#39') <> '#39'T'#39
      '')
    FieldOptions = []
    Left = 101
    Top = 254
    object QryOPID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryOPIDPRATICA: TIntegerField
      FieldName = 'IDPRATICA'
    end
    object QryOPIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryOPIDOP: TStringField
      FieldName = 'IDOP'
      Size = 25
    end
    object QryOPDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 60
    end
    object QryOPNOTE: TStringField
      FieldName = 'NOTE'
      Size = 1000
    end
    object QryOPPERIODICITA: TIntegerField
      FieldName = 'PERIODICITA'
    end
    object QryOPMINUTIPREVISTI: TIntegerField
      FieldName = 'MINUTIPREVISTI'
    end
    object QryOPULTIMA: TDateTimeField
      FieldName = 'ULTIMA'
    end
    object QryOPPROSSIMA: TDateTimeField
      FieldName = 'PROSSIMA'
    end
    object QryOPPRZUNIT: TIBOFloatField
      FieldName = 'PRZUNIT'
      currency = True
    end
    object QryOPPRZUNITNETTOIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITNETTOIVACOMP'
      currency = True
    end
    object QryOPADDEBITA: TStringField
      FieldName = 'ADDEBITA'
      Size = 1
    end
    object QryOPGG_AUTOSEL: TSmallintField
      FieldName = 'GG_AUTOSEL'
    end
    object QryOPTIPOAPPARECCHIO: TStringField
      FieldName = 'TIPOAPPARECCHIO'
      Size = 30
    end
    object QryOPCOSTRUTTORE: TStringField
      FieldName = 'COSTRUTTORE'
      Size = 45
    end
    object QryOPMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 30
    end
    object QryOPMATRICOLA: TStringField
      FieldName = 'MATRICOLA'
      Size = 30
    end
    object QryOPUBICAZIONE: TStringField
      FieldName = 'UBICAZIONE'
      Size = 30
    end
    object QryOPINABBONAMENTO: TStringField
      FieldName = 'INABBONAMENTO'
      Size = 1
    end
    object QryOPNUMAPPARECCHI: TIntegerField
      FieldName = 'NUMAPPARECCHI'
      ReadOnly = True
    end
  end
  object SourceOP: TDataSource
    AutoEdit = False
    DataSet = QryOP
    Left = 130
    Top = 254
  end
  object QryIntPrec: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPRATICA1'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    OnCalcFields = QryIntPrecCalcFields
    SQL.Strings = (
      'SELECT'
      ' UIV.MASTER_ID'
      ',UIV.TIPORECORD'
      ',UIV.TIPODOC'
      ',UIV.NUMDOC'
      ',UIV.REGDOC'
      ',UIV.DATADOC'
      ',UIV.CODICE'
      ',UIV.DESCRIZIONE'
      ',UIV.UM'
      ',UIV.QTA'
      ',UIV.PRZUNIT'
      ',UIV.PRZUNITIVACOMP'
      ',UIV.S1'
      ',UIV.S2'
      ',UIV.S3'
      ',UIV.IMPORTO'
      ',UIV.IMPORTOIVACOMP'
      ',UIV.TECNICO_NOME'
      ',UIV.IDAPPARECCHIOPRAT'
      
        ',CAST((COALESCE(PA.COSTRUTTORE,'#39#39') || '#39' '#39' || COALESCE(PA.MODELLO' +
        ','#39#39') || '#39' ('#39' ||COALESCE( PA.MATRICOLA,'#39#39') || '#39') '#39' || COALESCE(PA' +
        '.UBICAZIONE,'#39#39')) AS VARCHAR(200)) AS APPARECCHIO_FULL'
      ',UIV.PRATICA'
      ',UIV.DATAPRATICA1'
      ',UIV.GUID'
      ',UIV.IDALLEGATOFG'
      ',UIV.INABBONAMENTO'
      ',UIV.RifDoc_Tipo'
      ',UIV.RifDoc_Num'
      ',UIV.RifDoc_Reg'
      ',UIV.RifDoc_Data'
      ',UIV.RifDoc_CorrispNoPag'
      ',UIV.RifDoc_TotaleDocumento'
      'FROM IMP_ULTIMI_INTERVENTI_VIEW UIV'
      'LEFT JOIN PRATAPPARECCHI PA ON (PA.ID=UIV.IDAPPARECCHIOPRAT)'
      'WHERE'
      '     (UIV.PRATICA = :PRATICA)'
      ' AND (UIV.DATAPRATICA1 = :DATAPRATICA1)'
      '-- AND (COALESCE(PA.DISMESSO,'#39'F'#39') <> '#39'T'#39')'
      
        'ORDER BY UIV.DATADOC DESC, UIV.MASTER_ID DESC, UIV.IDAPPARECCHIO' +
        'PRAT DESC, UIV.TIPORECORD'
      ''
      '')
    FieldOptions = []
    Left = 101
    Top = 286
    object QryIntPrecTIPORECORD: TStringField
      FieldName = 'TIPORECORD'
      Size = 25
    end
    object QryIntPrecMASTER_ID: TIntegerField
      FieldName = 'MASTER_ID'
    end
    object QryIntPrecTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 25
    end
    object QryIntPrecNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object QryIntPrecREGDOC: TStringField
      FieldName = 'REGDOC'
      Size = 5
    end
    object QryIntPrecDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryIntPrecCODICE: TStringField
      FieldName = 'CODICE'
      Size = 25
    end
    object QryIntPrecDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 5000
    end
    object QryIntPrecUM: TStringField
      FieldName = 'UM'
      Size = 2
    end
    object QryIntPrecQTA: TIBOFloatField
      FieldName = 'QTA'
    end
    object QryIntPrecPRZUNIT: TIBOFloatField
      FieldName = 'PRZUNIT'
    end
    object QryIntPrecPRZUNITIVACOMP: TIBOFloatField
      FieldName = 'PRZUNITIVACOMP'
    end
    object QryIntPrecS1: TIBOFloatField
      FieldName = 'S1'
    end
    object QryIntPrecS2: TIBOFloatField
      FieldName = 'S2'
    end
    object QryIntPrecS3: TIBOFloatField
      FieldName = 'S3'
    end
    object QryIntPrecIMPORTO: TIBOFloatField
      FieldName = 'IMPORTO'
    end
    object QryIntPrecIMPORTOIVACOMP: TIBOFloatField
      FieldName = 'IMPORTOIVACOMP'
    end
    object QryIntPrecTECNICO_NOME: TStringField
      FieldName = 'TECNICO_NOME'
      Size = 255
    end
    object QryIntPrecIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryIntPrecCALC_PRZUNITNETTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_PRZUNITNETTO'
      Calculated = True
    end
    object QryIntPrecCALC_PRZUNITIVACOMPNETTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_PRZUNITIVACOMPNETTO'
      Calculated = True
    end
    object QryIntPrecPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryIntPrecDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryIntPrecAPPARECCHIO_FULL: TStringField
      FieldName = 'APPARECCHIO_FULL'
      ReadOnly = True
      Size = 200
    end
    object QryIntPrecGUID: TStringField
      FieldName = 'GUID'
      Size = 40
    end
    object QryIntPrecIDALLEGATOFG: TIntegerField
      FieldName = 'IDALLEGATOFG'
    end
    object QryIntPrecINABBONAMENTO: TStringField
      FieldName = 'INABBONAMENTO'
      Size = 1
    end
    object QryIntPrecRIFDOC_TIPO: TStringField
      FieldName = 'RIFDOC_TIPO'
      Size = 25
    end
    object QryIntPrecRIFDOC_NUM: TIntegerField
      FieldName = 'RIFDOC_NUM'
    end
    object QryIntPrecRIFDOC_REG: TStringField
      FieldName = 'RIFDOC_REG'
      Size = 5
    end
    object QryIntPrecRIFDOC_DATA: TDateTimeField
      FieldName = 'RIFDOC_DATA'
    end
    object QryIntPrecRIFDOC_CORRISPNOPAG: TStringField
      FieldName = 'RIFDOC_CORRISPNOPAG'
      Size = 1
    end
    object QryIntPrecRIFDOC_TOTALEDOCUMENTO: TIBOFloatField
      FieldName = 'RIFDOC_TOTALEDOCUMENTO'
      currency = True
    end
  end
  object SourceIntPrec: TDataSource
    AutoEdit = False
    DataSet = QryIntPrec
    Left = 130
    Top = 286
  end
  object QryPresc: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPRATICA1'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    EditSQL.Strings = (
      'UPDATE CLIENTI SET'
      'CODICE=CODICE'
      'WHERE 1=2')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      '  P.UNIQUEKEYFIELD,'
      '  P.TIPORECORD,'
      '  P.IDIMPEGNO,'
      '  P.IDALLEGATO,'
      '  P.IDAPPARECCHIOPRAT,'
      '  P.DATADOC,'
      '  P.CODICE,'
      '  P.DESCRIZIONE,'
      '  P.FATTO,'
      '  P.FATTO_DATA,'
      '  P.FATTO_NOTE,'
      '  P.TECNICO_NOME,'
      '  P.PRATICA,'
      '  P.DATAPRATICA1,'
      
        '  CAST((PA.COSTRUTTORE || '#39' '#39' || PA.MODELLO || '#39' ('#39' || PA.MATRIC' +
        'OLA || '#39') '#39' || PA.UBICAZIONE) AS VARCHAR(200)) AS APPARECCHIO_FU' +
        'LL'
      'FROM IMP_PRESCRIZIONI_VIEW P'
      'LEFT JOIN PRATAPPARECCHI PA ON (PA.ID=P.IDAPPARECCHIOPRAT)'
      'WHERE'
      '     (P.PRATICA = :PRATICA)'
      ' AND (P.DATAPRATICA1 = :DATAPRATICA1)'
      'ORDER BY P.DATADOC DESC, P.TIPORECORD'
      '')
    FieldOptions = []
    Left = 101
    Top = 318
    object QryPrescTIPORECORD: TStringField
      FieldName = 'TIPORECORD'
      Size = 25
    end
    object QryPrescIDIMPEGNO: TIntegerField
      FieldName = 'IDIMPEGNO'
    end
    object QryPrescIDALLEGATO: TIntegerField
      FieldName = 'IDALLEGATO'
    end
    object QryPrescCODICE: TStringField
      FieldName = 'CODICE'
      Size = 25
    end
    object QryPrescDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 5000
    end
    object QryPrescTECNICO_NOME: TStringField
      FieldName = 'TECNICO_NOME'
      Size = 255
    end
    object QryPrescDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryPrescUNIQUEKEYFIELD: TStringField
      FieldName = 'UNIQUEKEYFIELD'
      KeyFields = 'IDAPPARECCHIOPRAT'
      Size = 100
    end
    object QryPrescIDAPPARECCHIOPRAT: TIntegerField
      FieldName = 'IDAPPARECCHIOPRAT'
    end
    object QryPrescFATTO: TStringField
      FieldName = 'FATTO'
      Size = 1
    end
    object QryPrescFATTO_DATA: TDateTimeField
      FieldName = 'FATTO_DATA'
    end
    object QryPrescFATTO_NOTE: TStringField
      FieldName = 'FATTO_NOTE'
      Size = 60
    end
    object QryPrescPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryPrescDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryPrescAPPARECCHIO_FULL: TStringField
      FieldName = 'APPARECCHIO_FULL'
      ReadOnly = True
      Size = 200
    end
  end
  object SourcePresc: TDataSource
    DataSet = QryPresc
    Left = 130
    Top = 318
  end
  object QryImp: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'PRATICA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPRATICA1'
        ParamType = ptInput
      end>
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM IMPEGNI WHERE ID = :ID')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT'
      '   I.ID,'
      '   I.ParentID,'
      '   I.TipoImpegno,'
      '   I.EventMessage,'
      '   I.START_EVENT,'
      '   I.Location,'
      '   I.TipoIntervento,'
      '   I.DataOraChiamata,'
      
        '   CAST((SELECT T.RESOURCENAME FROM TECNICI T WHERE T.RESOURCEID' +
        ' = I.RESOURCEID) || '#39'  ('#39' || I.RESOURCEID || '#39')'#39' AS VARCHAR(100)' +
        ') AS TECNICO,'
      '   I.Registro,'
      '   I.PRATICA,'
      '   I.DATAPRATICA1,'
      ''
      
        '   CAST(   (CASE WHEN (I.TIPOIMPEGNO<>'#39'Intervento'#39' AND I.URGENTE' +
        '='#39'T'#39') THEN '#39'T'#39' ELSE '#39'F'#39' END)   AS CHAR(1)) AS EXISTS_URGENTI,'
      '   I.STAMPATO AS EXISTS_STAMPATO'
      ''
      'FROM IMPEGNI I'
      'WHERE'
      '     (I.PRATICA = :PRATICA)'
      ' AND (I.DATAPRATICA1 = :DATAPRATICA1)'
      ' AND (I.TIPOIMPEGNO <> '#39'Intervento'#39')'
      '')
    FieldOptions = []
    Left = 101
    Top = 350
    object QryImpID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryImpPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object QryImpTIPOIMPEGNO: TStringField
      FieldName = 'TIPOIMPEGNO'
      Size = 25
    end
    object QryImpEVENTMESSAGE: TStringField
      FieldName = 'EVENTMESSAGE'
      Size = 255
    end
    object QryImpSTART: TDateTimeField
      FieldName = 'START_EVENT'
    end
    object QryImpLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 255
    end
    object QryImpTIPOINTERVENTO: TStringField
      FieldName = 'TIPOINTERVENTO'
      Size = 100
    end
    object QryImpDATAORACHIAMATA: TDateTimeField
      FieldName = 'DATAORACHIAMATA'
    end
    object QryImpTECNICO: TStringField
      FieldName = 'TECNICO'
      ReadOnly = True
      Size = 100
    end
    object QryImpREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 5
    end
    object QryImpPRATICA: TIntegerField
      FieldName = 'PRATICA'
    end
    object QryImpDATAPRATICA1: TDateTimeField
      FieldName = 'DATAPRATICA1'
    end
    object QryImpEXISTS_URGENTI: TStringField
      FieldName = 'EXISTS_URGENTI'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object QryImpEXISTS_STAMPATO: TStringField
      FieldName = 'EXISTS_STAMPATO'
      Size = 1
    end
  end
  object SourceImp: TDataSource
    AutoEdit = False
    DataSet = QryImp
    Left = 130
    Top = 350
  end
  object QryPratApp: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRATICA'
        ParamType = ptInput
      end>
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    EditSQL.Strings = (
      
        'EXECUTE PROCEDURE  IMPAPPSEL_SETAPPSEL (:MASTER_ID, :ID, :SELECT' +
        'ED)')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAss
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    OnCalcFields = QryPratAppCalcFields
    SQL.Strings = (
      
        'SELECT PA.ID, PA.COSTRUTTORE, PA.MODELLO, PA.MATRICOLA, PA.UBICA' +
        'ZIONE, PA.TIPOAPPARECCHIO,'
      
        ' PA.ANNOCOSTRUZIONE, PA.DATAINSTALLAZIONE, PA.DATACOLLAUDO, PA.I' +
        'DAPPABBINATO, PA.GARANZIA_SCADENZA, PA.GARANZIA_NOTE,'
      
        ' PA.POTENZATERMICA, PA.POTENZATERMICA2, PA.TIPOCAMERA, PA.COMBUS' +
        'TIBILE, PA.COMBUSTIBILEALTRO, PA.GARANZIA_MESI, PA.GARANZIA_MESI' +
        '_ESTENSIONE,'
      
        ' PA.DISMESSO, PA.DISMESSO_DATA, PA.DISMESSO_NOTE, PA.VOLTAGGIOEL' +
        'ETTRICO, PA.POTENZAELETTRICA, PA.PORTATA, PA.PREVALENZA,'
      ' PA.REFRIGERANTE, PA.CARICA, PA.POTENZAFRIGORIFERA, PA.IDPRATICA'
      'FROM PRATAPPARECCHI PA'
      'WHERE PA.IDPRATICA = :IDPRATICA'
      '')
    FieldOptions = []
    Left = 101
    Top = 221
    object QryPratAppID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryPratAppCOSTRUTTORE: TStringField
      FieldName = 'COSTRUTTORE'
      Size = 45
    end
    object QryPratAppMODELLO: TStringField
      FieldName = 'MODELLO'
      Size = 30
    end
    object QryPratAppMATRICOLA: TStringField
      FieldName = 'MATRICOLA'
      Size = 30
    end
    object QryPratAppUBICAZIONE: TStringField
      FieldName = 'UBICAZIONE'
      Size = 30
    end
    object QryPratAppTIPOAPPARECCHIO: TStringField
      FieldName = 'TIPOAPPARECCHIO'
      Size = 30
    end
    object QryPratAppANNOCOSTRUZIONE: TIntegerField
      Alignment = taCenter
      FieldName = 'ANNOCOSTRUZIONE'
    end
    object QryPratAppDATAINSTALLAZIONE: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATAINSTALLAZIONE'
    end
    object QryPratAppDATACOLLAUDO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATACOLLAUDO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QryPratAppDISMESSO: TStringField
      FieldName = 'DISMESSO'
      Size = 1
    end
    object QryPratAppIDAPPABBINATO: TIntegerField
      FieldName = 'IDAPPABBINATO'
    end
    object QryPratAppCOMPUTED_APPARECCHIO_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_APPARECCHIO_FULL'
      Size = 200
      Calculated = True
    end
    object QryPratAppCOMPUTED_ABBINATO: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ABBINATO'
      Calculated = True
    end
    object QryPratAppCOMPUTED_ORDER1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ORDER1'
      Calculated = True
    end
    object QryPratAppCOMPUTED_ORDER2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_ORDER2'
      Calculated = True
    end
    object QryPratAppPOTENZATERMICA: TIBOFloatField
      FieldName = 'POTENZATERMICA'
    end
    object QryPratAppPOTENZATERMICA2: TIBOFloatField
      FieldName = 'POTENZATERMICA2'
    end
    object QryPratAppTIPOCAMERA: TStringField
      FieldName = 'TIPOCAMERA'
    end
    object QryPratAppCOMBUSTIBILE: TStringField
      FieldName = 'COMBUSTIBILE'
    end
    object QryPratAppCOMBUSTIBILEALTRO: TStringField
      FieldName = 'COMBUSTIBILEALTRO'
    end
    object QryPratAppGARANZIA_SCADENZA: TDateTimeField
      FieldName = 'GARANZIA_SCADENZA'
    end
    object QryPratAppGARANZIA_NOTE: TStringField
      FieldName = 'GARANZIA_NOTE'
      Size = 100
    end
    object QryPratAppGARANZIA_MESI: TSmallintField
      FieldName = 'GARANZIA_MESI'
    end
    object QryPratAppGARANZIA_MESI_ESTENSIONE: TSmallintField
      FieldName = 'GARANZIA_MESI_ESTENSIONE'
    end
    object QryPratAppDISMESSO_DATA: TDateTimeField
      FieldName = 'DISMESSO_DATA'
    end
    object QryPratAppCOMPUTED_INGARANZIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_INGARANZIA'
      Size = 1
      Calculated = True
    end
    object QryPratAppDISMESSO_NOTE: TStringField
      FieldName = 'DISMESSO_NOTE'
      Size = 100
    end
    object QryPratAppVOLTAGGIOELETTRICO: TIntegerField
      FieldName = 'VOLTAGGIOELETTRICO'
    end
    object QryPratAppPOTENZAELETTRICA: TIBOFloatField
      FieldName = 'POTENZAELETTRICA'
    end
    object QryPratAppPORTATA: TIBOFloatField
      FieldName = 'PORTATA'
    end
    object QryPratAppPREVALENZA: TIBOFloatField
      FieldName = 'PREVALENZA'
    end
    object QryPratAppREFRIGERANTE: TStringField
      FieldName = 'REFRIGERANTE'
    end
    object QryPratAppCARICA: TIBOFloatField
      FieldName = 'CARICA'
    end
    object QryPratAppPOTENZAFRIGORIFERA: TIBOFloatField
      FieldName = 'POTENZAFRIGORIFERA'
    end
    object QryPratAppCOMPUTED_GARANZIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_GARANZIA'
      Size = 100
      Calculated = True
    end
    object QryPratAppCOMPUTED_GARANZIA_NOTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_GARANZIA_NOTE'
      Size = 100
      Calculated = True
    end
    object QryPratAppIDPRATICA: TIntegerField
      FieldName = 'IDPRATICA'
    end
  end
  object SourcePratApp: TDataSource
    AutoEdit = False
    DataSet = QryPratApp
    Left = 130
    Top = 221
  end
  object dxPrinter: TdxComponentPrinter
    CurrentLink = GridImpiantiLink
    PreviewOptions.Caption = 'Anteprima di Stampa'
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    Version = 0
    OnCustomDrawPageFooter = dxPrinterCustomDrawPageFooter
    OnCustomDrawPageHeader = dxPrinterCustomDrawPageHeader
    Left = 496
    Top = 16
    object GridImpiantiLink: TdxGridReportLink
      Active = True
      Component = GridAssistenze
      PageNumberFormat = pnfNumeral
      PrinterPage.CenterOnPageH = True
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 14000
      PrinterPage.GrayShading = True
      PrinterPage.Header = 14000
      PrinterPage.Margins.Bottom = 22000
      PrinterPage.Margins.Left = 14000
      PrinterPage.Margins.Right = 14000
      PrinterPage.Margins.Top = 19000
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = ANSI_CHARSET
      PrinterPage.PageFooter.Font.Color = clBlue
      PrinterPage.PageFooter.Font.Height = -8
      PrinterPage.PageFooter.Font.Name = 'Arial'
      PrinterPage.PageFooter.Font.Style = [fsItalic]
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '')
      PrinterPage.PageHeader.Font.Charset = ANSI_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlue
      PrinterPage.PageHeader.Font.Height = -13
      PrinterPage.PageHeader.Font.Name = 'Arial'
      PrinterPage.PageHeader.Font.Style = [fsBold, fsItalic]
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleFactor = 80
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44178.474072916670000000
      ReportDocument.Creator = 'Mauri Fly'
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -13
      ReportTitle.Font.Name = 'Arial'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Mode = tmNone
      ReportTitle.Text = 'Impianti / Contratti'
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsCards.Shadow.Color = clBlack
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      SupportedCustomDraw = True
      OnCustomDrawBandCell = GridImpiantiLinkCustomDrawBandCell
      OnCustomDrawCell = GridImpiantiLinkCustomDrawCell
      OnCustomDrawHeaderCell = GridImpiantiLinkCustomDrawHeaderCell
      BuiltInReportLink = True
    end
  end
  object TimerAddMemoryGC: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerAddMemoryGCTimer
    Left = 184
    Top = 288
  end
  object MenuElencoClienti: TPopupMenu
    Left = 200
    Top = 65534
    object Esportainformatotesto1: TMenuItem
      Caption = 'Esporta in formato testo'
      OnClick = Esportainformatotesto1Click
    end
    object EsportainformatoExcel1: TMenuItem
      Caption = 'Esporta in formato Excel'
      OnClick = EsportainformatoExcel1Click
    end
  end
end
