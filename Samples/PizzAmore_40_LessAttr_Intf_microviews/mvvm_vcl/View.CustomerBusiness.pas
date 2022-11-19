unit View.CustomerBusiness;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Model.Customers;

type

  [diViewFor(TBusinessCustomer)]
  TViewCustomerBusiness = class(TViewBaseForForm)
    BSMasterID: TIntegerField;
    BSMasterPhoneNumber: TStringField;
    BSMasterAddress: TStringField;
    BSMasterCity: TStringField;
    BSMasterBusinessName: TStringField;
    BSMasterVAT: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditID: TDBEdit;
    DBEditBusinessName: TDBEdit;
    DBEditPhone: TDBEdit;
    DBEditCity: TDBEdit;
    DBEditAddress: TDBEdit;
    Label6: TLabel;
    DBEditVAT: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCustomerBusiness: TViewCustomerBusiness;

implementation

{$R *.dfm}

end.
