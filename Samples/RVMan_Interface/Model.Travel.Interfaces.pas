unit Model.Travel.Interfaces;

interface

uses Model.BaseClasses.Interfaces, iORM.Containers.Interfaces,
  Model.CostTypeWithCostList.Interfaces;

type

  ITravel = interface(IBaseClass)
    ['{862D1CF9-986F-40E3-BBA9-D52491C5205E}']

    function GetStartDate: TDateTime;
    procedure SetStartDate(Value: TDateTime);
    property StartDate:TDateTime read GetStartDate write SetStartDate;

    function GetEndDate: TDateTime;
    procedure SetEndDate(Value: TDateTime);
    property EndDate:TDateTime read GetEndDate write SetEndDate;

    function GetStartKM: Integer;
    procedure SetStartKM(Value: Integer);
    property StartKM:Integer read GetStartKM write SetStartKM;

    function GetEndKM: Integer;
    procedure SetEndKM(Value: Integer);
    property EndKM:Integer read GetEndKM write SetEndKM;

    function GetTraveledKM: Integer;
    property TraveledKM:Integer read GetTraveledKM;
  end;




  ITravelWithCostTypeList = interface(ITravel)
    ['{9137C13F-579F-4E49-A278-FCE99C82FE38}']

    procedure SetCostTypeList(Value: IioList<ICostTypeWithCostList>);
    function  GetCostTypeList: IioList<ICostTypeWithCostList>;
    property CostTypeList:IioList<ICostTypeWithCostList> read GetCostTypeList write SetCostTypeList;

    procedure SetTotalAmount(Value: Currency);
    function  GetTotalAmount: Currency;
    property TotalAmount:Currency read GetTotalAmount write SetTotalAmount;

    procedure RefreshTotals;
  end;


implementation

end.
