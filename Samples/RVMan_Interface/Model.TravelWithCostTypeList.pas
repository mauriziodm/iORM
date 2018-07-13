unit Model.TravelWithCostTypeList;

interface

uses
  Model.CostTypeWithCostList, Model.Travel,
  System.Generics.Collections, iORM.Attributes,
  iORM.LazyLoad.Generics.ObjectList, Model.Travel.Interfaces,
  iORM.Containers.Interfaces, Model.CostTypeWithCostList.Interfaces;

type

  [ioTable('TRAVELS')]
  TTravelWithCostTypeList = class(TTravel, ITravelWithCostTypeList)
  strict private
    FCostTypeList: IioList<ICostTypeWithCostList>;
    FTotalAmount: Currency; protected
  strict protected
    // Methods
    procedure SetTotalAmount(Value: Currency);
    function  GetTotalAmount: Currency;
    function  GetCostTypeList: IioList<ICostTypeWithCostList>;
    procedure SetCostTypeList(Value: IioList<ICostTypeWithCostList>);
    function GetListViewItem_Detailtext: String; override;
  public
    procedure RefreshTotals;
    // Properties
    [ioHasMany(ICostTypeWithCostList, 'TravelID', ioLazyLoad)]
    property CostTypeList:IioList<ICostTypeWithCostList> read GetCostTypeList write SetCostTypeList;
    [ioLoadSql('select sum([TCostGeneric.CostAmount]) from [TCostGeneric] where [TCostGeneric.TravelID] = [TTravel.ID]')]
    property TotalAmount:Currency read FTotalAmount write FTotalAmount;
  end;

implementation

uses System.SysUtils;

{ TTravelWithCostTypeList }

function TTravelWithCostTypeList.GetCostTypeList: IioList<ICostTypeWithCostList>;
begin
  Result := FCostTypeList;
end;

function TTravelWithCostTypeList.GetListViewItem_Detailtext: String;
begin
  Result := '';
  // Date
  if Self.StartDate > 0 then AddDetailText(Result, DateToStr(Self.StartDate), '');
  if Self.EndDate > 0 then AddDetailText(Result, DateToStr(Self.EndDate), '-');
  // Amount
  if Self.TotalAmount > 0 then AddDetailText(Result, CurrToStrF(Self.TotalAmount, ffCurrency, 2), '   ');
  // Km
  if Self.TraveledKM > 0
    then AddDetailText(Result, Self.TraveledKM.ToString + ' Km', '   ')
  else if Self.StartKM > 0
    then AddDetailText(Result, 'da Km ' + Self.StartKM.ToString, '   ');
end;

function TTravelWithCostTypeList.GetTotalAmount: Currency;
begin
  Result := FTotalAmount;
end;

procedure TTravelWithCostTypeList.RefreshTotals;
var
  ACostType: ICostTypeWithCostList;
begin
  FTotalAmount := 0;
  for ACostType in CostTypeList do
    FTotalAmount := FTotalAmount + ACostType.CostTotalAmount;
end;

procedure TTravelWithCostTypeList.SetCostTypeList(
  Value: IioList<ICostTypeWithCostList>);
begin
  if Assigned(FCostTypeList)
  and (Value <> FCostTypeList)
  then FreeAndNil(FCostTypeList);
  FCostTypeList := Value;
end;

procedure TTravelWithCostTypeList.SetTotalAmount(Value: Currency);
begin
  FTotalAmount := Value;
end;

end.
