{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.SqlTranslator;

interface

uses
  System.RegularExpressions;

type

  TioSqlTranslator = class
  protected
    FSelfClassName: String;
    FQualifiedFieldName: Boolean;
    FRawNames: Boolean;
    function RemoveDelimiters(const AValue:string): String;
    function GetClassName(const AValue:string): String;
    function GetPropertyName(const AValue:String): String;
    function ReplaceEval(const Match: TMatch): string;
    function TranslateInternal(const AValue:String): String;
  public
    constructor Create(const ASelfClassName: String; const AQualifiedFieldName, ARawNames: Boolean);
    class function Translate(const AValue, ASelfClassName:String; const AQualifiedFieldName:Boolean=True): String;
    /// <summary>Translates the tags with the names as declared in the mapping, not normalized: for the map build only</summary>
    /// <remarks>
    /// The normal Translate gives the field names normalized for the connection (GetSqlFieldName), so a property tag
    /// needs the connection, which is not registered yet while the maps are built (initialization section). This
    /// version gives the field names as declared (IioProperty.GetFieldName), like the table names (TableName), so it
    /// needs no connection: it is meant for the mapping data, which iORM keeps as declared and normalizes when it
    /// builds the SQL (e.g. the ioField attribute, see TioProperty.ResolveTaggedFieldData). Not for SQL text.
    /// A referenced property must have a column of its own on the table of its class.
    /// </remarks>
    class function TranslateRaw(const AValue, ASelfClassName: String): String;
  end;

implementation

uses
  System.SysUtils,
  iORM.Context.Container, iORM.Context.Map.Interfaces,
  iORM.Exceptions, iORM.Context.Properties.Interfaces, iORM.Attributes;

{ TioSqlTranslator }

constructor TioSqlTranslator.Create(const ASelfClassName: String; const AQualifiedFieldName, ARawNames: Boolean);
begin
  inherited Create;
  FSelfClassName := ASelfClassName;
  FQualifiedFieldName := AQualifiedFieldName;
  FRawNames := ARawNames;
end;

function TioSqlTranslator.GetClassName(const AValue: string): String;
var
  DotPos: Smallint;
begin
  // Get the dot position
  DotPos := AValue.IndexOf('.');
  // Extract the ClassName
  if DotPos = -1
    then Result := AValue
    else Result := AValue.Substring(0, AValue.IndexOf('.'));
  // Is Self or interface then return the Current ClassName
  if UpperCase(Result).Equals('SELF')
  or Result.StartsWith('I')
  or Result.IsEmpty
  then
    if FSelfClassName.IsEmpty then
      raise EioGenericException.Create(Self.ClassName + ': Invalid Self or Interface specification.')
    else
      Result := FSelfClassName;
end;

function TioSqlTranslator.GetPropertyName(const AValue: String): String;
var
  DotPos: Smallint;
begin
  Result := '';
  DotPos := AValue.IndexOf('.');
  if DotPos > -1
    then Result := AValue.Substring(DotPos+1, 99999999);
end;

function TioSqlTranslator.RemoveDelimiters(const AValue: string): String;
begin
  Result := AValue.Substring(1, AValue.Length-2);
end;

function TioSqlTranslator.ReplaceEval(const Match: TMatch): string;
var
  LSqlTag, LClassName, LPropName, LFieldName: String;
  LMap: IioMap;
  LProperty: IioProperty;
begin
  LSqlTag := Self.RemoveDelimiters(Match.Value);
  LClassName := Self.GetClassName(LSqlTag);
  LPropName := Self.GetPropertyName(LSqlTag);
  LMap := TioMapContainer.GetMap(LClassName);
  Result := LMap.GetTable.TableName;
  if LPropName <> '' then
  begin
    LProperty := LMap.GetProperties.GetPropertyByName(LPropName);
    if FRawNames then
    begin
      // Map build (see TranslateRaw): the referenced property may itself have a tag still to be resolved
      LProperty.ResolveTaggedFieldData;
      // The tag gives "table of the class . column of the property": the property must have a column of its own
      // on that table
      if LProperty.IsJoined or LProperty.LoadSqlExist or (LProperty.GetRelationType in [rtHasMany, rtHasOne]) then
        raise EioGenericException.Create(ClassName, 'TranslateRaw', Format('Oops!'#13#13'Hi, I''m iORM, I''m sorry but there is a problem.' +
          #13#13'The tag "%s" refers to the property "%s" of the class "%s", but that property has no column of its own on the table "%s":' +
          ' it is a column of a joined table (attribute "[ioJoin]"), or an expression (attribute "[ioLoadSql]"), or a HasMany/HasOne relation.' +
          #13#13'Please refer to a property mapped on a column of the table of its class.' +
          #13#13'It will work.', [Match.Value, LProperty.GetName, LMap.GetClassName, Result]));
      LFieldName := LProperty.GetFieldName;
    end
    else
      LFieldName := LProperty.GetSqlFieldName(False);
    if FQualifiedFieldName then
      Result := Result + '.' + LFieldName
    else
      Result := LFieldName;
  end;
end;

class function TioSqlTranslator.Translate(const AValue, ASelfClassName:String; const AQualifiedFieldName:Boolean): String;
var
  LSqlTranslator: TioSqlTranslator;
begin
  LSqlTranslator := Self.Create(ASelfClassName, AQualifiedFieldName, False);
  try
    Result := LSqlTranslator.TranslateInternal(AValue);
  finally
    LSqlTranslator.Free;
  end;
end;

class function TioSqlTranslator.TranslateRaw(const AValue, ASelfClassName: String): String;
var
  LSqlTranslator: TioSqlTranslator;
begin
  LSqlTranslator := Self.Create(ASelfClassName, True, True);
  try
    Result := LSqlTranslator.TranslateInternal(AValue);
  finally
    LSqlTranslator.Free;
  end;
end;

function TioSqlTranslator.TranslateInternal(const AValue: String): String;
var
  AEvaluator: TMatchEvaluator;
begin
  Result := '';
  AEvaluator := ReplaceEval;
  Result := TRegEx.Replace(AValue, '\[.*?\]', AEvaluator);
end;

end.
