unit iORM.DBBuilder.Engine;

interface

uses
  System.Classes, iORM.CommonTypes, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderEngine = class(TioDBBuilderEngineIntf)
  private
    class function SchemaToEngineResult(const ASchema: IioDBBuilderSchema): TioDBBuilderEngineResult;
    class function InternalGenerateDB(const AConnectionDefName: String; ASqlScript: TStrings;
      const AAddIndexes, AAddForeignKeys, AGenerateScript, AGenerateDB, AForce: Boolean): TioDBBuilderEngineResult;
  public
    class function GetDBStatus(const AConnectionDefName: String = IO_CONNECTIONDEF_DEFAULTNAME): TioDBBuilderEngineResult; override;

    class function GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True): TioDBBuilderEngineResult; override;
    class function GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True): TioDBBuilderEngineResult; override;

    class procedure GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const AForce: Boolean = False); override;
    class procedure GenerateDB(const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True;
      const AForce: Boolean = False); override;
    class procedure GenerateDB(const AConnectionDefName: String; const AScript: TStrings); override;
    class procedure GenerateDB(const AScript: TStrings); override;
  end;

implementation

uses
  System.SysUtils, iORM.DBBuilder.Factory, iORM.DBBuilder.Schema, iORM.Exceptions, iORM.DB.Factory;

{ TioDBBuilderEngine }

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean; const AForce: Boolean);
var
  LScript: TStrings;
begin
  LScript := TStringList.Create;
  try
    InternalGenerateDB(AConnectionDefName, LScript, AAddIndexes, AAddForeignKeys, True, True, AForce);
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
  InternalGenerateDB(AConnectionDefName, AScript, False, False, False, True, True);
end;

class procedure TioDBBuilderEngine.GenerateDB(const AScript: TStrings);
begin
  GenerateDB('', AScript);
end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
  const AAddIndexes: Boolean; const AAddForeignKeys: Boolean): TioDBBuilderEngineResult;
begin
  Result := InternalGenerateDB(AConnectionDefName, ASqlScriptToFill, AAddIndexes, AAddForeignKeys, True, False, False);
end;

class function TioDBBuilderEngine.GetDBStatus(const AConnectionDefName: String): TioDBBuilderEngineResult;
begin
  Result := InternalGenerateDB(AConnectionDefName, nil, True, True, False, False, False);
end;

class function TioDBBuilderEngine.InternalGenerateDB(const AConnectionDefName: String; ASqlScript: TStrings;
  const AAddIndexes, AAddForeignKeys, AGenerateScript, AGenerateDB, AForce: Boolean): TioDBBuilderEngineResult;
var
  LSchema: IioDBBuilderSchema;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  // Create Schema & SqlGenerator instances
  LSchema := TioDBBuilderFactory.NewSchema(ASqlScript, AConnectionDefName, AAddIndexes, AAddForeignKeys);
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(LSchema);
  // Create analyzer & analize then database
  TioDBBuilderFactory.NewDBAnalyzer(LSchema, LSqlGenerator).Analyze;
  Result := SchemaToEngineResult(LSchema);
  // Generate script (if enabled)
  if AGenerateScript then
    TioDBBuilderFactory.NewStrategy(LSchema, LSqlGenerator).GenerateScript;
  // Generate DB (if needed or force request)
  if AGenerateDB and ((Result > dbUptodate) or AForce) then
  begin
    if Result = dbWarningExists then
      raise EioException.Create(CLassName, 'GenerateDB', 'Database to be updated but WARNINGS exists');
    if Result = dbNotExists then
      LSqlGenerator.CreateDatabase;
    TioDBFactory.Script(AConnectionDefName, LSchema.SqlScript).Execute;
  end;
end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean): TioDBBuilderEngineResult;
begin
  Result := GenerateScript(ASqlScriptToFill, '', AAddIndexes, AAddForeignKeys);
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
