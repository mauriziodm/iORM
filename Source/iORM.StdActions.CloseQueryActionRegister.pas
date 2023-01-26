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
    class procedure _RedirectChildActionsBeforeDestroy(const ADestroyingCQAction: IioBSCloseQueryAction);
  public
    class procedure RegisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
    class procedure UnregisterAction(const ABSCloseQueryAction: IioBSCloseQueryAction);
    class procedure Execute(const Sender: IioBSCloseQueryAction);
    class function CanClose(const Sender: IioBSCloseQueryAction; const ADisableIfChildExists: Boolean): Boolean;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, System.Classes;

{ TioCloseQueryActionsRegister }

class function TioBSCloseQueryActionRegister.CanClose(const Sender: IioBSCloseQueryAction; const ADisableIfChildExists: Boolean): Boolean;
var
  I, LSenderIdx: Integer;
begin
  Result := True;
  // NB: Cicla per tutte le BSCloseQueryAction registrate successivamente a quella ricevuta come Sender
  // NB: Se Sender = nil allora (caso repeater sulla MainForm senza alcuna action e non MVVM) allora verifica tutto
  LSenderIdx := 0;
  if Sender <> nil then
    LSenderIdx := FInternalContainer.IndexOf(Sender);
  if LSenderIdx > -1 then
  begin
    // NB: Se ADisableIfChildExists = True allora verifica semplicemente se il registro contiene altre BSCloseQueryActions
    //      dopo quella che ha appena rilevato e se ne esistono ritorna direttametne False,
    //      altrimenti continua a ciclare per tutte le BSCLoseQueryActions successive a quella rilevata e chiede il CanClose a
    //      ognuno di esse fino alla prima che risponde False oppure fino a quando finiscono.
    if ADisableIfChildExists and (FInternalContainer.Count > (LSenderIdx+1)) then
      Exit(False)
    else
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
    for I := FInternalContainer.Count-1 downto LSenderIdx+1 do
    begin
      FInternalContainer[I].InternalExecutionMode := emPassive;
      try
        FInternalContainer[I]._BSCloseQueryActionExecute(Sender);
      finally
        FInternalContainer[I].InternalExecutionMode := emActive;
      end;
    end;
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
  _RedirectChildActionsBeforeDestroy(ABSCloseQueryAction);
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

class procedure TioBSCloseQueryActionRegister._RedirectChildActionsBeforeDestroy(const ADestroyingCQAction: IioBSCloseQueryAction);
var
  I: Integer;
begin
  // Cicla al contrario finchè ci sono elementi oppure finchè non si raggiunge l'azione
  //  stessa perchè non è possibile che possano esserci child actions registrate prima
  //  della ADestroyingCQAction stessa.
  I := FInternalContainer.Count-1;
  while (FInternalContainer[I] <> ADestroyingCQAction) and (I >= 0) do
  begin
    if FInternalContainer[I].ParentCloseQueryAction = ADestroyingCQAction then
      FInternalContainer[I].ParentCloseQueryAction := ADestroyingCQAction.ParentCloseQueryAction;
    Dec(I);
  end;
end;

initialization
  TioBSCloseQueryActionRegister._Build;

finalization
  TioBSCloseQueryActionRegister._Clean;

end.
