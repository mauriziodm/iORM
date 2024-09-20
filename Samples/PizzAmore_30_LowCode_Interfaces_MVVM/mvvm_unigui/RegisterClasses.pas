unit RegisterClasses;

interface

type

  TRegisterClasses = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM, VM.Order, VM.Order.PizzaSel, Model.Order, VM.Pizza.List, Model.Interfaces;

{ TRegisterClasses }

class procedure TRegisterClasses.RegisterClasses;
begin
  // ViewModel for TOrder
  io.di.RegisterViewModelFor<TVMOrder, TOrder>.Execute;
  // ViewModel for IPizza (embedded or not)
  io.di.RegisterViewModelFor<TVMPizzaList, IPizza>.Execute;
end;

end.
