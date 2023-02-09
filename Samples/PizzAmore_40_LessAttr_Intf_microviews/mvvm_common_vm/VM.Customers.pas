unit VM.Customers;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  [diViewModelFor(IGenericCustomer)]
  TVMCustomers = class(TVMBaseForList)
    acNextPage: TioVMActionBSNextPage;
    acPrevPage: TioVMActionBSPrevPage;
    procedure acShowOrSelectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Customers;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMCustomers.acShowOrSelectExecute(Sender: TObject);
begin
  inherited;
  if Assigned(BSMaster.SelectorFor) then
    acBack.Execute;
end;

end.
