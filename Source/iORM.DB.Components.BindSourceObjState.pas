unit iORM.DB.Components.BindSourceObjState;

interface

type

  IioBindSourceObjStateClient = interface
    ['{8B930CF9-0EDC-483E-86A2-39C6CFD82D9D}']
    function Current: TObject;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
    procedure PersistCurrent;
  end;

  TioBindSourceObjState = (osUnassigned, osUnsaved, osSaved, osChanged);

  TioBindSourceObjStateManager = class
  private
    FSavedObjState: String;
    FBindSource: IioBindSourceObjStateClient;
    function GetCurrentAsString: String;
    function GetState: TioBindSourceObjState;
    function GetStateAsString: String;
    procedure CheckUnassigned(const AMethodName: String);
  public
    constructor Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
    procedure Save;
    procedure Revert(const ARaiseIfNoChanges: Boolean = False);
    procedure Clear;
    procedure Persist(const ARaiseIfNoChanges: Boolean = False);
    function CanSave: Boolean;
    function CanRevert: Boolean;
    function CanPersist: Boolean;
    function IsChanged: Boolean;
    function IsSaved: Boolean;
    property SavedObjState: string read FSavedObjState;
    property State: TioBindSourceObjState read GetState;
    property StateAsString: string read GetStateAsString;
  end;

implementation

uses
  ObjMapper, iORM.Exceptions, System.SysUtils, iORM.Utilities;

{ TioBindSourceObjState }

function TioBindSourceObjStateManager.CanPersist: Boolean;
begin
  Result := GetState >= osChanged;
end;

function TioBindSourceObjStateManager.CanRevert: Boolean;
begin
  Result := GetState >= osChanged;
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

procedure TioBindSourceObjStateManager.Clear;
begin
  FSavedObjState := '';
end;

constructor TioBindSourceObjStateManager.Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
begin
  inherited Create;
  FBindSource := ABindSourceObjStateClient;
  Clear;
end;

function TioBindSourceObjStateManager.IsChanged: Boolean;
begin
  Result := GetState = osChanged;
end;

function TioBindSourceObjStateManager.IsSaved: Boolean;
begin
  Result := GetState > osUnsaved;
end;

function TioBindSourceObjStateManager.GetState: TioBindSourceObjState;
begin
  if FBindSource.Current = nil then
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
  Result := TioUtilities.EnumToString<TioBindSourceObjState>(State);
end;

procedure TioBindSourceObjStateManager.Persist(const ARaiseIfNoChanges: Boolean = False);
begin
  CheckUnassigned('Persist');
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Persist', 'There are''t changes to persist');
  FBindSource.PersistCurrent;
end;

procedure TioBindSourceObjStateManager.Revert(const ARaiseIfNoChanges: Boolean = False);
begin
  CheckUnassigned('Revert');
  if State < osSaved then
    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There isn''t a saved state you can revert to. (call "Save" method before)');
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There where no changes');
  om.FromJSON(FSavedObjState).TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
  Clear;
  FBindSource.Refresh(False);
end;

procedure TioBindSourceObjStateManager.Save;
begin
  CheckUnassigned('Save');
  if State > osUnsaved then
    raise EioBindSourceObjStateException.Create(ClassName, 'Save', 'A previously saved state exists, it must be cleared before (Persist, Revert or Clear)');
  FSavedObjState := GetCurrentAsString
end;

function TioBindSourceObjStateManager.GetCurrentAsString: String;
begin
  if FBindSource.Current <> nil then
    Result := om.From(FBindSource.Current).TypeAnnotationsON.ToString
  else
    Result := '';
end;

end.
