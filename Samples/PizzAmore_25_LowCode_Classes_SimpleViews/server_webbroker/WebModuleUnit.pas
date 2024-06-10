unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, iORM.Http.WebBroker.Producer, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces,
  iORM.DB.ConnectionDef, iORM.Abstraction.VCL, iORM.SynchroStrategy.Interfaces, iORM.SynchroStrategy.Custom, iORM.SynchroStrategy.EtmBased;

type
  TWebModule2 = class(TWebModule)
    ioWebBrokerProducer1: TioWebBrokerProducer;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    FirebirdConn: TioFirebirdConnectionDef;
    ioEtmSynchroStrategy_Server1: TioEtmSynchroStrategy_Server;
    procedure WebModule2DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule2;

implementation

uses
  Utils.SampleData;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule2.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TWebModule2.WebModule2DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Eureka!!!';
end;

end.
