unit Where.Pizza;

interface

uses
  iORM, Where.Interfaces;

type

  [ioNotPersistedEntity]
  TWherePizza = class(TInterfacedObject, IWherePizza)
  private
    FID: Integer;
    [ioWhereAttribute(coLike)]
    FName: String;
    [ioWhereGroup('Price'), ioWhere('Price', coGreaterOrEqual)]
    FFromPrice: Currency;
    [ioWhereGroup('Price'), ioWhere('Price', coLowerOrEqual)]
    FToPrice: Currency;
    function GetFromPrice: Currency;
    function GetID: Integer;
    function GetName: String;
    function GetToPrice: Currency;
    procedure SetFromPrice(const Value: Currency);
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetToPrice(const Value: Currency);
  public
    constructor Create;
    property ID: Integer read GetID write SetID;
    property Name: String read GetName write SetName;
    property FromPrice: Currency read GetFromPrice Write SetFromPrice;
    property ToPrice: Currency read GetToPrice Write SetToPrice;
  end;

implementation

{ TWherePizza }

constructor TWherePizza.Create;
begin
  FFromPrice := 0;
  FToPrice := 100;
end;

function TWherePizza.GetFromPrice: Currency;
begin
  Result := FFromPrice;
end;

function TWherePizza.GetID: Integer;
begin
  Result := FID;
end;

function TWherePizza.GetName: String;
begin
  Result := FName;
end;

function TWherePizza.GetToPrice: Currency;
begin
  Result := FToPrice;
end;

procedure TWherePizza.SetFromPrice(const Value: Currency);
begin
  FFromPrice := Value;
end;

procedure TWherePizza.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TWherePizza.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TWherePizza.SetToPrice(const Value: Currency);
begin
  FToPrice := Value;
end;

end.
