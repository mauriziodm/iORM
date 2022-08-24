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
  iORM, Model.Interfaces, SysUtils, Model.Customer;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
begin
  if io.NotExists<IPizza> then
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
      raise;
    end;
  end;
end;

class procedure TSampleData.CreatePizzas;
var
  LPizza: IPizza;
begin
  // Margherita pizza
  LPizza := io.Create<IPizza>;
  LPizza.Name := 'Margherita pizza';
  LPizza.Price := 4.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\MargheritaPizza.bmp');
  io.Persist(LPizza);
  //  Capricciosa pizza
  LPizza := io.Create<IPizza>;
  LPizza.Name := 'Capricciosa pizza';
  LPizza.Price := 7;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\CapricciosaPizza.bmp');
  io.Persist(LPizza);
  // Pepperoni pizza
  LPizza := io.Create<IPizza>;
  LPizza.Name := 'Pepperoni pizza';
  LPizza.Price := 6.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\PepperoniPizza.bmp');
  io.Persist(LPizza);
  // Love pizza
  LPizza := io.Create<IPizza>;
  LPizza.Name := 'Love pizza';
  LPizza.Price := 5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\LovePizza.bmp');
  io.Persist(LPizza);
end;

class procedure TSampleData.CreateRealCustomers;
var
  LCustomer: ICustomer;
begin
  // Mr. Maurizio Del Magno
//  LCustomer := io.Create<ICustomer>;
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Maurizio Del Magno';
  LCustomer.City := 'New York';
  LCustomer.Address := '301 Park Ave';
  LCustomer.PhoneNumber := '(555) 555-1234';
  io.Persist(LCustomer);
  // Mr. Omar Bossoni
//  LCustomer := io.Create<ICustomer>;
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Omar Bossoni';
  LCustomer.City := 'New York';
  LCustomer.Address := '111 E 48th St';
  LCustomer.PhoneNumber := '(444) 444-1234';
  io.Persist(LCustomer);
  // Mr. Marco Mottadelli
//  LCustomer := io.Create<ICustomer>;
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Marco Mottadelli';
  LCustomer.City := 'Union City';
  LCustomer.Address := '3501 Bergenline Ave';
  LCustomer.PhoneNumber := '(333) 333-1234';
  io.Persist(LCustomer);
end;

class procedure TSampleData.CreateOtherCustomers;
var
  LCounter: Integer;
  LCustomer: ICustomer;
begin
  for LCounter := 4 to 1000 do
  begin
//    LCustomer := io.Create<ICustomer>;
    LCustomer := TCustomer.Create;
    LCustomer.Name := Format('other customer %d', [LCounter]);
    LCustomer.City := Format('city %d', [LCounter]);
    LCustomer.Address := Format('address %d', [LCounter]);
    LCustomer.PhoneNumber := Format('phone number %d', [LCounter]);
    io.Persist(LCustomer);
  end;
end;

class procedure TSampleData.CreateOrders;
var
  LOrder: IOrder;
begin
  // First order
  LOrder := io.Create<IOrder>;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<ICustomer>(1);
  LOrder.Note := 'Well done';
  LOrder.Rows.Add( io.Create<IOrderRow>([1, 'Margherita pizza', 4.5, 3]) );
  LOrder.Rows.Add( io.Create<IOrderRow>([2, 'Capricciosa pizza', 7, 2]) );
  LOrder.Rows.Add( io.Create<IOrderRow>([4, 'Love pizza', 5, 1]) );
  io.Persist(LOrder);
  // Second order
  LOrder := io.Create<IOrder>;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<ICustomer>(2);
  LOrder.Note := 'Double cheese please';
  LOrder.Rows.Add( io.Create<IOrderRow>([1, 'Margherita pizza', 4.5, 1]) );
  LOrder.Rows.Add( io.Create<IOrderRow>([2, 'Pepperoni pizza', 6.5, 1]) );
  io.Persist(LOrder);
  // Third order
  LOrder := io.Create<IOrder>;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<ICustomer>(3);
  LOrder.Rows.Add( io.Create<IOrderRow>([4, 'Love pizza', 5, 1]) );
  io.Persist(LOrder);
end;

end.
