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



unit iORM.Context;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.Where, iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces;

type

  TioContext = class(TInterfacedObject, IioContext)
  strict private
    FMap: IioMap;
    FDataObject: TObject;
    FWhere: IioWhere;
  strict protected
    // DataObject
    function GetDataObject: TObject;
    procedure SetDataObject(const AValue: TObject);
    // ObjectStatus
    function GetObjectStatus: TioObjectStatus;
    procedure SetObjectStatus(const AValue: TioObjectStatus);
    // Where
    function GetWhere: IioWhere;
    procedure SetWhere(const AWhere: IioWhere);
  public
    constructor Create(const AClassName:String; const AMap:IioMap; const AWhere:IioWhere=nil; const ADataObject:TObject=nil); overload;
    function GetClassRef: TioClassRef;
    function GetTable: IioContextTable;
    function GetProperties: IioContextProperties;
    function ClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    function IDIsNull: Boolean;
    // Map
    function Map: IioMap;
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjStatusExist
    function ObjStatusExist: Boolean;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // Join
    function GetJoin: IioJoins;
    // DataObject
    property DataObject:TObject read GetDataObject write SetDataObject;
    // ObjectStatus
    property ObjectStatus:TioObjectStatus read GetObjectStatus write SetObjectStatus;
    // Where
    property Where:IioWhere read GetWhere write SetWhere;
  end;

implementation

uses
  iORM.Context.Factory, iORM.DB.Factory, System.TypInfo,
  iORM.Context.Container, System.SysUtils;

{ TioContext }

function TioContext.BlobFieldExists: Boolean;
begin
  Result := Self.GetProperties.BlobFieldExists;
end;

function TioContext.ClassFromField: IioClassFromField;
begin
  Result := Self.Map.GetTable.GetClassFromField;
end;

constructor TioContext.Create(const AClassName:String; const AMap:IioMap; const AWhere:IioWhere=nil; const ADataObject:TObject=nil);
begin
  inherited Create;
  FMap := AMap;
  FDataObject := ADataObject;
  FWhere := AWhere;
end;

function TioContext.GetClassRef: TioClassRef;
begin
  Result := Self.Map.GetClassRef;
end;

function TioContext.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioContext.GetGroupBySql: String;
begin
  Result := '';
  // Ritorna il GroupBy fisso (attribute nella dichiarazione della classe)
  if Assigned(Self.GetTable.GetGroupBy)
    then Result := Self.GetTable.GetGroupBy.GetSql;
  // Aggiungere qui l'eventuale futuro codice per aggiungere/sostituire
  //  l'eventuale GroupBy specificato nel ioWhere e che quindi è nel
  //  context e che sostituisce il GroupBy fisso
end;

function TioContext.GetJoin: IioJoins;
begin
  Result := Self.GetTable.GetJoin;
end;

function TioContext.GetObjectStatus: TioObjectStatus;
begin
  if Self.GetProperties.ObjStatusExist
    then Result := TioObjectStatus(   Self.GetProperties.ObjStatusProperty.GetValue(Self.FDataObject).AsOrdinal   )
    else Result := osDirty;
end;

function TioContext.GetOrderBySql: String;
begin
  Result := Self.Where.GetOrderBySql(FMap);
end;

function TioContext.GetProperties: IioContextProperties;
begin
  Result := Self.Map.GetProperties;
end;

function TioContext.RttiContext: TRttiContext;
begin
  Result := Self.Map.RttiContext;
end;

function TioContext.RttiType: TRttiInstanceType;
begin
  Result := Self.Map.RttiType;
end;

procedure TioContext.SetDataObject(const AValue: TObject);
begin
  FDataObject := AValue;
end;

procedure TioContext.SetObjectStatus(const AValue: TioObjectStatus);
var
  PropValue: TValue;
begin
  // If ObjectStatus property not exist then exit
  if not Self.GetProperties.ObjStatusExist then Exit;
  // If exist set the property value
  PropValue := TValue.From<TioObjectStatus>(AValue);
  Self.GetProperties.ObjStatusProperty.SetValue(Self.FDataObject, PropValue);
end;

procedure TioContext.SetWhere(const AWhere: IioWhere);
begin
  FWhere := AWhere;
end;

function TioContext.WhereExist: Boolean;
begin
  Result := Assigned(FWhere);
end;

function TioContext.GetTable: IioContextTable;
begin
  Result := Self.Map.GetTable;
end;

function TioContext.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

function TioContext.IDIsNull: Boolean;
begin
  Result := (not Assigned(FDataObject))
    or (Self.GetProperties.GetIdProperty.GetValue(FDataObject).AsInteger = IO_INTEGER_NULL_VALUE);
end;

function TioContext.IsClassFromField: Boolean;
begin
  Result := Self.GetTable.IsClassFromField
            and (   (not Assigned(FWhere)) or (not FWhere.GetDisableClassFromField)   );
end;

function TioContext.Map: IioMap;
begin
  Result := FMap;
end;

function TioContext.ObjStatusExist: Boolean;
begin
  Result := Self.Map.ObjStatusExist;
end;

end.

