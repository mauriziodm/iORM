unit Model.Pizza.IngredientRow;

interface

uses
  iORM, ETM.Repository, Model.Ingredient;

type

  [ioEntity('INGREDIENTROW')]
  TPizzaIngredientRow = class
  private
    FID: Integer;
    FIngredient: TIngredient;
    FObjStatus: TioObjStatus;
    FQty: Double;
  public
    constructor Create(const AIngredient: TIngredient; const AQty: Double);
    destructor Destroy; override;
    property ID: Integer read FID;
    property Ingredient: TIngredient read FIngredient;
    property Qty: Double read FQty write FQty;
  end;

implementation

{ TPizzaIngredientRow }

constructor TPizzaIngredientRow.Create(const AIngredient: TIngredient; const AQty: Double);
begin
  FIngredient := AIngredient;
  FQty := AQty;
end;

destructor TPizzaIngredientRow.Destroy;
begin
  FIngredient.Free;
  inherited;
end;

end.
