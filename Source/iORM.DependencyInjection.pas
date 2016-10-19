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



unit iORM.DependencyInjection;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.Interfaces,
  System.SyncObjs, iORM.DependencyInjection.Interfaces, System.Rtti,
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces,
  iORM.Resolver.Interfaces, iORM.Context.Container,
  iORM.DependencyInjection.Singletons, iORM.DependencyInjection.Implementers;

type

  // ===============================================================================================================================
  // Internal containers types
  // -------------------------------------------------------------------------------------------------------------------------------
  // Dependency Injection Container Interface IMPLEMENTERS (SubContainer)
  TioDIContainerImplementersKey = String;
  TioDIContainerImplementers = class
  strict private
    FClassesList: String;
    FInternalContainer: TObjectDictionary<TioDIContainerImplementersKey, TioDIContainerImplementersItem>;
    procedure BuildClassesList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AAlias:TioDIContainerImplementersKey; const AImplementerItem:TioDIContainerImplementersItem);
    function GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
    function Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
    function ContainsClass(const AClassName:String): Boolean;
    function GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
  end;
  // Dependency injection container INTERFACES (MasterContainer)
  TioDIContainerKey = String;
  TioDIContainerValue = TioDIContainerImplementers;
  TioDIContainerInstance = TObjectDictionary<TioDIContainerKey, TioDIContainerValue>;
  // ===============================================================================================================================

  // Dependency Injection Container (and relative class reference)
  TioDependencyInjectionContainerRef = class of TioDependencyInjectionContainer;
  TioDependencyInjectionContainer = class abstract
  strict private
    class var FContainer: TioDIContainerInstance;
  public
    class procedure Build;
    class procedure CleanUp;
    class procedure Add(const AKey:TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey; const AValue:TioDIContainerImplementersItem);
    class function Exists(const AKey:TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey): Boolean; overload;
    class function ImplementersExists(const AKey:TioDIContainerKey): Boolean; overload;
    class function Get(const AKey:TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey): TioDIContainerImplementersItem;
    class function GetInterfaceImplementers(const AKey:TioDIContainerKey): TioDIContainerValue;
  end;

  // Base class for Dependency Injection Register and Locator classes
  TioDependencyInjectionBase = class abstract(TInterfacedObject)
  strict protected
    class function Container: TioDependencyInjectionContainerRef;
    class function InterfaceNameToString<T:IInterface>: String;
    class function InterfaceGUIToString<T:IInterface>: String;
  end;

  // Register Class (NoRefCounter)
  TioDependencyInjectionRegister = class(TioDependencyInjectionBase)
  strict private
    FContainerValue: TioDIContainerImplementersItem;
    FInterfaceName: String;
    FAlias: String;
    FSetMapImplementersRef: Boolean;
    procedure LoadInjectAttributes;
    procedure SetMapImplementersRef;
  public
    constructor Create(const AContainerValue:TioDIContainerImplementersItem);
    procedure Execute;
    function Implements(const AInterfaceName:String; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    function Implements<T: IInterface>(const AAlias:String=''): TioDependencyInjectionRegister; overload;
    function Alias(const AAlias:String): TioDependencyInjectionRegister;
    function InjectProperty(const APropertyName:String; const AValue:TValue):TioDependencyInjectionRegister; overload;
    function InjectProperty(const APropertyName, ATypeName:String; const ATypeAlias:String=''):TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName:String; const AValue:TValue):TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName, ATypeName:String; const ATypeAlias:String=''):TioDependencyInjectionRegister; overload;
    function AsSingleton:TioDependencyInjectionRegister;
    function DefaultConstructorMethod(const AValue:String): TioDependencyInjectionRegister;
    function DefaultConstructorMarker(const AValue:String): TioDependencyInjectionRegister;
    function DefaultConstructorParams(const AParams: array of TValue): TioDependencyInjectionRegister;
    function DisableMapImplemetersRef: TioDependencyInjectionRegister;
  end;

  // Service Locator Class
  TioDependencyInjectionLocator = class(TioDependencyInjectionBase, IioDependencyInjectionLocator)
  strict private
    FInterfaceName: String;
    FAlias: String;
    FConstructorMethod: String;
    FConstructorMarker: String;
    FConstructorParams: array of TValue;
    FViewModel: IioViewModel;
    FViewModelMarker: String;
    FSingletonKey: String;
    function ViewModelExist: Boolean;
    procedure CheckConstructorInfo(const AContainerItem: TioDIContainerImplementersItem);
  public
    constructor Create(const AInterfaceName:String; const AAlias:String=''); virtual;
    function Exist: Boolean; virtual;
    function Get: TObject; virtual;
    function GetItem: TioDIContainerImplementersItem;
    function Alias(const AAlias:String): IioDependencyInjectionLocator;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator; virtual;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator; virtual;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator; virtual;
    function SingletonKey(const ASingletonKey:String): IioDependencyInjectionLocator; virtual;
    // ---------- LOCATE VIEW MODEL ----------
    function VM(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator; overload;
    // CreateByTypeName
    function VM_byTypeName(const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByMasterBindSource
    function VM_byMasterBS(const AInterfaceName, AAlias:String; const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByBindSourceAdapter
    function VM_byBSA(const AInterfaceName, AAlias:String; ABindSourceAdapter:IioActiveBindSourceAdapter; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByDataObject
    function VM_byDataObj(const AInterfaceName, AAlias:String; const ADataObject:TObject; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AMarker:String=''): IioDependencyInjectionLocator; overload;
    // CreateByDataInterface
    function VM_byDataObj(const AInterfaceName, AAlias:String; const ADataIntf:IInterface; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AMarker:String=''): IioDependencyInjectionLocator; overload;
    // CreateByClassRef
    function VM_byClass(const AInterfaceName, AAlias:String; const AClassRef:TioClassRef; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByMasterBindSourceAdapter
    function VM_byMasterBSA(const AInterfaceName, AAlias:String; const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByMasterViewModel
    function VM_byMasterVM(const AInterfaceName, AAlias:String; const AMasterViewModel:IioViewModel; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator;
    // CreateByMasterViewModelFromDependencyInjection
    function VM_byMasterVMfromDI(const AInterfaceName, AAlias:String; const AMasterViewModelTypeName, AMasterViewModelTypeAlias:String; const AMasterViewModelMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator;
    // ---------- LOCATE VIEW MODEL ----------
  end;
  // Generic version of the Service Locator Class
  TioDependencyInjectionLocator<TI:IInterface> = class(TioDependencyInjectionLocator, IioDependencyInjectionLocator<TI>)
  public
    function Get: TI; overload;
    function Alias(const AAlias:String): IioDependencyInjectionLocator<TI>;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator<TI>; overload;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>; overload;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>; overload;
    function SingletonKey(const ASingletonKey:String): IioDependencyInjectionLocator<TI>; overload;
    function ViewModel(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator<TI>; overload;
    // ---------- LOCATE VIEW MODEL ----------
    // CreateByTypeName
    function VM_byTypeName(const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByMasterBindSource
    function VM_byMasterBS(const AInterfaceName, AAlias:String; const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByBindSourceAdapter
    function VM_byBSA(const AInterfaceName, AAlias:String; ABindSourceAdapter:IioActiveBindSourceAdapter; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByDataObject
    function VM_byDataObj(const AInterfaceName, AAlias:String; const ADataObject:TObject; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AMarker:String=''): IioDependencyInjectionLocator<TI>; overload;
    // CreateByDataInterface
    function VM_byDataObj(const AInterfaceName, AAlias:String; const ADataIntf:IInterface; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AMarker:String=''): IioDependencyInjectionLocator<TI>; overload;
    // CreateByClassRef
    function VM_byClass(const AInterfaceName, AAlias:String; const AClassRef:TioClassRef; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByMasterBindSourceAdapter
    function VM_byMasterBSA(const AInterfaceName, AAlias:String; const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByMasterViewModel
    function VM_byMasterVM(const AInterfaceName, AAlias:String; const AMasterViewModel:IioViewModel; const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // CreateByMasterViewModelFromDependencyInjection
    function VM_byMasterVMfromDI(const AInterfaceName, AAlias:String; const AMasterViewModelTypeName, AMasterViewModelTypeAlias:String; const AMasterViewModelMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // ---------- LOCATE VIEW MODEL ----------
  end;

  // Class for ResolverByDependencyInjection
  TioDependencyInjectionResolverBase = class(TioDependencyInjectionBase)
  public
    class function Resolve(const ATypeName:String; const AAlias:String; const AResolverMode:TioResolverMode): IioResolvedTypeList;
  end;

  // Main Dependency Injection Class (and relative class reference)
  TioDependencyInjectionRef = class of TioDependencyInjection;
  TioDependencyInjection = class(TioDependencyInjectionBase)
  public
    class function RegisterClass(const AClassRef:TioClassRef): TioDependencyInjectionRegister; overload;
    class function RegisterClass<T: class>: TioDependencyInjectionRegister; overload;
    class function Locate(const AInterfaceName:String; const AAlias:String=''): IioDependencyInjectionLocator; overload;
    class function Locate<T:IInterface>(const AAlias:String=''): IioDependencyInjectionLocator<T>; overload;
    class function Singletons: TioSingletonsFacadeRef;
    // ---------- LOCATE VIEW MODEL ----------
    // CreateByTypeName
    class function LocateVM_byTypeName(const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator; overload;
    class function LocateVM_byTypeName<T:IInterface>(const AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator<T>; overload;
    // CreateByMasterBindSource
    class function LocateVM_byMasterBS(const AInterfaceName, AAlias:String; const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    class function LocateVM_byMasterBS<T:IInterface>(const AAlias:String; const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator<T>; overload;
    // CreateByBindSourceAdapter
    class function LocateVM_byBSA(const AInterfaceName, AAlias:String; ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    class function LocateVM_byBSA<T:IInterface>(const AAlias:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<T>; overload;
    // CreateByDataObject
    class function LocateVM_byDataObj(const AInterfaceName, AAlias:String; const ADataObject:TObject; const AViewDataType:TioViewDataType=TioViewDataType.dtList): IioDependencyInjectionLocator; overload;
    class function LocateVM_byDataObj<T:IInterface>(const AAlias:String; const ADataObject:TObject; const AViewDataType:TioViewDataType=TioViewDataType.dtList): IioDependencyInjectionLocator<T>; overload;
    // CreateByDataInterface
    class function LocateVM_byDataObj(const AInterfaceName, AAlias:String; const ADataIntf:IInterface; const AViewDataType:TioViewDataType=TioViewDataType.dtList): IioDependencyInjectionLocator; overload;
    class function LocateVM_byDataObj<T:IInterface>(const AAlias:String; const ADataIntf:IInterface; const AViewDataType:TioViewDataType=TioViewDataType.dtList): IioDependencyInjectionLocator<T>; overload;
    // CreateByClassRef
    class function LocateVM_byClass(const AInterfaceName, AAlias:String; const AClassRef:TioClassRef; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator; overload;
    class function LocateVM_byClass<T:IInterface>(const AAlias:String; const AClassRef:TioClassRef; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator<T>; overload;
    // CreateByMasterBindSourceAdapter
    class function LocateVM_byMasterBSA(const AInterfaceName, AAlias:String; const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String): IioDependencyInjectionLocator; overload;
    class function LocateVM_byMasterBSA<T:IInterface>(const AAlias:String; const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String): IioDependencyInjectionLocator<T>; overload;
    // CreateByMasterViewModel
    class function LocateVM_byMasterVM(const AInterfaceName, AAlias:String; const AMasterViewModel:IioViewModel; const AMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    class function LocateVM_byMasterVM<T:IInterface>(const AAlias:String; const AMasterViewModel:IioViewModel; const AMasterPropertyName:String=''): IioDependencyInjectionLocator<T>; overload;
    // CreateByMasterViewModelFromDependencyInjection
    class function LocateVM_byMasterVMfromDI(const AInterfaceName, AAlias:String; const AMasterViewModelTypeName, AMasterViewModelTypeAlias:String; const AMasterViewModelMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    class function LocateVM_byMasterVMfromDI<T:IInterface>(const AAlias:String; const AMasterViewModelTypeName, AMasterViewModelTypeAlias:String; const AMasterViewModelMasterPropertyName:String=''): IioDependencyInjectionLocator<T>; overload;
    // ---------- LOCATE VIEW MODEL ----------
  end;

  // Dependency Injection Factory
  TioDependencyInjectionFactory = class abstract(TioDependencyInjectionBase)
  public
    class function GetRegister(const AContainerValue:TioDIContainerImplementersItem): TioDependencyInjectionRegister;
    class function GetLocator(const AInterfaceName:String; const AAlias:String=''): IioDependencyInjectionLocator; overload;
    class function GetLocator<TI:IInterface>(const AAlias:String=''): IioDependencyInjectionLocator<TI>; overload;
  end;

implementation

uses
  iORM, iORM.Exceptions, SysUtils, System.TypInfo, iORM.ObjectsForge.ObjectMaker,
  iORM.Rtti.Utilities, iORM.Resolver.Factory, iORM.RttiContext.Factory,
  iORM.Context.Map.Interfaces,
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Attributes,
  iORM.Where.Interfaces, iORM.Where.Factory;

{ TioDependencyInjectionBase }

class function TioDependencyInjectionBase.Container: TioDependencyInjectionContainerRef;
begin
  Result := TioDependencyInjectionContainer;
end;

class function TioDependencyInjectionBase.InterfaceGUIToString<T>: String;
begin
  Result := TioRttiUtilities.GenericInterfaceToGUI<T>;
end;

class function TioDependencyInjectionBase.InterfaceNameToString<T>: String;
begin
  Result := TioRttiUtilities.GenericToString<T>;
end;

{ TioDependencyInjection }

class function TioDependencyInjection.Locate(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias);
end;

class function TioDependencyInjection.Locate<T>(const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias);
end;

class function TioDependencyInjection.LocateVM_byTypeName(const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator;
var
  LWhere: IioWhere;
begin
  LWhere := nil;
  if not AWhere.IsEmpty then
    LWhere := TioWhereFactory.NewWhere.Add(AWhere);
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByTypeName')
                .ConstructorParams([AModelTypeName, AModelTypeAlias, TValue.From<IioWhere>(LWhere), TValue.From<TioViewDataType>(AViewDataType), AAutoLoadData]);
end;

class function TioDependencyInjection.LocateVM_byMasterBS(const AInterfaceName, AAlias:String; const AMasterBindSource: TioMasterBindSource;
  const AMasterPropertyName: String): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterBindSource')
                .ConstructorParams([TValue.From(AMasterBindSource), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byBSA(const AInterfaceName, AAlias: String;
  ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByBindSourceAdapter')
                .ConstructorParams([TValue.From(ABindSourceAdapter)]);
end;

class function TioDependencyInjection.LocateVM_byTypeName<T>(const AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True): IioDependencyInjectionLocator<T>;
var
  LWhere: IioWhere;
begin
  LWhere := nil;
  if not AWhere.IsEmpty then
    LWhere := TioWhereFactory.NewWhere.Add(AWhere);
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByClassName')
                .ConstructorParams([AModelTypeName, AModelTypeAlias, TValue.From<IioWhere>(LWhere), TValue.From<TioViewDataType>(AViewDataType), AAutoLoadData]);
end;

class function TioDependencyInjection.LocateVM_byMasterBS<T>(const AAlias:String; const AMasterBindSource: TioMasterBindSource;
  const AMasterPropertyName: String): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterBindSource')
                .ConstructorParams([TValue.From(AMasterBindSource), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byDataObj(const AInterfaceName,
  AAlias: String; const ADataObject: TObject;
  const AViewDataType: TioViewDataType): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByDataObject')
                .ConstructorParams([TValue.From(ADataObject), TValue.From<TioViewDataType>(AViewDataType)]);
end;

class function TioDependencyInjection.LocateVM_byBSA<T>(const AAlias:String;
  const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByBindSourceAdapter')
                .ConstructorParams([TValue.From(ABindSourceAdapter)]);
end;

class function TioDependencyInjection.RegisterClass(const AClassRef: TioClassRef): TioDependencyInjectionRegister;
var
  ContainerValue: TioDIContainerImplementersItem;
begin
  ContainerValue := TioDIContainerImplementersItem.Create;
  ContainerValue.ClassRef := AClassRef;
  ContainerValue.ClassName := AClassRef.ClassName;
  ContainerValue.RttiType := TioRttiContextFactory.RttiContext.GetType(AClassRef).AsInstance;
  ContainerValue.IsSingleton := False;
  Result := TioDependencyInjectionFactory.GetRegister(ContainerValue);
end;

class function TioDependencyInjection.RegisterClass<T>: TioDependencyInjectionRegister;
var
  ContainerValue: TioDIContainerValue;
begin
  Result := Self.RegisterClass(T);
end;

class function TioDependencyInjection.Singletons: TioSingletonsFacadeRef;
begin
  Result := TioSingletonsFacade;
end;

class function TioDependencyInjection.LocateVM_byDataObj(const AInterfaceName,
  AAlias: String; const ADataIntf: IInterface;
  const AViewDataType: TioViewDataType): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByDataInterface')
                .ConstructorParams([TValue.From(ADataIntf), TValue.From<TioViewDataType>(AViewDataType)]);
end;

class function TioDependencyInjection.LocateVM_byClass(const AInterfaceName,
  AAlias: String; const AClassRef: TioClassRef; const AWhere: String;
  const AViewDataType: TioViewDataType;
  const AAutoLoadData: Boolean): IioDependencyInjectionLocator;
var
  LWhere: IioWhere;
begin
  LWhere := nil;
  if not AWhere.IsEmpty then
    LWhere := TioWhereFactory.NewWhere.Add(AWhere);
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByClassRef')
                .ConstructorParams([AClassRef, TValue.From<IioWhere>(LWhere), TValue.From<TioViewDataType>(AViewDataType), AAutoLoadData]);
end;

class function TioDependencyInjection.LocateVM_byMasterBSA(const AInterfaceName,
  AAlias: String; const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  const AMasterPropertyName: String): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterBindSourceAdapter')
                .ConstructorParams([TValue.From(AMasterBindSourceAdapter), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byMasterVM(const AInterfaceName,
  AAlias: String; const AMasterViewModel: IioViewModel;
  const AMasterPropertyName: String): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterViewModel')
                .ConstructorParams([TValue.From(AMasterViewModel), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byMasterVMfromDI(const AInterfaceName,
  AAlias, AMasterViewModelTypeName, AMasterViewModelTypeAlias,
  AMasterViewModelMasterPropertyName: String): IioDependencyInjectionLocator;
begin
  Result := Self.Locate(AInterfaceName)
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterViewModelFromDependencyInjection')
                .ConstructorParams([AMasterViewModelTypeName, AMasterViewModelTypeAlias, AMasterViewModelMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byDataObj<T>(const AAlias: String;
  const ADataObject: TObject;
  const AViewDataType: TioViewDataType): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByDataObject')
                .ConstructorParams([TValue.From(ADataObject), TValue.From<TioViewDataType>(AViewDataType)]);
end;

class function TioDependencyInjection.LocateVM_byDataObj<T>(const AAlias: String;
  const ADataIntf: IInterface;
  const AViewDataType: TioViewDataType): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByDataInterface')
                .ConstructorParams([TValue.From(ADataIntf), TValue.From<TioViewDataType>(AViewDataType)]);
end;

class function TioDependencyInjection.LocateVM_byClass<T>(const AAlias: String;
  const AClassRef: TioClassRef; const AWhere: String;
  const AViewDataType: TioViewDataType;
  const AAutoLoadData: Boolean): IioDependencyInjectionLocator<T>;
var
  LWhere: IioWhere;
begin
  LWhere := nil;
  if not AWhere.IsEmpty then
    LWhere := TioWhereFactory.NewWhere.Add(AWhere);
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByClassRef')
                .ConstructorParams([AClassRef, TValue.From<IioWhere>(LWhere), TValue.From<TioViewDataType>(AViewDataType), AAutoLoadData]);
end;

class function TioDependencyInjection.LocateVM_byMasterBSA<T>(const AAlias: String;
  const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  const AMasterPropertyName: String): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterBindSourceAdapter')
                .ConstructorParams([TValue.From(AMasterBindSourceAdapter), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byMasterVM<T>(
  const AAlias:String; const AMasterViewModel:IioViewModel;
  const AMasterPropertyName:String=''): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterViewModel')
                .ConstructorParams([TValue.From(AMasterViewModel), AMasterPropertyName]);
end;

class function TioDependencyInjection.LocateVM_byMasterVMfromDI<T>(const AAlias,
  AMasterViewModelTypeName, AMasterViewModelTypeAlias,
  AMasterViewModelMasterPropertyName: String): IioDependencyInjectionLocator<T>;
begin
  Result := Self.Locate<T>
                .Alias(AAlias)
                .ConstructorMarker('CreateByMasterViewModelFromDependencyInjection')
                .ConstructorParams([AMasterViewModelTypeName, AMasterViewModelTypeAlias, AMasterViewModelMasterPropertyName]);
end;

{ TioDependencyInjectionRegister }

function TioDependencyInjectionRegister.Alias(const AAlias: String): TioDependencyInjectionRegister;
begin
  Self.FAlias := AAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.AsSingleton: TioDependencyInjectionRegister;
begin
  Self.FContainerValue.IsSingleton := True;
  Result := Self;
end;

constructor TioDependencyInjectionRegister.Create(const AContainerValue:TioDIContainerImplementersItem);
begin
  inherited Create;
  Self.FSetMapImplementersRef := True;
  Self.FContainerValue := AContainerValue;
end;

function TioDependencyInjectionRegister.DefaultConstructorMarker(const AValue: String): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.DefaultConstructorMarker := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.DefaultConstructorMethod(const AValue: String): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.DefaultConstructorMethod := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.DefaultConstructorParams(const AParams: array of TValue): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FContainerValue.DefaultConstructorParams, Length(AParams));
  for i := 0 to High(AParams) do FContainerValue.DefaultConstructorParams[i] := AParams[i];
  Result := Self;
end;

function TioDependencyInjectionRegister.DisableMapImplemetersRef: TioDependencyInjectionRegister;
begin
  Self.FSetMapImplementersRef := False;
  Result := Self;
end;

procedure TioDependencyInjectionRegister.Execute;
begin
  Self.LoadInjectAttributes;
  if FSetMapImplementersRef then
    Self.SetMapImplementersRef;
  Self.Container.Add(Self.FInterfaceName, Self.FAlias, Self.FContainerValue);
  Self.Free;
end;

function TioDependencyInjectionRegister.Implements(const AInterfaceName: String; const AAlias: String): TioDependencyInjectionRegister;
begin
  Self.FInterfaceName := AInterfaceName;
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.Implements<T>(const AAlias:String): TioDependencyInjectionRegister;
begin
  Result := Self.Implements(Self.InterfaceNameToString<T>, AAlias);
end;

function TioDependencyInjectionRegister.InjectField(const AFieldName: String;
  const AValue: TValue): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, I+1);
  FContainerValue.PropertiesOnCreate[I].PropFieldType  := itField;
  FContainerValue.PropertiesOnCreate[I].PropFieldValue := ivByValue;
  FContainerValue.PropertiesOnCreate[I].Name  := AFieldName;
  FContainerValue.PropertiesOnCreate[I].Value := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectProperty(const APropertyName: String;
  const AValue: TValue): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, I+1);
  FContainerValue.PropertiesOnCreate[I].PropFieldType  := itProperty;
  FContainerValue.PropertiesOnCreate[I].PropFieldValue := ivByValue;
  FContainerValue.PropertiesOnCreate[I].Name  := APropertyName;
  FContainerValue.PropertiesOnCreate[I].Value := AValue;
  Result := Self;
end;

procedure TioDependencyInjectionRegister.LoadInjectAttributes;
var
  LAttr: TCustomAttribute;
  LProp: TRttiProperty;
  LField: TRttiField;
  LTypeName: String;
begin
  // ===========================================================================
  // LOAD PROPERTIES "ioInject" ATTRIBUTES
  // ---------------------------------------------------------------------------
  // Loop for all properties
  for LProp in FContainerValue.RttiType.GetProperties do
    // Loop for all attributes
    for LAttr in LProp.GetAttributes do
      // I'm searching ioInject attribute
      if LAttr is ioInject then
      begin
        // If the TypeName property of the ioInject attribute is specified then use it else
        //  use the type of the property
        if ioInject(LAttr).TypeName.IsEmpty then
          LTypeName := LProp.PropertyType.Name
        else
          LTypeName := ioInject(LAttr).TypeName;
        // Regster injection info
        Self.InjectProperty(LProp.Name, LTypeName, ioInject(LAttr).TypeAlias);
      end;
  // ===========================================================================
  // LOAD FIELDS "ioInject" ATTRIBUTES
  // ---------------------------------------------------------------------------
  // Loop for all fields
  for LField in FContainerValue.RttiType.GetFields do
    // Loop for all attributes
    for LAttr in LField.GetAttributes do
      // I'm searching ioInject attribute
      if LAttr is ioInject then
      begin
        // If the TypeName property of the ioInject attribute is specified then use it else
        //  use the type of the field
        if ioInject(LAttr).TypeName.IsEmpty then
          LTypeName := LField.FieldType.Name
        else
          LTypeName := ioInject(LAttr).TypeName;
        // Regster injection info
        Self.InjectField(LField.Name, LTypeName, ioInject(LAttr).TypeAlias);
      end;
  // ===========================================================================
end;

procedure TioDependencyInjectionRegister.SetMapImplementersRef;
begin
  // Set a reference to the DIImplementersItem in the IioMap of the class
  //  for Inject properties after create pourpose even when the object
  //  is created by an ORM load.
 if  TioMapContainer.Exist(FContainerValue.ClassName) then
    TioMapContainer.GetMap(FContainerValue.ClassName, False).SetDIContainerImplementersItem(FContainerValue);
end;

function TioDependencyInjectionRegister.InjectField(const AFieldName, ATypeName,
  ATypeAlias: String): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, I+1);
  FContainerValue.PropertiesOnCreate[I].PropFieldType  := itField;
  FContainerValue.PropertiesOnCreate[I].PropFieldValue := ivByDependencyInjection;
  FContainerValue.PropertiesOnCreate[I].Name      := AFieldName;
  FContainerValue.PropertiesOnCreate[I].TypeName  := ATypeName;
  FContainerValue.PropertiesOnCreate[I].TypeAlias := ATypeAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectProperty(const APropertyName,
  ATypeName, ATypeAlias: String): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, I+1);
  FContainerValue.PropertiesOnCreate[I].PropFieldType  := itProperty;
  FContainerValue.PropertiesOnCreate[I].PropFieldValue := ivByDependencyInjection;
  FContainerValue.PropertiesOnCreate[I].Name      := APropertyName;
  FContainerValue.PropertiesOnCreate[I].TypeName  := ATypeName;
  FContainerValue.PropertiesOnCreate[I].TypeAlias := ATypeAlias;
  Result := Self;
end;

{ TioDependencyInjectionContainer }

class procedure TioDependencyInjectionContainer.Add(const AKey: TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey; const AValue: TioDIContainerImplementersItem);
begin
  // If the Key not exist then create the SubContainer and add it to the MasterContainer
  if not Self.FContainer.ContainsKey(AKey) then
    Self.FContainer.Add(AKey, TioDIContainerValue.Create);
  // Add the Value to the SubKey
  Self.FContainer.Items[AKey].Add(ASubKey, AValue);
end;

class procedure TioDependencyInjectionContainer.Build;
begin
  Self.FContainer := TioDIContainerInstance.Create([doOwnsValues]);
end;

class procedure TioDependencyInjectionContainer.CleanUp;
begin
  Self.FContainer.Free;
end;

class function TioDependencyInjectionContainer.Exists(const AKey: TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey): Boolean;
begin
  Result := Self.FContainer.ContainsKey(AKey) and Self.FContainer.Items[AKey].Contains(ASubKey);
end;

class function TioDependencyInjectionContainer.Get(const AKey: TioDIContainerKey; const ASubKey:TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  if not Self.Exists(AKey, ASubKey) then
    raise EioException.Create(Self.ClassName + ': implementer for interface "' + AKey + '" alias "' + ASubKey + '" not found.');
  Result := Self.FContainer.Items[AKey].GetItem(ASubKey);
end;

class function TioDependencyInjectionContainer.GetInterfaceImplementers(const AKey: TioDIContainerKey): TioDIContainerValue;
begin
  if not Self.ImplementersExists(AKey) then
    raise EioException.Create(Self.ClassName + ': implementers for interface "' + AKey + '" not found.');
  Result := Self.FContainer.Items[AKey];
end;

class function TioDependencyInjectionContainer.ImplementersExists(const AKey: TioDIContainerKey): Boolean;
begin
  Result := Self.FContainer.ContainsKey(AKey);
end;

{ TioDependencyInjectionLocator }

function TioDependencyInjectionLocator.Alias(const AAlias: String): IioDependencyInjectionLocator;
begin
  FAlias := AAlias;
  Result := Self;
end;

procedure TioDependencyInjectionLocator.CheckConstructorInfo(const AContainerItem: TioDIContainerImplementersItem);
var
  i: Integer;
begin
  // If a constructor method name or constructor marker is specified in the locator call then use it (method, marker and params)
  //  else use the default values
  if FConstructorMethod.IsEmpty and FConstructorMarker.IsEmpty and (Length(FConstructorParams) = 0) then
  begin
    FConstructorMethod := AContainerItem.DefaultConstructorMethod;
    FConstructorMarker := AContainerItem.DefaultConstructorMarker;
    // Solo così sembra andare bene
    SetLength(FConstructorParams, Length(AContainerItem.DefaultConstructorParams));
    for i := 0 to High(AContainerItem.DefaultConstructorParams) do
      FConstructorParams[i] := AContainerItem.DefaultConstructorParams[i];
  end;
end;

function TioDependencyInjectionLocator.ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator;
begin
  FConstructorMarker := AConstructorMarker;
  Result := Self;
end;

function TioDependencyInjectionLocator.ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator;
begin
  FConstructorMethod := AConstructorMethod;
  Result := Self;
end;

function TioDependencyInjectionLocator.ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FConstructorParams, Length(AParams));
  for i := 0 to High(AParams) do FConstructorParams[i] := AParams[i];
  Result := Self;
end;

constructor TioDependencyInjectionLocator.Create(const AInterfaceName, AAlias: String);
begin
  inherited Create;
  FInterfaceName := AInterfaceName;
  FAlias := AAlias;
  FViewModel := nil;
  FViewModelMarker := '';
  FSingletonKey := '';
end;

function TioDependencyInjectionLocator.Exist: Boolean;
begin
  Result := Self.Container.Exists(Self.FInterfaceName, Self.FAlias);
end;

function TioDependencyInjectionLocator.Get: TObject;
var
  ContainerItem: TioDIContainerImplementersItem;
begin
  Result := nil;
  // Retrieve the Class Type Reference
  ContainerItem := Self.Container.Get(FInterfaceName, FAlias);
  // if then ViewModel is present then Lock it (MVVM)
  if Self.ViewModelExist then
  begin
    TioViewModelShuttleContainer.Add(FViewModel, FViewModelMarker);
  end;
  try
    // If it is a singleton then get the Instance (if exists)...
    if  ContainerItem.IsSingleton
    and TioSingletonsContainer.TryGet(FSingletonKey, FInterfaceName, FAlias, Result)
    then
      // Nothing
    // ... else create the object (and add it to the ContainerItem.ObjInstance if
    //  it is a new instance of a singleton)
    else
    begin
      // If a constructor method name or constructor marker is specified in the locator call then use it (method, marker and params)
      //  else use the default values
      Self.CheckConstructorInfo(ContainerItem);
      // Object creation
      Result := TioObjectMaker.CreateObjectByClassRefEx(ContainerItem.ClassRef, FConstructorParams, FConstructorMarker, FConstructorMethod);
      // If it is a new instance of a singleton then add it to the SingletonsContainer
      if ContainerItem.IsSingleton then
        TioSingletonsContainer.Add(FSingletonKey, FInterfaceName, FAlias, Result);
    end;
  finally
    // if the ViewModel is present then UnLock it (MVVM)
    if Self.ViewModelExist then
    begin
      TioViewModelShuttleContainer.TryDelete(FViewModelMarker);
    end;
  end;
end;

function TioDependencyInjectionLocator.GetItem: TioDIContainerImplementersItem;
begin
  Result := Self.Container.Get(Self.FInterfaceName, Self.FAlias);
end;

function TioDependencyInjectionLocator.VM_byClass(
  const AInterfaceName, AAlias: String; const AClassRef: TioClassRef;
  const AWhere: String; const AViewDataType: TioViewDataType;
  const AAutoLoadData: Boolean;
  const AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byClass(AInterfaceName, AAlias, AClassRef, AWhere, AViewDataType, AAutoLoadData).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byDataObj(
  const AInterfaceName, AAlias: String; const ADataIntf: IInterface;
  const AViewDataType: TioViewDataType;
  const AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byDataObj(AInterfaceName, AAlias, ADataIntf, AViewDataType).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byDataObj(
  const AInterfaceName, AAlias: String; const ADataObject: TObject;
  const AViewDataType: TioViewDataType;
  const AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byDataObj(AInterfaceName, AAlias, ADataObject, AViewDataType).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byMasterVMfromDI(
  const AInterfaceName, AAlias, AMasterViewModelTypeName,
  AMasterViewModelTypeAlias, AMasterViewModelMasterPropertyName,
  AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byTypeName(AInterfaceName, AAlias, AMasterViewModelTypeName, AMasterViewModelTypeAlias, AMasterViewModelMasterPropertyName).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byMasterVM(
  const AInterfaceName, AAlias: String; const AMasterViewModel: IioViewModel;
  const AMasterPropertyName, AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byMasterVM(AInterfaceName, AAlias, AMasterViewModel, AMasterPropertyName).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byMasterBSA(
  const AInterfaceName, AAlias: String;
  const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  const AMasterPropertyName, AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byMasterBSA(AInterfaceName, AAlias, AMasterBindSourceAdapter, AMasterPropertyName).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator;
begin
  FSingletonKey := ASingletonKey;
  Result := Self;
end;

function TioDependencyInjectionLocator.VM(const AViewModel: IioViewModel; const AMarker:String): IioDependencyInjectionLocator;
begin
  FViewModelMarker := AMarker;
  FViewModel := AViewModel;
  Result := Self;
end;

function TioDependencyInjectionLocator.VM_byTypeName(const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String; const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList; const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byTypeName(AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias, AWhere, AViewDataType, AAutoLoadData).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byMasterBS(const AInterfaceName, AAlias: String; const AMasterBindSource: TioMasterBindSource;
  const AMasterPropertyName, AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byMasterBS(AInterfaceName, AAlias, AMasterBindSource, AMasterPropertyName).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.VM_byBSA(const AInterfaceName, AAlias: String;
  ABindSourceAdapter: IioActiveBindSourceAdapter; const AMarker: String): IioDependencyInjectionLocator;
var
  LObj: TObject;
begin
  LObj := TioDependencyInjection.LocateVM_byBSA(AInterfaceName, AAlias, ABindSourceAdapter).Get;
  Result := Self.VM(
    TioRttiUtilities.ObjectAsIioViewModel(LObj),
    AMarker
    );
end;

function TioDependencyInjectionLocator.ViewModelExist: Boolean;
begin
  Result := Assigned(Self.FViewModel);
end;

{ TioDependencyInjectionFactory }

class function TioDependencyInjectionFactory.GetLocator(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionLocator.Create(AInterfaceName, AAlias);
end;

class function TioDependencyInjectionFactory.GetLocator<TI>(const AAlias:String): IioDependencyInjectionLocator<TI>;
begin
  Result := TioDependencyInjectionLocator<TI>.Create(Self.InterfaceNameToString<TI>, AAlias);
end;

class function TioDependencyInjectionFactory.GetRegister(const AContainerValue:TioDIContainerImplementersItem): TioDependencyInjectionRegister;
begin
  Result := TioDependencyInjectionRegister.Create(AContainerValue);
end;

{ TioDependencyInjectionLocator<T> }

function TioDependencyInjectionLocator<TI>.Alias(const AAlias: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).Alias(AAlias);
end;

function TioDependencyInjectionLocator<TI>.ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorMarker(AConstructorMarker);
end;

function TioDependencyInjectionLocator<TI>.ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorMethod(AConstructorMethod);
end;

function TioDependencyInjectionLocator<TI>.ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorParams(AParams);
end;

function TioDependencyInjectionLocator<TI>.Get: TI;
begin
  Result := TioRttiUtilities.CastObjectToGeneric<TI>(inherited Get);
end;

function TioDependencyInjectionLocator<TI>.VM_byClass(const AInterfaceName,
  AAlias: String; const AClassRef: TioClassRef; const AWhere: String;
  const AViewDataType: TioViewDataType; const AAutoLoadData: Boolean;
  const AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byClass(AInterfaceName, AAlias, AClassRef, AWhere, AViewDataType, AAutoLoadData, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byDataObj(const AInterfaceName,
  AAlias: String; const ADataIntf: IInterface;
  const AViewDataType: TioViewDataType;
  const AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byDataObj(AInterfaceName, AAlias, ADataIntf, AViewDataType, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byDataObj(const AInterfaceName,
  AAlias: String; const ADataObject: TObject;
  const AViewDataType: TioViewDataType;
  const AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byDataObj(AInterfaceName, AAlias, ADataObject, AViewDataType, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byMasterVMfromDI(const AInterfaceName,
  AAlias, AMasterViewModelTypeName, AMasterViewModelTypeAlias,
  AMasterViewModelMasterPropertyName,
  AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byMasterVMfromDI(AInterfaceName, AAlias, AMasterViewModelTypeName, AMasterViewModelTypeAlias, AMasterViewModelMasterPropertyName, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byMasterVM(const AInterfaceName,
  AAlias: String; const AMasterViewModel: IioViewModel;
  const AMasterPropertyName,
  AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byMasterVM(AInterfaceName, AAlias, AMasterViewModel, AMasterPropertyName, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byMasterBSA(const AInterfaceName,
  AAlias: String; const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  const AMasterPropertyName,
  AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byMasterBSA(AInterfaceName, AAlias, AMasterBindSourceAdapter, AMasterPropertyName, AMarker);
end;

function TioDependencyInjectionLocator<TI>.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SingletonKey(ASingletonKey);
end;

function TioDependencyInjectionLocator<TI>.VM_byTypeName(
  const AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias:String;
  const AWhere:String=''; const AViewDataType:TioViewDataType=TioViewDataType.dtList;
  const AAutoLoadData:Boolean=True; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byTypeName(AInterfaceName, AAlias, AModelTypeName, AModelTypeAlias, AWhere, AViewDataType, AAutoLoadData, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byMasterBS(
  const AInterfaceName, AAlias:String; const AMasterBindSource:TioMasterBindSource;
   const AMasterPropertyName:String=''; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byMasterBS(AInterfaceName, AAlias, AMasterBindSource, AMasterPropertyName, AMarker);
end;

function TioDependencyInjectionLocator<TI>.VM_byBSA(const AInterfaceName, AAlias:String;
  ABindSourceAdapter:IioActiveBindSourceAdapter; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM_byBSA(AInterfaceName, AAlias, ABindSourceAdapter, AMarker);
end;

function TioDependencyInjectionLocator<TI>.ViewModel(const AViewModel: IioViewModel; const AMarker:String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VM(AViewModel, AMarker);
end;


{ TioDependencyInjectionResolverBase }

class function TioDependencyInjectionResolverBase.Resolve(const ATypeName:String; const AAlias: String; const AResolverMode:TioResolverMode): IioResolvedTypeList;
var
  AImplementer: TioDIContainerImplementersItem;
  AImplementerCollection: TioDIContainerImplementers;
  AMap: IioMap;
begin
  // Create the ResolvedTypeList
  Result := TioResolverFactory.GetResolvedTypeList;
  // If ATypeName is not an interface (is a class) then
  //  return it and exit;
  if not TioRttiUtilities.IsAnInterfaceTypeName(ATypeName) then
  begin
    Result.Add(ATypeName);
    Exit;
  end;
  // If ResolverMode = rmAll and Alias is NOT specified
  if (AResolverMode = rmAll) and AAlias.IsEmpty then
  begin
    // Get the collection of the classes implementing the interface
    AImplementerCollection := Self.Container.GetInterfaceImplementers(ATypeName);
    // Loop for all the implementers
    for AImplementer in AImplementerCollection do
    begin
      // Get the map for the current implementer
      AMap := TioMapContainer.GetMap(AImplementer.ClassName);
      // NB: Solo le classi (implementers) che non derivino da classi anch'esse contenute nell'elenco degli implementers (per evitare duplicati)
      if (not AMap.HasMappedAncestor)
      or (not AImplementerCollection.ContainsClass(   AMap.AncestorMap.GetClassRef.ClassName   ))
      then
        Result.Add(AImplementer.ClassName);
    end;
  end
  // If Alias IS specified
  else
    Result.Add(   Self.Container.Get(ATypeName, AAlias).ClassName   );
end;

{ TioDIContainerImplementers }

procedure TioDIContainerImplementers.Add(const AAlias: String; const AImplementerItem: TioDIContainerImplementersItem);
begin
  FInternalContainer.AddOrSetValue(AAlias, AImplementerItem);
  Self.BuildClassesList;
end;

procedure TioDIContainerImplementers.BuildClassesList;
var
  AImplementersItem: TioDIContainerImplementersItem;
begin
  FClassesList := '';
  for AImplementersItem in FInternalContainer.Values do
    FClassesList := FClassesList + '<' + AImplementersItem.ClassName + '>';
end;

function TioDIContainerImplementers.Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AAlias);
end;

function TioDIContainerImplementers.ContainsClass(const AClassName: String): Boolean;
begin
  Result := FClassesList.Contains('<'+AClassName+'>');
end;

constructor TioDIContainerImplementers.Create;
begin
  inherited;
  FInternalContainer := TObjectDictionary<string, TioDIContainerImplementersItem>.Create([doOwnsValues]);
end;

destructor TioDIContainerImplementers.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioDIContainerImplementers.GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
begin
  Result := FInternalContainer.Values.GetEnumerator;
end;

function TioDIContainerImplementers.GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  Result := FInternalContainer.Items[AAlias];
end;

initialization
// NB: Spostato sulla initialize della unit iORM
//  TioDependencyInjectionContainer.Build;
//  TioViewModelShuttle.Build;

finalization
  TioDependencyInjectionContainer.CleanUp;

end.
