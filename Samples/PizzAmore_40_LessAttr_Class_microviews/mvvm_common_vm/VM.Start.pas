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

  [diImplements(IVMStart)]
  TVMStart = class(TioViewModel, IVMStart)
    acQuit: TioVMAction;
    acShowCustomers: TioVMAction;
    acShowOrders: TioVMAction;
    acShowPizzas: TioVMAction;
    procedure acQuitExecute(Sender: TObject);
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
  Model.Customer, Model.Order, Model.Pizza;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMStart.acQuitExecute(Sender: TObject);
begin
  io.TerminateApplication;
end;

procedure TVMStart.acShowCustomersExecute(Sender: TObject);
begin
  io.Show<TCustomer>;
end;

procedure TVMStart.acShowOrdersExecute(Sender: TObject);
begin
  io.Show<TOrder>;
end;

procedure TVMStart.acShowPizzasExecute(Sender: TObject);
begin
  io.Show<TPizza>;
end;

end.
