unit View.Customer.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, Model.Interfaces, uniBasicGrid, uniDBGrid, uniEdit, uniDBEdit, uniDBText;

type

  [diViewFor(ICustomer)]
  TViewCustomers = class(TViewBaseForList)
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterPhoneNumber: TStringField;
    BSMasterPagingCurrentPageOf: TStringField;
    GridCustomers: TUniDBGrid;
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    BSWhereCity: TStringField;
    ButtonPageDown: TUniSpeedButton;
    ButtonPageUp: TUniSpeedButton;
    DBTextPageOf: TUniDBText;
    acNextPage: TioViewAction;
    acPrevPage: TioViewAction;
    DBEditWhereID: TUniDBEdit;
    UniLabel2: TUniLabel;
    DBEditWhereName: TUniDBEdit;
    UniLabel3: TUniLabel;
    DBEditWhereCity: TUniDBEdit;
    UniLabel1: TUniLabel;
  private
  public
  end;

implementation

{$R *.dfm}

end.
