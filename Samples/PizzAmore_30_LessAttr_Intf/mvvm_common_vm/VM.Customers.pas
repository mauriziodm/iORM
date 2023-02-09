unit VM.Customers;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  [diViewModelFor(ICustomer)]
  TVMCustomers = class(TVMBaseForList)
    acNextPage: TioVMActionBSNextPage;
    acPrevPage: TioVMActionBSPrevPage;
    acSetDataObject: TioVMAction;
    procedure acShowOrSelectExecute(Sender: TObject);
    procedure acSetDataObjectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Customer, System.Generics.Collections;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMCustomers.acSetDataObjectExecute(Sender: TObject);
var
  LList: TList<ICustomer>;
begin
  inherited;
  LList := TList<ICustomer>.Create;
  LList.Add(TCustomer.Create);
  LList[0].Name := 'Prova1';
  LList.Add(TCustomer.Create);
  LList[1].Name := 'Prova2';
  BSMaster.SetDataObject(LList);
end;

procedure TVMCustomers.acShowOrSelectExecute(Sender: TObject);
begin
  inherited;
  if Assigned(BSMaster.SelectorFor) then
    Close;
end;

end.
