unit Where.Order;

interface

uses
  iORM, Model.Order;

type

  [ioEntity('WHERE_ORDERS')]
  TWhereOrder = class
  private
    [ioWhereSkip]
    FID: Integer;
    [ioWhere('ID')]
    FOrderID: Integer;
    FOrderState: TOrderState;
    [ioWhere(coLike)]
    FNote: String;
    [ioWhereGroup('Date'), ioWhere('OrderDate', coGreaterOrEqual)]
    FFromDate: TDate;
    [ioWhereGroup('Date'), ioWhere('OrderDate', coLowerOrEqual)]
    FToDate: TDate;
    [ioWhere('Customer.Name', coLike)]
    FCustomerName: String;
    [ioWhere('Rows.Description', coLike)]
    FRowsDescription: String;
  public
    constructor Create;
    property OrderID: Integer read FOrderID write FOrderID;
    property OrderState: TOrderState read FOrderState write FOrderState;
    property Note: String read FNote write FNote;
    property FromDate: TDate read FFromDate Write FFromDate;
    property ToDate: TDate read FToDate Write FToDate;
    property CustomerName: String read FCustomerName write FCustomerName;
    property RowsDescription: String read FRowsDescription write FRowsDescription;
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

end.
