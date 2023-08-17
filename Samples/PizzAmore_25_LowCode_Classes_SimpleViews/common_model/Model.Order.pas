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
    FCustomer: TCustomer;
    FRows: TObjectList<TOrderRow>;
    FNote: String;
    FOrderState: TOrderState;
    FObjVersion: TioObjVersion;
    function GetGrandTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddPizza(const APizza: TPizza);
    property ID: Integer read FID write FID;  // ReadOnly if you want
    property OrderDate: TDate read FOrderDate Write FOrderDate;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Rows: TObjectList<TOrderRow> read FRows; // ReadOnly
    property Note: String read FNote write FNote;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
    property OrderState: TOrderState read FOrderState write FOrderState;
  end;

implementation

uses
  System.SysUtils;

{ TOrder }

procedure TOrder.AddPizza(const APizza: TPizza);
var
  LRow: TOrderRow;
begin
  // If a row with the same pizza is present then increment its qty
  for LRow in Rows do
  begin
    if LRow.PizzaID = APizza.ID then
    begin
      LRow.Qty := LRow.Qty + 1;
      Exit;
    end;
  end;
  // Else create a new OrderRow
  Rows.Add( TOrderRow.Create(APizza) );
end;

constructor TOrder.Create;
begin
  inherited;
  FOrderDate := Date;
  FOrderState := osWaiting;
  FRows := TObjectList<TOrderRow>.Create;
end;

destructor TOrder.Destroy;
begin
  FRows.Free;
  if FCustomer <> nil then
    FCustomer.Free;
  inherited;
end;

function TOrder.GetGrandTotal: Currency;
var
  LRow: TOrderRow;
begin
  Result := 0;
  for LRow in FRows do
    Result := Result + LRow.RowTotal;
end;

end.
