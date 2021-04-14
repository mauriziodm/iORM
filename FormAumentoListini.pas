unit FormAumentoListini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPannelliWizard, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, bmpPanel, IB_Components, MAURI_SB, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TAumentoListiniForm = class(TModelPannelliWizardForm)
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    TitoloGruppo2: TRichEdit;
    Panel2: TPanel;
    AvantiGruppo2: TSpeedButton;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    TitoloGruppo4: TRichEdit;
    Panel3: TPanel;
    Avvia: TSpeedButton;
    RBPrezzoDiListino: TRadioButton;
    Aumento: TEdit;
    Panel5: TPanel;
    UpDown1: TUpDown;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    TitoloGruppo3: TRichEdit;
    Panel4: TPanel;
    AvantiGruppo3: TSpeedButton;
    Panel1: TPanel;
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
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvviaClick(Sender: TObject);
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
    procedure MarcaPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AumentoListiniForm: TAumentoListiniForm;

implementation

uses DataModule1, FormGruppi, main;

{$R *.dfm}

procedure TAumentoListiniForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AumentoListiniForm := nil;
end;

procedure TAumentoListiniForm.AvviaClick(Sender: TObject);
var
  Q:TIB_Cursor;
  ParamPrzAcqFissi: Char;
begin
  inherited;
  // Richiedi conferma
  if DM1.Messaggi('Aumento Listini', 'Confermi di voler continuare?', 'NB: Prima di continuare assicurarsi di aver effettuato una copia di sicurezza degli archivi per prevenire eventuali perdite di dati in caso di malfunzionamento.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Determina il parametro che decide se a essere ricalcolati devono essere gli sconti
  //  di acquisto oppure il CostoReale
  if DM1.Articoli_RicalcoloPrzAcquistoImportiFissi then
    ParamPrzAcqFissi := 'T'
  else
    ParamPrzAcqFissi := 'F';
  // Crea la query
  Q := TIB_Cursor.Create(nil);
  try
    // Visualizza la form di operazione in corso
    DM1.ShowWait('Aumento Listini', 'Operazione in corso...');

    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;

    // Imposta la query
    Q.SQL.Add('EXECUTE BLOCK');
    Q.SQL.Add('AS');
    Q.SQL.Add('  DECLARE VARIABLE loc_codart VARCHAR(25);');
    Q.SQL.Add('BEGIN');
    Q.SQL.Add('  FOR SELECT A.CODICEARTICOLO FROM ARTICOLI A');
    Q.SQL.Add('  WHERE 1=1');

    // Condizioni di ricerca
    if Trim(Marca.Text) <> ''        then Q.SQL.Add('    AND A.MARCA LIKE ''' + Trim(Marca.Text) + '''');
    if CodiceGruppo1.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO1 = ' + CodiceGruppo1.Text);
    if CodiceGruppo2.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO2 = ' + CodiceGruppo2.Text);
    if CodiceGruppo3.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO3 = ' + CodiceGruppo3.Text);
    if CodiceGruppo4.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO4 = ' + CodiceGruppo4.Text);
    if CodiceGruppo5.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO5 = ' + CodiceGruppo5.Text);
    if CodiceGruppo6.Text <>  ''     then Q.SQL.Add('    AND A.CODICEGRUPPO6 = ' + CodiceGruppo6.Text);

    Q.SQL.Add('  INTO loc_codart');
    Q.SQL.Add('  DO BEGIN');
    Q.SQL.Add('    EXECUTE PROCEDURE ART_AUMENTA_PREZZO_LISTINO (loc_codart, ' + Aumento.Text + ',' + QuotedStr(ParamPrzAcqFissi) + ');');
    Q.SQL.Add('  END');
    Q.SQL.Add('END');
    // Esegue
    Q.ExecSQL;
  finally
    DM1.CloseWait;
    Q.Free;
    // Operazione terminata
    DM1.Messaggi('Aumento Listini', 'Operazione terminata.', '', [mbOk], 0, nil);
    Close;
  end;
end;

procedure TAumentoListiniForm.BitBtnGruppo1Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 992;   // Abilita la selezione
    GruppiForm.LivelloAttivo := 1;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAumentoListiniForm.BitBtnGruppo2Click(Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TGruppiForm, GruppiForm);
    GruppiForm.Parent := MainForm;
    GruppiForm.Tag := 992;   // Abilita la selezione
    GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
    GruppiForm.LivelloAttivo := 2;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAumentoListiniForm.BitBtnGruppo3Click(Sender: TObject);
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

procedure TAumentoListiniForm.BitBtnGruppo4Click(Sender: TObject);
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
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.LivelloAttivo := 4;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAumentoListiniForm.BitBtnGruppo5Click(Sender: TObject);
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
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
    GruppiForm.LivelloAttivo := 5;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAumentoListiniForm.BitBtnGruppo6Click(Sender: TObject);
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
    GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
    GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
    GruppiForm.Selezionato5  := StrToInt(CodiceGruppo5.Text);
    GruppiForm.LivelloAttivo := 6;
    GruppiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAumentoListiniForm.CodiceGruppo1Change(Sender: TObject);
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

procedure TAumentoListiniForm.CodiceGruppo2Change(Sender: TObject);
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

procedure TAumentoListiniForm.CodiceGruppo3Change(Sender: TObject);
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

procedure TAumentoListiniForm.CodiceGruppo4Change(Sender: TObject);
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

procedure TAumentoListiniForm.CodiceGruppo5Change(Sender: TObject);
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

procedure TAumentoListiniForm.MarcaPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
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

end.
