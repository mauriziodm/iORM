unit VM.Start;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel,
  VM.Interfaces, iORM.MVVM.VMAction;

type

  [diViewModelImplements(IVMStart)]
  TVMStart = class(TioViewModel, IVMStart)
    acShowCustomers: TioVMAction;
    acShowOrders: TioVMAction;
    acShowPizzas: TioVMAction;
    acQuit: TioVMActionBSCloseQuery;
    procedure acShowCustomersExecute(Sender: TObject);
    procedure acShowOrdersExecute(Sender: TObject);
    procedure acShowPizzasExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMStart.acShowCustomersExecute(Sender: TObject);
begin
  io.Show<IGenericCustomer>;
end;

procedure TVMStart.acShowOrdersExecute(Sender: TObject);
begin
  io.Show<IOrder>;
end;

procedure TVMStart.acShowPizzasExecute(Sender: TObject);
begin
  io.Show<IPizza>;
end;

end.
