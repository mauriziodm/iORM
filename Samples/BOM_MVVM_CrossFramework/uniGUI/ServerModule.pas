unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, iORM.DB.Components.ConnectionDef;

type
  TUniServerModule = class(TUniGUIServerModule)
    SQLIteConn: TioSQLiteConnectionDef;
    procedure SQLIteConnAfterRegister(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, U.SampleData;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.SQLIteConnAfterRegister(Sender: TObject);
begin
  TSampleData.CheckForSampleData;
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
