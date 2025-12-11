unit Model.OrderRow;

interface

uses
  iORM, Model.Interfaces;

type

  [ioEntity('ORDERROWS')]
  TOrderRow = class(TInterfacedObject, IOrderRow)
  private
    FID: Integer;
    FPizza: IPizza;
    FQty: Integer;
    function GetID: Integer;
    function GetPizza: IPizza;
    function GetQty: Integer;
    function GetRowTotal: Currency;
    procedure SetQty(const AValue: Integer);
  public
    constructor Create(const APizza: IPizza; const AQty: Integer); overload;
    constructor Create(const APizza: IPizza); overload;
    property ID: Integer read GetID;
    property Pizza: IPizza read GetPizza;
    property Qty: Integer read GetQty write SetQty;
    property RowTotal: Currency read GetRowTotal;
  end;

implementation

{ TOrderRow }

constructor TOrderRow.Create(const APizza: IPizza; const AQty: Integer);
begin
 FPizza := APizza;
 FQty := AQty;
end;

constructor TOrderRow.Create(const APizza: IPizza);
begin
 FPizza := APizza;
 FQty := 1;
end;

function TOrderRow.GetID: Integer;
begin
  Result := FID;
end;

function TOrderRow.GetPizza: IPizza;
begin
  Result := FPizza;
end;

function TOrderRow.GetQty: Integer;
begin
  Result := FQty;
end;

function TOrderRow.GetRowTotal: Currency;
begin
  Result := FPizza.Price * FQty;
end;

procedure TOrderRow.SetQty(const AValue: Integer);
begin
  FQty := AValue;
end;

end.
