unit RegisterClasses;

interface

type

  TRegisterClasses = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM, VM.Order.PizzaSel, Model.Order, VM.Pizza.List, Model.Interfaces;

{ TRegisterClasses }

class procedure TRegisterClasses.RegisterClasses;
begin
  // ViewModel for TOrder
  io.di.RegisterViewModelFor<TVMOrderPizzaSel, TOrder>.Execute;
  // ViewModel for IPizza (normal)
  io.di.RegisterViewModelFor<TVMPizzaList, IPizza>.Execute;
  // ViewModel for IPizza (embedded)
  io.di.RegisterViewModelFor<TVMPizzaList, IPizza>('EMBEDDED').FactoryMethod(
    function: TObject
    begin
      Result := TVMPizzaList.Create(nil);
      TVMPizzaList(Result).Embedded := True;
    end).Execute;

// ----- OLD CODE -----
//  io.di.RegisterViewModelFor<TVMPizzaList, IPizza>('EMBEDDED').InjectProperty('Embedded', True).Execute;
end;

end.
