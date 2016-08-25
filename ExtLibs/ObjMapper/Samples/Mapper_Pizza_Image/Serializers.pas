unit Serializers;

interface

uses ObjMapper.Engine, System.Rtti, System.JSON;

type

  TStringCustomSerializer = class(TomCustomSerializer)
  private
    class function ReverseString(const AText:String): String;
  public
    class function Serialize(const AValue:TValue; const AParams:IomParams; var ADone:Boolean): TJSONValue; override;
    class function Deserialize(const AJSONValue:TJSONValue; const AExistingValue:TValue; const AParams:IomParams; var ADone:Boolean): TValue; override;
  end;

implementation

uses
  Model, System.SysUtils;

{ TNumTelCustomSerializer }

class function TStringCustomSerializer.Deserialize(const AJSONValue: TJSONValue;
  const AExistingValue: TValue; const AParams: IomParams;
  var ADone: Boolean): TValue;
var
  UnreversedText: String;
begin
  if not (AJSONValue is TJSONString) then
    raise Exception.Create('Wrong serialization.');
  UnreversedText := ReverseString(AJSONValue.Value);
  Result := UnreversedText;
  ADone := true;
end;

class function TStringCustomSerializer.ReverseString(
  const AText: String): String;
var
  I: Integer;
begin
  for I := High(AText) downto Low(AText) do
    Result := Result + Atext[I];
end;

class function TStringCustomSerializer.Serialize(const AValue: TValue;
  const AParams: IomParams; var ADone: Boolean): TJSONValue;
var
  ReversedText: String;
begin
  ReversedText := ReverseString(AValue.AsString);
  Result := TJSONString.Create(ReversedText);
  ADone := True;
end;

end.
