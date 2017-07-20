{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapper.DuckDictionary;

interface

uses
  System.Rtti;

type

  TDuckTypedDictionaryEnumerator = class
  strict private
    FCTX: TRTTIContext;
    FObjectAsDuck: TObject;
    FMoveNextMethod: TRttiMethod;
    FCurrentProperty: TRttiProperty;
  public
    constructor Create(AObjectAsDuck: TObject);
    destructor Destroy; override;
    function Current: TValue;
    function MoveNext: Boolean;
  end;

  IWrappedDictionary = interface
    ['{CC1ED317-DB5D-43E5-B62E-2A0C11137534}']
    function GetCurrentKey: TValue;
    function GetCurrentValue: TValue;
    function MoveNext: Boolean;
    procedure Add(const AKey, AValue: TValue);
  end;

  TDuckTypedDictionary = class(TInterfacedObject, IWrappedDictionary)
  strict private
    FCTX: TRTTIContext;
    FObjectAsDuck: TObject;
    FAddMethod: TRttiMethod;
    FKeysProperty: TRttiProperty;
    FValuesProperty: TRttiProperty;
    FKeysEnumerator: TDuckTypedDictionaryEnumerator;
    FValuesEnumerator: TDuckTypedDictionaryEnumerator;
  public
    constructor Create(AObjectAsDuck: TObject);
    destructor Destroy; override;
    procedure Add(const AKey, AValue: TValue);
    function GetCurrentKey: TValue;
    function GetCurrentValue: TValue;
    function MoveNext: Boolean;
    class function CanBeWrappedAsDictionary(const AObjectAsDuck: TObject): boolean;
  end;

function WrapAsDictionary(const AObject: TObject): IWrappedDictionary;

implementation

uses
  ObjMapper.DuckList;

function WrapAsDictionary(const AObject: TObject): IWrappedDictionary;
begin
  try
    Result := TDuckTypedDictionary.Create(AObject);
  except
    Result := nil;
  end;
end;

{ TDuckTypedDictionary }

procedure TDuckTypedDictionary.Add(const AKey, AValue: TValue);
begin
  FAddMethod.Invoke(FObjectAsDuck, [AKey, AValue]);
end;

class function TDuckTypedDictionary.CanBeWrappedAsDictionary(
  const AObjectAsDuck: TObject): boolean;
var
  FCTX: TRTTIContext;
begin
  Result :=
        (FCTX.GetType(AObjectAsDuck.ClassInfo).GetMethod('Add') <> nil)
    and (FCTX.GetType(AObjectAsDuck.ClassInfo).GetProperty('Keys') <> nil)
    and (FCTX.GetType(AObjectAsDuck.ClassInfo).GetProperty('Values') <> nil);
end;

constructor TDuckTypedDictionary.Create(AObjectAsDuck: TObject);
var
  AObj: TObject;
begin
  inherited Create;
  FObjectAsDuck := AObjectAsDuck;
  // Add method
  FAddMethod := FCTX.GetType(AObjectAsDuck.ClassInfo).GetMethod('Add');
  if not Assigned(FAddMethod) then
    raise EdormException.Create('Cannot find method "Add" in the duck object');
  // Keys property
  FKeysProperty := FCTX.GetType(AObjectAsDuck.ClassInfo).GetProperty('Keys');
  if not Assigned(FKeysProperty) then
    raise EdormException.Create
      ('Cannot find property "Keys" in the duck object');
  // Values property
  FValuesProperty := FCTX.GetType(AObjectAsDuck.ClassInfo).GetProperty('Values');
  if not Assigned(FValuesProperty) then
    raise EdormException.Create
      ('Cannot find property "Values" in the duck object');
  // Keys enumerator
  AObj := FKeysProperty.GetValue(FObjectAsDuck).AsObject;
  AObj := FCTX.GetType(AObj.ClassInfo).GetMethod('GetEnumerator').Invoke(AObj, []).AsObject;
  FKeysEnumerator := TDuckTypedDictionaryEnumerator.Create(   AObj   );
  // Values enumerator
  AObj := FValuesProperty.GetValue(FObjectAsDuck).AsObject;
  AObj := FCTX.GetType(AObj.ClassInfo).GetMethod('GetEnumerator').Invoke(AObj, []).AsObject;
  FValuesEnumerator := TDuckTypedDictionaryEnumerator.Create(   AObj   );
end;

destructor TDuckTypedDictionary.Destroy;
begin
  if assigned(FKeysEnumerator) then
    FKeysEnumerator.Free;
  if assigned(FValuesEnumerator) then
    FValuesEnumerator.Free;
  inherited;
end;

function TDuckTypedDictionary.GetCurrentKey: TValue;
begin
  Result := FKeysEnumerator.Current;
end;

function TDuckTypedDictionary.GetCurrentValue: TValue;
begin
  Result := FValuesEnumerator.Current;
end;

function TDuckTypedDictionary.MoveNext: Boolean;
begin
  Result := (FKeysEnumerator.MoveNext and FValuesEnumerator.MoveNext);
end;

{ TDuckTypedEnumerator }

constructor TDuckTypedDictionaryEnumerator.Create(AObjectAsDuck: TObject);
begin
  inherited Create;
  FObjectAsDuck := AObjectAsDuck;
  // GetCurrent method
  FCurrentProperty := FCTX.GetType(AObjectAsDuck.ClassInfo).GetProperty('Current');
  if not Assigned(FCurrentProperty) then
    raise EdormException.Create('Cannot find property "Current" in the duck object');
  // MoveNext method
  FMoveNextMethod := FCTX.GetType(AObjectAsDuck.ClassInfo).GetMethod('MoveNext');
  if not Assigned(FMoveNextMethod) then
    raise EdormException.Create('Cannot find method "MoveNext" in the duck object');
end;

function TDuckTypedDictionaryEnumerator.Current: TValue;
begin
  Result := FCurrentProperty.GetValue(FObjectAsDuck);
end;

destructor TDuckTypedDictionaryEnumerator.Destroy;
begin
  FObjectAsDuck.Free;
  inherited;
end;

function TDuckTypedDictionaryEnumerator.MoveNext: Boolean;
begin
  Result := FMoveNextMethod.Invoke(FObjectAsDuck, []).AsBoolean;
end;

end.
