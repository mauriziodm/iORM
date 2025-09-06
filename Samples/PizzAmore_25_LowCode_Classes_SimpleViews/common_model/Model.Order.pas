unit Model.Order;

interface

uses
  iORM, ETM.Repository, System.Generics.Collections, Model.Customer, Model.OrderRow, Model.Pizza;

type

  [ioEnumerated('All, Waiting, Preparing, Ready, Delivered')]
  TOrderState = (osUnknown, osWaiting, osPreparing, osReady, osDelivered);

  [ioEntity('ORDERS'), etmTrace(TEtmRepository)]
  TOrder = class
  private
    FID: Integer;
    FOrderDate: TDate;
    [etmProperty('Customer.ID', 'CustomerID')]
    FCustomer: TCustomer;
    FOrderRows: TObjectList<TOrderRow>;
    FNote: String;
    FOrderState: TOrderState;
    FObjVersion: TioObjVersion; // The ObjVersion is mandatory if you want to use the ETM
    function GetGrandTotal: Currency;
  public
    constructor Create;
    constructor CreateWithCustomer(const ACustomer: TCustomer);
    destructor Destroy; override;
    procedure AddPizza(const APizza: TPizza);
    property ID: Integer read FID write FID; // ReadOnly if you want
    property OrderDate: TDate read FOrderDate Write FOrderDate;
    property Customer: TCustomer read FCustomer write FCustomer;
    property OrderRows: TObjectList<TOrderRow> read FOrderRows; // ReadOnly
    property Note: String read FNote write FNote;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
    property OrderState: TOrderState read FOrderState write FOrderState;
  end;

implementation

uses
  System.SysUtils, System.Rtti;

{ TOrder }

procedure TOrder.AddPizza(const APizza: TPizza);
var
  LRow: TOrderRow;
begin
  // If a row with the same pizza is present then increment its qty
  for LRow in OrderRows do
  begin
    if LRow.Pizza.ID = APizza.ID then
    begin
      FreeAndNil(APizza);
      LRow.Qty := LRow.Qty + 1;
      Exit;
    end;
  end;
  // Else create a new OrderRow
  OrderRows.Add( TOrderRow.Create(APizza) );
end;

constructor TOrder.Create;
begin
  inherited;
  FOrderDate := Date;
  FOrderState := osWaiting;
  FOrderRows := TObjectList<TOrderRow>.Create;
end;

constructor TOrder.CreateWithCustomer(const ACustomer: TCustomer);
begin
  Create;
  FCustomer := ACustomer;
end;

destructor TOrder.Destroy;
begin
  FOrderRows.Free;
  if FCustomer <> nil then
    FCustomer.Free;
  inherited;
end;

function TOrder.GetGrandTotal: Currency;
var
  LRow: TOrderRow;
begin
  Result := 0;
  for LRow in FOrderRows do
    Result := Result + LRow.RowTotal;
end;

initialization

  io.di.RegisterClass<TOrder>('CUSTOMER').FactoryMethod<TCustomer>(
    function (ACustomer: TCustomer): TObject
    begin
      Result := TOrder.CreateWithCustomer(ACustomer);
    end).Execute;

end.
