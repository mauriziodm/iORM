unit Model.Travel;

interface

uses
  Model.BaseConst, Model.BaseClasses, System.SysUtils, System.Generics.Collections,
  iORM.Attributes, Model.Travel.Interfaces;

type

  // Classe che rappresenta un viaggio
  [ioTable('TRAVELS')]
  TTravel = class(TBaseClass, ITravel)
  strict private
    FStartDate: TDatetime;
    FEndDate: TDatetime;
    FStartKM: Integer;
    FEndKM: Integer;
  strict protected
    function GetStartDate: TDateTime;
    procedure SetStartDate(Value: TDateTime);
    function GetEndDate: TDateTime;
    procedure SetEndDate(Value: TDateTime);
    function GetStartKM: Integer;
    procedure SetStartKM(Value: Integer);
    function GetEndKM: Integer;
    procedure SetEndKM(Value: Integer);
    function GetTraveledKM: Integer;
  public
    constructor Create(AID:Integer; ADescrizione:String; AStartDate:TDateTime; AStartKM: Integer); overload;
    constructor Create(AID:Integer; ADescrizione:String; AStartDate,AEndDate:TDateTime; AStartKM,AEndKM: Integer); overload;
    destructor Destroy; override;
    property StartDate:TDateTime read GetStartDate write SetStartDate;
    property EndDate:TDateTime read GetEndDate write SetEndDate;
    property StartKM:Integer read GetStartKM write SetStartKM;
    property EndKM:Integer read GetEndKM write SetEndKM;
    [ioSkip]
    property TraveledKM:Integer read GetTraveledKM;
  end;

implementation

{ TTravel }


constructor TTravel.Create(AID: Integer; ADescrizione: String;
  AStartDate: TDateTime; AStartKM: Integer);
begin
  inherited Create(AID, ADescrizione);
  StartDate := AStartDate;
  StartKM := AStartKM;
end;

constructor TTravel.Create(AID: Integer; ADescrizione: String; AStartDate,
  AEndDate: TDateTime; AStartKM, AEndKM: Integer);
begin
  inherited Create(AID, ADescrizione);
  StartDate := AStartDate;
  EndDate := AEndDate;
  StartKM := AStartKM;
  EndKM := AEndKM;
end;





destructor TTravel.Destroy;
begin

  inherited;
end;

{$REGION 'ITravel'}
function TTravel.GetStartDate: TDateTime;
begin
  Result := FStartDate;
end;

function TTravel.GetEndDate: TDateTime;
begin
  Result := FEndDate;
end;

function TTravel.GetStartKM: Integer;
begin
  Result := FStartKM;
end;

function TTravel.GetEndKM: Integer;
begin
  Result := FEndKM;
end;

function TTravel.GetTraveledKM: Integer;
begin
  if FEndKM > 0
    then Result := FEndKM - FStartKM
    else Result := 0;
end;

procedure TTravel.SetStartDate(Value: TDateTime);
begin
  if Value <> FStartDate then
  begin
    FStartDate := Value;
  end;
end;

procedure TTravel.SetEndDate(Value: TDateTime);
begin
//  if Value < FStartDate then raise Exception.Create('Invalid "EndDate" value!');
  if Value <> FEndDate then
  begin
    FEndDate := Value;
  end;
end;

procedure TTravel.SetStartKM(Value: Integer);
begin
  if ((FEndKM > 0) and (Value > FEndKM))
  or (Value < 0)
    then raise Exception.Create('Invalid StartKM!');
  if Value <> FStartKM then
  begin
    FStartKM := Value;
  end;
end;

procedure TTravel.SetEndKM(Value: Integer);
begin
  if ((Value > 0) and (Value < FStartKM))
  or (Value < 0)
    then raise Exception.Create('Invalid "EndKM" value!');
  if Value <> FEndKM then
  begin
    FEndKM := Value;
  end;
end;
{$ENDREGION}



end.
