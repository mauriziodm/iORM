unit iORM.DB.Components.BindSourceObjState.StdActions.VCL;

interface

uses
  Vcl.ActnList, iORM.DB.Components.BindSourceObjState, System.Classes;

type

  // Base class for all BinsDourceObjState standard actions
  TioBSObjStateStdAction = class(Vcl.ActnList.TAction)
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

  TioBSObjStateSave = class(TioBSObjStateStdAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  TioBSObjStateClear = class(TioBSObjStateStdAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
  end;

  TioBSObjStatePersist = class(TioBSObjStateStdAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSObjStateRevert = class(TioBSObjStateStdAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

implementation

uses
  iORM.AbstractionLayer.Framework, System.SysUtils;

{ TioBSObjStateStdAction }

constructor TioBSObjStateStdAction.Create(AOwner: TComponent);
begin
  inherited;
  FClearAfterExecute := True;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
end;

function TioBSObjStateStdAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and FTargetBindSource.ObjState.IsActive;
end;

procedure TioBSObjStateStdAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSObjStateStdAction.SetTargetBindSource(const Value: IioBindSourceObjStateClient);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
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

end.
