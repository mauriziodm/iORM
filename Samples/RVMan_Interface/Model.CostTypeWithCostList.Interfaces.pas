unit Model.CostTypeWithCostList.Interfaces;

interface

uses
  Model.CostType.Interfaces, iORM.Containers.Interfaces,
  Model.Cost.Interfaces;

type

  ICostTypeWithCostList = interface(ICostType)
    ['{17B9937F-EAF1-4BDC-85D8-9900FDB35ACB}']

    procedure SetTravelID(AValue:Integer);
    function GetTRavelID: Integer;
    property TravelID:Integer read GetTravelID write SetTravelID;

    procedure SetCostList(Value: IioList<ICostGeneric>);
    function GetCostList: IioList<ICostGeneric>;
    property CostList:IioList<ICostGeneric> read GetCostList write SetCostList;

    function GetCostTotalAmount: Currency;
    property CostTotalAmount: Currency read GetCostTotalAmount;

    function GetCostTotalLiters: Double;
    property CostTotalLiters: Double read GetCostTotalLiters;

    function GetCostTotalTraveledKM: Double;
    property CostTotalTraveledKM: Double read GetCostTotalTraveledKM;

    function GetCostTotalKMPerLiter: Double;
    property CostTotalKMPerLiter: Double read GetCostTotalKMPerLiter;

    function GetCostTotalLiters100KM: Double;
    property CostTotalLiters100KM: Double read GetCostTotalLiters100KM;
  end;



implementation

end.
