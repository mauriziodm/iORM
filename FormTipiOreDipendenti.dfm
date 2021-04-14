inherited TipiOreDipendentiForm: TTipiOreDipendentiForm
  Left = 607
  Top = 128
  Caption = 'TipiOreDipendentiForm'
  OldCreateOrder = True
  ExplicitWidth = 714
  ExplicitHeight = 685
  PixelsPerInch = 96
  TextHeight = 13
  inherited ClientTopPanel: TbmpPanel
    inherited RxSpeedButtonUscita: TSpeedButton
      Enabled = True
      OnClick = RxSpeedButtonUscitaClick
    end
    inherited RxSpeedModifica: TSpeedButton
      Enabled = True
      OnClick = RxSpeedModificaClick
    end
    inherited RxSpeedButtonHelp: TSpeedButton
      Enabled = True
    end
  end
  inherited ClientArea: TScrollBox
    object PanelSottocantieri: TPanel
      Left = 0
      Top = 9
      Width = 669
      Height = 441
      BevelOuter = bvNone
      Color = 15329769
      ParentBackground = False
      TabOrder = 0
      object LabelPanelSottopraticheCaption: TLabel
        Left = 0
        Top = 0
        Width = 669
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = ' TIPI DI ORE DIPENTENTI / OPERAI'
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
      object Bevel10: TBevel
        Left = -20
        Top = 439
        Width = 703
        Height = 2
        Style = bsRaised
      end
      object GridS1: TcxGrid
        Left = 6
        Top = 20
        Width = 215
        Height = 415
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tvS1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Enabled = False
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = True
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Enabled = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          OnCustomDrawPartBackground = tvS1CustomDrawPartBackground
          DataController.DataModeController.GridMode = True
          DataController.DataSource = SourceS1
          DataController.DetailKeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.KeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.CopyPreviewToClipboard = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          OnCustomDrawColumnHeader = tvS1CustomDrawColumnHeader
          OnCustomDrawGroupCell = tvS1CustomDrawGroupCell
          object tvS1DESCRIZIONE: TcxGridDBColumn
            Caption = 'Tipo 1'
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 195
          end
          object tvS1TIPO: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
          end
        end
        object lvS1: TcxGridLevel
          GridView = tvS1
        end
      end
      object GridS2: TcxGrid
        Left = 227
        Top = 20
        Width = 215
        Height = 415
        TabOrder = 1
        LookAndFeel.NativeStyle = False
        object tvS2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Enabled = False
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = True
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Enabled = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          OnCustomDrawPartBackground = tvS1CustomDrawPartBackground
          DataController.DataModeController.GridMode = True
          DataController.DataSource = SourceS2
          DataController.DetailKeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.KeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          OnCustomDrawColumnHeader = tvS1CustomDrawColumnHeader
          OnCustomDrawGroupCell = tvS1CustomDrawGroupCell
          object tvS2DESCRIZIONE: TcxGridDBColumn
            Caption = 'Tipo 2'
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.MaxLength = 0
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 195
          end
          object tvS2TIPO: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
          end
        end
        object lvS2: TcxGridLevel
          GridView = tvS2
        end
      end
      object GridS3: TcxGrid
        Left = 448
        Top = 20
        Width = 215
        Height = 415
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        object tvS3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Enabled = False
          Navigator.Buttons.First.Visible = False
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Enabled = False
          Navigator.Buttons.Last.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = True
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Enabled = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          OnCustomDrawPartBackground = tvS1CustomDrawPartBackground
          DataController.DataModeController.GridMode = True
          DataController.DataSource = SourceS3
          DataController.DetailKeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.KeyFieldNames = 'DESCRIZIONE;TIPO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          Styles.StyleSheet = DM1.MasterTableViewStyleSheet
          OnCustomDrawColumnHeader = tvS1CustomDrawColumnHeader
          OnCustomDrawGroupCell = tvS1CustomDrawGroupCell
          object tvS3DESCRIZIONE: TcxGridDBColumn
            Caption = 'Tipo 3'
            DataBinding.FieldName = 'DESCRIZIONE'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
            Width = 195
          end
          object tvS3TIPO: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO'
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
          end
        end
        object lvS3: TcxGridLevel
          GridView = tvS3
        end
      end
    end
  end
  object QryS1: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM TIPIOREDIPENDENTI'
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE '
      '   AND TIPO = :OLD_TIPO')
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'OREDIP1'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'OREDIP1'#39
      '      )')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforeDelete = QryS1BeforeDelete
    BeforePost = QryS1BeforePost
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'OREDIP1'#39)
    FieldOptions = []
    Left = 418
    Top = 32
    object QryS1DESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
    object QryS1TIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object SourceS1: TDataSource
    AutoEdit = False
    DataSet = QryS1
    Left = 446
    Top = 32
  end
  object QryS2: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM TIPIOREDIPENDENTI'
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE '
      '   AND TIPO = :OLD_TIPO')
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'OREDIP2'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'OREDIP2'#39
      '      )')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforeDelete = QryS1BeforeDelete
    BeforePost = QryS2BeforePost
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'OREDIP2'#39)
    FieldOptions = []
    Left = 506
    Top = 32
    object QryS2DESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
    object QryS2TIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object SourceS2: TDataSource
    AutoEdit = False
    DataSet = QryS2
    Left = 534
    Top = 32
  end
  object QryS3: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM TIPIOREDIPENDENTI'
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE '
      '   AND TIPO = :OLD_TIPO')
    EditSQL.Strings = (
      'UPDATE TIPIOREDIPENTENTI SET'
      '   DESCRIZIONE = :DESCRIZIONE,'
      '   TIPO = '#39'OREDIP3'#39
      'WHERE'
      '   DESCRIZIONE = :OLD_DESCRIZIONE'
      '   AND TIPO = :OLD_TIPO')
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO TIPIOREDIPENDENTI'
      '      ('
      '      DESCRIZIONE,'
      '      TIPO'
      '      )'
      'VALUES'
      '      ('
      '      :DESCRIZIONE,'
      '      '#39'OREDIP3'#39
      '      )')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    BeforeDelete = QryS1BeforeDelete
    BeforePost = QryS3BeforePost
    SQL.Strings = (
      'SELECT * FROM TIPIOREDIPENDENTI'
      'WHERE'
      'TIPO = '#39'OREDIP3'#39)
    FieldOptions = []
    Left = 578
    Top = 32
    object QryS3DESCRIZIONE: TStringField
      FieldName = 'DESCRIZIONE'
      Required = True
    end
    object QryS3TIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object SourceS3: TDataSource
    AutoEdit = False
    DataSet = QryS3
    Left = 606
    Top = 32
  end
end
