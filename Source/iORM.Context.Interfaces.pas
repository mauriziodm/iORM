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
unit iORM.Context.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces, iORM.LiveBindings.BSPersistence;

type

  // Context interface
  IioContext = interface
    ['{6B512CDA-23C6-42A3-AC44-905344B019E9}']
    function GetClassRef: TioClassRef;
    function GetTable: IioTable;
    function GetProperties: IioProperties;
    function GetTrueClass: IioTrueClass;
    function IsTrueClass: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    function GetID: Integer;
    function IDIsNull: Boolean;
    // Map
    function Map: IioMap;
    // DataObject
    procedure SetDataObject(const AValue: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // ObjectStatus
    procedure SetObjStatus(const AValue: TioObjStatus);
    function GetObjStatus: TioObjStatus;
    property ObjStatus:TioObjStatus read GetObjStatus write SetObjStatus;
    // ObjVersion
    function NextObjVersion(const ASetValue: Boolean): TioObjVersion;
    function GetObjVersion: TioObjVersion;
    procedure SetObjVersion(const AValue: TioObjVersion);
    property ObjVersion:TioObjVersion read GetObjVersion write SetObjVersion; // write SetObjVersion;
    // ObjCreated
    function GetObjCreated: TioObjCreated;
    procedure SetObjCreated(const AValue: TioObjCreated);
    property ObjCreated: TioObjCreated read GetObjCreated write SetObjCreated;
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // RelationOID
    function GetRelationOID: Integer;
    procedure SetRelationOID(const Value: Integer);
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    // OriginalResolvedTypeNameNonTrueClass
    procedure SetOriginalNonTrueClassMap(const AMap: IioMap);
    function GetOriginalNonTrueClassMap: IioMap;
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
    // EtmEntityStateDeforeUpdate
    function GetEtmBeforeUpdateEntityState: String;
    procedure SetEtmBeforeUpdateEntityState(const Value: String);
    property EtmBeforeUpdateEntityState: String read GetEtmBeforeUpdateEntityState write SetEtmBeforeUpdateEntityState;
    // EtmEntityStateDeforeUpdate
    function GetEtmRevertedFromVersion: Integer;
    procedure SetEtmRevertedFromVersion(const Value: Integer);
    property EtmRevertedFromVersion: Integer read GetEtmRevertedFromVersion write SetEtmRevertedFromVersion;
  end;

implementation

end.
