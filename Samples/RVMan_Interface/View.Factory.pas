unit View.Factory;

interface

uses
  View.CostGeneric, System.Classes;

type

  TViewFactoryRef = class of TViewFactory;

  TViewFactory = class
  public
    class function CostView(AOwner: TComponent; ACost: TObject; ViewMode:TViewMode=VMNormal)
      : TViewCostGeneric;
  end;

implementation

uses
  Model.BaseConst, View.CostFuel, Model.Cost;

{ TViewFactory }

class function TViewFactory.CostView(AOwner: TComponent; ACost: TObject; ViewMode:TViewMode)
  : TViewCostGeneric;
begin
  case (ACost as TCostGeneric).CostType.ObjectType of
    COST_OBJECT_TYPE_FUEL:
      Result := TViewCostFuel.Create(AOwner, ViewMode);
  else
    Result := TViewCostGeneric.Create(AOwner, ViewMode);
  end;
end;

end.
