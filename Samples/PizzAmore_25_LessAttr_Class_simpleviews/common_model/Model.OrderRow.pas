unit Model.OrderRow;

interface

uses
  iORM, Model.Pizza;

type

  [ioEntity('ORDERROWS')]
  TOrderRow = class(TInterfacedObject)
  private
    FID: Integer;
    FPizzaID: Integer;
    FDescription: String;
    FPrice: Currency;
    FQty: Integer;
    function GetRowTotal: Currency;
  public
    constructor Create(APizzaID: Integer; ADescription: String; AUnitPrice: Currency; AQty: Integer); overload;
    constructor Create(APizza: TPizza); overload;
    property ID: Integer read FID;  // ReadOnly
    property PizzaID: Integer read FPizzaID;  // ReadOnly
    property Description: String read FDescription write FDescription;
    property Price: Currency read FPrice write FPrice;
    property Qty: Integer read FQty write FQty;
    property RowTotal: Currency read GetRowTotal;  // ReadOnly
  end;

implementation

{ TOrderRow }

constructor TOrderRow.Create(APizzaID: Integer; ADescription: String; AUnitPrice: Currency; AQty: Integer);
begin
 FPizzaID := APizzaID;
 FDescription := ADescription;
 FPrice := AUnitPrice;
 FQty := AQty;
end;

constructor TOrderRow.Create(APizza: TPizza);
begin
 FPizzaID := APizza.ID;
 FDescription := APizza.Name;
 FPrice := APizza.Price;
 FQty := 1;
end;

function TOrderRow.GetRowTotal: Currency;
begin
  Result := FPrice * FQty;
end;

end.
