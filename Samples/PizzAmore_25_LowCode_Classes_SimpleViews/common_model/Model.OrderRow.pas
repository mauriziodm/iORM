unit Model.OrderRow;

interface

uses
  iORM, Model.Pizza;

type

  [ioEntity('ORDERROWS')]
  TOrderRow = class
  private
    FID: Integer;
    FPizza: TPizza;
    FQty: Integer;
    FObjStatus: TioObjStatus;
    function GetRowTotal: Currency;
    procedure SetQty(const Value: Integer);
  public
    constructor Create(const APizza: TPizza; const AQty: Integer = 1); overload;
    destructor Destroy; override;
    property ID: Integer read FID;  // ReadOnly if you want
    property Pizza: TPizza read FPizza;  // ReadOnly if you want
    property Qty: Integer read FQty write SetQty;
    property RowTotal: Currency read GetRowTotal;  // ReadOnly
  end;

implementation

uses
  Winapi.Windows;

{ TOrderRow }

constructor TOrderRow.Create(const APizza: TPizza; const AQty: Integer = 1);
begin
 FPizza := APizza;
 FQty := AQty;
end;

destructor TOrderRow.Destroy;
begin
  FPizza.Free;
  inherited;
end;

function TOrderRow.GetRowTotal: Currency;
begin
  Result := FPizza.Price * FQty;
end;

procedure TOrderRow.SetQty(const Value: Integer);
begin
  FQty := Value;
  FObjStatus := osDirty;
end;

end.
