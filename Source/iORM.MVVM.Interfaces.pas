{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.MVVM.Interfaces;

interface

uses
  System.Classes, System.SysUtils, iORM.CommonTypes, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ViewContextProvider, iORM.MVVM.ViewRegisterItem,
  iORM.LiveBindings.Interfaces;

{$I ioGlobalDef.inc}   // io global definitions

type

  IioViewAction = interface;
  IioVMAction = interface;
  IioVMActionContainer = interface;
  IioViewRegister = interface;

  // Public interface of ViewModels
  IioViewModel = interface(IInvokable)
    ['{B8A32927-A4DA-4B8D-8545-AB68DEDF17BC}']
    function VMActions: IioVMActionContainer;
    // VMAction property
    function GetVMAction(const AName: String): IioVMAction;
    property VMAction[const AName: String]: IioVMAction read GetVMAction;
    // Presenter property
    function GetPresenter(const AName: String): IioNotifiableBindSource;
    property Presenter[const AName: String]: IioNotifiableBindSource read GetPresenter;
    // DefaultPresenter property
    function GetDefaultPresenter: IioNotifiableBindSource;
    property DefaultPresenter: IioNotifiableBindSource read GetDefaultPresenter;
  end;

  // Private interface of ViewModels for INTERNAL USE ONLY
  IioViewModelInternal = interface(IioViewModel)
    ['{7DA6A783-6026-47C2-BFF7-83BF6FECFD2F}']
    procedure RegisterView(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider; const AViewContextFreeMethod: TProc);
    procedure DoOnViewPairing;
    procedure FreeViews;
    procedure HideViews;
    procedure ShowViews;
    procedure BindView(const AView: TComponent);
  end;

  IioViewRegister = interface
    ['{7E0B50E8-B561-44E2-A8A0-6A13CA563875}']
    procedure Add(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider; const AViewContextFreeMethod: TProc);
    procedure ReleaseAllViewContexts;
    procedure HideAllViewContexts;
    procedure ShowAllViewContexts;
    function GetItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function GetItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
    property ItemByView[const AView: TComponent]: TioViewContextRegisterItem read GetItemByView;
    property ItemByViewContext[const AViewContext: TComponent]: TioViewContextRegisterItem read GetItemByViewContext;
  end;

  IioVMAction = interface
    ['{B4D9E2D3-3B43-490E-AD58-2D7584B87A3A}']
    function HandlesTarget(Target: TObject): Boolean;
    // Methods
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure UnbindViewAction(const AViewAction: IioViewAction);
    procedure Execute;
    procedure Update;
    // Caption property
    procedure SetCaption(const Value: string);
    function GetCaption: String;
    property Caption: string read GetCaption write SetCaption;
    // Enabled property
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // Name property
    procedure SetName(const NewName: TComponentName);
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName;
    // Owner
    function GetOwnerComponent: TComponent;
    property Owner: TComponent read GetOwnerComponent;
    // Visible property
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  IioViewAction = interface
    ['{CAC456AA-579C-4139-B24B-7C620E91B14B}']
    // Methods
    procedure DoBeforeExecute;
    procedure DoAfterExecute;
    procedure DoBeforeUpdate;
    procedure DoAfterUpdate;
    // Caption property
    procedure SetCaption(const Value: string);
    function GetCaption: String;
    property Caption: string read GetCaption write SetCaption;
    // CaptionLinkedToAction property
    procedure SetCaptionLinkedToVMAction(Value: Boolean);
    function GetCaptionLinkedToVMAction: Boolean;
    property CaptionLinkedToVMAction: Boolean read GetCaptionLinkedToVMAction write SetCaptionLinkedToVMAction;
    // Enabled
    procedure SetEnabled(Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // EnabledLinkedToAction property
    procedure SetEnabledLinkedToVMAction(Value: Boolean);
    function GetEnabledLinkedToVMAction: Boolean;
    property EnabledLinkedToVMAction: Boolean read GetEnabledLinkedToVMAction write SetEnabledLinkedToVMAction;
    // Name property
    procedure SetName(const NewName: TComponentName);
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName;
    // Visible
    procedure SetVisible(Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
    // EnabledLinkedToAction property
    procedure SetVisibleLinkedToVMAction(Value: Boolean);
    function GetVisibleLinkedToVMAction: Boolean;
    property VisibleLinkedToVMAction: Boolean read GetVisibleLinkedToVMAction write SetVisibleLinkedToVMAction;
    // VMAction property
    procedure SetVMAction(Value: IioVMAction);
    function GetVMAction: IioVMAction;
    property VMAction: IioVMAction read GetVMAction write SetVMAction;
    // VMActionName property
    procedure SetVMActionName(Value: String);
    function GetVMActionName: String;
    property VMActionName: String read GetVMActionName write SetVMActionName;
  end;

  IioVMActionContainer = interface
    ['{E20F72CB-9F84-44B4-A6DD-DFF73B53F0AC}']
    procedure _InternalLoadVMActions(const AViewOrViewModel: TComponent);
    procedure Add(const AVMAction: IioVMAction);
    procedure Remove(AName: String);
    function Get(const AName: String; const ANoException: Boolean = False): IioVMAction;
    function Contains(const AName: String): Boolean;
    procedure CopyVMActions(const ADestVMActionContainer: IioVMActionContainer);
    procedure CopyVMAction(const AName: String; const ADestVMActionContainer: IioVMActionContainer);
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure BindView(const AView: TComponent);
  end;

implementation

end.
