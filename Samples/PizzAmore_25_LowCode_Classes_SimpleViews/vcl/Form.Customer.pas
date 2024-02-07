unit Form.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList,
  Model.Customer, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type

  // Register the form into the dependency injection container as SimpleView for TCustomer objects
  [diSimpleViewFor(TCustomer)]
  TCustomerForm = class(TForm)
    DSCustomer: TioDataSetMaster;
    DSCustomerID: TIntegerField;
    DSCustomerName: TStringField;
    DSCustomerPhoneNumber: TStringField;
    SourceCustomer: TDataSource;
    DSCustomerCity: TStringField;
    DSCustomerAddress: TStringField;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acBack: TioBSCloseQuery;
    DBEditAddress: TDBEdit;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    Label5: TLabel;
    DBEditCity: TDBEdit;
    Label4: TLabel;
    DBEditPhone: TDBEdit;
    Label3: TLabel;
    DBEditName: TDBEdit;
    Label2: TLabel;
    DBEditID: TDBEdit;
    Label1: TLabel;
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelETM: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GridCustomers: TDBGrid;
    TabSheet2: TTabSheet;
    DiffMemo: TDBMemo;
    SourceETM: TDataSource;
    DS_ETM: TioDataSetMaster;
    DS_ETMDateAndTime: TDateTimeField;
    DS_ETMEntityClassName: TStringField;
    DS_ETMEntityID: TIntegerField;
    DS_ETMSmartEntityVersion: TStringField;
    DS_ETMSmartUser: TStringField;
    DS_ETMSmartEventType: TStringField;
    DS_ETMDiffOneWay: TStringField;
    ButtonRevertToVersion: TButton;
    acEtmRevertToVersion: TioBS_ETM_RevertToBindSource;
    DS_ETMDiffTwoWay: TStringField;
    DS_ETMDiffOnewayMoreInfo: TStringField;
    DS_ETMDiffTwowayMoreInfo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
