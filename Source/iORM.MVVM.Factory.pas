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

uses
  iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.PrototypeBindSource, iORM.Where.Interfaces,
  System.Rtti, System.Actions, System.Classes;

type

  TioMVVMFactory = class
  public
    class function VMViews: IioVMViews;
    // ViewData
    class function ViewData(const ADataObj:TObject; const AViewDataType:TioViewDataType): IioViewData; overload;
    class function ViewData(const ADataIntf:IInterface; const AViewDataType:TioViewDataType): IioViewData; overload;
    class function ViewData(const ABindSourceAdapter:IioActiveBindSourceAdapter): IioViewData; overload;
    class function ViewData(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean=True): IioViewData; overload;
    class function ViewData(const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''): IioViewData; overload;
    class function ViewData(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String): IioViewData; overload;
    class function ViewData(const AMasterViewModel:IioViewModel; const AMasterPropertyName:String): IioViewData; overload;
    // ViewModel notify container
    class function NewCommandsContainer(const AOwner:TComponent): IioCommandsContainer;
    class function NewCommandsContainerItem(const AName:String; const ACommandType:TioCommandType): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const AAction:TContainedAction): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const ARttiMethod:TRttiMethod): IioCommandsContainerItem; overload;
    class function NewCommandsContainerItem(const AName:String; const AAnonimousMethod:TioCommandAnonimousMethod): IioCommandsContainerItem; overload;
  end;

implementation

uses
  iORM.MVVM.ViewModel.ViewData, iORM.MVVM.Commands, System.SysUtils,
  iORM.Exceptions, iORM.MVVM.ViewModel.Views;

{ TioMVVMFactory }

class function TioMVVMFactory.ViewData(const ADataIntf: IInterface; const AViewDataType: TioViewDataType): IioViewData;
begin
  Result := TioViewData.Create(ADataIntf, AViewDataType);
end;

class function TioMVVMFactory.ViewData(const ADataObj: TObject; const AViewDataType: TioViewDataType): IioViewData;
begin
  Result := TioViewData.Create(ADataObj, AViewDataType);
end;

class function TioMVVMFactory.ViewData(const ABindSourceAdapter: IioActiveBindSourceAdapter): IioViewData;
begin
  Result := TioViewData.Create(ABindSourceAdapter);
end;

class function TioMVVMFactory.ViewData(const AMasterBindSource: TioMasterBindSource;
  const AMasterPropertyName: String): IioViewData;
begin
  Result := TioViewData.Create(AMasterBindSource, AMasterPropertyName);
end;

class function TioMVVMFactory.ViewData(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AViewDataType: TioViewDataType;
  const AAutoLoadData: Boolean): IioViewData;
begin
  Result := TioViewData.Create(ATypeName, ATypeAlias, AWhere, AViewDataType, AAutoLoadData);
end;

class function TioMVVMFactory.ViewData(const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  const AMasterPropertyName: String): IioViewData;
begin
  Result := TioViewData.Create(AMasterBindSourceAdapter, AMasterPropertyName);
end;

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

class function TioMVVMFactory.NewCommandsContainerItem(const AName: String;
  const AAction: TContainedAction): IioCommandsContainerItem;
begin
  Result := TioCommandsContainerItemAction.Create(AName, AAction);
end;

class function TioMVVMFactory.ViewData(const AMasterViewModel: IioViewModel; const AMasterPropertyName: String): IioViewData;
begin
  Result := TioViewData.Create(
    AMasterViewModel.ViewData.ActiveBindSourceAdapter,
    AMasterPropertyName
  );
end;

class function TioMVVMFactory.VMViews: IioVMViews;
begin
  Result := TioVMViews.Create;
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

class function TioMVVMFactory.NewCommandsContainerItem(const AName: String;
  const ARttiMethod: TRttiMethod): IioCommandsContainerItem;
begin
  Result := TioCommandsContainerItemMethod.Create(AName, ARttiMethod);
end;

end.

