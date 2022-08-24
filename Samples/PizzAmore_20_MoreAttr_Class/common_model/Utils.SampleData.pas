unit Utils.SampleData;

interface

type

  TSampleData = class
  private
    class procedure CreateRealCustomers;
    class procedure CreateOtherCustomers;
    class procedure CreatePizzas;
    class procedure CreateOrders;
  public
    class procedure CheckForSampleDataCreation;
  end;

implementation

uses
  iORM, Model.Order, Model.OrderRow, Model.Pizza, Model.Customer, SysUtils;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
begin
  if io.NotExists<TPizza> then
  begin
    io.StartTransaction;
    try
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

class procedure TSampleData.CreatePizzas;
var
  LPizza: TPizza;
begin
  // Margherita pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Margherita pizza';
  LPizza.Price := 4.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\MargheritaPizza.bmp');
  io.Persist(LPizza);
  FreeAndnil(LPizza);
  //  Capricciosa pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Capricciosa pizza';
  LPizza.Price := 7;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\CapricciosaPizza.bmp');
  io.Persist(LPizza);
  FreeAndnil(LPizza);
  // Pepperoni pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Pepperoni pizza';
  LPizza.Price := 6.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\PepperoniPizza.bmp');
  io.Persist(LPizza);
  FreeAndnil(LPizza);
  // Love pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Love pizza';
  LPizza.Price := 5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\LovePizza.bmp');
  io.Persist(LPizza);
  FreeAndnil(LPizza);
end;

class procedure TSampleData.CreateRealCustomers;
var
  LCustomer: TCustomer;
begin
  // Mr. Maurizio Del Magno
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Maurizio Del Magno';
  LCustomer.City := 'New York';
  LCustomer.Address := '301 Park Ave';
  LCustomer.PhoneNumber := '(555) 555-1234';
  io.Persist(LCustomer);
  FreeAndnil(LCustomer);
  // Mr. Omar Bossoni
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Omar Bossoni';
  LCustomer.City := 'New York';
  LCustomer.Address := '111 E 48th St';
  LCustomer.PhoneNumber := '(444) 444-1234';
  io.Persist(LCustomer);
  FreeAndnil(LCustomer);
  // Mr. Marco Mottadelli
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Marco Mottadelli';
  LCustomer.City := 'Union City';
  LCustomer.Address := '3501 Bergenline Ave';
  LCustomer.PhoneNumber := '(333) 333-1234';
  io.Persist(LCustomer);
  FreeAndnil(LCustomer);
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
    io.Persist(LCustomer);
    FreeAndnil(LCustomer);
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
  LOrder.Rows.Add( TOrderRow.Create(1, 'Margherita pizza', 4.5, 3) );
  LOrder.Rows.Add( TOrderRow.Create(2, 'Capricciosa pizza', 7, 2) );
  LOrder.Rows.Add( TOrderRow.Create(4, 'Love pizza', 5, 1) );
  io.Persist(LOrder);
  FreeAndnil(LOrder);
  // Second order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(2);
  LOrder.Note := 'Double cheese please';
  LOrder.Rows.Add( TOrderRow.Create(1, 'Margherita pizza', 4.5, 1) );
  LOrder.Rows.Add( TOrderRow.Create(2, 'Pepperoni pizza', 6.5, 1) );
  io.Persist(LOrder);
  FreeAndnil(LOrder);
  // Third order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(3);
  LOrder.Rows.Add( TOrderRow.Create(4, 'Love pizza', 5, 1) );
  io.Persist(LOrder);
  FreeAndnil(LOrder);
end;

end.
