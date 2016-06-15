unit GlobalFactory;

interface

uses
  ViewModel.Travels, View.Travels, System.Classes, Model.Factory, View.Factory;

type

  TGlobalFactory = class
  public
    class function GetTravelsViewModel: TViewModelTravels;
    class function GetTravelsView(AOwner: TComponent): TViewTravels;
    class function Model: TModelFactoryClassRef;
    class function View: TViewFactoryRef;
  end;

implementation

{ TGlobalFactory }

class function TGlobalFactory.GetTravelsView(AOwner: TComponent): TViewTravels;
begin
  Result := TViewTravels.Create(AOwner);
end;

class function TGlobalFactory.GetTravelsViewModel: TViewModelTravels;
begin
  Result := TViewModelTravels.Create;
end;

class function TGlobalFactory.Model: TModelFactoryClassRef;
begin
  Result := TModelFactory;
end;

class function TGlobalFactory.View: TViewFactoryRef;
begin
  Result := TViewFactory;
end;

end.
