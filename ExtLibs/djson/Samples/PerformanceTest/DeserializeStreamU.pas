unit DeserializeStreamU;

interface

uses
  System.Generics.Collections, Model, System.JSON.Readers;

type

  TStreamDeserializer = class
  public
    class function Deserialize(const AJSONText:String): TObjectList<TPerson>;
  end;

implementation

uses
  System.Classes, System.JSON.Types;

{ TStreamDeserializer }

class function TStreamDeserializer.Deserialize(
  const AJSONText: String): TObjectList<TPerson>;
var
  LJSONReader: TJSONTextReader;
  LStringReader: TStringReader;
  LNewPerson: TPerson;
begin
  LStringReader := TStringReader.Create(AJSONText);
  LJSONReader := TJsonTextReader.Create(LStringReader);
  Result := TObjectList<TPerson>.Create;
  try
    // Skip the StartArray char
    LJSONReader.Read;
    // Loop
    while LJSONReader.Read do
    begin
      if LJSONReader.TokenType = TJsonToken.StartObject then
      begin
        LJSONReader.Read;
        LNewPerson := TPerson.Create;

        LJSONReader.Read; // Skip ID property name
        LNewPerson.ID := LJSONReader.Value.AsInteger;
        LJSONReader.Read;

        LJSONReader.Read; // Skip Descrizione property name
        LNewPerson.Descrizione := LJSONReader.Value.AsString;
      end
      else
      if LJSONReader.TokenType = TJsonToken.StartArray then
         Continue
      else
      if LJSONReader.TokenType = TJsonToken.EndObject then
        Result.Add(LNewPerson);
    end;
  finally
    LJSONReader.Free;
    LStringReader.Free;
  end;
end;

end.
