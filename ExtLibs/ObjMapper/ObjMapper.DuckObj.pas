{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapper.DuckObj;

interface

uses
  System.Classes, System.Rtti;

type

  // DuckTypedStreamObject interface
  IWrappedObject = interface
    ['{D95AD3B5-02AC-49E6-B54E-2ECAA7D5B54B}']
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    function IsEmpty: Boolean;
  end;

  // DuckTypedStreamObject
  TDuckTypedObject = class(TInterfacedObject, IWrappedObject)
  strict protected
    FObj: TObject;
    FLoadFromStreamMethod: TRttiMethod;
    FSaveToStreamMethod: TRttiMethod;
    FIsEmptyMethod: TRttiMethod;
    FCountProperty: TRttiProperty;
  public
    constructor Create(AObj: TObject);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToStream(AStream: TStream);
    function IsEmpty: Boolean;
  end;

function WrapAsObject(const AObject: TObject): IWrappedObject;

implementation

uses
  System.SysUtils, iORM.RttiContext.Factory;


function WrapAsObject(const AObject: TObject): IWrappedObject;
begin
  try
    Result := TDuckTypedObject.Create(AObject);
  except
    Result := nil;
  end;
end;

{ TioDuckTypedStreamObject }

constructor TDuckTypedObject.Create(AObj: TObject);
var
  Typ: TRttiType;
begin
  inherited Create;
  FObj := AObj;
  // Init Rtti
  Typ := TioRttiFactory.GetRttiContext.GetType(AObj.ClassInfo);
  // LoadFromStreamMethod method
  FLoadFromStreamMethod := Typ.GetMethod('LoadFromStream');
  if not Assigned(FLoadFromStreamMethod) then Exception.Create('DuckTypedStreamObject: "LoadFromStream" method not found in the object');
  // SaveFromStreamMethod method
  FSaveToStreamMethod := Typ.GetMethod('SaveToStream');
  if not Assigned(FSaveToStreamMethod) then Exception.Create('DuckTypedStreamObject: "SaveToStream" method not found in the object');
  // IsEmpty method
  FIsEmptyMethod := Typ.GetMethod('IsEmpty');
  // Count property method
  FCountProperty := Typ.GetProperty('Count');
end;

function TDuckTypedObject.IsEmpty: Boolean;
begin
  // FIsEmptyMethod method assigned
  if Assigned(FIsEmptyMethod)
    then Result := FIsEmptyMethod.Invoke(FObj, []).AsBoolean
  // FCountProperty method assigned
  else if Assigned(FCountProperty)
    then Result := (FCountProperty.GetValue(FObj).AsInteger = 0)
  // Otherwise return False
  else Result := False;
end;

procedure TDuckTypedObject.LoadFromStream(AStream: TStream);
begin
  FLoadFromStreamMethod.Invoke(FObj, [AStream]);
end;

procedure TDuckTypedObject.SaveToStream(AStream: TStream);
begin
  FSaveToStreamMethod.Invoke(FObj, [AStream]);
end;

end.
