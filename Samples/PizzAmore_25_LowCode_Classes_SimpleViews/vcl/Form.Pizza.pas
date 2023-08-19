unit Form.Pizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.ExtDlgs, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, Model.Pizza, Vcl.Grids, Vcl.DBGrids;

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
    DS_ETM: TioDataSetMaster;
    SourceETM: TDataSource;
    DS_ETMDateAndTime: TDateTimeField;
    GridCustomers: TDBGrid;
    Button1: TButton;
    procedure acLoadImageExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DSPizzaAfterOpen(DataSet: TDataSet);
  private
  public
  end;

implementation

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

procedure TPizzaForm.Button1Click(Sender: TObject);
begin
  DS_ETM.Open;
end;

procedure TPizzaForm.DSPizzaAfterOpen(DataSet: TDataSet);
begin
  DS_ETM.Open;
end;

procedure TPizzaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
