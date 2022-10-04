unit VM.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Customer,
  iORM.MVVM.ViewModel;

type

  [diViewModelFor(TCustomer)]
  TVMCustomer = class(TVMBaseForForm)
    acNew: TioVMAction;
    procedure acNewExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMCustomer.acNewExecute(Sender: TObject);
var
  LCustomer: ICustomer;
begin
  inherited;
  LCustomer := TCustomer.Create;
  MPMaster.Open;
  MPMaster.SetDataObject(LCustomer);
//  MPMaster.Open;
end;

end.
