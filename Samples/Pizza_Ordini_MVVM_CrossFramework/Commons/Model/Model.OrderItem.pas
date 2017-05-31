unit Model.OrderItem;

interface

uses
  iORM.Attributes, ModelInterfaces;

type

  [ioEntity]
  TOrderItem = class(TInterfacedObject, IOrderItem)
  private
    FPizzaName: String;
    FPrice: Currency;
    FQty: Integer;
    FID: Integer;
    FPizzaID: Integer;
    function GetTotal: Currency;
    function GetListText:String;
  public
    property ID:Integer read FID write FID;
    property PizzaID:Integer read FPizzaID write FPizzaID;
    property PizzaName:String read FPizzaName write FPizzaName;
    property Price:Currency read FPrice write FPrice;
    property Qty:Integer read FQty write FQty;
    [ioSkip]
    property Total:Currency read GetTotal;
    [ioSkip]
    property ListText:String read GetListText;
  end;

implementation

uses
  System.SysUtils;

{ TOrderItem }

function TOrderItem.GetListText: String;
begin
  Result := Format('%s', [FPizzaName]);
end;

function TOrderItem.GetTotal: Currency;
begin
  Result := FPrice * FQty;
end;

end.
