unit FormImportaArcBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IB_Components, IBODataset, DB, StdCtrls, IB_Access;

const
  NOTIFYCOUNT = 13;

type
  TImportaArcBaseForm = class(TForm)
    DBArcBase: TIBODatabase;
    QDest: TIBOTable;
    BtnStart: TButton;
    QSourceTableList: TIB_Cursor;
    QSource: TIBOTable;
    procedure BtnStartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ImportCount: Integer;
    function TableDestExist(TableName: String): Boolean;
    procedure ImportaRecordCorrente;
    procedure ImportaTabellaCorrente(Tabella:String);
    procedure ImportaTabelleArchiviDiBase;
    procedure ConnettiDBSorgente(SourceFileName:String);
    procedure DisconnettiDBSorgente;
    { Private declarations }
  public
    { Public declarations }
    // Variabile che contiene il nome del file Database sorgente
    procedure ImportaArchiviBase(SourceDatabaseFileName: String);
  end;

var
  ImportaArcBaseForm: TImportaArcBaseForm;

implementation

uses DataModule1, FormAziende;

{$R *.dfm}

// Procedura principale per l'importazione dei dati dal database degli archivi di base
//  al database dell'azienda attualmente aperta.
procedure TImportaArcBaseForm.ImportaArchiviBase(SourceDatabaseFileName: String);
begin
  DM1.ShowWait('Caricamento archivi di base', 'Inizializzazione...');
  // Connette il database sorgente
  DisconnettiDBSorgente;
  ConnettiDBSorgente(SourceDatabaseFileName);
  // Avvia la transazione
  DM1.ShowWait('', 'Avvio transazione...');
  DM1.DBAzienda.StartTransaction;
  try try
    // Avvia l'importazione degli archivi di base
    ImportaTabelleArchiviDiBase;
    // Commit se tutto va bene
    DM1.ShowWait('', 'Conferma transazione...');
    DM1.DBAzienda.Commit;
  finally
    DM1.CloseWait;
    // Disconnette il databse sorgente
    DisconnettiDBSorgente;
  end;
  except
    DM1.CloseWait;
    // Rollback se tutto va male
    DM1.DBAzienda.Rollback;
  end;
end;

// Disconnetti DB sorgente
procedure TImportaArcBaseForm.DisconnettiDBSorgente;
begin
  if DBArcBase.Connected then DBArcBase.Disconnect;
end;

// Imposta i dati del database sorgente in modo da poterlo aprire.
procedure TImportaArcBaseForm.ConnettiDBSorgente(SourceFileName:String);
begin
  // Se connesso disconnette il database
  if DBArcBase.Connected then DBArcBase.Disconnect;
  // Imposta le proprietà opportune
  DBArcBase.DatabaseName  := DM1.ArcBaseDir + SourceFileName;
  DBArcBase.CharSet       := DM1.DBAzienda.CharSet;
  DBArcBase.Password      := DM1.DBAzienda.Password;
  DBArcBase.UserName      := DM1.DBAzienda.UserName;
  DBArcBase.LoginPrompt   := DM1.DBAzienda.LoginPrompt;
  DBArcBase.Protocol      := DM1.DBAzienda.Protocol;
  DBArcBase.Server        := DM1.DBAzienda.Server;
  // Si connette
  DBArcBase.Connect;
end;


// Importa i dati dell'archivio di base sull'archivio dell'azienda corrente
procedure TImportaArcBaseForm.ImportaTabelleArchiviDiBase;
var
  TabName: String;
begin
  DM1.ShowWait('', 'Apertura elenco tabelle...');
  // Apre l'elenco delle tabella dal DB sorgente
  if QSourceTableList.Active then QSourceTableList.Close;
  QSourceTableList.Open;
  try
    // Cicla finchè ci sono tabelle da importare
    while not QSourceTableList.Eof do begin
      // Carica il nome della tabella attuale
      TabName := Trim(QSourceTableList.Fields[0].AsString);
      // Nel caso si tratti di una di queste tabelle le salta.
      if  (TabName <> 'PROGRESS')
      and (TabName <> 'PROGREG')
      and (TabName <> 'ANAGMAGA')
      and (TabName <> 'DATIAZIE')
      and (TabName <> 'LABART')
      and (TabName <> 'LABSOGG')
      and (TabName <> 'ARTICOLI')
      and (TabName <> 'BANCHE') or ((AziendeForm <> nil) and (not AziendeForm.CBNoBanche.Checked))
      then begin
        // Prima di tutto verifica che la tabella esista anche nel database
        //  destinazione.
        if Self.TableDestExist(QSourceTableList.Fields[0].AsString) then begin
          // Importa la tabella corrente
          ImportaTabellaCorrente(QSourceTableList.Fields[0].AsString);
        end;
      end;
      // Avanti il prossimo
      QSourceTableList.Next;
    end;
  finally
    DM1.ShowWait('', 'Chiusura elenco tabelle...');
    QSourceTableList.Close;
  end;
end;

// Importa la tabella corrente dal sorgente alla destinazione
procedure TImportaArcBaseForm.ImportaTabellaCorrente(Tabella:String);
begin
  try
    DM1.ShowWait('', 'Inizio caricamento tabella "' + Tabella + '"');
    // IMposta il nome della tabella sorgente e la apre
    if QSource.Active then QSource.Close;
    QSource.TableName := Tabella;
    QSource.Open;
    // Imposta il nome della tabella destinazione e la apre
    if QDest.Active then QDest.Close;
    QDest.TableName := Tabella;
    QDest.Open;
    // Inizializza il contatore per la notifica a video
    ImportCount := 0;
    // Cicla finchè ci sono record da importare
    while not QSource.Eof do begin
      // Incrementa il contatore per la notifica a video
      Inc(ImportCount);
      if ImportCount >= NOTIFYCOUNT then begin
        ImportCount := 0;
        DM1.ShowWait('', 'Caricamento tabella: "' + Tabella + '"   Record: ' + IntToStr(QSource.RecNo));
      end;
      // Importa il record corrente protetto in un tryExcept
      //  in modo che se da un errore non si interrompa tutto.
      //  NB: In questo modo se il record da importare esiste già (key violation)
      //       darà appunto un errore di key violation non importerà
      //       il record corrente e continuerà con gli altri, in questo modo non
      //       è necessario che faccio il controllo esplicitamente
      // Append del nuovo record nella destinazione
      QDest.Append;
      try
        // Importazione del record corrente
        ImportaRecordCorrente;
        // Conferta i nuovi dati
        QDest.Post;
      except
        // Se invece qualcosa è andato storto...
        QDest.Cancel;
      end;
      // Avanti il prossimo
      QSource.Next;
    end;
  finally
    if QSource.Active then QSource.Close;
    if QDest.Active then QDest.Close;
  end;
end;

// IMporta il record corrente del sorgente nella destinazione
procedure TImportaArcBaseForm.ImportaRecordCorrente;
var
  i: Integer;
  SourceStream, DestStream: TStream;
begin
  // Cicla per tutti i campi della sorgente
  for i := 0 to QSource.FieldCount -1 do begin
    // Se il campo esiste anche nella destinazione...
    // E se il campo sorgente non è nullo...
    if (not QSource.Fields[i].IsNull) and (QDest.FindField(QSource.Fields[i].FieldName) <> nil) then begin
      // Se il campo non è di tipo Blob carica il valore normalmente...
      if not (QSource.Fields[i] is TBlobField) then begin
        // Importa il valore del campo nella destinazione
        QDest.FindField(QSource.Fields[i].FieldName).Value := QSource.Fields[i].Value;
      // Altrimenti se si tratta di un Blob Field lo copia con uno stream
      end else begin
        // Crea lo stream sorgente
        SourceStream := QSource.CreateBlobStream(QSource.Fields[i], bmRead);
        try
          // Crea lo stream destinazione
          DestStream := QDest.CreateBlobStream(QDest.FindField(QSource.Fields[i].FieldName), bmReadWrite);
          try
            // Effettua la copia del valore del campo corrente
            DestStream.CopyFrom(SourceStream, SourceStream.Size);
          finally
            DestStream.Free;
          end;
        finally
          SourceStream.Free;
        end;
      end;
    end;
  end;
end;



// RItorna True se la tabella esiste False se non esiste nel database destinazione
function TImportaArcBaseForm.TableDestExist(TableName:String): Boolean;
var
   Qry: TIB_Cursor;
begin
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      // IL nome tabella deve essere sicuramente tutto maiuscolo
      TableName := UpperCase(TableName);
      // Controlla la presenza della tabella nel database
      Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM RDB$RELATIONS WHERE UPPER(RDB$RELATION_NAME) = ''' + TableName + '''');
      Qry.Open;
      // Restituisce il risultato
      Result := (Qry.FieldByName('EXIST').AsInteger > 0);
   finally
      Qry.Close;
      Qry.Free;
   end;
end;




procedure TImportaArcBaseForm.BtnStartClick(Sender: TObject);
begin
  Self.ImportaArchiviBase('ARCBASE.GDB');
end;

procedure TImportaArcBaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ImportaArcBaseForm := nil;
end;

end.
