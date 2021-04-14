unit unExportRiba;


interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, ExtCtrls, Db, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxGroupBox, IB_Components, Menus,
  cxLookAndFeelPainters, cxButtons, UnitSystemDirs, cxMaskEdit,
  cxDropDownEdit, cxGraphics, cxLookAndFeels;

const
  BLANK_BANK_NAME = 'Selezionare una banca';


type 
  TFormExportRIBA = class(TForm)
    MemoCBI: TMemo;
    GBDatiAzienda: TcxGroupBox;
    eNomeCreditore: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    eIndirizzoCreditore: TcxTextEdit;
    Label3: TLabel;
    eLocalitaCreditore: TcxTextEdit;
    eCapProvinciaCreditore: TcxTextEdit;
    Label4: TLabel;
    GBDatiBanca: TcxGroupBox;
    Label5: TLabel;
    eCodiceSia: TcxTextEdit;
    Label6: TLabel;
    eCodiceAbi: TcxTextEdit;
    Label7: TLabel;
    eCodiceCab: TcxTextEdit;
    Label8: TLabel;
    eNumeroCC: TcxTextEdit;
    Label9: TLabel;
    eNomeSupporto: TcxTextEdit;
    Label10: TLabel;
    SBCreaRiBaFIle: TcxButton;
    SBChiudi: TcxButton;
    SaveDialog1: TSaveDialog;
    eNomeBanca: TcxComboBox;
    LabelNomeBreve: TLabel;
    eNomeBreve: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBCreaRiBaFIleClick(Sender: TObject);
    procedure SBChiudiClick(Sender: TObject);
    procedure eNomeBancaPropertiesEditValueChanged(Sender: TObject);
  private
    procedure CaricaDatiAzienda;
    procedure EsportaRecordFinale;
    procedure EsportaRiBaNelMemo;
    procedure EsportaRecordIniziale;
    procedure EsportaRecordsRiBa;
    procedure CaricaElencoBancheAppoggio;
    procedure CaricaDatiBancaSelezionata(CodABI, CodCAB: String);
    procedure AzzeraDatiBanca;
    { Private declarations } 
  public 
    { Public declarations } 
  end; 


var 
  FormExportRIBA: TFormExportRIBA; 
  cRecord:string; 
  nRiba,nRecord,nTotale,nDispo:integer; 


implementation

uses DataModule1, SchedaClienti, cxGridCustomTableView, cxGridDBTableView,
  cxGridTableView;


{$R *.DFM} 



function RiempiSize(cStr:string;nLun:integer):string;
var 
 cRet:string; 
begin 


 cRet:=copy(cStr,1,nLun); 


 while length(cRet)<nLun do 
  begin 
   cRet:=cRet+' '; 
  end; 


 RiempiSize:=cRet; 
end; 


function RiempiNum(n:integer;nLun:integer):string; 
var 
 cRet:string; 
begin 


 cRet:=trim(inttostr(n)); 


 while length(cRet)<nLun do 
  begin 
   cRet:='0'+cRet;; 
  end; 


 RiempiNum:=cRet; 
end; 


procedure TFormExportRIBA.CaricaElencoBancheAppoggio;
var
  Q:TIB_Cursor;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT BANCA,ABI,CAB FROM BANCHE WHERE MIABANCA = ''T'' ORDER BY BANCA');
    Q.Open;
    eNomeBanca.Properties.Items.Clear;
    eNomeBanca.Properties.Items.Add(BLANK_BANK_NAME);
    eNomeBanca.Text := BLANK_BANK_NAME;
    while not Q.Eof do begin
      eNomeBanca.Properties.Items.Add(Q.FieldByName('BANCA').AsString + '   ' + DM1.PadR(Q.FieldByName('ABI').AsString, ' ', 5) + '-' + DM1.PadR(Q.FieldByName('CAB').AsString, ' ', 5));
      Q.Next;
    end;
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TFormExportRIBA.AzzeraDatiBanca;
begin
  eCodiceSIA.Text     := '- - -';
  eCodiceABI.Text     := '- - -';
  eCodiceCAB.Text     := '- - -';
  eNumeroCC.Text      := '- - -';
  eNomeSupporto.Text  := '- - -';
end;

procedure TFormExportRIBA.CaricaDatiBancaSelezionata(CodABI, CodCAB: String);
var
  Q:TIB_Cursor;
begin
  AzzeraDatiBanca;

  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT ABI, CAB, BANCA, BANCACODSIA, BANCANOMESUPPORTO, BANCACC, BANCACIN, DESCBREVE FROM BANCHE');
    Q.SQL.Add('WHERE ABI = ''' + Trim(CodABI) + ''' AND CAB = ''' + Trim(CodCAB) + '''');
    Q.Open;
    if Q.Eof then raise Exception.Create('Banca non trovati.');
    eNomeBreve.Text     := Q.FieldByName('DESCBREVE').AsString;
    eCodiceSIA.Text     := Q.FieldByName('BANCACODSIA').AsString;
    eCodiceABI.Text     := DM1.PadR(Q.FieldByName('ABI').AsString, '0', 5);
    eCodiceCAB.Text     := DM1.PadR(Q.FieldByName('CAB').AsString, '0', 5);
    eNumeroCC.Text      := Q.FieldByName('BANCACC').AsString;
    eNomeSupporto.Text  := Q.FieldByName('BANCANOMESUPPORTO').AsString;
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TFormExportRIBA.CaricaDatiAzienda;
var
  Q:TIB_Cursor;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, CAP, CITTA, PROVINCIA FROM DATIAZIE');
    Q.Open;
    if Q.Eof then raise Exception.Create('Dati azienda non trovati.');
    eNomeCreditore.Text         := Q.FieldByName('RAGIONESOCIALE').AsString;
    eIndirizzoCreditore.Text    := Q.FieldByName('INDIRIZZO').AsString + ' n. ' + Q.FieldByName('NUMCIVICO').AsString;
    eLocalitaCreditore.Text     := Q.FieldByName('CITTA').AsString;
    eCapProvinciaCreditore.Text := Q.FieldByName('CAP').AsString + '   (' + Q.FieldByName('PROVINCIA').AsString + ')';
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;


procedure TFormExportRIBA.EsportaRecordIniziale;


begin 


 // righello 
 memocbi.Lines.clear;
 //memocbi.Lines.add('         1         2         3         4         5         6         7         8         9        10         11       12'); 


//memocbi.Lines.add('123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'); 


 // genera riba 
 cRecord:=''; 


//-------------------------------------------------------------------------­----
 // record di testa IB (tot 120)


//-------------------------------------------------------------------------­----
 // 1 filler 
 cRecord := ' '; 


 // 2-3 IB 
 cRecord:=cRecord+'IB'; 


 // 4-8 codice SIA
 cRecord:=cRecord+riempisize(eCodiceSia.Text,5);


 // 9-13 abi ricevente 
 cRecord:=cRecord+riempisize(eCodiceAbi.Text,5);


 // 14-19 data creazione 
 cRecord:=cRecord+formatdatetime('ddmmyy',date); 


 // 20-39 nome supporto 
 cRecord:=cRecord+riempisize(eNomeSupporto.Text,20); 


 // 40-45 disponibile 
 cRecord:=cRecord+riempisize(' ',6); 


 // 46-113 blank 
 cRecord:=cRecord+riempisize(' ',68); 


 // 114 divisa EURO=E 
 cRecord:=cRecord+'E'; 


 // 115 filler 
 cRecord:=cRecord+' '; 


 // 116-120 non usato 
 cRecord:=cRecord+riempisize(' ',5); 
 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


 nDispo:=0;
 nTotale:=0;
 nRiba:=0;


end;


procedure TFormExportRIBA.EsportaRecordsRiBa;
begin


//-------------------------------------------------------------------------­----
 // record 14 


 nDispo:=nDispo+1;
 nTotale:=nTotale+round((ClientiForm.QryScadDARE.asFloat*100));
 nRiba:=nRiba+1;


 // 1 filler 
 cRecord:=' '; 


 // 2-3 14 
 cRecord:=cRecord+'14'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7); 


 // 11-22 blank 
 cRecord:=cRecord+RiempiSize(' ',12); 


 // 23-28 data scadenza 


cRecord:=cRecord+formatdatetime('ddmmyy', ClientiForm.QryScadDATASCADENZA.AsDateTime); 


 // 29-33 30000 fisso 
 cRecord:=cRecord+'30000'; 


 // 34-46 importo 


cRecord:=cRecord+riempinum(round(ClientiForm.QryScadDARE.asFloat*100),13); 


 // 47 fisso -
 cRecord:=cRecord+'-'; 


 // 48-52 abi assuntrice 
 cRecord:=cRecord+RiempiSize(eCodiceAbi.Text,5);


 // 53-57 cab assuntrice 
 cRecord:=cRecord+RiempiSize(eCodiceCab.Text,5);


 // 58-69 conto 
// cRecord:=cRecord+riempinum(StrToInt(eNumeroCC.Text),12);
 cRecord:=cRecord+DM1.PadR(eNumeroCC.Text, '0', 12);


 // 70-74 abi riba 
 cRecord:=cRecord+riempisize(ClientiForm.QryScadABI.asString,5);


 // 75-79 cab riba
 cRecord:=cRecord+riempisize(ClientiForm.QryScadCAB.asString,5);


 // 80-91 riferimento 
 cRecord:=cRecord+riempisize(' ',12);


 // 92-96 sia cliente 
 cRecord:=cRecord+riempinum(0,5); 


 // 97 fisso 4 
 cRecord:=cRecord+'4'; 


 // 98-113 codice cliente 
 cRecord:=cRecord+riempisize(' ',16); 


 // 114 flag tipo debitore banca=B 
 cRecord:=cRecord+' ';


 // 115-119 blank 
 cRecord:=cRecord+riempisize(' ',5); 


 // 120 divisa E 
 cRecord:=cRecord+'E'; 
 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


//-------------------------------------------------------------------------­----
 // record 20
 // 1 filler
 cRecord:=' ';


 // 2-3 20 
 cRecord:=cRecord+'20'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7); 


 // 11-34   1°segmento da 24 car - descrizione debitore NOME 
 cRecord:=cRecord+Riempisize(eNomeCreditore.Text,24);


 // 35-58   2°segmento da 24 car - descrizione debitore INDIRIZZO+CIVICO+CAP 
 cRecord:=cRecord+Riempisize(eIndirizzoCreditore.Text,24);


 // 59-82   3°segmento da 24 car - descrizione debitore COMUNE 
  cRecord:=cRecord+Riempisize(eLocalitaCreditore.Text,24);


 // 83-106  4°segmento da 24 car - descrizione debitore PROVINCIA 
 cRecord:=cRecord+Riempisize(eCapProvinciaCreditore.Text,24);


 // 107-120 filler 
 cRecord:=cRecord+Riempisize(' ',14); 


 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


//-------------------------------------------------------------------------­----
 // record 30
 // 1 filler
 cRecord:=' ';


 // 2-3 30 
 cRecord:=cRecord+'30'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7);


 // 11-40 debitore 1
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadRAGIONESOCIALE.asString,30);

 // 41-70 debitore 2
 cRecord:=cRecord+RiempiSize(Copy(ClientiForm.QryScadRAGIONESOCIALE.asString, 31, 30), 30);

 // 71-86 codice fiscale / piva debitore 


cRecord:=cRecord+RiempiSize(ClientiForm.QryScadPARTITAIVA.asString,16);


 // 87-120 filler 
 cRecord:=cRecord+RiempiSize(' ',34); 
 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


//-------------------------------------------------------------------------­----
 // record 40
 // 1 filler
 cRecord:=' ';


 // 2-3 40 
 cRecord:=cRecord+'40'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7); 


 // 11-40 indirizzo debitore 
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadINDIRIZZO.asString,30);


 // 41-45 cap
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadCAP.asString,5);


 // 46-70 comune 
 cRecord:=cRecord+RiempiSize(Trim(ClientiForm.QryScadCITTA.AsString) + ' (' + Trim(ClientiForm.QryScadPROVINCIA.AsString) + ')', 25);


 // 71-120 banca / sport. domic. 
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadBANCA.asString,50);


 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


//-------------------------------------------------------------------------­----
 // record 50
 // 1 filler
 cRecord:=' ';


 // 2-3 50 
 cRecord:=cRecord+'50'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7); 


 // 11-50 1° segmento da 40 car. rif debito
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadDOCUMENTO.asString, 40);


 // 51-90 2° segmento da 40 car. rif debito
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadRIFPRATICA.AsString, 40);


 // 91-120 filler
 cRecord:=cRecord+RiempiSize('',10);

 // 101-116 Partita IVA / Codice Fiscale
 cRecord:=cRecord+RiempiSize(ClientiForm.QryScadPARTITAIVA.asString, 16);

 // 117-120
 cRecord:=cRecord+RiempiSize('',4);


 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


//-------------------------------------------------------------------------­----
 // record 51


//-------------------------------------------------------------------------­----
 // 1 filler
 cRecord:=' ';


 // 2-3 51 
 cRecord:=cRecord+'51'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7); 


 // 11-20 numero ricevuta 
 cRecord:=cRecord+Riempinum(nRiba,10); 


 // 21-40 nome creditore (mittente ricevuta) 
 cRecord:=cRecord+RiempiSize(eNomeCreditore.text,20); 


 // 41-55 provincia 
 cRecord:=cRecord+RiempiSize(' ',15);


 // 56-65 num autor. 
 cRecord:=cRecord+RiempiSize(' ',10); 


 // 66-71 data autor. 
 cRecord:=cRecord+RiempiSize(' ',6);


 // 72-120 filler 
 cRecord:=cRecord+RiempiSize(' ',49);
 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----
 // record 70 
 // 1 filler 
 cRecord:=' '; 


 // 2-3 70 
 cRecord:=cRecord+'70'; 


 // 4-10 progressivo riba 
 cRecord:=cRecord+RiempiNum(nRiba,7);


 // 11-88 blank 
 cRecord:=cRecord+riempiSize(' ',78);


 // 89-100 indicatori circuito 
 cRecord:=cRecord+riempiSize(' ',12);


 // 101-103 indi. rich. incasso
 cRecord:=cRecord+riempiSize(' ',3); 


 // 104-120 chiavi di controllo
 cRecord:=cRecord+riempiSize(' ',17); 
 MemoCBI.Lines.Add(cRecord); 


//-------------------------------------------------------------------------­----


end;


procedure TFormExportRIBA.EsportaRecordFinale; 
begin 


//-------------------------------------------------------------------------­----
 // record di coda EF (tot 120)
 //------------------


 nRecord:=(7*nDispo)+2;


 // 1 filler 
 cRecord:=' '; 


 // 2-3 EF
 cRecord:=cRecord+'EF'; 


 // 4-8 codice SIA
 cRecord:=cRecord+riempisize(eCodiceSia.text,5);


 // 9-13 abi ricevente 
 cRecord:=cRecord+riempisize(eCodiceAbi.text,5);


 // 14-19 data creazione 
 cRecord:=cRecord+formatdatetime('ddmmyy',date);


 // 20-39 nome supporto
 cRecord:=cRecord+riempisize(eNomeSupporto.Text,20);


 // 40-45 disponibile
 cRecord:=cRecord+riempisize(' ',6); 


 // 46-52 n. disposizioni 
 cRecord:=cRecord+riempinum(nDispo,7);


 // 53-67 n negativi 
 cRecord:=cRecord+riempinum(nTotale,15);


 // 68-82 n positivi 
 cRecord:=cRecord+riempinum(0,15);


 // 83-89 n record 
 cRecord:=cRecord+riempinum(nRecord,7);


 // 90-113 blank 
 cRecord:=cRecord+riempisize(' ',24);


 // 114- divisa 
 cRecord:=cRecord+'E';


 // 115-120 blank
 cRecord:=cRecord+riempisize(' ',6); 


 MemoCBI.Lines.Add(cRecord); 
 memoCBI.Lines.Delete(MemoCBI.Lines.Count); 


//-------------------------------------------------------------------------­----


end; 


procedure TFormExportRIBA.FormShow(Sender: TObject);
begin
  CaricaElencoBancheAppoggio;
  CaricaDatiAzienda;
  eNomeBanca.SetFocus;
end;

procedure TFormExportRIBA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FormExportRIBA := nil;
end;

procedure TFormExportRIBA.EsportaRiBaNelMemo;
var
  SelRec, i: Integer;
begin
  i := 0;
  // SelRec contiene il numero dei records selezionati sulla griglia
  SelRec := ClientiForm.tvScad.Controller.SelectedRecordCount;
  // Se non ci sono  records selezionati ritorna un messaggio ed esce.
  if SelRec = 0 then Raise Exception.Create('Prima è necessario selezionare le scadenze (RI.BA.) da presentare all''incasso.');
  
  try

    try
      DM1.ShowWait('Presentazione RI.BA. per l''incasso', 'Posizionamento iniziale.');
      ClientiForm.QryScad.First;
      DM1.ShowWait('Presentazione RI.BA. per l''incasso', 'Esportazione record iniziale.');
      Self.EsportaRecordIniziale;
      // Cicla per tutte le scadenza selezionate
      for i := 0 to SelRec -1 do begin
        // Si posiziona sul record selezionato attuale
        ClientiForm.tvScad.Controller.SelectedRecords[i].Focused := True;
        // Si assicura che la scadenza corrente sia una RIBA e non sia già stata presentata
        // Si assicura anche che sia una scadenza attiva e che abbia un importo <> 0
        if  (ClientiForm.QryScadRICEVUTABANCARIA.AsString = 'T')
        and (ClientiForm.QryScadPRESENTATA.AsString <> 'P')
        and (ClientiForm.QryScadTIPO.AsString = 'Scad.attiv')
        and (ClientiForm.QryScadDARE.AsFloat > 0) then begin
          // Esporta la scadenza
          DM1.ShowWait('Presentazione RI.BA. per l''incasso', 'Esportazione RI.BA. n. ' + IntToStr(nRiba));
          Self.EsportaRecordsRiBa;
        end else begin
          if (ClientiForm.QryScadRICEVUTABANCARIA.AsString <> 'T') then DM1.Messaggi('Presentazione RI.BA. per l''incasso', 'A T T E N Z I O N E !!!'#13#13'La scadenza ' + ClientiForm.QryScadCODICE.AsString + ' del ' + ClientiForm.QryScadDATASCADENZA.AsString + #13'dell''importo di ' + ClientiForm.QryScadDARE.AsString + #13'relativa al documento ''' + ClientiForm.QryScadDOCUMENTO.AsString + '''' + #13'del soggetto ' + ClientiForm.QryScadRAGIONESOCIALE.AsString + ','#13#13'NON E'' UNA RI.BA.'#13#13'QUESTA SCADENZA NON SARA'' PRESENTATA ALL''INCASSO !!!', '', [mbOk], 0, nil)
          else if (ClientiForm.QryScadPRESENTATA.AsString = 'P') then DM1.Messaggi('Presentazione RI.BA. per l''incasso', 'A T T E N Z I O N E !!!'#13#13'La scadenza ' + ClientiForm.QryScadCODICE.AsString + ' del ' + ClientiForm.QryScadDATASCADENZA.AsString + #13'dell''importo di ' + ClientiForm.QryScadDARE.AsString + #13'relativa al documento ''' + ClientiForm.QryScadDOCUMENTO.AsString + '''' + #13'del soggetto ' + ClientiForm.QryScadRAGIONESOCIALE.AsString + ','#13#13'risulta GIA'' PRESENTATA all''incasso precedentemente.'#13#13'QUESTA SCADENZA NON SARA'' PRESENTATA ALL''INCASSO !!!', '', [mbOk], 0, nil)
          else if (ClientiForm.QryScadTIPO.AsString <> 'Scad.attiv') then DM1.Messaggi('Presentazione RI.BA. per l''incasso', 'A T T E N Z I O N E !!!'#13#13'La scadenza ' + ClientiForm.QryScadCODICE.AsString + ' del ' + ClientiForm.QryScadDATASCADENZA.AsString + #13'dell''importo di ' + ClientiForm.QryScadDARE.AsString + #13'relativa al documento ''' + ClientiForm.QryScadDOCUMENTO.AsString + '''' + #13'del soggetto ' + ClientiForm.QryScadRAGIONESOCIALE.AsString + ','#13#13'NON E'' UNA SCADENZA ATTIVA.'#13#13'QUESTA SCADENZA NON SARA'' PRESENTATA ALL''INCASSO !!!', '', [mbOk], 0, nil)
          else if (ClientiForm.QryScadDARE.AsFloat <= 0) then DM1.Messaggi('Presentazione RI.BA. per l''incasso', 'A T T E N Z I O N E !!!'#13#13'La scadenza ' + ClientiForm.QryScadCODICE.AsString + ' del ' + ClientiForm.QryScadDATASCADENZA.AsString + #13'dell''importo di ' + ClientiForm.QryScadDARE.AsString + #13'relativa al documento ''' + ClientiForm.QryScadDOCUMENTO.AsString + '''' + #13'del soggetto ' + ClientiForm.QryScadRAGIONESOCIALE.AsString + ','#13#13'HA UN IMPORTO NON VALIDO.'#13#13'QUESTA SCADENZA NON SARA'' PRESENTATA ALL''INCASSO !!!', '', [mbOk], 0, nil);
        end;
      end;
      DM1.ShowWait('Presentazione RI.BA. per l''incasso', 'Esportazione record finale.');
      Self.EsportaRecordFinale;
    finally
      DM1.CloseWait;
    end;

    // Visualizza un messaggio che richiede conferma per marcare le Scadenze appena stampate come Presentate
    if DM1.Messaggi('Presentazione RI.BA. per l''incasso',
                    'Le scadenze (RIBA) appena presentate verranno marcate come ''già presentate per l''incasso''.'#13#13#13'Continuare con l''operazione?',
                    'NB: Se la procedura non è terminata correttamente cliccare su ''NO'' e ripeterla.',
                    [mbYes,mbNo], 0, nil) = mrYes

    then begin
      DM1.ShowWait('Presentazione RI.BA. per l''incasso', 'Marcatura delle RI.BA. come ''Presentate''.');
      try
        ClientiForm.MarcaScadenzeSelezionateComePresentate(eNomeBreve.Text);
      finally
        DM1.CloseWait;
      end;
    end;
    // Messaggio finale e chiusura
    DM1.Messaggi('Presentazione RI.BA. per l''incasso', 'Operazione terminata!', '', [mbOk], 0, nil);
    SBChiudiClick(SBChiudi);
  finally
  end;
end;

procedure TFormExportRIBA.SBCreaRiBaFIleClick(Sender: TObject);
begin
  if eNomeBanca.Text = BLANK_BANK_NAME then raise Exception.Create('Non è stata selezionata nessuna banca.');
  // Richiede il nome del file
  with SaveDialog1 do begin
    DefaultExt := 'txt';
    FileName := 'Levante - Presentazione RIBA del ' + FormatDateTime('dd-mm-yyyy ora hh-nn-ss', Now) + '.txt';
    InitialDir := GetDesktopDirectory(Handle);
    Title := 'Presentazione RI.BA. all''incasso';
    Execute;
  end;
  // Esegue l'esportazione delle RI.BA. da presentare nel Memo
  EsportaRiBaNelMemo;
  // Salva il contenuto del memo sul quale è stata costruita l'esportazione
  //  nel file con il nome e il percorso selezionato.
  MemoCBI.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TFormExportRIBA.SBChiudiClick(Sender: TObject);
begin
  Close;
end;

procedure TFormExportRIBA.eNomeBancaPropertiesEditValueChanged(
  Sender: TObject);
var
  NewValue, NewABI, NewCAB: String;
  L: Integer;
begin
  AzzeraDatiBanca;
  // RIcava dalla banca selezionata i codice ABI e CAB per il caricamento
  //  del resto dei dati della banca.
  NewValue := eNomeBanca.Text;
  if NewValue = BLANK_BANK_NAME then Exit;
  L := Length(NewValue);
  NewABI := Copy(NewValue, L-10, 5);
  NewCAB := Copy(NewValue, L-4, 5);
  CaricaDatiBancaSelezionata(NewABI, NewCAB);
end;

end.


