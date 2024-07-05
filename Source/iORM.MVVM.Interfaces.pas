{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.MVVM.Interfaces;

interface

uses
  System.Classes, System.SysUtils, iORM.CommonTypes, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ViewContextProvider, iORM.MVVM.ViewRegisterItem,
  iORM.LiveBindings.Interfaces, iORM.StdActions.Interfaces;

{$I ioGlobalDef.inc}   // io global definitions

type

  IioViewAction = interface;
  IioVMAction = interface;
  IioVMActionContainer = interface;
  IioViewRegisterMVVM = interface;

  // Public interface of ViewModels
  IioViewModel = interface(IInvokable)
    ['{B8A32927-A4DA-4B8D-8545-AB68DEDF17BC}']
    function _CanClose: Boolean;
    function _BSCloseQueryAssigned: Boolean;
    function _GetBSCloseQuery: IioBSCloseQueryAction;
    procedure _BSCloseQueryExecute;
    function CloseQuery: Boolean;
    function VMActions: IioVMActionContainer;
    // VCProvider local register
    function VCProviderByName(const AVCProviderName: String): TioViewContextProvider;
    procedure RegisterVCProvider(const AProvider:TioViewContextProvider);
    procedure UnregisterVCProvider(const AProvider:TioViewContextProvider);
    // VMAction property
    function GetVMAction(const AName: String): IioVMAction;
    property VMAction[const AName: String]: IioVMAction read GetVMAction;
    // Presenter property
    function GetPresenter(const AName: String): IioBindSource;
    property Presenter[const AName: String]: IioBindSource read GetPresenter;
    // DefaultPresenter property
    function GetDefaultPresenter: IioBindSource;
    property DefaultPresenter: IioBindSource read GetDefaultPresenter;
  end;

  // Private interface of ViewModels for INTERNAL USE ONLY
  IioViewModelInternal = interface(IioViewModel)
    ['{7DA6A783-6026-47C2-BFF7-83BF6FECFD2F}']
    procedure BindView(const AView: TComponent);
    procedure Close;
    procedure DoOnViewPairing;
    function ViewRegister: IioViewRegisterMVVM;
  end;

  IioViewRegisterBase = interface
    ['{7E0B50E8-B561-44E2-A8A0-6A13CA563875}']
    procedure AddOrUpdate(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider; const AViewContextFreeMethod: TProc);
    function ContainsView(const AView:TComponent): Boolean;
    function ContainsViewContext(const AViewContext:TComponent): Boolean;
    function GetCount: Integer;
    function GetItemByView(const AView: TComponent): TioViewContextRegisterItem;
    function GetItemByViewContext(const AViewContext: TComponent): TioViewContextRegisterItem;
    function GetView(const Index: Integer): TComponent;
    property Count: Integer read GetCount;
    property ItemByView[const AView: TComponent]: TioViewContextRegisterItem read GetItemByView;
    property ItemByViewContext[const AViewContext: TComponent]: TioViewContextRegisterItem read GetItemByViewContext;
    property View[const ViewIndex: integer]: TComponent read GetView;
  end;

  IioViewRegisterMVVM = interface(IioViewRegisterBase)
    ['{393A4A67-841A-4253-90AE-224FC8564615}']
    procedure ReleaseAllViewContexts;
    procedure HideAllViewContexts;
    procedure ShowAllViewContexts;
  end;

  IioVMAction = interface
    ['{B4D9E2D3-3B43-490E-AD58-2D7584B87A3A}']
    function HandlesTarget(Target: TObject): Boolean;
    // Methods
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure UnbindViewAction(const AViewAction: IioViewAction);
    function Update: Boolean;
    function Execute: Boolean;
    // Checked property (Carlo Marona 2024/05/29)
    procedure SetChecked(const Value: Boolean);
    function GetChecked: Boolean;
    property Checked: Boolean read GetChecked write SetChecked;
    // Enabled property
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // Name property (note: _InternalGetName instead peoperty Name to avoid problem with name property on the designer when copy and paste)
    function _InternalGetName: TComponentName;
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
    // Checked property
    procedure SetChecked(Value: Boolean);
    function GetChecked: Boolean;
    property Checked: Boolean read GetChecked write SetChecked;
    // CheckedLinkedToVMAction property
    procedure SetCheckedLinkedToVMAction(Value: Boolean);
    function GetCheckedLinkedToVMAction: Boolean;
    property CheckedLinkedToVMAction: Boolean read GetCheckedLinkedToVMAction write SetCheckedLinkedToVMAction;
    // Enabled property
    procedure SetEnabled(Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // EnabledLinkedToAction property
    procedure SetEnabledLinkedToVMAction(Value: Boolean);
    function GetEnabledLinkedToVMAction: Boolean;
    property EnabledLinkedToVMAction: Boolean read GetEnabledLinkedToVMAction write SetEnabledLinkedToVMAction;
    // Name property (note: _InternalGetName instead peoperty Name to avoid problem with name property on the designer when copy and paste)
    function _InternalGetName: TComponentName;
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
    function BSCloseQueryAction: IioBSCloseQueryVMAction;
    function BSCloseQueryActionExists: Boolean;
  end;

  IioLocalVCProviderRegister = interface
    ['{1469D78D-00F7-418A-B7D6-CE6D1AE2635E}']
    procedure BindView(const AView: TComponent);
    procedure RegisterVCProvider(const AVCProvider:TioViewContextProvider);
    procedure UnregisterVCProvider(const AVCProvider:TioViewContextProvider);
    function VCProviderByName(const AName:String): TioViewContextProvider;
  end;

  IioGlobalVCProviderRegister = interface(IioLocalVCProviderRegister)
    ['{2828166E-8D1A-42AE-9FF2-FD7BE8CD5CFE}']
    procedure SetDefaultVCProvider(const AVCProvider:TioViewContextProvider);
    procedure SetDefaultVCProviderByName(const AName:String);
    function DefaultVCProvider: TioViewContextProvider;
  end;

implementation

end.
