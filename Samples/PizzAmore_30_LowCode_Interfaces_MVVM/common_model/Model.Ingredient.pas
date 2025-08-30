unit Model.Ingredient;

interface

uses
  iORM, Model.Interfaces, ETM.Repository;

type

  [ioEntity('INGREDIENTS'), etmTrace(TEtmTimeSlot), ioConflictStrategy(TioSameVersionWin, csResolved)]
  TIngredient = class(TInterfacedObject, IIngredient)
  private
    FID: Integer;
    FName: String;
    FObjVersion: TioObjVersion; // The ObjVersion is mandatory if you want to use the ETM, otherwise not
    FUnitOfMeasure: String;
    function GetID: Integer;
    function GetName: String;
    function GetUnitOfMeasure: String;
    procedure SetID(const Value: Integer);
    procedure SetUnitOfMeasure(const Value: String);
    procedure SetName(const Value: String);
  public
    constructor Create(const AName, AUnitOfMeasure: String);
    property ID: Integer read GetID write SetID;
    property Name: String read GetName write SetName;
    property UnitOfMeasure: String read GetUnitOfMeasure write SetUnitOfMeasure;
  end;

implementation

{ TIngredient }

constructor TIngredient.Create(const AName, AUnitOfMeasure: String);
begin
  FName := AName;
  FUnitOfMeasure := AUnitOfMeasure;
end;

function TIngredient.GetID: Integer;
begin
  Result := FID;
end;

function TIngredient.GetName: String;
begin
  Result := FName;
end;

function TIngredient.GetUnitOfMeasure: String;
begin
  Result := FUnitOfMeasure;
end;

procedure TIngredient.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TIngredient.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TIngredient.SetUnitOfMeasure(const Value: String);
begin
  FUnitOfMeasure := Value;
end;

end.
