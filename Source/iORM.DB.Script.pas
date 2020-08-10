unit iORM.DB.Script;

interface

uses
  iORM.DB.Interfaces, FireDAC.Comp.Script, System.Classes;

type

  // Classe che incapsula una query
  TioScript = class(TInterfacedObject, IioScript)
  private
    FConnectionComponent: IioConnection;
    FScriptComponent: TFDScript;
    FScript: TStrings;
    procedure LoadScriptAndCleanFromComments(const ASourceScript: TStrings);
  public
    constructor Create(const AConnection: IioConnection; const AScript: TStrings);
    destructor Destroy; override;
    procedure Execute;
  end;

implementation

uses
  iORM.Exceptions, FireDAC.Comp.ScriptCommands, System.SysUtils;

{ TioScript }

constructor TioScript.Create(const AConnection: IioConnection; const AScript: TStrings);
begin
  inherited Create;
  FScript := TStringList.Create;
  LoadScriptAndCleanFromComments(AScript);

  FConnectionComponent := AConnection; // Per utilizzare il reference counting
  FScriptComponent := TFDScript.Create(nil);
  if Assigned(AConnection) and AConnection.IsDBConnection then
    FScriptComponent.Connection := AConnection.AsDBConnection.GetConnection
  else
    raise EioException.Create(ClassName, 'Create', '"AConnection" parameter must be a DB connection type');
end;

destructor TioScript.Destroy;
begin
  FScript.Free;
  FScriptComponent.Free;
  inherited;
end;

procedure TioScript.Execute;
begin
  FScriptComponent.ExecuteScript(FScript);
end;

procedure TioScript.LoadScriptAndCleanFromComments(const ASourceScript: TStrings);
var
  LLine: String;
begin
  /// This method copy the script into a local TStrings and clean it from all comments
  /// NB: Due to a problem with firebird when the script ends with comments
  for LLine in ASourceScript do
    if not LLine.Trim.StartsWith('--') then
      FScript.Add(LLine);
end;

end.
