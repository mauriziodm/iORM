unit VM.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  [diViewModelFor(ICustomer)]
  TVMCustomers = class(TVMBaseForList)
    acNextPage: TioVMActionBSNextPage;
    acPrevPage: TioVMActionBSPrevPage;
    procedure acAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Customer;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMCustomers.acAddExecute(Sender: TObject);
begin
  MPMaster.Persistence.Append( TCustomer.Create as ICustomer );
  inherited;
end;

end.
