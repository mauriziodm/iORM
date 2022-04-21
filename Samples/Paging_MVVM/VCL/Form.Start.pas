unit Form.Start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, SampleData, System.Classes, System.Actions, iORM.MVVM.ViewContextProvider,
  iORM.DB.ConnectionDef, iORM.Abstraction.VCL, Vcl.Mask;

type
  TStartForm = class(TForm)
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    PanelTop: TPanel;
    EditItemsToBeCreated: TLabeledEdit;
    ButtonCreateItems: TSpeedButton;
    ScrollBoxClientArea: TScrollBox;
    ButtonShowViews: TSpeedButton;
    VCProvider: TioViewContextProvider;
    procedure ButtonCreateItemsClick(Sender: TObject);
    procedure VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure ButtonShowViewsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  Vcl.Dialogs, iORM, Model, iORM.MVVM.Interfaces;

{$R *.dfm}

procedure TStartForm.ButtonCreateItemsClick(Sender: TObject);
begin
  TSampleData.CreateSampleData(StrToInt(EditItemsToBeCreated.Text));
  ShowMessage('Operation completed successfully');
end;

procedure TStartForm.ButtonShowViewsClick(Sender: TObject);
var
  LViewModel: IioViewModel;
begin
  LViewModel := io.CreateViewModelFor<TArticle>;
  io.CreateViewFor<TArticle>('DatasetGrid', LViewModel);
  io.CreateViewFor<TArticle>('BindSourceGrid', LViewModel);
end;

procedure TStartForm.VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TControl).Align := alLeft;
end;

procedure TStartForm.VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := ScrollBoxClientArea;
end;

end.
