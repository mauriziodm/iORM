unit DComCrypto;

interface

uses SysUtils;

const
  KEY = 'maurostronzo491scfr2sud224spth3cla';

// Primo sistema
function CleanStringFromSeparators(CryptedCode:String): String;
function VerifyString_XOR(SourceCode,CryptedCode:String; Key:String=KEY): Boolean;
function CryptString_XOR(SourceCode:String; Key:String=KEY):String;

// Secondo sistema
function SimpleEncrypt(const Value : String) : String;
function SimpleDecrypt(const Value : String) : String;


implementation


// Funzione che ritorna la stringa contenente un codice criptato
//  eliminando però tutti i caratteri che non siano numero o lettere
//  maiuscole (praticamente toglie gli eventuali separatori.
function CleanStringFromSeparators(CryptedCode:String): String;
var
  i, CurrCharCode: Integer;
begin
  // Inizializzazione
  Result := '';
  // CleanedCryptedCode deve contenere il codice criptato da verificare senza caratteri separatori
  //  CIcla per tutti i caratteri di CryptedCode e li ricopia su CleanedCryptedCode togliendo
  //  tutti i caratteri che non siano numeri oppure lettere maiuscole.
  for i := 1 to Length(CryptedCode) do begin
    CurrCharCode := Ord(CryptedCode[i]);
    if ((CurrCharCode >= 48) and (CurrCharCode <= 57))
    or ((CurrCharCode >= 65) and (CurrCharCode <= 90))
    then Result := Result + CryptedCode[i];
  end;
  Result := Trim(Result);
end;

// Funzione che ritorna True se i dati forniti corrispondono al codice di attivazione fornito
function VerifyString_XOR(SourceCode,CryptedCode:String; Key:String=KEY): Boolean;
begin
  // Inizializzazione
  Result := False;
  // Ripulisce il CryptedCode dagli eventuali separatori
  CryptedCode := CleanStringFromSeparators(CryptedCode);
  // Calcola un nuovo codice criptato in base alla SourceCode fornito
  SourceCode := CleanStringFromSeparators(CryptString_XOR(SourceCode));
  // Restituisce il risultato
  Result := (CryptedCode = SourceCode);
end;


// FUnzione che ritorna la stringa ricevuto in forma criptata con un separatore
//  "-" ogni 5 caratteri
function CryptString_XOR(SourceCode:String; Key:String=KEY): String;
var
  FinalCode: String;
  CurrKeyIndex, i, CurrCharCode: Integer;
begin
  // Inizializzazione
  Result := '';
  FinalCode := '';
  Key := 'maurostronzo491scfr2sud224spth3cla';
  // IMposta a 1 (primo carattere) l'indice relativo al carattere da utilizzare per l'XOR relativo alla chiave
  CurrKeyIndex := 1;
  // Cicla per tutti i caratteri della stringa da criptare
  for i := 1 to Length(SourceCode) do begin
    // Calcola il codice del carattere criptato attuale.
    CurrCharCode := (   ord(SourceCode[i]) xor ord(Key[CurrKeyIndex])   );
    // Se il codice del carattere attuale è compreso nelle lettere o nei numeri
    //  non fa nessun altra elaborazione
    if ((CurrCharCode >= 48) and (CurrCharCode <= 57))
    or ((CurrCharCode >= 65) and (CurrCharCode <= 90))
    then begin
      // Non fa nulla
    end else begin
      // Altrimenti se è inferiore al codice della "A" lo ricalcola in modo che
      //  rientri nelle lettere maiuscole
      if CurrCharCode < 65 then begin
        while CurrCharCode < 65 do Inc(CurrCharCode, 25); // 25 è la differenza tra 90 (cod ASCII della "Z") e 65 (cod ASCII della "A")
      // Se invece è superiore alla "Z" lo ricalcola in modo che rientri nelle lettere maiuscole
      end else if CurrCharCode > 90 then begin
        while CurrCharCode > 90 do Dec(CurrCharCode, 25); // 25 è la differenza tra 90 (cod ASCII della "Z") e 65 (cod ASCII della "A")
      end;
    end;
    // Aggiunge a FinalCode il carattere appena elaborato
    FinalCode := FinalCode + Chr(   CurrCharCode   );
    // Incrementa l'indice che punta al carattera da utilizzare della chiave
    inc(CurrKeyIndex);
    // Se l'indice relativo alla chiave è più grande della lunghezza della chiave stessa
    //  lo riporta ad 1
    if CurrKeyIndex > Length(Key) then CurrKeyIndex := 1;
  end;
  // Ritorna la stringa criptata mettendo anche un carattere '-' ogni 5 caratteri per migliorare la leggibilità
  CurrKeyIndex := 1;
  for i := 1 to Length(FinalCode) do begin
    // Se CurrKeyIndex > 5 aggiunge un carattere separatore per migliore leggibilità
    if CurrKeyIndex > 5 then begin
      Result := Result + ' - ';
      CurrKeyIndex := 1;
    end;
    // Aggiunge il carattere finale
    Result := Result + FinalCode[i];
    // Incrementa il contatore
    inc(CurrKeyIndex);
  end;
end;




function SimpleEncrypt(const Value : String) : String;
const
  KEY = 6;
  SUBKEY = 3;
var
  I : integer;
begin
  Result := '';
  I := 1;
  while I <= Length(Value) do
  begin
    Result := Result + chr(ord(Value[I]) - KEY);
    Result := Result + chr(ord(Value[I]) - SUBKEY);
    inc(I);
  end;
end;

function SimpleDecrypt(const Value : String) : String;
const
  KEY = 6;
  SUBKEY = 3;
var
  I : integer;
begin
  Result := '';
  I := 1;
  while I <= (Length(Value)) do
  begin
    Result := Result + chr(ord(Value[I]) + KEY);
    inc(I, 2);
  end;
end;

end.
