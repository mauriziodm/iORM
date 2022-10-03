unit Form.Pizzas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl,
  Model.Pizza;

type

  [diSimpleViewFor(TPizza, 'LIST')]
  TPizzasForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DBImage: TDBImage;
    DBTextName: TDBText;
    DBTextPrice: TDBText;
    DSPizzas: TioDataSetMaster;
    SourcePizzas: TDataSource;
    DSPizzasName: TStringField;
    DSPizzasPrice: TCurrencyField;
    DSPizzasImage: TGraphicField;
    ActionList1: TActionList;
    acDelete: TioBSPersistenceDelete;
    acBack: TAction;
    acAdd: TAction;
    acShow: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PizzasForm: TPizzasForm;

implementation

uses
  Form.Pizza;

{$R *.dfm}

procedure TPizzasForm.acAddExecute(Sender: TObject);
begin
  DSPizzas.DisableControls;
  DSPizzas.Persistence.Append;
  DSPizzas.EnableControls;
  acShow.Execute;
end;

procedure TPizzasForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TPizzasForm.acShowExecute(Sender: TObject);
begin
    Application.CreateForm(TPizzaForm, PizzaForm);
    PizzaForm.DSPizza.SourceBS := DSPizzas;
    PizzaForm.Show;
end;

procedure TPizzasForm.DBCtrlGrid1DblClick(Sender: TObject);
begin
  acShow.Execute;
end;

procedure TPizzasForm.FormCreate(Sender: TObject);
begin
  DSPizzas.Open;
end;

end.
