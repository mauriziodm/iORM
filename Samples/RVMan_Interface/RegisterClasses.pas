unit RegisterClasses;

interface

type

  TClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  iORM, Model.CostType.Interfaces, Model.CostType, Model.CostTypeWithCostList, Model.CostTypeWithCostList.Interfaces,
  Model.Cost, Model.Cost.Interfaces, Model.Travel, Model.Travel.Interfaces, Model.TravelWithCostTypeList,
  iORM.Containers.List, iORM.Containers.Interfaces, iORM.LazyLoad.Generics.List;

{ TClassRegister }

class procedure TClassRegister.RegisterClasses;
begin
  io.di.RegisterClass<TCostType>.Implements<ICostType>.Execute;
  io.di.RegisterClass<TCostTypeWithCostList>.Implements<ICostTypeWithCostList>.Execute;

  io.di.RegisterClass<TCostGeneric>.Implements<ICostGeneric>.Execute;
  io.di.RegisterClass<TCostFuel>.Implements<ICostFuel>.Execute;

  io.di.RegisterClass<TTravel>.Implements<ITravel>.Execute;
  io.di.RegisterClass<TTravelWithCostTypeList>.Implements<ITravelWithCostTypeList>.Execute;

  io.di.RegisterClass<TioList<ICostTypeWithCostList>>.Implements<IioList<ICostTypeWithCostList>>.Execute;
  io.di.RegisterClass<TioInterfacedList<ICostGeneric>>.Implements<IioList<ICostGeneric>>.Execute;
end;


initialization

  TClassRegister.RegisterClasses;

end.
