unit iORM.DBBuilder.SqlGenerator.SqLite;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base;

type

  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase)
  public
    procedure CheckIfDatabaseExists;
    procedure CreateDatabase;
  end;

implementation

uses
  System.SysUtils, iORM.DB.Interfaces;

{ TioDBBuilderSqlGenSQLite }

procedure TioDBBuilderSqlGenSQLite.CreateDatabase;
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery;
  LQuery.SQL.Add('SELECT 1=1');
  LQuery.Open;
  LQuery.Close;
end;

procedure TioDBBuilderSqlGenSQLite.CheckIfDatabaseExists;
begin
  FSchema.DBExists := FileExists(FSchema.DatabaseFileName);
end;

end.
