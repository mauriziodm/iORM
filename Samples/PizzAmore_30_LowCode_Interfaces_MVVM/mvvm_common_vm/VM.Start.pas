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
    acQuit: TioVMActionBSCloseQuery;
    acShowOrders: TioVMActionBSShowOrSelect;
    acShowCustomers: TioVMActionBSShowOrSelect;
    acShowPizzas: TioVMActionBSShowOrSelect;
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
