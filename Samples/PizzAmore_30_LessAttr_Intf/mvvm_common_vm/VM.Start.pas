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
//    FVM: IIoViewModel;
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMStart.acQuitExecute(Sender: TObject);
begin
  io.TerminateApplication;
end;

procedure TVMStart.acShowCustomersExecute(Sender: TObject);
begin
  io.Show<ICustomer>;

//  FVM.VMAction['acBack'].Execute;
//  io.Show<ICustomer>;

end;

procedure TVMStart.acShowOrdersExecute(Sender: TObject);
begin
  io.Show<IOrder>;
end;

procedure TVMStart.acShowPizzasExecute(Sender: TObject);
begin
  io.Show<IPizza>;

//  FVM := io.CreateViewModelFor<IPizza>;
//  io.CreateViewFor<IPizza>(FVM)

end;

end.
