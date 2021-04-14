unit FormModificaMargini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPannelliWizard, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, bmpPanel, IB_Components, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, MAURI_SB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TModificaMarginiForm = class(TModelPannelliWizardForm)
    RBMargini: TRadioButton;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    TitoloGruppo3: TRichEdit;
    Panel2: TPanel;
    AvantiGruppo3: TSpeedButton;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    TitoloGruppo4: TRichEdit;
    Panel3: TPanel;
    Avvia: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Ricarico1: TEdit;
    Panel1: TPanel;
    UpDown2: TUpDown;
    Ricarico2: TEdit;
    Panel11: TPanel;
    UpDown3: TUpDown;
    Ricarico3: TEdit;
    Panel12: TPanel;
    UpDown4: TUpDown;
    Ricarico4: TEdit;
    Panel17: TPanel;
    UpDown5: TUpDown;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    Label10: TLabel;
    TitoloGruppo2: TRichEdit;
    Panel5: TPanel;
    AvantiGruppo2: TSpeedButton;
    Panel6: TPanel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    BitBtnGruppo1: TSpeedButtonRollOver;
    BitBtnGruppo2: TSpeedButtonRollOver;
    BitBtnGruppo3: TSpeedButtonRollOver;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    BitBtnGruppo4: TSpeedButtonRollOver;
    BitBtnGruppo5: TSpeedButtonRollOver;
    BitBtnGruppo6: TSpeedButtonRollOver;
    DescGruppo1: TEdit;
    DescGruppo2: TEdit;
    DescGruppo3: TEdit;
    GruppiTitolo: TStaticText;
    CodiceGruppo1: TEdit;
    CodiceGruppo2: TEdit;
    CodiceGruppo3: TEdit;
    DescGruppo4: TEdit;
    DescGruppo5: TEdit;
    DescGruppo6: TEdit;
    CodiceGruppo4: TEdit;
    CodiceGruppo5: TEdit;
    CodiceGruppo6: TEdit;
    Marca: TcxComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AvviaClick(Sender: TObject);
    procedure MarcaPropertiesInitPopup(Sender: TObject);
    procedure BitBtnGruppo1Click(Sender: TObject);
    procedure BitBtnGruppo2Click(Sender: TObject);
    procedure BitBtnGruppo3Click(Sender: TObject);
    procedure BitBtnGruppo4Click(Sender: TObject);
    procedure BitBtnGruppo5Click(Sender: TObject);
    procedure BitBtnGruppo6Click(Sender: TObject);
    procedure CodiceGruppo1Change(Sender: TObject);
    procedure CodiceGruppo2Change(Sender: TObject);
    procedure CodiceGruppo3Change(Sender: TObject);
    procedure CodiceGruppo4Change(Sender: TObject);
    procedure CodiceGruppo5Change(Sender: TObject);
  private
    procedure EseguiQueryCalcolaListini(R1, R2, R3, R4: Integer);
    procedure CaricaParametri;
    procedure SalvaParametri;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModificaMarginiForm: TModificaMarginiForm;

implementation

uses DataModule1, UnitRepositoryIniFile, FormGruppi, main;

{$R *.dfm}

procedure TModificaMarginiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ModificaMarginiForm := nil;
end;


procedure TModificaMarginiForm.EseguiQueryCalcolaListini(R1,R2,R3,R4:Integer);
var
   Q:TIB_Cursor;
begin                                                           
   // Visualizza la form dei messaggi
   DM1.ShowWait('Importazione Archivi', 'Ricalcolo listini.');
   Q := TIB_Cursor.Create(Self);
   try
      Q.DatabaseName := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;
      Q.SQL.Add('UPDATE ARTICOLI A SET');

      Q.SQL.Add('A.PREZZODIVENDITA  = A.ULTIMOPRZACQUISTO + (A.ULTIMOPRZACQUISTO * ' + IntToStr(R1) + ' / 100),');
      Q.SQL.Add('A.PREZZODIVENDITA2 = A.ULTIMOPRZACQUISTO + (A.ULTIMOPRZACQUISTO * ' + IntToStr(R2) + ' / 100),');
      Q.SQL.Add('A.PREZZODIVENDITA3 = A.ULTIMOPRZACQUISTO + (A.ULTIMOPRZACQUISTO * ' + IntToStr(R3) + ' / 100),');
      Q.SQL.Add('A.PREZZODIVENDITA4 = A.ULTIMOPRZACQUISTO + (A.ULTIMOPRZACQUISTO * ' + IntToStr(R4) + ' / 100),');

      Q.SQL.Add('A.PRZVENDIVACOMP1 = A.PREZZODIVENDITA  + (A.PREZZODIVENDITA  * (SELECT FIRST 1 I.ALIQUOTAIVA FROM ALIQIVA I WHERE I.CODICEIVA = A.CODICEIVA) / 100),');
      Q.SQL.Add('A.PRZVENDIVACOMP2 = A.PREZZODIVENDITA2 + (A.PREZZODIVENDITA2 * (SELECT FIRST 1 I.ALIQUOTAIVA FROM ALIQIVA I WHERE I.CODICEIVA = A.CODICEIVA) / 100),');
      Q.SQL.Add('A.PRZVENDIVACOMP3 = A.PREZZODIVENDITA3 + (A.PREZZODIVENDITA3 * (SELECT FIRST 1 I.ALIQUOTAIVA FROM ALIQIVA I WHERE I.CODICEIVA = A.CODICEIVA) / 100),');
      Q.SQL.Add('A.PRZVENDIVACOMP4 = A.PREZZODIVENDITA4 + (A.PREZZODIVENDITA4 * (SELECT FIRST 1 I.ALIQUOTAIVA FROM ALIQIVA I WHERE I.CODICEIVA = A.CODICEIVA) / 100),');

      Q.SQL.Add('A.RICARICO  = ' + IntToStr(R1) + ',');
      Q.SQL.Add('A.RICARICO2 = ' + IntToStr(R2) + ',');
      Q.SQL.Add('A.RICARICO3 = ' + IntToStr(R3) + ',');
      Q.SQL.Add('A.RICARICO4 = ' + IntToStr(R4) + ',');

      Q.SQL.Add('A.IMPORTORICARICO  = A.PREZZODIVENDITA  - A.ULTIMOPRZACQUISTO,');
      Q.SQL.Add('A.IMPORTORICARICO2 = A.PREZZODIVENDITA2 - A.ULTIMOPRZACQUISTO,');
      Q.SQL.Add('A.IMPORTORICARICO3 = A.PREZZODIVENDITA3 - A.ULTIMOPRZACQUISTO,');
      Q.SQL.Add('A.IMPORTORICARICO4 = A.PREZZODIVENDITA4 - A.ULTIMOPRZACQUISTO,');

      Q.SQL.Add('A.SINCHRO = ''M''');

      // Condizioni WHERE
      Q.SQL.Add('WHERE 1=1');
      if Trim(Marca.Text) <> ''        then Q.SQL.Add('AND A.MARCA LIKE ''' + Trim(Marca.Text) + '''');
      if CodiceGruppo1.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO1 = ' + CodiceGruppo1.Text);
      if CodiceGruppo2.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO2 = ' + CodiceGruppo2.Text);
      if CodiceGruppo3.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO3 = ' + CodiceGruppo3.Text);
      if CodiceGruppo4.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO4 = ' + CodiceGruppo4.Text);
      if CodiceGruppo5.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO5 = ' + CodiceGruppo5.Text);
      if CodiceGruppo6.Text <>  ''     then Q.SQL.Add('AND A.CODICEGRUPPO6 = ' + CodiceGruppo6.Text);

      // Esegue la query
      Q.ExecSQL;
   finally

      DM1.CloseWait;
      Q.Free;
   end;
end;

procedure TModificaMarginiForm.CaricaParametri;
//var
//   LO: TMemIniFile;
begin
  Ricarico1.Text := DM1.TableProgressiviRICARICOLISTINO1.AsString;
  Ricarico2.Text := DM1.TableProgressiviRICARICOLISTINO2.AsString;
  Ricarico3.Text := DM1.TableProgressiviRICARICOLISTINO3.AsString;
  Ricarico4.Text := DM1.TableProgressiviRICARICOLISTINO4.AsString;
  // Default
  if Trim(Ricarico1.Text) = '' then Ricarico1.Text := '0';
  if Trim(Ricarico2.Text) = '' then Ricarico2.Text := '0';
  if Trim(Ricarico3.Text) = '' then Ricarico3.Text := '0';
  if Trim(Ricarico4.Text) = '' then Ricarico4.Text := '0';

//   // Apre il file Param.ini
//   LO   := TMemIniFile.Create(DM1.CurrDir + 'agglist.ini');
//   try
//      // Carica i dati dell'aggiornamento automatico
//      Ricarico1.Text := LO.ReadString('LISTINO1', 'Ricarico1', '0');
//      Ricarico2.Text := LO.ReadString('LISTINO1', 'Ricarico2', '0');
//      Ricarico3.Text := LO.ReadString('LISTINO1', 'Ricarico3', '0');
//      Ricarico4.Text := LO.ReadString('LISTINO1', 'Ricarico4', '0');
//   finally
//      // Distrugge P
//      LO.Free;
//   end;
end;




procedure TModificaMarginiForm.FormShow(Sender: TObject);
begin
  inherited;
  CaricaParametri;
end;

procedure TModificaMarginiForm.AvviaClick(Sender: TObject);
begin
  inherited;
  // Richiedi conferma
  if DM1.Messaggi('Modifica margini articoli', 'Confermi di voler continuare?', 'NB: Prima di continuare assicurarsi di aver effettuato una copia di sicurezza degli archivi per prevenire eventuali perdite di dati in caso di malfunzionamento.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Visualizza la form di operazione in corso
  DM1.Attendere;
  DM1.ShowWait('Modifica margini articoli', 'Operazione in corso...');
  try
    // Aggiorna il file che contiene gli ultimi ricarichi voluti in
    //  modo da riproportli automaticamente la prossima volta.
    //  NB: Disabilitato dopo aver messo la possibilità di filtrare il tutto
    //       per Marca o Gruppo/Sottogruppo
//    SalvaParametri;
    // Aggiorna i listini di vendita
    EseguiQueryCalcolaListini(StrToInt(Ricarico1.Text), StrToInt(Ricarico2.Text), StrToInt(Ricarico3.Text), StrToInt(Ricarico4.Text));
  finally
    DM1.CloseWait;
    DM1.ChiudiAttendere;
    // Operazione terminata
    DM1.Messaggi('Modifica margini articoli', 'Operazione terminata.', '', [mbOk], 0, nil);
    Close;
  end;
end;

procedure TModificaMarginiForm.SalvaParametri;
var
  SL: TRepositoryIniFile;
begin
  // Apre il file che contiene i parametri per l'operazione
  SL := TRepositoryIniFile.Create(DM1.CurrDir + 'agglist.ini', DM1.DBGenerale);
  try
    // Default
    if Trim(Ricarico1.Text) = '' then Ricarico1.Text := '0';
    if Trim(Ricarico2.Text) = '' then Ricarico2.Text := '0';
    if Trim(Ricarico3.Text) = '' then Ricarico3.Text := '0';
    if Trim(Ricarico4.Text) = '' then Ricarico4.Text := '0';
    // Aggiorna il file agglist.ini con i ricarichi impostati
    SL.WriteFloat('LISTINO1', 'Ricarico1', StrToFloat(Ricarico1.Text));
    SL.WriteFloat('LISTINO1', 'Ricarico2', StrToFloat(Ricarico2.Text));
    SL.WriteFloat('LISTINO1', 'Ricarico3', StrToFloat(Ricarico3.Text));
    SL.WriteFloat('LISTINO1', 'Ricarico4', StrToFloat(Ricarico4.Text));
    // Aggiorna il file
    SL.UpdateFile;
    // Aggiorna anche i margini sui progressivi
    DM1.TableProgressivi.Edit;
    try try
      DM1.TableProgressiviRICARICOLISTINO1.Value := StrToFloat(Ricarico1.Text);
      DM1.TableProgressiviRICARICOLISTINO2.Value := StrToFloat(Ricarico2.Text);
      DM1.TableProgressiviRICARICOLISTINO3.Value := StrToFloat(Ricarico3.Text);
      DM1.TableProgressiviRICARICOLISTINO4.Value := StrToFloat(Ricarico4.Text);
    except
      DM1.TableProgressivi.Cancel;
    end;
    finally
      DM1.TableProgressivi.Post;
    end;
  finally
    SL.Free;
  end;
end;

procedure TModificaMarginiForm.MarcaPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MARCA) FROM ARTICOLI');
      Qry.Open;
      Marca.Properties.Items.Clear;
      while not Qry.Eof do begin
         Marca.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TModificaMarginiForm.BitBtnGruppo1Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 991;   // Abilita la selezione
    GruppiForm.LivelloAttivo := 1;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.BitBtnGruppo2Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 991;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.LivelloAttivo := 2;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.BitBtnGruppo3Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 992;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
    GruppiForm.LivelloAttivo := 3;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.BitBtnGruppo4Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 991;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.LivelloAttivo := 4;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.BitBtnGruppo5Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 991;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
    GruppiForm.LivelloAttivo := 5;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.BitBtnGruppo6Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 991;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
    GruppiForm.Selezionato5  := StrToInt(CodiceGruppo5.Text);
    GruppiForm.LivelloAttivo := 6;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TModificaMarginiForm.CodiceGruppo1Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo1.Text) = '' then begin
      CodiceGruppo2.Text  := '';
      DescGruppo2.Text    := '';
      CodiceGruppo2.Color := GruppiTitolo.Color;
      DescGruppo2.Color   := GruppiTitolo.Color;
      CodiceGruppo2.TabStop := False;
      BitBtnGruppo2.Enabled := False;
   end else begin
      CodiceGruppo2.Color := CodiceGruppo1.Color;
      DescGruppo2.Color   := CodiceGruppo1.Color;
      CodiceGruppo2.TabStop := True;
      BitBtnGruppo2.Enabled := True;
   end;
end;

procedure TModificaMarginiForm.CodiceGruppo2Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo2.Text) = '' then begin
      CodiceGruppo3.Text  := '';
      DescGruppo3.Text    := '';
      CodiceGruppo3.Color := GruppiTitolo.Color;
      DescGruppo3.Color   := GruppiTitolo.Color;
      CodiceGruppo3.TabStop := False;
      BitBtnGruppo3.Enabled := False;
   end else begin
      CodiceGruppo3.Color := CodiceGruppo1.Color;
      DescGruppo3.Color   := CodiceGruppo1.Color;
      CodiceGruppo3.TabStop := True;
      BitBtnGruppo3.Enabled := True;
   end;
end;

procedure TModificaMarginiForm.CodiceGruppo3Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo3.Text) = '' then begin
      CodiceGruppo4.Text  := '';
      DescGruppo4.Text    := '';
      CodiceGruppo4.Color := GruppiTitolo.Color;
      DescGruppo4.Color   := GruppiTitolo.Color;
      CodiceGruppo4.TabStop := False;
      BitBtnGruppo4.Enabled := False;
   end else begin
      CodiceGruppo4.Color := CodiceGruppo1.Color;
      DescGruppo4.Color   := CodiceGruppo1.Color;
      CodiceGruppo4.TabStop := True;
      BitBtnGruppo4.Enabled := True;
   end;
end;

procedure TModificaMarginiForm.CodiceGruppo4Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo4.Text) = '' then begin
      CodiceGruppo5.Text  := '';
      DescGruppo5.Text    := '';
      CodiceGruppo5.Color := GruppiTitolo.Color;
      DescGruppo5.Color   := GruppiTitolo.Color;
      CodiceGruppo5.TabStop := False;
      BitBtnGruppo5.Enabled := False;
   end else begin
      CodiceGruppo5.Color := CodiceGruppo1.Color;
      DescGruppo5.Color   := CodiceGruppo1.Color;
      CodiceGruppo5.TabStop := True;
      BitBtnGruppo5.Enabled := True;
   end;
end;

procedure TModificaMarginiForm.CodiceGruppo5Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo5.Text) = '' then begin
      CodiceGruppo6.Text  := '';
      DescGruppo6.Text    := '';
      CodiceGruppo6.Color := GruppiTitolo.Color;
      DescGruppo6.Color   := GruppiTitolo.Color;
      CodiceGruppo6.TabStop := False;
      BitBtnGruppo6.Enabled := False;
   end else begin
      CodiceGruppo6.Color := CodiceGruppo1.Color;
      DescGruppo6.Color   := CodiceGruppo1.Color;
      CodiceGruppo6.TabStop := True;
      BitBtnGruppo6.Enabled := True;
   end;
end;

end.
