{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}





unit iORM.Where.SqlItems;

interface

uses
  iORM.SqlItems,
  iORM.Where.SqlItems.Interfaces,
  System.Rtti, iORM.Context.Map.Interfaces;

type

  // Base class for specialized SqlItemWhere needing reference ContextProperties
  TioSqlItemsWhere = class(TioSqlItem, IioSqlItemWhere)
  public
    function GetSql(const AMap:IioMap): String; reintroduce; virtual; abstract;
    function GetSqlParamName(const AMap:IioMap): String; virtual;
    function GetValue(const AMap:IioMap): TValue; virtual;
    function HasParameter: Boolean; virtual; abstract;
  end;

  // Specialized SqlItemWhere for property (PropertyName to FieldName)
  //  NB: Property.Name is in FSqlText ancestor field
  TioSqlItemsWhereProperty = class(TioSqlItemsWhere)
  public
    function GetSql(const AMap:IioMap): String; override;
    function HasParameter: Boolean; override;
  end;

  // Specialized SqlItemWhere for OID property of the referenced class
  //  return che OID property sql field name
  TioSqlItemsWherePropertyOID = class(TioSqlItemsWhereProperty)
  public
    constructor Create; overload;
    function GetSql(const AMap:IioMap): String; override;
    function HasParameter: Boolean; override;
  end;

  // Specialized SqlItemWhere returning an SQL compatible repreentation
  //  of TValue
  TioSqlItemsWhereTValue = class(TioSqlItemsWhere)
  strict private
    FValue: TValue;
  public
    constructor Create(const ASqlText:String); overload;  // raise exception
    constructor Create(const AValue:TValue); overload;
    function GetSql(const AMap:IioMap): String; override;
    function HasParameter: Boolean; override;
  end;

  // Specialized SqlItemWhere for text conditions with tags translating
  //  property to fieldname
  TioSqlItemsWhereText  = class(TioSqlItemsWhere)
  public
    function GetSql(const AMap:IioMap): String; override;
    function HasParameter: Boolean; override;
  end;

  // Specialized SqlItemWhere for ORDER BY with tags translating
  //  property to fieldname
  TioSqlItemsOrderBy  = class(TioSqlItemsWhereText)
    function GetSql(const AMap:IioMap): String; override;
  end;

  // Specialized SqlItemWhere for property equals to for param (best for internal use)
  TioSqlItemsWherePropertyEqualsTo = class(TioSqlItemsWhere)
  strict private
    FValue: TValue;
  public
    constructor Create(const ASqlText:String); overload;  // raise exception
    constructor Create(const ASqlText:String; const AValue:TValue); overload;
    function GetSql(const AMap:IioMap): String; override;
    function GetSqlParamName(const AMap:IioMap): String; override;
    function GetValue(const AMap:IioMap): TValue; override;
    function HasParameter: Boolean; override;
  end;

  // Specialized SqlItemWhere for propertyID equals to for param (best for internal use)
  TioSqlItemsWherePropertyOIDEqualsTo = class(TioSqlItemsWhere)
  strict private
    FValue: TValue;
  public
    constructor Create(const ASqlText:String); overload;  // raise exception
    constructor Create(const AValue:TValue); overload;
    function GetSql(const AMap:IioMap): String; override;
    function GetSqlParamName(const AMap:IioMap): String; override;
    function GetValue(const AMap:IioMap): TValue; override;
    function HasParameter: Boolean; override;
  end;

implementation

uses
  iORM.Exceptions, iORM.DB.Factory, iORM.SqlTranslator,
  iORM.Context.Properties.Interfaces;

{ TioSqlItemsWhereValue }

constructor TioSqlItemsWhereTValue.Create(const AValue: TValue);
begin
  FValue := AValue;
end;

constructor TioSqlItemsWhereTValue.Create(const ASqlText: String);
begin
  raise EioException.Create('TioSqlItemsWhereValue wrong constructor called');
end;

function TioSqlItemsWhereTValue.GetSql(const AMap:IioMap): String;
begin
  // NB: No inherited
  Result := TioDBFactory.SqlDataConverter.TValueToSql(FValue);
end;

function TioSqlItemsWhereTValue.HasParameter: Boolean;
begin
  Result := False;
end;

{ TioSqlItemsWhereProperty }

function TioSqlItemsWhereProperty.GetSql(const AMap:IioMap): String;
begin
  // NB: No inherited
  Result := AMap.GetProperties.GetPropertyByName(FSqlText).GetSqlQualifiedFieldName;
end;

{ TioSqlItemsWhere }

function TioSqlItemsWhereProperty.HasParameter: Boolean;
begin
  Result := False;
end;

{ TioSqlItemsWherePropertyOID }

constructor TioSqlItemsWherePropertyOID.Create;
begin
  // Nothing
end;

function TioSqlItemsWherePropertyOID.GetSql(const AMap:IioMap): String;
begin
  Result := AMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName;
end;

function TioSqlItemsWherePropertyOID.HasParameter: Boolean;
begin
  Result := False;
end;

{ TioSqlItemsWhereText }

function TioSqlItemsWhereText.GetSql(const AMap:IioMap): String;
begin
  // NB: No inherited
  Result := TioSqlTranslator.Translate(FSqlText, AMap.GetClassName);
end;

function TioSqlItemsWhereText.HasParameter: Boolean;
begin
  Result := False;
end;

{ TioSqlItemsWherePropertyEqualsTo }

constructor TioSqlItemsWherePropertyEqualsTo.Create(const ASqlText: String);
begin
  raise EioException.Create(Self.ClassName + ': wrong constructor called');
end;

constructor TioSqlItemsWherePropertyEqualsTo.Create(const ASqlText: String; const AValue: TValue);
begin
  inherited Create(ASqlText);
  FValue := AValue;
end;

function TioSqlItemsWherePropertyEqualsTo.GetSql(const AMap:IioMap): String;
var
  AProp: IioContextProperty;
begin
  // NB: No inherited
  AProp := AMap.GetProperties.GetPropertyByName(FSqlText);
  Result := AProp.GetSqlQualifiedFieldName
          + TioDBFactory.CompareOperator._Equal.GetSql
          + ':' + AProp.GetSqlParamName;
end;

function TioSqlItemsWherePropertyEqualsTo.GetSqlParamName(const AMap:IioMap): String;
begin
  Result := AMap.GetProperties.GetPropertyByName(FSqlText).GetSqlParamName;
end;

function TioSqlItemsWherePropertyEqualsTo.GetValue(const AMap:IioMap): TValue;
begin
  Result := FValue;
end;

function TioSqlItemsWherePropertyEqualsTo.HasParameter: Boolean;
begin
  Result := True;
end;

{ TioSqlItemsWherePropertyOIDEqualsTo }

constructor TioSqlItemsWherePropertyOIDEqualsTo.Create(const ASqlText: String);
begin
  raise EioException.Create(Self.ClassName + ': wrong constructor called');
end;

constructor TioSqlItemsWherePropertyOIDEqualsTo.Create(const AValue: TValue);
begin
  inherited Create('');
  FValue := AValue;
end;

function TioSqlItemsWherePropertyOIDEqualsTo.GetSql(const AMap:IioMap): String;
begin
  // NB: No inherited
  Result := AMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName
          + TioDBFactory.CompareOperator._Equal.GetSql
          + ':' + AMap.GetProperties.GetIdProperty.GetSqlParamName;
end;

function TioSqlItemsWherePropertyOIDEqualsTo.GetSqlParamName(const AMap:IioMap): String;
begin
  Result := AMap.GetProperties.GetIdProperty.GetSqlParamName;
end;

function TioSqlItemsWherePropertyOIDEqualsTo.GetValue(const AMap:IioMap): TValue;
begin
  Result := FValue;
end;


function TioSqlItemsWherePropertyOIDEqualsTo.HasParameter: Boolean;
begin
  Result := True;
end;

{ TioSqlItemsWhere }

function TioSqlItemsWhere.GetSqlParamName(const AMap:IioMap): String;
begin
  // Default
  Result := '';
end;

function TioSqlItemsWhere.GetValue(const AMap:IioMap): TValue;
begin
  // Default
  Result := nil;
end;

{ TioSqlItemsOrderBy }

function TioSqlItemsOrderBy.GetSql(const AMap:IioMap): String;
begin
  Result := 'ORDER BY ' + inherited GetSql(AMap);
end;

end.
