unit iORM.DB.Components.BindSourceObjState;

interface

type

  IioBindSourceObjStateClient = interface
    ['{8B930CF9-0EDC-483E-86A2-39C6CFD82D9D}']
    function Current: TObject;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
  end;

  TioBindSourceObjState = (osUnsaved, osSaved, osChanged);

  TioBindSourceObjStateManager = class
  private
    FState: TioBindSourceObjState;
    FSavedObjState: String;
    FBindSource: IioBindSourceObjStateClient;
    function GetIsSaved: Boolean;
    function GetIsChanged: Boolean;
    function GetCurrentAsString: String;
    function GetState: TioBindSourceObjState;
  public
    constructor Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
    procedure Save;
    procedure Revert;
    procedure Clear;
    property IsChanged: Boolean read GetIsChanged;
    property IsSaved: Boolean read GetIsSaved;
    property SavedObjState: string read FSavedObjState;
    property State: TioBindSourceObjState read GetState;
  end;

implementation

uses
  ObjMapper, iORM.Exceptions, System.SysUtils;

{ TioBindSourceObjState }

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

function TioBindSourceObjStateManager.GetIsChanged: Boolean;
begin
  Result := GetState = osChanged;
end;

function TioBindSourceObjStateManager.GetIsSaved: Boolean;
begin
  Result := GetState > osUnsaved;
end;

function TioBindSourceObjStateManager.GetState: TioBindSourceObjState;
begin
  if FSavedObjState.IsEmpty then
    Result := osUnsaved
  else if GetCurrentAsString <> FSavedObjState then
    Result := osChanged
  else
    Result := osSaved;
end;

procedure TioBindSourceObjStateManager.Revert;
begin
  if IsSaved then
  begin
    om.FromJSON(FSavedObjState).TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
    Clear;
    FBindSource.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Revert', 'There is no state you can revert to. (call "Save" method before)');
end;

procedure TioBindSourceObjStateManager.Save;
begin
  if FSavedObjState = '' then
    FSavedObjState := GetCurrentAsString
  else
    raise EioException.Create(ClassName, 'Save', 'A previously saved state is present, it must be cleared before (Persist, Revert or Clear)');
end;

function TioBindSourceObjStateManager.GetCurrentAsString: String;
begin
  if FBindSource.Current <> nil then
    Result := om.From(FBindSource.Current).TypeAnnotationsON.ToString
  else
    Result := '';
end;

end.
