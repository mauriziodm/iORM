unit Where.Interfaces;

interface

uses
  Model.Interfaces;

type

  IWherePizza = interface
    ['{4FEAFA65-D166-410C-8AED-C11EA7C33590}']
    function GetID: Integer;
    function GetName: String;
    function GetFromPrice: Currency;
    function GetToPrice: Currency;
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetFromPrice(const Value: Currency);
    procedure SetToPrice(const Value: Currency);
    property ID: Integer read GetID write SetID;
    property Name: String read GetName write SetName;
    property FromPrice: Currency read GetFromPrice Write SetFromPrice;
    property ToPrice: Currency read GetToPrice Write SetToPrice;
  end;

  IWhereOrder = interface
    ['{1B16B7B3-51C4-45A2-9BFC-DC60F2649DE9}']
    function GetCustomerName: String;
    function GetFromDate: TDate;
    function GetIngredientName: String;
    function GetNote: String;
    function GetOrderID: Integer;
    function GetOrderState: TOrderState;
    function GetPizzaName: String;
    function GetToDate: TDate;
    procedure SetCustomerName(const Value: String);
    procedure SetFromDate(const Value: TDate);
    procedure SetIngredientName(const Value: String);
    procedure SetNote(const Value: String);
    procedure SetOrderID(const Value: Integer);
    procedure SetOrderState(const Value: TOrderState);
    procedure SetPizzaName(const Value: String);
    procedure SetToDate(const Value: TDate);
    property OrderID: Integer read GetOrderID write SetOrderID;
    property OrderState: TOrderState read GetOrderState write SetOrderState;
    property Note: String read GetNote write SetNote;
    property FromDate: TDate read GetFromDate Write SetFromDate;
    property ToDate: TDate read GetToDate Write SetToDate;
    property CustomerName: String read GetCustomerName write SetCustomerName;
    property PizzaName: String read GetPizzaName write SetPizzaName;
    property IngredientName: String read GetIngredientName write SetIngredientName;
  end;

implementation

end.
