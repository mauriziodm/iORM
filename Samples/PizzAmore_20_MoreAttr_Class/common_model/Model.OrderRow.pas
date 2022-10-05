unit Model.OrderRow;

interface

uses
  iORM, Model.Pizza;

type

//  [ioConnectionDefName('FirebirdConn')]
  [ioEntity('ORDERROWS')]
  TOrderRow = class(TInterfacedObject)
  private
    FID: Integer;
    FOrderID: Integer; // ***
    FPizzaID: Integer;
    [ioVarChar(30)]
    FDescription: String;
    FPrice: Currency;
    FQty: Integer;
    FObjStatus: TioObjStatus;
    function GetRowTotal: Currency;
    procedure SetQty(const Value: Integer);
  public
    constructor Create(APizzaID: Integer; ADescription: String; AUnitPrice: Currency; AQty: Integer); overload;
    constructor Create(APizza: TPizza); overload;
    property ID: Integer read FID;  // ReadOnly
    property PizzaID: Integer read FPizzaID;  // ReadOnly
    property Description: String read FDescription write FDescription;
    property Price: Currency read FPrice write FPrice;
    property Qty: Integer read FQty write SetQty;
    [ioField, ioPersistOnly]
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

procedure TOrderRow.SetQty(const Value: Integer);
begin
  FQty := Value;
  FObjStatus := osDirty;
end;

end.
