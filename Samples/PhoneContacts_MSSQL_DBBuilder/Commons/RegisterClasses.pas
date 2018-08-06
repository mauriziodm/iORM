unit RegisterClasses;

interface

type

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  System.Classes,
  iORM,
  iORM.LazyLoad.Generics.List,
  iORM.Containers.Interfaces,
  iORM.Containers.List,
  BusinessObjects.Interfaces, BusinessObjects.Base,
  BusinessObjects.Base.Interfaces;

{ TDIClassRegister }

class procedure TDIClassRegister.RegisterClasses;
begin

  // singleton
  io.di.RegisterClass<TSingletonString>.Implements<ISingletonString>.Alias('JWTToken').AsSingleton.Execute;
  io.di.RegisterClass<TSingletonString>.Implements<ISingletonString>.Alias('Role').AsSingleton.Execute;

  // Lists
  io.di.RegisterClass < TioList < IProcessingCycle >>.Implements < IioList < IProcessingCycle >>.Alias('PROCESSING_CYCLES').Execute;
  io.di.RegisterClass < TioList < IProcessingCycle >>.Implements < IioList < IProcessingCycle >>.Alias('PROCESSING_CYCLES_WORKS').Execute;
  io.di.RegisterClass < TioList < ITreatment >>.Implements < IioList < ITreatment >>.Execute;
  io.di.RegisterClass < TioList < IProdItem >>.Implements < IioList < IProdItem >>.Execute;
  io.di.RegisterClass < TioList < ICommessaGestionale >>.Implements < IioList < ICommessaGestionale >>.Execute;
  io.di.RegisterClass < TioList < ICommessaUT >>.Implements < IioList < ICommessaUT >>.Execute;
end;

initialization

TDIClassRegister.RegisterClasses;

end.
