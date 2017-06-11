unit Model.Process;

interface

uses
  Model.Interfaces, iORM.Attributes, Model.Base;

type

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IProcess)]
  TProcess = class(TBase, IProcess)
  private
    FCost: Currency;
    FTime: Integer;
  protected
    // Cost
    procedure SetCost(const AValue:Currency);
    function GetCost: Currency;
    // Time (minute)
    procedure SetTime(const AValue:Integer);
    function GetTime: Integer;
  public
    constructor Create(const ACode, ADescription, AUM: String; const ACost:Currency; const ATime:Integer); overload;
    property Cost:Currency read GetCost write SetCost;
    property Time:Integer read GetTime write SetTime;
  end;

implementation

{ TProcess }

constructor TProcess.Create(const ACode, ADescription, AUM: String;
  const ACost: Currency; const ATime: Integer);
begin
  inherited Create(ACode, ADescription, AUM);
  FCost := ACost;
  FTime := ATime;
end;

function TProcess.GetCost: Currency;
begin
  Result := FCost;
end;

function TProcess.GetTime: Integer;
begin
  Result := FTime;
end;

procedure TProcess.SetCost(const AValue: Currency);
begin
  FCost := AValue;
end;

procedure TProcess.SetTime(const AValue: Integer);
begin
  FTime := AValue;
end;

end.
