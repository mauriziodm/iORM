unit iORM.REST.Body.Response;

interface

uses
  iORM.REST.Interfaces, System.JSON;

type

  TioRESTResponseBody = class(TInterfacedObject, IioRESTResponseBody)
  private
    FDataObject: TObject;
    FJSONDataValue: TJSONValue;
    function GetDataObject: TObject;
    function GetJSONDataValue: TJSONValue;
    procedure SetDataObject(const Value: TObject);
    procedure SetJSONDataValue(const Value: TJSONValue);
    function ToJSONObject:TJSONObject;
  public
    constructor Create; overload;
    constructor Create(const AJSONObject:TJSONObject); overload;
    constructor Create(const AJSONString:String); overload;
  end;

implementation

uses
  iORM;

{ TioRESTResponseBody }

constructor TioRESTResponseBody.Create;
begin
  inherited;
  FDataObject := nil;
  FJSONDataValue := nil;
end;

constructor TioRESTResponseBody.Create(const AJSONObject: TJSONObject);
var
  LJSONValue: TJSONValue;
begin
  Self.Create;
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
  // JSONDataValue
  LJSONValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
  if Assigned(LJSONValue) then
  begin
    FJSONDataValue := LJSONValue;
    AJSONObject.RemovePair(KEY_JSONDATAVALUE);  // To prevent an AV error because AJSONObject own the FJSONDataValue
  end;
end;

constructor TioRESTResponseBody.Create(const AJSONString: String);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    Self.Create(LJSONObject);
  finally
    LJSONObject.Free;
  end;
end;

function TioRESTResponseBody.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioRESTResponseBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

procedure TioRESTResponseBody.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
end;

procedure TioRESTResponseBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

function TioRESTResponseBody.ToJSONObject: TJSONObject;
var
  LJSONValue: TJSONValue;
begin
  Result := TJSONObject.Create;
  // JSONDataValue
  if Assigned(FJSONDataValue) then
    Result.AddPair(KEY_JSONDATAVALUE, FJSONDataValue);
  // DataOject
  if Assigned(FDataObject) then
  begin
    LJSONValue := io.Mapper.From(FDataObject).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
end;

end.
