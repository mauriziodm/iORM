unit DeserializeJDOU;

interface

uses
  JsonDataObjects, System.Generics.Collections, Model;

type

  TJDODeserializer = class
  public
    class function Deserialize(const AJSONText:String): TObjectList<TPerson>;
  end;

implementation

{ TDOMDeserializer }

class function TJDODeserializer.Deserialize(
  const AJSONText:String): TObjectList<TPerson>;
var
  I: Integer;
  LJSONObject: TJSONObject;
  LJSONArray: TJsonArray;
  LNewPerson: TPerson;
begin
  Result := TObjectList<TPerson>.Create;
  LJSONArray := TJSONObject.Parse(AJSONText) as TJSONArray;
  try
    for LJSONObject in LJSONArray do
    begin
      LNewPerson := TPerson.Create;
      LNewPerson.ID := LJSONObject['ID'];
      LNewPerson.Descrizione := LJSONObject['Descrizione'];
      Result.Add(LNewPerson);
    end;
  finally
    LJSONArray.Free;
  end;
end;

end.
