unit Utils.SampleData;

interface

type

  TSampleData = class
  private
    class procedure CreateRealCustomers;
    class procedure CreateOtherCustomers;
    class procedure CreateIngredients;
    class procedure CreatePizzas;
    class procedure CreateOrders;
  public
    class procedure CheckForSampleDataCreation;
  end;

implementation

uses
  iORM, Model.Order, Model.OrderRow, Model.Pizza, Model.Customer, SysUtils, System.IOUtils,
  Model.Ingredient, Model.Pizza.IngredientRow;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
begin
  if io.NotExists<TIngredient> then
  begin
    io.StartTransaction;
    try
      CreateIngredients;
      CreatePizzas;
      CreateRealCustomers;
      CreateOtherCustomers;
      CreateOrders;
      io.CommitTransaction;
    except
      io.RollbackTransaction;
    end;
  end;
end;

class procedure TSampleData.CreateIngredients;
begin
  // 1-Flour
  io.PersistObject(TIngredient.Create('Flour', 'gr'), foFreeAndNil);
  // 2-EVO oil
  io.PersistObject(TIngredient.Create('EVO oil', 'gr'), foFreeAndNil);
  // 3-Water
  io.PersistObject(TIngredient.Create('Water', 'cl'), foFreeAndNil);
  // 4-Brewer's yeast
  io.PersistObject(TIngredient.Create('Brewer''s yeast', 'gr'), foFreeAndNil);
  // 5-Salt
  io.PersistObject(TIngredient.Create('Salt', 'gr'), foFreeAndNil);
  // 6-Oregano
  io.PersistObject(TIngredient.Create('Oregano', 'gr'), foFreeAndNil);
  // 7-Tomato
  io.PersistObject(TIngredient.Create('Tomato', 'gr'), foFreeAndNil);
  // 8-Mozzarella cheese
  io.PersistObject(TIngredient.Create('Mozzarella cheese', 'gr'), foFreeAndNil);
  // 9-Spicy salami
  io.PersistObject(TIngredient.Create('Spicy salami', 'gr'), foFreeAndNil);
  // 10-Ham
  io.PersistObject(TIngredient.Create('Spicy salami', 'gr'), foFreeAndNil);
  // 11-Artichokes
  io.PersistObject(TIngredient.Create('Artichokes', 'gr'), foFreeAndNil);
  // 12-Mushrooms
  io.PersistObject(TIngredient.Create('Mushrooms', 'gr'), foFreeAndNil);
  // 13-Olive
  io.PersistObject(TIngredient.Create('Olive', 'gr'), foFreeAndNil);
  // 14-Love
  io.PersistObject(TIngredient.Create('Love', 'req'), foFreeAndNil);
end;

class procedure TSampleData.CreatePizzas;
var
  LPizza: TPizza;
  LImagesPath: String;
begin
  // Detect the right images path for mobile or win32 (test "MargheritaPizza.bmp" file only)
  if FileExists(TPath.Combine(TPath.GetDocumentsPath, 'MargheritaPizza.bmp')) then
    LImagesPath := TPath.GetDocumentsPath
  else
    LImagesPath := TPath.GetFullPath('..\..\..\..\common_images');
  // Margherita pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Margherita pizza';
  LPizza.Price := 4.5;
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(1), 140 ) ); // flour
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(2), 6 ) ); // evo oil
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(3), 80 ) ); // water
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(4), 4 ) ); // brewer's yeast
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(5), 3 ) ); // salt
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(6), 1 ) ); // oregano
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(7), 40 ) ); // tomato
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(8), 50 ) ); // mozzarella cheese
  LPizza.Image.LoadFromFile(TPath.Combine(LImagesPath, 'MargheritaPizza.bmp'));
  io.PersistObject(LPizza, foFreeAndNil);
  //  Capricciosa pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Capricciosa pizza';
  LPizza.Price := 7;
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(1), 140 ) ); // flour
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(2), 6 ) ); // evo oil
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(3), 80 ) ); // water
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(4), 4 ) ); // brewer's yeast
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(5), 3 ) ); // salt
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(6), 1 ) ); // oregano
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(7), 40 ) ); // tomato
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(8), 50 ) ); // mozzarella cheese
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(10), 20 ) ); // ham
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(11), 25 ) ); // artichokes
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(12), 20 ) ); // mushrooms
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(13), 15 ) ); // olive
  LPizza.Image.LoadFromFile(TPath.Combine(LImagesPath, 'CapricciosaPizza.bmp'));
  io.PersistObject(LPizza, foFreeAndNil);
  // Pepperoni pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Pepperoni pizza';
  LPizza.Price := 6.5;
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(1), 140 ) ); // flour
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(2), 6 ) ); // evo oil
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(3), 80 ) ); // water
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(4), 4 ) ); // brewer's yeast
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(5), 3 ) ); // salt
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(6), 1 ) ); // oregano
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(7), 40 ) ); // tomato
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(8), 50 ) ); // mozzarella cheese
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(9), 35 ) ); // spicy salami
  LPizza.Image.LoadFromFile(TPath.Combine(LImagesPath, 'PepperoniPizza.bmp'));
  io.PersistObject(LPizza, foFreeAndNil);
  // Love pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Love pizza';
  LPizza.Price := 5;
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(1), 140 ) ); // flour
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(2), 6 ) ); // evo oil
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(3), 80 ) ); // water
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(4), 4 ) ); // brewer's yeast
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(5), 3 ) ); // salt
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(6), 1 ) ); // oregano
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(7), 40 ) ); // tomato
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(8), 50 ) ); // mozzarella cheese
  LPizza.Ingredients.Add( TPizzaIngredientRow.Create( io.LoadObject<TIngredient>(14), 0 ) ); // love
  LPizza.Image.LoadFromFile(TPath.Combine(LImagesPath, 'LovePizza.bmp'));
  io.PersistObject(LPizza, foFreeAndNil);
end;

class procedure TSampleData.CreateRealCustomers;
begin
  // 1-Mr. Maurizio Del Magno
  io.PersistObject( TCustomer.CreateWithData('Maurizio Del Magno', 'New York City', '301 Park Ave', '(555) 555-1234'), foFreeAndNil );
  // 2-Mr. Omar Bossoni
  io.PersistObject( TCustomer.CreateWithData('Omar Bossoni', 'New York City', '111 E 48th St', '(444) 444-1234'), foFreeAndNil );
  // 3-Mr. Marco Mottadelli
  io.PersistObject( TCustomer.CreateWithData('Marco Mottadelli', 'Union City', '3501 Bergenline Ave', '(333) 333-1234'), foFreeAndNil );
end;

class procedure TSampleData.CreateOtherCustomers;
var
  LCounter: Integer;
  LCustomer: TCustomer;
begin
  for LCounter := 4 to 1000 do
  begin
    LCustomer := TCustomer.Create;
    LCustomer.Name := Format('other customer %d', [LCounter]);
    LCustomer.City := Format('city %d', [LCounter]);
    LCustomer.Address := Format('address %d', [LCounter]);
    LCustomer.PhoneNumber := Format('phone number %d', [LCounter]);
    io.PersistObject(LCustomer, BL_BIT_AUTO_UPDATE_PROPS, foFreeAndNil); // note: BL_BIT_AUTO_UPDATE_PROPS as time optimization
  end;
end;

class procedure TSampleData.CreateOrders;
var
  LOrder: TOrder;
begin
  // First order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(1);
  LOrder.Note := 'Well done';
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(1), 3) ); // Margherita pizza, Qty = 3
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(2), 2) ); // Capricciosa pizza, Qty = 2
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(4), 1) ); // Love pizza, Qty = 1
  LOrder.OrderState := osReady;
  io.PersistObject(LOrder, foFreeAndNil);
  // Second order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(2);
  LOrder.Note := 'Double cheese please';
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(1), 1) ); // Margherita pizza, Qty = 1
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(3), 1) ); // Pepperoni pizza, Qty = 1
  LOrder.OrderState := osPreparing;
  io.PersistObject(LOrder, foFreeAndNil);
  // Third order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(3);
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(4), 1) ); // Love pizza, Qty = 1
  LOrder.OrderState := osWaiting;
  io.PersistObject(LOrder, foFreeAndNil);
end;

end.
