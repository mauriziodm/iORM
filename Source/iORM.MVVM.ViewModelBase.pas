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



unit iORM.MVVM.ViewModelBase;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Classes, iORM.MVVM.Interfaces,
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces, System.Rtti, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Components.ViewContextProvider;

type

  TioViewModel = class(TDataModule, IioViewModel)
  private
    { Private declarations }
    FViewData: IioViewData;
    FCommands: IioCommandsContainer;
    FViews: IioVMViews;  // Per ora la lascio nascosta, deciderò poi se renderla pubblica (Solo RegisterView è pubblico come metodo del ViewModel).
    FioTypeName, FioTypeAlias: String;
    FioMasterViewModelTypeName, FioMasterViewModelTypeAlias: String;
    FioMasterViewModel: IioViewModel;
    FIoMasterBindSource: TioMasterBindSource;
    FioMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    FIoMasterPropertyName: String;
    FioWhere: IioWhere;
    FioAutoLoadData: Boolean;
    FioViewDataType: TioViewDataType;
    function GetAutoLoadData: Boolean;
    function GetMasterBindSource: TObject;
    function GetMasterPropertyName: String;
    function GetTypeAlias: String;
    function GetTypeName: String;
    function GetViewDataType: TioViewDataType;
    function GetWhere: IioWhere;
    procedure SetAutoLoadData(const Value: Boolean);
    procedure SetMasterBindSource(const Value: TObject);
    procedure SetMasterPropertyName(const Value: String);
    procedure SetTypeAlias(const Value: String);
    procedure SetTypeName(const Value: String);
    procedure SetViewDataType(const Value: TioViewDataType);
    procedure SetWhere(const Value: IioWhere);
  protected
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    [Volatile] FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
// ---------------- End: section added for IInterface support ---------------
    procedure ioLoadViewData;
    procedure SetMasterViewModel(AMasterViewModel: IioViewModel);
    function GetMasterViewModel: IioViewModel;
  public
    { Public declarations }

    // Constructors
    constructor Create; overload;  // Non togliere assolutamente altrimenti non vengono più bindate le Actions
    [ioMarker('CreateByDataObject')]
    constructor Create(const ADataObj:TObject; const AViewDataType:TioViewDataType); overload;
    [ioMarker('CreateByDataInterface')]
    constructor Create(const ADataIntf:IInterface; const AViewDataType:TioViewDataType); overload;
    [ioMarker('CreateByClassRef')]
    constructor Create(const AClassRef:TioClassRef; const AioWhere:IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean=True); overload;
    [ioMarker('CreateByTypeName')]
    constructor Create(const ATypeName, ATypeAlias:String; const AioWhere:IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean=True); overload;
    [ioMarker('CreateByBindSourceAdapter')]
    constructor Create(const ABindSourceAdapter:IioActiveBindSourceAdapter); overload;
    [ioMarker('CreateByMasterBindSource')]
    constructor Create(const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''); overload;
    [ioMarker('CreateByMasterBindSourceAdapter')]
    constructor Create(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String=''); overload;
    [ioMarker('CreateByMasterViewModel')]
    constructor Create(const AMasterViewModel:IioViewModel; const AMasterPropertyName:String=''); overload;
    [ioMarker('CreateByMasterViewModelFromDependencyInjection')]
    constructor Create(const AMasterViewModelTypeName, AMasterViewModelTypeAlias:String; const AMasterViewModelMasterPropertyName:String=''); overload;
    // End constructors

    function ViewData: IioViewData;
    function Commands: IioCommandsContainer;
    function BindView(const AView:TComponent): Byte;
    function LocalVCProvider(const AName:String=''; const AGlobalIfNotFound:Boolean=True): TioViewContextProvider;
    procedure UnbindView(const AViewID:Byte);
    procedure FreeViews;
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property RefCount: Integer read FRefCount;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------
  published
    property ioTypeName:String read GetTypeName write SetTypeName;
    property ioTypeAlias:String read GetTypeAlias write SetTypeAlias;
    property ioWhere:IioWhere read GetWhere write SetWhere;
    property ioMasterBindSource:TObject read GetMasterBindSource write SetMasterBindSource;
    property ioMasterPropertyName:String read GetMasterPropertyName write SetMasterPropertyName;
    property ioAutoLoadData:Boolean read GetAutoLoadData write SetAutoLoadData;
    property ioViewDataType:TioViewDataType read GetViewDataType write SetViewDataType;
  end;
// ---------------- Start: section added for IInterface support ---------------
  {$IFNDEF SYSTEM_HPP_DEFINES_OBJECTS}
//  {$NODEFINE TInterfacedObject}         { defined in systobj.h }
  {$ENDIF}
// ---------------- End: section added for IInterface support ---------------


implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses System.SysUtils, iORM.Exceptions, iORM.RttiContext.Factory,
  iORM.MVVM.Factory, Data.Bind.ObjectScope,
  iORM.LiveBindings.Factory, iORM;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TioViewModel }





// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
procedure TioViewModel.AfterConstruction;
begin
// Release the constructor's implicit refcount
  AtomicDecrement(FRefCount);
end;

procedure TioViewModel.BeforeDestruction;
begin
  if RefCount <> 0 then
    Error(reInvalidPtr);
end;

class function TioViewModel.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TioViewModel(Result).FRefCount := 1;
end;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------

function TioViewModel.GetAutoLoadData: Boolean;
begin
  Result := FioAutoLoadData;
end;

function TioViewModel.GetMasterBindSource: TObject;
begin
  Result := FIoMasterBindSource;
end;

function TioViewModel.GetMasterPropertyName: String;
begin
  Result := FIoMasterPropertyName;
end;

function TioViewModel.GetMasterViewModel: IioViewModel;
begin
  Result := FioMasterViewModel;
end;

function TioViewModel.GetTypeAlias: String;
begin
  Result := FioTypeAlias;
end;

function TioViewModel.GetTypeName: String;
begin
  Result := FioTypeName;
end;

function TioViewModel.GetViewDataType: TioViewDataType;
begin
  Result := FioViewDataType;
end;

function TioViewModel.GetWhere: IioWhere;
begin
  // If the ViewData is assigned then return the ViewData.ActiveBindSourceAdapter
  //  Where and set the local ioWhere too.
  //  Else return the local Where object
  if Assigned(FViewData) then
    FioWhere := FViewData.ActiveBindSourceAdapter.ioWhere;  // Set the internal field directly
  Result := FioWhere;
end;

constructor TioViewModel.Create(const ADataObj: TObject; const AViewDataType:TioViewDataType);
begin
  Self.Create;
  FViewData := TioMVVMFactory.ViewData(ADataObj, AViewDataType);
end;

constructor TioViewModel.Create(const ABindSourceAdapter: IioActiveBindSourceAdapter);
begin
  Self.Create;
  FViewData := TioMVVMFactory.ViewData(ABindSourceAdapter);
end;

function TioViewModel.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TioViewModel.BindView(const AView: TComponent): Byte;
begin
  // Register view into the ViewsContainer of the VM
  Result := FViews.RegisterView(AView);
  // Bind the view to che commands of the VM
  FCommands.BindView(AView);
end;

procedure TioViewModel.SetAutoLoadData(const Value: Boolean);
begin
  FioAutoLoadData := Value;
end;

procedure TioViewModel.SetMasterBindSource(const Value: TObject);
begin
  FIoMasterBindSource := Value as TioMasterBindSource;
end;

procedure TioViewModel.SetMasterPropertyName(const Value: String);
begin
  FIoMasterPropertyName := Value;
end;

procedure TioViewModel.SetMasterViewModel(AMasterViewModel: IioViewModel);
begin
  FioMasterViewModel := AMasterViewModel;
end;

procedure TioViewModel.SetTypeAlias(const Value: String);
begin
  FioTypeAlias := Value;
end;

procedure TioViewModel.SetTypeName(const Value: String);
begin
  FioTypeName := Value;
end;

procedure TioViewModel.SetViewDataType(const Value: TioViewDataType);
begin
  FioViewDataType := Value;
end;

procedure TioViewModel.SetWhere(const Value: IioWhere);
begin
  FioWhere := Value;
  if Assigned(FViewData) then
    FViewData.ActiveBindSourceAdapter.ioWhere := Value;
end;

procedure TioViewModel.UnbindView(const AViewID:Byte);
begin
  FViews.UnregisterView(AViewID);
end;

function TioViewModel.ViewData: IioViewData;
begin
  if not Assigned(FViewData) then
  begin
    Self.ioLoadViewData;
  end;
  Result := FViewData;
end;

function TioViewModel._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TioViewModel._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

constructor TioViewModel.Create(const ATypeName, ATypeAlias:String; const AioWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean);
begin
  Self.Create;
  FioTypeName := ATypeName;
  FioTypeAlias := ATypeAlias;
  FIoWhere := AIoWhere;
  FioViewDataType := AViewDataType;
  FioAutoLoadData := AAutoLoadData;
end;

constructor TioViewModel.Create(const AClassRef: TioClassRef; const AioWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean);
begin
  Self.Create;
  FioTypeName     := AClassRef.ClassName;
  FioTypeAlias    := '';
  FIoWhere        := AioWhere;
  FioViewDataType := AViewDataType;
  FioAutoLoadData := AAutoLoadData;
end;

constructor TioViewModel.Create(const AMasterBindSource: TioMasterBindSource; const AMasterPropertyName: String);
begin
  Self.Create;
  FIoMasterBindSource := AMasterBindSource;
  FIoMasterPropertyName := AMasterPropertyName;
end;

constructor TioViewModel.Create(const ADataIntf: IInterface; const AViewDataType: TioViewDataType);
begin
  Self.Create;
  FViewData := TioMVVMFactory.ViewData(ADataIntf, AViewDataType);
end;

procedure TioViewModel.ioLoadViewData;
var
  AObj: TObject;
begin
  // Checks
  if Assigned(FViewData) then
    raise EioException.Create(Self.ClassName + ': "ViewData" is already assigned!');
  // If there is a MasterViewModel...
  if Assigned(FioMasterViewModel) then
    FViewData := TioMVVMFactory.ViewData(FioMasterViewModel, FIoMasterPropertyName)
  // If  FioMasterViewModelTypeName is specified (retrieve the MasterVM by Dependency Injection)
  else if not FioMasterViewModelTypeName.IsEmpty then
  begin
    AObj := io.di.Locate(FioMasterViewModelTypeName, FioMasterViewModelTypeAlias).Get;
    if not Supports(AObj, IioViewModel, FioMasterViewModel) then
      raise EioException.Create(Self.ClassName + ': The "IioViewModel" interface is not implemented by object.');
    FViewData := TioMVVMFactory.ViewData(FioMasterViewModel, FIoMasterPropertyName)
  end
  // If there is a MasterBindSource then create the ViewData by MasterBindSource
  //  else create it by TypeName, TypeAlias.........
  else if Assigned(FIoMasterBindSource) then
    FViewData := TioMVVMFactory.ViewData(FIoMasterBindSource, FIoMasterPropertyName)
  // If there is a MasterBindSourceAdapter...
  else if Assigned(FioMasterBindSourceAdapter) then
    FViewData := TioMVVMFactory.ViewData(FioMasterBindSourceAdapter, FIoMasterPropertyName)
  // If there is a TypeName
  else if not FioTypeName.IsEmpty then
    FViewData := TioMVVMFactory.ViewData(FioTypeName, FioTypeAlias, FIoWhere, FioViewDataType, FioAutoLoadData);
end;

function TioViewModel.LocalVCProvider(const AName: String;
  const AGlobalIfNotFound: Boolean): TioViewContextProvider;
begin
  Result := nil;
  // Find local view context providers
  Result := FViews.FindVCProvider(AName);
end;

constructor TioViewModel.Create(const AMasterBindSourceAdapter: IioActiveBindSourceAdapter; const AMasterPropertyName: String);
begin
  Self.Create;
  FioMasterBindSourceAdapter := AMasterBindSourceAdapter;
  FIoMasterPropertyName := AMasterPropertyName;
end;

constructor TioViewModel.Create(const AMasterViewModel: IioViewModel; const AMasterPropertyName: String);
begin
  Self.Create;
  FioMasterViewModel := AMasterViewModel;
  FIoMasterPropertyName := AMasterPropertyName;
end;

function TioViewModel.Commands: IioCommandsContainer;
begin
  Result := FCommands;
end;

constructor TioViewModel.Create(const AMasterViewModelTypeName, AMasterViewModelTypeAlias,
  AMasterViewModelMasterPropertyName: String);
begin
  Self.Create;
  FioMasterViewModelTypeName := AMasterViewModelTypeName;
  FioMasterViewModelTypeAlias := AMasterViewModelTypeAlias;
  FIoMasterPropertyName := AMasterViewModelMasterPropertyName;
end;

procedure TioViewModel.FreeViews;
begin
  FViews.ReleaseAllViewContexts;
end;

constructor TioViewModel.Create;
begin
  inherited Create(nil);
  // Init
  FViewData := nil;
  FCommands :=  TioMVVMFactory.NewCommandsContainer(Self);
  FViews := TioMVVMFactory.VMViews;
end;

end.
