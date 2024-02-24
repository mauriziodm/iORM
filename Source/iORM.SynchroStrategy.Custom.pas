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
unit iORM.SynchroStrategy.Custom;

interface

uses
  System.Classes, iORM.Context.Interfaces, iORM.SynchroStrategy.Interfaces;

type

  TioCustomSynchroStrategy_Client = class abstract(TComponent, IioSynchroStrategy_Client)
  strict private
    FTargetConnectionDef: IioSynchroStrategy_TargetConnectionDef;
    procedure SetTargetConnectionDef(const ATargetConnectionDef: IioSynchroStrategy_TargetConnectionDef);
  strict protected
    // ---------- Synchro strategy methods to override on descendant classes ----------
    function _DoGenerateLocalID(const AContext: IioContext): Integer; virtual; abstract;
    function _DoLoadPayload: String; virtual; abstract;
    procedure _DoPersistPayload(const AReceived: String); virtual; abstract;
    // ---------- Synchro strategy methods to override on descendant classes ----------
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GenerateLocalID(const AContext: IioContext): Integer;
    procedure DoSynchronization;
  published
    property TargetConnectionDef: IioSynchroStrategy_TargetConnectionDef read FTargetConnectionDef write FTargetConnectionDef default nil;
  end;

  TioCustomSynchroStrategy_Server = class abstract(TInterfacedObject, IioSynchroStrategy_Server)
  strict private
    FPayload: String;
    function GetPayload: String;
  strict protected
    // ---------- Synchro strategy methods to override on descendant classes ----------
    procedure _DoLoadPayload; virtual; abstract;
    procedure _DoPersistPayload; virtual; abstract;
    // ---------- Synchro strategy methods to override on descendant classes ----------
  public
    constructor Create(const APayload: String);
    procedure LoadPayload;
    procedure PersistPayload;
    property Payload: String read GetPayload;
  end;

implementation

{ TioCustomSynchroStrategy }

constructor TioCustomSynchroStrategy_Client.Create(AOwner: TComponent);
begin
  inherited;
  FTargetConnectionDef := nil;
end;

function TioCustomSynchroStrategy_Client.GenerateLocalID(const AContext: IioContext): Integer;
begin
  // TODO: To be implemented
end;

procedure TioCustomSynchroStrategy_Client.SetTargetConnectionDef(const ATargetConnectionDef: IioSynchroStrategy_TargetConnectionDef);
begin
  if ATargetConnectionDef <> FTargetConnectionDef then
  begin
    if FTargetConnectionDef <> nil then
      FTargetConnectionDef.RemoveFreeNotification(Self);

    FTargetConnectionDef := ATargetConnectionDef;

    if FTargetConnectionDef <> nil then
      FTargetConnectionDef.FreeNotification(Self);
  end;
end;

destructor TioCustomSynchroStrategy_Client.Destroy;
begin
  if FTargetConnectionDef <> nil then
    FTargetConnectionDef.RemoveFreeNotification(Self);
  inherited;
end;

procedure TioCustomSynchroStrategy_Client.DoSynchronization;
begin
  // TODO: To be implemented
end;

{ TioCustomSynchroStrategy_Server }

constructor TioCustomSynchroStrategy_Server.Create(const APayload: String);
begin
  // TODO: To be implemented
end;

function TioCustomSynchroStrategy_Server.GetPayload: String;
begin
  // TODO: To be implemented
end;

procedure TioCustomSynchroStrategy_Server.LoadPayload;
begin
  // TODO: To be implemented
end;

procedure TioCustomSynchroStrategy_Server.PersistPayload;
begin
  // TODO: To be implemented
end;

end.
