unit ViewModel.Travels;

interface

uses
  iORM,
  System.Classes,
  Data.Bind.ObjectScope, ViewModel.Travels.Interfaces;

type

  TViewModelTravels = class(TInterfacedObject, IViewModelTravels)
  strict private
    FBindSourceAdapter: TBindSourceAdapter;
  strict protected

  public
    destructor Destroy;
    function GetBindSourceAdapter: TBindSourceAdapter;
  end;

implementation

uses
  Model.Travel;

{ TViewModelTravels }

destructor TViewModelTravels.Destroy;
begin
  if Assigned(FBindSourceAdapter) then FBindSourceAdapter.Free;
  inherited;
end;

function TViewModelTravels.GetBindSourceAdapter: TBindSourceAdapter;
begin
  if not Assigned(FBindSourceAdapter)
    then FBindSourceAdapter := io.Load(TTravel).ToActiveListBindSourceAdapter(nil);
  Result := FBindSourceAdapter;
end;

end.
