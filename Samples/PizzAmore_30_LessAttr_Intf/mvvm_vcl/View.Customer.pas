unit View.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Model.Customer;

type

  [diViewFor(TCustomer)]
  TViewCustomer = class(TViewBaseForForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditID: TDBEdit;
    DBEditName: TDBEdit;
    DBEditPhone: TDBEdit;
    DBEditCity: TDBEdit;
    DBEditAddress: TDBEdit;
    MDSMasterID: TIntegerField;
    MDSMasterName: TStringField;
    MDSMasterPhoneNumber: TStringField;
    MDSMasterCity: TStringField;
    MDSMasterAddress: TStringField;
    Button1: TButton;
    acNew: TioViewAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
