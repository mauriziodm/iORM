unit FormComSegnaposto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, cxListBox, DB,
  IBODataset, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxEdit;

type
  TComSegnapostoForm = class(TForm)
    bntOk: TBitBtn;
    btnAnnulla: TBitBtn;
    Lista: TcxListBox;
    Q: TIBOQuery;
    QGEN_DATA_ATTUALE: TStringField;
    QGEN_ORA_ATTUALE: TStringField;
    QMSG_SOGGETTO_ID: TStringField;
    QMSG_SOGGETTO_NOME: TStringField;
    QMSG_PRATICA_ID: TStringField;
    QMSG_PRATICA_CODICE: TStringField;
    QMSG_PRATICA_DATAAPERTURA: TStringField;
    QMSG_PRATICA_DESCRIZIONE: TStringField;
    QMSG_PRATICA_TIPOIMPIANTO: TStringField;
    QMSG_PRATICA_PROXVISITAENTRO: TStringField;
    QMSG_PRATICA_CONTRATTO_DATA_FINE: TStringField;
    QRIF_TIPO: TStringField;
    QRIF_NUMERO: TStringField;
    QRIF_REGISTRO: TStringField;
    QRIF_DATA: TStringField;
    QRIF_ORA: TStringField;
    QRIF_DESCRIZIONE: TStringField;
    QRIF_SCADENZA_DATA: TStringField;
    QRIF_RIFERIMENTO: TStringField;
    QRIF_SOGGETTO_ID: TStringField;
    QRIF_SOGGETTO_NOME: TStringField;
    QRIF_PRATICA_ID: TStringField;
    QRIF_PRATICA_CODICE: TStringField;
    QRIF_PRATICA_DATAAPERTURA: TStringField;
    QRIF_PRATICA_DESCRIZIONE: TStringField;
    QRIF_PRATICA_TIPOIMPIANTO: TStringField;
    QRIF_PRATICA_PROXVISITAENTRO: TStringField;
    QRIF_PRATICA_CONTRATTO_DATA_FINE: TStringField;
    QDATIAZIE_RAGIONESOCIALE: TStringField;
    QDATIAZIE_INDIRIZZO: TStringField;
    QDATIAZIE_NUMCIVICO: TStringField;
    QDATIAZIE_CITTA: TStringField;
    QDATIAZIE_PROVINCIA: TStringField;
    QDATIAZIE_CAP: TStringField;
    QDATIAZIE_TELEFONO: TStringField;
    QDATIAZIE_CELLULARE: TStringField;
    QDATIAZIE_FAX: TStringField;
    QDATIAZIE_EMAIL: TStringField;
    QMSG_PRATICA_CONTRATTO_IMPORTO: TStringField;
    QMSG_PRATICA_CONTRATTO_IMPORTOIC: TStringField;
    QRIF_PRATICA_CONTRATTO_IMPORTO: TStringField;
    QRIF_PRATICA_CONTRATTO_IMPORTOIC: TStringField;
    QRIF_MOTIVO_DELLA_CHIAMATA: TStringField;
    QRIF_RICHIEDENTE: TStringField;
    QRIF_DA_EFFETTUARE_ID: TStringField;
    QRIF_IMPORTO: TIBOFloatField;
    QMSG_SOGGETTO_COGNOME: TStringField;
    QMSG_SOGGETTO_RAGIONESOCIALE: TStringField;
    QMSG_SOGGETTO_INDIRIZZO: TStringField;
    QMSG_SOGGETTO_NUMCIVICO: TStringField;
    QMSG_SOGGETTO_CAP: TStringField;
    QMSG_SOGGETTO_COMUNE: TStringField;
    QMSG_SOGGETTO_PROVINCIA: TStringField;
    QMSG_SOGGETTO_PARTITAIVA: TStringField;
    QMSG_SOGGETTO_CODICEFISCALE: TStringField;
    QRIF_PRATICA_APP_TIPOIMPIANTO: TStringField;
    QRIF_PRATICA_APP_TIPOAPPARECCHIO: TStringField;
    QRIF_PRATICA_APP_COSTRUTTORE: TStringField;
    QRIF_PRATICA_APP_MODELLO: TStringField;
    QRIF_PRATICA_APP_MATRICOLA: TStringField;
    QRIF_RDA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnAnnullaClick(Sender: TObject);
    procedure bntOkClick(Sender: TObject);
    procedure ListaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CaricaElencoCampi;
    function GetSelectedText: String;
    { Private declarations }
  public
    { Public declarations }
    // Proprietà che contiene il testo della voce selezionata
    //  oppure è una stringa nulla se non si è selezionato nulla
    property SelectedText:String read GetSelectedText;
  end;

var
  ComSegnapostoForm: TComSegnapostoForm;

implementation

{$R *.dfm}


// Procedure che imposta ed esegue la query dei dati da visualizzare
procedure TComSegnapostoForm.CaricaElencoCampi;
var
  i: Integer;
begin
  // Carica l'elenco dei campi
  Lista.Items.BeginUpdate;
  try
    Lista.Items.Clear;
    for i := 0 to Q.Fields.Count -1 do
      Lista.Items.Add('<' + Q.Fields[i].FieldName + '>');
  finally
    Lista.Items.EndUpdate;
  end;
end;



procedure TComSegnapostoForm.FormShow(Sender: TObject);
begin
  CaricaElencoCampi;
end;

procedure TComSegnapostoForm.btnAnnullaClick(Sender: TObject);
begin
  Lista.ItemIndex := -1;
  Close;
end;

function TComSegnapostoForm.GetSelectedText: String;
begin
  // Imposta il valore da ritornare
  if Lista.ItemIndex = -1
  then Result := ''
  else Result := Lista.Items[Lista.ItemIndex];
end;

procedure TComSegnapostoForm.bntOkClick(Sender: TObject);
begin
  Close;
end;

procedure TComSegnapostoForm.ListaDblClick(Sender: TObject);
begin
  bntOkClick(BntOk);
end;

procedure TComSegnapostoForm.FormCreate(Sender: TObject);
begin
  // IMposta le dimensioni
  Self.Width   := 350;
  Self.Height  := 600;
end;

end.
