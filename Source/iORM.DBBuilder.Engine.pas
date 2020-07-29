unit iORM.DBBuilder.Engine;

interface

uses
  System.Classes, iORM.CommonTypes, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderEngine = class(TioDBBuilderEngineIntf)
  private
    class function SchemaToEngineResult(const ASchema: IioDBBuilderSchema): TioDBBuilderEngineResult;
  public
    class function GetDBStatus(const AConnectionDefName: String = IO_CONNECTIONDEF_DEFAULTNAME): TioDBBuilderEngineResult; override;

    class function GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const ARaiseIfWarningsExists: Boolean = False): TioDBBuilderEngineResult; override;
    class function GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const ARaiseIfWarningsExists: Boolean = False): TioDBBuilderEngineResult; override;

    class procedure GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const AForce: Boolean = False); override;
    class procedure GenerateDB(const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True;
      const AForce: Boolean = False); override;
    class procedure GenerateDB(const AConnectionDefName: String; const AScript: TStrings); override;
    class procedure GenerateDB(const AScript: TStrings); override;
  end;

implementation

uses
  System.SysUtils, iORM.DBBuilder.Factory, iORM.DBBuilder.Schema, iORM, iORM.Exceptions;

{ TioDBBuilderEngine }

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean; const AForce: Boolean);
var
  LScript: TStrings;
  LResult: TioDBBuilderEngineResult;
begin
  LScript := TStringList.Create;
  try
    LResult := GenerateScript(LScript, AConnectionDefName, AAddIndexes, AAddForeignKeys, True);
    if (LResult = dbUptodate) and not AForce then
      Exit;
    if LResult = dbWarningExists then
      raise EioException.Create(CLassName, 'GenerateDB', 'Database to be updated but WARNINGS exists');
    GenerateDB(AConnectionDefName, LScript);
  finally
    LScript.Free;
  end;
end;

class procedure TioDBBuilderEngine.GenerateDB(const AAddIndexes: Boolean; const AAddForeignKeys: Boolean; const AForce: Boolean);
begin
  GenerateDB('', AAddIndexes, AAddForeignKeys, AForce);
end;

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AScript: TStrings);
begin
  io.SQL(AScript, False).Connection(AConnectionDefName).DoNotTranslate.Execute;
end;

class procedure TioDBBuilderEngine.GenerateDB(const AScript: TStrings);
begin
  GenerateDB('', AScript);
end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
  const AAddIndexes: Boolean; const AAddForeignKeys: Boolean; const ARaiseIfWarningsExists: Boolean): TioDBBuilderEngineResult;
var
  LSchema: IioDBBuilderSchema;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  LSchema := TioDBBuilderFactory.NewSchema(ASqlScriptToFill, AConnectionDefName, AAddIndexes, AAddForeignKeys);
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(LSchema);
  TioDBBuilderFactory.NewDBAnalyzer(LSchema, LSqlGenerator).Analyze;

  Result := SchemaToEngineResult(LSchema);
  if (Result = dbWarningExists) and ARaiseIfWarningsExists then
    raise EioException.Create(CLassName, 'GenerateDB', 'Database to be updated but WARNINGS exists:'#13#13 + LSchema.Warnings.Text);

  TioDBBuilderFactory.NewStrategy(LSchema, LSqlGenerator).GenerateScript;
end;

class function TioDBBuilderEngine.GetDBStatus(const AConnectionDefName: String): TioDBBuilderEngineResult;
var
  LSchema: IioDBBuilderSchema;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  LSchema := TioDBBuilderFactory.NewSchema(nil, AConnectionDefName, False, False);
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(LSchema);
  TioDBBuilderFactory.NewDBAnalyzer(LSchema, LSqlGenerator).Analyze;
  Result := SchemaToEngineResult(LSchema);
end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean; const ARaiseIfWarningsExists: Boolean): TioDBBuilderEngineResult;
begin
  Result := GenerateScript(ASqlScriptToFill, '', AAddIndexes, AAddForeignKeys, ARaiseIfWarningsExists);
end;

class function TioDBBuilderEngine.SchemaToEngineResult(const ASchema: IioDBBuilderSchema): TioDBBuilderEngineResult;
begin
  if ASchema.WarningExists then
    Exit(dbWarningExists);
  case ASchema.Status of
    dbsAlter:
      Exit(dbUpdatesNeeded);
    dbsCreate:
      Exit(dbNotExists);
  else
    Exit(dbUptodate);
  end;
end;

end.
