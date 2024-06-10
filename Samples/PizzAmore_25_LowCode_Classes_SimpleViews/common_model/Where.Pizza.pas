unit Where.Pizza;

interface

uses
  iORM;

type

  [ioNotPersistedEntity]
  TWherePizza = class
  private
    FID: Integer;
    [ioWhere(coLike)]
    FName: String;
    [ioWhereGroup('Price'), ioWhere('Price', coGreaterOrEqual)]
    FFromPrice: Currency;
    [ioWhereGroup('Price'), ioWhere('Price', coLowerOrEqual)]
    FToPrice: Currency;
    [ioWhere('Ingredients.Ingredient.Name', coLike)]
    FIngredientName: String;
  public
    constructor Create;
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property FromPrice: Currency read FFromPrice Write FFromPrice;
    property ToPrice: Currency read FToPrice Write FToPrice;
    property IngredientName: String read FIngredientName write FIngredientName;
  end;

implementation

{ TWherePizza }

constructor TWherePizza.Create;
begin
  FFromPrice := 0;
  FToPrice := 100;
end;

end.
