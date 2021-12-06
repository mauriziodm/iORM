unit iORM.DB.Components.BindSourceObjState;

interface

type

  IioBindSourceObjStateClient = interface
    ['{8B930CF9-0EDC-483E-86A2-39C6CFD82D9D}']
    function Current: TObject;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
  end;

  TioBindSourceObjState = class
  private
    FObjState: String;
    FIsEmpty: Boolean;
    FBindSource: IioBindSourceObjStateClient;
    function GetIsEmpty: Boolean;
    function GetIsChanged: Boolean;
    function GetCurrentAsString: String;
  public
    constructor Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
    procedure Save;
    procedure Revert;
    procedure Clear;
    property IsChanged: Boolean read GetIsChanged;
    property IsEmpty: Boolean read GetIsEmpty;
    property SavedObjState: string read FObjState;
  end;

implementation

uses
  ObjMapper, iORM.Exceptions, System.SysUtils;

{ TioBindSourceObjState }

procedure TioBindSourceObjState.Clear;
begin
  FObjState := '';
end;

constructor TioBindSourceObjState.Create(const ABindSourceObjStateClient: IioBindSourceObjStateClient);
begin
  inherited Create;
  FBindSource := ABindSourceObjStateClient;
  Clear;
end;

function TioBindSourceObjState.GetIsChanged: Boolean;
begin
  Result := GetCurrentAsString <> FObjState;
end;

function TioBindSourceObjState.GetIsEmpty: Boolean;
begin
  Result := FObjState = '';
end;

procedure TioBindSourceObjState.Revert;
begin
  if IsEmpty then
    raise EioException.Create(ClassName, 'Revert', 'There is no state you can revert to. (call "Save" method before)');
  om.FromJSON(FObjState).TypeAnnotationsON.ClearListBefore.&To(FBindSource.Current);
  FBindSource.Refresh(False);
end;

procedure TioBindSourceObjState.Save;
begin
  if FObjState = '' then
    FObjState := GetCurrentAsString
  else
    raise EioException.Create(ClassName, 'Save', 'A previously saved state is present, it must be cleared before (Persist, Revert or Clear)');
end;

function TioBindSourceObjState.GetCurrentAsString: String;
begin
  if FBindSource.Current <> nil then
    Result := om.From(FBindSource.Current).TypeAnnotationsON.ToString
  else
    Result := '';
end;

end.
