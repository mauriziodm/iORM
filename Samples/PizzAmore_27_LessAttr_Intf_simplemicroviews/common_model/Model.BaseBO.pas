unit Model.BaseBO;

interface

uses
  Model.Interfaces;

type

  // Common ancestor class for all entities
  TBaseBO = class(TInterfacedObject, IBaseBO)
  private
    FID: Integer;
    function GetID: Integer;
  public
    property ID: Integer read GetID;
  end;

implementation

{ TBaseBO }

function TBaseBO.GetID: Integer;
begin
  Result := FID;
end;

end.
