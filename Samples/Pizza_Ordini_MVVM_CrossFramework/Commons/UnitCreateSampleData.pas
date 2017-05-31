unit UnitCreateSampleData;

interface

type

  TCreateSampleData = class
  private
    class procedure CreateSampleCustomers;
    class procedure CreateSamplePizzas;
    class procedure CreateSampleOrders;
    class function IsEmpty: Boolean;
  public
    class procedure CreateSampleData;
  end;

implementation

uses
  Model.Customer, iORM, FireDAC.Comp.Client, Model.Order, System.SysUtils;

{ TCreateSampleData }

class function TCreateSampleData.IsEmpty: Boolean;
var
  LMemTable: TFDMemTable;
begin
  LMemTable := io.SQL('select count(*) from [TCustomer]').ToMemTable;
  try
    Result := (LMemTable.Fields[0].AsInteger = 0);
  finally
    LMemTable.Free;
  end;
end;

class procedure TCreateSampleData.CreateSampleCustomers;
var
  LCustomer: TCustomer;
begin
  LCustomer := TCustomer.Create;
  LCustomer.FirstName := 'Maurizio';
  LCustomer.LastName := 'Del Magno';
  io.Persist(LCustomer);
  LCustomer.Free;
end;

class procedure TCreateSampleData.CreateSampleData;
begin
  if IsEmpty then
  begin
    CreateSamplePizzas;
    CreateSampleCustomers;
    CreateSampleOrders;
  end;
end;

class procedure TCreateSampleData.CreateSampleOrders;
var
  LOrder: TOrder;
begin
  LOrder := TOrder.Create;
  LOrder.Date := Date;
  LOrder.Customer := io.Load<TCustomer>.ByOID(1).ToObject;
  io.Persist(LOrder);
  LOrder.Free;
end;

class procedure TCreateSampleData.CreateSamplePizzas;
begin

end;

end.
