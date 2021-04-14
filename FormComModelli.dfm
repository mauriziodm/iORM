inherited ComModelliForm: TComModelliForm
  Left = 613
  Top = 178
  Caption = 'ComModelliForm'
  ClientHeight = 740
  ClientWidth = 774
  ExplicitWidth = 774
  ExplicitHeight = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientArea: TScrollBox
    inherited MainPageControl: TcxPageControl
      Properties.ActivePage = TabScheda
      inherited TabElenco: TcxTabSheet
        ExplicitTop = 19
        ExplicitWidth = 729
        ExplicitHeight = 602
        inherited PanelList: TPanel
          inherited GridList: TcxGrid
            Height = 521
            ExplicitHeight = 521
            inherited btvList: TcxGridDBBandedTableView
              DataController.DataModeController.DetailInSQLMode = False
              DataController.KeyFieldNames = 'ID'
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Kind = skCount
                  Position = spFooter
                  FieldName = 'ID'
                  Column = btvListID
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  FieldName = 'ID'
                  Column = btvListID
                end>
              DataController.Summary.OnAfterSummary = btvListDataControllerSummaryAfterSummary
              OptionsView.ColumnAutoWidth = True
              OptionsView.DataRowHeight = 21
              OptionsView.GridLines = glVertical
              OptionsView.GroupRowStyle = grsOffice11
              Styles.Background = nil
              Styles.Content = nil
              Styles.Group = nil
              Styles.GroupByBox = nil
              Styles.Header = nil
              Styles.Selection = nil
              Styles.BandHeader = nil
              Bands = <
                item
                  Caption = 'Comunicazione'
                end
                item
                  Caption = 'Quando'
                end
                item
                  Caption = 'Abilitazioni'
                  Options.Sizing = False
                  Styles.Content = DM1.tvDisContent
                  Width = 135
                end
                item
                  Caption = 'Varie'
                  Visible = False
                end>
              object btvListID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                MinWidth = 60
                Options.FilteringPopup = False
                Options.HorzSizing = False
                Width = 60
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvListMSG_OGGETTO: TcxGridDBBandedColumn
                Caption = 'Oggetto'
                DataBinding.FieldName = 'MSG_OGGETTO'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Options.FilteringPopup = False
                Width = 200
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvListRIF_DATO: TcxGridDBBandedColumn
                Caption = 'Dato di riferimento'
                DataBinding.FieldName = 'RIF_DATO'
                PropertiesClassName = 'TcxTextEditProperties'
                GroupIndex = 0
                HeaderAlignmentHorz = taCenter
                Options.FilteringPopup = False
                Width = 200
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvListRIF_TIMEOFFSET_DAYS: TcxGridDBBandedColumn
                Caption = 'Giorni +/-'
                DataBinding.FieldName = 'RIF_TIMEOFFSET_DAYS'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                MinWidth = 75
                Options.FilteringPopup = False
                Options.HorzSizing = False
                SortIndex = 0
                SortOrder = soAscending
                Width = 75
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvListMSGTYPE_LETTER: TcxGridDBBandedColumn
                Caption = 'lettera'
                DataBinding.FieldName = 'MSGTYPE_LETTER'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.Alignment = taCenter
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                HeaderAlignmentHorz = taCenter
                MinWidth = 45
                Options.FilteringPopup = False
                Options.HorzSizing = False
                Width = 45
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object btvListMSGTYPE_EMAIL: TcxGridDBBandedColumn
                Caption = 'e-mail'
                DataBinding.FieldName = 'MSGTYPE_EMAIL'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.Alignment = taCenter
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                HeaderAlignmentHorz = taCenter
                MinWidth = 45
                Options.FilteringPopup = False
                Options.HorzSizing = False
                Width = 45
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object btvListMSGTYPE_SMS: TcxGridDBBandedColumn
                Caption = 'sms'
                DataBinding.FieldName = 'MSGTYPE_SMS'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.Alignment = taCenter
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'T'
                Properties.ValueUnchecked = 'F'
                HeaderAlignmentHorz = taCenter
                MinWidth = 45
                Options.FilteringPopup = False
                Options.HorzSizing = False
                Width = 45
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object btvListCOMPUTED_MSG_ENABLED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'COMPUTED_MSG_ENABLED'
                Visible = False
                Options.FilteringPopup = False
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
            end
          end
          inherited PanelFiltri: TPanel
            Top = 574
            Height = 28
            ExplicitTop = 574
            ExplicitHeight = 28
            inherited SubPanelFiltri: TPanel
              Height = 28
              ExplicitHeight = 28
              object LabelComAutoCount: TLabel
                Left = 236
                Top = 5
                Width = 215
                Height = 14
                Alignment = taCenter
                AutoSize = False
                Caption = '- - -'
                Font.Charset = ANSI_CHARSET
                Font.Color = 25542
                Font.Height = -9
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          inherited PanelSelezioneColonne: TPanel
            Visible = False
            inherited SubPanelSelezioneColonne: TPanel
              Color = clYellow
            end
          end
        end
      end
      inherited TabScheda: TcxTabSheet
        inherited ClientAreaScheda: TScrollBox
          Color = clWhite
          object PanelOggetto: TPanel
            Left = 0
            Top = 132
            Width = 661
            Height = 40
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 1
            object Label226: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' OGGETTO'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              ExplicitTop = -1
            end
            object Label228: TLabel
              Left = 6
              Top = 18
              Width = 41
              Height = 12
              Caption = 'Oggetto'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object dbeOggetto: TDBEdit
              Left = 54
              Top = 18
              Width = 599
              Height = 15
              AutoSize = False
              BorderStyle = bsNone
              Color = 16250871
              Ctl3D = False
              DataField = 'MSG_OGGETTO'
              DataSource = DS
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object PageControlCorpo: TcxPageControl
            Left = 0
            Top = 192
            Width = 661
            Height = 408
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akBottom]
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsItalic]
            ParentBackground = False
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            Properties.ActivePage = TabSms
            Properties.CustomButtons.Buttons = <>
            Properties.NavigatorPosition = npLeftBottom
            Properties.Style = 9
            Properties.TabSlants.Positions = [spLeft, spRight]
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 408
            ClientRectRight = 661
            ClientRectTop = 19
            object TabSms: TcxTabSheet
              Caption = '   SMS   '
              ImageIndex = 2
              DesignSize = (
                661
                389)
              object Panel3: TPanel
                Left = 0
                Top = 10
                Width = 661
                Height = 374
                Anchors = [akLeft, akTop, akBottom]
                BevelOuter = bvNone
                Color = 15329769
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  661
                  374)
                object Label6: TLabel
                  Left = 0
                  Top = 0
                  Width = 661
                  Height = 13
                  Align = alTop
                  AutoSize = False
                  Caption = ' CORPO SMS'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = False
                end
                object Label8: TLabel
                  Left = 498
                  Top = 353
                  Width = 103
                  Height = 12
                  Anchors = [akRight, akBottom]
                  Caption = 'Caratteri disponibili:'
                  Color = clGreen
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clGray
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                end
                object LabelSmsCaratteriDisponibili: TLabel
                  Left = 590
                  Top = 340
                  Width = 48
                  Height = 36
                  Alignment = taRightJustify
                  Anchors = [akRight, akBottom]
                  AutoSize = False
                  Caption = '- - -'
                  Color = clOlive
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                end
                object BtnSegnapostoSms: TSpeedButton
                  Left = 537
                  Top = 18
                  Width = 116
                  Height = 22
                  Caption = 'Aggiungi segnaposto'
                  Enabled = False
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = BtnSegnapostoSmsClick
                end
                object dbeSmsCorpo: TcxDBMemo
                  Left = 8
                  Top = 44
                  Anchors = [akLeft, akTop, akBottom]
                  DataBinding.DataField = 'MSG_TEXT_SMS'
                  DataBinding.DataSource = DS
                  ParentFont = False
                  Properties.MaxLength = 160
                  Properties.WantTabs = True
                  Properties.OnChange = dbeSmsCorpoPropertiesChange
                  Style.BorderColor = 13619151
                  Style.BorderStyle = ebsSingle
                  Style.Color = 16250871
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Verdana'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  Height = 300
                  Width = 645
                end
              end
            end
            object TabEmail: TcxTabSheet
              Caption = '   e-mail   '
              ImageIndex = 4
              DesignSize = (
                661
                389)
              object Panel1: TPanel
                Left = 0
                Top = 10
                Width = 661
                Height = 374
                Anchors = [akLeft, akTop, akBottom]
                BevelOuter = bvNone
                Color = 15329769
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  661
                  374)
                object Label5: TLabel
                  Left = 0
                  Top = 0
                  Width = 661
                  Height = 13
                  Align = alTop
                  AutoSize = False
                  Caption = ' CORPO E-MAIL'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = False
                end
                object BtnSegnapostoEmail: TSpeedButton
                  Left = 537
                  Top = 18
                  Width = 116
                  Height = 22
                  Caption = 'Aggiungi segnaposto'
                  Enabled = False
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = BtnSegnapostoEmailClick
                end
                object dbeEmailCorpo: TcxDBMemo
                  Left = 8
                  Top = 44
                  Anchors = [akLeft, akTop, akBottom]
                  DataBinding.DataField = 'MSG_TEXT_EMAIL'
                  DataBinding.DataSource = DS
                  ParentFont = False
                  Properties.WantTabs = True
                  Style.BorderColor = 13619151
                  Style.BorderStyle = ebsSingle
                  Style.Color = 16250871
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Verdana'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  Height = 321
                  Width = 645
                end
              end
            end
            object TabLettera: TcxTabSheet
              Caption = '   Lettera   '
              ImageIndex = 0
              DesignSize = (
                661
                389)
              object PanelCorpo: TPanel
                Left = 0
                Top = 12
                Width = 661
                Height = 374
                Anchors = [akLeft, akTop, akBottom]
                BevelOuter = bvNone
                Color = 15329769
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  661
                  374)
                object Label29: TLabel
                  Left = 0
                  Top = 0
                  Width = 661
                  Height = 13
                  Align = alTop
                  AutoSize = False
                  Caption = ' CORPO DELLA LETTERA'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = False
                end
                object BtnSegnapostoLettera: TSpeedButton
                  Left = 537
                  Top = 18
                  Width = 116
                  Height = 22
                  Caption = 'Aggiungi segnaposto'
                  Enabled = False
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = BtnSegnapostoLetteraClick
                end
                object Editor: TcxDBRichEdit
                  Left = 8
                  Top = 44
                  Anchors = [akLeft, akTop, akBottom]
                  DataBinding.DataField = 'MSG_TEXT_LETTERA'
                  DataBinding.DataSource = DS
                  ParentFont = False
                  Properties.WantTabs = True
                  Properties.OnSelectionChange = EditorPropertiesSelectionChange
                  Style.BorderStyle = ebsNone
                  Style.Color = 16250871
                  Style.Edges = [bLeft, bTop, bRight, bBottom]
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Times New Roman'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  Height = 321
                  Width = 645
                end
                object StandardToolBar: TToolBar
                  Left = 0
                  Top = 14
                  Width = 545
                  Height = 30
                  Align = alNone
                  AutoSize = True
                  BorderWidth = 2
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  Images = ToolbarImages
                  Indent = 4
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  Transparent = True
                  Wrapable = False
                  object ToolButton1: TToolButton
                    Left = 4
                    Top = 0
                    ImageIndex = 0
                    OnClick = ToolButton1Click
                  end
                  object OpenButton: TToolButton
                    Left = 27
                    Top = 0
                    ImageIndex = 1
                    OnClick = OpenButtonClick
                  end
                  object SaveButton: TToolButton
                    Left = 50
                    Top = 0
                    ImageIndex = 2
                    OnClick = SaveButtonClick
                  end
                  object ToolButton5: TToolButton
                    Left = 73
                    Top = 0
                    Width = 8
                    ImageIndex = 3
                    Style = tbsDivider
                  end
                  object CutButton: TToolButton
                    Left = 81
                    Top = 0
                    ImageIndex = 5
                    OnClick = CutButtonClick
                  end
                  object CopyButton: TToolButton
                    Left = 104
                    Top = 0
                    ImageIndex = 6
                    OnClick = CopyButtonClick
                  end
                  object PasteButton: TToolButton
                    Left = 127
                    Top = 0
                    ImageIndex = 7
                    OnClick = PasteButtonClick
                  end
                  object ToolButton10: TToolButton
                    Left = 150
                    Top = 0
                    Width = 8
                    ImageIndex = 7
                    Style = tbsSeparator
                  end
                  object FontName: TComboBox
                    Left = 158
                    Top = 1
                    Width = 133
                    Height = 20
                    Hint = 'Font Name|Select font name'
                    Ctl3D = False
                    DropDownCount = 10
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentCtl3D = False
                    ParentFont = False
                    TabOrder = 0
                    Text = 'Times new roman'
                    OnChange = FontNameChange
                  end
                  object ToolButton11: TToolButton
                    Left = 291
                    Top = 0
                    Width = 8
                    ImageIndex = 8
                    Style = tbsSeparator
                  end
                  object FontSize: TEdit
                    Left = 299
                    Top = 0
                    Width = 21
                    Height = 22
                    Hint = 'Font Size|Select font size'
                    Ctl3D = False
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentCtl3D = False
                    ParentFont = False
                    TabOrder = 1
                    Text = '10'
                    OnChange = FontSizeChange
                  end
                  object UpDown1: TUpDown
                    Left = 336
                    Top = 0
                    Width = 15
                    Height = 22
                    Associate = FontSize
                    Position = 10
                    TabOrder = 2
                  end
                  object ToolButton2: TToolButton
                    Left = 351
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton2'
                    ImageIndex = 15
                    Style = tbsSeparator
                  end
                  object BoldButton: TToolButton
                    Left = 359
                    Top = 0
                    Hint = 'Bold'
                    ImageIndex = 8
                    Style = tbsCheck
                    OnClick = BoldButtonClick
                  end
                  object ItalicButton: TToolButton
                    Left = 382
                    Top = 0
                    Hint = 'Italic'
                    ImageIndex = 9
                    Style = tbsCheck
                    OnClick = ItalicButtonClick
                  end
                  object UnderlineButton: TToolButton
                    Left = 405
                    Top = 0
                    Hint = 'Underline'
                    ImageIndex = 10
                    Style = tbsCheck
                    OnClick = UnderlineButtonClick
                  end
                  object ToolButton16: TToolButton
                    Left = 428
                    Top = 0
                    Width = 8
                    ImageIndex = 12
                    Style = tbsDivider
                  end
                  object LeftAlign: TToolButton
                    Left = 436
                    Top = 0
                    Hint = 'Align Left'
                    Grouped = True
                    ImageIndex = 11
                    Style = tbsCheck
                    OnClick = LeftAlignClick
                  end
                  object CenterAlign: TToolButton
                    Tag = 2
                    Left = 459
                    Top = 0
                    Hint = 'Center'
                    Grouped = True
                    ImageIndex = 12
                    Style = tbsCheck
                    OnClick = CenterAlignClick
                  end
                  object RightAlign: TToolButton
                    Tag = 1
                    Left = 482
                    Top = 0
                    Hint = 'Align Right'
                    Grouped = True
                    ImageIndex = 13
                    Style = tbsCheck
                    OnClick = RightAlignClick
                  end
                  object ToolButton20: TToolButton
                    Left = 505
                    Top = 0
                    Width = 8
                    ImageIndex = 15
                    Style = tbsDivider
                  end
                  object BulletsButton: TToolButton
                    Left = 513
                    Top = 0
                    Hint = 'Bullets|Enter bullet mode'
                    ImageIndex = 14
                    Style = tbsCheck
                    OnClick = BulletsButtonClick
                  end
                end
              end
            end
            object TabStorico: TcxTabSheet
              Caption = '   Storico   '
              ImageIndex = 3
              DesignSize = (
                661
                389)
              object Panel8: TPanel
                Left = 0
                Top = 10
                Width = 661
                Height = 377
                Anchors = [akLeft, akTop, akBottom]
                BevelOuter = bvNone
                Color = 15329769
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  661
                  377)
                object Label11: TLabel
                  Left = 0
                  Top = 0
                  Width = 661
                  Height = 13
                  Align = alTop
                  AutoSize = False
                  Caption = ' STORICO'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = False
                end
                object Label12: TLabel
                  Left = 7
                  Top = 336
                  Width = 115
                  Height = 12
                  Anchors = [akLeft, akBottom]
                  Caption = 'Data e ora di creazione'
                  Color = clGreen
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clGray
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                end
                object Label13: TLabel
                  Left = 7
                  Top = 354
                  Width = 131
                  Height = 12
                  Anchors = [akLeft, akBottom]
                  Caption = 'Data e ora ultima modifica'
                  Color = clGreen
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clGray
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                end
                object DBEdit1: TDBEdit
                  Tag = -1
                  Left = 153
                  Top = 336
                  Width = 200
                  Height = 14
                  TabStop = False
                  Anchors = [akLeft, akBottom]
                  AutoSize = False
                  BorderStyle = bsNone
                  Ctl3D = False
                  DataField = 'DATAULTMOD_CREAZIONE'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = True
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit2: TDBEdit
                  Tag = -1
                  Left = 153
                  Top = 354
                  Width = 200
                  Height = 14
                  TabStop = False
                  Anchors = [akLeft, akBottom]
                  AutoSize = False
                  BorderStyle = bsNone
                  Ctl3D = False
                  DataField = 'DATAULTMOD_GENERALE'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = True
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object GridSto: TcxGrid
                  Left = 8
                  Top = 23
                  Width = 644
                  Height = 301
                  Anchors = [akLeft, akTop, akRight, akBottom]
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
                  TabOrder = 2
                  LevelTabs.Style = 10
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.NativeStyle = False
                  RootLevelOptions.DetailFrameColor = clBlack
                  RootLevelOptions.DetailFrameWidth = 1
                  object btvSto: TcxGridDBBandedTableView
                    Navigator.Buttons.CustomButtons = <>
                    FilterBox.Visible = fvNever
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.Filter.Options = [fcoCaseInsensitive]
                    DataController.KeyFieldNames = 'ID'
                    DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Kind = skCount
                        Position = spFooter
                        FieldName = 'MSG_AMEZZO'
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Kind = skCount
                        FieldName = 'MSG_AMEZZO'
                      end>
                    DataController.Summary.SummaryGroups = <>
                    FilterRow.InfoText = 'Clicca qui per definire un filtro di ricerca'
                    FilterRow.SeparatorColor = 16037544
                    FilterRow.ApplyChanges = fracImmediately
                    OptionsBehavior.CellHints = True
                    OptionsCustomize.ColumnHidingOnGrouping = False
                    OptionsSelection.CellSelect = False
                    OptionsSelection.MultiSelect = True
                    OptionsView.FocusRect = False
                    OptionsView.NoDataToDisplayInfoText = 'Nessun dato da visualizzare'
                    OptionsView.CellAutoHeight = True
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GridLineColor = 13882323
                    OptionsView.GridLines = glVertical
                    OptionsView.GroupByBox = False
                    OptionsView.GroupRowStyle = grsOffice11
                    OptionsView.RowSeparatorColor = clBlack
                    OptionsView.BandHeaders = False
                    OptionsView.FixedBandSeparatorColor = clBlack
                    Styles.ContentEven = DM1.tvContentEven
                    Styles.ContentOdd = DM1.tvContentOdd
                    Styles.FilterRowInfoText = DM1.tvContent
                    Styles.Footer = DM1.tvContent
                    Styles.GroupSummary = DM1.tvContent
                    Styles.StyleSheet = DM1.btvGCMaster
                    Bands = <
                      item
                        Width = 50
                      end>
                    object btvStoDATAORAINVIO: TcxGridDBBandedColumn
                      Caption = 'Data e ora invio'
                      DataBinding.FieldName = 'DATAORAINVIO'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      HeaderAlignmentHorz = taCenter
                      MinWidth = 200
                      Options.Filtering = False
                      Options.FilteringPopup = False
                      Options.HorzSizing = False
                      SortIndex = 0
                      SortOrder = soDescending
                      Width = 200
                      Position.BandIndex = 0
                      Position.ColIndex = 2
                      Position.RowIndex = 0
                    end
                    object btvStoDESTINAZIONE: TcxGridDBBandedColumn
                      Caption = 'Destinazione'
                      DataBinding.FieldName = 'DESTINAZIONE'
                      PropertiesClassName = 'TcxTextEditProperties'
                      HeaderAlignmentHorz = taCenter
                      Options.Filtering = False
                      Options.FilteringPopup = False
                      Width = 314
                      Position.BandIndex = 0
                      Position.ColIndex = 3
                      Position.RowIndex = 0
                    end
                    object btvStoOPERATORE: TcxGridDBBandedColumn
                      Caption = 'Operatore'
                      DataBinding.FieldName = 'OPERATORE'
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      HeaderAlignmentHorz = taCenter
                      MinWidth = 100
                      Options.Filtering = False
                      Options.FilteringPopup = False
                      Options.HorzSizing = False
                      Width = 100
                      Position.BandIndex = 0
                      Position.ColIndex = 4
                      Position.RowIndex = 0
                    end
                    object btvStoID: TcxGridDBBandedColumn
                      DataBinding.FieldName = 'ID'
                      Visible = False
                      Options.Filtering = False
                      Options.FilteringPopup = False
                      Position.BandIndex = 0
                      Position.ColIndex = 0
                      Position.RowIndex = 0
                    end
                    object btvStoID_MSG: TcxGridDBBandedColumn
                      DataBinding.FieldName = 'ID_MSG'
                      Visible = False
                      Options.Filtering = False
                      Options.FilteringPopup = False
                      Position.BandIndex = 0
                      Position.ColIndex = 1
                      Position.RowIndex = 0
                    end
                  end
                  object lvSto: TcxGridLevel
                    GridView = btvSto
                    Options.DetailFrameColor = 11731033
                    Options.DetailFrameWidth = 2
                    Options.DetailTabsPosition = dtpTop
                    Styles.Tab = DM1.tvArtDetail_Content
                    Styles.TabsBackground = DM1.tvArtDetail_GroupByBox
                  end
                end
              end
            end
          end
          object PanelImpostazioni: TPanel
            Left = 0
            Top = 11
            Width = 661
            Height = 119
            BevelOuter = bvNone
            Color = 15329769
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 0
            object Shape3: TShape
              Left = 8
              Top = 32
              Width = 75
              Height = 55
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object Label14: TLabel
              Left = 0
              Top = 0
              Width = 661
              Height = 13
              Align = alTop
              AutoSize = False
              Caption = ' IMPOSTAZIONI'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = False
            end
            object Label15: TLabel
              Left = 110
              Top = 21
              Width = 93
              Height = 12
              Caption = 'Dato di riferimento'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label16: TLabel
              Left = 110
              Top = 47
              Width = 89
              Height = 12
              Caption = 'Giorni prima/dopo'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelNoteInvio: TLabel
              Left = 302
              Top = 47
              Width = 221
              Height = 12
              Caption = '(Invio   0   gioni dopo la data di riferimento)'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 9
              Top = 20
              Width = 72
              Height = 12
              Caption = 'Abilita come...'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 110
              Top = 74
              Width = 82
              Height = 12
              Caption = 'Giorni di validit'#224
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LabelExpiration: TLabel
              Left = 302
              Top = 74
              Width = 180
              Height = 12
              Caption = '(Lo segnala da inviare per  0  giorni)'
              Color = clGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object dbeDatoDiRiferimento: TcxDBComboBox
              Left = 209
              Top = 18
              AutoSize = False
              DataBinding.DataField = 'RIF_DATO'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'Appuntamenti: Data appuntamento'
                'Corrisp. non pagati: Data documento'
                'Impianti: Data prox visita'
                'Interventi: Data intervento'
                'Scadenze: Data scadenza')
              Properties.Sorted = True
              Style.BorderStyle = ebsUltraFlat
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.NativeStyle = False
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 3
              Height = 19
              Width = 300
            end
            object dbeCheckSms: TcxDBCheckBox
              Left = 8
              Top = 33
              Cursor = crHandPoint
              Caption = 'sms'
              DataBinding.DataField = 'MSGTYPE_SMS'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
            end
            object dbeCheckEmail: TcxDBCheckBox
              Left = 8
              Top = 49
              Cursor = crHandPoint
              Caption = 'e-mail'
              DataBinding.DataField = 'MSGTYPE_EMAIL'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
            end
            object dbeCheckLettera: TcxDBCheckBox
              Left = 8
              Top = 65
              Cursor = crHandPoint
              Caption = 'lettera'
              DataBinding.DataField = 'MSGTYPE_LETTER'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
            end
            object dbeOffsetDays: TcxDBSpinEdit
              Left = 209
              Top = 41
              DataBinding.DataField = 'RIF_TIMEOFFSET_DAYS'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.OnChange = dbeOffsetDaysPropertiesChange
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -16
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 4
              Width = 86
            end
            object dbeExpirationDays: TcxDBSpinEdit
              Left = 209
              Top = 68
              DataBinding.DataField = 'RIF_EXPIRATION_DAYS'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImmediatePost = True
              Properties.OnChange = dbeExpirationDaysPropertiesChange
              Style.Color = 16250871
              Style.Edges = []
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -16
              Style.Font.Name = 'Verdana'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.ButtonTransparency = ebtNone
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 5
              Width = 86
            end
            object dbeNoAppuntamento: TcxDBCheckBox
              Left = 105
              Top = 96
              Cursor = crHandPoint
              Caption = 'Non inviare se '#232' gi'#224' stato preso un appuntamento'
              DataBinding.DataField = 'RIF_NOAPPUNTAMENTO'
              DataBinding.DataSource = DS
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'T'
              Properties.ValueUnchecked = 'F'
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -9
              Style.Font.Name = 'Verdana'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clGray
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 6
            end
          end
        end
      end
    end
  end
  inherited ClientTopPanel: TbmpPanel
    Color = clSilver
    ParentBackground = False
    inherited RxSpeedButtonVisualizza: TSpeedButton
      Enabled = True
    end
    inherited RxSpeedButtonNuovo: TSpeedButton
      Enabled = True
    end
    inherited RxSpeedButtonElimina: TSpeedButton
      Enabled = True
    end
  end
  inherited Q: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM COM_IMPOSTAZIONI '
      'WHERE ID = :ID')
    EditSQL.Strings = (
      'UPDATE COM_IMPOSTAZIONI SET'
      ''
      '  ID = :ID,'
      '  RIF_DATO = :RIF_DATO,'
      '  RIF_TIMEOFFSET_DAYS = :RIF_TIMEOFFSET_DAYS,'
      '  RIF_EXPIRATION_DAYS = :RIF_EXPIRATION_DAYS,'
      '  RIF_NOAPPUNTAMENTO = :RIF_NOAPPUNTAMENTO,'
      '  MSGTYPE_LETTER = :MSGTYPE_LETTER,'
      '  MSGTYPE_EMAIL = :MSGTYPE_EMAIL,'
      '  MSGTYPE_SMS = :MSGTYPE_SMS,'
      '  MSG_OGGETTO = :MSG_OGGETTO,'
      '  MSG_TEXT_SMS = :MSG_TEXT_SMS,'
      '  MSG_TEXT_EMAIL = :MSG_TEXT_EMAIL,'
      '  MSG_TEXT_LETTERA = :MSG_TEXT_LETTERA'
      ''
      'WHERE'
      '  ID = :OLD_ID'
      ''
      ''
      ''
      ''
      '')
    InsertSQL.Strings = (
      'INSERT INTO COM_IMPOSTAZIONI ('
      ''
      '  ID,'
      '  RIF_DATO,'
      '  RIF_TIMEOFFSET_DAYS,'
      '  RIF_EXPIRATION_DAYS,'
      '  RIF_NOAPPUNTAMENTO,'
      '  MSGTYPE_LETTER,'
      '  MSGTYPE_EMAIL,'
      '  MSGTYPE_SMS,'
      '  MSG_OGGETTO,'
      '  MSG_TEXT_SMS,'
      '  MSG_TEXT_EMAIL,'
      '  MSG_TEXT_LETTERA'
      ''
      ') VALUES ('
      ''
      '  :ID,'
      '  :RIF_DATO,'
      '  :RIF_TIMEOFFSET_DAYS,'
      '  :RIF_EXPIRATION_DAYS,'
      '  :RIF_NOAPPUNTAMENTO,'
      '  :MSGTYPE_LETTER,'
      '  :MSGTYPE_EMAIL,'
      '  :MSGTYPE_SMS,'
      '  :MSG_OGGETTO,'
      '  :MSG_TEXT_SMS,'
      '  :MSG_TEXT_EMAIL,'
      '  :MSG_TEXT_LETTERA'
      ''
      ')')
    AfterInsert = QAfterInsert
    BeforePost = QBeforePost
    OnCalcFields = QCalcFields
    SQL.Strings = (
      'SELECT * FROM COM_IMPOSTAZIONI')
    object QID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QRIF_DATO: TStringField
      FieldName = 'RIF_DATO'
      Size = 60
    end
    object QRIF_TIMEOFFSET_DAYS: TIntegerField
      Alignment = taCenter
      FieldName = 'RIF_TIMEOFFSET_DAYS'
    end
    object QRIF_EXPIRATION_DAYS: TIntegerField
      FieldName = 'RIF_EXPIRATION_DAYS'
    end
    object QRIF_NOAPPUNTAMENTO: TStringField
      FieldName = 'RIF_NOAPPUNTAMENTO'
      Size = 1
    end
    object QMSGTYPE_LETTER: TStringField
      FieldName = 'MSGTYPE_LETTER'
      Size = 1
    end
    object QMSGTYPE_EMAIL: TStringField
      FieldName = 'MSGTYPE_EMAIL'
      Size = 1
    end
    object QMSGTYPE_SMS: TStringField
      FieldName = 'MSGTYPE_SMS'
      Size = 1
    end
    object QMSG_OGGETTO: TStringField
      FieldName = 'MSG_OGGETTO'
      Size = 250
    end
    object QMSG_TEXT_SMS: TMemoField
      FieldName = 'MSG_TEXT_SMS'
      BlobType = ftMemo
      Size = 8
    end
    object QMSG_TEXT_EMAIL: TMemoField
      FieldName = 'MSG_TEXT_EMAIL'
      BlobType = ftMemo
      Size = 8
    end
    object QMSG_TEXT_LETTERA: TMemoField
      FieldName = 'MSG_TEXT_LETTERA'
      BlobType = ftMemo
      Size = 8
    end
    object QCOMPUTED_MSG_ENABLED: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'COMPUTED_MSG_ENABLED'
      Calculated = True
    end
  end
  object ToolbarImages: TImageList
    DrawingStyle = dsTransparent
    Left = 56
    Top = 420
    Bitmap = {
      494C01010F001100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFF8FFF0000C007C0078C030000FFFFFFFF8FFF0000F83FF807FFFF0000
      FFFFFFFFFFFF0000C007C0078FFF0000FFFFFFFF8C030000F01FF8078FFF0000
      FFFFFFFFFFFF0000C007C007FFFF0000FFFFFFFF8FFF0000F83FF8078C030000
      FFFFFFFF8FFF0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE00FFFFFFFFFFFFFFFFFC007F00F81FFF83FFFFFF8C7E3FFF39FC03F
      F8C7F1FFF39FFFFFF8C7F8FFF39FC007F80FFC7FF39FFFFFF8C7FE3FF39FC03F
      F8C7FF1FF39FFFFFF8C7FF8FF39FC007F00FFF03E10FFFFFFFFFFFFFFFFFC03F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
      FFFFF6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFF7F8B780000000
      C1F7FE8F80000001C3FBFE3F80000003C7FBFF7F80000003CBFBFE3F80010003
      DCF7FEBF80030003FF0FFC9F80070FC3FFFFFDDF807F0003FFFFFDDF80FF8007
      FFFFFDDF81FFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C007
      C007001F8031BFEBC007000F80310005C007000780317E31C007000380017E35
      C007000180010006C007000080017FEAC007001F8FF18014C007001F8FF1C00A
      C007001F8FF1E001C0078FF18FF1E007C00FFFF98FF1F007C01FFF758FF5F003
      C03FFF8F8001F803FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Filter = 'Rich Text Files (*.RTF)|*.RTF|Text Files (*.TXT)|*.TXT'
    Left = 24
    Top = 536
  end
  object SaveDialog: TSaveDialog
    Filter = 'Rich Text Files (*.RTF)|*.RTF|Text Files (*.TXT)|*.TXT'
    Left = 56
    Top = 536
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 88
    Top = 536
  end
end
