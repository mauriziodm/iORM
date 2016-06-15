unit RegisterClassesUnit;

interface

uses
  iORM.Containers.List, iORM.LazyLoad.Generics.List, M.Interfaces;

type

  TPersonsList = class(TioInterfacedList<IPerson>);
  TLazyLoadPhoneNumberList = class(TioList<IPhoneNumber>);
  TPhoneNumberList = class(TioInterfacedList<IPhoneNumber>);

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  System.Rtti, iORM, M.Model, M.AnotherModel, iORM.Containers.Interfaces, VM.Main, VM.Person,
  VM.Interfaces, V.Interfaces, V.Main, V.Person, V.Employee, V.Customer, V.VipCustomer;

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
  io.di.RegisterClass<TLazyLoadPhoneNumberList>.Implements<IioList<IPhoneNumber>>.Execute;
  io.di.RegisterClass<TPhoneNumberList>.Implements<IioList<IPhoneNumber>>.Alias('Another').Execute;

  // ViewModels
  io.di.RegisterClass<TViewModelMain>.Implements<IPersonsViewModel>.Execute;
  io.di.RegisterClass<TPersonViewModel>.Implements<IPersonViewModel>.DefaultConstructorParams([TValue.Empty]).Execute;

  // Views
  io.di.RegisterClass<TViewPerson>.Implements<IPersonView>('TPerson').DefaultConstructorParams([TValue.From<TViewMain>(ViewMain)]).Execute;
  io.di.RegisterClass<TViewPerson>.Implements<IPersonView>('TAnotherPerson').DefaultConstructorParams([TValue.From<TViewMain>(ViewMain)]).Execute;
  io.di.RegisterClass<TViewEmployee>.Implements<IPersonView>('TEmployee').DefaultConstructorParams([TValue.From<TViewMain>(ViewMain)]).Execute;
  io.di.RegisterClass<TViewCustomer>.Implements<IPersonView>('TCustomer').DefaultConstructorParams([TValue.From<TViewMain>(ViewMain)]).Execute;
  io.di.RegisterClass<TViewVipCustomer>.Implements<IPersonView>('TVipCustomer').DefaultConstructorParams([TValue.From<TViewMain>(ViewMain)]).Execute;
end;

var
  LDummy: String;

initialization

  TDIClassRegister.RegisterClasses;
end.
