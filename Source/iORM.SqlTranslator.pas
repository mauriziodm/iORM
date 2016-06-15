{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.SqlTranslator;

interface

uses
  System.RegularExpressions;

type

  TioSqlTranslator = class
  protected
    FSelfClassName: String;
    FQualifiedFieldName: Boolean;
    function RemoveDelimiters(const AValue:string): String;
    function GetClassName(const AValue:string): String;
    function GetPropertyName(const AValue:String): String;
    function ReplaceEval(const Match: TMatch): string;
    function TranslateInternal(const AValue:String): String;
  public
    constructor Create(const ASelfClassName: String; const AQualifiedFieldName: Boolean);
    class function Translate(const AValue:String; const ASelfClassName:String; const AQualifiedFieldName:Boolean=True): String;
  end;

implementation

uses
  SysUtils, iORM.Context.Interfaces, iORM.Context.Factory,
  iORM.Context.Container, iORM.Context.Map.Interfaces,
  iORM.Exceptions;

{ TioSqlTranslator }

constructor TioSqlTranslator.Create(const ASelfClassName: String; const AQualifiedFieldName: Boolean);
begin
  inherited Create;
  FSelfClassName := ASelfClassName;
  FQualifiedFieldName := AQualifiedFieldName;
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
      raise EioException.Create(Self.ClassName + ': Invalid Self or Interface specification.')
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
  ASqlTag, AClassName, APropName: String;
  AMap: IioMap;
begin
  ASqlTag := Self.RemoveDelimiters(Match.Value);
  AClassName := Self.GetClassName(ASqlTag);
  APropName := Self.GetPropertyName(ASqlTag);
  AMap := TioMapContainer.GetMap(AClassName);
  Result := AMap.GetTable.TableName;
  if APropName <> '' then
  begin
    if FQualifiedFieldName then
      Result := Result + '.' + AMap.GetProperties.GetPropertyByName(APropName).GetSqlFieldName
    else
      Result := AMap.GetProperties.GetPropertyByName(APropName).GetSqlFieldName;
  end;
end;

class function TioSqlTranslator.Translate(const AValue: String; const ASelfClassName:String; const AQualifiedFieldName:Boolean): String;
var
  LSqlTranslator: TioSqlTranslator;
begin
  LSqlTranslator := Self.Create(ASelfClassName, AQualifiedFieldName);
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
