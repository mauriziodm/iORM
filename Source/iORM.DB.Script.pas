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
  FConnectionComponent.StartTransaction;
  try
    FScriptComponent.ExecuteScript(FScript);
    FConnectionComponent.Commit;
  except
    FConnectionComponent.Rollback;
  end;
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
