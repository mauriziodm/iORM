unit Form.Ingredient.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.DBGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Master,
  Model.Ingredient;

type

  // Register the form into the dependency injection container as SimpleView for TIngredient objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single customer)
  [diSimpleViewFor(TIngredient, 'LIST')]
  TIngredientListForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    GridCustomers: TDBGrid;
    SourceIngredients: TDataSource;
    ActionList1: TActionList;
    acBack: TioBSCloseQuery;
    acShowOrSelect: TioBSShowOrSelect;
    acSelectCurrent: TioBSSelectCurrent;
    DSIngredients: TioDataSetMaster;
    DSIngredientsID: TIntegerField;
    DSIngredientsName: TStringField;
    DSIngredientsUnitOfMeasure: TStringField;
    acAppend: TioBSAppend;
    acDelete: TioBSDelete;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TIngredientListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TIngredientListForm.FormShow(Sender: TObject);
begin
  DSIngredients.Open;
end;

procedure TIngredientListForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
