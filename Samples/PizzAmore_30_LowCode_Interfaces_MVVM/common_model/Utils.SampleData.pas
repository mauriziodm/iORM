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
  iORM, Model.Interfaces, SysUtils, System.IOUtils, Model.Ingredient, Model.Customer, Model.Pizza,
  Model.Pizza.IngredientRow, Model.OrderRow, Model.Order;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
begin
  if io.NotExists<IIngredient> then
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
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Flour', 'gr']).Get );
  // 2-EVO oil
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['EVO oil', 'gr']).Get );
  // 3-
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Water', 'cl']).Get );
  // 4-Brewer's yeast
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Brewer''s yeast', 'gr']).Get );
  // 5-Salt
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Salt', 'gr']).Get );
  // 6-Oregano
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Oregano', 'gr']).Get );
  // 7-Tomato
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Tomato', 'gr']).Get );
  // 8-Mozzarella cheese
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Mozzarella cheese', 'gr']).Get );
  // 9-Spicy salami
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Spicy salami', 'gr']).Get );
  // 10-Ham
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Spicy salami', 'gr']).Get );
  // 11-Artichokes
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Artichokes', 'gr']).Get );
  // 12-Mushrooms
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Mushrooms', 'gr']).Get );
  // 13-Olive
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Olive', 'gr']).Get );
  // 14-Resolve
  io.PersistObject( io.di.Resolve<IIngredient>.ConstructorParams( ['Love', 'req']).Get );
end;

class procedure TSampleData.CreatePizzas;
var
  LPizza: IPizza;
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
  io.PersistObject(LPizza);
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
  io.PersistObject(LPizza);
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
  io.PersistObject(LPizza);
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
  io.PersistObject(LPizza);
end;

class procedure TSampleData.CreateRealCustomers;
begin
  // 1-Mr. Maurizio Del Magno
  io.PersistObject( io.di.Resolve<ICustomer>.ConstructorParams( ['Maurizio Del Magno', 'New York City', '301 Park Ave', '(555) 555-1234']).Get );
  // 2-Mr. Omar Bossoni
  io.PersistObject( io.di.Resolve<ICustomer>.ConstructorParams( ['Omar Bossoni', 'New York City', '111 E 48th St', '(444) 444-1234']).Get );
  // 3-Mr. Marco Mottadelli
  io.PersistObject( io.di.Resolve<ICustomer>.ConstructorParams( ['Marco Mottadelli', 'Union City', '3501 Bergenline Ave', '(333) 333-1234']).Get );
end;

class procedure TSampleData.CreateOtherCustomers;
var
  LCounter: Integer;
  LCustomer: ICustomer;
begin
  for LCounter := 4 to 1000 do
  begin
    LCustomer := TCustomer.Create;
    LCustomer.Name := Format('other customer %d', [LCounter]);
    LCustomer.City := Format('city %d', [LCounter]);
    LCustomer.Address := Format('address %d', [LCounter]);
    LCustomer.PhoneNumber := Format('phone number %d', [LCounter]);
    io.PersistObject(LCustomer, BL_BIT_AUTO_UPDATE_PROPS); // note: BL_BIT_AUTO_UPDATE_PROPS as time optimization
  end;
end;

class procedure TSampleData.CreateOrders;
var
  LOrder: IOrder;
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
  io.PersistObject(LOrder);
  // Second order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(2);
  LOrder.Note := 'Double cheese please';
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(1), 1) ); // Margherita pizza, Qty = 1
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(3), 1) ); // Pepperoni pizza, Qty = 1
  LOrder.OrderState := osPreparing;
  io.PersistObject(LOrder);
  // Third order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(3);
  LOrder.Rows.Add( TOrderRow.Create( io.LoadObject<TPizza>(4), 1) ); // Love pizza, Qty = 1
  LOrder.OrderState := osWaiting;
  io.PersistObject(LOrder);
end;

end.
