unit Form.Ingredient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, iORM.StdActions.Vcl, Vcl.ActnList, System.Actions, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master,
  Model.Ingredient;

type

  // Register the form into the dependency injection container as SimpleView for TIngredient objects
  [diSimpleViewFor(TIngredient)]
  TIngredientForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    ButtonETM: TSpeedButton;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    Label1: TLabel;
    DBEditID: TDBEdit;
    Label2: TLabel;
    DBEditName: TDBEdit;
    Label3: TLabel;
    DBEditUnitOfMeasure: TDBEdit;
    DSIngredient: TioDataSetMaster;
    DSIngredientID: TIntegerField;
    DSIngredientName: TStringField;
    SourceIngredient: TDataSource;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acLoadImage: TAction;
    acBack: TioBSCloseQuery;
    acShowETM: TioBSShowOrSelect;
    DSIngredientUnitOfMeasure: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TIngredientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
