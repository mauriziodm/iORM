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
unit iORM.LiveBindings.PrototypeBindSource.Master;

interface

uses
  iORM.LiveBindings.BSPersistence, iORM.LiveBindings.PrototypeBindSource.Custom,
  System.Classes, iORM.LiveBindings.Interfaces, Data.Bind.Components, iORM.CommonTypes,
  iORM, iORM.LiveBindings.CommonBSBehavior;

type

  TioPrototypeBindSourceMaster = class(TioPrototypeBindSourceCustom, IioMasterBindSource, IioStdActionTargetMasterBindSource)
  private
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnUpdateAction: TioBSOnUpdateAction;
    FOnInsertAction: TioOnInsertAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    FWhereBuilderFor: IioMasterBindSource;
    // Events
    FBeforeWhereBuild: TioBeforeWhereBuilderEvent;
    FBeforeWhereClear: TioBeforeWhereBuilderEvent;
    FOnWhereBuild: TioOnWhereBuilderEvent;
    FOnWhereClear: TioOnWhereBuilderEvent;
    FAfterWhereBuild: TioAfterWhereBuilderEvent;
    FAfterWhereClear: TioAfterWhereBuilderEvent;
    // SourcePrototypeBindSource
    function GetSourceBS: IioBindSource;
    procedure SetSourceBS(const Value: IioBindSource);
    // WhereBuilderFor
    function GetWhereBuilderFor: IioMasterBindSource;
    procedure SetWhereBuilderFor(const AMasterBS: IioMasterBindSource);
    // Added methods
    function GetPersistence: TioBSPersistence;
    // OnDeleteAction property
    function GetOnDeleteAction: TioBSOnDeleteAction;
    procedure SetOnDeleteAction(const Value: TioBSOnDeleteAction);
    // OnEditAction property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    // OnInsertUpdateAction property
    function GetOnUpdateAction: TioBSOnUpdateAction;
    procedure SetOnUpdateAction(const Value: TioBSOnUpdateAction);
    // OnInsertAction property
    function GetOnInsertAction: TioOnInsertAction;
    procedure SetOnInsertAction(const Value: TioOnInsertAction);
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
    // procedure DoBeforeOpen; // In TioDataSetMaster is DoBeforeOpen but here is SetActive
  protected
//    procedure DoAfterWhereBuild;
//    procedure DoBeforeWhereBuild;
    procedure SetActive(const Value: Boolean); override; // In TioDataSetMaster is DoBeforeOpen/DoAfterOpen/DoBeforeClose but here is SetActive
    procedure PosChanging(ABindComp: TBasicBindComponent); override; // In TioDataSetMaster is DoBeforeScroll but here is PosChanging
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;

    // WhereBuilder
    function BuildWhere(const AExecuteOnTarget: Boolean = True): IioWhere;
    function ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;

    property Where;
    property ItemCount;
    // Added properties
    property Persistence: TioBSPersistence read GetPersistence;
  published
    // properties redeclared from TioCustomPrototypeBindSource
    property AutoActivate;
//    property AutoEdit;
//    property AutoPost;
//    property RecordCount;
//    property FieldDefs;
//    property ScopeMappings;
//    property OnCreateAdapter;
    // properties redeclared from TioCUstomPrototypeBindSource
    property AsDefault; // non mettere default
    property TypeName;
    property TypeAlias;
    property AsyncLoad default False;
    property AsyncPersist default False;
    property LoadType default ltAuto;
    property Lazy default False;
    property LazyProps;
    property TypeOfCollection; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr; // published: Master
    property OrderBy;
    property AutoRefreshOnNotification default True;
    property VirtualFields;
    // Published ETM for
    property ETMfor;
    // Published properties: selectors
    property SelectorFor;
    // Published properties: paging
    property Paging;
    // Added properties
    property OnDeleteAction: TioBSOnDeleteAction read GetOnDeleteAction write SetOnDeleteAction default daSetSmartDeleteSystem;
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction default eaSaveRevertPoint;
    property OnUpdateAction: TioBSOnUpdateAction read GetOnUpdateAction write SetOnUpdateAction default uaSetSmartUpdateStateLess;
    property OnInsertAction: TioOnInsertAction read GetOnInsertAction write SetOnInsertAction default iaSaveRevertPoint;
    property OnRecordChangeAction: TioBSOnRecordChangeAction read GetOnRecordChangeAction write SetOnRecordChangeAction default rcPersistIfChanged;
    property SourceBS: IioBindSource read GetSourceBS write SetSourceBS;
    property WhereBuilderFor: IioMasterBindSource read GetWhereBuilderFor write SetWhereBuilderFor;
    // Published Events: selectors
    property BeforeSelectionObject;
    property OnSelectionObject;
    property AfterSelectionObject;
    property BeforeSelectionInterface;
    property OnSelectionInterface;
    property AfterSelectionInterface;
    // Published properties: selectors
    property OnReceiveSelectionCloneObject;
    property OnReceiveSelectionFreeObject;
    // Events
    property AfterClose;
    property AfterOpen;
    property BeforeClose;
    property BeforeOpen;
    // Published events where builder
    property BeforeWhereBuild: TioBeforeWhereBuilderEvent read FBeforeWhereBuild write FBeforeWhereBuild;
    property BeforeWhereClear: TioBeforeWhereBuilderEvent read FBeforeWhereClear write FBeforeWhereClear;
    property OnWhereBuild: TioOnWhereBuilderEvent read FOnWhereBuild write FOnWhereBuild;
    property OnWhereClear: TioOnWhereBuilderEvent read FOnWhereClear write FOnWhereClear;
    property AfterWhereBuild: TioAfterWhereBuilderEvent read FAfterWhereBuild write FAfterWhereBuild;
    property AfterWhereClear: TioAfterWhereBuilderEvent read FAfterWhereClear write FAfterWhereClear;
    // Published Events: persistence concurrency conflicts
    property OnDeleteConflictException;
    property OnUpdateConflictException;
  end;

implementation

uses
  System.SysUtils, iORM.LiveBindings.BSPersistence.SmartUpdateDetection,
  iORM.LiveBindings.Notification,
  iORM.Where.Factory;

{ TioPrototypeBindSourceMaster }

constructor TioPrototypeBindSourceMaster.Create(AOwner: TComponent);
begin
  inherited;
  LoadType := ltAuto;
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eaSaveRevertPoint;
  FOnUpdateAction := uaSetSmartUpdateStateLess;
  FOnInsertAction := iaSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
  FPersistence := TioBSPersistence.Create(Self);
  FWhereBuilderFor := nil;
end;

destructor TioPrototypeBindSourceMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

function TioPrototypeBindSourceMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioPrototypeBindSourceMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioPrototypeBindSourceMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioPrototypeBindSourceMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioPrototypeBindSourceMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioPrototypeBindSourceMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioPrototypeBindSourceMaster.GetSourceBS: IioBindSource;
begin
  Result := MasterBindSource;
end;

function TioPrototypeBindSourceMaster.GetWhereBuilderFor: IioMasterBindSource;
begin
  Result := FWhereBuilderFor;
end;

function TioPrototypeBindSourceMaster.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioPrototypeBindSourceMaster.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioPrototypeBindSourceMaster.PosChanging(ABindComp: TBasicBindComponent);
begin
  inherited;
  Persistence.NotifyBeforeScroll;
end;

procedure TioPrototypeBindSourceMaster.SetActive(const Value: Boolean);
begin
  inherited;
  // Clear the BSPersistence status
  if Value and not (csDesigning in ComponentState) then
    Persistence.Clear(False);
end;

procedure TioPrototypeBindSourceMaster.SetLoadType(const Value: TioLoadType);
begin
  TioCommonBSBehavior.CheckForSetLoadType(Self, SourceBS, Value);
  inherited;
end;

procedure TioPrototypeBindSourceMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioPrototypeBindSourceMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetSourceBS(const Value: IioBindSource);
begin
  if Value = SourceBS then
    Exit;
  TioCommonBSBehavior.CheckForSetSourceBS(Self, Value, Self.LoadType);
  MasterBindSource := Value;
end;

procedure TioPrototypeBindSourceMaster.SetWhereBuilderFor(const AMasterBS: IioMasterBindSource);
begin
  FWhereBuilderFor := AMasterBS;
end;

function TioPrototypeBindSourceMaster.BuildWhere(const AExecuteOnTarget: Boolean): IioWhere;
begin
  Result := TioCommonBSBehavior.BuildWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereBuild, FOnWhereBuild, FAfterWhereBuild);
end;

function TioPrototypeBindSourceMaster.ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;
begin
  Result := TioCommonBSBehavior.ClearWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereClear, FOnWhereClear, FAfterWhereClear);
end;

end.
