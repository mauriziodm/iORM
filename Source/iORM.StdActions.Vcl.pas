unit iORM.StdActions.Vcl;

interface

uses
  Vcl.ActnList, iORM.LiveBindings.BSPersistence, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.CommonTypes;

type
  TioStdActionNewInstanceAsObjectEvent = procedure(const ASender: TObject; out NewInstance: TObject) of object;
  TioStdActionNewInstanceAsInterfaceEvent = procedure(const ASender: TObject; out NewInstance: IInterface) of object;

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // Base class for all BindSource standard actions
  TioBSStdActionVcl<T: IioStdActionTargetBindSource> = class(Vcl.ActnList.TAction)
  strict private
    FTargetBindSource: T;
    procedure SetTargetBindSource(const Value: T);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioBSSelectCurrent = class(TioBSStdActionVcl<IioStdActionTargetBindSource>)
  strict private
    FSelectionType: TioSelectionType;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
    property TargetBindSource;
  end;

  // Paging NextPage action
  TioBSNextPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;
  // Paging PreviousPage action
  TioBSPrevPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

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
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
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
    function HandlesTarget(Target: TObject): Boolean; override;
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

  TioBSPersistenceReload = class(TioBSPersistenceStdActionVcl)
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

  TioBSPersistenceAppend = class(TioBSPersistenceStdActionVcl)
  private
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfSaved;
    property TargetBindSource;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSPersistenceInsert = class(TioBSPersistenceStdActionVcl)
  private
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfSaved;
    property TargetBindSource;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  // =================================================================================================
  // ENS: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

implementation

uses
  iORM.Abstraction, System.SysUtils, iORM.Exceptions, iORM.Utilities;

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
  Result := Assigned(Target) and Supports(FTargetBindSource, IioBSPersistenceClient) and FTargetBindSource.isActive;
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
  TargetBindSource.Refresh(True); // Otherwise, in some cases, an outdated value persisted
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

{ TioBSPersistenceReload }

constructor TioBSPersistenceReload.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceReload.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Reload(RaiseIfSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceReload.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanReload;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSaved);
end;

{ TioBSPersistenceAppend }

constructor TioBSPersistenceAppend.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceAppend.ExecuteTarget(Target: TObject);
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
  // New instance as object (OnNewInstanceAsObject event handler)
  if Assigned(FOnNewInstanceAsObject) then
  begin
    FOnNewInstanceAsObject(Self, LNewInstanceAsObject);
    if LNewInstanceAsObject <> nil then
    begin
      TargetBindSource.Persistence.Append(LNewInstanceAsObject, RaiseIfSaved, RaiseIfChangesExists);
      Exit;
    end
    else
      raise EioException.Create(Self.ClassName, 'OnNewInstanceAsObject event handler', 'Invalid new instance (nil)');
  end;
  // New instance as Interface (OnNewInstanceAsInterface event handler)
  if Assigned(FOnNewInstanceAsInterface) then
  begin
    FOnNewInstanceAsInterface(Self, LNewInstanceAsInterface);
    if LNewInstanceAsInterface <> nil then
    begin
      TargetBindSource.Persistence.Append(LNewInstanceAsInterface, RaiseIfSaved, RaiseIfChangesExists);
      Exit;
    end
    else
      raise EioException.Create(Self.ClassName, 'OnNewInstanceAsInterface event handler', 'Invalid new instance (nil)');
  end;
  // New instance not provided (created by the ABSAdapter itself)
  TargetBindSource.Persistence.Append(RaiseIfSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceAppend.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSaved);
end;

{ TioBSPersistenceInsert }

constructor TioBSPersistenceInsert.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceInsert.ExecuteTarget(Target: TObject);
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
  // New instance as object (OnNewInstanceAsObject event handler)
  if Assigned(FOnNewInstanceAsObject) then
  begin
    FOnNewInstanceAsObject(Self, LNewInstanceAsObject);
    if LNewInstanceAsObject <> nil then
    begin
      TargetBindSource.Persistence.Insert(LNewInstanceAsObject, RaiseIfSaved, RaiseIfChangesExists);
      Exit;
    end
    else
      raise EioException.Create(Self.ClassName, 'OnNewInstanceAsObject event handler', 'Invalid new instance (nil)');
  end;
  // New instance as Interface (OnNewInstanceAsInterface event handler)
  if Assigned(FOnNewInstanceAsInterface) then
  begin
    FOnNewInstanceAsInterface(Self, LNewInstanceAsInterface);
    if LNewInstanceAsInterface <> nil then
    begin
      TargetBindSource.Persistence.Insert(LNewInstanceAsInterface, RaiseIfSaved, RaiseIfChangesExists);
      Exit;
    end
    else
      raise EioException.Create(Self.ClassName, 'OnNewInstanceAsInterface event handler', 'Invalid new instance (nil)');
  end;
  // New instance not provided (created by the ABSAdapter itself)
  TargetBindSource.Persistence.Insert(RaiseIfSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceInsert.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSaved);
end;

{ TioBSSelectCurrent }

constructor TioBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FSelectionType := stAppend;
end;

procedure TioBSSelectCurrent.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
end;

procedure TioBSSelectCurrent.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.CanDoSelection;
end;

{ TioBSStdActionVcl<T> }

constructor TioBSStdActionVcl<T>.Create(AOwner: TComponent);
begin
  inherited;
  FTargetBindSource := nil;
end;

function TioBSStdActionVcl<T>.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, TioUtilities.TypeInfoToGUID(TypeInfo(T))) and FTargetBindSource.isActive;
end;

procedure TioBSStdActionVcl<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSStdActionVcl<T>.SetTargetBindSource(const Value: T);
begin
  if @Value <> @FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

{ TioBSNextPage }

procedure TioBSNextPage.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.Paging.NextPage;
end;

procedure TioBSNextPage.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsLastPage;
end;

{ TioBSPreviousPage }

procedure TioBSPrevPage.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.Paging.PrevPage;
end;

procedure TioBSPrevPage.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsFirstPage;
end;

end.
