unit Model.Ingredient;

interface

uses iORM, ETM.Repository;

type

  [ioEntity('INGREDIENTS'), etmTrace(TEtmRepository), ioConflictStrategy(TioSameVersionWin, csResolved)]
  TIngredient = class
  private
    FID: Integer;
    FName: String;
    FObjVersion: TioObjVersion; // The ObjVersion is mandatory if you want to use the ETM
    FUnitOfMeasure: String;
  public
    constructor Create(const AName, AUnitOfMeasure: String);
    property ID: Integer read FID; // ReadOnly if you want
    property Name: String read FName write FName;
    property UnitOfMeasure: String read FUnitOfMeasure write FUnitOfMeasure;
  end;

implementation

{ TIngredient }

constructor TIngredient.Create(const AName, AUnitOfMeasure: String);
begin
  FName := AName;
  FUnitOfMeasure := AUnitOfMeasure;
end;

end.
