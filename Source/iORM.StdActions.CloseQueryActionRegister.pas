unit iORM.StdActions.CloseQueryActionRegister;

interface

uses
  System.Generics.Collections, iORM.StdActions.Interfaces;

type

  TioBSCloseQueryActionRegister = class
  private
    class var FInternalContainer: TList<IioBSCloseQueryAction>;
    class procedure _Build;
    class procedure _Clean;
  public
    class procedure RegisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
    class procedure UnregisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
    class procedure Execute(const Sender: IioBSCloseQueryAction);
    class function CanClose(const Sender: IioBSCloseQueryAction): Boolean;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, System.Classes;

{ TioCloseQueryActionsRegister }

class function TioBSCloseQueryActionRegister.CanClose(const Sender: IioBSCloseQueryAction): Boolean;
var
  I, LSenderIdx: Integer;
begin
  Result := True;
  // NB: Cicla per tutte le BSCloseQueryAction registrate successivamente a quella ricevuta come Sender
  LSenderIdx := FInternalContainer.IndexOf(Sender);
  if LSenderIdx > -1 then
  begin
    for I := LSenderIdx+1 to FInternalContainer.Count-1 do
      if not FInternalContainer[I]._CanClose(Sender) then
        Exit(False);
  end
  else
    raise EioException.Create(ClassName, 'CanClose', Format('The BSCloseQueryAction named "%s", owned by "%s", was not found in the BSCloseQueryActionRegister.',
      [TComponent(Sender).Name, TComponent(Sender).Owner.Name]));
end;

class procedure TioBSCloseQueryActionRegister.Execute(const Sender: IioBSCloseQueryAction);
var
  I, LSenderIdx: Integer;
begin
  // NB: Cicla per tutte le BSCloseQueryAction registrate successivamente a quella ricevuta come Sender
  LSenderIdx := FInternalContainer.IndexOf(Sender);
  if LSenderIdx > -1 then
  begin
    for I := LSenderIdx+1 to FInternalContainer.Count-1 do
      FInternalContainer[I]._BSCloseQueryActionExecute(Sender);
  end
  else
    raise EioException.Create(ClassName, 'Execute', Format('The BSCloseQueryAction named "%s", owned by "%s", was not found in the BSCloseQueryActionRegister.',
      [TComponent(Sender).Name, TComponent(Sender).Owner.Name]));
end;

class procedure TioBSCloseQueryActionRegister.RegisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
begin
  FInternalContainer.Add(ABSCloseQueryAction);
end;

class procedure TioBSCloseQueryActionRegister.UnregisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
begin
  FInternalContainer.Remove(ABSCloseQueryAction);
end;

class procedure TioBSCloseQueryActionRegister._Build;
begin
  FInternalContainer := TList<IioBSCloseQueryAction>.Create;
end;

class procedure TioBSCloseQueryActionRegister._Clean;
begin
  FInternalContainer.Free;
end;

initialization
  TioBSCloseQueryActionRegister._Build;

finalization
  TioBSCloseQueryActionRegister._Clean;

end.
