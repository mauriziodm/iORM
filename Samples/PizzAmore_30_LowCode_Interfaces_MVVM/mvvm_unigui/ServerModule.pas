unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.Abstraction.uniGUI, iORM.Abstraction;

type
  TUniServerModule = class(TUniGUIServerModule)
    SQLiteConn: TioSQLiteConnectionDef;
    ioUniGUI: TioUniGUI;
    procedure SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript, AWarnings: TStrings);
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
  UniGUIVars, Utils.SampleData, RegisterClasses;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

initialization

RegisterServerModuleClass(TUniServerModule);
TRegisterClasses.RegisterClasses; // Moved here from MainForm

end.
