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
    acShowIngredients: TioVMActionBSShowOrSelect;
    acShowSynchroLog: TioVMActionBSShowOrSelect;
    acIOrmVersion: TioVMAction;
    procedure acIOrmVersionExecute(Sender: TObject);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMStart.acIOrmVersionExecute(Sender: TObject);
begin
  io.ShowMessage(io.Version);
end;

end.
