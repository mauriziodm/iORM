unit QRModelAllegatiVanzo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TModelAllegatiVanzoQR = class(TQuickRep)
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure RedBox_PutCharOnBox(CurrBand: TQRCustomBand; CurrBox: TQRShape; CurrTxt: String);
    procedure SetRedBoxProperties;
  protected
    // Parametri dei CheckBox
    RedCheckBox_Color: TColor;
    RedCheckBox_Pen_Width: Integer;
    RedCheckBox_CheckColor: TColor;
    // Parametri delle caselle normali (quelle dei campi)
    RedBox_Color: TColor;
    RedBox_Pen_Width: Integer;
    RedBox_TextFontName: String;
    RedBox_TextFontSize: Integer;
    RedBox_TextFontStyle: TFontStyles;
    RedBox_TextFontColor: TColor;
    RedBox_TextPosOffsetX: Integer;
    RedBox_TextPosOffsetY: Integer;
    procedure RedBox_PutStringValue(CurrReport:TQuickRep; CurrBand: TQRCustomBand; BoxName: String; Value: String);
    procedure RedBox_PutNumericValue(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName: String; Value: Double; Decimals: Integer; StartingFrom:Integer; BlankIfZero:Boolean=True);
    procedure RedBox_PutSlashedStringValue(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName, Value: String; SlashPos: Integer);
    procedure RedBox_PutDateValue(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName: String; Value: TDateTime; BlankIfZero:Boolean=True);
    procedure RedBox_PutTimeValue(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName: String; Value: TTime; BlankIfZero:Boolean=True);
    procedure RedBox_PutLeftAlignedString(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName, Value: String; FromPos: Integer);
    procedure RedBox_PutRightAlignedString(CurrReport: TQuickRep; CurrBand: TQRCustomBand; BoxName, Value: String; FromPos: Integer);
    procedure RedCheckBox_DrawChecked(CurrBand: TQRCustomBand; CurrBox: TQRShape);
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;
    function ComponiNoteChecks: String;
    function ComponiCampoTecnico: String;
  public

  end;

var
  ModelAllegatiVanzoQR: TModelAllegatiVanzoQR;

implementation

uses StrUtils, Math, FormAllegatiFG;

{$R *.DFM}


procedure TModelAllegatiVanzoQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  // Inizializzazione
  // ----------------
  // Parametri delle caselle relative ai CheckBox
  RedCheckBox_Color := clRed;
  RedCheckBox_Pen_Width := 3;
  RedCheckBox_CheckColor := clBlack;
  // Parametri dei font delle caselle normali (quelle dei campi)
  RedBox_Color := clRed;
  RedBox_Pen_Width := 3;
  RedBox_TextFontName := 'Arial';
  RedBox_TextFontSize := 8;
  RedBox_TextFontStyle := [];
  RedBox_TextFontColor := clBlack;
  RedBox_TextPosOffsetX := 0;
  RedBox_TextPosOffsetY := 2;
  // Colora le caselle
  SetRedBoxProperties;
end;















// Questa funzione ritorna una stringa con tutte le note relative alla parte di tutti i checks dell'allegato
//  questo perchè nel modello della Vanzotech c'è un solo campo note.
function TModelAllegatiVanzoQR.ComponiNoteChecks: String;
var
  TmpStr: String;
begin
  // Note B1
  TmpStr := Trim(AllegatiFGForm.QryAllB_LIBRETTOIMPIANTO_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B2
  TmpStr := Trim(AllegatiFGForm.QryAllB_RAPPCONTRTECN10435_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B3
  TmpStr := Trim(AllegatiFGForm.QryAllB_CERTUNI8364_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B4
  TmpStr := Trim(AllegatiFGForm.QryAllB_DICHCONFIMP_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B5
  TmpStr := Trim(AllegatiFGForm.QryAllB_LIBRUSOBRUCIATORE_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B6
  TmpStr := Trim(AllegatiFGForm.QryAllB_LIBRUSOCALD_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B7
  TmpStr := Trim(AllegatiFGForm.QryAllB_PRATICAISPESL_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B8
  TmpStr := Trim(AllegatiFGForm.QryAllB_CERTPREVINCENDI_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B9
  TmpStr := Trim(AllegatiFGForm.QryAllB_SCHEMIFUNZIDRAUL_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B10
  TmpStr := Trim(AllegatiFGForm.QryAllB_SCHEMIFUNZELETTR_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
end;


// Questa funzione ritorna una stringa con tutte le note relative alla parte di tutti i checks dell'allegato
//  questo perchè nel modello della Vanzotech c'è un solo campo note.
function TModelAllegatiVanzoQR.ComponiCampoTecnico: String;
var
  TmpStr: String;
begin
  // RAGIONE SOCIALE
//  TmpStr := Trim(AllegatiFGForm.QryAllTECNICO_RAGSOC.AsString);
//  if (Result <> '') and (TmpStr <> '') then TmpStr := ' ' + TmpStr;
//  Result := Result + TmpStr;
  // NOME TECNICO
  TmpStr := Trim(AllegatiFGForm.QryAllTECNICO_NOMECOGNOME.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := ' ' + TmpStr;
  Result := Result + TmpStr;
  // TELEFONO
  TmpStr := Trim(AllegatiFGForm.QryAllTECNICO_TELEFONO.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := ' ' + TmpStr;
  Result := Result + TmpStr;
end;




// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
//  sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TModelAllegatiVanzoQR.ConvCoord(Coord:Integer; Fattore:Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;


// =============================================================================
// INIZIO - SISTEMA ADATTAMENTO DELLE CASELLE IN BASE AI PARAMETRI IMPOSTATI
// -----------------------------------------------------------------------------
// Adegua le caselle dei campi normali ai parametri di colore e spessore specificati
procedure TModelAllegatiVanzoQR.SetRedBoxProperties;
var
  CurrComponent: TComponent;
  i: Integer;
begin
  // Cicla per tutti i componenti del report
  for i := 0 to Self.ComponentCount - 1 do begin
    // Punta al componente attuale
    CurrComponent := Self.Components[i];
    // Se è una casellina rossa normale
    if (CurrComponent is TQRShape) and (Uppercase(LeftStr(CurrComponent.Name, 7)) = 'REDBOX_') then begin
      with CurrComponent as TQRShape do begin
        Pen.Width   := RedBox_Pen_Width;
        Pen.Color   := RedBox_Color;
        Frame.Color := RedBox_Color;
      end;
    // Se è una casellina rossa di tipo Check
    end else if (CurrComponent is TQRShape) and (Uppercase(LeftStr(CurrComponent.Name, 12)) = 'REDCHECKBOX_') then begin
      with CurrComponent as TQRShape do begin
        Pen.Width   := RedCheckBox_Pen_Width;
        Pen.Color   := RedCheckBox_Color;
        Frame.Color := RedCheckBox_Color;
      end;
    // Se è una label di separazione di campo (Nelle date o nei numeri con la virgola)
    end else if (CurrComponent is TQRLabel) and (Uppercase(LeftStr(CurrComponent.Name, 9)) = 'REDLABEL_') then begin
      with CurrComponent as TQRLabel do begin
        Font.Color := RedBox_Color;
      end;
    end;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - SISTEMA ADATTAMENTO DELLE CASELLE IN BASE AI PARAMETRI IMPOSTATI
// =============================================================================



// =============================================================================
// INIZIO - SISTEMA DI COMPILAZIONE DELLE CASELLE DEI CHECK BOX
// -----------------------------------------------------------------------------
// Procedure traccia la "X" (o altro)
procedure TModelAllegatiVanzoQR.RedCheckBox_DrawChecked(CurrBand:TQRCustomBand; CurrBox:TQRShape);
var
  CurrCheck: TQRShape;
  Raggio: Integer;
begin
  // Crea il check
  CurrCheck := TQRShape(CurrBand.AddPrintable(TQRShape));
  // IMposta il tipo di check
  CurrCheck.Brush.Style := bsSolid;
  CurrCheck.Brush.Color := RedCheckBox_CheckColor;
  CurrCheck.Pen.Color := RedCheckBox_CheckColor;
  CurrCheck.Shape := qrsCircle;
  // Determina il raggio del cerchio
  Raggio := Min(CurrBox.Width, CurrBox.Height) - 4;
  // Determina le dimensioni e posizione
  CurrCheck.Width  := Raggio;
  CurrCheck.Height := Raggio;
  CurrCheck.Size.Left := CurrBox.Size.Left + ((CurrBox.Size.Width-CurrCheck.Size.Width)/2);
  CurrCheck.Size.Top := CurrBox.Size.Top + ((CurrBox.Size.Height-CurrCheck.Size.Height)/2);
end;
// -----------------------------------------------------------------------------
// INIZIO - SISTEMA DI COMPILAZIONE DELLE CASELLE DEI CHECK BOX
// =============================================================================









// =============================================================================
// INIZIO - SISTEMA DI COMPILAZIONE DELLE CASELLE DEI CAMPI NORMALI
// -----------------------------------------------------------------------------
// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
procedure TModelAllegatiVanzoQR.RedBox_PutStringValue(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:String);
begin
  // Deve essere tutto maiuscolo
  Value := Trim(Uppercase(Value));
  // Stampa la stringa con allineamento a SX
  RedBox_PutLeftAlignedString(CurrReport, CurrBand, BoxName, Value, 1);
end;

// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
procedure TModelAllegatiVanzoQR.RedBox_PutDateValue(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:TDateTime; BlankIfZero:Boolean=True);
begin
  // Se il valore da stampare è zero ed è stato specificato di non stampare nulla in questo caso...
  if (Value = 0) and BlankIfZero then Exit;
  // Stampa la stringa con allineamento a SX
  RedBox_PutLeftAlignedString(CurrReport, CurrBand, BoxName, FormatDateTime('ddmmyyyy', Value), 1);
end;

// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
procedure TModelAllegatiVanzoQR.RedBox_PutTimeValue(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:TTime; BlankIfZero:Boolean=True);
begin
  // Se il valore da stampare è zero ed è stato specificato di non stampare nulla in questo caso...
  if (Value = 0) and BlankIfZero then Exit;
  // Stampa la stringa con allineamento a SX
  RedBox_PutLeftAlignedString(CurrReport, CurrBand, BoxName, FormatDateTime('hhnn', Value), 1);
end;

// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
procedure TModelAllegatiVanzoQR.RedBox_PutNumericValue(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:Double; Decimals:Integer; StartingFrom:Integer; BlankIfZero:Boolean=True);
var
  Moltiplicatore, i, IntValue: Integer;
begin
  // Se il valore da stampare è zero ed è stato specificato di non stampare nulla in questo caso...
  if (Value = 0) and BlankIfZero then Exit;
  // Determina il moltiplicatore
  Moltiplicatore := 1;
  for i := 1 to Decimals do Moltiplicatore := Moltiplicatore * 10;
  // Ottiene il valore da stampare
  Value := Value * Moltiplicatore;
  // Elimina gli eventuali decimali eccedenti la precisione richiesta
  IntValue := Trunc(Value);
  // Stampa il numero con allineamento a DX
  RedBox_PutRightAlignedString(CurrReport, CurrBand, BoxName, IntToStr(IntValue), StartingFrom);
end;

// Procedure che si occupa di stampare il campo specificato CONTENENTE UNO SLASH
procedure TModelAllegatiVanzoQR.RedBox_PutSlashedStringValue(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:String; SlashPos:Integer);
var
  i: Integer;
  CurrComponent: TComponent;
  ValuePreSlash, ValuePostSlash: String;
  SepPos: Integer;
begin
  // Deve essere tutto maiuscolo
  Value := Trim(Uppercase(Value));
  // Determina la posizione dell'eventuale Slash nella strigna da stampare
  // NB: Sia per "/" che per "\"
  SepPos := Pos('/', Value);
  if SepPos = 0 then SepPos := Pos('\', Value);
  // Se lo slash non è stato trovato ValuePreSlash equivale all'intero Value
  if SepPos = 0 then ValuePreSlash := Value
  // Se invece è stato trovato divide Value in due parti, quella prima  e quella dopo lo slash stesso.
  else begin
    ValuePreSlash := LeftStr(Value, SepPos-1);
    ValuePostSlash := RightStr(Value, Length(Value)-SepPos);
  end;
  // Stampa la parte a SX dello slash con allineamento a DX
  RedBox_PutRightAlignedString(CurrReport, CurrBand, BoxName, ValuePreSlash, SlashPos);
  // Stampa la parte a DX dello slash con allineamento a SX
  RedBox_PutLeftAlignedString(CurrReport, CurrBand, BoxName, ValuePostSlash, SlashPos+1);
end;

// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
//  con allineamento a SX e iniziando da una certa casella se specificato
procedure TModelAllegatiVanzoQR.RedBox_PutLeftAlignedString(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:String; FromPos:Integer);
var
  i: Integer;
  CurrComponent: TComponent;
begin
  // Inizializzazione
  if FromPos > 0 then Dec(FromPos);
  // Cicla per tutti i caratteri della stringa da stampare
  for i := 1 to Length(Value) do begin
    // Cerca la casella in cui inserire il carattere attuale
    CurrComponent := CurrReport.FindComponent(BoxName + IntToStr(i+FromPos));
    // Se la casella non è stata trovata  procede con il prox. carattere
    if (CurrComponent = nil) or not (CurrComponent is TQRShape) then Continue;
    // Se arriva qui richiama la procedura che si occuperà di inserire il carattere
    //  corrente nella casella trovata.
    RedBox_PutCharOnBox(CurrBand, CurrComponent as TQRShape, Value[i]);
  end;
end;

// Procedure che si occupa di stampare il campo specificato nelle rispettive caselle
//  con allineamento a DX e iniziando da una certa casella
procedure TModelAllegatiVanzoQR.RedBox_PutRightAlignedString(CurrReport:TQuickRep; CurrBand:TQRCustomBand; BoxName:String; Value:String; FromPos:Integer);
var
  i: Integer;
  CurrComponent: TComponent;
begin
  // Cicla per tutti i caratteri della stringa da stampare
  for i := Length(Value) downto 1 do begin
    // Cerca la casella in cui inserire il carattere attuale
    CurrComponent := CurrReport.FindComponent(BoxName + IntToStr(FromPos));
    // Se la casella non è stata trovata  procede con il prox. carattere
    if (CurrComponent = nil) or not (CurrComponent is TQRShape) then Continue;
    // Se arriva qui richiama la procedura che si occuperà di inserire il carattere
    //  corrente nella casella trovata.
    RedBox_PutCharOnBox(CurrBand, CurrComponent as TQRShape, Value[i]);
    // Decrementa FromPos per trovare la prox. casella (che poi in realtà è la precedente)
    Dec(FromPos);
  end;
end;

// Procedure che crea e posizione una TLabel con la lettera ricevuta e la posizione
//  all'interno della casella ricevuta con i dovuti parametri
procedure TModelAllegatiVanzoQR.RedBox_PutCharOnBox(CurrBand:TQRCustomBand; CurrBox:TQRShape; CurrTxt:String);
var
  CurrLabel: TQRLabel;
begin
  // Crea la nuova QRLabel
  CurrLabel := TQRLabel(CurrBand.AddPrintable(TQRLabel));
  // Ne imposta il font
  CurrLabel.Font.Name := RedBox_TextFontName;
  CurrLabel.Font.Size := RedBox_TextFontSize;
  CurrLabel.Font.Style := RedBox_TextFontStyle;
  CurrLabel.Font.Color := RedBox_TextFontColor;
  CurrLabel.Transparent := True;
  // Imposta il testo
  CurrLabel.Alignment := taCenter;
  CurrLabel.Caption := CurrTxt;
  // IMposta posizione
  CurrLabel.Left := CurrBox.Left + RedBox_TextPosOffsetX;
  CurrLabel.Top := CurrBox.Top + RedBox_TextPosOffsetY;
  // Imposta le dimensioni
  CurrLabel.Width := CurrBox.Width;
  CurrLabel.Height := CurrBox.Height;
end;
// -----------------------------------------------------------------------------
// FINE - SISTEMA DI COMPILAZIONE DELLE CASELLE DEI CAMPI NORMALI
// =============================================================================

end.
