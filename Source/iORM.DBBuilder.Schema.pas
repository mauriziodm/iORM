unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes;

type

  TioDBBuilderSchema = class(TInterfacedObject)
  private
    FSqlScript: TStringList;
    FTableList: TioDBBuilderSchemaTableList;
  public
    constructor Create;
    destructor Destroy; override;
    function SqlScript: TStringList;
    function TableList: TioDBBuilderSchemaTableList;
  end;

implementation

{ TioDBBuilderSchema }

constructor TioDBBuilderSchema.Create;
begin
  FSqlScript := TStringList.Create;
  FTableList := TioDBBuilderSchemaTableList.Create;
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FSqlScript.Free;
  FTableList.Free;
  inherited;
end;

function TioDBBuilderSchema.SqlScript: TStringList;
begin
  Result := FSqlScript;
end;

function TioDBBuilderSchema.TableList: TioDBBuilderSchemaTableList;
begin
  Result := FTableList;
end;

end.
