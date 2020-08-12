unit iORM.DB.DBBuilder.Custom.SqlGenerator;

interface

uses
  System.SysUtils,
  System.TypInfo,
  System.Rtti,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.DB.DBBuilder.Interfaces,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  Data.DB;

type
  TioDBBuilderCustomSqlGenerator = class(TInterfacedObject)
  private
    FConnectionDefName: string;
  protected
    function GetQuery: IioQuery;
    function GetConnectionDefName: string;
  public
    constructor Create(AConnectionDefName: string);
  end;

implementation

{ TioDBBuilderCustomSqlGenerator }

constructor TioDBBuilderCustomSqlGenerator.Create(AConnectionDefName: string);
begin
  FConnectionDefName := AConnectionDefName;
end;

function TioDBBuilderCustomSqlGenerator.GetConnectionDefName: string;
begin
  Result := FConnectionDefName;
end;

function TioDBBuilderCustomSqlGenerator.GetQuery: IioQuery;
begin
  Result := io.GlobalFactory.DBFactory.Query(FConnectionDefName);
end;

end.
