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
unit iORM.MVVM.ViewModelBridge;

interface

uses
  System.Classes, iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces;

type

  TioViewModelBridge = class;

  TioNeedViewModelEvent = procedure(Sender: TioViewModelBridge; var AViewModel: IioViewModel) of object;

  TioViewModelBridge = class(TComponent)
  private
    FViewModel: IioViewModel;
    FDI_VMAlias: String;
    FDI_VMInterface: String;
    FDI_VMMarker: String;
    // Events
    FOnNeedViewModel: TioNeedViewModelEvent;
    function Get_Version: String;
    procedure AutoSetClientComponentsOnCreate;
    procedure DoNeedViewModel;
    // VMActions
    function GetVMActions: IioVMActionContainer;
    // VMAction
    function GetVMAction(const AName: String): IioVMAction;
    // Default presenter
    function GetDefaultPresenter: IioBindSource;
    // Presenter
    function GetPresenter(const AName: String): IioBindSource;
    // ViewModel
    function GetViewModel: IioViewModel;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function ExtractVMBridge(const AView: TComponent): TioViewModelBridge;
    procedure CheckForViewModel;
    function ViewModelIsAssigned: Boolean;
    function ViewModelAs<T: IInterface>: T;
    // Properties
    property ViewModel: IioViewModel read GetViewModel;
    property VMActions: IioVMActionContainer read GetVMActions;
    property VMAction[const AName: String]: IioVMAction read GetVMAction; default;
    property DefaultPresenter: IioBindSource read GetDefaultPresenter;
    property Presenter[const AName: String]: IioBindSource read GetPresenter;
  published
    // Events
    property OnNeedViewModel: TioNeedViewModelEvent read FOnNeedViewModel write FOnNeedViewModel;
    // Properties
    property DI_VMInterface: String read FDI_VMInterface write FDI_VMInterface;
    property DI_VMAlias: String read FDI_VMAlias write FDI_VMAlias;
    property DI_VMMarker: String read FDI_VMMarker write FDI_VMMarker;
    property _Version: String read Get_Version;
  end;

implementation

uses
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Utilities,
  System.SysUtils, iORM.Exceptions, iORM.Components.Common.Interfaces,
  iORM, iORM.Abstraction, iORM.DB.ConnectionDef, System.Threading;

{ TioViewModelBridge }

procedure TioViewModelBridge.AutoSetClientComponentsOnCreate;
var
  I: Integer;
  LVMBridgeClientComponent: IioVMBridgeClientComponent;
begin
  // Loop for Owner's components
  for I := 0 to Owner.ComponentCount - 1 do
    // If the currente component is a VMBridgeClientComponent then set
    // itself as VMBridge for that component
    if Supports(Owner.Components[I], IioVMBridgeClientComponent, LVMBridgeClientComponent) and not Assigned(LVMBridgeClientComponent.ViewModelBridge) then
      LVMBridgeClientComponent.ViewModelBridge := Self;
end;

procedure TioViewModelBridge.CheckForViewModel;
var
  LObj: TObject;
begin
  // If we are at DesignTime or the ViewModel already exists then Exit
  if (csDesigning in ComponentState) or Assigned(FViewModel) then
    Exit;
  // ===============================================================================================================================
  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
  //   a detail (is Master) then Get that ViewModel, assign it to itself (and to the View later during its creating),
  //   and get the BindSourceAdapter from it.
  FViewModel := TioViewModelShuttleContainer.GetViewModel(FDI_VMMarker);
  // ===============================================================================================================================
  // VIEW MODEL CREATION BY DI_VMINterface & DI_VMAlias property if not already created
  // -------------------------------------------------------------------------------------------------------------------------------
  // If the ViewModel is still unassigned...
  if not FDI_VMInterface.IsEmpty then
  begin
    // If FDI_VMInterface property is not empty but the ViewModel is already assigned the raise an exception.
    //   else try to locate the correct ViewModel through this property value
    if Assigned(FViewModel) then
      raise EioGenericException.Create(ClassName, 'CheckForViewModel', Format('Hi, I am the ViewModelBridge component named "%s" on view "%s" and I have a problem.' +
        #13#13'My property "DI_VMInterface" is set but a ViewModel was already found.' +
        #13#13'I remind you that the "DI_VMInterface" property should normally be left empty, it can be used in the rare cases in which a ViewModel cannot be found normally.' +
        #13#13'Through this property the ViewModelBridge can directly and autonomously request the ViewModel that implements the specified interface from the Dependency Injection Container (e.g. the main form of a Delphi application if you want to consider it a view).' +
        #13#13'Try emptying this property (and the other related properties whose name starts with "DI_VM ..."), it will be fine.',
        [Name, Owner.Name]))
    else
      LObj := io.di.ResolveVM(FDI_VMInterface, nil, FDI_VMAlias).Get;
      if not Supports(LObj, IioViewModel, FViewModel) then
        raise EioGenericException.Create(Self.ClassName, 'CheckForViewModel', Format('"IioViewModel" interface is not implemented by the object of class "%s".', [LObj.ClassName]));
  end;
  // ===============================================================================================================================
  // onNeedViewModel just after it has been assigned (for any changes/additions to the ViewModel itself)
  // or for retrieve an external created ViewModel
  DoNeedViewModel;

// ======= OLD CODE =======
//  if (csDesigning in ComponentState) then
//    Exit;
//  // If a ViewModel is already assigned then exit
//  if Assigned(FViewModel) then
//    Exit;
//  // ===============================================================================================================================
//  // VIEW MODEL CREATION BY DI_VMINterface & DI_VMAlias property if not already created
//  // -------------------------------------------------------------------------------------------------------------------------------
//  if not FDI_VMInterface.IsEmpty then
//  begin
//    LObj := io.di.LocateVM(FDI_VMInterface, FDI_VMAlias).Get;
//    if not Supports(LObj, IioViewModel, FViewModel) then
//      raise EioException.Create(Self.ClassName, 'CheckForViewModel', '"IioViewModel" interface not implemented.');
//  end;
//  // ===============================================================================================================================
//  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
//  // -------------------------------------------------------------------------------------------------------------------------------
//  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
//  // a detail (is Master) then Get that ViewModel  , assign it to itself (and to the View later during its creating),
//  // and get the BindSourceAdapter from it.
//  if (not Assigned(FViewModel)) then
//    FViewModel := TioViewModelShuttleContainer.GetViewModel(FDI_VMMarker);
//  // ===============================================================================================================================
//  // onNeedViewModel just after it has be assigned (for any changes/additions to the ViewModel itself)
//  // or for retrieve an external created ViewModel
//  DoNeedViewModel;
end;

constructor TioViewModelBridge.Create(AOwner: TComponent);
begin
  inherited;
  // Init
  FViewModel := nil;
  // ===========================================================================
  // Auto set itself as ViewModelBridge in the ModelBindSource and ModelDataSet
  // components
  // ---------------------------------------------------------------------------
  if (csDesigning in ComponentState) then
    AutoSetClientComponentsOnCreate;
  // ===========================================================================
end;

destructor TioViewModelBridge.Destroy;
begin

  inherited;
end;

procedure TioViewModelBridge.DoNeedViewModel;
begin
  if Assigned(FOnNeedViewModel) then
    FOnNeedViewModel(Self, FViewModel);
end;

class function TioViewModelBridge.ExtractVMBridge(const AView: TComponent): TioViewModelBridge;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount - 1 do
    if AView.Components[I] is TioViewModelBridge then
      Exit(TioViewModelBridge(AView.Components[I]));
end;

function TioViewModelBridge.GetVMAction(const AName: String): IioVMAction;
begin
  if Assigned(FViewModel) then
    Result := FViewModel.VMAction[AName]
  else
    raise EioGenericException.Create(Self.Name, 'GetVMAction', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetVMActions: IioVMActionContainer;
begin
  if Assigned(FViewModel) then
    Result := FViewModel.VMActions
  else
    raise EioGenericException.Create(Self.Name, 'GetVMActions', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.Get_Version: String;
begin
  Result := io.Version;
end;

function TioViewModelBridge.GetDefaultPresenter: IioBindSource;
begin
  CheckForViewModel;
  if Assigned(FViewModel) then
    Result := FViewModel.DefaultPresenter
  else
    raise EioGenericException.Create(Self.Name, 'GetDefaultPresenter', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetPresenter(const AName: String): IioBindSource;
begin
  CheckForViewModel;
  if Assigned(FViewModel) then
    Result := FViewModel.Presenter[AName]
  else
    raise EioGenericException.Create(Self.Name, 'GetPresenter', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetViewModel: IioViewModel;
begin
  if not Assigned(FViewModel) then
    raise EioGenericException.Create(Self.ClassName, 'GetViewModel', 'ViewModel not assigned.');
  Result := FViewModel;
end;

function TioViewModelBridge.ViewModelAs<T>: T;
var
  LIID: TGUID;
begin
  Result := nil;
  LIID := TioUtilities.TypeInfoToGUID(TypeInfo(T));
  if not Supports(FViewModel, LIID, Result) then
    raise EioGenericException.Create(Self.ClassName + ': Interface not implemented by the ViewModel.');
end;

function TioViewModelBridge.ViewModelIsAssigned: Boolean;
begin
  Result := Assigned(FViewModel);
end;

procedure TioViewModelBridge.Loaded;
begin
  inherited;
  // If the ViewModel is not already loaded then load it
  CheckForViewModel;
  // ===========================================================================
  // Auto set itself as ViewModelBridge in the ModelBindSource and ModelDataSet
  // components
  // ---------------------------------------------------------------------------
  if (csDesigning in ComponentState) then
    AutoSetClientComponentsOnCreate;
  // ===========================================================================
  // ===========================================================================
  if Assigned(FViewModel) then
  begin
    // If the ViewModel is assigned then try
    // to Bind the View (Owner) components to ViewModel's actions
    // and register the view into the VMViews container of the VM
    (FViewModel as IioViewModelInternal).BindView(Owner);
    // These lines set a timer to postpone the firing of the "OnViewPairing"
    //  event on the ViewModel until after all the ConnectionDefs possibly
    //  present on the view have been registered in the appropriate register,
    //  otherwise if the ModelPresenters were Opened in the OnCreate event
    //  they could be of sequence problems (the ConnectionDefs were not
    //  registered yet so a connection was not found).
    // NB: If we are on an uniGUI application then doesn't use the timers but runs the code right away
    if TioApplication.ProjectPlatform <> ppUniGUI then
    begin
      TioAnonymousTimer.Create(10,
        function: Boolean
        var
          I: Integer;
        begin
          // If result is True then the timer remains enabled (continue to loop), if result is False then
          // the timer is disabled and destroyed
          Result := False;
          // Loop for Owner's components and if there is
          for I := 0 to Owner.ComponentCount - 1 do
            if (Owner.Components[I] is TioCustomConnectionDef) and not TioCustomConnectionDef(Owner.Components[I]).IsRegistered then
              Exit(True);
          (FViewModel as IioViewModelInternal).DoOnViewPairing;
        end);
    end
    else
      // TODO: problema di sequenza con uniGUI perch� non posso usare un timer per ritardare il richiamo dell'evento ViewPairing, provato con iORM.Abstraction.TioDeferred ma poi dava uno stack overflow per ora l'ho rimesso cos�
      (FViewModel as IioViewModelInternal).DoOnViewPairing;
  end;
  // ===========================================================================
end;

end.
