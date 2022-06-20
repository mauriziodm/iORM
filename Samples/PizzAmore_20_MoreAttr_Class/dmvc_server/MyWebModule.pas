unit MyWebModule;

interface

uses 
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  MVCFramework, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.Abstraction.VCL;

type
  TioDMVCServerTest = class(TWebModule)
    SQLiteConn: TioSQLiteConnectionDef;
    ioVCL1: TioVCL;
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
  private
    FMVC: TMVCEngine;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TioDMVCServerTest;

implementation

{$R *.dfm}

uses 
  MyController,
  System.IOUtils, 
  MVCFramework.Commons, 
  MVCFramework.Middleware.StaticFiles, 
  MVCFramework.Middleware.Compression, iORM.REST.DMVC.Controller,
  Utils.SampleData;

procedure TioDMVCServerTest.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TioDMVCServerTest.WebModuleCreate(Sender: TObject);
begin
  FMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      // session timeout (0 means session cookie)
      Config[TMVCConfigKey.SessionTimeout] := '0';
      //default content-type
      Config[TMVCConfigKey.DefaultContentType] := TMVCConstants.DEFAULT_CONTENT_TYPE;
      //default content charset
      Config[TMVCConfigKey.DefaultContentCharset] := TMVCConstants.DEFAULT_CONTENT_CHARSET;
      //unhandled actions are permitted?
      Config[TMVCConfigKey.AllowUnhandledAction] := 'false';
      //enables or not system controllers loading (available only from localhost requests)
      Config[TMVCConfigKey.LoadSystemControllers] := 'true';
      //default view file extension
      Config[TMVCConfigKey.DefaultViewFileExtension] := 'html';
      //view path
      Config[TMVCConfigKey.ViewPath] := 'templates';
      //Max Record Count for automatic Entities CRUD
      Config[TMVCConfigKey.MaxEntitiesRecordCount] := '20';
      //Enable Server Signature in response
      Config[TMVCConfigKey.ExposeServerSignature] := 'true';
      //Enable X-Powered-By Header in response
      Config[TMVCConfigKey.ExposeXPoweredBy] := 'true';
      // Max request size in bytes
      Config[TMVCConfigKey.MaxRequestSize] := IntToStr(TMVCConstants.DEFAULT_MAX_REQUEST_SIZE);
    end);
  FMVC.AddController(TMyController);
  FMVC.AddController(TioDMVCController); // iORM remoting controller

  // Enable the following middleware declaration if you want to
  // serve static files from this dmvcframework service.
  // The folder mapped as documentroot must exists!
  // FMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create( 
  //    '/static', 
  //    TPath.Combine(ExtractFilePath(GetModuleName(HInstance)), 'www')) 
  //  );	

  // To enable compression (deflate, gzip) just add this middleware as the last one 
  FMVC.AddMiddleware(TMVCCompressionMiddleware.Create);
end;

procedure TioDMVCServerTest.WebModuleDestroy(Sender: TObject);
begin
  FMVC.Free;
end;

end.
