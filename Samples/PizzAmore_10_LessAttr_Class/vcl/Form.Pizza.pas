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
    OpenPictureDialog: TOpenPictureDialog;
    procedure ButtonLoadImageClick(Sender: TObject);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonPersistClick(Sender: TObject);
    procedure ButtonRevertClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// *** Note: the lines below have been deleted ***
// var
// CustomerForm: TCustomerForm;

implementation

{$R *.dfm}

procedure TPizzaForm.ButtonBackClick(Sender: TObject);
begin
  Close;
end;

procedure TPizzaForm.ButtonLoadImageClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    DSPizza.Edit;
    DSPizza.CurrentAs<TPizza>.Image.LoadFromFile(OpenPictureDialog.FileName);
    DSPizza.Refresh;
  end;
end;

procedure TPizzaForm.ButtonPersistClick(Sender: TObject);
begin
  DSPizza.Persistence.Persist;
end;

procedure TPizzaForm.ButtonRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := DSPizza.Persistence.IsInserting;
  DSPizza.Persistence.RevertOrDelete;
  if LIsInserting then
    Close;
end;

procedure TPizzaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
