unit iORM.DBBuilder.Engine;

interface

uses
  System.Classes, iORM.CommonTypes, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderEngine = class(TioDBBuilderEngineIntf)
  private
    class procedure InternalGenerateScript(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
    class function SchemaToEngineResult(const ASchema: IioDBBuilderSchema): TioDBBuilderEngineResult;
  public
    class function DBExists(const AConnectionDefName: String): Boolean; override;
    class function DBNeedUpdate(const AConnectionDefName: String): Boolean; override;

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
  System.SysUtils, iORM.DBBuilder.Factory, iORM.DBBuilder.Schema;

{ TioDBBuilderEngine }

class function TioDBBuilderEngine.DBExists(const AConnectionDefName: String): Boolean;
begin

end;

class function TioDBBuilderEngine.DBNeedUpdate(const AConnectionDefName: String): Boolean;
begin

end;

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean; const AForce: Boolean);
begin

end;

class procedure TioDBBuilderEngine.GenerateDB(const AAddIndexes: Boolean; const AAddForeignKeys: Boolean; const AForce: Boolean);
begin

end;

class procedure TioDBBuilderEngine.GenerateDB(const AConnectionDefName: String; const AScript: TStrings);
begin

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
  InternalGenerateScript(LSchema, LSqlGenerator);
  Result := SchemaToEngineResult(LSchema);
end;

class procedure TioDBBuilderEngine.InternalGenerateScript(const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  // Get the DB analizer and analyze database, if need updates then
  // get the right strategy (dependent from the current RDBMS) and
  // generate the script
  TioDBBuilderFactory.NewDBAnalyzer(ASchema, ASqlGenerator).Analyze;
  if ASchema.Status > dbsClean then
    TioDBBuilderFactory.NewStrategy(ASchema, ASqlGenerator).GenerateScript;
end;

class function TioDBBuilderEngine.GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean; AAddForeignKeys: Boolean)
  : TioDBBuilderEngineResult;
begin
  Result := GenerateScript(ASqlScriptToFill, '', AAddIndexes, AAddForeignKeys);
end;

class function TioDBBuilderEngine.SchemaToEngineResult(const ASchema: IioDBBuilderSchema): TioDBBuilderEngineResult;
begin
  if ASchema.WarningExists then
    Exit(dbWarningExists)
  else if ASchema.Status > dbsClean then
    Exit(dbUpdatesNeeded)
  else
    Exit(dbUptodate);
end;

end.
