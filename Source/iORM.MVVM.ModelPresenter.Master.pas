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
unit iORM.MVVM.ModelPresenter.Master;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.BSPersistence,
  System.Classes, iORM.LiveBindings.Interfaces, iORM.CommonTypes,
  iORM.Where.Interfaces, iORM.LiveBindings.CommonBSBehavior;

type

  TioModelPresenterMaster = class(TioModelPresenterCustom, IioMasterBindSource, IioStdActionTargetMasterBindSource)
  private
    FWannaBeActive: Boolean;
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
    // SourceModelPresenter
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
  protected
    function PostPonedActivation_CanOpen(const ANewDataObject: TObject): Boolean;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean); override;
    procedure SetActive(const Value: Boolean); override;
    // procedure DoBeforeOpen; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
    // procedure DoBeforeScroll; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); override;
    // MasterPresenter
    procedure SetMasterBindSource(const Value: IioBindSource); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open; override;
    procedure Close; override;
    function IsMasterBS: Boolean; override;
    function IsDetailBS: Boolean; override;

    // WhereBuilder
    function BuildWhere(const AExecuteOnTarget: Boolean = True): IioWhere;
    function ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;

    property Active;
    property Where;
    property ItemCount;
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
  iORM.LiveBindings.BSPersistence.SmartUpdateDetection;

{ TioModelPresenterMaster }

procedure TioModelPresenterMaster.Close;
begin
  inherited;
  // Only to make the existing protected method public
end;

constructor TioModelPresenterMaster.Create(AOwner: TComponent);
begin
  inherited;
  FWannaBeActive := False;
  LoadType := ltAuto;
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eaSaveRevertPoint;
  FOnUpdateAction := uaSetSmartUpdateStateLess;
  FOnInsertAction := iaSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
  FPersistence := TioBSPersistence.Create(Self);
  FWhereBuilderFor := nil;
end;

destructor TioModelPresenterMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

function TioModelPresenterMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioModelPresenterMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioModelPresenterMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioModelPresenterMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioModelPresenterMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioModelPresenterMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioModelPresenterMaster.GetSourceBS: IioBindSource;
begin
  Result := MasterBindSource;
end;

function TioModelPresenterMaster.GetWhereBuilderFor: IioMasterBindSource;
begin
  Result := FWhereBuilderFor;
end;

function TioModelPresenterMaster.IsDetailBS: Boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioModelPresenterMaster.IsMasterBS: Boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioModelPresenterMaster.Open;
begin
  inherited;
  // Only to make the existing protected method public
end;

function TioModelPresenterMaster.PostPonedActivation_CanOpen(const ANewDataObject: TObject): Boolean;
begin
  case LoadType of
// Note: Ho commentato queste due righe per risolvere un problema portato a galla da Carlo Marona il 29/09/2022
//        in pratica se in un ModelPresenter con  LoadType = ltManual facevo un SetDataObject mi andava in errore
//        in questo modo funziona.
//    ltManual:
//      Result := FWannaBeActive and ((DataObject <> nil) or (ANewDataObject <> nil));
// Note Mauri 05/01/2024: Ho rimesso le due righe che avevo commentato modificandole perchè altrimenti
//   avevo problemi quando facevo SetDataObject(AObj) con LoadType=ltManual la prima volta (la seconda poi invece andava bene).
//   così sembra andare bene
    ltManual:
      Result := (FWannaBeActive and (DataObject <> nil)) or (ANewDataObject <> nil);
    ltFromBSAsIs .. ltFromBSReloadNewInstance:
      Result := FWannaBeActive and Assigned(SourceBS);
  else
    Result := FWannaBeActive;
  end;
end;

procedure TioModelPresenterMaster.SetActive(const Value: Boolean);
begin
  FWannaBeActive := Value;
  inherited;
end;

procedure TioModelPresenterMaster.SetLoadType(const Value: TioLoadType);
begin
  TioCommonBSBehavior.CheckForSetLoadType(Self, SourceBS, Value);
  inherited;
end;

procedure TioModelPresenterMaster.SetMasterBindSource(const Value: IioBindSource);
begin
  inherited;
  if FWannaBeActive and not Active then
    Open;
end;

procedure TioModelPresenterMaster.SetSourceBS(const Value: IioBindSource);
begin
  if Value = SourceBS then
    Exit;
  TioCommonBSBehavior.CheckForSetSourceBS(Self, Value, Self.LoadType);
  MasterBindSource := Value;
end;

procedure TioModelPresenterMaster.SetWhereBuilderFor(const AMasterBS: IioMasterBindSource);
begin
  FWhereBuilderFor := AMasterBS;
end;

function TioModelPresenterMaster.BuildWhere(const AExecuteOnTarget: Boolean): IioWhere;
begin
  Result := TioCommonBSBehavior.BuildWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereBuild, FOnWhereBuild, FAfterWhereBuild);
end;

function TioModelPresenterMaster.ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;
begin
  Result := TioCommonBSBehavior.ClearWhere(Self, FWhereBuilderFor, AExecuteOnTarget, FBeforeWhereClear, FOnWhereClear, FAfterWhereClear);
end;

procedure TioModelPresenterMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioModelPresenterMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioModelPresenterMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioModelPresenterMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioModelPresenterMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioModelPresenterMaster._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if PostPonedActivation_CanOpen(ADataObject) then
    inherited;
end;

end.
