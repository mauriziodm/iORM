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
    function GetOrderID: Integer;
    function GetOrderState: TOrderState;
    function GetNote: String;
    function GetFromDate: TDate;
    function GetToDate: TDate;
    procedure SetOrderID(const Value: Integer);
    procedure SetOrderState(const Value: TOrderState);
    procedure SetNote(const Value: String);
    procedure SetFromDate(const Value: TDate);
    procedure SetToDate(const Value: TDate);
    property OrderID: Integer read GetOrderID write SetOrderID;
    property OrderState: TOrderState read GetOrderState write SetOrderState;
    property Note: String read GetNote write SetNote;
    property FromDate: TDate read GetFromDate Write SetFromDate;
    property ToDate: TDate read GetToDate Write SetToDate;
  end;

implementation

end.
