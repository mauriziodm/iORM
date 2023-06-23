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
unit iORM.LiveBindings.BSPersistence.SmartDeleteSystem;

interface

uses
  System.SysUtils;

type

  TioSmartDeleteSystemItem = record
    TypeName: String;
    ID: Integer;
  end;

  TioSmartDeleteSystem = class
  private
    FContainer: TArray<TioSmartDeleteSystemItem>;
    FMonitor: TMonitor;
    procedure Lock;
    procedure Unlock;
  public
    procedure Clear;
    procedure Add(const ATypeName: String; const AID: Integer);
    procedure ForEach(const AProc: TProc<TioSmartDeleteSystemItem>);
  end;

implementation

{ TioSmartDeleteSystem }

procedure TioSmartDeleteSystem.Add(const ATypeName: String; const AID: Integer);
begin
  Lock;
  try
    SetLength(FContainer, Length(FContainer)+1);
    with FContainer[High(FContainer)] do
    begin
      TypeName := ATypeName;
      ID := AID;
    end;
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.Clear;
begin
  Lock;
  try
    SetLength(FContainer, 0);
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.ForEach(const AProc: TProc<TioSmartDeleteSystemItem>);
var
  i: Integer;
begin
  Lock;
  try
    for i := Low(FContainer) to High(FContainer) do
      AProc(FContainer[i]);
  finally
    Unlock;
  end;
end;

procedure TioSmartDeleteSystem.Lock;
begin
  FMonitor.Enter(Self);
end;

procedure TioSmartDeleteSystem.Unlock;
begin
  FMonitor.Exit(Self);
end;

end.
