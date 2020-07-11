unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject)
  strict private
    FFieldList: TioDBBuilderSchemaFieldList;
    FFKList: TioDBBuilderSchemaFKList;
    FTable: IioContextTable;
  public
    constructor Create(const ATable: IioContextTable);
    destructor Destroy; override;
    function FieldList: TioDBBuilderSchemaFieldList;
    function FKList: TioDBBuilderSchemaFKList;
//    function IDField: IioDBBuilderSchemaField;
    function IndexList: TioDBBuilderSchemaIndexList;
    function IndexListExists: Boolean;
    function IsClassFromField: Boolean;
    function IsForThisConnection(const AConnectionDefNameToCheck: String): Boolean;
    function TableName: String;
  end;

implementation

uses
  iORM.CommonTypes, System.SysUtils;

{ TioDBBuilderSchemaTable }

constructor TioDBBuilderSchemaTable.Create(const ATable: IioContextTable);
begin
  FTable := ATable;
  FFieldList := TioDBBuilderSchemaFieldList.Create;
  FFKList := TioDBBuilderSchemaFKList.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFieldList.Free;
  FFKList.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldList: TioDBBuilderSchemaFieldList;
begin
  Result := FFieldList;
end;

function TioDBBuilderSchemaTable.FKList: TioDBBuilderSchemaFKList;
begin
  Result := FFKList;
end;

function TioDBBuilderSchemaTable.IndexList: TioDBBuilderSchemaIndexList;
begin
  Result := FTable.GetIndexList(False);
end;

function TioDBBuilderSchemaTable.IndexListExists: Boolean;
begin
  Result := FTable.IndexListExists
end;

function TioDBBuilderSchemaTable.TableName: String;
begin
  Result := FTable.TableName;
end;

//function TioDBBuilderSchemaTable.IDField: IioDBBuilderSchemaField;
//var
//  AField: IioDBBuilderSchemaField;
//begin
//  Result := nil;
//  for AField in FFieldList.Values do
//    if AField.IsKeyField then
//      Exit(AField);
//end;

function TioDBBuilderSchemaTable.IsClassFromField: Boolean;
begin
  Result := FTable.IsClassFromField;
end;

function TioDBBuilderSchemaTable.IsForThisConnection(const AConnectionDefNameToCheck: String): Boolean;
var
  LCurrentConnectionDefName: String;
begin
  LCurrentConnectionDefName := FTable.GetConnectionDefName;
  Result := LCurrentConnectionDefName.IsEmpty or (LCurrentConnectionDefName = IO_CONNECTIONDEF_DEFAULTNAME) or
    (LCurrentConnectionDefName = AConnectionDefNameToCheck);
end;

end.
