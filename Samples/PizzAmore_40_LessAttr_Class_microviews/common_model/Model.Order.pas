unit Model.Order;

interface

uses
  iORM.Attributes, System.Generics.Collections, Model.Customer, Model.Pizza, Model.OrderRow;

type

  [ioEntity('Orders')]
  TOrder = class(TInterfacedObject)
  private
    FID: Integer;
    FOrderDate: TDate;
    FCustomer: TCustomer;
    FRows: TObjectList<TOrderRow>;
    FNote: String;
    // ID property
    function GetID: Integer;
    // OrderDate property
    procedure SetOrderDate(const AValue: TDate);
    function GetOrderDate: TDate;
    // Customer property
    procedure SetCustomer(const AValue: TCustomer);
    function GetCustomer: TCustomer;
    // Rows property
    function GetRows: TList<TOrderRow>;
    // Note property
    procedure SetNote(const AValue: String);
    function GetNote: String;
    // GrandTotal property
    function GetGrandTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddPizza(const APizza: TPizza);
    property ID: Integer read GetID;  // ReadOnly
    property OrderDate: TDate read GetOrderDate Write SetOrderDate;
    property Customer: TCustomer read GetCustomer write SetCustomer;
    property Rows: TList<TOrderRow> read GetRows; // ReadOnly
    property Note: String read GetNote write SetNote;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
  end;

implementation

uses
  System.SysUtils, System.Rtti, iORM, System.Classes;

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
  FRows := TObjectList<TOrderRow>.Create;
end;

destructor TOrder.Destroy;
begin
  FRows.Free;
  if Assigned(FCustomer) then
    FCustomer.Free;
  inherited;
end;

function TOrder.GetCustomer: TCustomer;
begin
  Result := FCustomer;
end;

function TOrder.GetGrandTotal: Currency;
var
  LRow: TOrderRow;
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

function TOrder.GetRows: TList<TOrderRow>;
begin
  Result := FRows;
end;

procedure TOrder.SetCustomer(const AValue: TCustomer);
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

end.
