unit Serializers;

interface

uses DJSON.Serializers, System.Rtti, System.JSON, JsonDataObjects,
  System.JSON.Writers, System.JSON.Readers;

type

  // DelphiDOM engine custom serializer
  TPhoneNumberCustomSerializerDOM = class(TdjDOMCustomSerializer)
  public
    class function Serialize(const AValue:TValue): TJSONValue; override;
    class function Deserialize(const AJSONValue:TJSONValue; const AExistingValue:TValue): TValue; override;
    class function isTypeNotificationCompatible: Boolean; override;
  end;

  // JDO engine custom serializer
  TPhoneNumberCustomSerializerJDO = class(TdjJDOCustomSerializer)
  public
    class procedure Serialize(const AJSONValue:PJsonDataValue; const AValue:TValue); override;
    class function Deserialize(const AJSONValue:PJsonDataValue; const AExistingValue:TValue): TValue; override;
    class function isTypeNotificationCompatible: Boolean; override;
  end;

  // DelphiStream engine custom serializer
  TPhoneNUmberCustomSerializerStream = class(TdjStreamCustomSerializer)
  public
    class procedure Serialize(const AJSONWriter: TJSONWriter; const AValue:TValue); override;
    class function Deserialize(const AJSONReader: TJSONReader; const AExistingValue:TValue): TValue; override;
    class function isTypeNotificationCompatible: Boolean; override;
  end;

implementation

uses
  Model, System.SysUtils, System.Classes;

{ TPhoneNumberCustomSerializer }

class function TPhoneNumberCustomSerializerDOM.Deserialize(const AJSONValue: TJSONValue;
  const AExistingValue: TValue): TValue;
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := AJSONValue.Value;
    LNumTel := TNumTel.Create(LStringList[0].ToInteger, LStringList[2], LStringList[1].ToInteger);
    Result := TValue.From<TNumTel>(LNumTel);
  finally
    LStringList.Free;
  end;
end;

class function TPhoneNumberCustomSerializerDOM.isTypeNotificationCompatible: Boolean;
begin
  Result := True;
end;

class function TPhoneNumberCustomSerializerDOM.Serialize(const AValue: TValue): TJSONValue;
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LNumTel := AValue.AsType<TNumTel>;
  LStringList := TStringList.Create;
  try
    LStringList.Add(LNumTel.ID.ToString);
    LStringList.Add(LNumTel.MasterID.ToString);
    LStringList.Add(LNumTel.Numero);
    Result := TJSONString.Create(LStringList.CommaText);
  finally
    LStringList.Free;
  end;
end;

{ TNumTelCustomSerializerJDO }

class function TPhoneNumberCustomSerializerJDO.Deserialize(
  const AJSONValue: PJsonDataValue; const AExistingValue: TValue): TValue;
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := AJSONValue.Value;
    LNumTel := TNumTel.Create(LStringList[0].ToInteger, LStringList[2], LStringList[1].ToInteger);
    Result := TValue.From<TNumTel>(LNumTel);
  finally
    LStringList.Free;
  end;
end;

class function TPhoneNumberCustomSerializerJDO.isTypeNotificationCompatible: Boolean;
begin
  Result := True;
end;

class procedure TPhoneNumberCustomSerializerJDO.Serialize(
  const AJSONValue: PJsonDataValue; const AValue: TValue);
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LNumTel := AValue.AsType<TNumTel>;
  LStringList := TStringList.Create;
  try
    LStringList.Add(LNumTel.ID.ToString);
    LStringList.Add(LNumTel.MasterID.ToString);
    LStringList.Add(LNumTel.Numero);
    AJSONValue.Value := LStringList.CommaText;
  finally
    LStringList.Free;
  end;
end;

{ TNumTelCustomSerializerSTream }

class function TPhoneNUmberCustomSerializerStream.Deserialize(
  const AJSONReader: TJSONReader; const AExistingValue: TValue): TValue;
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := AJSONReader.Value.AsString;
    LNumTel := TNumTel.Create(LStringList[0].ToInteger, LStringList[2], LStringList[1].ToInteger);
    Result := TValue.From<TNumTel>(LNumTel);
  finally
    LStringList.Free;
  end;
end;

class function TPhoneNUmberCustomSerializerStream.isTypeNotificationCompatible: Boolean;
begin
  Result := True;
end;

class procedure TPhoneNUmberCustomSerializerStream.Serialize(
  const AJSONWriter: TJSONWriter; const AValue: TValue);
var
  LStringList: TStrings;
  LNumTel: TNumTel;
begin
  LNumTel := AValue.AsType<TNumTel>;
  LStringList := TStringList.Create;
  try
    LStringList.Add(LNumTel.ID.ToString);
    LStringList.Add(LNumTel.MasterID.ToString);
    LStringList.Add(LNumTel.Numero);
    AJSONWriter.WriteValue(LStringList.CommaText);
  finally
    LStringList.Free;
  end;
end;

end.
