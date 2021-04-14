unit USNCONTROLLO_CF_PI;

interface
uses sysutils, system.Character, StrUtils;

type tsetcaratteri = set of char;
//var

function controllo_codice_fiscale_partita_iva(codice, nome, cognome: string): boolean;
function controllo_partita_iva(cPIVA: string): boolean;
function calcolo_codice_fiscale(cognome, nome: string; sesso: char; giorno, mese, anno: word; cod_catastale_comune: string):string;
function filtrastringa(s: string; setcar: tsetcaratteri): string;
function controllo_cin(codice: string): string;
function ripristino_codice_fiscale_omocodia(codice: string): string;
function controllo_nome_cognome_codice_fiscale(const ANome, ACognome, ACodFiscToCheck: String): boolean;

implementation

const
      insieme_consonanti: tsetcaratteri = ['A'..'Z']-['A','E','I','O','U'];
      insieme_vocali: tsetcaratteri = ['A','E','I','O','U'];
      codici_mesi: String = 'ABCDEHLMPRST';
      codici_controllo: String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function filtrastringa(s: string; setcar: tsetcaratteri): string;
var
  i: integer;
  t: string;
begin
  t := '';
  for i := 1 to length(s) do
    if s[i] in setcar then
      t := t + s[i];
  result := t;
end;

function calcolo_codice_fiscale(cognome, nome: string; sesso: char; giorno, mese, anno: word; cod_catastale_comune: string): string;
var
  i: integer;
  consonanti_cognome, consonanti_nome,vocali_nome, vocali_cognome: string;
  cod_anno, cod_mese, cod_giorno, cod_nome, cod_cognome: string;
begin
  // se mancano dati esco subito
  if (sesso = '') or (cognome = '') or (nome = '') or (cod_catastale_comune = '') then
  begin
    result := '';
    exit;
  end;

  sesso := upcase(sesso);

  cognome := filtrastringa(uppercase(trim(cognome)), ['A'..'Z']);
  nome := filtrastringa(uppercase(trim(nome)), ['A'..'Z']);
  consonanti_cognome := filtrastringa(cognome, insieme_consonanti);
  consonanti_nome := filtrastringa(nome, insieme_consonanti);
  vocali_cognome := filtrastringa(cognome, insieme_vocali);
  vocali_nome := filtrastringa(nome, insieme_vocali);
  cod_cognome := copy(consonanti_cognome + vocali_cognome + 'XX', 1, 3);
  cod_nome := consonanti_nome + vocali_nome + 'XX';
  if (length(consonanti_nome) > 3) then
  begin
    delete(cod_nome, 2, 1);
  end;
  cod_nome := copy(cod_nome, 1, 3);
  cod_anno := format('%.2d', [anno mod 100]);

  cod_mese := codici_mesi[mese];

  if (sesso = 'F') then
  begin
    giorno := giorno + 40;
  end;

  cod_giorno := format('%.2d', [giorno]);

  result := cod_cognome + cod_nome + cod_anno + cod_mese + cod_giorno + cod_catastale_comune;
  result := result + controllo_cin(result);
end;

// ------------- MAURIZIO DEL MAGNO (PER OMOCODIA) -------------------
// Questa funzione controlla se dove ci dovrebbero essere dei numeri
//  ci sono invece delle lettere e in tal caso ripristina il numero
//  originario per poi proseguire con il controllo del codice fiscale stesso
//  (questo capito nei casi di omocodia)
function ripristino_codice_fiscale_omocodia(codice: string): string;
const
  DIGIT_POS: array[1..7] of byte = (7, 8, 10, 11, 13, 14, 15);
var
  I: integer;
  CC: String;
begin
  result := codice;
  for I := 1 to Length(DIGIT_POS) do
    if not IsDigit(result, DIGIT_POS[I]) then
      result[DIGIT_POS[I]] := chr(Pos(result[DIGIT_POS[I]], 'LMNPQRSTUV')+47);
end;
// ------------- MAURIZIO DEL MAGNO (PER OMOCODIA) -------------------

// ------------- MAURIZIO DEL MAGNO (PER VERIFICA PRIMI SEI CARATTERI) -------------------
function controllo_nome_cognome_codice_fiscale(const ANome, ACognome, ACodFiscToCheck: String): boolean;
var
  LCodFisc: String;
begin
  LCodFisc := calcolo_codice_fiscale(ACognome, ANome, 'M', 1, 1, 2000, 'H274');
  Result := (Length(ACodFiscToCheck) = 16) and (Length(LCodFisc) = 16) and (LeftStr(ACodFiscToCheck, 6) = LeftStr(LCodFisc, 6));
end;
// ------------- MAURIZIO DEL MAGNO (PER VERIFICA PRIMI SEI CARATTERI) -------------------


function Controllo_Codice_Fiscale_Partita_Iva(Codice, nome, cognome: string): Boolean;
var
  I, Somma, Numero, Risultato: LongInt;
  Mesi: string[12];
  Carattere, Cin: string[1];
  Alfabet: string[26];
begin
  result := true;

  codice := trim(codice);
  nome := Uppercase(Trim(nome));
  cognome := Uppercase(Trim(cognome));

  if (Length(codice) = 11) then
  begin
    if not controllo_partita_iva(codice) then
    begin
      result := false;
    end;
  end
  else
  begin
// ------------- MAURIZIO DEL MAGNO (PER OMOCODIA) -------------------
    // HO spostato il controllo del cin all'inizio perchè altrimenti
    //  avevo rpoblemi in caso di omocodia
    cin := controllo_cin(codice);
    if Cin <> UpperCase(Copy(Codice, 16, 1)) then
      Exit(False);

    // IN caso di omocodia ripristino i caratteri numerici eventualmente
    //  sostituiti per risolvere il conflitto e prosegue il resto
    //  dei controlli
    codice := ripristino_codice_fiscale_omocodia(codice);
// ------------- MAURIZIO DEL MAGNO (PER OMOCODIA) -------------------

// ------------- MAURIZIO DEL MAGNO (PER VERIFICA PRIMI SEI CARATTERI) -------------------
    // Effettua la verifica solo se il nome il cognome sono stati forniti
    //  NB: Ho fatto così perchè ad esempio anel controllo che si effettua
    //       all'interno del documento non ci sono nome e cognome
    if (nome <> '') and (cognome <> '') and not controllo_nome_cognome_codice_fiscale(nome, cognome, codice) then
      Exit(False);
// ------------- MAURIZIO DEL MAGNO (PER VERIFICA PRIMI SEI CARATTERI) -------------------

    Alfabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Mesi := 'ABCDEHLMPRST';

    // Controllo lunghezza Codice Fiscale
    if Length(Codice) <> 16 then
      Exit(False);

    for I := 1 to 6 do // I primi 6 caratteri sono alfabetici
      if (UpperCase(Copy(Codice, I, 1)) < 'A') or
        (UpperCase(Copy(Codice, I, 1)) > 'Z') then
      begin
        Result := False;
        Exit;
      end;

    for I := 7 to 8 do // Caratteri 7 e 8 sono numerici
    begin
      try
        Numero := StrToInt(Copy(Codice, I, 1));
        if numero <> 0 then
          ;
      except
        Result := False;
        Exit;
      end;
    end;
    // Il 9° carattere fa parte del gruppo alfabetico
    for I := 1 to 12 do // per la codifica del mese di nascita
      if UpperCase(Copy(Codice, 9, 1)) = Copy(Mesi, I, 1) then
        Break
      else if I = 12 then
      begin
        Result := False;
        Exit;
      end;

    try // 10° e 11° carattere sono numerici - per codifica del giorno di nascita
      Numero := StrToInt(Copy(Codice, 10, 2));
      if numero < 0 then
        ;
      if ((Copy(Codice, 10, 2) < '01')) or ((Copy(Codice, 10, 2) > '71')) or
        ((Copy(Codice, 10, 2) > '31') and (Copy(Codice, 10, 2) < '41')) then
      begin
        Result := False;
        Exit;
      end;
    except
      Result := False;
      Exit;
    end;

    if (UpperCase(Copy(Codice, 12, 1)) < 'A') or // Il 12° carattere è  alfabetico
      (UpperCase(Copy(Codice, 12, 1)) > 'Z') then // (comune, campio 1)
    begin
      Result := False;
      Exit;
    end;

    for I := 13 to 15 do // 13°, 14° e 15° carattere sono numerici
    begin // (comune, campi 2, 3, 4)
      try
        Numero := StrToInt(Copy(Codice, I, 1));
        if numero < 0 then
          ;
      except
        Result := False;
        Exit;
      end;
    end;

  end;
end;

function controllo_cin(codice: string): string;
var
  I, Somma, Numero, Risultato: LongInt;
  Mesi: string[12];
  Carattere: string[1];
  Alfabet: string[26];
begin
    Somma := 0;
    Alfabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    I := 1;
    while I < 16 do
    begin
      Carattere := Copy(Codice, I, 1);
      if (Carattere = '0') or (UpperCase(Carattere) = 'A') then
        Somma := Somma + 1
      else if (Carattere = '1') or (UpperCase(Carattere) = 'B') then
        Somma := Somma + 0
      else if (Carattere = '2') or (UpperCase(Carattere) = 'C') then
        Somma := Somma + 5
      else if (Carattere = '3') or (UpperCase(Carattere) = 'D') then
        Somma := Somma + 7
      else if (Carattere = '4') or (UpperCase(Carattere) = 'E') then
        Somma := Somma + 9
      else if (Carattere = '5') or (UpperCase(Carattere) = 'F') then
        Somma := Somma + 13
      else if (Carattere = '6') or (UpperCase(Carattere) = 'G') then
        Somma := Somma + 15
      else if (Carattere = '7') or (UpperCase(Carattere) = 'H') then
        Somma := Somma + 17
      else if (Carattere = '8') or (UpperCase(Carattere) = 'I') then
        Somma := Somma + 19
      else if (Carattere = '9') or (UpperCase(Carattere) = 'J') then
        Somma := Somma + 21
      else if UpperCase(Carattere) = 'K' then
        Somma := Somma + 2
      else if UpperCase(Carattere) = 'L' then
        Somma := Somma + 4
      else if UpperCase(Carattere) = 'M' then
        Somma := Somma + 18
      else if UpperCase(Carattere) = 'N' then
        Somma := Somma + 20
      else if UpperCase(Carattere) = 'O' then
        Somma := Somma + 11
      else if UpperCase(Carattere) = 'P' then
        Somma := Somma + 3
      else if UpperCase(Carattere) = 'Q' then
        Somma := Somma + 6
      else if UpperCase(Carattere) = 'R' then
        Somma := Somma + 8
      else if UpperCase(Carattere) = 'S' then
        Somma := Somma + 12
      else if UpperCase(Carattere) = 'T' then
        Somma := Somma + 14
      else if UpperCase(Carattere) = 'U' then
        Somma := Somma + 16
      else if UpperCase(Carattere) = 'V' then
        Somma := Somma + 10
      else if UpperCase(Carattere) = 'W' then
        Somma := Somma + 22
      else if UpperCase(Carattere) = 'X' then
        Somma := Somma + 25
      else if UpperCase(Carattere) = 'Y' then
        Somma := Somma + 24
      else if UpperCase(Carattere) = 'Z' then
        Somma := Somma + 23;
      I := I + 2;
    end;

    I := 2;
    while I < 15 do
    begin
      Carattere := Copy(Codice, I, 1);
      if (Carattere = '0') or (UpperCase(Carattere) = 'A') then
        Somma := Somma + 0
      else if (Carattere = '1') or (UpperCase(Carattere) = 'B') then
        Somma := Somma + 1
      else if (Carattere = '2') or (UpperCase(Carattere) = 'C') then
        Somma := Somma + 2
      else if (Carattere = '3') or (UpperCase(Carattere) = 'D') then
        Somma := Somma + 3
      else if (Carattere = '4') or (UpperCase(Carattere) = 'E') then
        Somma := Somma + 4
      else if (Carattere = '5') or (UpperCase(Carattere) = 'F') then
        Somma := Somma + 5
      else if (Carattere = '6') or (UpperCase(Carattere) = 'G') then
        Somma := Somma + 6
      else if (Carattere = '7') or (UpperCase(Carattere) = 'H') then
        Somma := Somma + 7
      else if (Carattere = '8') or (UpperCase(Carattere) = 'I') then
        Somma := Somma + 8
      else if (Carattere = '9') or (UpperCase(Carattere) = 'J') then
        Somma := Somma + 9
      else if UpperCase(Carattere) = 'K' then
        Somma := Somma + 10
      else if UpperCase(Carattere) = 'L' then
        Somma := Somma + 11
      else if UpperCase(Carattere) = 'M' then
        Somma := Somma + 12
      else if UpperCase(Carattere) = 'N' then
        Somma := Somma + 13
      else if UpperCase(Carattere) = 'O' then
        Somma := Somma + 14
      else if UpperCase(Carattere) = 'P' then
        Somma := Somma + 15
      else if UpperCase(Carattere) = 'Q' then
        Somma := Somma + 16
      else if UpperCase(Carattere) = 'R' then
        Somma := Somma + 17
      else if UpperCase(Carattere) = 'S' then
        Somma := Somma + 18
      else if UpperCase(Carattere) = 'T' then
        Somma := Somma + 19
      else if UpperCase(Carattere) = 'U' then
        Somma := Somma + 20
      else if UpperCase(Carattere) = 'V' then
        Somma := Somma + 21
      else if UpperCase(Carattere) = 'W' then
        Somma := Somma + 22
      else if UpperCase(Carattere) = 'X' then
        Somma := Somma + 23
      else if UpperCase(Carattere) = 'Y' then
        Somma := Somma + 24
      else if UpperCase(Carattere) = 'Z' then
        Somma := Somma + 25;
      I := I + 2;
    end;

    Risultato := round(Somma - (Int(Somma / 26) * 26));
    result := Copy(Alfabet, Risultato + 1, 1);
end;

function Controllo_Partita_Iva(cPIva: string): Boolean;
var
  I, Somma, Lunghezza, Cin, VCin: Integer;
  Str_Tmp: string;
begin
  Result := False;
  // Controllo lunghezza partita IVA
  if Length(cPIva) <> 11 then
    Exit(False);
  // Controllo di numericità
  try
    StrToFloat(cPIva);
  except
    Exit;
  end;
  // Recupero il CIN ( 11esimo Numero )
  Cin := StrToInt(Copy(cPIva, 11, 1));
  Somma := 0;
  Str_Tmp := '';
  for I := 1 to 5 do
  begin
    // la seguente istruzione crea la stringa per la futura somma
    // cabbalistica utilizzando le cifre in posizione pari
    Str_Tmp := Str_Tmp + IntToStr(2 * StrToInt(cPIva[I * 2]));
    // la seguente istruzione somma le cifre di posizione dispari
    Somma := Somma + StrToInt(string(cPIva[I * 2 - 1]));
  end;
  // eseguo la somma cabbalistica
  Lunghezza := Length(Str_Tmp);
  for I := 1 to Lunghezza do
    Somma := Somma + StrToInt(string(Str_Tmp[I]));

  // seleziono il primo numero a destra
  Somma := StrToInt(Copy(IntToStr(Somma), Length(IntToStr(Somma)), 1));
  // calcolo il codice di controllo
  VCin := ((10 - Somma) mod 10);

  // controllo del CIN reale con quello calcolato
  Result := (Cin = VCin);
end;


end.
