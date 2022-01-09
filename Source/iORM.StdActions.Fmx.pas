unit iORM.StdActions.Fmx;

interface

uses
  FMX.ActnList, iORM.LiveBindings.BSPersistence, System.Classes,
  iORM.LiveBindings.Interfaces;

type

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // Base class for all BindSource standard actions
  TioBSStdActionFmx = class(FMX.ActnList.TAction)
  strict private
    FTargetBindSource: IioStdActionTargetBindSource;
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property TargetBindSource: IioStdActionTargetBindSource read FTargetBindSource write SetTargetBindSource;
  end;

//  TioBSMakeSelection = class(TioBSStdActionFmx)
//  public
//    procedure ExecuteTarget(Target: TObject); override;
//    procedure UpdateTarget (Target: TObject); override;
//  published
//    property TargetBindSource;
//  end;

  // =================================================================================================
  // END: FMX STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES WITH OBJSTATE MANAGER (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // Base class for all BinsDourceObjState standard actions
  TioBSPersistenceStdActionFmx = class(FMX.ActnList.TAction)
  strict private
    FClearAfterExecute: Boolean;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FDisableIfSaved: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FRaiseIfSaved: Boolean;
    FTargetBindSource: IioBSPersistenceClient;
    procedure SetTargetBindSource(const Value: IioBSPersistenceClient);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property ClearAfterExecute: Boolean read FClearAfterExecute write FClearAfterExecute default True;
    property DisableIfChangesDoesNotExists: Boolean read FDisableIfChangesDoesNotExists write FDisableIfChangesDoesNotExists default False;
    property DisableIfChangesExists: Boolean read FDisableIfChangesExists write FDisableIfChangesExists default False;
    property DisableIfSaved: Boolean read FDisableIfSaved write FDisableIfSaved default False;
    property RaiseIfChangesDoesNotExists: Boolean read FRaiseIfChangesDoesNotExists write FRaiseIfChangesDoesNotExists default False;
    property RaiseIfChangesExists: Boolean read FRaiseIfChangesExists write FRaiseIfChangesExists default True;
    property RaiseIfSaved: Boolean read FRaiseIfSaved write FRaiseIfSaved default False;
    property TargetBindSource: IioBSPersistenceClient read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSPersistenceSaveRevertPoint = class(TioBSPersistenceStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  TioBSPersistenceClear = class(TioBSPersistenceStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
  end;

  TioBSPersistencePersist = class(TioBSPersistenceStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSPersistenceRevert = class(TioBSPersistenceStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSPersistenceDelete = class(TioBSPersistenceStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfSaved;
    property TargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES WITH OBJSTATE MANAGER (MASTER BIND SOURCES ONLY)
  // =================================================================================================

implementation

uses
  iORM.AbstractionLayer.Framework;

{ TioBSObjStateStdActionFmx }

constructor TioBSPersistenceStdActionFmx.Create(AOwner: TComponent);
begin
  inherited;
  FClearAfterExecute := True;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
  FRaiseIfSaved := False;
end;

function TioBSPersistenceStdActionFmx.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and FTargetBindSource.Persistence.IsActive;
end;

procedure TioBSPersistenceStdActionFmx.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSPersistenceStdActionFmx.SetTargetBindSource(const Value: IioBSPersistenceClient);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

{ TioBSObjStateSave }

procedure TioBSPersistenceSaveRevertPoint.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.SaveRevertPoint(True);
end;

procedure TioBSPersistenceSaveRevertPoint.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanSave;
end;

{ TioBSObjStateClear }

procedure TioBSPersistenceClear.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Clear(RaiseIfChangesExists);
end;

procedure TioBSPersistenceClear.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanClear;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStatePersist }

procedure TioBSPersistencePersist.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Persist(RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSPersistencePersist.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanPersist;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStateRevert }

procedure TioBSPersistenceRevert.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Revert(RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSPersistenceRevert.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevert;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSStdActionFmx }

function TioBSStdActionFmx.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and FTargetBindSource.isActive;
end;

procedure TioBSStdActionFmx.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSStdActionFmx.SetTargetBindSource(const Value: IioStdActionTargetBindSource);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

{ TioBSPersistenceDelete }

constructor TioBSPersistenceDelete.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceDelete.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Delete(RaiseIfSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceDelete.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanDelete;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSaved);
end;

end.
