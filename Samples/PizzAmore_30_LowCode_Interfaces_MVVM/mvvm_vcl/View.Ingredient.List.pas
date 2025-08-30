unit View.Ingredient.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Interfaces, Vcl.Mask, Vcl.DBCtrls;

type

  [diViewFor(IIngredient)]
  TViewIngredientList = class(TViewBaseForList)
    GridCustomers: TDBGrid;
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterUnitOfMeasure: TStringField;
    Label1: TLabel;
    DBEditWhereID: TDBEdit;
    Label2: TLabel;
    DBEditWhereName: TDBEdit;
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TViewIngredientList.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
