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



unit iORM.DependencyInjection;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.Interfaces,
  System.SyncObjs, iORM.DependencyInjection.Interfaces, System.Rtti,
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces,
  iORM.Resolver.Interfaces, iORM.Context.Container,
  iORM.DependencyInjection.Singletons, iORM.DependencyInjection.Implementers,
  iORM.MVVM.Components.ViewContextProvider,
  iORM.MVVM.Components.ModelPresenter, iORM.Where.Interfaces, System.Classes;

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
  end;

  // ===========================================================================
  // CLASS REGISTER
  // ---------------------------------------------------------------------------
  // Register Class
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
    function Implements<T: IInterface>(const AAlias:String=''): TioDependencyInjectionRegister; overload;
    function Implements(const IID:TGUID; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    function Alias(const AAlias:String): TioDependencyInjectionRegister;
    function InjectProperty(const APropertyName:String; const AValue:TValue):TioDependencyInjectionRegister; overload;
    function InjectProperty(const APropertyName, ATypeName:String; const ATypeAlias:String=''):TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName:String; const AValue:TValue):TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName, ATypeName:String; const ATypeAlias:String=''):TioDependencyInjectionRegister; overload;
    function AsSingleton(const AIsSingleton:Boolean=True):TioDependencyInjectionRegister;
    function DefaultConstructorMethod(const AValue:String): TioDependencyInjectionRegister;
    function DefaultConstructorMarker(const AValue:String): TioDependencyInjectionRegister;
    function DefaultConstructorParams(const AParams: array of TValue): TioDependencyInjectionRegister;
    function DisableMapImplemetersRef: TioDependencyInjectionRegister;
    function SetPresenter(const AName:String; const ADataObject:TObject): TioDependencyInjectionRegister; overload;
    function SetPresenter(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): TioDependencyInjectionRegister; overload;
    function SetPresenter(const AName:String; const AMasterPresenter:TioModelPresenter; const AMasterPropertyName:String=''): TioDependencyInjectionRegister; overload;
    function SetPresenter(const AName:String; const AWhere:IioWhere): TioDependencyInjectionRegister; overload;
    function SetPresenter(const AName:String; const AOrderBy:String): TioDependencyInjectionRegister; overload;
  end;
  // ===========================================================================

  // ===========================================================================
  // CLASS LOCATOR
  // ---------------------------------------------------------------------------
  TioDependencyInjectionLocator = class(TioDependencyInjectionBase, IioDependencyInjectionLocator)
  strict private
    FInterfaceName: String;
    FAlias: String;
    FConstructorMethod: String;
    FConstructorMarker: String;
    FConstructorParams: array of TValue;
    FPresenterSettings: TArray<TioDIPresenterSettings>;
    FViewModel: IioViewModel;
    FViewModelMarker: String;
    FSingletonKey: String;
    FVCProvider: TioViewContextProvider;
    FVCProviderEnabled, FEmptyOwner: Boolean;
    FViewContext: TComponent;  // For directly passed ViewContext (TCOmponent descendant) without the use of a ViewContextProvider
    procedure ClearPresenterSettings;
    function PresenterSettingsExists: Boolean;
    function ViewModelExist: Boolean;
    procedure CheckConstructorInfo(const AContainerItem: TioDIContainerImplementersItem);
  strict protected
    function _Get(const AContainerItem: TioDIContainerImplementersItem): TObject;
    property _InterfaceName:String read FInterfaceName;
    property _Alias:String read FAlias;
  public
    constructor Create(const AInterfaceName:String; const AAlias:String; const AEmptyOwner, AVCProviderEnabled:Boolean); virtual;
    function Exist: Boolean; virtual;
    function Get: TObject; virtual;
    function GetItem: TioDIContainerImplementersItem;
    function Alias(const AAlias:String): IioDependencyInjectionLocator;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator; virtual;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator; virtual;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator; virtual;
    function SingletonKey(const ASingletonKey:String): IioDependencyInjectionLocator; virtual;
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator;
    function SetPresenter(const AName:String; const ADataObject:TObject): IioDependencyInjectionLocator; overload;
    function SetPresenter(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    function SetPresenter(const AName:String; const AMasterPresenter:TioModelPresenter; const AMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    function SetPresenter(const AName:String; const AWhere:IioWhere): IioDependencyInjectionLocator; overload;
    function SetPresenter(const AName:String; const AOrderBy:String): IioDependencyInjectionLocator; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider:TioViewContextProvider): IioDependencyInjectionLocator; overload;
    function VCProvider(const AName:String): IioDependencyInjectionLocator; overload;
    function SetViewContext(const AViewContext: TComponent): IioDependencyInjectionLocator;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
  end;
  // Generic version of the Service Locator Class
  TioDependencyInjectionLocator<TI> = class(TioDependencyInjectionLocator, IioDependencyInjectionLocator<TI>)
  public
    function Get: TI; overload;
    function Alias(const AAlias:String): IioDependencyInjectionLocator<TI>;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator<TI>; overload;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>; overload;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>; overload;
    function SingletonKey(const ASingletonKey:String): IioDependencyInjectionLocator<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    function SetPresenter(const AName:String; const ADataObject:TObject): IioDependencyInjectionLocator<TI>; overload;
    function SetPresenter(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>; overload;
    function SetPresenter(const AName:String; const AMasterPresenter:TioModelPresenter; const AMasterPropertyName:String=''): IioDependencyInjectionLocator<TI>; overload;
    function SetPresenter(const AName:String; const AWhere:IioWhere): IioDependencyInjectionLocator<TI>; overload;
    function SetPresenter(const AName:String; const AOrderBy:String): IioDependencyInjectionLocator<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider:TioViewContextProvider): IioDependencyInjectionLocator<TI>; overload;
    function VCProvider(const AName:String): IioDependencyInjectionLocator<TI>; overload;
    function SetViewContext(const AViewContext: TComponent): IioDependencyInjectionLocator<TI>;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
  end;
  // ===========================================================================


  // Class for ResolverByDependencyInjection
  TioDependencyInjectionResolverBase = class(TioDependencyInjectionBase)
  public
    // ResolveInaccurate in pratica per cercare almeno una classe che implementa l'interfaccia.
    //  Se l'alias è vuoto e non c'è una classe registrata che implementa l'interfaccia senza Alias (ma
    //  ne esiste almeno una registrata anche se con un alias) ritorna quella.
    class function ResolveInaccurateAsRttiType(const ATypeName:String; const AAlias:String): TRttiType;
    class function Resolve(const ATypeName:String; const AAlias:String; const AResolverMode:TioResolverMode): IioResolvedTypeList;
  end;

  // Main Dependency Injection Class (and relative class reference)
  TioDependencyInjectionRef = class of TioDependencyInjection;
  TioDependencyInjection = class(TioDependencyInjectionBase)
  public
    class function RegisterClass<T: class>: TioDependencyInjectionRegister; overload;
    class function RegisterClass(const ARttiType:TRttiInstanceType): TioDependencyInjectionRegister; overload;
    class function Locate(const AInterfaceName:String; const AAlias:String=''): IioDependencyInjectionLocator; overload;
    class function Locate<T:IInterface>(const AAlias:String=''): IioDependencyInjectionLocator<T>; overload;
    class function LocateView(const AInterfaceName:String; const AAlias:String=''): IioDependencyInjectionLocator; overload;
    class function LocateView<T:IInterface>(const AAlias:String=''): IioDependencyInjectionLocator<T>; overload;
    class function LocateView<TView:IInterface; TViewModel:IioViewModel>(const AViewAlias:String=''; const AViewModelAlias:String=''; const AViewModelMarker:String=''): IioDependencyInjectionLocator<TView>; overload;
    class function LocateViewModel(const AInterfaceName:String; const AAlias:String=''): IioDependencyInjectionLocator; overload;
    class function LocateViewModel<T:IInterface>(const AAlias:String=''): IioDependencyInjectionLocator<T>; overload;
    class function Singletons: TioSingletonsFacadeRef;
  end;

  // Dependency Injection Factory
  TioDependencyInjectionFactory = class abstract(TioDependencyInjectionBase)
  private
  public
    class function GetRegister(const AContainerValue:TioDIContainerImplementersItem): TioDependencyInjectionRegister;
    class function GetLocator(const AInterfaceName:String; const AAlias:String; const AEmptyOwner, AVCProviderEnabled:Boolean): IioDependencyInjectionLocator; overload;
    class function GetLocator<TI>(const AAlias:String; const AEmptyOwner, AVCProviderEnabled:Boolean): IioDependencyInjectionLocator<TI>; overload;
  end;

implementation

uses
{$IFDEF ioVCL}
  Vcl.Controls,
{$ENDIF}
{$IFDEF ioFMX}
  Fmx.Types,
  Fmx.Controls,
{$ENDIF}
  iORM, iORM.Exceptions, SysUtils, System.TypInfo, iORM.ObjectsForge.ObjectMaker,
  iORM.Rtti.Utilities, iORM.Resolver.Factory, iORM.RttiContext.Factory,
  iORM.Context.Map.Interfaces,
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Attributes, iORM.Where.Factory,
  iORM.MVVM.ViewContextProviderContainer,
  iORM.MVVM.ViewContextContainer, iORM.ObjectsForge.Interfaces,
  iORM.MVVM.ViewModelBase;

{ TioDependencyInjectionBase }

class function TioDependencyInjectionBase.Container: TioDependencyInjectionContainerRef;
begin
  Result := TioDependencyInjectionContainer;
end;

{ TioDependencyInjection }

class function TioDependencyInjection.Locate(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, False, False);
end;

class function TioDependencyInjection.Locate<T>(const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, False, False);
end;

class function TioDependencyInjection.LocateView(const AInterfaceName,
  AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, True, True);
end;

class function TioDependencyInjection.LocateView<TView, TViewModel>(const AViewAlias,
  AViewModelAlias, AViewModelMarker: String): IioDependencyInjectionLocator<TView>;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDependencyInjectionFactory.GetLocator<TView>(AViewAlias, True, True);
  // Get the ViewModel instance
  LViewModel := io.di.LocateViewModel<TViewModel>(AViewModelAlias).Get;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateView<T>(
  const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, True, True);
end;

class function TioDependencyInjection.LocateViewModel(const AInterfaceName,
  AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, True, False);
end;

class function TioDependencyInjection.LocateViewModel<T>(
  const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, True, False);
end;

class function TioDependencyInjection.RegisterClass(
  const ARttiType:TRttiInstanceType): TioDependencyInjectionRegister;
var
  ContainerValue: TioDIContainerImplementersItem;
begin
  ContainerValue := TioDIContainerImplementersItem.Create;
  ContainerValue.ClassRef := ARttiType.MetaclassType;
  ContainerValue.ClassName := ARttiType.MetaclassType.ClassName;
  ContainerValue.RttiType := ARttiType;
  ContainerValue.IsSingleton := False;
  Result := TioDependencyInjectionFactory.GetRegister(ContainerValue);
end;

class function TioDependencyInjection.RegisterClass<T>: TioDependencyInjectionRegister;
begin
  Result := RegisterClass(   TioRttiUtilities.ClassRefToRttiType(T)   );
end;

class function TioDependencyInjection.Singletons: TioSingletonsFacadeRef;
begin
  Result := TioSingletonsFacade;
end;

{ TioDependencyInjectionRegister }

function TioDependencyInjectionRegister.Alias(const AAlias: String): TioDependencyInjectionRegister;
begin
  Self.FAlias := AAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.AsSingleton(const AIsSingleton:Boolean): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.IsSingleton := AIsSingleton;
  Result := Self;
end;

constructor TioDependencyInjectionRegister.Create(const AContainerValue:TioDIContainerImplementersItem);
begin
  inherited Create;
  Self.FSetMapImplementersRef := True;
  Self.FContainerValue := AContainerValue;
  Self.FInterfaceName := AContainerValue.ClassName;  // Così si possono registrare anche direttamente le classi senza interfaccia
  Self.FAlias := '';
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

function TioDependencyInjectionRegister.Implements(const IID:TGUID;
  const AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  Self.FInterfaceName := TioRttiUtilities.GetImplementedInterfaceName(FContainerValue.RttiType, IID);
  // Set the interface GUID
  FContainerValue.InterfaceGUID := IID;
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.Implements<T>(const AAlias:String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  Self.FInterfaceName := TioRttiUtilities.GenericToString<T>;
  // Set the interface GUID
  FContainerValue.InterfaceGUID := TioRttiUtilities.TypeInfoToGUID(TypeInfo(T));
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
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

function TioDependencyInjectionRegister.SetPresenter(const AName: String;
  const AWhere: IioWhere): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, I+1);
  FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstWhere;
  FContainerValue.PresenterSettings[I].Name  := AName;
  FContainerValue.PresenterSettings[I].InterfacedObj  := AWhere;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetPresenter(const AName: String;
  const ADataObject: TObject): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, I+1);
  FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstDataObject;
  FContainerValue.PresenterSettings[I].Name := AName;
  FContainerValue.PresenterSettings[I].Obj := ADataObject;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetPresenter(const AName: String;
  const ABindSourceAdapter: IioActiveBindSourceAdapter): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, I+1);
  FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstBindSourceAdapter;
  FContainerValue.PresenterSettings[I].Name := AName;
  FContainerValue.PresenterSettings[I].InterfacedObj  := ABindSourceAdapter;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetPresenter(const AName: String;
  const AMasterPresenter: TioModelPresenter;
  const AMasterPropertyName: String): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, I+1);
  FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstMasterModelPresenter;
  FContainerValue.PresenterSettings[I].Name  := AName;
  FContainerValue.PresenterSettings[I].Obj  := AMasterPresenter;
  FContainerValue.PresenterSettings[I].StringParameter := AMasterPropertyName;
  Result := Self;
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

function TioDependencyInjectionRegister.SetPresenter(const AName,
  AOrderBy: String): TioDependencyInjectionRegister;
var
  I: Integer;
begin
  I := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, I+1);
  FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstOrderBy;
  FContainerValue.PresenterSettings[I].Name := AName;
  FContainerValue.PresenterSettings[I].StringParameter := AOrderBy;
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

procedure TioDependencyInjectionLocator.ClearPresenterSettings;
begin
  SetLength(FPresenterSettings, 0);
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

constructor TioDependencyInjectionLocator.Create(const AInterfaceName, AAlias: String; const AEmptyOwner, AVCProviderEnabled:Boolean);
begin
  inherited Create;
  FInterfaceName := AInterfaceName;
  FAlias := AAlias;
  FViewModel := nil;
  FViewModelMarker := '';
  FVCProvider := nil;
  FVCProviderEnabled := AVCProviderEnabled;
  FViewContext := nil;
  FEmptyOwner := AEmptyOwner;
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
  ContainerItem := Self.Container.Get(_InterfaceName, _Alias);
  Result := Self._Get(ContainerItem);
end;

function TioDependencyInjectionLocator.GetItem: TioDIContainerImplementersItem;
begin
  Result := Self.Container.Get(Self.FInterfaceName, Self.FAlias);
end;

function TioDependencyInjectionLocator.PresenterSettingsExists: Boolean;
begin
  Result := (Length(FPresenterSettings) > 0);
end;

function TioDependencyInjectionLocator.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator;
begin
  FSingletonKey := ASingletonKey;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetPresenter(const AName: String;
  const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
var
  I: Integer;
begin
  I := Length(FPresenterSettings);
  SetLength(FPresenterSettings, I+1);
  FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstBindSourceAdapter;
  FPresenterSettings[I].Name := AName;
  FPresenterSettings[I].InterfacedObj  := ABindSourceAdapter;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetPresenter(const AName: String;
  const ADataObject: TObject): IioDependencyInjectionLocator;
var
  I: Integer;
begin
  I := Length(FPresenterSettings);
  SetLength(FPresenterSettings, I+1);
  FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstDataObject;
  FPresenterSettings[I].Name := AName;
  FPresenterSettings[I].Obj := ADataObject;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetPresenter(const AName: String;
  const AMasterPresenter: TioModelPresenter;
  const AMasterPropertyName: String): IioDependencyInjectionLocator;
var
  I: Integer;
begin
  I := Length(FPresenterSettings);
  SetLength(FPresenterSettings, I+1);
  FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstMasterModelPresenter;
  FPresenterSettings[I].Name  := AName;
  FPresenterSettings[I].Obj  := AMasterPresenter;
  FPresenterSettings[I].StringParameter := AMasterPropertyName;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetPresenter(const AName,
  AOrderBy: String): IioDependencyInjectionLocator;
var
  I: Integer;
begin
  I := Length(FPresenterSettings);
  SetLength(FPresenterSettings, I+1);
  FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstOrderBy;
  FPresenterSettings[I].Name := AName;
  FPresenterSettings[I].StringParameter := AOrderBy;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetPresenter(const AName: String;
  const AWhere: IioWhere): IioDependencyInjectionLocator;
var
  I: Integer;
begin
  I := Length(FPresenterSettings);
  SetLength(FPresenterSettings, I+1);
  FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstWhere;
  FPresenterSettings[I].Name  := AName;
  FPresenterSettings[I].InterfacedObj  := AWhere;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetViewContext(
  const AViewContext: TComponent): IioDependencyInjectionLocator;
begin
  Result := Self;
  FViewContext := AViewContext;
end;

function TioDependencyInjectionLocator.SetViewModel(const AViewModel: IioViewModel; const AMarker:String): IioDependencyInjectionLocator;
begin
  FViewModelMarker := AMarker;
  FViewModel := AViewModel;
  Result := Self;
end;

function TioDependencyInjectionLocator._Get(
  const AContainerItem: TioDIContainerImplementersItem): TObject;
begin
  Result := nil;
  // if then ViewModel is present then Lock it (MVVM)
  //  and initializa it with PresenterSettings if exists
  if Self.ViewModelExist then
  begin
    if PresenterSettingsExists then
    begin
      TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(FViewModel as TObject, @FPresenterSettings);
      ClearPresenterSettings;
    end;
    TioViewModelShuttleContainer.AddViewModel(FViewModel, FViewModelMarker);
  end;
  try
    // EmptyOwner is True then add a nil as parameter for the constructor
    //  (used for Views and ViewModels and for object owned by someone)
    if FEmptyOwner and (Length(FConstructorParams) = 0) then
      FConstructorParams := [TValue.Empty];
    // If it is a singleton then get the Instance (if exists)...
    if  AContainerItem.IsSingleton
    and TioSingletonsContainer.TryGet(FSingletonKey, FInterfaceName, FAlias, Result)
    then
      // Nothing
    // ... else create the object (and add it to the ContainerItem.ObjInstance if
    //  it is a new instance of a singleton)
    else
    begin
      // If a constructor method name or constructor marker is specified in the locator call then use it (method, marker and params)
      //  else use the default values
      Self.CheckConstructorInfo(AContainerItem);
      // Object creation
//      Result := TioObjectMaker.CreateObjectByClassRefEx(AContainerItem.ClassRef, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      Result := TioObjectMaker.CreateObjectByRttiTypeEx(AContainerItem.RttiType, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      // If some PresenterSettings exists and the result object is a ViewModel then
      //  apply it
      if PresenterSettingsExists and Supports(Result, IioViewModel) then
        TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(Result, @FPresenterSettings);
      // If it is a new instance of a singleton then add it to the SingletonsContainer
      if AContainerItem.IsSingleton then
        TioSingletonsContainer.Add(FSingletonKey, FInterfaceName, FAlias, Result);
    end;
    // If the use of the ViewContextProvider is enabled (Locating a View)
    //  then try to retrieve and set the ViewContext for the View.
    //  If a specific VCProvider is already assigned then use it else try
    //  to retrieve the global default one, if not exist then do none
    //  (no ViewContext assigned to the view).
    //  NB: Se è stato specificato un ViewContext esplicito (SetViewContext), usa quello
    if FVCProviderEnabled and (Result is TComponent) then
    begin
      if Assigned(FViewContext) then
      begin
        // Set the ViewContext as Owner of the view
        TComponent(Result).InsertComponent(FViewContext);
        // Set the ViewContext as parent view
        {$IFDEF ioVCL}
          (Result as TControl).Parent := (FViewContext as TWinControl);
        {$ENDIF}
        {$IFDEF ioFMX}
          (Result as TFmxObject).Parent := (FViewContext as TFmxObject);
        {$ENDIF}
      end
      else
      begin
        if not Assigned(FVCProvider) then
          FVCProvider := TioViewContextProviderContainer.GetProvider;
        if Assigned(FVCProvider) then
          TioViewContextContainer.NewViewContext(TComponent(Result), FVCProvider);
      end;
    end;
  finally
    // if the ViewModel is present then UnLock it (MVVM)
    if Self.ViewModelExist then
      TioViewModelShuttleContainer.DeleteViewModel(FViewModelMarker);
  end;
end;

function TioDependencyInjectionLocator.VCProvider(
  const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator;
begin
  Result := Self;
  FVCProvider := AVCProvider;
end;

function TioDependencyInjectionLocator.VCProvider(
  const AName: String): IioDependencyInjectionLocator;
begin
  Result := Self;
  FVCProvider := TioViewContextProviderContainer.GetProvider(AName);
end;

function TioDependencyInjectionLocator.ViewModelExist: Boolean;
begin
  Result := Assigned(Self.FViewModel);
end;

{ TioDependencyInjectionFactory }

class function TioDependencyInjectionFactory.GetLocator(const AInterfaceName, AAlias: String; const AEmptyOwner, AVCProviderEnabled:Boolean): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionLocator.Create(AInterfaceName, AAlias, AEmptyOwner, AVCProviderEnabled);
end;

class function TioDependencyInjectionFactory.GetLocator<TI>(const AAlias:String; const AEmptyOwner, AVCProviderEnabled:Boolean): IioDependencyInjectionLocator<TI>;
begin
  Result := TioDependencyInjectionLocator<TI>.Create(TioRttiUtilities.GenericToString<TI>, AAlias, AEmptyOwner, AVCProviderEnabled);
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
var
  ContainerItem: TioDIContainerImplementersItem;
begin
  ContainerItem := Self.Container.Get(_InterfaceName, _Alias);
  Result := TioRttiUtilities.CastObjectToGeneric<TI>(
    _Get(ContainerItem),
    ContainerItem.InterfaceGUID
    );
end;

function TioDependencyInjectionLocator<TI>.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SingletonKey(ASingletonKey);
end;

function TioDependencyInjectionLocator<TI>.SetPresenter(const AName: String;
  const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetPresenter(AName, ABindSourceAdapter);
end;

function TioDependencyInjectionLocator<TI>.SetPresenter(const AName: String;
  const ADataObject: TObject): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetPresenter(AName, ADataObject);
end;

function TioDependencyInjectionLocator<TI>.SetPresenter(const AName: String;
  const AMasterPresenter: TioModelPresenter;
  const AMasterPropertyName: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetPresenter(AName, AMasterPresenter, AMasterPropertyName);
end;

function TioDependencyInjectionLocator<TI>.SetPresenter(const AName,
  AOrderBy: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetPresenter(AName, AOrderBy);
end;

function TioDependencyInjectionLocator<TI>.SetPresenter(const AName: String;
  const AWhere: IioWhere): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetPresenter(AName, AWhere);
end;

function TioDependencyInjectionLocator<TI>.VCProvider(
  const AName: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VCProvider(AName);
end;

function TioDependencyInjectionLocator<TI>.VCProvider(
  const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VCProvider(AVCProvider);
end;

function TioDependencyInjectionLocator<TI>.SetViewContext(
  const AViewContext: TComponent): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetViewContext(AViewContext);
end;

function TioDependencyInjectionLocator<TI>.SetViewModel(const AViewModel: IioViewModel; const AMarker:String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetViewModel(AViewModel, AMarker);
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

class function TioDependencyInjectionResolverBase.ResolveInaccurateAsRttiType(
  const ATypeName, AAlias: String): TRttiType;
var
  LResolvedTypeList: IioResolvedTypeList;
  LFirstResolvedClassName: String;
  LFirstResolvedClassMap: IioMap;
begin
  // Resolve the type and alias
  LResolvedTypeList := Self.Resolve(ATypeName, AAlias, TioResolverMode.rmAll);
  // Se non trova nemmeno una classe solleva un'eccezione
  if LResolvedTypeList.Count = 0 then
    raise EioException.Create(Self.ClassName, 'ResolveInaccurateAsRttiType', Format('No class was found that implements the interface ("%s" alias "%s").', [ATypeName, AAlias]));
  // Get the first resolved class name
  LFirstResolvedClassName := LResolvedTypeList[0];
  // Get the map of the first resolved class
  LFirstResolvedClassMap := TioMapContainer.GetMap(LFirstResolvedClassName);
  // Ritorna la prima classe trovata che implementa l'interfaccia desiderata
  Result := LFirstResolvedClassMap.RttiType;
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
