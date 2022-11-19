unit View.CustomerPrivate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Model.Customers;

type

  [diViewFor(TPrivateCustomer)]
  TViewCustomerPrivate = class(TViewBaseForForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditID: TDBEdit;
    DBEditFirstName: TDBEdit;
    DBEditPhone: TDBEdit;
    DBEditCity: TDBEdit;
    DBEditAddress: TDBEdit;
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterPhoneNumber: TStringField;
    BSMasterCity: TStringField;
    BSMasterAddress: TStringField;
    BSMasterLastName: TStringField;
    Label6: TLabel;
    DBEditLastName: TDBEdit;
    acDelete: TioViewAction;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
