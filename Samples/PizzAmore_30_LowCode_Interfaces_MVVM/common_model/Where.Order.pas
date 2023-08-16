unit Where.Order;

interface

uses
  iORM, Where.Interfaces, Model.Interfaces;

type

  [ioEntity('WHERE_ORDERS')]
  TWhereOrder = class(TInterfacedObject, IWhereOrder)
  private
    [ioWhereSkip]
    FID: Integer;
    [ioWhere('ID')]
    FOrderID: Integer;
    FOrderState: TOrderState;
    [ioWhereAttribute(coLike)]
    FNote: String;
    [ioWhereGroup('Date'), ioWhere('OrderDate', coGreaterOrEqual)]
    FFromDate: TDate;
    [ioWhereGroup('Date'), ioWhere('OrderDate', coLowerOrEqual)]
    FToDate: TDate;
    [ioWhere('Customer.Name', coLike)]
    FCustomerName: String;
    [ioWhere('Rows.Description', coLike)]
    FRowsDescription: String;
  protected
    function GetOrderID: Integer;
    function GetOrderState: TOrderState;
    function GetNote: String;
    function GetFromDate: TDate;
    function GetToDate: TDate;
    function GetCustomerName: String;
    function GetRowsDescription: String;
    procedure SetOrderID(const Value: Integer);
    procedure SetOrderState(const Value: TOrderState);
    procedure SetNote(const Value: String);
    procedure SetFromDate(const Value: TDate);
    procedure SetToDate(const Value: TDate);
    procedure SetCustomerName(const Value: String);
    procedure SetRowsDescription(const Value: String);
  public
    constructor Create;
    property OrderID: Integer read GetOrderID write SetOrderID;
    property OrderState: TOrderState read GetOrderState write SetOrderState;
    property Note: String read GetNote write SetNote;
    property FromDate: TDate read GetFromDate Write SetFromDate;
    property ToDate: TDate read GetToDate Write SetToDate;
    property CustomerName: String read GetCustomerName write SetCustomerName;
    property RowsDescription: String read GetRowsDescription write SetRowsDescription;
  end;

implementation

uses
  System.DateUtils;

{ TWhereOrder }

constructor TWhereOrder.Create;
begin
  FOrderState := osUnknown;
  FFromDate := StartOfTheYear(Today);
  FToDate := EndOfTheYear(Today);
end;

function TWhereOrder.GetCustomerName: String;
begin
  Result := FCustomerName;
end;

function TWhereOrder.GetFromDate: TDate;
begin
  Result := FFromDate;
end;

function TWhereOrder.GetNote: String;
begin
  Result := FNote;
end;

function TWhereOrder.GetOrderID: Integer;
begin
  Result := FOrderID;
end;

function TWhereOrder.GetOrderState: TOrderState;
begin
  Result := FOrderState;
end;

function TWhereOrder.GetRowsDescription: String;
begin
  Result := FRowsDescription;
end;

function TWhereOrder.GetToDate: TDate;
begin
  Result := FToDate;
end;

procedure TWhereOrder.SetCustomerName(const Value: String);
begin
  FCustomerName := Value;
end;

procedure TWhereOrder.SetFromDate(const Value: TDate);
begin
  FFromDate := Value;
end;

procedure TWhereOrder.SetNote(const Value: String);
begin
  FNote := Value;
end;

procedure TWhereOrder.SetOrderID(const Value: Integer);
begin
  FOrderID := Value;
end;

procedure TWhereOrder.SetOrderState(const Value: TOrderState);
begin
  FOrderState := Value;
end;

procedure TWhereOrder.SetRowsDescription(const Value: String);
begin
  FRowsDescription := Value;
end;

procedure TWhereOrder.SetToDate(const Value: TDate);
begin
  FToDate := Value;
end;

end.
