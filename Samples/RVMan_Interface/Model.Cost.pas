unit Model.Cost;

interface

uses
  Model.BaseConst, Model.BaseClasses, System.SysUtils, System.Generics.Collections,
  iORM.Attributes, Model.Cost.Interfaces,
  Model.CostType.Interfaces;

type

  // Classe che rappresenta un costo generico
  [ioTable('COSTS'), ioClassFromField]
  TCostGeneric = class(TBaseClass, ICostGeneric)
  strict private
    FTravelID: Integer;
    FCostDate: TDatetime;
    FCostType: ICostType;
    FCostAmount: Currency;
    FCostNote: String;
  strict protected
    function GetTravelID: Integer;
    procedure SetTravelID(Value: Integer);
    function GetCostDate: TDateTime;
    procedure SetCostDate(Value: TDateTime);
    function GetCostType: ICostType;
    procedure SetCostType(Value: ICostType);
    function GetCostAmount: Currency;
    procedure SetCostAmount(Value: Currency);
    function GetCostNote: String;
    procedure SetCostNote(Value: String);
    function GetListViewItem_Caption: String; override;
    function GetListViewItem_DetailText: String; override;
  public
    constructor Create(AID:Integer; ADescrizione:String; ATravelID:Integer; ACostType:ICostType;
                       ACostDate:TDatetime; ACostAmount:Currency; ACostNote:String); overload;
    property TravelID: Integer read GetTravelID write SetTravelID;
    property CostDate:TDateTime read GetCostDate write SetCostDate;
    [ioField('CostTypeID'), ioBelongsTo('ICostType')]
    property CostType:ICostType read GetCostType write SetCostType;
    property CostAmount:Currency read GetCostAmount write SetCostAmount;
    property CostNote:String read GetCostNote write SetCostNote;
  end;



  // Classe che rappresenta un costo di carburante
  [ioTable('COSTS'), ioClassFromField]
  TCostFuel = class(TCostGeneric, ICostFuel)
  strict private
    FLiters: Double;
    FKMTraveled: Double;
  strict protected
    function GetLiters: Double;
    procedure SetLiters(Value: Double);
    function GetKMTraveled: Double;
    procedure SetKMTraveled(Value: Double);
    function GetKMPerLiter: Double;
    function GetLiters100KM: Double;
    function GetListViewItem_DetailText: String; override;
  public
    constructor Create(AID:Integer; ADescrizione:String; ATravelID:Integer; ACostType:ICostType;
                       ACostDate:TDatetime; ACostAmount:Currency; ACostNote:String;
                       ALiters:Double; AKMTraveled:Double); overload;
    property Liters:Double read GetLiters write SetLiters;
    property KMTraveled:Double read GetKMTraveled write SetKMTraveled;
    [ioSkip]
    property KMPerLiter:Double read GetKMPerLiter;
    [ioSkip]
    property Liters100KM:Double read GetLiters100KM;
  end;

  // Factory per la creazione del giusto tipo di costo in base alla situazione
  TCostFactory = class
  public
//    class function NewCost(AID:Integer; ADescrizione:String; ATravelID:Integer; ACostTypeID:Integer;
//                       ACostDate:TDatetime; ACostAmount:Currency; ACostNote:String;
//                       ALiters:Double; AKMTraveled:Double): TCostGeneric;
    class function NewCost(AID:Integer; ADescrizione:String; ATravelID:Integer; ACostType:ICostType;
                       ACostDate:TDatetime; ACostAmount:Currency; ACostNote:String;
                       ALiters:Double; AKMTraveled:Double): TCostGeneric;
  end;


implementation

uses
  System.Math;

{ TCostGeneric }

constructor TCostGeneric.Create(AID: Integer; ADescrizione: String;
  ATravelID: Integer; ACostType: ICostType; ACostDate: TDatetime;
  ACostAmount: Currency; ACostNote: String);
begin
  inherited Create(AID, ADescrizione);
  TravelID := ATravelID;
  CostType := ACostType;
  CostDate := ACostDate;
  CostAmount := ACostAmount;
  CostNote := ACostNote;
end;

function TCostGeneric.GetCostAmount: Currency;
begin
  Result := FCostAmount;
end;

function TCostGeneric.GetCostDate: TDateTime;
begin
  Result := FCostDate;
end;

function TCostGeneric.GetCostNote: String;
begin
  Result := FCostNote;
end;

function TCostGeneric.GetCostType: ICostType;
begin
  Result := FCostType;
end;

function TCostGeneric.GetListViewItem_Caption: String;
begin
  inherited;
  Result := DateToStr(Self.CostDate) + ' - ' + Self.Descrizione;
end;

function TCostGeneric.GetListViewItem_DetailText: String;
begin
  inherited;
  Result := '';
  // Total amount
  if Self.CostAmount > 0
    then Result := CurrToStrF(Self.CostAmount, ffCurrency, 2);
end;

function TCostGeneric.GetTravelID: Integer;
begin
  Result := FTravelID;
end;

procedure TCostGeneric.SetCostAmount(Value: Currency);
begin
  if Value <> FCostAmount then
  begin
    FCostAmount := Value;
  end;
end;

procedure TCostGeneric.SetCostDate(Value: TDateTime);
begin
  if Value <> FCostDate then
  begin
    FCostDate := Value;
  end;
end;

procedure TCostGeneric.SetCostNote(Value: String);
begin
  if Value <> FCostNote then
  begin
    FCostNote := Value;
  end;
end;

procedure TCostGeneric.SetCostType(Value: ICostType);
begin
  if Value <> FCostType then
  begin
    FCostType := Value;
  end;
end;

procedure TCostGeneric.SetTravelID(Value: Integer);
begin
  if Value <> FTravelID then
  begin
    FTravelID := Value;
  end;
end;



// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================

{ TCostFuel }

constructor TCostFuel.Create(AID: Integer; ADescrizione: String;
  ATravelID: Integer; ACostType: ICostType; ACostDate: TDatetime;
  ACostAmount: Currency; ACostNote: String; ALiters, AKMTraveled: Double);
begin
   inherited Create(AID, ADescrizione, ATravelID, ACostType, ACostDate, ACostAmount, ACostNote);
   Liters := ALiters;
   KMTraveled := AKMTraveled;
end;

function TCostFuel.GetKMPerLiter: Double;
begin
  Result := 0;
  if FLiters = 0 then Exit;
  Result := SimpleRoundTo((FKMTraveled / FLiters), -1);
end;

function TCostFuel.GetKMTraveled: Double;
begin
  Result := FKMTraveled;
end;

function TCostFuel.GetListViewItem_DetailText: String;
begin
  inherited;
  Result := '';
  // Total amount
  if Self.CostAmount > 0
    then Result := CurrToStrF(Self.CostAmount, ffCurrency, 2);
  // TraveledKM
  if Self.KMTraveled > 0
    then Self.AddDetailText(Result, Self.KMTraveled.ToString + ' Km', '     ');
  // KM per Liter
  if Self.KMPerLiter > 0
    then Self.AddDetailText(Result, Self.KMPerLiter.ToString + ' Km/Lt', '     ');
end;

function TCostFuel.GetLiters: Double;
begin
  Result := FLiters;
end;

function TCostFuel.GetLiters100KM: Double;
begin
  Result := 0;
  if FKMTraveled = 0 then Exit;
  Result := SimpleRoundTo((100 * FLiters / FKMTraveled), -1);
end;

procedure TCostFuel.SetKMTraveled(Value: Double);
begin
  if Value < 0 then raise Exception.Create('Invalid "KMTraveled" value!');
  if Value <> FKMTraveled then
  begin
    FKMTraveled := Value;
  end;
end;

procedure TCostFuel.SetLiters(Value: Double);
begin
  if Value < 0 then raise Exception.Create('Invalid "Liters" value!');
  if Value <> FLiters then
  begin
    FLiters := Value;
  end;
end;



{ TCostFactory }

//class function TCostFactory.NewCost(AID: Integer; ADescrizione: String;
//  ATravelID: Integer; ACostTypeID:Integer; ACostDate: TDatetime;
//  ACostAmount: Currency; ACostNote: String; ALiters,
//  AKMTraveled: Double): TCostGeneric;
class function TCostFactory.NewCost(AID: Integer; ADescrizione: String;
  ATravelID: Integer; ACostType:ICostType; ACostDate: TDatetime;
  ACostAmount: Currency; ACostNote: String; ALiters,
  AKMTraveled: Double): TCostGeneric;
begin
  Result := nil;
  // Se è un costo di carburante...
  if ACostType.ObjectType = COST_OBJECT_TYPE_FUEL then
  begin
    Result := TCostFuel.Create(
                                 AID
                                ,ADescrizione
                                ,ATravelID
                                ,ACostType
                                ,ACostDate
                                ,ACostAmount
                                ,ACostNote
                                ,ALiters
                                ,AKMTraveled
    );
  end
  // Altrimenti se è un costo generico...
  else
  begin
    Result := TCostGeneric.Create(
                                 AID
                                ,ADescrizione
                                ,ATravelID
                                ,ACostType
                                ,ACostDate
                                ,ACostAmount
                                ,ACostNote
    );
  end;
end;


end.
