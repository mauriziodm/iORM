unit iORM.StdActions.Vcl;

interface

uses
  Vcl.ActnList, iORM.LiveBindings.BSPersistence, System.Classes;

type

  // Base class for all BinsDourceObjState standard actions
  TioBSPersistenceStdActionVcl = class(Vcl.ActnList.TAction)
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

  TioBSPersistenceSaveRevertPoint = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  TioBSPersistenceClear = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
  end;

  TioBSPersistencePersist = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSPersistenceRevert = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property ClearAfterExecute;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
  end;

  TioBSPersistenceDelete = class(TioBSPersistenceStdActionVcl)
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

implementation

uses
  iORM.AbstractionLayer.Framework, System.SysUtils;

{ TioBSObjStateStdAction }

constructor TioBSPersistenceStdActionVcl.Create(AOwner: TComponent);
begin
  inherited;
  FClearAfterExecute := True;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FDisableIfSaved := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
  FRaiseIfSaved := False;
end;

function TioBSPersistenceStdActionVcl.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and FTargetBindSource.Persistence.IsActive;
end;

procedure TioBSPersistenceStdActionVcl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSPersistenceStdActionVcl.SetTargetBindSource(const Value: IioBSPersistenceClient);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
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
