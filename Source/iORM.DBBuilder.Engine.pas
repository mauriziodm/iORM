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

    class function GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean = True; AAddForeignKeys: Boolean = True)
      : TioDBBuilderEngineResult; override;
    class function GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      AAddForeignKeys: Boolean = True): TioDBBuilderEngineResult; override;

    class procedure GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const AForce: Boolean = False); override;
    class procedure GenerateDB(const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True;
      const AForce: Boolean = False); override;
    class procedure GenerateDB(const AConnectionDefName: String; const AScript: TStrings); override;
    class procedure GenerateDB(const AScript: TStrings); override;
  end;

implementation

uses
  System.SysUtils, iORM.DBBuilder.Factory, iORM.DBBuilder.Schema, iORM;

{ TioDBBuilderEngine }

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean; const AForce: Boolean);
begin

end;

class procedure TioDBBuilderEngine.GenerateDB(const AAddIndexes: Boolean; const AAddForeignKeys: Boolean; const AForce: Boolean);
begin

end;

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AScript: TStrings);
begin
  io.StartTransaction(AConnectionDefName);
  try
  except
    io.RollbackTransaction(AConnectionDefName);
  end;
end;

class procedure TioDBBuilderEngine.GenerateDB(const AScript: TStrings);
begin

end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
  const AAddIndexes: Boolean; AAddForeignKeys: Boolean): TioDBBuilderEngineResult;
var
  LSchema: IioDBBuilderSchema;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  LSchema := TioDBBuilderFactory.NewSchema(ASqlScriptToFill, AConnectionDefName, AAddIndexes, AAddForeignKeys);
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(LSchema);
  TioDBBuilderFactory.NewDBAnalyzer(LSchema, LSqlGenerator).Analyze;
  TioDBBuilderFactory.NewStrategy(LSchema, LSqlGenerator).GenerateScript;
  Result := SchemaToEngineResult(LSchema);
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

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean; AAddForeignKeys: Boolean)
  : TioDBBuilderEngineResult;
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
