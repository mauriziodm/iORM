unit View.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet,
  Model.Interfaces, Vcl.DBCtrls;

type

  [diViewFor(ICustomer)]
  TViewCustomers = class(TViewBaseForList)
    GridCustomers: TDBGrid;
    MDSMasterID: TIntegerField;
    MDSMasterName: TStringField;
    MDSMasterPhoneNumber: TStringField;
    MDSMasterFullAddress: TStringField;
    MDSMasterPagingCurrentPageOf: TStringField;
    ButtonPageDown: TSpeedButton;
    ButtonPageUp: TSpeedButton;
    DBTextPageOf: TDBText;
    acNextPage: TioViewAction;
    acPrevPage: TioViewAction;
    Button1: TButton;
    acSetDataObject: TioViewAction;
    procedure GridCustomersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewCustomers.GridCustomersDblClick(Sender: TObject);
begin
  inherited;
  VMBridge.VMAction['acShowOrSelect'].Execute;
end;

end.
