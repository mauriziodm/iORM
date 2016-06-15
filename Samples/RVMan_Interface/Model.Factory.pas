unit Model.Factory;

interface

uses
  Model.CostType, Model.Travel, Model.Cost;

type

  TModelFactoryClassRef = class of TModelFactory;

  TModelFactory = class
  public
    class function CostType(ADescrizione:String; AObjectType:Byte): TCostType;
    class function Travel(ADescrizione:String; AStartDate:TDateTime; AStartKM: Integer): TTravel; overload;
    class function Travel(ADescrizione:String; AStartDate,AEndDate:TDateTime; AStartKM,AEndKM: Integer): TTravel; overload;
    class function Cost(ADescrizione: String; ATravelID: Integer; ACostType:TCostType; ACostDate: TDatetime;
                        ACostAmount: Currency; ACostNote: String; ALiters, AKMTraveled: Double): TCostGeneric; overload;
    class function Cost(ATravelID: Integer; ACostType:TCostType; ACostDate: TDatetime): TCostGeneric; overload;
  end;

implementation

uses
  Model.BaseConst;

{ TModelFactory }

class function TModelFactory.Cost(ADescrizione: String; ATravelID: Integer;
  ACostType: TCostType; ACostDate: TDatetime; ACostAmount: Currency;
  ACostNote: String; ALiters, AKMTraveled: Double): TCostGeneric;
begin
  Result := nil;
  // By ObjectType
  case ACostType.ObjectType of
    // Fuel Cost
    COST_OBJECT_TYPE_FUEL: Result := TCostFuel.Create(
                                                      0
                                                     ,ADescrizione
                                                     ,ATravelID
                                                     ,ACostType
                                                     ,ACostDate
                                                     ,ACostAmount
                                                     ,ACostNote
                                                     ,ALiters
                                                     ,AKMTraveled
                                                     );
    // Generic Cost
    else Result := TCostGeneric.Create(
                                       0
                                      ,ADescrizione
                                      ,ATravelID
                                      ,ACostType
                                      ,ACostDate
                                      ,ACostAmount
                                      ,ACostNote
                                      );
  end;
end;

class function TModelFactory.Cost(ATravelID: Integer; ACostType: TCostType;
  ACostDate: TDatetime): TCostGeneric;
begin
  Result := Self.Cost('', ATravelID, ACostType, ACostDate, 0, '', 0, 0);
end;

class function TModelFactory.CostType(ADescrizione: String;
  AObjectType: Byte): TCostType;
begin
  Result := TCostType.Create(0, ADescrizione, AObjectType);
end;

class function TModelFactory.Travel(ADescrizione: String;
  AStartDate: TDateTime; AStartKM: Integer): TTravel;
begin
  Result := TTravel.Create(0, ADescrizione, AStartDate, AstartKM);
end;

class function TModelFactory.Travel(ADescrizione: String;
  AStartDate, AEndDate: TDateTime; AStartKM, AEndKM: Integer): TTravel;
begin
  Result := TTravel.Create(0, ADescrizione, AStartDate, AEndDate, AStartKM, AEndKM);
end;

end.
