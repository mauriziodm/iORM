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
  iORM, System.SysUtils, Model.Interfaces, Model.Customers, Model.Order,
  Model.OrderRow, Model.Pizza, System.IOUtils;

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
  LImagesPath: String;
begin
  // Detect the right images path for mobile or win32 (test "MargheritaPizza.bmp" file only)
  if FileExists(TPath.Combine(TPath.GetDocumentsPath, 'MargheritaPizza.bmp')) then
    LImagesPath := TPath.GetDocumentsPath
  else
    LImagesPath := TPath.GetFullPath('..\..\..\..\common_images');

  // Margherita pizza
  LPizza := TPizza.Create('Margherita pizza', 4.50, TPath.Combine(LImagesPath, 'MargheritaPizza.bmp'));
  io.PersistObject(LPizza);
  // Capricciosa pizza
  LPizza := TPizza.Create('Capricciosa pizza', 7.00, TPath.Combine(LImagesPath, 'CapricciosaPizza.bmp'));
  io.PersistObject(LPizza);
  // Pepperoni pizza
  LPizza := TPizza.Create('Pepperoni pizza', 6.50, TPath.Combine(LImagesPath, 'PepperoniPizza.bmp'));
  io.PersistObject(LPizza);
  // Love pizza
  LPizza := TPizza.Create('Love pizza', 5.00, TPath.Combine(LImagesPath, 'LovePizza.bmp'));
  io.PersistObject(LPizza);
end;

class procedure TSampleData.CreateRealCustomers;
var
  LCustomer: IGenericCustomer;
begin
  // Mr. Maurizio Del Magno
  LCustomer := TPrivateCustomer.Create('Maurizio', 'Del Magno', '301 Park Ave', 'New York', '+1 (555) 555-1234');
  io.PersistObject(LCustomer);
  // Mr. Marco Mottadelli
  LCustomer := TPrivateCustomer.Create('Marco', 'Mottadelli', '3501 Bergenline Ave', 'Union City', '+1 (333) 333-1234');
  io.PersistObject(LCustomer);
  // Mr. Fabio Codebue
  LCustomer := TPrivateCustomer.Create('Fabio', 'Codebue', '150 Lake Corniche', 'Tavernola Bergamasca City', '+1 (666) 666-1234');
  io.PersistObject(LCustomer);
  // Embarcadero Technologies
  LCustomer := TBusinessCustomer.Create('Embarcadero Technologies Europe LTD', 'GB697737756', 'Easthampstead Road', 'Bracknell', '+44 (0) 1628-684400');
  io.PersistObject(LCustomer);
  // Idera
  LCustomer := TBusinessCustomer.Create('Idera Inc.', 'US760662481', '10801 N Mopac', 'Austin', '+1 (512) 226-8080');
  io.PersistObject(LCustomer);
end;

class procedure TSampleData.CreateOtherCustomers;
var
  LCounter: Integer;
  LCustomer: IGenericCustomer;
begin
  for LCounter := 6 to 1000 do
  begin
    LCustomer := TPrivateCustomer.Create('FirstName' + LCounter.ToString, 'LastName' + LCounter.ToString, 'Address' + LCounter.ToString,
      'City' + LCounter.ToString, 'Phone' + LCounter.ToString);
    io.PersistObject(LCustomer);
  end;
end;

class procedure TSampleData.CreateOrders;
 var
 LOrder: IOrder;
begin
   // First order
   LOrder := TOrder.Create;
   LOrder.Customer := io.LoadObject<IGenericCustomer>(1);
   LOrder.Note := 'Well done';
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(1), 3) );
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(2), 2) );
   LOrder.Rows.Add( TCustomOrderRow.Create('Pizza with artichokes and blue cheese without mozzarella', 9.00, 1) );
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(3), 1) );
   io.PersistObject(LOrder);
   // Second order
   LOrder := TOrder.Create;
   LOrder.Customer := io.LoadObject<IGenericCustomer>(2);
   LOrder.Note := 'Double cheese';
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(1)) );
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(3)) );
   io.PersistObject(LOrder);
   // Third order
   LOrder := TOrder.Create;
   LOrder.Customer := io.LoadObject<IGenericCustomer>(4);
   LOrder.Rows.Add( TPizzaOrderRow.Create(io.LoadObject<IPizza>(4)) );
   io.PersistObject(LOrder);
end;

end.
