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
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.Interfaces, System.Rtti, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Components.ViewContextProvider,
  iORM.MVVM.Components.ModelPresenter.Custom, System.SysUtils, iORM.AbstractionLayer.Framework;

type

  TioViewModel = class(TDataModule, IInterface, IioViewModel) // NB: Esplicito l'implementazione di IInterface altrimenti ci sono problemi
  private
    { Private declarations }
    FCommands: IioCommandsContainer;
    FViewRegister: IioViewRegister;
  protected
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    [Volatile] FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; reintroduce; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
// ---------------- End: section added for IInterface support ---------------
    // DefaultPresenter
    function GetDefaultPresenter: TioModelPresenter;
    // Presenter
    function GetPresenter(const AName: String): TioModelPresenter;
    // Command
    function GetCommand(const ACmdName: String): IioCommandsContainerItem;
    procedure SetCommand(const ACmdName: String; const Value: IioCommandsContainerItem);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Commands: IioCommandsContainer;
    procedure RegisterView(const AView, AViewContext: TComponent;
      const AViewContextProvider:TioViewContextProvider;
      const AViewContextFreeMethod:TProc);
    procedure FreeViews;
    procedure HideViews;
    procedure ShowViews;
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
    property DefaultPresenter:TioModelPresenter read GetDefaultPresenter;
    property Presenter[const AName:String]:TioModelPresenter read GetPresenter;
  end;
// ---------------- Start: section added for IInterface support ---------------
  {$IFNDEF SYSTEM_HPP_DEFINES_OBJECTS}
//  {$NODEFINE TInterfacedObject}         { defined in systobj.h }
  {$ENDIF}
// ---------------- End: section added for IInterface support ---------------


implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses iORM.Exceptions, iORM.RttiContext.Factory,
  iORM.MVVM.Factory, Data.Bind.ObjectScope,
  iORM.LiveBindings.Factory, iORM;

{$R *.dfm}

{ TioViewModel }





// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
procedure TioViewModel.AfterConstruction;
begin
  inherited;
// Release the constructor's implicit refcount
  AtomicDecrement(FRefCount);
end;

procedure TioViewModel.BeforeDestruction;
begin
  inherited;
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

function TioViewModel.GetDefaultPresenter: TioModelPresenter;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ComponentCount-1 do
    if (Components[I] is TioModelPresenter)
    and TioModelPresenter(Components[I]).AsDefault
    then
      Exit(TioModelPresenter(Components[I]));
end;

function TioViewModel.GetPresenter(const AName: String): TioModelPresenter;
var
  LComponent: TComponent;
begin
  // If the ANAme param is empty then return de default presenter
  if AName.IsEmpty then
    Exit(GetDefaultPresenter);
  LComponent := FindComponent(AName);
  if not (Assigned(LComponent) and (LComponent is TioModelPresenter)) then
    raise EioException.Create(Self.ClassName, 'GetPresenters', Format('ModelPresenter named "%s" not found.', [AName]));
  Result := TioModelPresenter(LComponent);
end;

procedure TioViewModel.HideViews;
begin
  FViewRegister.HideAllViewContexts;
end;

function TioViewModel.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioViewModel.RegisterView(const AView, AViewContext: TComponent;
  const AViewContextProvider: TioViewContextProvider;
  const AViewContextFreeMethod: TProc);
begin
  FViewRegister.Add(AView, AViewContext, AViewContextProvider, AViewContextFreeMethod);
end;

procedure TioViewModel.SetCommand(const ACmdName: String;
  const Value: IioCommandsContainerItem);
begin
  Commands.AddOrUpdate(ACmdName, Value);
end;

procedure TioViewModel.ShowViews;
begin
  FViewRegister.ShowAllViewContexts;
end;

procedure TioViewModel.TerminateApplication;
begin
  io.TerminateApplication;
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

function TioViewModel.Commands: IioCommandsContainer;
begin
  Result := FCommands;
end;

constructor TioViewModel.Create(AOwner: TComponent);
begin
  inherited;
  // Init
  FCommands :=  TioMVVMFactory.NewCommandsContainer(Self);
  FViewRegister := TioMVVMFactory.NewViewRegister;
end;

destructor TioViewModel.Destroy;
begin

  inherited;
end;

procedure TioViewModel.FreeViews;
begin
  FViewRegister.ReleaseAllViewContexts;
end;

end.
