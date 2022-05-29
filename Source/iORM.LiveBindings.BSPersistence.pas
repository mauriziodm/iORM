unit iORM.LiveBindings.BSPersistence;

interface

uses
  iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.BSPersistence.SmartDeleteSystem,
  iORM.LiveBindings.BSPersistence.SmartUpdateDetection,
  ObjMapper.Attributes, iORM.CommonTypes;

type

  TioBSPersistenceState = (osUnassigned, osUnsaved, osSaved, osChanged);
  TioBSOnRecordChangeAction = (rcDoNothing, rcPersistIfChanged, rcPersistAlways, rcAbortIfChanged, rcAbortAlways);
  TioBSOnEditAction = (eaDoNothing, eaSaveRevertPoint, eaAbortIfNotSaved);
  TioBSOnDeleteAction = (daDoNothing, daSetObjStatusIfExists, daSetSmartDeleteSystem);
  TioBSOnUpdateAction = (uaDoNothing, uaSetObjStatusIfExists, uaSetSmartUpdateStateLess, uaSetSmartUpdateStateFull);
  TioOnInsertAction = (iaDoNothing, iaSaveRevertPoint);

  TioBSPersistence = class;

  IioBSPersistenceClient = interface
    ['{8B930CF9-0EDC-483E-86A2-39C6CFD82D9D}']
    function Current: TObject;
    procedure Delete;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function IsActive: Boolean;
    procedure PersistCurrent;
    procedure Refresh(const ANotify: Boolean = True);
    procedure ClearDataObject;
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    procedure Insert; overload;
    procedure Insert(AObject: TObject); overload;
    procedure Insert(AObject: IInterface); overload;
    function GetName: String;
    function IsFromBSLoadType: boolean;
    function GetSourceBSAsNotifiableBindSource: IioNotifiableBindSource;
    // LoadType property
    procedure SetLoadType(const Value: TioLoadType);
    function GetLoadType: TioLoadType;
    property LoadType: TioLoadType read GetLoadType write SetLoadType;
    // Persistence property
    function GetPersistence: TioBSPersistence;
    property Persistence: TioBSPersistence read GetPersistence;
    // OnDeleteAction property
    function GetOnDeleteAction: TioBSOnDeleteAction;
    procedure SetOnDeleteAction(const Value: TioBSOnDeleteAction);
    property OnDeleteAction: TioBSOnDeleteAction read GetOnDeleteAction write SetOnDeleteAction;
    // OnEditAction property
    // ObjState property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction;
    // OnUpdateAction property
    function GetOnUpdateAction: TioBSOnUpdateAction;
    procedure SetOnUpdateAction(const Value: TioBSOnUpdateAction);
    property OnUpdateAction: TioBSOnUpdateAction read GetOnUpdateAction write SetOnUpdateAction;
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
    property OnRecordChangeAction: TioBSOnRecordChangeAction read GetOnRecordChangeAction write SetOnRecordChangeAction;
    // OnInsertAction property
    function GetOnInsertAction: TioOnInsertAction;
    procedure SetOnInsertAction(const Value: TioOnInsertAction);
    property OnInsertAction: TioOnInsertAction read GetOnInsertAction write SetOnInsertAction;
    // MasterDataSet (SourceBS) property
//    property MasterDataSet: TioMasterDataSet read GetMasterDataSet write SetMasterDataSet; // published: Detail
  end;

  TioBSPersistence = class
  private
    [DoNotSerializeAttribute]
    FBindSource: IioBSPersistenceClient;
    [DoNotSerializeAttribute]
    FSavedState: String;
    FSmartDeleteSystem: TioSmartDeleteSystem;
    FSmartUpdateDetection: IioSmartUpdateDetection;
    FIsInserting: Boolean;
    function GetCurrentAsString: String;
    function GetState: TioBSPersistenceState;
    function GetStateAsString: String;
    procedure CheckUnassigned(const AMethodName: String);
    procedure CheckRaiseIfSavedOrChengesExists(const AMethodName: String; const ARaiseIfSaved, ARaiseIfChangesExists: Boolean);
    procedure _InternalRevert(const ARaiseIfRevertPointNotSaved: Boolean; const ARaiseIfNoChanges: Boolean);
    procedure _InternalRevertWhenFromBSLoadType(const ARaiseIfRevertPointNotSaved: Boolean; const ARaiseIfNoChanges: Boolean);
  public
    constructor Create(const ABSPersistenceClient: IioBSPersistenceClient);
    destructor Destroy; override;
    procedure SaveRevertPoint(const ARaiseIfAlreadySaved: Boolean = True);
    procedure Revert(const ARaiseIfRevertPointNotSaved: Boolean = False; const ARaiseIfNoChanges: Boolean = False);
    procedure Clear(const ARaiseIfChangesExists: Boolean = True);
    procedure Persist(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
    procedure Delete(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure Reload(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure Append(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    procedure Append(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    procedure Append(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    procedure Insert(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    procedure Insert(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    procedure Insert(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False); overload;
    function CanAppend: Boolean;
    function CanAppendDetail: Boolean;
    function CanInsert: Boolean;
    function CanInsertDetail: Boolean;
    function CanPersist: Boolean;
    function CanClear: Boolean;
    function CanDelete: Boolean;
    function CanDeleteDetail: Boolean;
    function CanReceiveSelection: Boolean;
    function CanReload: Boolean;
    function CanRevert: Boolean;
    function CanSave: Boolean;
    function IsActive: Boolean;
    function IsChanged: Boolean;
    function IsSaved: Boolean;
    function IsClear: Boolean;
    function IsSmartUpdateDetectionEnabled: Boolean;
    function IsInserting: Boolean;
    function IsAppending: Boolean;
    procedure NotifyBeforeScroll;
    procedure NotifySaveRevertPoint;
    property SavedObjState: string read FSavedState;
    property SmartDeleteSystem: TioSmartDeleteSystem read FSmartDeleteSystem;
    property SmartUpdateDetection: IioSmartUpdateDetection read FSmartUpdateDetection write FSmartUpdateDetection;
    property State: TioBSPersistenceState read GetState;
    property StateAsString: string read GetStateAsString;
  end;

implementation

uses
  ObjMapper, iORM.Exceptions, System.SysUtils, iORM.Utilities,
  iORM.LiveBindings.CommonBSAPersistence;

{ TioBindSourceObjState }

procedure TioBSPersistence.Append(const ARaiseIfSaved: Boolean; const ARaiseIfChangesExists: Boolean);
begin
  CheckUnassigned('Append');
  CheckRaiseIfSavedOrChengesExists('Append', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Append;
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

procedure TioBSPersistence.Append(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Append');
  CheckRaiseIfSavedOrChengesExists('Append', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Append(AObject);
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

procedure TioBSPersistence.Append(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Append');
  CheckRaiseIfSavedOrChengesExists('Append', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Append(AObject);
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

function TioBSPersistence.CanAppend: Boolean;
begin
  Result := CanInsert;
end;

function TioBSPersistence.CanAppendDetail: Boolean;
begin
  Result := CanInsertDetail;
end;

function TioBSPersistence.CanClear: Boolean;
begin
  Result := GetState > osUnsaved;
end;

function TioBSPersistence.CanDelete: Boolean;
begin
  Result := GetState >= osUnassigned;
end;

function TioBSPersistence.CanDeleteDetail: Boolean;
begin
  Result := (GetState >= osSaved) or (FBindSource.OnEditAction < eaAbortIfNotSaved);
end;

function TioBSPersistence.CanReceiveSelection: Boolean;
begin
  Result := (GetState >= osSaved) or (FBindSource.OnEditAction < eaAbortIfNotSaved);
end;

function TioBSPersistence.CanInsert: Boolean;
begin
  Result := GetState >= osUnassigned;
end;

function TioBSPersistence.CanInsertDetail: Boolean;
begin
  Result := (GetState >= osSaved) or (FBindSource.OnEditAction < eaAbortIfNotSaved);
end;

function TioBSPersistence.CanPersist: Boolean;
begin
  Result := GetState >= osSaved;
end;

function TioBSPersistence.CanReload: Boolean;
begin
  Result := GetState >= osUnassigned;
end;

function TioBSPersistence.CanRevert: Boolean;
begin
  Result := GetState >= osSaved;
end;

function TioBSPersistence.CanSave: Boolean;
begin
  Result := GetState = osUnsaved;
end;

procedure TioBSPersistence.CheckRaiseIfSavedOrChengesExists(const AMethodName: String; const ARaiseIfSaved, ARaiseIfChangesExists: Boolean);
begin
  if ARaiseIfSaved and (State > osUnsaved) then
    raise EioBindSourceObjStateException.Create(ClassName, AMethodName, 'A previously saved revert point exists, it must be cleared before');
  if ARaiseIfChangesExists and (State > osSaved) then
    raise EioBindSourceObjStateException.Create(ClassName, AMethodName, 'Pending changes exists');
end;

procedure TioBSPersistence.CheckUnassigned(const AMethodName: String);
begin
  if State = osUnassigned then
    raise EioBindSourceObjStateException.Create(ClassName, AMethodName, 'Unassigned current object (maybe the bindsource is not active or empty)');
end;

procedure TioBSPersistence.Clear(const ARaiseIfChangesExists: Boolean);
begin
  if ARaiseIfChangesExists and (State > osSaved) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Clear', 'Pending changes exists');
  FSavedState := '';
  FIsInserting := False;
  FSmartDeleteSystem.Clear;
  if Assigned(FSmartUpdateDetection) then
    FSmartUpdateDetection.Clear;
end;

constructor TioBSPersistence.Create(const ABSPersistenceClient: IioBSPersistenceClient);
begin
  inherited Create;
  FBindSource := ABSPersistenceClient;
  FSmartDeleteSystem := TioSmartDeleteSystem.Create;
  FSmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(False);
  Clear(False);
end;

procedure TioBSPersistence.Delete(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Delete');
  CheckRaiseIfSavedOrChengesExists('Delete', ARaiseIfSaved, ARaiseIfChangesExists);
  TioCommonBSAPersistence.BSPersistenceDelete(FBindSource);
end;

destructor TioBSPersistence.Destroy;
begin
  FSmartDeleteSystem.Free;
  inherited;
end;

procedure TioBSPersistence.Insert(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Insert');
  CheckRaiseIfSavedOrChengesExists('Insert', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Insert;
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

procedure TioBSPersistence.Insert(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Insert');
  CheckRaiseIfSavedOrChengesExists('Insert', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Insert(AObject);
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

procedure TioBSPersistence.Insert(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
begin
  CheckUnassigned('Insert');
  CheckRaiseIfSavedOrChengesExists('Insert', ARaiseIfSaved, ARaiseIfChangesExists);
  NotifyBeforeScroll; // Check if you can leave the current record
  FBindSource.Insert(AObject);
  FBindSource.Refresh; // Otherwise in some cases (insert / append without object) with the datasets it was not displayed
  if FBindSource.OnInsertAction = iaSaveRevertPoint then
  begin
    SaveRevertPoint;
    FIsInserting := True;
  end;
end;

function TioBSPersistence.IsActive: Boolean;
begin
  Result := GetState > osUnassigned;
end;

function TioBSPersistence.IsAppending: Boolean;
begin
  Result := FIsInserting;
end;

function TioBSPersistence.IsChanged: Boolean;
begin
  Result := GetState = osChanged;
end;

function TioBSPersistence.IsClear: Boolean;
begin
  Result := GetState = osUnsaved;
end;

function TioBSPersistence.IsInserting: Boolean;
begin
  Result := (FBindSource.Current <> nil) and (FIsInserting or (TioUtilities.ExtractOID(FBindSource.Current) = 0));
end;

function TioBSPersistence.IsSaved: Boolean;
begin
  Result := GetState > osUnsaved;
end;

function TioBSPersistence.IsSmartUpdateDetectionEnabled: Boolean;
begin
  Result := FBindSource.OnUpdateAction >= uaSetSmartUpdateStateLess;
end;

procedure TioBSPersistence.NotifySaveRevertPoint;
begin
  if (FBindSource.OnEditAction = eaSaveRevertPoint) and IsClear then
    SaveRevertPoint
  else if (FBindSource.OnEditAction = eaAbortIfNotSaved) and IsClear then
    Abort;
end;

procedure TioBSPersistence.NotifyBeforeScroll;
begin
  if ((FBindSource.OnRecordChangeAction = rcPersistAlways) and IsSaved) or ((FBindSource.OnRecordChangeAction = rcPersistIfChanged) and IsChanged) then
    Persist
  else if ((FBindSource.OnRecordChangeAction = rcAbortAlways) and IsSaved) or ((FBindSource.OnRecordChangeAction = rcAbortIfChanged) and IsChanged) then
    Abort
  else if IsSaved then
    Clear(False);
end;

function TioBSPersistence.GetState: TioBSPersistenceState;
begin
  if (FBindSource = nil) or (not FBindSource.IsActive) or (FBindSource.Current = nil) then
    Result := osUnassigned
  else if FSavedState.IsEmpty then
    Result := osUnsaved
  else if GetCurrentAsString <> FSavedState then
    Result := osChanged
  else
    Result := osSaved;
end;

function TioBSPersistence.GetStateAsString: String;
begin
  Result := TioUtilities.EnumToString<TioBSPersistenceState>(State);
end;

procedure TioBSPersistence.Persist(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
begin
  CheckUnassigned('Persist');
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Persist', 'There are''t changes to persist');
  FBindSource.PersistCurrent;
  if AClear then
    Clear(False);
end;

procedure TioBSPersistence.Reload(const ARaiseIfSaved: Boolean; const ARaiseIfChangesExists: Boolean);
begin
  // Reload from a bind source is possible only is ALoadType is NOT set to ftManual
  if FBindSource.LoadType = ltManual then
    raise EioException.Create(ClassName, 'Reload',
      Format('Invoking the "Reload" method is NOT allowed if the "LoadType" property is set to "ltManual".'#13#13'Please set the property "LoadType" of the bind source "%s" (maybe a DataSet or BindSource) to a value other than "ltManual" and try again.',
      [FBindSource.GetName]));
  CheckUnassigned('Reload');
  CheckRaiseIfSavedOrChengesExists('Reload', ARaiseIfSaved, ARaiseIfChangesExists);
  FBindSource.GetActiveBindSourceAdapter.Reload;
  Clear(ARaiseIfChangesExists);
end;

// --- OLD CODE ---
//procedure TioBSPersistence.Revert(const ARaiseIfNoChanges: Boolean = False; const AClear: Boolean = True);
//begin
//  CheckUnassigned('Revert');
//  if State < osSaved then
//    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There isn''t a saved state you can revert to. (call "Save" method before)');
//  if ARaiseIfNoChanges and (State < osChanged) then
//    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There where no changes');
//  if IsInserting then
//    Delete
//  else
//    om.FromJSON(FSavedState).byFields.TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
//  if AClear then
//    Clear(False);
//  FBindSource.Refresh(True);
//end;
// --- OLD CODE ---
procedure TioBSPersistence.Revert(const ARaiseIfRevertPointNotSaved: Boolean = False; const ARaiseIfNoChanges: Boolean = False);
begin
  CheckUnassigned('Revert');
  if FBindSource.IsFromBSLoadType then
    _InternalRevertWhenFromBSLoadType(ARaiseIfRevertPointNotSaved, ARaiseIfNoChanges)
  else
  if IsInserting then
    Delete
  else
    _InternalRevert(ARaiseIfRevertPointNotSaved, ARaiseIfNoChanges);
  Clear(False);
  FBindSource.Refresh(True);
end;

procedure TioBSPersistence.SaveRevertPoint(const ARaiseIfAlreadySaved: Boolean);
begin
  CheckUnassigned('Save');
  if ARaiseIfAlreadySaved and (State > osUnsaved) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Save', 'A previously saved revert point exists, it must be cleared before');
  FSavedState := GetCurrentAsString
end;

procedure TioBSPersistence._InternalRevert(const ARaiseIfRevertPointNotSaved: Boolean; const ARaiseIfNoChanges: Boolean);
begin
  if State < osSaved then
  begin
    if ARaiseIfRevertPointNotSaved then
      raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There isn''t a saved state you can revert to. (call "Save" method before)')
    else
      Exit;
  end;
  if ARaiseIfNoChanges and (State < osChanged) then
    raise EioBindSourceObjStateException.Create(ClassName, 'Revert', 'There where no changes');
  om.FromJSON(FSavedState).byFields.TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
end;

procedure TioBSPersistence._InternalRevertWhenFromBSLoadType(const ARaiseIfRevertPointNotSaved: Boolean; const ARaiseIfNoChanges: Boolean);
var
  LSourceBS: IioNotifiableBindSource;
begin
  if IsInserting then
  begin
    LSourceBS := FBindSource.GetSourceBSAsNotifiableBindSource;
    if not Assigned(LSourceBS) then
      raise EioException.Create(ClassName, '_InternalRevertWhenFromBSLoadType',
        Format('In component "%s" the "LoadType" property has been set to one of this values ("ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance") but the "SourceXXX" property (maybe SourceDataSet, SourcePBS or SourcePresenter) has been left blank.'
        + #13#13'iORM is therefore unable to continue.'#13#13'Please set the "SourceXXX" property of bind source "%s" and then try again.',
        [FBindSource.GetName, FBindSource.GetName]));
    FBindSource.ClearDataObject;
    if LSourceBS.IsMasterBS then
      (LSourceBS as IioBSPersistenceClient).Persistence.Delete
    else
      (LSourceBS as IioBSPersistenceClient).Delete;
  end
  else
    _InternalRevert(ARaiseIfRevertPointNotSaved, ARaiseIfNoChanges);
end;

function TioBSPersistence.GetCurrentAsString: String;
begin
  if FBindSource.Current <> nil then
    Result := om.From(FBindSource.Current).byFields.TypeAnnotationsON.ToString
  else
    Result := '';
end;

end.
