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
  iORM, System.SysUtils, Model.Customer, Model.Pizza, Model.Order, Model.OrderRow;

{ TSampleData }

class procedure TSampleData.CheckForSampleDataCreation;
begin
  if io.NotExists<TPizza> then
  begin
    io.StartTransaction;
    try
      CreatePizzas;
      CreateRealCustomers;
//      CreateOtherCustomers;
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
  LPizza: TPizza;
begin
  // Margherita pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Margherita pizza';
  LPizza.Price := 4.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\MargheritaPizza.bmp');
  io.Persist(LPizza);
  LPizza.Free;
  //  Capricciosa pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Capricciosa pizza';
  LPizza.Price := 7;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\CapricciosaPizza.bmp');
  io.Persist(LPizza);
  LPizza.Free;
  // Pepperoni pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Pepperoni pizza';
  LPizza.Price := 6.5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\PepperoniPizza.bmp');
  io.Persist(LPizza);
  LPizza.Free;
  // Love pizza
  LPizza := TPizza.Create;
  LPizza.Name := 'Love pizza';
  LPizza.Price := 5;
  LPizza.Image.LoadFromFile('..\..\..\..\common_images\LovePizza.bmp');
  io.Persist(LPizza);
  LPizza.Free;
end;

class procedure TSampleData.CreateRealCustomers;
var
  LAnotherCustomer: TAnotherCustomer;
  LCustomer: TCustomer;
  LVipCustomer: TVipCustomer;
  LEmployee: TEmployee;
begin
  // Mr. Maurizio Del Magno
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Maurizio Del Magno';
  LCustomer.City := 'New York';
  LCustomer.Address := '301 Park Ave';
  LCustomer.PhoneNumber := '(555) 555-1234';
  LCustomer.FidelityCardCode := 'FC001';
  io.Persist(LCustomer);
  LCustomer.Free;
  // Mr. Marco Mottadelli
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Marco Mottadelli';
  LCustomer.City := 'Union City';
  LCustomer.Address := '3501 Bergenline Ave';
  LCustomer.PhoneNumber := '(333) 333-1234';
  LCustomer.FidelityCardCode := 'FC002';
  io.Persist(LCustomer);
  LCustomer.Free;
  // Mr. Fabio Codebue
  LVipCustomer := TVipCustomer.Create;
  LVipCustomer.Name := 'Fabio Codebue (VIP)';
  LVipCustomer.City := 'Tavernola Bergamasca City';
  LVipCustomer.Address := '150 Lake Corniche';
  LVipCustomer.PhoneNumber := '(666) 666-1234';
  LVipCustomer.FidelityCardCode := 'FC003';
  LVipCustomer.VipCardCode := 'VIP001';
  io.Persist(LVipCustomer);
  LVipCustomer.Free;
  // Mr. Omar Bossoni
  LEmployee := TEmployee.Create;
  LEmployee.Name := 'Omar Bossoni (EMP)';
  LEmployee.City := 'New York';
  LEmployee.Address := '111 E 48th St';
  LEmployee.PhoneNumber := '(444) 444-1234';
  LEmployee.BranchOffice := 'Philadelphia';
  io.Persist(LEmployee);
  LEmployee.Free;
  // Mrs. Federica Fortini
  LAnotherCustomer := TAnotherCustomer.Create;
  LAnotherCustomer.Name := 'Federica Fortini (ANOTHER)';
  LAnotherCustomer.City := 'Riccione';
  LAnotherCustomer.Address := 'Viale Napoli 24';
  LAnotherCustomer.PhoneNumber := '0541/112233';
  io.Persist(LAnotherCustomer);
  LAnotherCustomer.Free;
end;

class procedure TSampleData.CreateOtherCustomers;
var
  LCounter: Integer;
  LCustomer: TCustomer;
begin
  for LCounter := 5 to 1000 do
  begin
    LCustomer := TCustomer.Create;
    LCustomer.Name := Format('other customer %d', [LCounter]);
    LCustomer.City := Format('city %d', [LCounter]);
    LCustomer.Address := Format('address %d', [LCounter]);
    LCustomer.PhoneNumber := Format('phone number %d', [LCounter]);
    LCustomer.FidelityCardCode := Format('VC%d', [LCounter]);
    io.Persist(LCustomer);
    LCustomer.Free;
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
  LOrder.Free;
  // Second order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TCustomer>(2);
  LOrder.Note := 'Double cheese please';
  LOrder.Rows.Add( TOrderRow.Create(1, 'Margherita pizza', 4.5, 1) );
  LOrder.Rows.Add( TOrderRow.Create(2, 'Pepperoni pizza', 6.5, 1) );
  io.Persist(LOrder);
  LOrder.Free;
  // Third order
  LOrder := TOrder.Create;
  LOrder.OrderDate := Date;
  LOrder.Customer := io.LoadObject<TVipCustomer>(3);
  LOrder.Rows.Add( TOrderRow.Create(4, 'Love pizza', 5, 1) );
  io.Persist(LOrder);
  LOrder.Free;
end;

end.
