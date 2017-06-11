unit Model.Material;

interface

uses
  Model.Interfaces, Model.Base, iORM.Attributes;

type

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IMaterial)]
  TMaterial = class(TBase, IMaterial)
  private
    FCost: Currency;
  protected
    // Cost
    procedure SetCost(const AValue:Currency);
    function GetCost: Currency;
  public
    constructor Create(const ACode, ADescription, AUM: String; const ACost:Currency); overload;
    property Cost:Currency read GetCost write SetCost;
  end;

implementation

{ TMaterial }

constructor TMaterial.Create(const ACode, ADescription, AUM: String;
  const ACost: Currency);
begin
  inherited Create(ACode, ADescription, AUM);
  FCost := ACost;
end;

function TMaterial.GetCost: Currency;
begin
  Result := FCost;
end;

procedure TMaterial.SetCost(const AValue: Currency);
begin
  FCost := AValue;
end;

end.
