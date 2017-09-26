unit FormStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  iORM.MVVM.Components.ViewContextProvider, iORM.DB.Components.ConnectionDef,
  Vcl.Menus;

type
  TStartForm = class(TForm)
    SQLiteConn: TioSQLiteConnectionDef;
    FormsVCProvider: TioViewContextProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure FormsVCProviderRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  iORM, V.Interfaces, VM.Interfaces, FormViewContext;

{$R *.dfm}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  // Get the main view
  io.di.LocateViewVM<IMainView, IPersonsViewModel>.SetViewContext(Self).Show;
end;

procedure TStartForm.FormsVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

procedure TStartForm.FormsVCProviderRelease(const Sender: TObject; const AView,
  AViewContext: TComponent);
begin
  AViewContext.Free;
end;

end.
