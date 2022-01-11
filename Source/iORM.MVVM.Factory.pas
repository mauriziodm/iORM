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



unit iORM.MVVM.Factory;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.Where.Interfaces,
  System.Rtti, System.Classes, iORM.CommonTypes,
  iORM.AbstractionLayer.Framework;

type

  TioMVVMFactory = class
  public
    class function NewViewRegister: IioViewRegister;
    class function NewCommandsContainer(const AOwner:TComponent): IioCommandsContainer;
    class function NewCommandsContainerItem(const AName:String; const ACommandType:TioCommandType): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const AAction:TioAction): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const ARttiMethod:TRttiMethod): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const AAnonimousMethod:TioCommandAnonimousMethod): IioCommandsContainerItem; overload;
  end;

implementation

uses
  iORM.MVVM.Commands, System.SysUtils,
  iORM.Exceptions, iORM.MVVM.ViewRegister;

{ TioMVVMFactory }

class function TioMVVMFactory.NewCommandsContainerItem(const AName:String;
  const ACommandType: TioCommandType): IioCommandsContainerItem;
begin
  Result := nil;
  case ACommandType of
    TioCommandType.ctAction:
      Result := TioCommandsContainerItemAction.Create(AName);
    TioCommandType.ctMethod:
      Result := TioCommandsContainerItemMethod.Create(AName);
    TioCommandType.ctAnonimousMethod:
      Result := TioCommandsContainerItemAnonimousMethod.Create(AName);
  else
    raise EioException.Create(Self.ClassName + ': Invalid command type.');
  end;
end;

class function TioMVVMFactory.NewCommandsContainerItem(const AName:String; const AAction: TioAction): IioCommandsContainerItem;
begin
  Result := TioCommandsContainerItemAction.Create(AName, AAction);
end;

class function TioMVVMFactory.NewCommandsContainer(const AOwner:TComponent): IioCommandsContainer;
begin
  Result := TioCommandsContainer.Create(AOwner);
end;

class function TioMVVMFactory.NewCommandsContainerItem(const AName: String;
  const AAnonimousMethod: TioCommandAnonimousMethod): IioCommandsContainerItem;
begin
  Result := TioCommandsContainerItemAnonimousMethod.Create(AName, AAnonimousMethod);
end;

class function TioMVVMFactory.NewViewRegister: IioViewRegister;
begin
  Result := TioViewRegister.Create;
end;

class function TioMVVMFactory.NewCommandsContainerItem(const AName: String;
  const ARttiMethod: TRttiMethod): IioCommandsContainerItem;
begin
  Result := TioCommandsContainerItemMethod.Create(AName, ARttiMethod);
end;

end.

