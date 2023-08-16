unit View.Customer.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet,
  Model.Interfaces, Vcl.DBCtrls, Vcl.Mask;

type

  [diViewFor(ICustomer)]
  TViewCustomerList = class(TViewBaseForList)
    GridCustomers: TDBGrid;
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterPhoneNumber: TStringField;
    BSMasterFullAddress: TStringField;
    BSMasterPagingCurrentPageOf: TStringField;
    ButtonPageDown: TSpeedButton;
    ButtonPageUp: TSpeedButton;
    DBTextPageOf: TDBText;
    acNextPage: TioViewAction;
    acPrevPage: TioViewAction;
    Label1: TLabel;
    DBEditWhereID: TDBEdit;
    Label2: TLabel;
    DBEditWhereName: TDBEdit;
    Label3: TLabel;
    DBEditWhereCity: TDBEdit;
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    BSWhereCity: TStringField;
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TViewCustomerList.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
