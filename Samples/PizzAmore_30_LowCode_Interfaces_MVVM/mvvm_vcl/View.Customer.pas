unit View.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Model.Customer, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

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
    PanelETM: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GridCustomers: TDBGrid;
    TabSheet2: TTabSheet;
    DiffMemo: TDBMemo;
    BS_ETM: TioModelDataSet;
    SourceETM: TDataSource;
    ButtonRevertToVersion: TButton;
    BS_ETMDateAndTime: TDateTimeField;
    BS_ETMEntityClassName: TStringField;
    BS_ETMEntityID: TIntegerField;
    BS_ETMSmartEntityVersion: TStringField;
    BS_ETMSmartUser: TStringField;
    BS_ETMSmartEventType: TStringField;
    BS_ETMDiffOneWay: TStringField;
    acEtmRevertToVersion: TioViewAction;
  private
  public
  end;

implementation

{$R *.dfm}

end.
