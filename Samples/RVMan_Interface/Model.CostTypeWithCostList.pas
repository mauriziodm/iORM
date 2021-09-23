unit Model.CostTypeWithCostList;

interface

uses Model.CostType,
Model.Cost, System.Generics.Collections, FMX.Dialogs, iORM.Attributes,
  iORM.LazyLoad.Generics.ObjectList, Model.CostTypeWithCostList.Interfaces,
  iORM.Containers.Interfaces, Model.Cost.Interfaces;

type

  // Classe che rappresenta i tipi di spesa possibili comprensivo
  // però anche della lista dei costi e dell'importo totale
  [ioTable('COSTTYPES')]
  [ioJoin(jtInner, TCostGeneric, '[TCostGeneric.CostType] = [TCostType.ID]')]
  [ioGroupBy('[TCostType.ID], [TCostType.Descrizione], [TCostGeneric.TravelID], [TCostType.ObjectType]')]
  TCostTypeWithCostList = class(TCostType, ICostTypeWithCostList)
  strict private
    FCostList: IioList<ICostGeneric>;
    FTravelID: Integer;
  strict protected
    procedure SetTravelID(AValue:Integer);
    function GetTRavelID: Integer;
    function GetCostTotalLiters: Double;
    function GetCostTotalKMPerLiter: Double;
    function GetCostTotalTraveledKM: Double;
    function GetCostList: IioList<ICostGeneric>;
    procedure SetCostList(Value: IioList<ICostGeneric>);
    function GetCostTotalAmount: Currency;
    function GetListViewItem_Detailtext: String; override;
    function GetDetailTextForCostGeneric: String;
    function GetDetailTextForCostFuel: String;
    function GetCostTotalLiters100KM: Double;
  public
    [ioField('[TCostGeneric].TravelID')]
    property TravelID:Integer read GetTRavelID write SetTravelID;
    [ioHasMany(ICostGeneric, 'CostType', ltEagerLoad)]
    property CostList:IioList<ICostGeneric> read GetCostList write SetCostList;
    [ioSkip]
    property CostTotalAmount: Currency read GetCostTotalAmount;
    [ioSkip]
    property CostTotalLiters: Double read GetCostTotalLiters;
    [ioSkip]
    property CostTotalTraveledKM: Double read GetCostTotalTraveledKM;
    [ioSkip]
    property CostTotalKMPerLiter: Double read GetCostTotalKMPerLiter;
    [ioSkip]
    property CostTotalLiters100KM: Double read GetCostTotalLiters100KM;
  end;

implementation

uses
  System.SysUtils, Model.BaseConst, System.Math;

{ TCostTypeWithCostList }

function TCostTypeWithCostList.GetCostList: IioList<ICostGeneric>;
begin
  Result := FCostList;
end;

function TCostTypeWithCostList.GetCostTotalAmount: Currency;
var
  Cost: ICostGeneric;
begin
  Result := 0;
  for Cost in FCostList do
    Result := Result + Cost.CostAmount;
end;

function TCostTypeWithCostList.GetCostTotalKMPerLiter: Double;
begin
  Result := 0;
  if Self.CostTotalLiters = 0 then Exit;
  Result := SimpleRoundTo(Self.CostTotalTraveledKM / Self.CostTotalLiters, -1);
end;

function TCostTypeWithCostList.GetCostTotalLiters: Double;
var
  CostGen: ICostGeneric;
begin
  Result := 0;
  if Self.ObjectType <> COST_OBJECT_TYPE_FUEL then Exit;
  for CostGen in FCostList do
    Result := Result + TCostFuel(CostGen).Liters;
end;

function TCostTypeWithCostList.GetCostTotalLiters100KM: Double;
begin
  Result := 0;
  if Self.CostTotalTraveledKM = 0 then Exit;
  Result := SimpleRoundTo((100 * Self.CostTotalLiters / Self.CostTotalTraveledKM), -1);
end;

function TCostTypeWithCostList.GetCostTotalTraveledKM: Double;
var
  CostGen: ICostGeneric;
begin
  Result := 0;
  if Self.ObjectType <> COST_OBJECT_TYPE_FUEL then Exit;
  for CostGen in FCostList do
    if CostGen is TCostFuel
      then Result := Result + TCostFuel(CostGen).KMTraveled;
end;

function TCostTypeWithCostList.GetDetailTextForCostFuel: String;
begin
  Result := '';
  // Total amount
  if Self.CostTotalAmount > 0
    then Result := CurrToStrF(Self.CostTotalAmount, ffCurrency, 2);
  // TraveledKM
  if Self.CostTotalTraveledKM > 0
    then Self.AddDetailText(Result, Self.CostTotalTraveledKM.ToString + ' Km', '     ');
  // KM per Liter
  if Self.CostTotalKMPerLiter > 0
    then Self.AddDetailText(Result, Self.CostTotalKMPerLiter.ToString + ' Km/Lt', '     ');
end;

function TCostTypeWithCostList.GetDetailTextForCostGeneric: String;
begin
  Result := '';
  // Total amount
  if Self.CostTotalAmount > 0
    then Result := CurrToStrF(Self.CostTotalAmount, ffCurrency, 2);
end;

function TCostTypeWithCostList.GetListViewItem_Detailtext: String;
begin
  case Self.ObjectType of
    COST_OBJECT_TYPE_FUEL: Result := Self.GetDetailTextForCostFuel;
  else Result := Self.GetDetailTextForCostGeneric;
  end;
end;

function TCostTypeWithCostList.GetTRavelID: Integer;
begin
  Result := FTravelID;
end;

procedure TCostTypeWithCostList.SetCostList(Value: IioList<ICostGeneric>);
begin
  if Value = FCostList then
    Exit;
  FCostList := Value;
end;

procedure TCostTypeWithCostList.SetTravelID(AValue: Integer);
begin
  FTravelID := AValue;
end;

end.
