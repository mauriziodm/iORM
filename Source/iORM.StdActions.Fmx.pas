unit iORM.StdActions.Fmx;

interface

uses
  FMX.ActnList, iORM.DB.Components.BindSourceObjState, System.Classes,
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
  TioBSObjStateStdActionFmx = class(FMX.ActnList.TAction)
  strict private
    FClearAfterExecute: Boolean;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FTargetBindSource: IioBindSourceObjStateClient;
    procedure SetTargetBindSource(const Value: IioBindSourceObjStateClient);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property ClearAfterExecute: Boolean read FClearAfterExecute write FClearAfterExecute default True;
    property DisableIfChangesDoesNotExists: Boolean read FDisableIfChangesDoesNotExists write FDisableIfChangesDoesNotExists default False;
    property DisableIfChangesExists: Boolean read FDisableIfChangesExists write FDisableIfChangesExists default False;
    property RaiseIfChangesDoesNotExists: Boolean read FRaiseIfChangesDoesNotExists write FRaiseIfChangesDoesNotExists default False;
    property RaiseIfChangesExists: Boolean read FRaiseIfChangesExists write FRaiseIfChangesExists default True;
    property TargetBindSource: IioBindSourceObjStateClient read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSObjStateSave = class(TioBSObjStateStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  TioBSObjStateClear = class(TioBSObjStateStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
  end;

  TioBSObjStatePersist = class(TioBSObjStateStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSObjStateRevert = class(TioBSObjStateStdActionFmx)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES WITH OBJSTATE MANAGER (MASTER BIND SOURCES ONLY)
  // =================================================================================================

implementation

uses
  iORM.AbstractionLayer.Framework;

{ TioBSObjStateStdActionFmx }

constructor TioBSObjStateStdActionFmx.Create(AOwner: TComponent);
begin
  inherited;
  FClearAfterExecute := True;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
end;

function TioBSObjStateStdActionFmx.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and FTargetBindSource.ObjState.IsActive;
end;

procedure TioBSObjStateStdActionFmx.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSObjStateStdActionFmx.SetTargetBindSource(const Value: IioBindSourceObjStateClient);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

{ TioBSObjStateSave }

procedure TioBSObjStateSave.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.ObjState.Save(True);
end;

procedure TioBSObjStateSave.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.ObjState.CanSave;
end;

{ TioBSObjStateClear }

procedure TioBSObjStateClear.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.ObjState.Clear(RaiseIfChangesExists);
end;

procedure TioBSObjStateClear.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.ObjState.CanClear;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.ObjState.IsChanged);
end;

{ TioBSObjStatePersist }

procedure TioBSObjStatePersist.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.ObjState.Persist(RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSObjStatePersist.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.ObjState.CanPersist;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.ObjState.IsChanged);
end;

{ TioBSObjStateRevert }

procedure TioBSObjStateRevert.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.ObjState.Revert(RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSObjStateRevert.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.ObjState.CanRevert;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.ObjState.IsChanged);
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

end.
