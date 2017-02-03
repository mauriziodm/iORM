unit RegisterClassesUnit;

interface

uses
  iORM.Containers.List, iORM.LazyLoad.Generics.List, M.Interfaces, iORM.Attributes;

type

  TPersonsList = class(TioInterfacedList<IPerson>);

  [diImplemets()]
  TLazyLoadPhoneNumberList = class(TioList<IPhoneNumber>);

  TPhoneNumberList = class(TioInterfacedList<IPhoneNumber>);

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  System.Rtti, iORM, M.Model, M.AnotherModel, iORM.Containers.Interfaces;

{ TDIClassRegister }

class procedure TDIClassRegister.RegisterClasses;
begin
  // Persons
  io.di.RegisterClass<TPerson>.Implements<IPerson>.Execute;
  io.di.RegisterClass<TEmployee>.Implements<IEmployee>.Execute;
  io.di.RegisterClass<TCustomer>.Implements<ICustomer>.Execute;
  io.di.RegisterClass<TVipCustomer>.Implements<IVipCustomer>.Execute;
  io.di.RegisterClass<TAnotherPerson>.Implements<IPerson>.Alias('Another').Execute;

  // TPhoneNumber
  io.di.RegisterClass<TPhoneNumber>.Implements<IPhoneNumber>.Execute;

  // Details containers
  io.di.RegisterClass<TioList<IPhoneNumber>>.Implements<IioList<IPhoneNumber>>.Execute;
  io.di.RegisterClass<TPhoneNumberList>.Implements<IioList<IPhoneNumber>>.Alias('Another').Execute;
end;


initialization

  TDIClassRegister.RegisterClasses;
end.
