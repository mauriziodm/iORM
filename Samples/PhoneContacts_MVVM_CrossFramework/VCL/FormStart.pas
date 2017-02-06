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
    procedure Exit1Click(Sender: TObject);
    procedure FormsVCProviderioOnRequest(const Sender: TObject;
      const AView: TComponent; out ResultViewContext: TComponent);
    procedure FormsVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
  private
    { Private declarations }
    FStartUp: Boolean;
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  iORM, V.Interfaces, VM.Interfaces, FormViewContext;

{$R *.dfm}

procedure TStartForm.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TStartForm.FormCreate(Sender: TObject);
begin

  // Get the main view
  FStartUp := True;
  io.di.LocateView<IMainView, IPersonsViewModel>.Get;
  FStartUp := False;
end;

procedure TStartForm.FormsVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.FormsVCProviderioOnRequest(const Sender: TObject;
  const AView: TComponent; out ResultViewContext: TComponent);
begin
  if FStartUp then
    ResultViewContext := Self
  else
    ResultViewContext := TViewContextForm.Create(Self);
end;

end.
