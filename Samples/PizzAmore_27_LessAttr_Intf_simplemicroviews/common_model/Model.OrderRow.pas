unit Model.OrderRow;

interface

uses
// "ioFMX" is defined in project options to indicate that it is a firemonkey project (Project | Options | Delphi Compiler | Conditional defines).
// Note: You need to build your project (Project | Build <ProjectName> or Shift + F9) for the changes to take effect.
{$IFDEF ioFMX}
  Fmx.Graphics,
{$ELSE}
  Vcl.Graphics,
{$IFEND}
  iORM, Model.Interfaces, Model.BaseBO;

type

  [ioEntity('ORDERROWS')]
  TBaseOrderRow = class(TBaseBO, IOrderRow)
  private
    FOrderID: Integer;
    FQty: Integer;
    FObjStatus: TioObjStatus;
    procedure SetQty(const AValue: Integer);
    function GetQty: Integer;
  protected
    function GetRowTotal: Currency; virtual; abstract;
  public
    constructor Create;
    property Qty: Integer read getQty write SetQty;
    property RowTotal: Currency read GetRowTotal;
  end;

  [ioEntity('ORDERROWS'), diImplements(IOrderRow, 'PizzaOrderRow')]
  TPizzaOrderRow = class(TBaseOrderRow, IPizzaOrderRow)
  private
    FPizza: IPizza;
  protected
    function GetPizza: IPizza;
    function GetRowTotal: Currency; override;
  public
    constructor Create(const APizza: IPizza; const AQty: Integer = 1); overload;
    procedure AddOne;
    property Pizza: IPizza read GetPizza;
//    property Image: TBitmap read GetImage;
  end;

  [ioEntity('ORDERROWS'), diImplements(IOrderRow, 'CustomOrderRow')]
  TCustomOrderRow = class(TBaseOrderRow)
  private
    FDescription: String;
    FPrice: Currency;
  protected
    function GetRowTotal: Currency; override;
  public
    constructor Create(const ADescription: String; const APrice: Currency; const AQty: Integer = 1); overload;
    property Description: String read FDescription write FDescription;
    property Price: Currency read FPrice write FPrice;
  end;

implementation

uses
  Winapi.Windows;

{ TBaseOrderRow }

constructor TBaseOrderRow.Create;
begin
  FQty := 1;
end;

function TBaseOrderRow.GetQty: Integer;
begin
  Result := FQty;
end;

procedure TBaseOrderRow.SetQty(const AValue: Integer);
begin
  if AValue <> FQty then
  begin
    FQty := AValue;
    FObjStatus := osDirty;
  end;
end;

{ TPizzaOrderRow }

procedure TPizzaOrderRow.AddOne;
begin
  Qty := Qty + 1;
end;

constructor TPizzaOrderRow.Create(const APizza: IPizza; const AQty: Integer = 1);
begin
  inherited Create;
  FPizza := APizza;
  FQty := AQty;
end;

function TPizzaOrderRow.GetPizza: IPizza;
begin
  Result := FPizza;
end;

function TPizzaOrderRow.GetRowTotal: Currency;
begin
  Result := FPizza.Price * FQty;
end;

{ TCustomOrderRow }

constructor TCustomOrderRow.Create(const ADescription: String; const APrice: Currency; const AQty: Integer = 1);
begin
  inherited Create;
  FDescription := ADescription;
  FPrice := APrice;
  FQty := AQty;
end;

function TCustomOrderRow.GetRowTotal: Currency;
begin
  Result := FPrice * FQty;
end;

end.
