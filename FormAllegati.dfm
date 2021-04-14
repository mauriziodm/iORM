object AllegatiForm: TAllegatiForm
  Left = 282
  Top = 536
  BorderStyle = bsNone
  Caption = 'AllegatiForm'
  ClientHeight = 267
  ClientWidth = 797
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = 16772332
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      797
      32)
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 797
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Pen.Color = 16761281
    end
    object dbNavAppend: TcxDBNavigator
      Left = 7
      Top = 7
      Width = 84
      Height = 25
      Cursor = crHandPoint
      Buttons.CustomButtons = <>
      Buttons.First.Visible = False
      Buttons.PriorPage.Visible = False
      Buttons.Prior.Visible = False
      Buttons.Next.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Last.Visible = False
      Buttons.Insert.Visible = False
      Buttons.Append.Visible = True
      Buttons.Delete.Visible = False
      Buttons.Edit.Visible = False
      Buttons.Cancel.Visible = True
      Buttons.Refresh.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = SourceAllegati
      LookAndFeel.Kind = lfOffice11
      Ctl3D = False
      ParentCtl3D = False
      PopupMenu = ExtFilesMenu
      TabOrder = 0
    end
    object dbNavRefresh: TcxDBNavigator
      Left = 94
      Top = 7
      Width = 66
      Height = 25
      Cursor = crHandPoint
      Buttons.CustomButtons = <>
      Buttons.First.Visible = False
      Buttons.PriorPage.Visible = False
      Buttons.Prior.Visible = False
      Buttons.Next.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Last.Visible = False
      Buttons.Insert.Visible = False
      Buttons.Delete.Visible = False
      Buttons.Edit.Visible = False
      Buttons.Post.Visible = False
      Buttons.Cancel.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = SourceAllegati
      LookAndFeel.Kind = lfOffice11
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object dbNavDelete: TcxDBNavigator
      Left = 166
      Top = 11
      Width = 19
      Height = 21
      Cursor = crHandPoint
      Buttons.CustomButtons = <>
      Buttons.First.Visible = False
      Buttons.PriorPage.Visible = False
      Buttons.Prior.Visible = False
      Buttons.Next.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Last.Visible = False
      Buttons.Insert.Visible = False
      Buttons.Delete.Visible = True
      Buttons.Edit.Visible = False
      Buttons.Post.Visible = False
      Buttons.Cancel.Visible = False
      Buttons.Refresh.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = SourceAllegati
      LookAndFeel.Kind = lfOffice11
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object PanelFilters1: TPanel
      Left = 516
      Top = 6
      Width = 274
      Height = 25
      BevelOuter = bvNone
      Color = 16037544
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      DesignSize = (
        274
        25)
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 274
        Height = 25
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 5592405
        ExplicitWidth = 222
      end
      object Shape3: TShape
        Left = 1
        Top = 1
        Width = 272
        Height = 23
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Style = bsClear
        Pen.Color = 16772332
        ExplicitWidth = 220
      end
      object sbFilterSoggetto: TSpeedButton
        Left = 36
        Top = 3
        Width = 52
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 102
        Caption = 'Soggetto'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbFilterSoggettoClick
      end
      object sbFilterPratica: TSpeedButton
        Left = 89
        Top = 3
        Width = 64
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 103
        Caption = 'Cant./Imp.'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbFilterSoggettoClick
      end
      object sbFilterDocumento: TSpeedButton
        Left = 154
        Top = 3
        Width = 65
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 104
        Caption = 'Documento'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbFilterSoggettoClick
      end
      object sbFilterNulla: TSpeedButton
        Left = 3
        Top = 3
        Width = 32
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 101
        Caption = 'Nulla'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbFilterSoggettoClick
      end
      object sbFilterArticolo: TSpeedButton
        Left = 220
        Top = 3
        Width = 51
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 104
        Caption = 'Articolo'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbFilterSoggettoClick
      end
    end
    object PanelTrova: TPanel
      Left = 248
      Top = 6
      Width = 173
      Height = 25
      BevelOuter = bvNone
      Color = 16037544
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      DesignSize = (
        173
        25)
      object Shape4: TShape
        Left = 0
        Top = 0
        Width = 173
        Height = 25
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 5592405
      end
      object Shape5: TShape
        Left = 1
        Top = 1
        Width = 171
        Height = 23
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Style = bsClear
        Pen.Color = 16772332
      end
      object Label1: TLabel
        Left = 7
        Top = 6
        Width = 28
        Height = 12
        Caption = 'Trova'
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object eFilterTrova: TcxTextEdit
        Left = 40
        Top = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.OnChange = eFilterTrovaPropertiesChange
        Style.BorderColor = 10329501
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 5066061
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 112
      end
      object PanelCancel: TPanel
        Left = 153
        Top = 4
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object sbResetFilter: TBitBtn
          Left = -1
          Top = -5
          Width = 17
          Height = 28
          Cancel = True
          Enabled = False
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
          TabOrder = 0
          OnClick = sbResetFilterClick
        end
      end
    end
    object PanelAlarm: TPanel
      Left = 489
      Top = 6
      Width = 27
      Height = 25
      BevelOuter = bvNone
      Color = 16037544
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 5
      DesignSize = (
        27
        25)
      object Shape6: TShape
        Left = 0
        Top = 0
        Width = 27
        Height = 25
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 5592405
      end
      object Shape7: TShape
        Left = 1
        Top = 1
        Width = 25
        Height = 23
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Style = bsClear
        Pen.Color = 16772332
      end
      object sbAlarm: TSpeedButton
        Left = 3
        Top = 3
        Width = 21
        Height = 19
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 105
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7274496
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555505555555555555557F555555555555550055555
          55555555577F55FFF555555550005570755555555777F5878F55555550000500
          05555555F7777F777F5555557007007075555555877877878F555555007B7005
          5555555F778F877F5555555700BBB7005555555877F55877F555555007BBBB70
          0555555778F555877F5555500BBBBB70005555577F55558777F555500BBB7000
          000555577F55877777755500000000075555557777777778F555550500000755
          5555557F777778F5555555000555555555555577755555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbAlarmClick
      end
    end
  end
  object GridAllegati: TcxGrid
    Left = 0
    Top = 32
    Width = 797
    Height = 235
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 1
    OnDragOver = GridAllegatiDragOver
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object cvAllegati: TcxGridDBCardView
      DragMode = dmAutomatic
      OnDragDrop = cvAllegatiDragDrop
      OnDragOver = cvAllegatiDragOver
      OnEndDrag = cvAllegatiEndDrag
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      OnEditing = cvAllegatiEditing
      DataController.DataSource = SourceAllegati
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.KeyFieldNames = 'ANNOPROT;NUMPROT;REVPROT'
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDataChanged = cvAllegatiDataControllerDataChanged
      OptionsBehavior.DragDropText = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.CardSizing = False
      OptionsCustomize.RowFiltering = False
      OptionsSelection.CardBorderSelection = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NavigatorOffset = 2
      OptionsView.NoDataToDisplayInfoText = 'Nessun dato da visualizzare'
      OptionsView.ScrollBars = ssHorizontal
      OptionsView.CaptionSeparator = #0
      OptionsView.CardBorderWidth = 1
      OptionsView.CardIndent = 5
      OptionsView.CategoryIndent = 0
      OptionsView.CategorySeparatorWidth = 0
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorWidth = 0
      RowLayout = rlVertical
      Styles.StyleSheet = DM1.cvEnabledStyleSheet
      object cvAllegatiFULLPROT: TcxGridDBCardViewRow
        Caption = 'Protocollo:'
        DataBinding.FieldName = 'FULLPROT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = False
        OnGetCellHint = cvAllegatiFULLPROTGetCellHint
        OnGetDisplayText = cvAllegatiFULLPROTGetDisplayText
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Options.ShowCaption = False
        Position.BeginsLayer = True
        Styles.Content = DM1.cvEnCardProtocollo
      end
      object cvAllegatiPA_ALLEGA: TcxGridDBCardViewRow
        Caption = 'Fattura PA'
        DataBinding.FieldName = 'PA_ALLEGA'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.UseAlignmentWhenInplace = True
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Position.BeginsLayer = False
        Styles.Content = DM1.cvEnCardProtocollo
        Styles.Caption = DM1.cvEnCardProtocollo
        Styles.CaptionRow = DM1.cvEnCardProtocollo
        Styles.CategoryRow = DM1.cvEnCardProtocollo
      end
      object cvAllegatiNOTE: TcxGridDBCardViewRow
        Caption = 'Oggetto'
        DataBinding.FieldName = 'NOTE'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.VisibleLineCount = 4
        Properties.WantReturns = False
        CaptionAlignmentHorz = taRightJustify
        Options.ShowCaption = False
        Position.BeginsLayer = False
      end
      object cvAllegatiCategory1: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Importa'
            ImageIndex = 2
            Hint = 'Importa file'
            Kind = bkGlyph
            Stretchable = False
            Width = 20
          end
          item
            Caption = 'Esporta'
            ImageIndex = 3
            Hint = 'Esporta file'
            Kind = bkGlyph
            Stretchable = False
            Width = 20
          end
          item
            Caption = 'Apri'
            ImageIndex = 1
            Hint = 'Apri/mostra'
            Kind = bkGlyph
            Stretchable = False
            Width = 20
          end
          item
            Caption = 'Avviso'
            ImageIndex = 4
            Hint = 'Imposta un avviso'
            Kind = bkGlyph
            LeftAlignment = True
            Stretchable = False
            Width = 20
          end>
        Properties.Images = cxImageList1
        Properties.ViewStyle = vsHideCursor
        Properties.OnButtonClick = cvAllegatiCategory1PropertiesButtonClick
        OnCustomDrawCell = cvAllegatiCategory1CustomDrawCell
        CaptionAlignmentHorz = taRightJustify
        Kind = rkCategory
        Options.ShowCaption = False
        Options.ShowEditButtons = isebAlways
        Position.BeginsLayer = False
        Styles.CategoryRow = DM1.cvEnContent
        IsCaptionAssigned = True
      end
      object cvAllegatiFILE_EXT: TcxGridDBCardViewRow
        Caption = 'Tipo file:'
        DataBinding.FieldName = 'FILE_EXT'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiFILE_NAME: TcxGridDBCardViewRow
        Caption = 'Nome file:'
        DataBinding.FieldName = 'FILE_NAME'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiALL_SOGGETTO: TcxGridDBCardViewRow
        Caption = 'Soggetto:'
        DataBinding.FieldName = 'ALL_SOGGETTO'
        PropertiesClassName = 'TcxTextEditProperties'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiALL_RIFPRATICA: TcxGridDBCardViewRow
        Caption = 'Cant./Imp:'
        DataBinding.FieldName = 'ALL_RIFPRATICA'
        PropertiesClassName = 'TcxTextEditProperties'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiALL_DOCUMENTO: TcxGridDBCardViewRow
        Caption = 'Documento:'
        DataBinding.FieldName = 'ALL_DOCUMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiALL_ARTICOLO: TcxGridDBCardViewRow
        Caption = 'Articolo:'
        DataBinding.FieldName = 'ALL_ARTICOLO'
        PropertiesClassName = 'TcxTextEditProperties'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiTRACK_ULTIMAMODIFICA: TcxGridDBCardViewRow
        Caption = 'Ult.modifica:'
        DataBinding.FieldName = 'TRACK_ULTIMAMODIFICA'
        PropertiesClassName = 'TcxTextEditProperties'
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiTRACK_CREAZIONE: TcxGridDBCardViewRow
        Caption = 'Creazione:'
        DataBinding.FieldName = 'TRACK_CREAZIONE'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
        VisibleForCustomization = False
      end
      object cvAllegatiCREAZ_OPERATORE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'CREAZ_OPERATORE'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiCREAZ_DATAORA: TcxGridDBCardViewRow
        DataBinding.FieldName = 'CREAZ_DATAORA'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object cvAllegatiULTMOD_OPERATORE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ULTMOD_OPERATORE'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiULTMOD_DATAORA: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ULTMOD_DATAORA'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiDOC_SOGGETTO: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DOC_SOGGETTO'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiDOC_RIFPRATICA: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DOC_RIFPRATICA'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiNUMPROT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NUMPROT'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = True
      end
      object cvAllegatiANNOPROT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ANNOPROT'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiTIPODOC: TcxGridDBCardViewRow
        DataBinding.FieldName = 'TIPODOC'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiNUMDOC: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NUMDOC'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiREGDOC: TcxGridDBCardViewRow
        DataBinding.FieldName = 'REGDOC'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiDATADOC: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATADOC'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiCODSOGG: TcxGridDBCardViewRow
        DataBinding.FieldName = 'CODSOGG'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiCODPRAT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'CODPRAT'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiDATAPRAT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATAPRAT'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = False
      end
      object cvAllegatiREVPROT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'REVPROT'
        Visible = False
        CaptionAlignmentHorz = taRightJustify
        Options.Focusing = False
        Position.BeginsLayer = True
      end
      object cvAllegatiFILE_BLOB_PRESENT: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FILE_BLOB_PRESENT'
        Visible = False
        Position.BeginsLayer = False
        VisibleForCustomization = False
      end
      object cvAllegatiALARM_DATAORA: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ALARM_DATAORA'
        Visible = False
        Position.BeginsLayer = False
        VisibleForCustomization = False
      end
      object cvAllegatiALARM_FATTO: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ALARM_FATTO'
        Visible = False
        Position.BeginsLayer = False
        VisibleForCustomization = False
      end
      object cvAllegatiCODICEARTICOLO: TcxGridDBCardViewRow
        DataBinding.FieldName = 'CODICEARTICOLO'
        Visible = False
        Position.BeginsLayer = False
      end
    end
    object lvAllegatiCard: TcxGridLevel
      GridView = cvAllegati
    end
  end
  object TransAllegati: TIB_Transaction
    IB_Connection = DM1.DBAzienda
    AutoCommit = True
    Isolation = tiCommitted
    Left = 448
    Top = 57
  end
  object QryAllegati: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM ALLEGATI WHERE'
      '        ANNOPROT = :ANNOPROT'
      '        AND NUMPROT = :NUMPROT'
      '        AND REVPROT = :REVPROT'
      '')
    EditSQL.Strings = (
      'UPDATE ALLEGATI SET'
      ''
      '         NUMPROT = :NUMPROT'
      '        ,REVPROT = :REVPROT'
      '        ,ANNOPROT = :ANNOPROT'
      ''
      '        ,TIPODOC = :TIPODOC'
      '        ,NUMDOC = :NUMDOC'
      '        ,REGDOC = :REGDOC'
      '        ,DATADOC = :DATADOC'
      ''
      '        ,CODSOGG = :CODSOGG'
      ''
      '        ,CODICEARTICOLO = :CODICEARTICOLO'
      ''
      '        ,CODPRAT = :CODPRAT'
      '        ,DATAPRAT = :DATAPRAT'
      ''
      '        ,NOTE = :NOTE'
      '        ,FILE_EXT = :FILE_EXT'
      '        ,FILE_NAME = :FILE_NAME'
      ''
      '        ,CREAZ_OPERATORE = :CREAZ_OPERATORE'
      '        ,CREAZ_DATAORA = :CREAZ_DATAORA'
      ''
      '        ,ULTMOD_OPERATORE = :ULTMOD_OPERATORE'
      '        ,ULTMOD_DATAORA = CURRENT_TIMESTAMP'
      ''
      '        ,ALARM_DATAORA = :ALARM_DATAORA'
      '        ,ALARM_FATTO = :ALARM_FATTO'
      ''
      '        ,PA_ALLEGA = :PA_ALLEGA'
      ''
      'WHERE'
      ''
      '        ANNOPROT = :OLD_ANNOPROT'
      '        AND NUMPROT = :OLD_NUMPROT'
      '        AND REVPROT = :OLD_REVPROT')
    IB_Connection = DM1.DBAzienda
    IB_Transaction = TransAllegati
    InsertSQL.Strings = (
      'INSERT INTO ALLEGATI'
      '      ('
      '       NUMPROT'
      '      ,REVPROT'
      '      ,ANNOPROT'
      ''
      '      ,TIPODOC'
      '      ,NUMDOC'
      '      ,REGDOC'
      '      ,DATADOC'
      ''
      '      ,CODSOGG'
      ''
      '      ,CODICEARTICOLO'
      ''
      '      ,CODPRAT'
      '      ,DATAPRAT'
      ''
      '      ,NOTE'
      '      ,FILE_EXT'
      '      ,FILE_NAME'
      ''
      '      ,CREAZ_OPERATORE'
      '      ,CREAZ_DATAORA'
      ''
      '      ,ULTMOD_OPERATORE'
      '      ,ULTMOD_DATAORA'
      ''
      '      ,ALARM_DATAORA'
      '      ,ALARM_FATTO'
      ''
      '      ,PA_ALLEGA'
      '      )'
      'VALUES'
      '      ('
      '       :NUMPROT'
      '      ,:REVPROT'
      '      ,:ANNOPROT'
      ''
      '      ,:TIPODOC'
      '      ,:NUMDOC'
      '      ,:REGDOC'
      '      ,:DATADOC'
      ''
      '      ,:CODSOGG'
      ''
      '      ,:CODICEARTICOLO'
      ''
      '      ,:CODPRAT'
      '      ,:DATAPRAT'
      ''
      '      ,:NOTE'
      '      ,:FILE_EXT'
      '      ,:FILE_NAME'
      ''
      '      ,:CREAZ_OPERATORE'
      '      ,CURRENT_TIMESTAMP'
      ''
      '      ,:ULTMOD_OPERATORE'
      '      ,:ULTMOD_DATAORA'
      ''
      '      ,:ALARM_DATAORA'
      '      ,:ALARM_FATTO'
      ''
      '      ,:PA_ALLEGA'
      '      )'
      ''
      '')
    RecordCountAccurate = False
    AfterDelete = QryAllegatiAfterDelete
    AfterInsert = QryAllegatiAfterInsert
    AfterOpen = QryAllegatiAfterOpen
    BeforePost = QryAllegatiBeforePost
    AfterPost = QryAllegatiAfterPost
    AfterRefresh = QryAllegatiAfterRefresh
    SQL.Strings = (
      'SELECT A.NUMPROT'
      '      ,A.REVPROT'
      '      ,A.ANNOPROT'
      '      ,A.FULLPROT'
      ''
      '      ,A.TIPODOC'
      '      ,A.NUMDOC'
      '      ,A.REGDOC'
      '      ,A.DATADOC'
      '      ,A.ALL_DOCUMENTO'
      ''
      '      ,A.CODSOGG'
      '      ,A.ALL_SOGGETTO'
      ''
      '      ,A.CODICEARTICOLO'
      '      ,A.ALL_ARTICOLO'
      ''
      '      ,A.CODPRAT'
      '      ,A.DATAPRAT'
      '      ,A.ALL_RIFPRATICA'
      ''
      '      ,A.NOTE'
      '      ,A.FILE_EXT'
      '      ,A.FILE_NAME'
      '      ,A.FILE_BLOB_PRESENT'
      ''
      '      ,A.CREAZ_OPERATORE'
      '      ,A.CREAZ_DATAORA'
      '      ,A.TRACK_CREAZIONE'
      ''
      '      ,A.ULTMOD_OPERATORE'
      '      ,A.ULTMOD_DATAORA'
      '      ,A.TRACK_ULTIMAMODIFICA'
      ''
      '      ,A.DOC_SOGGETTO'
      '      ,A.DOC_RIFPRATICA'
      ''
      '      ,A.ALARM_DATAORA'
      '      ,A.ALARM_FATTO'
      ''
      '      ,A.PA_ALLEGA'
      ''
      'FROM ALLEGATI_VIEW A'
      ''
      ''
      '')
    Left = 477
    Top = 57
    object QryAllegatiNUMPROT: TIntegerField
      FieldName = 'NUMPROT'
    end
    object QryAllegatiREVPROT: TIntegerField
      FieldName = 'REVPROT'
    end
    object QryAllegatiANNOPROT: TStringField
      FieldName = 'ANNOPROT'
      Size = 4
    end
    object QryAllegatiTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 60
    end
    object QryAllegatiNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object QryAllegatiREGDOC: TStringField
      FieldName = 'REGDOC'
      Size = 5
    end
    object QryAllegatiDATADOC: TDateTimeField
      FieldName = 'DATADOC'
    end
    object QryAllegatiALL_DOCUMENTO: TStringField
      FieldName = 'ALL_DOCUMENTO'
      Size = 200
    end
    object QryAllegatiCODSOGG: TIntegerField
      FieldName = 'CODSOGG'
    end
    object QryAllegatiALL_SOGGETTO: TStringField
      FieldName = 'ALL_SOGGETTO'
      Size = 100
    end
    object QryAllegatiCODPRAT: TIntegerField
      FieldName = 'CODPRAT'
    end
    object QryAllegatiDATAPRAT: TDateTimeField
      FieldName = 'DATAPRAT'
    end
    object QryAllegatiALL_RIFPRATICA: TStringField
      FieldName = 'ALL_RIFPRATICA'
      Size = 200
    end
    object QryAllegatiNOTE: TStringField
      FieldName = 'NOTE'
      Size = 250
    end
    object QryAllegatiFILE_EXT: TStringField
      FieldName = 'FILE_EXT'
      Size = 10
    end
    object QryAllegatiFILE_NAME: TStringField
      FieldName = 'FILE_NAME'
      Size = 250
    end
    object QryAllegatiFILE_BLOB_PRESENT: TStringField
      FieldName = 'FILE_BLOB_PRESENT'
      Size = 1
    end
    object QryAllegatiCREAZ_OPERATORE: TStringField
      FieldName = 'CREAZ_OPERATORE'
      Size = 10
    end
    object QryAllegatiCREAZ_DATAORA: TDateTimeField
      FieldName = 'CREAZ_DATAORA'
    end
    object QryAllegatiTRACK_CREAZIONE: TStringField
      FieldName = 'TRACK_CREAZIONE'
      Size = 40
    end
    object QryAllegatiULTMOD_OPERATORE: TStringField
      FieldName = 'ULTMOD_OPERATORE'
      Size = 10
    end
    object QryAllegatiULTMOD_DATAORA: TDateTimeField
      FieldName = 'ULTMOD_DATAORA'
    end
    object QryAllegatiTRACK_ULTIMAMODIFICA: TStringField
      FieldName = 'TRACK_ULTIMAMODIFICA'
      Size = 40
    end
    object QryAllegatiDOC_SOGGETTO: TStringField
      FieldName = 'DOC_SOGGETTO'
      Size = 100
    end
    object QryAllegatiDOC_RIFPRATICA: TStringField
      FieldName = 'DOC_RIFPRATICA'
      Size = 200
    end
    object QryAllegatiFULLPROT: TStringField
      FieldName = 'FULLPROT'
      Size = 30
    end
    object QryAllegatiALARM_DATAORA: TDateTimeField
      FieldName = 'ALARM_DATAORA'
    end
    object QryAllegatiALARM_FATTO: TStringField
      FieldName = 'ALARM_FATTO'
      Size = 1
    end
    object QryAllegatiPA_ALLEGA: TStringField
      FieldName = 'PA_ALLEGA'
      FixedChar = True
      Size = 1
    end
    object QryAllegatiCODICEARTICOLO: TStringField
      FieldName = 'CODICEARTICOLO'
      Size = 25
    end
    object QryAllegatiALL_ARTICOLO: TStringField
      FieldName = 'ALL_ARTICOLO'
      Size = 100
    end
  end
  object SourceAllegati: TDataSource
    DataSet = QryAllegati
    Left = 506
    Top = 57
  end
  object qNewAll: TIB_Cursor
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'UPDATE ALLEGATI SET'
      ''
      '  FILE_EXT = :P_FILE_EXT,'
      '  FILE_NAME = :P_FILE_NAME,'
      '  FILE_BLOB = :P_FILE_BLOB,'
      '  ULTMOD_OPERATORE = :P_ULTMOD_OPERATORE,'
      '  ULTMOD_DATAORA = CURRENT_TIMESTAMP'
      ''
      'WHERE'
      ''
      '  ANNOPROT = :P_ANNO'
      '  AND NUMPROT = :P_NUMPROT'
      '  AND REVPROT = :P_REVPROT'
      '  ')
    Left = 160
    Top = 56
    ParamValues = (
      'P_FILE_EXT='#39#39
      'P_FILE_NAME='
      'P_ULTMOD_OPERATORE='
      'P_ANNO='
      'P_NUMPROT='
      'P_REVPROT=')
  end
  object qFilePresent: TIB_Cursor
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'SELECT'
      ''
      
        '  CAST ((CASE WHEN (FILE_BLOB IS NULL) THEN '#39'F'#39' ELSE '#39'T'#39' END) AS' +
        ' CHAR(1)) AS BLOB_PRESENT'
      ''
      'FROM ALLEGATI'
      ''
      'WHERE ANNOPROT = :P_ANNO'
      '  AND NUMPROT = :P_NUMPROT'
      '  AND REVPROT = :P_REVPROT'
      '')
    Left = 192
    Top = 56
    ParamValues = (
      'P_ANNO='#39#39
      'P_NUMPROT='
      'P_REVPROT=')
  end
  object qGetAll: TIB_Cursor
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'SELECT FILE_BLOB'
      ''
      'FROM ALLEGATI'
      ''
      'WHERE ANNOPROT = :P_ANNO'
      '  AND NUMPROT = :P_NUMPROT'
      '  AND REVPROT = :P_REVPROT'
      '')
    Left = 224
    Top = 56
    ParamValues = (
      'P_ANNO='#39#39
      'P_NUMPROT='
      'P_REVPROT=')
  end
  object ImageListForScreen: TImageList
    Masked = False
    Left = 312
    Top = 56
    Bitmap = {
      494C010101000300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000848400008484000084
      840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400C6C6C600C6C6
      C6000084840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C600C6C6C600C6C6
      C600C6C6C6000084840000848400C6C6C600C6C6C6000084840000848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C600C6C6C6000084
      8400C6C6C600C6C6C6000084840000848400C6C6C600C6C6C600008484000084
      8400C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C600C6C6C6000084
      840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6C6000084
      840000848400C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400C6C6C600C6C6
      C6000084840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6
      C6000084840000848400C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6000084840000848400C6C6
      C600C6C6C6000084840000848400C6C6C600C6C6C6000084840000848400C6C6
      C600C6C6C6000084840000848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600008484000084
      8400C6C6C600C6C6C6000084840000848400C6C6C600C6C6C600008484000084
      8400C6C6C600C6C6C60000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000084
      840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6C6000084
      840000848400C6C6C600C6C6C600008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C6000084840000848400C6C6C600C6C6C6000084840000848400C6C6C600C6C6
      C60000848400C6C6C600C6C6C600008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000084840000848400C6C6C600C6C6C60000848400008484000084
      840000848400C6C6C600C6C6C600008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000084840000848400C6C6C600C6C6C600008484000084
      8400C6C6C600C6C6C60000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000084840000848400C6C6C600C6C6C600C6C6
      C600C6C6C6000084840000848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000084840000848400008484000084
      84000084840000848400C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000848400008484000084
      840000848400C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object QryRefresh: TIB_Cursor
    IB_Connection = DM1.DBAzienda
    SQL.Strings = (
      'SELECT FIRST 1'
      '   A.TIPODOC'
      '  ,A.NUMDOC'
      '  ,REGDOC'
      '  ,DATADOC'
      '  ,CODSOGG'
      '  ,CODPRAT'
      '  ,DATAPRAT'
      '  ,NOTE'
      '  ,FILE_EXT'
      '  ,FILE_NAME'
      '  ,ALARM_DATAORA'
      '  ,ALARM_FATTO'
      '  ,PA_ALLEGA'
      ''
      'FROM ALLEGATI A'
      ''
      'WHERE'
      '      ANNOPROT = :P_ANNO'
      '  AND NUMPROT = :P_NUMPROT'
      '  AND REVPROT = :P_REVPROT'
      '')
    Left = 128
    Top = 56
    ParamValues = (
      'P_ANNO='#39#39
      'P_NUMPROT='
      'P_REVPROT=')
  end
  object ExtFilesMenu: TPopupMenu
    OnPopup = ExtFilesMenuPopup
    Left = 48
    Top = 56
    object Modello1: TMenuItem
      Caption = 'Modello'
      OnClick = Modello1Click
    end
  end
  object QryExtPrg: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    IB_Connection = DM1.DBAzienda
    PessimisticLocking = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT FIRST 1 DESCRIZIONE, ESTENSIONE, BLANKFILE FROM EXTPRG')
    Left = 602
    Top = 58
    object QryExtPrgDESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Size = 25
    end
    object QryExtPrgESTENSIONE: TStringField
      FieldName = 'ESTENSIONE'
      Size = 3
    end
    object QryExtPrgBLANKFILE: TBlobField
      FieldName = 'BLANKFILE'
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 7340344
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000130000008D000000EF000000400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000020000000E3000000FF000000F5000000320000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000B6000000FF000000A500000018000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001B000000FF000000E30000000100000000000000290000
          0043000000150000000000000000000000000000000000000000000000000000
          0000000000000000002F000000FF000000B8000000000000008A000000FF0000
          00FF000000EC0000004C00000000000000000000000000000000000000000000
          0000000000000000002E000000FF000000AC00000034000000FF000000DF0000
          00A0000000FF000000ED0000000E000000000000000000000000000000000000
          0000000000000000002E000000FF000000A600000069000000FF0000005F0000
          0000000000D0000000FF0000002F000000000000000000000000000000000000
          0000000000000000002E000000FF000000A700000068000000FF000000590000
          0000000000C8000000FF00000030000000000000000000000000000000000000
          0000000000000000002E000000FF000000A700000067000000FF0000005C0000
          0000000000CA000000FF0000002F000000000000000000000000000000000000
          0000000000000000002E000000FF000000A700000068000000FF0000005D0000
          0000000000CA000000FF0000002F000000000000000000000000000000000000
          0000000000000000002E000000FF000000A600000069000000FF0000005E0000
          0000000000CA000000FF0000002F000000000000000000000000000000000000
          0000000000000000002F000000FF000000B50000001200000031000000110000
          0000000000C7000000FF00000030000000000000000000000000000000000000
          00000000000000000026000000FF000000D10000000000000000000000000000
          0000000000DB000000FF00000028000000000000000000000000000000000000
          00000000000000000004000000D9000000FF000000790000000C0000000B0000
          007B000000FF000000DC00000005000000000000000000000000000000000000
          0000000000000000000000000043000000FC000000FF000000E9000000E80000
          00FF000000FF0000004700000000000000000000000000000000000000000000
          00000000000000000000000000000000002C000000A8000000FA000000FC0000
          00AC000000300000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002151515862B2B2BF02E2E2EFD2E2E2EFD2E2E2EFD2E2E2EFD2E2E2EFD2E2E
          2EFD2E2E2EFD2E2E2EFD2B2B2BF0161616860000000200000000000000000A0A
          0A592B2B2BF00D0D0D5F06060640060606400606064006060640060606400606
          064006060640060606400C0C0C5F2B2B2BF00B0B0B5900000000000000011515
          158F1E1E1EAF0000000200000001000000010000000100000001000000010000
          00010000000100000001000000021D1D1DAE1515158F00000001000000011515
          15911D1D1DAB000000020B0B0B5B0E0E0E730E0E0E730E0E0E730E0E0E730E0E
          0E730E0E0E730B0B0B5B000000021B1B1BA91616169100000001000000011515
          15911D1D1DAB00000006292929E62D2D2DFB2D2D2DFB2D2D2DFB2D2D2DFB2D2D
          2DFB2D2D2DFB292929E6000000061B1B1BA91616169100000001000000011515
          15911D1D1DAB0000000200000003000000070000000700000007000000070000
          00070000000700000003000000021B1B1BA91616169100000001000000011515
          15911D1D1DAB000000020404042F060606440606064406060644060606440606
          0644060606440404042F000000021B1B1BA91616169100000001000000011515
          15911D1D1DAB000000062B2B2BF22D2D2DFB2D2D2DFB2D2D2DFB2D2D2DFB2D2D
          2DFB2D2D2DFB2B2B2BF2000000061B1B1BA91616169100000001000000011515
          15911D1D1DAB0000000203030323050505360505053605050536050505360505
          05360505053603030323000000021B1B1BA91616169100000001000000011515
          15911D1D1DAB000000020101010B0101011501010115010101150101010F0000
          00010000000000000000000000011B1B1BA91616169100000001000000011515
          15911D1D1DAB00000006292929EB2D2D2DFB2D2D2DFB2D2D2DFB2C2C2CF70404
          042C0000000000000000000000021B1B1BA91616169100000001000000011515
          15911D1D1DAB000000020909094E0B0B0B650B0B0B650B0B0B650B0B0B5D0000
          0006010101100C0C0C680F0F0F75242424D01515158B00000001000000011515
          15911D1D1DAB0000000100000000000000000000000000000000000000000000
          0001222222BE2E2E2EFD2E2E2EFD2B2B2BF10505052F00000000000000011515
          158F1E1E1EAF0000000200000000000000000000000000000000000000000000
          00022D2D2DFB2E2E2EFE2C2C2CF2080808400000000100000000000000000B0B
          0B592B2B2BF00C0C0C5F06060640060606400606064006060640060606400707
          07412D2D2DFC2C2C2CF208080840000000010000000000000000000000000000
          0002161616862B2B2BF02E2E2EFD2E2E2EFD2E2E2EFD2E2E2EFD2E2E2EFD2E2E
          2EFD282828DE0808083F00000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000003F0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF0000003F00000000000000000000000000000000000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF0000003F0000000000000000000000000000000000000000000000000000
          003F000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF000000000000000000000000000000000000000000000020000000000000
          0000000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF000000000000000000000000000000000000000000000000000000000000
          0000000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          00FF00000000000000000000000000000000000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF0000008F0000000000000000000000FF0000
          00FF00000000000000000000000000000000000000FF000000FF000000FF0000
          00FF000000FF000000FF0000009F000000000000000000000000000000FF0000
          00FF00000000000000000000000000000000000000FF000000FF000000FF0000
          00FF000000FF000000DF00000000000000000000000000000000000000FF0000
          00FF0000003F000000000000000000000000000000FF000000FF000000FF0000
          00FF000000FF000000FF0000009F000000000000000000000000000000FF0000
          00FF000000FF000000FF000000FF00000000000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF0000009F00000000000000000000003F0000
          00FF000000FF000000FF000000FF00000000000000FF000000FF000000BF0000
          00FF000000FF000000FF000000FF000000FF0000009F00000000000000000000
          000000000000000000000000000000000000000000FF0000009F000000000000
          0060000000FF000000FF000000FF000000FF000000FF0000009F000000000000
          0000000000000000000000000000000000000000006000000000000000000000
          000000000060000000FF000000FF000000FF000000FF000000FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000060000000FF000000FF000000FF00000060000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000060000000FF0000006000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000003F0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF0000003F00000000000000000000000000000000000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF0000003F0000000000000000000000000000000000000000000000000000
          003F000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF000000000000000000000000000000000000000000000020000000000000
          0000000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF000000000000000000000000000000000000000000000000000000000000
          0000000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF0000000000000000000000000000000000000060000000FF000000600000
          0050000000FF000000FF00000000000000000000000000000000000000FF0000
          00FF00000000000000000000000000000060000000FF000000FF000000FF0000
          0060000000600000004000000000000000000000000000000000000000FF0000
          00FF000000000000000000000050000000FF000000FF000000FF000000FF0000
          00FF000000600000000000000000000000000000005000000000000000FF0000
          00FF000000000000000000000010000000CF000000FF000000FF000000FF0000
          00FF000000FF000000600000000000000060000000FF00000000000000FF0000
          00FF0000003F000000000000000000000010000000CF000000FF000000FF0000
          00FF000000FF000000FF0000009F000000FF000000FF00000000000000FF0000
          00FF000000FF000000FF000000FF000000EF000000400000009F000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000000000003F0000
          00FF000000FF000000FF000000FF000000FF000000AF000000100000009F0000
          00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BF000000FF000000FF000000FF000000FF000000FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000600000
          00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
          0000000000000000000000000000000000000000000000000060000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000038000000E4000000E50000
          0039000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000B1000000F9000000F90000
          00B3000000000000000000000000000000000000000000000000000000090000
          0050000000440000004300000043000000430000006600000075000000750000
          006700000043000000430000004300000044000000500000000A000000100000
          00C3000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000C400000011000000000000
          000000000079000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF0000007A0000000000000000000000000000
          000000000000000000B7000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000B9000000000000000000000000000000000000
          00000000000000000064000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF00000066000000000000000000000000000000000000
          0000000000000000003D000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF0000003E000000000000000000000000000000000000
          0000000000000000002B000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF0000002D000000000000000000000000000000000000
          00000000000000000026000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF00000027000000000000000000000000000000000000
          00000000000000000020000000FB000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FC00000021000000000000000000000000000000000000
          00000000000000000008000000E6000000FF000000FF000000FF000000FF0000
          00FF000000FF000000E700000008000000000000000000000000000000000000
          0000000000000000000000000090000000FF000000FF000000FF000000FF0000
          00FF000000FF0000009200000000000000000000000000000000000000000000
          000000000000000000000000000E000000C3000000FF000000FF000000FF0000
          00FF000000C40000000F00000000000000000000000000000000000000000000
          00000000000000000000000000000000000300000096000000FF000000FF0000
          0098000000040000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000011000000D8000000D90000
          0012000000000000000000000000000000000000000000000000}
      end>
  end
  object SaveDialog1: TSaveDialog
    Left = 480
    Top = 184
  end
  object ZLB1: TZLBArchive
    CompressionLevel = fcMaximum
    Left = 400
    Top = 56
  end
end
