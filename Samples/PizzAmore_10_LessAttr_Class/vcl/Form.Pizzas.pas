unit Form.Pizzas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl,
  Vcl.Mask, Model.Pizza;

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
    DSWhere: TioDataSetMaster;
    DSWhereID: TIntegerField;
    DSWhereName: TStringField;
    DSWhereFromPrice: TCurrencyField;
    DSWhereToPrice: TCurrencyField;
    SourceWhere: TDataSource;
    PanelWhere: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    Label4: TLabel;
    DBEditWhereID: TDBEdit;
    DBEditWhereName: TDBEdit;
    DBEditWhereFromPrice: TDBEdit;
    DBEditWhereToPrice: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonSelectClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// *** Note: the lines below have been deleted ***
//var
//  PizzasForm: TPizzasForm;

implementation

{$R *.dfm}

procedure TPizzasForm.ButtonAddClick(Sender: TObject);
begin
  DSPizzas.Persistence.Append;
  DSPizzas.ShowCurrent(nil);
end;

procedure TPizzasForm.ButtonBackClick(Sender: TObject);
begin
  Close;
end;

procedure TPizzasForm.ButtonClearClick(Sender: TObject);
begin
  DSWhere.ClearWhere(True);
end;

procedure TPizzasForm.ButtonDeleteClick(Sender: TObject);
begin
  DSPizzas.Persistence.Delete;
end;

procedure TPizzasForm.ButtonSearchClick(Sender: TObject);
begin
  DSWhere.BuildWhere(True);
end;

procedure TPizzasForm.ButtonSelectClick(Sender: TObject);
begin
  if Assigned(DSPizzas.SelectorFor) then
    DSPizzas.SelectCurrent
  else
    DSPizzas.ShowCurrent(nil);
end;

procedure TPizzasForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPizzasForm.FormCreate(Sender: TObject);
begin
  DSPizzas.Open;
  DSWhere.Open;
end;

end.
