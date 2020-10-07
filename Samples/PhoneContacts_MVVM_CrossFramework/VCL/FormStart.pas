unit FormStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  iORM.MVVM.Components.ViewContextProvider, iORM.DB.Components.ConnectionDef,
  Vcl.Menus, iORM.AbstractionLayer.Framework.VCL;

type
  TStartForm = class(TForm)
    ioVCL1: TioVCL;
    FormsVCProvider: TioViewContextProvider;
    SQLiteConn: TioSQLiteConnectionDef;
    procedure FormCreate(Sender: TObject);
    procedure FormsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure FormsVCProviderRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure SQLiteConnAfterRegister(Sender: TObject);
    procedure ioSQLiteConnectionDef1AfterCreateDB(Sender: TioCustomConnectionDef; AScript, AError: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  iORM, FormViewContext, SampleData, System.IOUtils, M.Interfaces;

{$R *.dfm}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  // Get the main view
  io.Show<IPerson>(Self, 'List');
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

procedure TStartForm.ioSQLiteConnectionDef1AfterCreateDB(Sender: TioCustomConnectionDef; AScript, AError: string);
var
  LScript: TStringList;
begin
  LScript := TStringList.Create;
  try
    LScript.Text := AScript;
    LScript.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'script.txt'));
  finally
    LScript.Free;
  end;
end;

procedure TStartForm.SQLiteConnAfterRegister(Sender: TObject);
begin
  TSampleData.CheckForSampleDataCreation;
end;

end.
