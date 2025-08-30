unit VM.Customer.List;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces,
  iORM.MVVM.Interfaces;

type

  [diViewModelFor(ICustomer)]
  TVMCustomerList = class(TVMBaseForList)
    acNextPage: TioVMActionBSNextPage;
    acPrevPage: TioVMActionBSPrevPage;
    procedure acAddNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMCustomerList.acAddNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
begin
  NewInstance := io.Create<ICustomer>;
end;

end.
