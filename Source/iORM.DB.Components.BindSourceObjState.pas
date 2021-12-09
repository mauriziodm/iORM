unit iORM.DB.Components.BindSourceObjState;

interface

type

  TioBindSourceObjStateManager = class;

  IioBindSourceObjStateClient = interface
    ['{8B930CF9-0EDC-483E-86A2-39C6CFD82D9D}']
    function Current: TObject;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
    procedure PersistCurrent;
    function IsActive: Boolean;
    // ObjState property
    function GetObjState: TioBindSourceObjStateManager;
    property ObjState: TioBindSourceObjStateManager read GetObjState;
  end;

  TioBSObjState = (osUnassigned, osUnsaved, osSaved, osChanged);
  TioBSOnRecordChangeAction = (rcDoNothing, rcPersistIfChanged, rcPersistAlways, rcAbortIfChanged, rcAbortAlways);

  TioBindSourceObjStateManager = class
  private
    FSavedObjState: String;
    FBindSource: IioBindSourceObjStateClient;
    function GetCurrentAsString: String;
    function GetState: TioBSObjState;
    function GetStateAsString: String;
    procedure CheckUnassigned(const AMethodName: String);
  public
    constructor Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
    procedure Save(const ARaiseIfAlreadySaved: Boolean = True);
    procedure Revert(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
    procedure Clear(const ARaiseIfChangesExists: Boolean = True);
    procedure Persist(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
    function CanSave: Boolean;
    function CanRevert: Boolean;
    function CanPersist: Boolean;
    function CanClear: Boolean;
    function IsActive: Boolean;
    function IsChanged: Boolean;
    function IsSaved: Boolean;
    function IsClear: Boolean;
    procedure NotifyRecordChange(const AAction: TioBSOnRecordChangeAction);
    procedure NotifyDelete;
    property SavedObjState: string read FSavedObjState;
    property State: TioBSObjState read GetState;
    property StateAsString: string read GetStateAsString;
  end;

implementation

uses
  ObjMapper, iORM.Exceptions, System.SysUtils, iORM.Utilities;

{ TioBindSourceObjState }

function TioBindSourceObjStateManager.CanClear: Boolean;
begin
  Result := GetState > osUnsaved;
end;

function TioBindSourceObjStateManager.CanPersist: Boolean;
begin
  Result := GetState >= osSaved;
end;

function TioBindSourceObjStateManager.CanRevert: Boolean;
begin
  Result := GetState >= osSaved;
end;

function TioBindSourceObjStateManager.CanSave: Boolean;
begin
  Result := GetState = osUnsaved;
end;

procedure TioBindSourceObjStateManager.CheckUnassigned(const AMethodName: String);
begin
  if State = osUnassigned then
    raise EioBindSourceObjStateException.Create(ClassName, AMethodName, 'Unassigned current object (maybe the bindsource is not active or empty)');
end;

procedure TioBindSourceObjStateManager.Clear(const ARaiseIfChangesExists: Boolean);
begin
  if ARaiseIfChangesExists and (State > osSaved) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Clear', 'Pending changes exists');
  FSavedObjState := '';
end;

constructor TioBindSourceObjStateManager.Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
begin
  inherited Create;
  FBindSource := ABindSourceObjStateClient;
  Clear(False);
end;

function TioBindSourceObjStateManager.IsActive: Boolean;
begin
  Result := GetState > osUnassigned;
end;

function TioBindSourceObjStateManager.IsChanged: Boolean;
begin
  Result := GetState = osChanged;
end;

function TioBindSourceObjStateManager.IsClear: Boolean;
begin
  Result := GetState = osUnsaved;
end;

function TioBindSourceObjStateManager.IsSaved: Boolean;
begin
  Result := GetState > osUnsaved;
end;

procedure TioBindSourceObjStateManager.NotifyDelete;
begin
  Clear(False);
end;

procedure TioBindSourceObjStateManager.NotifyRecordChange(const AAction: TioBSOnRecordChangeAction);
begin
  if ((AAction = rcPersistAlways) and IsSaved) or ((AAction = rcPersistIfChanged) and IsChanged) then
    Persist
  else
  if ((AAction = rcAbortAlways) and IsSaved) or ((AAction = rcAbortIfChanged) and IsChanged) then
    Abort
  else
  if IsSaved then
    Clear(False);
end;

function TioBindSourceObjStateManager.GetState: TioBSObjState;
begin
  if (FBindSource = nil) or (not FBindSource.IsActive) or (FBindSource.Current = nil) then
    Result := osUnassigned
  else
  if FSavedObjState.IsEmpty then
    Result := osUnsaved
  else if GetCurrentAsString <> FSavedObjState then
    Result := osChanged
  else
    Result := osSaved;
end;

function TioBindSourceObjStateManager.GetStateAsString: String;
begin
  Result := TioUtilities.EnumToString<TioBSObjState>(State);
end;

procedure TioBindSourceObjStateManager.Persist(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
begin
  CheckUnassigned('Persist');
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Persist', 'There are''t changes to persist');
  FBindSource.PersistCurrent;
  if AClear then
    Clear(False);
end;

procedure TioBindSourceObjStateManager.Revert(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
begin
  CheckUnassigned('Revert');
  if State < osSaved then
    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There isn''t a saved state you can revert to. (call "Save" method before)');
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There where no changes');
  om.FromJSON(FSavedObjState).byFields.TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
  if AClear then
    Clear(False);
  FBindSource.Refresh(False);
end;

procedure TioBindSourceObjStateManager.Save(const ARaiseIfAlreadySaved: Boolean);
begin
  CheckUnassigned('Save');
  if ARaiseIfAlreadySaved and (State > osUnsaved) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Save', 'A previously saved state exists, it must be cleared before (Persist, Revert or Clear)');
  FSavedObjState := GetCurrentAsString
end;

function TioBindSourceObjStateManager.GetCurrentAsString: String;
begin
  if FBindSource.Current <> nil then
    Result := om.From(FBindSource.Current).byFields.TypeAnnotationsON.ToString
  else
    Result := '';
end;

end.
