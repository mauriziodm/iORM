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
    FTable: IioTable;
    FProperties: IioProperties;
    FRttiContext: TRttiContext;
    FRttiType: TRttiInstanceType;
    FDIContainerImplementersItem: TioDIContainerImplementersItem;
    FTrueClassVirtualMap: IioMap;
    /// Find the progenitor class map mapped on the same table and connection (for TrueClassVirtualMap creation purposes)
    function _FindProgenitorSameTableAndConnection: IioMap;
  public
    constructor Create(AClassRef:TioClassRef; ARttiContext:TRttiContext; ARttiType:TRttiInstanceType; ATable:IioTable; AProperties:IioProperties); overload;
    function GetClassRef: TioClassRef;
    function GetClassName: String;
    function GetTable: IioTable;
    function GetProperties: IioProperties;
    function TrueClass: IioTrueClass;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function BlobFieldExists: Boolean;
    // DIContainerImplementersItem reference
    function GetDIContainerImplementersItem: TioDIContainerImplementersItem;
    procedure SetDIContainerImplementersItem(const AValue:TioDIContainerImplementersItem);
    /// This method build the part of the true class virtual map related to this class
    procedure BuildTrueClassVirtualMap;
    /// Duplicate itself as a new TrueClassVirtualMap
    function DuplicateToTrueClassMap: IioMap;
    /// Get the relative TrueClassVirtualMap mapped on the same table and connection
    function GetTrueClassVirtualMap: IioMap;
    /// This method return true if it's a TrueClassVirtualMap, false otherwise.
    ///  Note: I could not simply check if the private field FTrueClassVirtualMap was assigned or not because
    ///         at the point where I need this functionality it could be a nil also in the parent base class.
    function IsTrueClassVirtualMap: Boolean; virtual;
  end;

  TioTrueClassVirtualMap = class(TioMap)
  public
    /// This method return true if it's a TrueClassVirtualMap, false otherwise
    function IsTrueClassVirtualMap: Boolean; override;
  end;

implementation

uses
  iORM.Context.Container, iORM.Context.Properties, Winapi.Windows;

{ TioMap }

function TioMap.BlobFieldExists: Boolean;
begin
  Result := FProperties.BlobFieldExists;
end;

function TioMap.TrueClass: IioTrueClass;
begin
  Result := FTable.GetTrueClass;
end;

function TioMap._FindProgenitorSameTableAndConnection: IioMap;
var
  LCurrentRttiInstanceType: TRttiInstanceType;
  LCurrentMap: IioMap;
begin
  Result := Self;
  LCurrentRttiInstanceType := FRttiType.BaseType;
  // Cicla finchè c'è una classe antenata (in pratica fino al TObject)
  while (LCurrentRttiInstanceType <> nil) do
  begin
    // Se la classe attuale è mappata (quindi è una entity) allora la considera altrimenti la salta e passa alla prossima
    // (in pratica considera solo le entity quindi se c'è ad esempmio una classe astratta come antenato comune ma questa
    // giustamente non è uan entità (in quanto astratta non c'è l'attributo ioEntity) questa non viene considerata.
    if TioMapContainer.Exist(LCurrentRttiInstanceType.Name) then
    begin
      LCurrentMap := TioMapContainer.GetMap(LCurrentRttiInstanceType.Name, False);
      // Se la classe corrente è mappata sulla stessa tabella/connessione...
      if (LCurrentMap.GetTable.TableName = FTable.TableName) and (LCurrentMap.GetTable.GetConnectionDefName = FTable.GetConnectionDefName) then
      begin
        Result := LCurrentMap;
      end;
    end;
    // Go to the next next ancestor class
    LCurrentRttiInstanceType := LCurrentRttiInstanceType.BaseType;
  end;
end;

procedure TioMap.BuildTrueClassVirtualMap;
begin
  // Find the progenitor class map mapped on the same table and connection then
  //  create the TrueClassVirtualMap and add it to the TioMapContainer (if not already exists)
  //  then copy into it the owned properties (if not already exists).
  FTrueClassVirtualMap := _FindProgenitorSameTableAndConnection;
  if not FTrueClassVirtualMap.IsTrueClassVirtualMap then
    FTrueClassVirtualMap := TioMapContainer.AddTrueClassVirtualMap(FTrueClassVirtualMap);
  FProperties.CopyPropertiesToTrueClassVirtualMap(FTrueClassVirtualMap.GetProperties);
end;

constructor TioMap.Create(AClassRef: TioClassRef; ARttiContext: TRttiContext; ARttiType: TRttiInstanceType; ATable: IioTable; AProperties: IioProperties);
begin
  inherited Create;
  FTrueClassVirtualMap := nil;
  FClassRef := AClassRef;
  FRttiContext := ARttiContext;
  FRttiType := ARttiType;
  FTable := ATable;
  // Set properties
  FProperties := AProperties;
  FProperties.SetTable(FTable);
end;

function TioMap.DuplicateToTrueClassMap: IioMap;
begin
  Result := TioTrueClassVirtualMap.Create(FClassRef, FRttiContext, FRttiType, FTable.DuplicateForTrueClassMap, TioProperties.Create);
  Result.SetDIContainerImplementersItem(FDIContainerImplementersItem);
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
  Result := FDIContainerImplementersItem;
end;

function TioMap.GetProperties: IioProperties;
begin
  Result := FProperties;
end;

function TioMap.GetTable: IioTable;
begin
  Result := FTable;
end;

function TioMap.GetTrueClassVirtualMap: IioMap;
begin
  Result := FTrueClassVirtualMap;
end;

function TioMap.IsTrueClassVirtualMap: Boolean;
begin
  Result := False;
end;

function TioMap.RttiContext: TRttiContext;
begin
  Result := FRttiContext;
end;

function TioMap.RttiType: TRttiInstanceType;
begin
  Result := FRttiType;
end;

procedure TioMap.SetDIContainerImplementersItem(const AValue: TioDIContainerImplementersItem);
begin
  FDIContainerImplementersItem := AValue;
end;

{ TioTrueClassVirtualMap }

function TioTrueClassVirtualMap.IsTrueClassVirtualMap: Boolean;
begin
  Result := True;
end;

end.
