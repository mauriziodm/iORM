unit uRegisterClasses;

interface

uses
  iORM.Containers.List,
  iORM.LazyLoad.Generics.List,
  iORM.Attributes,
  uInterfaces;

type

  TDIClassRegister = class
  public
    class procedure RegisterClasses;
  end;

implementation

uses
  System.Rtti,
  iORM,
  iORM.Containers.Interfaces,
  uModel;

{ TDIClassRegister }

class procedure TDIClassRegister.RegisterClasses;
begin
  // Classi
  io.di.RegisterClass<TUtente>.Implements<IUtente>.Execute;
  io.di.RegisterClass<TMagazzino>.Implements<IMagazzino>.Execute;
  io.di.RegisterClass<TSincroInfo>.Implements<ISincroInfo>.Execute;
  io.di.RegisterClass<TValuta>.Implements<IValuta>.Execute;
  io.di.RegisterClass<TTipoPagamento>.Implements<ITipoPagamento>.Execute;
  io.di.RegisterClass<TCodiceSconto>.Implements<ICodiceSconto>.Execute;
  io.di.RegisterClass<TTipoListino>.Implements<ITipoListino>.Execute;
  io.di.RegisterClass<TClasseOrdine>.Implements<IClasseOrdine>.Execute;
  io.di.RegisterClass<TAliquotaIva>.Implements<IAliquotaIva>.Execute;
  io.di.RegisterClass<TStagione>.Implements<IStagione>.Execute;
  io.di.RegisterClass<TTipoDocumento>.Implements<ITipoDocumento>.Execute;
  io.di.RegisterClass<TRaggruppamento>.Implements<IRaggruppamento>.Execute;
  io.di.RegisterClass<TCodiceSpesa>.Implements<ICodiceSpesa>.Execute;
  io.di.RegisterClass<TRipartizioneTaglia>.Implements<IRipartizioneTaglia>.Execute;
  io.di.RegisterClass<TArticolo>.Implements<IArticolo>.Execute;
  io.di.RegisterClass<TTaglia>.Implements<ITaglia>.Execute;
  io.di.RegisterClass<TCodiceABarre>.Implements<ICodiceABarre>.Execute;
  io.di.RegisterClass<TListinoVendita>.Implements<IListinoVendita>.Execute;
  io.di.RegisterClass<TSetTaglia>.Implements<ISetTaglia>.Execute;
  io.di.RegisterClass<TCliente>.Implements<ICliente>.Execute;
  io.di.RegisterClass<TTestataOrdine>.Implements<ITestataOrdine>.Execute;
  io.di.RegisterClass<TRigaOrdine>.Implements<IRigaOrdine>.Execute;
  io.di.RegisterClass<TConfigurazione>.Implements<IConfigurazione>.Execute;
  io.di.RegisterClass<TVersione>.Implements<IVersione>.Execute;
  io.di.RegisterClass<TNumeratore>.Implements<INumeratore>.Execute;
  io.di.RegisterClass<TGlobalKeyBoard>.Implements<IGlobalKeyBoard>.Execute;
  io.di.RegisterClass<TScontoClienteTestata>.Implements<IScontoClienteTestata>.Execute;
  io.di.RegisterClass<TScontoClienteRiga>.Implements<IScontoClienteRiga>.Execute;
end;


initialization
  TDIClassRegister.RegisterClasses;

end.
