unit MicroView.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl;

type

  TMicroViewCustomer = class(TFrame)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ButtonSelectCustomer: TSpeedButton;
    DBEditCustID: TDBEdit;
    DBEditCustName: TDBEdit;
    DBEditCustAddress: TDBEdit;
    DBECustPhone: TDBEdit;
    CustomerMicroVMBridge: TioViewModelBridge;
    MDSCustomer: TioModelDataSet;
    MDSCustomerID: TIntegerField;
    MDSCustomerName: TStringField;
    MDSCustomerFullAddress: TStringField;
    MDSCustomerPhoneNumber: TStringField;
    SourceCustomer: TDataSource;
    ActionList1: TActionList;
    acSelectCustomer: TioViewAction;
    ButtonViewCustomer: TSpeedButton;
    acShowCustomer: TioViewAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
