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
unit iORM.DB.DataSet.Master;

interface

uses
  iORM.DB.DataSet.Custom, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.BSPersistence, System.Classes, iORM.CommonTypes, iORM,
  iORM.LiveBindings.CommonBSBehavior;

type

  TioDataSetMaster = class(TioDataSetCustom, IioBSPersistenceClient, IioStdActionTargetMasterBindSource)
  private
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnUpdateAction: TioBSOnUpdateAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    FOnInsertAction: TioOnInsertAction;
    FWhereBuilderFor: IioBSPersistenceClient;
    // Events
    FBeforeWhereBuild: TioBeforeWhereBuilderEvent;
    FBeforeWhereClear: TioBeforeWhereBuilderEvent;
    FOnWhereBuild: TioOnWhereBuilderEvent;
    FOnWhereClear: TioOnWhereBuilderEvent;
    FAfterWhereBuild: TioAfterWhereBuilderEvent;
    FAfterWhereClear: TioAfterWhereBuilderEvent;
    // SourceDataSet
    function GetSourceBS: IioNotifiableBindSource;
    procedure SetSourceBS(const Value: IioNotifiableBindSource);
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
  protected
    procedure DoBeforeOpen; override;  // In TioPrototypeBindSourceMaster is SetActive but here is DoBeforeOpen, DoAfterOpen and DoBeforeClose
    procedure DoBeforeScroll; override;  // In TioPrototypeBindSourceMaster is PosChanging but here is DoBeforeScroll
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
    property ItemIndex;
    // Added properties
    property Persistence: TioBSPersistence read GetPersistence;
  published
    property AsDefault; // non mettere default
    property TypeName;
    property TypeAlias;
    property Async default False;
    property LoadType default ltAuto;
    property Lazy default False;
    property LazyProps;
    property TypeOfCollection; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr; // published: Master
    property OrderBy;
    property AutoRefreshOnNotification default True;
    property VirtualFields;
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
    property SourceBS: IioNotifiableBindSource read GetSourceBS write SetSourceBS;
    property WhereBuilderFor: IioBSPersistenceClient read FWhereBuilderFor write FWhereBuilderFor;
    // Published Events: selectors
    property BeforeSelectionObject;
    property OnSelectionObject;
    property AfterSelectionObject;
    property BeforeSelectionInterface;
    property OnSelectionInterface;
    property AfterSelectionInterface;
    property OnReceiveSelectionCloneObject;
    property OnReceiveSelectionFreeObject;
    // Published events
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
  end;

implementation

uses
  System.SysUtils, iORM.LiveBindings.BSPersistence.SmartUpdateDetection,
  iORM.LiveBindings.Notification;

{ TioDataSetMaster }

constructor TioDataSetMaster.Create(AOwner: TComponent);
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

destructor TioDataSetMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

procedure TioDataSetMaster.DoBeforeOpen;
begin
  inherited;
  // Clear the BSPersistence status
  Persistence.Clear(False);
end;

procedure TioDataSetMaster.DoBeforeScroll;
begin
  inherited;
  Persistence.NotifyBeforeScroll;
end;

function TioDataSetMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioDataSetMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioDataSetMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioDataSetMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioDataSetMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioDataSetMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioDataSetMaster.GetSourceBS: IioNotifiableBindSource;
begin
  Result := MasterBindSource;
end;

function TioDataSetMaster.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioDataSetMaster.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioDataSetMaster.SetLoadType(const Value: TioLoadType);
begin
  TioCommonBSBehavior.CheckForSetLoadType(Self, SourceBS, Value);
  inherited;
end;

procedure TioDataSetMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioDataSetMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioDataSetMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioDataSetMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioDataSetMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioDataSetMaster.SetSourceBS(const Value: IioNotifiableBindSource);
begin
  if Value = SourceBS then
    Exit;
  TioCommonBSBehavior.CheckForSetSourceBS(Self, Value, Self.LoadType);
  MasterBindSource := Value;
end;

function TioDataSetMaster.BuildWhere(const AExecuteOnTarget: Boolean): IioWhere;
begin
  Result := TioCommonBSBehavior.BuildWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereBuild, FOnWhereBuild, FAfterWhereBuild);
end;

function TioDataSetMaster.ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;
begin
  Result := TioCommonBSBehavior.ClearWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereClear, FOnWhereClear, FAfterWhereClear);
end;

end.
