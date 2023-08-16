unit RegisterClasses;

interface

type

  TRegisterClasses = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM, VM.Order, Model.Order, VM.Pizzas, Model.Interfaces;

{ TRegisterClasses }

class procedure TRegisterClasses.RegisterClasses;
begin
  // ViewModel for TOrder
  io.di.RegisterClass<TVMOrder>.AsViewModelFor<TOrder>.Execute;
  // ViewModel for IPizza (embedded or not)
  io.di.RegisterClass<TVMPizzas>.AsViewModelFor<IPizza>.Execute;
end;

end.
