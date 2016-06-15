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



unit iORM.MVVM.ViewModelBase;

interface

uses
  System.Classes, iORM.MVVM.Interfaces,
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces, System.Rtti, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, System.Generics.Collections;

type

  TioViewModel = class(TDataModule, IioViewModel)
  private
    { Private declarations }
    FViewData: IioViewData;
    FCommands: IioCommandsContainer;
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
    function GetViewInvokables: IioCommandsContainer;
    procedure SetAutoLoadData(const Value: Boolean);
    procedure SetMasterBindSource(const Value: TObject);
    procedure SetMasterPropertyName(const Value: String);
    procedure SetTypeAlias(const Value: String);
    procedure SetTypeName(const Value: String);
    procedure SetViewDataType(const Value: TioViewDataType);
    procedure SetWhere(const Value: IioWhere);
    procedure BindActions(const AView:TComponent);
    procedure BindAction(const AType:TRttiType; const AView:TComponent; const AComponentName, AActionName: String);
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
    function GetActionByName(AActionName: String): TBasicAction;
    procedure BindView(const AView:TComponent);
    property ViewInvokables: IioCommandsContainer read GetViewInvokables;
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









function TioViewModel.GetActionByName(AActionName: String): TBasicAction;
var
  AObj: TObject;
begin
  // Init
  Result := nil;
  AObj := nil;
  if AActionName.Trim = '' then raise EioException.Create(ClassName + ': invalid action name!');
  // Find the action
  AObj := FindComponent(AActionName);
  // If found then return the action itself
  if Assigned(AObj) and (AObj is TBasicAction) then
    Exit(AObj as TBasicAction);
  // Else raise an exception
  raise EioException.Create(ClassName + ': action "' + AActionName + '" not found!');
end;

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

function TioViewModel.GetViewInvokables: IioCommandsContainer;
begin
  Result := FCommands;
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

procedure TioViewModel.BindAction(const AType:TRttiType; const AView:TComponent; const AComponentName, AActionName: String);
var
  AObj: TObject;
  AProp: TRttiProperty;
  AAction: TBasicAction;
  AValue: TValue;
begin
  // Get RttiProperty
  AProp := AType.GetProperty('Action');
  if not Assigned(AProp) then EioException.Create(Self.ClassName + ': RttiProperty not found!');
  // Get the object
  AObj := AView.FindComponent(AComponentName);
  if not Assigned(AObj) then EioException.Create(Self.ClassName + ': View component not found!');
  // Get action
  AAction := Self.GetActionByName(AActionName);
  if not Assigned(AAction) then EioException.Create(Self.ClassName + ': Action not found!');
  // Set the action property of the object
  AValue := TValue.From<TBasicAction>(AAction);
  AProp.SetValue(AObj, AValue);
end;

procedure TioViewModel.BindActions(const AView: TComponent);
var
  Typ: TRttiType;
  Fld: TRttiField;
  Attr: TCustomAttribute;
begin
  // Retrieve the RttiType of the view
  Typ := TioRttiContextFactory.RttiContext.GetType(AView.ClassType);
  for Fld in Typ.GetFields do
    for Attr in Fld.GetAttributes do
      if Attr is ioBindAction then
        Self.BindAction(Fld.FieldType, AView, Fld.Name, ioBindAction(Attr).Value);
end;

procedure TioViewModel.BindView(const AView: TComponent);
begin
  // Bind the VMActions to the View controls
  Self.BindActions(AView);
  // Regsiter the ViewActions/ViewMethods/ViewAnonimousMethods of the View for VMNotifications
  //  to che NotifyContainer of the ViewModel
//  Self.ViewInvokables.BindViewInvokables(AView);
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

constructor TioViewModel.Create;
begin
  inherited Create(nil);
  // Init
  FViewData := nil;
  FCommands :=  TioMVVMFactory.NewCommandsContainer(Self);
end;

end.
