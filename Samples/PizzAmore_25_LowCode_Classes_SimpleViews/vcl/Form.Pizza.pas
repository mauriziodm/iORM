unit Form.Pizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  Data.DB, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.ExtDlgs, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, Model.Pizza, Vcl.DBGrids, iORM.DB.DataSet.Detail, iORM.Where.Interfaces, iORM.DB.DataSet.Base, Vcl.Grids, Vcl.Mask;

type

  // Register the form into the dependency injection container as SimpleView for TPizza objects
  [diSimpleViewFor(TPizza)]
  TPizzaForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditID: TDBEdit;
    DBEditName: TDBEdit;
    DBEditPrice: TDBEdit;
    Label4: TLabel;
    DBImage: TDBImage;
    DSPizza: TioDataSetMaster;
    DSPizzaID: TIntegerField;
    DSPizzaName: TStringField;
    DSPizzaPrice: TCurrencyField;
    DSPizzaImage: TGraphicField;
    SourcePizza: TDataSource;
    ButtonLoadImage: TSpeedButton;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acLoadImage: TAction;
    OpenPictureDialog: TOpenPictureDialog;
    acBack: TioBSCloseQuery;
    ButtonETM: TSpeedButton;
    acShowETM: TioBSShowOrSelect;
    GridCustomers: TDBGrid;
    Label5: TLabel;
    DSIngredientRows: TioDataSetDetail;
    SourceIngredients: TDataSource;
    DSIngredientRowsIngredientName: TStringField;
    DSIngredientRowsIngredientUnitOfMeasure: TStringField;
    DSIngredientRowsQty: TFloatField;
    ButtonAddIngredient: TSpeedButton;
    ButtonDeleteIngredient: TSpeedButton;
    acShowIngredientSelector: TioBSShowOrSelect;
    acDeleteIngredientRow: TioBSDelete;
    procedure acLoadImageExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSIngredientsSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
  private
  public
  end;

implementation

uses
  Model.Ingredient, Model.Pizza.IngredientRow;

{$R *.dfm}

procedure TPizzaForm.acLoadImageExecute(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    DSPizza.Edit;
    DSPizza.CurrentAs<TPizza>.Image.LoadFromFile(OpenPictureDialog.FileName);
    DSPizza.Refresh(False);
  end;
end;

procedure TPizzaForm.DSIngredientsSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  ASelected := TPizzaIngredientRow.Create( ASelected as TIngredient, 0 );
end;

procedure TPizzaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
