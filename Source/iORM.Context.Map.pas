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



unit iORM.Context.Map;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.Context.Map.Interfaces, iORM.DependencyInjection.Implementers;

type

  TioMap = class(TInterfacedObject, IioMap)
  strict private
    FClassRef: TioClassRef;
    FTable: IioContextTable;
    FProperties: IioContextProperties;
    FRttiContext: TRttiContext;
    FRttiType: TRttiInstanceType;
    FAncestorMap: IioMap;
    fDIContainerImplementersItem: TioDIContainerImplementersItem;
  strict protected
  public
    constructor Create(AClassRef:TioClassRef; ARttiContext:TRttiContext; ARttiType:TRttiInstanceType; ATable:IioContextTable; AProperties:IioContextProperties); overload;
    function GetClassRef: TioClassRef;
    function GetClassName: String;
    function GetTable: IioContextTable;
    function GetProperties: IioContextProperties;
    function ClassFromField: IioClassFromField;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    // ObjStatusExist
    function ObjStatusExist: Boolean;
    // Blob field present
    function BlobFieldExists: Boolean;
    // Reference to a map of the ancestor if the ancestor itself is mapped (is an entity)
    function AncestorMap: Iiomap;
    // True if the class has a mapped ancestor (the ancestor is even an entity)
    function HasMappedAncestor: Boolean;
    // DIContainerImplementersItem reference
    function GetDIContainerImplementersItem: TioDIContainerImplementersItem;
    procedure SetDIContainerImplementersItem(const AValue:TioDIContainerImplementersItem);
  end;

implementation

uses
  iORM.Context.Container;

{ TioMap }

function TioMap.AncestorMap: Iiomap;
begin
  Result := FAncestorMap;
end;

function TioMap.BlobFieldExists: Boolean;
begin
  Result := FProperties.BlobFieldExists;
end;

function TioMap.ClassFromField: IioClassFromField;
begin
  Result := FTable.GetClassFromField;
end;

constructor TioMap.Create(AClassRef: TioClassRef; ARttiContext: TRttiContext;
  ARttiType: TRttiInstanceType; ATable: IioContextTable;
  AProperties: IioContextProperties);
begin
  inherited Create;
  FClassRef := AClassRef;
  FRttiContext := ARttiContext;
  FRttiType := ARttiType;
  FTable := ATable;
  // Set properties
  FProperties := AProperties;
  FProperties.SetTable(FTable);
  // Reference to a map of the ancestor if the ancestor itself is mapped (is an entity)
  //  NB: The second parameter must be False
  FAncestorMap := TioMapContainer.GetMap(ARttiType.BaseType.Name, False);
end;

function TioMap.GetClassName: String;
begin
  Result := FClassRef.ClassName;
end;

function TioMap.GetClassRef: TioClassRef;
begin
  Result := FClassRef;
end;

function TioMap.GetDIContainerImplementersItem: TioDIContainerImplementersItem;
begin
  Result := fDIContainerImplementersItem;
end;

function TioMap.GetProperties: IioContextProperties;
begin
  Result := FProperties;
end;

function TioMap.GetTable: IioContextTable;
begin
  Result := FTable;
end;

function TioMap.HasMappedAncestor: Boolean;
begin
  Result := Assigned(FAncestorMap);
end;

function TioMap.ObjStatusExist: Boolean;
begin
  Result := Self.GetProperties.ObjStatusExist;
end;

function TioMap.RttiContext: TRttiContext;
begin
  Result := FRttiContext;
end;

function TioMap.RttiType: TRttiInstanceType;
begin
  Result := FRttiType;
end;

procedure TioMap.SetDIContainerImplementersItem(
  const AValue: TioDIContainerImplementersItem);
begin
  fDIContainerImplementersItem := AValue;
end;

end.
