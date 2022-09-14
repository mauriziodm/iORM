unit SV.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, Model.Customer;

type

  [diImplements(IInterface)]
  [diSimpleViewFor(TCustomer)]
  TCustomersSimpleView = class(TFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
