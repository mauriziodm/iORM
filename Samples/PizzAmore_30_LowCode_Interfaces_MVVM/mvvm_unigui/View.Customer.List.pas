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
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    BSWhereCity: TStringField;
    acNextPage: TioViewAction;
    acPrevPage: TioViewAction;
  private
  public
  end;

implementation

{$R *.dfm}

end.
