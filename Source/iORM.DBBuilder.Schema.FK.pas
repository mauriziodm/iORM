unit iORM.DBBuilder.Schema.FK;

interface

uses
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, iORM.Attributes;

type

  TioDBBuilderSchemaFK = class(TInterfacedObject, IioDBBuilderSchemaFK)
  private
    FDependentMap: IioMap;
    FDependentProperty: IioContextProperty;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceMap: IioMap;
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    function DependentTableName: String;
    function DependentFieldName: String;
    function Name: String;
    function OnDeleteAction: TioFKAction;
    function OnUpdateAction: TioFKAction;
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderSchemaFK }

function TioDBBuilderSchemaFK.DependentFieldName: String;
begin
  Result := FDependentProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.DependentTableName: String;
begin
  Result := FDependentMap.GetTable.TableName;
end;

function TioDBBuilderSchemaFK.Name: String;
begin
  Result := Format('FK_%s_%s_%s', [DependentTableName, DependentFieldName, ReferenceTableName]);
end;

function TioDBBuilderSchemaFK.OnDeleteAction: TioFKAction;
begin
  Result := FOnDeleteAction;
end;

function TioDBBuilderSchemaFK.OnUpdateAction: TioFKAction;
begin
  Result := FOnUpdateAction;
end;

constructor TioDBBuilderSchemaFK.Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  FReferenceMap := AReferenceMap;
  FDependentMap := ADependentMap;
  FDependentProperty := ADependentProperty;
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
end;

function TioDBBuilderSchemaFK.ReferenceFieldName: String;
begin
  Result := FReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.ReferenceTableName: String;
begin
  Result := FReferenceMap.GetTable.TableName;
end;

end.
