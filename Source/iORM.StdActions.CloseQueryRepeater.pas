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
unit iORM.StdActions.CloseQueryRepeater;

interface

uses
  iORM.CommonTypes, System.Classes, iORM.StdActions.Interfaces;

const
  RECURSIVE_ONE_LEVEL = 1;
  RECURSIVE_UNLIMITED = 0;

type

  TioCloseQueryRepeater = class (TComponent)
  private
    FScope: TioBSCloseQueryRepeaterScope;
    FFirstCloseQueryAction: IioBSCloseQueryAction;
    procedure _InjectEventHandler;
    function _CanCloseView(const AView: TComponent; const AMaxLevel: Integer; const ALevel: Integer = 0): Boolean;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // properties
    property Scope: TioBSCloseQueryRepeaterScope read FScope write FScope default rsFirstLevelChilds;
  end;


implementation

uses
  iORM.MVVM.ViewModelBridge, System.SysUtils;

{ TioCloseQueryRepeater }

constructor TioCloseQueryRepeater.Create(AOwner: TComponent);
begin
  inherited;
  FScope := rsFirstLevelChilds;
end;

procedure TioCloseQueryRepeater.Loaded;
begin
  inherited;
  _InjectEventHandler;
end;

procedure TioCloseQueryRepeater._InjectEventHandler;
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only
  if (csDesigning in ComponentState) then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(Owner, LEventHandlerToInject, False);
end;

function TioCloseQueryRepeater._CanCloseView(const AView: TComponent; const AMaxLevel, ALevel: Integer): Boolean;
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := True;

  // Azzera il riferimento alla prima CloseQueryAction reperibile (la CQA a cui fa riferimento)
  if ALevel = 0 then
    FFirstCloseQueryAction := nil;

  // Primo ciclo per cercare un VMBridge o una CloseQueryAction
  for I := 0 to AView.ComponentCount - 1 do
  begin
    // Se il componente è un ViewModelBridge
    if AView.Components[I] is TioViewModelBridge then
    begin
      if (not Assigned(FFirstCloseQueryAction)) then
        FFirstCloseQueryAction := TioViewModelBridge(AView.Components[I]).ViewModel._GetBSCloseQuery;
      if not TioViewModelBridge(AView.Components[I]).ViewModel._CanClose then
        Exit(False);
    end
    else
    // Se il componente è una CloseQueryAction
    if Supports(AView.Components[I], IioBSCloseQueryAction, LBSCloseQueryAction) then
    begin
      if (not Assigned(FFirstCloseQueryAction)) then
        FFirstCloseQueryAction := LBSCloseQueryAction;
      if not LBSCloseQueryAction._CanClose then
        Exit(False);
    end;
  end;

  // Prosegue ricorsivamente nei childs se non ha raggionto il livello di annidamento massimo oppure se è illimitato
  if (ALevel < AMaxLevel) or (AMaxLevel = RECURSIVE_UNLIMITED) then
    for I := 0 to AView.ComponentCount - 1 do
      if AView.Components[I].ComponentCount > 0 then
        if not _CanCloseView(AView.Components[I], AMaxLevel, ALevel+1) then
          Exit(False);
end;

procedure TioCloseQueryRepeater._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
begin
  // In base allo scope individua la/le CloseQuery e chiede se è autorizzato a chiudersi
  case FScope of
    rsFirstLevelChilds:
      CanClose := _CanCloseView(Owner, RECURSIVE_ONE_LEVEL);
    rsDeepChilds:
      CanClose := _CanCloseView(Owner, RECURSIVE_UNLIMITED);
  end;
  // Se è autorizzato a chiudersi ma non in conseguenza dell'esecuzione della CloseQueryAction
  //  a cui fa riferimento (la prima che trova)(quindi l'utente ha cliccato sulla chiusura della
  //  form direttamente sulla X in alto a destra ad esempio) allora esegue la CloseQueryAction
  //  associata in modo che si inneschino anche le CQA figlie se ce ne sono e se il tutto è
  //  abilitato.
  if CanClose and assigned(FFirstCloseQueryAction) and not FFirstCloseQueryAction.Executing then
  begin
    FFirstCloseQueryAction.Execute;
    CanClose := False;
  end;
end;

end.
