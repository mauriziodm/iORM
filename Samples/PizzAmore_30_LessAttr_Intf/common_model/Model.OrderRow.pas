unit Model.OrderRow;

interface

uses
  iORM, Model.Interfaces;

type

  [ioEntity('ORDERROWS')]
  TOrderRow = class(TInterfacedObject, IOrderRow)
  private
    FID: Integer;
    FPizzaID: Integer;
    FDescription: String;
    FPrice: Currency;
    FQty: Integer;
    // ID property
    function GetID: Integer;
    // PizzaID property
    function GetPizzaID: Integer;
    // Description property
    procedure SetDescription(const AValue: String);
    function GetDescription: String;
    // Price property
    procedure SetPrice(const AValue: Currency);
    function GetPrice: Currency;
    // Qty property
    procedure SetQty(const AValue: Integer);
    function GetQty: Integer;
    // RowTotal property
    function GetRowTotal: Currency;
  public
    constructor Create(APizzaID: Integer; ADescription: String; AUnitPrice: Currency; AQty: Integer); overload;
    constructor Create(APizza: IPizza); overload;
    property ID: Integer read GetID;  // ReadOnly
    property PizzaID: Integer read GetPizzaID;  // ReadOnly
    property Description: String read GetDescription write SetDescription;
    property Price: Currency read GetPrice write SetPrice;
    property Qty: Integer read GetQty write SetQty;
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

constructor TOrderRow.Create(APizza: IPizza);
begin
 FPizzaID := APizza.ID;
 FDescription := APizza.Name;
 FPrice := APizza.Price;
 FQty := 1;
end;

function TOrderRow.GetDescription: String;
begin
  Result := FDescription;
end;

function TOrderRow.GetID: Integer;
begin
  Result := FID;
end;

function TOrderRow.GetPizzaID: Integer;
begin
  Result := FPizzaID;
end;

function TOrderRow.GetPrice: Currency;
begin
  Result := FPrice;
end;

function TOrderRow.GetQty: Integer;
begin
  Result := FQty;
end;

function TOrderRow.GetRowTotal: Currency;
begin
  Result := FPrice * FQty;
end;

procedure TOrderRow.SetDescription(const AValue: String);
begin
  FDescription := AValue;
end;

procedure TOrderRow.SetPrice(const AValue: Currency);
begin
  FPrice := AValue;
end;

procedure TOrderRow.SetQty(const AValue: Integer);
begin
  FQty := AValue;
end;

end.
