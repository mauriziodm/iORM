unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.Abstraction.uniGUI;

type
  TUniServerModule = class(TUniGUIServerModule)
    SQLiteConn: TioSQLiteConnectionDef;
    ioUniGUI1: TioUniGUI;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
      const AScript, AWarnings: TStrings);
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
  UniGUIVars, Utils.SampleData;

procedure TUniServerModule.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
  const AScript, AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

initialization

RegisterServerModuleClass(TUniServerModule);

end.
