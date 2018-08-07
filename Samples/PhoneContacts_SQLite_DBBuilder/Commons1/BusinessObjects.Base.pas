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
    [ioInteger(10, False)]
    property ID: Integer read GetID write SetID;
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

end.
