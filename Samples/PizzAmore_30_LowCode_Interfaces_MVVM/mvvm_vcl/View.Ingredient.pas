unit View.Ingredient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Model.Ingredient,
  iORM.Where.Interfaces, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Mask, Vcl.DBCtrls;

type

  [diViewFor(TIngredient)]
  TViewIngredient = class(TViewBaseForForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditID: TDBEdit;
    DBEditName: TDBEdit;
    DBEditUnitOfMeasure: TDBEdit;
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterUnitOfMeasure: TStringField;
  private
  public
  end;

implementation

{$R *.dfm}

end.
