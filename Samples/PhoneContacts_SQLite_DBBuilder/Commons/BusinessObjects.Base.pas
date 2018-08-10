unit BusinessObjects.Base;

interface

uses
  System.Generics.Collections,
  System.Classes,
  iORM.Containers.Interfaces,
  iORM.CommonTypes,
  iORM.Attributes,
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  BusinessObjects.Base.Interfaces;

type
  TBaseBo = class(TInterfacedObject, IBaseBo)
  private
    FID: Integer;
    procedure SetID(const Value: Integer);
    function GetID: Integer;
  public
    property ID: Integer read GetID write SetID;
  end;

  [ioEntity, ioDisableAutoCreateDB]
  TSingletonString = class(TInterfacedObject, ISingletonString)
  private
    FValue: String;
    procedure SetValue(const Value: String);
    function GetValue: String;
  public
    property Value: String read GetValue write SetValue;
  end;

implementation

{ TBaseBo }

function TBaseBo.GetID: Integer;
begin
  Result := FID;
end;

procedure TBaseBo.SetID(const Value: Integer);
begin
  FID := Value;
end;

{ TSingleton }

function TSingletonString.GetValue: String;
begin
  Result := FValue;
end;

procedure TSingletonString.SetValue(const Value: String);
begin
  FValue := Value;
end;

end.
