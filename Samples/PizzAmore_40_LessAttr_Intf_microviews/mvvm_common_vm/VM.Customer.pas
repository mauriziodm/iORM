unit VM.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Customers;

type

  [diViewModelFor(TPrivateCustomer), diViewModelFor(TBusinessCustomer)]
  TVMCustomer = class(TVMBaseForForm)
    acDelete: TioVMAction;
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TVMCustomer.acDeleteExecute(Sender: TObject);
begin
  inherited;
  MPMaster.Delete;
  CloseViews;
end;

end.
