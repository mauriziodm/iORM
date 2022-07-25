{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapper.DuckPropField;

interface

uses
  System.Rtti;

type

  TDuckPropFieldType = (ptInvalid, ptProperty, ptField);

  TDuckPropField = class
  public
    class function IsValidPropField(const ARttiType: TRttiNamedObject): Boolean; static;
    class function GetPropFieldType(const ARttiType: TRttiNamedObject): TDuckPropFieldType; static;
    class function GetValue(const Instance: TObject; const ARttiType: TRttiNamedObject): TValue; static;
    class procedure SetValue(const Instance: TObject; const ARttiType: TRttiNamedObject; const AValue: TValue); static;
    class function RttiType(const ARttiType: TRttiNamedObject): TRttiType; static;
    class function IsWritable(const ARttiType: TRttiNamedObject): Boolean; static;
    class function QualifiedName(const ARttiType: TRttiNamedObject): String; static;
    class function TypeKind(const ARttiType: TRttiNamedObject): TTypeKind; static;
  end;

implementation

uses
  ObjMapper.Engine;

{ TDuckPropField }

class function TDuckPropField.GetPropFieldType(const ARttiType: TRttiNamedObject): TDuckPropFieldType;
begin
  if ARttiType is TRttiProperty then
    Result := ptProperty
  else if ARttiType is TRttiField then
    Result := ptField
  else
    Result := ptInvalid;
end;

class function TDuckPropField.GetValue(const Instance: TObject; const ARttiType: TRttiNamedObject): TValue;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := TRttiField(ARttiType).GetValue(Instance);
    ptProperty:
      Result := TRttiProperty(ARttiType).GetValue(Instance);
  else
      raise EMapperException.Create('Invalid prop/field type ' + ARttiType.Name);
  end;
end;

class function TDuckPropField.IsValidPropField(
  const ARttiType: TRttiNamedObject): Boolean;
begin
  Result := Assigned(ARttiType) and (GetPropFieldType(ARttiType) <> ptInvalid);
end;

class function TDuckPropField.IsWritable(const ARttiType: TRttiNamedObject): Boolean;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := True;
    ptProperty:
      Result := TRttiProperty(ARttiType).IsWritable;
  else
    Result := False;
  end;
end;

class function TDuckPropField.QualifiedName(
  const ARttiType: TRttiNamedObject): String;
begin
  Result := RttiType(ARttiType).QualifiedName;
end;

class function TDuckPropField.RttiType(const ARttiType: TRttiNamedObject): TRttiType;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := TRttiField(ARttiType).FieldType;
    ptProperty:
      Result := TRttiProperty(ARttiType).PropertyType;
  else
    Result := ARttiType as TRttiType;
  end;
end;

class procedure TDuckPropField.SetValue(const Instance: TObject; const ARttiType: TRttiNamedObject; const AValue: TValue);
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      TRttiField(ARttiType).SetValue(Instance, AValue);
    ptProperty:
      TRttiProperty(ARttiType).SetValue(Instance, AValue);
  else
      raise EMapperException.Create('Invalid prop/field type ' + ARttiType.Name);
  end;
end;

class function TDuckPropField.TypeKind(const ARttiType: TRttiNamedObject): TTypeKind;
begin
  Result := RttiType(ARttiType).TypeKind;
end;

end.
