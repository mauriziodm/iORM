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
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Components.ViewContextProvider,
  iORM.MVVM.Components.ModelPresenter;

type

  TioViewModel = class(TDataModule, IioViewModel)
  private
    { Private declarations }
    FCommands: IioCommandsContainer;
    FViews: IioVMViews;  // Per ora la lascio nascosta, deciderò poi se renderla pubblica (Solo RegisterView è pubblico come metodo del ViewModel).
  protected
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    [Volatile] FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
// ---------------- End: section added for IInterface support ---------------
    // Presenters
    function GetPresenters(const AName: String): TioModelPresenter;
    // Command
    function GetCommand(const ACmdName: String): IioCommandsContainerItem;
    procedure SetCommand(const ACmdName: String; const Value: IioCommandsContainerItem);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function Commands: IioCommandsContainer;
    function BindView(const AView:TComponent): Byte;
    function LocalVCProvider(const AName:String=''; const AGlobalIfNotFound:Boolean=True): TioViewContextProvider;
    procedure UnbindView(const AViewID:Byte);
    procedure FreeViews;
    procedure TerminateApplication;
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property RefCount: Integer read FRefCount;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------
    // Properties
    property Command[const ACmdName:String]:IioCommandsContainerItem read GetCommand write SetCommand;
    property Presenters[const AName:String]:TioModelPresenter read GetPresenters;
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

function TioViewModel.GetCommand(
  const ACmdName: String): IioCommandsContainerItem;
begin
  // Get the CommandItem if exist
  Result := Commands.Get(ACmdName, False);
end;

function TioViewModel.GetPresenters(const AName: String): TioModelPresenter;
var
  LComponent: TComponent;
begin
  LComponent := FindComponent(AName);
  if not (Assigned(LComponent) and (LComponent is TioModelPresenter)) then
    raise EioException.Create(Self.ClassName, 'GetPresenters', Format('ModelPresenter named "%s" not found.', [AName]));
  Result := TioModelPresenter(LComponent);
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

procedure TioViewModel.SetCommand(const ACmdName: String;
  const Value: IioCommandsContainerItem);
begin
  Commands.AddOrUpdate(ACmdName, Value);
end;

procedure TioViewModel.TerminateApplication;
begin
  io.TerminateApplication;
end;

procedure TioViewModel.UnbindView(const AViewID:Byte);
begin
  FViews.UnregisterView(AViewID);
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

function TioViewModel.LocalVCProvider(const AName: String;
  const AGlobalIfNotFound: Boolean): TioViewContextProvider;
begin
  Result := nil;
  // Find local view context providers
  Result := FViews.FindVCProvider(AName);
end;

function TioViewModel.Commands: IioCommandsContainer;
begin
  Result := FCommands;
end;

constructor TioViewModel.Create(AOwner: TComponent);
begin
  inherited;
  // Init
  FCommands :=  TioMVVMFactory.NewCommandsContainer(Self);
  FViews := TioMVVMFactory.VMViews;
end;

procedure TioViewModel.FreeViews;
begin
  FViews.ReleaseAllViewContexts;
end;

end.
