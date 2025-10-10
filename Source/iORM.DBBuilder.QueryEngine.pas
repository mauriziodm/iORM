unit iORM.DBBuilder.QueryEngine;

interface

uses
  iORM.DB.Interfaces

  ;


type
  TioDBBuilderQueryEngine = class
  public
    class function NewQuery(AConnectionName: String): IioQuery;
    class function OpenQuery(AConnectionName: String; const ASQL: String): IioQuery; overload;
    class procedure ExecuteQuery(AConnectionName: String; const ASQL: String); overload;
    class procedure ExecuteQuery(const ASQL: String); overload;
  end;


implementation

uses
  System.SysUtils,

  iORM.DB.Factory

  ;


{ TioDBBuilderQueryEngine }

class procedure TioDBBuilderQueryEngine.ExecuteQuery(const ASQL: String);
begin
  ExecuteQuery(string.empty, ASQL);
end;

class procedure TioDBBuilderQueryEngine.ExecuteQuery(AConnectionName: String; const ASQL: String);
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery(AConnectionName);
  LQuery.SQL.Text := ASQL;
  LQuery.ExecSQL;
end;

class function TioDBBuilderQueryEngine.NewQuery(AConnectionName: String): IioQuery;
begin
  Result := TioDBFactory.Query(AConnectionName);
end;

class function TioDBBuilderQueryEngine.OpenQuery(AConnectionName: String; const ASQL: String): IioQuery;
begin
  Result := NewQuery(AConnectionName);
  Result.SQL.Text := ASQL;
  Result.Open;
end;

end.
