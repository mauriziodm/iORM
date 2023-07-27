unit Serializers;

interface

uses System.Rtti, System.JSON, DJSON.Serializers, DJSON.Params, JsonDataObjects,
  System.JSON.Writers, System.JSON.Readers;

type

  // DelphiDOM engine custom serializer
  TStringCustomSerializerDOM = class(TdjDOMCustomSerializer)
  private
    class function ReverseString(const AText:String): String;
  public
    class function Serialize(const AValue:TValue): TJSONValue; override;
    class function Deserialize(const AJSONValue:TJSONValue; const AExistingValue:TValue): TValue; override;
  end;

  // Stream engine custom serializer
  TStringCustomSerializerStream = class(TdjStreamCustomSerializer)
  private
    class function ReverseString(const AText:String): String;
  public
    class procedure Serialize(const AJSONWriter: TJSONWriter; const AValue:TValue); override;
    class function Deserialize(const AJSONReader: TJSONReader; const AExistingValue:TValue): TValue; override;
  end;

implementation

uses
  Model, System.SysUtils, System.JSON.Types;

{ TNumTelCustomSerializer }

class function TStringCustomSerializerDOM.Deserialize(const AJSONValue: TJSONValue;
  const AExistingValue: TValue): TValue;
var
  UnreversedText: String;
begin
  if not (AJSONValue is TJSONString) then
    raise Exception.Create('Wrong serialization.');
  UnreversedText := ReverseString(AJSONValue.Value);
  Result := UnreversedText;
end;

class function TStringCustomSerializerDOM.ReverseString(
  const AText: String): String;
var
  I: Integer;
begin
  for I := High(AText) downto Low(AText) do
    Result := Result + Atext[I];
end;

class function TStringCustomSerializerDOM.Serialize(const AValue: TValue): TJSONValue;
var
  ReversedText: String;
begin
  ReversedText := ReverseString(AValue.AsString);
  Result := TJSONString.Create(ReversedText);
end;

{ TStringCustomSerializerStream }

class function TStringCustomSerializerStream.Deserialize(
  const AJSONReader: TJSONReader; const AExistingValue: TValue): TValue;
var
  UnreversedText: String;
begin
  if AJSONReader.TokenType <> TJsonToken.String then
    raise Exception.Create('Stream serializer: Wrong serialization, string value expected.');
  UnreversedText := ReverseString(AJSONReader.Value.AsString);
  Result := UnreversedText;
end;

class function TStringCustomSerializerStream.ReverseString(
  const AText: String): String;
var
  I: Integer;
begin
  for I := High(AText) downto Low(AText) do
    Result := Result + Atext[I];
end;

class procedure TStringCustomSerializerStream.Serialize(
  const AJSONWriter: TJSONWriter; const AValue: TValue);
var
  ReversedText: String;
begin
  ReversedText := ReverseString(AValue.AsString);
  AJSONWriter.WriteValue(ReversedText);
end;

end.
