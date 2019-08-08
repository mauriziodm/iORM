{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.LiveBindings.BSAToDataSetLink;

interface

uses
  Data.DB, iORM.LiveBindings.Interfaces, System.Generics.Collections;

type

  TioBSAToDataSetLinkContainer = class(TInterfacedObject, IioBSAToDataSetLinkContainer)
  private
    FContainer: TList<TDataSet>;
    FDisabled: Boolean;
    FDisabledCounter: Byte;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Disable;
    procedure Enable;
    procedure RegisterDataSet(const ADataSet:TDataSet);
    procedure UnregisterDataSet(const ADataSet:TDataSet);
    // -------------------------------------------------------------------------
    procedure Refresh(const AForce:Boolean=False);
    procedure SetRecNo(const ARecNo:Integer);
  end;

implementation

{ TioBSAToDataSetLinkContainer }

constructor TioBSAToDataSetLinkContainer.Create;
begin
  inherited;
  FDisabledCounter := 0;
  FDisabled := False;
  FContainer := TList<TDataSet>.Create;
end;

destructor TioBSAToDataSetLinkContainer.Destroy;
begin
  FContainer.Free;
  inherited;
end;

procedure TioBSAToDataSetLinkContainer.Disable;
begin
  FDisabled := True;
  Inc(FDisabledCounter);
end;

procedure TioBSAToDataSetLinkContainer.Enable;
begin
  Dec(FDisabledCounter);
  if FDisabledCounter = 0 then
    FDisabled := False;
end;

procedure TioBSAToDataSetLinkContainer.Refresh(const AForce: Boolean);
var
  LDataSet: TDataSet;
begin
  if FDisabled and not AForce then
    Exit;
  for LDataSet in FContainer do
    if LDataSet.Active then
      LDataSet.Refresh;
end;

procedure TioBSAToDataSetLinkContainer.RegisterDataSet(
  const ADataSet: TDataSet);
begin
  FContainer.Add(ADataSet);
end;

procedure TioBSAToDataSetLinkContainer.SetRecNo(const ARecNo: Integer);
var
  LDataSet: TDataSet;
begin
  if FDisabled then
    Exit;
  for LDataSet in FContainer do
    if LDataSet.Active then
      LDataSet.RecNo := ARecNo + 1;
end;

procedure TioBSAToDataSetLinkContainer.UnregisterDataSet(
  const ADataSet: TDataSet);
var
  LItemIndex: Integer;
begin
  LItemIndex := FContainer.IndexOf(ADataSet);
  if LItemIndex > -1 then
    FContainer.Delete(LItemIndex);
end;

end.
