//&&&&&
unit iORM.DB.Peculiarity.Generic.PeculiarityMapper;

interface

Uses iORM.CommonTypes, iORM.DB.Interfaces, //, iORM.DB.ConnectionContainer;
  iORM.Context.Table.Interfaces; //&&&&

Type
  TioDbPeculiarityGeneric = class(TioDbPeculiarity)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
    class function SqlCompareOperatorRef: TioSqlCompareOperatorRef; override;
    class function SqlLogicRelationRef: TioSqlLogicRelationRef; override;
    class Function AutoCreateDatabase:Boolean; override;
    class Function HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable):Boolean; override;
    class Function HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable):Boolean; override;
    class Function HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable):Boolean; override;
    class Function HasToSkipIDInInsert(Const AContextTable:IioContextTable):Boolean; override;
  end;

Implementation

Uses System.Classes, System.SysUtils, iORM.DB.Components.ConnectionDef,
  iORM.DB.Peculiarity.Generic.SqlCompareOperators,
  iORM.DB.Peculiarity.Generic.SqlLogicRelations,
  iORM.DB.Peculiarity.Generic.SqlGenerator,
  iORM.DB.Peculiarity.Generic.SqlDataConverter;

{ TioDbPeculiarityGeneric }

class function TioDbPeculiarityGeneric.AutoCreateDatabase: Boolean;
begin
  Result:=False;
end;

class function TioDbPeculiarityGeneric.HasToSkipIDInInsert(Const AContextTable:IioContextTable): Boolean;
begin
    Result:=HasSqlLastIDAfterInsert(AContextTable)
      or HasAutoIncrementIDRetrieveWithInsertQuery(AContextTable);
end;

class function TioDbPeculiarityGeneric.HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable): Boolean;
begin
  Result:=False;
end;

class function TioDbPeculiarityGeneric.HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable): Boolean;
begin
  Result:=False;
end;

class function TioDbPeculiarityGeneric.HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable): Boolean;
begin
  Result:=False;
end;

class function TioDbPeculiarityGeneric.SqlCompareOperatorRef: TioSqlCompareOperatorRef;
begin
  Result:=TioSqlCompareOperatorGeneric;
end;

class function TioDbPeculiarityGeneric.SqlDataConverterRef: TioSqlDataConverterRef;
begin
  Result:=TioSqlDataConverterGeneric;
end;

class function TioDbPeculiarityGeneric.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorGeneric;
end;

class function TioDbPeculiarityGeneric.SqlLogicRelationRef: TioSqlLogicRelationRef;
begin
  Result:=TioSqlLogicRelationGeneric;
end;

end.
