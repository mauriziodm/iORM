object ComSegnapostoForm: TComSegnapostoForm
  Left = 859
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Segnaposto dati comunicazioni automatiche'
  ClientHeight = 466
  ClientWidth = 342
  Color = 16762566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    342
    466)
  PixelsPerInch = 96
  TextHeight = 13
  object bntOk: TBitBtn
    Left = 59
    Top = 416
    Width = 105
    Height = 34
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
    TabOrder = 1
    OnClick = bntOkClick
  end
  object btnAnnulla: TBitBtn
    Left = 179
    Top = 416
    Width = 105
    Height = 34
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Annulla'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
    TabOrder = 2
    OnClick = btnAnnullaClick
  end
  object Lista: TcxListBox
    Left = 12
    Top = 13
    Width = 318
    Height = 388
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 16
    ParentFont = False
    Sorted = True
    Style.BorderColor = 16738922
    Style.BorderStyle = cbsSingle
    Style.Color = 16757683
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.IsFontAssigned = True
    TabOrder = 0
    OnDblClick = ListaDblClick
  end
  object Q: TIBOQuery
    BufferSynchroFlags = [bsBeforeEdit, bsAfterEdit, bsAfterInsert]
    DatabaseName = 'c:\winproject\levantedev\prova\prova.gdb'
    DeleteSQL.Strings = (
      'DELETE FROM COM_IMPOSTAZIONI '
      'WHERE ID = :ID')
    EditSQL.Strings = (
      'UPDATE COM_IMPOSTAZIONI SET'
      ''
      '  ID = :ID,'
      '  RIF_DATO = :RIF_DATO,'
      '  RIF_TIMEOFFSET_DAYS = :RIF_TIMEOFFSET_DAYS,'
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
    IB_Connection = DM1.DBAzienda
    InsertSQL.Strings = (
      'INSERT INTO COM_IMPOSTAZIONI ('
      ''
      '  ID,'
      '  RIF_DATO,'
      '  RIF_TIMEOFFSET_DAYS,'
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
      '  :MSGTYPE_LETTER,'
      '  :MSGTYPE_EMAIL,'
      '  :MSGTYPE_SMS,'
      '  :MSG_OGGETTO,'
      '  :MSG_TEXT_SMS,'
      '  :MSG_TEXT_EMAIL,'
      '  :MSG_TEXT_LETTERA'
      ''
      ')')
    PessimisticLocking = True
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT * FROM COM_GET_RIF_INFO (NULL, NULL, NULL, NULL)')
    FieldOptions = []
    Left = 50
    Top = 146
    object QGEN_DATA_ATTUALE: TStringField
      FieldName = 'GEN_DATA_ATTUALE'
      Size = 10
    end
    object QGEN_ORA_ATTUALE: TStringField
      FieldName = 'GEN_ORA_ATTUALE'
      Size = 5
    end
    object QMSG_SOGGETTO_ID: TStringField
      FieldName = 'MSG_SOGGETTO_ID'
      Size = 10
    end
    object QMSG_SOGGETTO_NOME: TStringField
      FieldName = 'MSG_SOGGETTO_NOME'
      Size = 60
    end
    object QMSG_PRATICA_ID: TStringField
      FieldName = 'MSG_PRATICA_ID'
      Size = 10
    end
    object QMSG_PRATICA_CODICE: TStringField
      FieldName = 'MSG_PRATICA_CODICE'
      Size = 10
    end
    object QMSG_PRATICA_DATAAPERTURA: TStringField
      FieldName = 'MSG_PRATICA_DATAAPERTURA'
      Size = 10
    end
    object QMSG_PRATICA_DESCRIZIONE: TStringField
      FieldName = 'MSG_PRATICA_DESCRIZIONE'
      Size = 60
    end
    object QMSG_PRATICA_TIPOIMPIANTO: TStringField
      FieldName = 'MSG_PRATICA_TIPOIMPIANTO'
    end
    object QMSG_PRATICA_PROXVISITAENTRO: TStringField
      FieldName = 'MSG_PRATICA_PROXVISITAENTRO'
      Size = 10
    end
    object QMSG_PRATICA_CONTRATTO_DATA_FINE: TStringField
      FieldName = 'MSG_PRATICA_CONTRATTO_DATA_FINE'
      Size = 10
    end
    object QRIF_TIPO: TStringField
      FieldName = 'RIF_TIPO'
      Size = 25
    end
    object QRIF_NUMERO: TStringField
      FieldName = 'RIF_NUMERO'
      Size = 10
    end
    object QRIF_REGISTRO: TStringField
      FieldName = 'RIF_REGISTRO'
      Size = 5
    end
    object QRIF_DATA: TStringField
      FieldName = 'RIF_DATA'
      Size = 10
    end
    object QRIF_ORA: TStringField
      FieldName = 'RIF_ORA'
      Size = 5
    end
    object QRIF_DESCRIZIONE: TStringField
      FieldName = 'RIF_DESCRIZIONE'
      Size = 100
    end
    object QRIF_SCADENZA_DATA: TStringField
      FieldName = 'RIF_SCADENZA_DATA'
      Size = 10
    end
    object QRIF_RIFERIMENTO: TStringField
      FieldName = 'RIF_RIFERIMENTO'
      Size = 100
    end
    object QRIF_SOGGETTO_ID: TStringField
      FieldName = 'RIF_SOGGETTO_ID'
      Size = 10
    end
    object QRIF_SOGGETTO_NOME: TStringField
      FieldName = 'RIF_SOGGETTO_NOME'
      Size = 60
    end
    object QRIF_PRATICA_ID: TStringField
      FieldName = 'RIF_PRATICA_ID'
      Size = 10
    end
    object QRIF_PRATICA_CODICE: TStringField
      FieldName = 'RIF_PRATICA_CODICE'
      Size = 10
    end
    object QRIF_PRATICA_DATAAPERTURA: TStringField
      FieldName = 'RIF_PRATICA_DATAAPERTURA'
      Size = 10
    end
    object QRIF_PRATICA_DESCRIZIONE: TStringField
      FieldName = 'RIF_PRATICA_DESCRIZIONE'
      Size = 60
    end
    object QRIF_PRATICA_TIPOIMPIANTO: TStringField
      FieldName = 'RIF_PRATICA_TIPOIMPIANTO'
    end
    object QRIF_PRATICA_PROXVISITAENTRO: TStringField
      FieldName = 'RIF_PRATICA_PROXVISITAENTRO'
      Size = 10
    end
    object QRIF_PRATICA_CONTRATTO_DATA_FINE: TStringField
      FieldName = 'RIF_PRATICA_CONTRATTO_DATA_FINE'
      Size = 10
    end
    object QDATIAZIE_RAGIONESOCIALE: TStringField
      FieldName = 'DATIAZIE_RAGIONESOCIALE'
      Size = 50
    end
    object QDATIAZIE_INDIRIZZO: TStringField
      FieldName = 'DATIAZIE_INDIRIZZO'
      Size = 50
    end
    object QDATIAZIE_NUMCIVICO: TStringField
      FieldName = 'DATIAZIE_NUMCIVICO'
      Size = 10
    end
    object QDATIAZIE_CITTA: TStringField
      FieldName = 'DATIAZIE_CITTA'
      Size = 50
    end
    object QDATIAZIE_PROVINCIA: TStringField
      FieldName = 'DATIAZIE_PROVINCIA'
      Size = 50
    end
    object QDATIAZIE_CAP: TStringField
      FieldName = 'DATIAZIE_CAP'
      Size = 5
    end
    object QDATIAZIE_TELEFONO: TStringField
      FieldName = 'DATIAZIE_TELEFONO'
      Size = 50
    end
    object QDATIAZIE_CELLULARE: TStringField
      FieldName = 'DATIAZIE_CELLULARE'
      Size = 50
    end
    object QDATIAZIE_FAX: TStringField
      FieldName = 'DATIAZIE_FAX'
      Size = 50
    end
    object QDATIAZIE_EMAIL: TStringField
      FieldName = 'DATIAZIE_EMAIL'
      Size = 50
    end
    object QMSG_PRATICA_CONTRATTO_IMPORTO: TStringField
      FieldName = 'MSG_PRATICA_CONTRATTO_IMPORTO'
    end
    object QMSG_PRATICA_CONTRATTO_IMPORTOIC: TStringField
      FieldName = 'MSG_PRATICA_CONTRATTO_IMPORTOIC'
    end
    object QRIF_PRATICA_CONTRATTO_IMPORTO: TStringField
      FieldName = 'RIF_PRATICA_CONTRATTO_IMPORTO'
    end
    object QRIF_PRATICA_CONTRATTO_IMPORTOIC: TStringField
      FieldName = 'RIF_PRATICA_CONTRATTO_IMPORTOIC'
    end
    object QRIF_MOTIVO_DELLA_CHIAMATA: TStringField
      FieldName = 'RIF_MOTIVO_DELLA_CHIAMATA'
      Size = 255
    end
    object QRIF_RICHIEDENTE: TStringField
      FieldName = 'RIF_RICHIEDENTE'
      Size = 30
    end
    object QRIF_DA_EFFETTUARE_ID: TStringField
      FieldName = 'RIF_DA_EFFETTUARE_ID'
      Size = 1000
    end
    object QRIF_IMPORTO: TIBOFloatField
      FieldName = 'RIF_IMPORTO'
    end
    object QMSG_SOGGETTO_COGNOME: TStringField
      FieldName = 'MSG_SOGGETTO_COGNOME'
      Size = 60
    end
    object QMSG_SOGGETTO_RAGIONESOCIALE: TStringField
      FieldName = 'MSG_SOGGETTO_RAGIONESOCIALE'
      Size = 60
    end
    object QMSG_SOGGETTO_INDIRIZZO: TStringField
      FieldName = 'MSG_SOGGETTO_INDIRIZZO'
      Size = 80
    end
    object QMSG_SOGGETTO_NUMCIVICO: TStringField
      FieldName = 'MSG_SOGGETTO_NUMCIVICO'
      Size = 10
    end
    object QMSG_SOGGETTO_CAP: TStringField
      FieldName = 'MSG_SOGGETTO_CAP'
      Size = 5
    end
    object QMSG_SOGGETTO_COMUNE: TStringField
      FieldName = 'MSG_SOGGETTO_COMUNE'
      Size = 60
    end
    object QMSG_SOGGETTO_PROVINCIA: TStringField
      FieldName = 'MSG_SOGGETTO_PROVINCIA'
      Size = 3
    end
    object QMSG_SOGGETTO_PARTITAIVA: TStringField
      FieldName = 'MSG_SOGGETTO_PARTITAIVA'
      Size = 16
    end
    object QMSG_SOGGETTO_CODICEFISCALE: TStringField
      FieldName = 'MSG_SOGGETTO_CODICEFISCALE'
      Size = 16
    end
    object QRIF_PRATICA_APP_TIPOIMPIANTO: TStringField
      FieldName = 'RIF_PRATICA_APP_TIPOIMPIANTO'
    end
    object QRIF_PRATICA_APP_TIPOAPPARECCHIO: TStringField
      FieldName = 'RIF_PRATICA_APP_TIPOAPPARECCHIO'
      Size = 30
    end
    object QRIF_PRATICA_APP_COSTRUTTORE: TStringField
      FieldName = 'RIF_PRATICA_APP_COSTRUTTORE'
      Size = 45
    end
    object QRIF_PRATICA_APP_MODELLO: TStringField
      FieldName = 'RIF_PRATICA_APP_MODELLO'
      Size = 30
    end
    object QRIF_PRATICA_APP_MATRICOLA: TStringField
      FieldName = 'RIF_PRATICA_APP_MATRICOLA'
      Size = 30
    end
    object QRIF_RDA: TStringField
      FieldName = 'RIF_RDA'
    end
  end
end
