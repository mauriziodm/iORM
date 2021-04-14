unit eCommerceImport_Common;

interface

uses DecimalRounding_JH1;

type

  // Classe base
  TecBaseClass = class
  strict private
  strict protected
    function Arrotonda(Numero:Double; Decimali:Byte):Double;
    function GUIDAsString: string;
  public
  end;

implementation

uses
  IBODataset, SysUtils;

{ TecBaseClass }

function TecBaseClass.Arrotonda(Numero: Double; Decimali: Byte): Double;
begin
  // NB: Siccome il vecchio metodo mi dava un problema con alcuni numeri
  //     usando il SimpleRoundTo (734,50 con iva al 21% scazzava) ho trovato
  //     alcune discussioni su internet dove effettivamente si parlava di alcuni problemi
  //     del SimpleRoundTo con alcuni particolari numeri e si consigliava di usare questa
  //     funzione DecimalRound facente parte di una libreria DecimalRounding (JH1) che
  //      è nel file "DecimalRounding_JH1.pas"
  Result := DecimalRound(Numero, Decimali, MaxRelErrDbl, drHalfUp);
{
  Negativo := (Numero < 0);
  if Negativo then Numero := Abs(Numero);
  Result := SimpleRoundTo(Numero, (Decimali*(-1)));
  if Negativo then Result := Result * (-1);
}
end;
{
function  TDM1.Arrotonda(Numero:Double; Decimali:Byte):Double;
var
   Moltiplicatore, ParteIntera:Integer;
   NumeroMOltiplicato:Double;
begin
   // Calcola il moltiplicatore
   Moltiplicatore := StrToInt('1' + StringOfChar('0', Decimali));
   // Pone la parte intera del numero e la parte decimale nella rispettiva variabile
   NumeroMoltiplicato := Numero * Moltiplicatore;
   ParteIntera   := Trunc(NumeroMoltiplicato);
   // Se la parte decimale >= 0.5 arrotonda per eccesso, altrimenti per difetto (lo lascia così)
   // ATTENZIONE: Devo controllare se > 0.499999999999 (11 volte 9) perchè se facevo >= 5 non andava bene
   //              a causa dell'errore di precisione nella rappresentazione dei numero in virgola mobile
   //              NON PROVARE A RIMETTERE 0.5 (Per testare provare in un documento con PrzUnit 2,51 e Qtà 12,50
   //              deve risultare un importo 31,38.
   // ATTENZIONE: Ho modificato inserendo questa condizione che in base al segno del numero da arrotondare
   //              si comporta in due modi diversi (dopo che un utente ha segnalato che se in una fattura
   //              mettiamo PrzUnitario = -33156,63 (negativo) e Qtà = 1 l'importoRigo veniva = a 33156,62
   //              con questa modifica ora è tutto corretto
   if Abs(NumeroMoltiplicato - ParteIntera) > 0.499999999999 then begin
      if Numero > 0 then Inc(ParteIntera) else Dec(ParteIntera);
   end;
   // Ridivide per il moltiplicatore
   Result := ParteIntera / Moltiplicatore;
end;
}









function TecBaseClass.GUIDAsString: string;
var
  aGuid: TGUID;
begin
  System.SysUtils.CreateGUID(aGuid);
  Result := GUIDToString(aGuid);
end;

end.
