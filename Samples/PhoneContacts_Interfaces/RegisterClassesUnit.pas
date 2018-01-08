unit RegisterClassesUnit;

interface

type

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM, Model, Interfaces, iORM.LazyLoad.Generics.List, iORM.Containers.Interfaces, iORM.Containers.List,
  AnotherModel;

{ TDIClassRegister }

class procedure TDIClassRegister.RegisterClasses;
begin
  // TPhoneNumber
  io.di.RegisterClass<TPhoneNumber>.Implements<IPhoneNumber>.Execute;

  // TPerson and details
  io.di.RegisterClass<TPerson>.Implements<IPerson>.Execute;
  io.di.RegisterClass<TioList<IPhoneNumber>>.Implements<IioList<IPhoneNumber>>.Execute;

  // TAnotherPerson and details
  io.di.RegisterClass<TAnotherPerson>.Implements<IPerson>('Another').Execute;
  io.di.RegisterClass<TioInterfacedList<IPhoneNumber>>.Implements<IioList<IPhoneNumber>>('Another').Execute;

  // Others descendants
  io.di.RegisterClass<TEmployee>.Implements<IEmployee>.Execute;
  io.di.RegisterClass<TCustomer>.Implements<IPerson>('Customer').Execute;
  io.di.RegisterClass<TCustomer>.Implements<ICustomer>.Execute;
  io.di.RegisterClass<TVipCustomer>.Implements<IVipCustomer>.Execute;
end;

initialization

  TDIClassRegister.RegisterClasses;

end.
