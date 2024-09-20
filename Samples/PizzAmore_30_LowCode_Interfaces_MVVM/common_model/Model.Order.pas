unit Model.Order;

interface

uses
  iORM, Model.Interfaces, System.Generics.Collections, ETM.Repository;

type

  [ioEntity('ORDERS'), diImplements(IOrder), etmTrace(TEtmRepository)]
  TOrder = class(TInterfacedObject, IOrder)
  private
    FID: Integer;
    FOrderDate: TDate;
    FOrderState: TOrderState;
    FCustomer: ICustomer;
    FRows: TList<IOrderRow>;
    FNote: String;
    FObjVersion: TioObjVersion; // The ObjVersion is mandatory if you want to use the ETM
    // ID property
    function GetID: Integer;
    // OrderDate property
    procedure SetOrderDate(const AValue: TDate);
    function GetOrderDate: TDate;
    // OrderState property
    procedure SetOrderState(const AValue: TOrderState);
    function GetOrderState: TOrderState;
    // Customer property
    procedure SetCustomer(const AValue: ICustomer);
    function GetCustomer: ICustomer;
    // Rows property
    function GetRows: TList<IOrderRow>;
    // Note property
    procedure SetNote(const AValue: String);
    function GetNote: String;
    // GrandTotal property
    function GetGrandTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddPizza(const APizza: IPizza);
    property ID: Integer read GetID;  // ReadOnly
    property OrderDate: TDate read GetOrderDate Write SetOrderDate;
    property OrderState: TOrderState read GetOrderState write SetOrderState;
    property Customer: ICustomer read GetCustomer write SetCustomer;
    property Rows: TList<IOrderRow> read GetRows; // ReadOnly
    property Note: String read GetNote write SetNote;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
  end;

implementation

uses
  System.SysUtils, System.Rtti;

{ TOrder }

procedure TOrder.AddPizza(const APizza: IPizza);
var
  LRow: IOrderRow;
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
  Rows.Add( io.di.Resolve<IOrderRow>.ConstructorParams([TValue.From<IPizza>(APizza)]).Get );
end;

constructor TOrder.Create;
begin
  inherited;
  FOrderDate := Date;
  FRows := TList<IOrderRow>.Create;
end;

destructor TOrder.Destroy;
begin
  FRows.Free;
  inherited;
end;

function TOrder.GetCustomer: ICustomer;
begin
  Result := FCustomer;
end;

function TOrder.GetGrandTotal: Currency;
var
  LRow: IOrderRow;
begin
  Result := 0;
  for LRow in FRows do
    Result := Result + LRow.RowTotal;
end;

function TOrder.GetID: Integer;
begin
  Result := FID;
end;

function TOrder.GetNote: String;
begin
  Result := FNote;
end;

function TOrder.GetOrderDate: TDate;
begin
  Result := FOrderDate;
end;

function TOrder.GetOrderState: TOrderState;
begin
  Result := FOrderState;
end;

function TOrder.GetRows: TList<IOrderRow>;
begin
  Result := FRows;
end;

procedure TOrder.SetCustomer(const AValue: ICustomer);
begin
  FCustomer := AValue;
end;

procedure TOrder.SetNote(const AValue: String);
begin
  FNote := AValue;
end;

procedure TOrder.SetOrderDate(const AValue: TDate);
begin
  FOrderDate := AValue;
end;

procedure TOrder.SetOrderState(const AValue: TOrderState);
begin
  FOrderState := AValue;
end;

end.
