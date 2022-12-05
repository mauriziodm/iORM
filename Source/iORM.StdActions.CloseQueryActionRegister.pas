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
    class function CanClose(const Sender: IioBSCloseQueryAction): Boolean;
  end;

implementation

{ TioCloseQueryActionsRegister }

class function TioBSCloseQueryActionRegister.CanClose(const Sender: IioBSCloseQueryAction): Boolean;
var
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  for LBSCloseQueryAction in FInternalContainer do
    if not LBSCloseQueryAction._CanClose(Sender) then
      Exit(False);
  Result := True;
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
