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
    procedure SetDataObject(AValue: TObject);
    // ObjectStatus
    function GetObjectStatus: TioObjectStatus;
    procedure SetObjectStatus(AValue: TioObjectStatus);
    // Where
    function GetWhere: IioWhere;
    procedure SetWhere(AWhere: IioWhere);
  public
    constructor Create(AClassName:String; AMap:IioMap; AWhere:IioWhere=nil; ADataObject:TObject=nil); overload;
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
    // ConnectionDefName
    function GetConnectionDefName: String;
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
  iORM.Context.Container;

{ TioContext }

function TioContext.BlobFieldExists: Boolean;
begin
  Result := Self.GetProperties.BlobFieldExists;
end;

function TioContext.ClassFromField: IioClassFromField;
begin
  Result := Self.Map.GetTable.GetClassFromField;
end;

constructor TioContext.Create(AClassName:String; AMap:IioMap; AWhere:IioWhere=nil; ADataObject:TObject=nil);
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

function TioContext.GetConnectionDefName: String;
begin
  Result := GetTable.GetConnectionDefName;
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
    then Result := Self.GetTable.GetGroupBy.GetSql(FMap.GetClassName);
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

procedure TioContext.SetDataObject(AValue: TObject);
begin
  FDataObject := AValue;
end;

procedure TioContext.SetObjectStatus(AValue: TioObjectStatus);
var
  PropValue: TValue;
begin
  // If ObjectStatus property not exist then exit
  if not Self.GetProperties.ObjStatusExist then Exit;
  // If exist set the property value
  PropValue := TValue.From<TioObjectStatus>(AValue);
  Self.GetProperties.ObjStatusProperty.SetValue(Self.FDataObject, PropValue);
end;

procedure TioContext.SetWhere(AWhere: IioWhere);
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
