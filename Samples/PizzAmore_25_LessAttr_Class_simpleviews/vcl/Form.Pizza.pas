unit Form.Pizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.ExtDlgs, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, Model.Pizza;

type

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
    acRevert: TioBSPersistenceRevertOrDelete;
    acLoadImage: TAction;
    OpenPictureDialog: TOpenPictureDialog;
    acBack: TioBSCloseQuery;
    procedure acBackExecute(Sender: TObject);
    procedure acLoadImageExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PizzaForm: TPizzaForm;

implementation

{$R *.dfm}

procedure TPizzaForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TPizzaForm.acLoadImageExecute(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    DSPizza.Edit;
    DSPizza.CurrentAs<TPizza>.Image.LoadFromFile(OpenPictureDialog.FileName);
    DSPizza.Refresh(False);
  end;
end;

procedure TPizzaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
