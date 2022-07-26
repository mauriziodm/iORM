unit DeserializeDOMU;

interface

uses
  System.JSON, System.Generics.Collections, Model;

type

  TDOMDeserializer = class
  public
    class function Deserialize(const AJSONText: String): TObjectList<TPerson>;
  end;

implementation

{ TDOMDeserializer }

class function TDOMDeserializer.Deserialize(
  const AJSONText: String): TObjectList<TPerson>;
var
  I: Integer;
  LJSONObject: TJSONObject;
  LJSONArray: TJSONArray;
  LNewPerson: TPerson;
begin
  Result := TObjectList<TPerson>.Create;
  LJSONArray := TJSONObject.ParseJSONValue(AJSONText) as TJSONArray;
  try
    for I := 0 to LJSONArray.Count-1 do
    begin
      LJSONObject := LJSONArray.Items[I] as TJSONObject;
      LNewPerson := TPerson.Create;
      LNewPerson.ID := (LJSONObject.GetValue('ID') as TJSONNumber).AsInt;
      LNewPerson.Descrizione := LJSONObject.GetValue('Descrizione').Value;
      Result.Add(LNewPerson);
    end;
  finally
    LJSONArray.Free;
  end;
end;

end.
