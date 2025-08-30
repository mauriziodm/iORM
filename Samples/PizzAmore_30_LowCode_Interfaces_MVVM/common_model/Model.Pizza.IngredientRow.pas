unit Model.Pizza.IngredientRow;

interface

uses
  iORM, Model.Interfaces;

type

  [ioEntity('INGREDIENTROW')]
  TPizzaIngredientRow = class(TInterfacedObject, IPizzaIngredientRow)
  private
    FID: Integer;
    FIngredient: IIngredient;
    FObjStatus: TioObjStatus;
    FQty: Double;
    function GetID: Integer;
    function GetIngredient: IIngredient;
    function GetQty: Double;
    procedure SetQty(const Value: Double);
  public
    constructor Create(const AIngredient: IIngredient; const AQty: Double);
    property ID: Integer read GetID;
    property Ingredient: IIngredient read GetIngredient;
    property Qty: Double read GetQty write SetQty;
  end;

implementation

{ TPizzaIngredientRow }

constructor TPizzaIngredientRow.Create(const AIngredient: IIngredient; const AQty: Double);
begin
  FIngredient := AIngredient;
  FQty := AQty;
end;

function TPizzaIngredientRow.GetID: Integer;
begin
  Result := FID;
end;

function TPizzaIngredientRow.GetIngredient: IIngredient;
begin
  Result := FIngredient;
end;

function TPizzaIngredientRow.GetQty: Double;
begin
  Result := FQty;
end;

procedure TPizzaIngredientRow.SetQty(const Value: Double);
begin
  FQty := Value;
end;

end.
