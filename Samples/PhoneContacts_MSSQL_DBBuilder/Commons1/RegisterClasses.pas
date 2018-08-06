unit RegisterClasses;

interface

type

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM,
  iORM.LazyLoad.Generics.List,
  iORM.Containers.Interfaces,
  iORM.Containers.List,
  BusinessObject.Model,
  BusinessObject.Model.Interfaces;

{ TDIClassRegister }

class procedure TDIClassRegister.RegisterClasses;
begin
  // TPhoneNumber
  io.di.RegisterClass<TPhoneNumber>.Implements<IPhoneNumber>.Execute;

  // TPerson and details
  io.di.RegisterClass<TPerson>.Implements<IPerson>.Execute;
  io.di.RegisterClass<TioList<IPhoneNumber>>.Implements<IioList<IPhoneNumber>>.Execute;

  // Others descendants
  io.di.RegisterClass<TEmployee>.Implements<IEmployee>.Execute;
  io.di.RegisterClass<TCustomer>.Implements<IPerson>('Customer').Execute;
  io.di.RegisterClass<TCustomer>.Implements<ICustomer>.Execute;
  io.di.RegisterClass<TVipCustomer>.Implements<IVipCustomer>.Execute;
end;

initialization

  TDIClassRegister.RegisterClasses;

end.
