{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
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
  I: Integer;
begin
  // Cicla al contrario finchè ci sono elementi oppure finchè non si raggiunge l'azione
  //  stessa perchè non è possibile che possano esserci child actions registrate prima
  //  della ADestroyingCQAction stessa.
  Result := True;
  I := FInternalContainer.Count-1;
  while (FInternalContainer[I] <> Sender) and (I >= 0) do
  begin
    if FInternalContainer[I]._IsChildOf(Sender) and (ADisableIfChildExists or not FInternalContainer[I]._CanClose) then
        Exit(False);
    Dec(I);
  end;
end;

class procedure TioBSCloseQueryActionRegister.Execute(const Sender: IioBSCloseQueryAction);
var
  I: Integer;
begin
  // Cicla al contrario finchè ci sono elementi oppure finchè non si raggiunge l'azione
  //  stessa perchè non è possibile che possano esserci child actions registrate prima
  //  della ADestroyingCQAction stessa.
  I := FInternalContainer.Count-1;
  while (FInternalContainer[I] <> Sender) and (I >= 0) do
  begin
    if FInternalContainer[I]._IsChildOf(Sender) then
    begin
      FInternalContainer[I].InternalExecutionMode := emPassive; // That way it doesn't ask for confirmation
      try
        FInternalContainer[I].Execute;
      finally
        FInternalContainer[I].InternalExecutionMode := emActive;
      end;
    end;
    Dec(I);
  end;
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
