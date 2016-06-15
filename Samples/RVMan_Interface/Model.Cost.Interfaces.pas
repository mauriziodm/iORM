unit Model.Cost.Interfaces;

interface

uses Model.BaseClasses.Interfaces, Model.CostType.Interfaces;

type

  ICostGeneric = interface(IBaseClass)
    ['{6F77E81B-33C3-4139-A96E-63A2B3247AD6}']

    function GetTravelID: Integer;
    procedure SetTravelID(Value: Integer);
    property TravelID: Integer read GetTravelID write SetTravelID;

    function GetCostDate: TDateTime;
    procedure SetCostDate(Value: TDateTime);
    property CostDate:TDateTime read GetCostDate write SetCostDate;

    function GetCostType: ICostType;
    procedure SetCostType(Value: ICostType);
    property CostType:ICostType read GetCostType write SetCostType;

    function GetCostAmount: Currency;
    procedure SetCostAmount(Value: Currency);
    property CostAmount:Currency read GetCostAmount write SetCostAmount;

    function GetCostNote: String;
    procedure SetCostNote(Value: String);
    property CostNote:String read GetCostNote write SetCostNote;
  end;



  ICostFuel = Interface(ICostGeneric)
    ['{387001D1-EB0A-4827-B644-8617E9199F89}']

    function GetLiters: Double;
    procedure SetLiters(Value: Double);
    property Liters:Double read GetLiters write SetLiters;

    function GetKMTraveled: Double;
    procedure SetKMTraveled(Value: Double);
    property KMTraveled:Double read GetKMTraveled write SetKMTraveled;

    function GetKMPerLiter: Double;
    property KMPerLiter:Double read GetKMPerLiter;

    function GetLiters100KM: Double;
    property Liters100KM:Double read GetLiters100KM;
  end;



implementation

end.
