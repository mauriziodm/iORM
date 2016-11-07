{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
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

