unit FormVendBancoSeleCant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  Buttons, cxGraphics, cxLookAndFeels;

type
  TDatiDocumenti = record
    Visible: Boolean;
    Caption: String;
    FontSize: Byte;
    FontBold: Boolean;
    TipoDocumento: String;
    Causale: String;
    AzioneMagazzino: String;
    AzioneCantiere: String;
  end;

  TDatiCantieri = record
    Codice:Integer;
    DataApertura:TDate;
    Tipo:String;
    Descrizione:String;
    Cliente:Integer;
    RagSocCli: String;
    IndirizzoDestMerci: String;
    NumCivicoDestMerci: String;
    CittaDEstMerci: String;
    CAPDestMerci: String;
    ProvinciaDestMerci: String;
  end;

  TVendBancoSeleCantForm = class(TForm)
    PanelCantieri: TPanel;
    ModelButton: TcxButton;
    PanelNavigator: TPanel;
    Logo: TImage;
    ButtonPrevous: TcxButton;
    ButtonNext: TcxButton;
    ButtonReloadData: TcxButton;
    LabelPag: TLabel;
    SpeedButton1: TSpeedButton;
    ButtonDoc1: TcxButton;
    ButtonDoc2: TcxButton;
    ButtonDoc3: TcxButton;
    ButtonDoc4: TcxButton;
    ButtonDoc5: TcxButton;
    ButtonDoc6: TcxButton;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonReloadDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonPrevousClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ModelButtonClick(Sender: TObject);
    procedure ButtonDoc1Click(Sender: TObject);
    procedure ResetDocumentoSelezionato;
    procedure CreaDocumento(Button: TObject);
  private
    DatiCantieri: array of TDatiCantieri;
    Bottoni: array of TcxButton;
    DatiDocumenti: array [0..5] of TDatiDocumenti;
    FRighe: Integer;
    FColonne: Integer;
    FButtonWidth: Integer;
    FButtonHeight: Integer;
    FPagina: Integer;
    FTotPagine: Integer;
    FBottoniPerPagina: Integer;
    FCantiereInizioPagina: Integer;
    FFontName: String;
    FFontSize: Integer;
    FHorizontalSeparation: Integer;
    FBottomMargin: Integer;
    FTopMargin: Integer;
    FRightMargin: Integer;
    FLeftMargin: Integer;
    FVerticalSeparation: Integer;
    FVisualizzaDocumento: Boolean;
    FCaricaPalmareAllaSceltaDelCantiere: Boolean;
    FDescrizioneDocumentoSelezionato: String;
    FConfermato: Boolean;
    procedure SetRighe(const Value: Integer);
    procedure CaricaLayout;
    procedure SetColonne(const Value: Integer);
    procedure SetButtonWidth(const Value: Integer);
    procedure SetButtonHeight(const Value: Integer);
    procedure CaricaElencoCantieri;
    procedure SetPagina(const Value: Integer);
    procedure SetTotPagine(const Value: Integer);
    procedure SetBottoniPerPagina(const Value: Integer);
    procedure CaricaParametri;
    procedure SetCantiereInizioPagina(const Value: Integer);
    procedure SetFontName(const Value: String);
    procedure SetFontSize(const Value: Integer);
    procedure PosizionaPulsanti;
    procedure SetBottomMargin(const Value: Integer);
    procedure SetHorizontalSeparation(const Value: Integer);
    procedure SetLeftMargin(const Value: Integer);
    procedure SetRightMargin(const Value: Integer);
    procedure SetTopMargin(const Value: Integer);
    procedure SetVerticalSeparation(const Value: Integer);
    procedure RefreshButtons;
    procedure VisualizzaPulsantiDocumenti;
    procedure SetVisualizzaDocumento(const Value: Boolean);
    procedure SetCaricaPalmareAllaSceltaDelCantiere(const Value: Boolean);
    procedure ChiediConferma(Button: TObject);
    procedure SetDescrizioneDocumentoSelezionato(const Value: String);
    procedure SetConfermato(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property Righe:Integer read FRighe write SetRighe;
    property Colonne:Integer read FColonne write SetColonne;
    property ButtonWidth:Integer read FButtonWidth write SetButtonWidth;
    property ButtonHeight:Integer read FButtonHeight write SetButtonHeight;
    property Pagina:Integer read FPagina write SetPagina;
    property TotPagine:Integer read FTotPagine write SetTotPagine;
    property BottoniPerPagina:Integer read FBottoniPerPagina write SetBottoniPerPagina;
    property CantiereInizioPagina:Integer read FCantiereInizioPagina write SetCantiereInizioPagina;
    property FontName:String read FFontName write SetFontName;
    property FontSize:Integer read FFontSize write SetFontSize;
    property TopMargin:Integer read FTopMargin write SetTopMargin;
    property LeftMargin:Integer read FLeftMargin write SetLeftMargin;
    property RightMargin:Integer read FRightMargin write SetRightMargin;
    property BottomMargin:Integer read FBottomMargin write SetBottomMargin;
    property HorizontalSeparation: Integer read FHorizontalSeparation write SetHorizontalSeparation;
    property VerticalSeparation: Integer read FVerticalSeparation write SetVerticalSeparation;
    property VisualizzaDocumento: Boolean read FVisualizzaDocumento write SetVisualizzaDocumento;
    property CaricaPalmareAllaSceltaDelCantiere: Boolean read FCaricaPalmareAllaSceltaDelCantiere write SetCaricaPalmareAllaSceltaDelCantiere;
    property DescrizioneDocumentoSelezionato: String read FDescrizioneDocumentoSelezionato write SetDescrizioneDocumentoSelezionato;
    property Confermato: Boolean read FConfermato write SetConfermato;
  end;

var
  VendBancoSeleCantForm: TVendBancoSeleCantForm;

implementation

uses DataModule1, IB_Components, IniFiles, main, SchedaPreventiviOrdini,
  FormConfermaDocExpressMag;

{$R *.dfm}

{ TVendBancoSeleCantForm }


procedure TVendBancoSeleCantForm.ChiediConferma(Button: TObject);
begin
  Application.CreateForm(TConfermaDocExpressMagForm, ConfermaDocExpressMagForm);
  ConfermaDocExpressMagForm.Parent := Self;
  ConfermaDocExpressMagForm.ButtonSelected := Button;
  ConfermaDocExpressMagForm.Left := 0;
  ConfermaDocExpressMagForm.Top := 0;
  ConfermaDocExpressMagForm.Width := ClientWidth;
  ConfermaDocExpressMagForm.Height := ClientHeight;
  ConfermaDocExpressMagForm.LabelDocumento.Caption := 'Documento:   "' + DescrizioneDocumentoSelezionato + '"';
  ConfermaDocExpressMagForm.LabelCliente.Caption := 'Cliente:   "' +  DatiCantieri[(Button as TcxButton).Tag].RagSocCli + '"';
  ConfermaDocExpressMagForm.LabelCantiere.Caption := 'Cantiere/Impianto:   "' +  DatiCantieri[(Button as TcxButton).Tag].Descrizione + '"';
  ConfermaDocExpressMagForm.Show;
  MessageBeep(MB_YESNO);
end;


procedure TVendBancoSeleCantForm.RefreshButtons;
var
  i, CantIndex, Offset: Integer;
begin
  // Calcola l'offset della pagina dei cantieri
  Offset := BottoniPerPagina * (Pagina-1);
  // Cicla per tutti i bottoni dello schermo
  for i := 0 to BottoniPerPagina-1 do begin
    // Ricava l'indice del cantiere da associare al bottone
    CantIndex := i + Offset;
    // Se esiste un cantiere per il bottone corrente lo assegna
    if CantIndex < Length(DatiCantieri) then begin
      // Compila le proprietà del bottone attuale
      Bottoni[i].Caption := DatiCantieri[CantIndex].RagSocCli + #13 + DatiCantieri[CantIndex].Descrizione;
      Bottoni[i].Tag     := CantIndex;
      Bottoni[i].Visible := True;
    // Se invece non c'è il servizio mi rende invisibile il bottone
    end else begin
      Bottoni[i].Visible := False;
    end;
  end;
end;

procedure TVendBancoSeleCantForm.CaricaParametri;
var
  LO: TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Righe := LO.ReadInteger('VenditaAlBanco', 'RigheSelezioneCantiere', 10);
    Colonne := LO.ReadInteger('VenditaAlBanco', 'ColonneSelezioneCantiere', 2);
    BottoniPerPagina := Righe * Colonne;
    SetLength(Bottoni, BottoniPerPagina);
    TopMargin := 5;
    BottomMargin := 5;
    LeftMargin := 5;
    RightMargin := 5;
    HorizontalSeparation := 5;
    VerticalSeparation := 5;
    // Carica il parametro di indica se, una volta scelto il cantiere si deve visualizzare
    //  il documento e quindi poi lo si conferma dal documento stesso con F12 oppure se il documento
    //  deve rimanere invisibile e la conferma avverrà direttamente datta schermata Express_Mag
    VisualizzaDocumento := LO.ReadBool('VenditaAlBanco', 'VisualizzaDocumento', False);
    // Carica il parametro che indica se quando si seleziona il cantiere viene anche importato
    //  automaticamente anche il contenuto del palmare oppure no.
    CaricaPalmareAllaSceltaDelCantiere := LO.ReadBool('VenditaAlBanco', 'CaricaPalmareAllaSceltaDelCantiere', False);
    // Carica i dati dei documenti
    DatiDocumenti[0].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc1_Caption', ''));
    DatiDocumenti[0].Visible          := (DatiDocumenti[0].Caption <> '');
    DatiDocumenti[0].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc1_FontSize', 10);
    DatiDocumenti[0].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc1_FontBold', False);
    DatiDocumenti[0].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc1_TipoDocumento', ''));
    DatiDocumenti[0].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc1_Causale', ''));
    DatiDocumenti[0].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc1_AzioneMagazzino', '='));
    DatiDocumenti[0].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc1_AzioneCantiere', '='));

    DatiDocumenti[1].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc2_Caption', ''));
    DatiDocumenti[1].Visible          := (DatiDocumenti[1].Caption <> '');
    DatiDocumenti[1].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc2_FontSize', 10);
    DatiDocumenti[1].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc2_FontBold', False);
    DatiDocumenti[1].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc2_TipoDocumento', ''));
    DatiDocumenti[1].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc2_Causale', ''));
    DatiDocumenti[1].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc2_AzioneMagazzino', '='));
    DatiDocumenti[1].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc2_AzioneCantiere', '='));

    DatiDocumenti[2].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc3_Caption', ''));
    DatiDocumenti[2].Visible          := (DatiDocumenti[2].Caption <> '');
    DatiDocumenti[2].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc3_FontSize', 10);
    DatiDocumenti[2].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc3_FontBold', False);
    DatiDocumenti[2].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc3_TipoDocumento', ''));
    DatiDocumenti[2].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc3_Causale', ''));
    DatiDocumenti[2].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc3_AzioneMagazzino', '='));
    DatiDocumenti[2].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc3_AzioneCantiere', '='));

    DatiDocumenti[3].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc4_Caption', ''));
    DatiDocumenti[3].Visible          := (DatiDocumenti[3].Caption <> '');
    DatiDocumenti[3].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc4_FontSize', 10);
    DatiDocumenti[3].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc4_FontBold', False);
    DatiDocumenti[3].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc4_TipoDocumento', ''));
    DatiDocumenti[3].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc4_Causale', ''));
    DatiDocumenti[3].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc4_AzioneMagazzino', '='));
    DatiDocumenti[3].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc4_AzioneCantiere', '='));

    DatiDocumenti[4].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc5_Caption', ''));
    DatiDocumenti[4].Visible          := (DatiDocumenti[4].Caption <> '');
    DatiDocumenti[4].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc5_FontSize', 10);
    DatiDocumenti[4].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc5_FontBold', False);
    DatiDocumenti[4].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc5_TipoDocumento', ''));
    DatiDocumenti[4].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc5_Causale', ''));
    DatiDocumenti[4].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc5_AzioneMagazzino', '='));
    DatiDocumenti[4].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc5_AzioneCantiere', '='));

    DatiDocumenti[5].Caption          := Trim(LO.ReadString('VenditaAlBanco', 'Doc6_Caption', ''));
    DatiDocumenti[5].Visible          := (DatiDocumenti[5].Caption <> '');
    DatiDocumenti[5].FontSize         := LO.ReadInteger('VenditaAlBanco', 'Doc6_FontSize', 10);
    DatiDocumenti[5].FontBold         := LO.ReadBool('VenditaAlBanco', 'Doc6_FontBold', False);
    DatiDocumenti[5].TipoDocumento    := Trim(LO.ReadString('VenditaAlBanco', 'Doc6_TipoDocumento', ''));
    DatiDocumenti[5].Causale          := Trim(LO.ReadString('VenditaAlBanco', 'Doc6_Causale', ''));
    DatiDocumenti[5].AzioneMagazzino  := Trim(LO.ReadString('VenditaAlBanco', 'Doc6_AzioneMagazzino', '='));
    DatiDocumenti[5].AzioneCantiere   := Trim(LO.ReadString('VenditaAlBanco', 'Doc6_AzioneCantiere', '='));
  finally
    LO.Free;
  end;
end;


procedure TVendBancoSeleCantForm.VisualizzaPulsantiDocumenti;
begin
  ButtonDoc1.Visible := DatiDocumenti[0].Visible;
  ButtonDoc1.Caption := DatiDocumenti[0].Caption;
  ButtonDoc1.Font.Size := DatiDocumenti[0].FontSize;
  if DatiDocumenti[0].FontBold then ButtonDoc1.Font.Style := [fsBold] else  ButtonDoc1.Font.Style := [];

  ButtonDoc2.Visible := DatiDocumenti[1].Visible;
  ButtonDoc2.Caption := DatiDocumenti[1].Caption;
  ButtonDoc2.Font.Size := DatiDocumenti[1].FontSize;
  if DatiDocumenti[1].FontBold then ButtonDoc2.Font.Style := [fsBold] else  ButtonDoc2.Font.Style := [];

  ButtonDoc3.Visible := DatiDocumenti[2].Visible;
  ButtonDoc3.Caption := DatiDocumenti[2].Caption;
  ButtonDoc3.Font.Size := DatiDocumenti[2].FontSize;
  if DatiDocumenti[2].FontBold then ButtonDoc3.Font.Style := [fsBold] else  ButtonDoc3.Font.Style := [];

  ButtonDoc4.Visible := DatiDocumenti[3].Visible;
  ButtonDoc4.Caption := DatiDocumenti[3].Caption;
  ButtonDoc4.Font.Size := DatiDocumenti[3].FontSize;
  if DatiDocumenti[3].FontBold then ButtonDoc4.Font.Style := [fsBold] else  ButtonDoc4.Font.Style := [];

  ButtonDoc5.Visible := DatiDocumenti[4].Visible;
  ButtonDoc5.Caption := DatiDocumenti[4].Caption;
  ButtonDoc5.Font.Size := DatiDocumenti[4].FontSize;
  if DatiDocumenti[4].FontBold then ButtonDoc5.Font.Style := [fsBold] else  ButtonDoc5.Font.Style := [];

  ButtonDoc6.Visible := DatiDocumenti[5].Visible;
  ButtonDoc6.Caption := DatiDocumenti[5].Caption;
  ButtonDoc6.Font.Size := DatiDocumenti[5].FontSize;
  if DatiDocumenti[5].FontBold then ButtonDoc6.Font.Style := [fsBold] else  ButtonDoc6.Font.Style := [];
end;


procedure TVendBancoSeleCantForm.PosizionaPulsanti;
var
  i, x, y, ButtonWidth, ButtonHeight: Integer;
begin
  // Posizione iniziale
  x := 0;
  y := 0;
  // Calcolo delle dimensioni dei bottoni
  ButtonWidth   := Trunc((PanelCantieri.Width - LeftMargin - RightMargin - (HorizontalSeparation*(Colonne-1))) / Colonne);
  ButtonHeight  := Trunc((PanelCantieri.Height - TopMargin - BottomMargin - (VerticalSeparation*(Righe-1))) / Righe);
  // Cicla per tutti i bottoni e li posiziona e dimensiona
  for i := 0 to BottoniPerPagina-1 do begin
    Bottoni[i].Left := LeftMargin + (ButtonWidth*x) + (HorizontalSeparation*x);
    Bottoni[i].Top := TopMargin + (ButtonHeight*y) + (VerticalSeparation*y);
    Bottoni[i].Width := ButtonWidth;
    Bottoni[i].Height := ButtonHeight;
    Bottoni[i].LookAndFeel.Kind := ModelButton.LookAndFeel.Kind;
    // Aggiornamento posizione
    Inc(x);
    if x = Colonne then begin
      x := 0;
      Inc(y);
    end;
  end;
end;


procedure TVendBancoSeleCantForm.CaricaLayout;
var
  i: Integer;
  Bottone: TcxButton;
begin
  // Creazione e posizionamento dei bottoni sulla form
  // -------------------------------------------------
  // Cicla per l'asse Y
  for i := 0 to BottoniPerPagina -1 do begin
    // Creazione del pulsante corrente
    Bottone             := TcxButton.Create(Self);
    Bottone.Parent      := PanelCantieri;
    Bottone.Font.Name   := Self.FontName;
    Bottone.Font.Size   := Self.FontSize;
    Bottone.Font.Style  := [fsBold];
    Bottone.OnClick     := ModelButton.OnClick;
    // Carica il bottone appena creato sull'array dei bottoni
    Bottoni[i] := Bottone;
  end;
end;

procedure TVendBancoSeleCantForm.CaricaElencoCantieri;
var
  i: Integer;
  NumRecord: Integer;
begin
  with DM1.QryVendBancoSelCantieri do begin
    // Inizializzazione della query e apertura
    if not Prepared then Prepare;
    Open;
    try
      // Dimensionamento array
      NumRecord := RecordCount;
      SetLength(DatiCantieri, NumRecord);
      // Calcola il numero di totali di pagine
      // NB: Almeno una pagina ci deve essere sempre anche se vuota
      TotPagine := Trunc(NumRecord / BottoniPerPagina);
      if TotPagine = (NumRecord / BottoniPerPagina) then TotPagine := TotPagine -1;
      if TotPagine <= 0 then TotPagine := 1;
      // Ciclo per il caricamento dell'elenco dei cantieri
      for i := 0 to NumRecord-1 do begin
        DatiCantieri[i].Tipo                := FieldByName('TIPO').AsString;
        DatiCantieri[i].Codice              := FieldByName('CODICE').AsInteger;
        DatiCantieri[i].DataApertura        := FieldByName('DATAAPERTURA').AsDateTime;
        DatiCantieri[i].Descrizione         := FieldByName('DESCRIZIONE').AsString;
        DatiCantieri[i].Cliente             := FieldByName('CLIENTE').AsInteger;
        DatiCantieri[i].RagSocCli           := FieldByName('RAGSOCCLI').AsString;
        DatiCantieri[i].IndirizzoDestMerci  := FieldByName('IMMOBINDIRIZZO').AsString;
        DatiCantieri[i].NumCivicoDestMerci  := FieldByName('IMMOBNUMCIVICO').AsString;
        DatiCantieri[i].CittaDEstMerci      := FieldByName('IMMOBLOCALITA').AsString;
        DatiCantieri[i].CAPDestMerci        := FieldByName('IMMOBCAP').AsString;
        DatiCantieri[i].ProvinciaDestMerci  := FieldByName('IMMOBPROVINCIA').AsString;
        Next;
      end;
    finally
      Close;
      Pagina := 1;
    end;
  end;
end;

procedure TVendBancoSeleCantForm.SetButtonHeight(const Value: Integer);
begin
  FButtonHeight := Value;
end;

procedure TVendBancoSeleCantForm.SetButtonWidth(const Value: Integer);
begin
  FButtonWidth := Value;
end;

procedure TVendBancoSeleCantForm.SetColonne(const Value: Integer);
begin
  FColonne := Value;
end;

procedure TVendBancoSeleCantForm.SetRighe(const Value: Integer);
begin
  FRighe := Value;
end;

procedure TVendBancoSeleCantForm.SetPagina(const Value: Integer);
begin
  // Assegna il nuovo valore
  FPagina := Value;
  // Aggiorna la label conla pagina
  LabelPag.Caption := 'Pag.  ' + IntToStr(FPagina) + ' / ' + IntToStr(TotPagine);
  // Aggiorna i pulsanti
  RefreshButtons;
  // Controllo abilitazione pulsanti
  ButtonPrevous.Visible := (FPagina > 1);
  ButtonNext.Visible    := (FPagina < TotPagine);
end;

procedure TVendBancoSeleCantForm.SetTotPagine(const Value: Integer);
begin
  FTotPagine := Value;
end;

procedure TVendBancoSeleCantForm.SetBottoniPerPagina(const Value: Integer);
begin
  FBottoniPerPagina := Value;
end;

procedure TVendBancoSeleCantForm.SetCantiereInizioPagina(
  const Value: Integer);
begin
  FCantiereInizioPagina := Value;
end;

procedure TVendBancoSeleCantForm.SetFontName(const Value: String);
begin
  FFontName := Value;
end;

procedure TVendBancoSeleCantForm.SetFontSize(const Value: Integer);
begin
  FFontSize := Value;
end;

procedure TVendBancoSeleCantForm.SetBottomMargin(const Value: Integer);
begin
  FBottomMargin := Value;
end;

procedure TVendBancoSeleCantForm.SetHorizontalSeparation(
  const Value: Integer);
begin
  FHorizontalSeparation := Value;
end;

procedure TVendBancoSeleCantForm.SetLeftMargin(const Value: Integer);
begin
  FLeftMargin := Value;
end;

procedure TVendBancoSeleCantForm.SetRightMargin(const Value: Integer);
begin
  FRightMargin := Value;
end;

procedure TVendBancoSeleCantForm.SetTopMargin(const Value: Integer);
begin
  FTopMargin := Value;
end;

procedure TVendBancoSeleCantForm.SetVerticalSeparation(
  const Value: Integer);
begin
  FVerticalSeparation := Value;
end;

procedure TVendBancoSeleCantForm.FormResize(Sender: TObject);
begin
  Self.Top    := 0;
  Self.Left   := 0;
  Self.Width  := MainForm.ClientWidth;
  Self.Height := MainForm.ClientHeight;
  PosizionaPulsanti;
  // Se esistente aggiorna anche la form di conferma
  if ConfermaDocExpressMagForm <> nil then begin
    ConfermaDocExpressMagForm.Left := 0;
    ConfermaDocExpressMagForm.Top := 0;
    ConfermaDocExpressMagForm.Width := ClientWidth;
    ConfermaDocExpressMagForm.Height := ClientHeight;
  end;
end;

procedure TVendBancoSeleCantForm.FormCreate(Sender: TObject);
begin
  CaricaParametri;
  VisualizzaPulsantiDocumenti;
  CaricaLayout;
end;

procedure TVendBancoSeleCantForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  VendBancoSeleCantForm := nil;
end;

procedure TVendBancoSeleCantForm.ButtonReloadDataClick(Sender: TObject);
begin
  CaricaElencoCantieri;
  RefreshButtons;
  Self.Update;
  Application.ProcessMessages;
end;

procedure TVendBancoSeleCantForm.FormShow(Sender: TObject);
begin
  ResetDocumentoSelezionato;
  ButtonReloadDataClick(ButtonReloadData);
end;

procedure TVendBancoSeleCantForm.ButtonPrevousClick(Sender: TObject);
begin
  if Pagina > 1 then Pagina := Pagina - 1;
end;

procedure TVendBancoSeleCantForm.ButtonNextClick(Sender: TObject);
begin
  if Pagina < TotPagine then Pagina := Pagina + 1;
end;


procedure TVendBancoSeleCantForm.CreaDocumento(Button: TObject);
begin
  // IMposta il documento con i dati del cantiere selezionato
  with Button as TcxButton do begin
    PreventiviOrdiniForm.QryDocumentoCODICECLIENTE.Value        := DatiCantieri[Tag].Cliente;
    PreventiviOrdiniForm.QryDocumentoPRATICA.Value              := DatiCantieri[Tag].Codice;
    PreventiviOrdiniForm.QryDocumentoDATAPRATICA1.Value         := DatiCantieri[Tag].DataApertura;

    PreventiviOrdiniForm.QryDocumentoRAGSOCDESTMERCI.Value      := DatiCantieri[Tag].Descrizione;
    PreventiviOrdiniForm.QryDocumentoINDIRIZZODESTMERCI.Value   := DatiCantieri[Tag].IndirizzoDestMerci;
    PreventiviOrdiniForm.QryDocumentoNUMCIVICODESTMERCI.Value   := DatiCantieri[Tag].NumCivicoDestMerci;
    PreventiviOrdiniForm.QryDocumentoCITTADESTMERCI.Value       := DatiCantieri[Tag].CittaDEstMerci;
    PreventiviOrdiniForm.QryDocumentoCAPDESTMERCI.Value         := DatiCantieri[Tag].CAPDestMerci;
    PreventiviOrdiniForm.QryDocumentoPROVINCIADESTMERCI.Value   := DatiCantieri[Tag].ProvinciaDestMerci;
  end;
  // Se il flag apposito lo indice importa subito il contenuto del palmare
  if CaricaPalmareAllaSceltaDelCantiere then begin
    PreventiviOrdiniForm.SBImportPalmareClick(PreventiviOrdiniForm.SBImportPalmare);
  end;
  // Se il documento non deve essere visibile per niente bisogna che richiamo
  //  da codice la conferma del documento
  if not VisualizzaDocumento then
    PreventiviordiniForm.SBKioskConfermaDocClick(PreventiviordiniForm.SBKioskConfermaDoc)
  else
    PreventiviordiniForm.AddArt.SetFocus;
end;


procedure TVendBancoSeleCantForm.ModelButtonClick(Sender: TObject);
begin
  // Se il documento non deve essere visibile allora chiede subito la conferma interna
  //  dell'EXPRESS_MAG e non quella deo documento
  if not VisualizzaDocumento then begin
    ChiediConferma(Sender);
  // Altrimenti chiude la form dell'EXPRESS_MAG per rendere visibile il documento
  //  la successiva conferma dovrà essere data dal documento stesso
  end else begin
    CreaDocumento(Sender);
//    Close;
    Self.Hide;
  end;
end;

procedure TVendBancoSeleCantForm.ResetDocumentoSelezionato;
begin
  ButtonDoc1Click(ButtonDoc1);
end;

procedure TVendBancoSeleCantForm.ButtonDoc1Click(Sender: TObject);
begin
  try
    with Sender as TcxButton do begin
      // Prima deseleziona tutti i documenti e seleziona quello su cui si è premuto.
      ButtonDoc1.Colors.Normal := ButtonDoc1.Colors.Default;
      ButtonDoc2.Colors.Normal := ButtonDoc2.Colors.Default;
      ButtonDoc3.Colors.Normal := ButtonDoc3.Colors.Default;
      ButtonDoc4.Colors.Normal := ButtonDoc4.Colors.Default;
      ButtonDoc5.Colors.Normal := ButtonDoc5.Colors.Default;
      ButtonDoc6.Colors.Normal := ButtonDoc6.Colors.Default;
      ButtonDoc1.Colors.Hot    := ButtonDoc1.Colors.Default;
      ButtonDoc2.Colors.Hot := ButtonDoc2.Colors.Default;
      ButtonDoc3.Colors.Hot := ButtonDoc3.Colors.Default;
      ButtonDoc4.Colors.Hot := ButtonDoc4.Colors.Default;
      ButtonDoc5.Colors.Hot := ButtonDoc5.Colors.Default;
      ButtonDoc6.Colors.Hot := ButtonDoc6.Colors.Default;
      Colors.Normal := Colors.Pressed;
      Colors.Hot    := Colors.Pressed;
      // Imposta il nuovo tipo documento
      PreventiviOrdiniForm.TipoDoc                                    := DatiDocumenti[Tag].TipoDocumento;
      PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value            := DatiDocumenti[Tag].TipoDocumento;
      PreventiviOrdiniForm.CambiaTipoDocumento;
      PreventiviOrdiniForm.QryDocumentoCAUSALE.Value                  := DatiDocumenti[Tag].Causale;
      PreventiviOrdiniForm.QryDocumentoSEGNOOPERAZIONE.Value          := DatiDocumenti[Tag].AzioneMagazzino;
      PreventiviOrdiniForm.QryDocumentoSEGNOOPERAZIONECANTIERE.Value  := DatiDocumenti[Tag].AzioneCantiere;
      // IMposta la proprietà che contiene il tipo di documento selezionato
      DescrizioneDocumentoSelezionato := Caption;
    end;
  finally
    // Forza l'aggiornamento dello schermo
    PanelNavigator.Update;
    Application.ProcessMessages;
  end;
end;

procedure TVendBancoSeleCantForm.SetVisualizzaDocumento(
  const Value: Boolean);
begin
  FVisualizzaDocumento := Value;
end;

procedure TVendBancoSeleCantForm.SetCaricaPalmareAllaSceltaDelCantiere(
  const Value: Boolean);
begin
  FCaricaPalmareAllaSceltaDelCantiere := Value;
end;

procedure TVendBancoSeleCantForm.SetDescrizioneDocumentoSelezionato(
  const Value: String);
begin
  FDescrizioneDocumentoSelezionato := Value;
end;

procedure TVendBancoSeleCantForm.SetConfermato(const Value: Boolean);
begin
  FConfermato := Value;
end;

end.
