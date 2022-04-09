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

unit iORM.MVVM.ModelBindSource;

interface

uses
  Data.Bind.ObjectScope, iORM.MVVM.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.MVVM.ModelPresenter.Custom, Data.Bind.Components;

type

  TioModelBindSource = class(TPrototypeBindSource, IioVMBridgeClientComponent, IioCrossViewMasterSource)
  private
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
    FCrossView_MasterBindSource: IioCrossViewMasterSource;
    FCrossView_MasterPropertyName: String;
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FioLoaded: Boolean;
    procedure PreventBindSourceAdapterDestruction;
  protected
    procedure Open;
    procedure Close;
    procedure Loaded; override;
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
//    procedure DoBeforeOpen; override; // NB:  In TioCustomModelPresenter is DoBeforeOpen but here is SetActive
//    procedure DoBeforeScroll; override; // NB: In TioCustomModelPresenter is DoBeforeScroll but here is PosChanging
    procedure SetActive(const Value: Boolean); override; // In TioCustomModelPresenter is DoBeforeOpen but here is SetActive
    procedure PosChanging(ABindComp: TBasicBindComponent); override; // In TioCustomModelPresenter is DoBeforeScroll but here is PosChanging
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetModelPresenterInstance: TioModelPresenterCustom;
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge: TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
  published
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property ModelPresenter: String read FModelPresenter write FModelPresenter;
    property CrossView_MasterBindSource: IioCrossViewMasterSource read FCrossView_MasterBindSource write FCrossView_MasterBindSource;
    property CrossView_MasterPropertyName: String read FCrossView_MasterPropertyName write FCrossView_MasterPropertyName;
  end;

implementation

uses
  System.SysUtils, iORM.Components.Common,
  iORM.LiveBindings.ActiveListBindSourceAdapter, iORM.LiveBindings.Factory,
  iORM.Exceptions, System.Rtti, iORM.RttiContext.Factory,
  iORM.LiveBindings.BSPersistence;

{ TioModelBindSource }

procedure TioModelBindSource.Close;
begin
  if Active then
    Active := False;
end;

constructor TioModelBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FioLoaded := False;
  FViewModelBridge := nil;
  FCrossView_MasterBindSource := nil;
  FCrossView_MasterPropertyName := '';
  if (csDesigning in ComponentState) and not Assigned(FViewModelBridge) then
    TioComponentsCommon.ViewModelBridgeAutosetting(Self, Owner);
end;

procedure TioModelBindSource.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  GetModelPresenterInstance.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioModelBindSource.Destroy;
begin
  PreventBindSourceAdapterDestruction;

  // UNREGISTER ITSELF AS MODELDATASET/MODELBINDSOURCE CONNECTED TO A MODELPRESENTER
  //  FOR REMOTED OPEN/CLOSE  BY MODELPRESETER
  // ===========================================================================
  if Assigned(ViewModelBridge) and not(csDesigning in ComponentState) then
  begin
    ViewModelBridge.CheckForViewModel;
    // Register itself as ModelDataSet/ModelBindSource (IioVMBridgeClientComponent)
    //  connected to a ModelPresenter for remoted open/close by ModelPresenter
    ViewModelBridge.Presenter[ModelPresenter].UnregisterViewBindSource(Self);
  end;

  // ===========================================================================
  inherited;
end;

procedure TioModelBindSource.DoCreateAdapter(var ADataObject: TBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Inherited
  inherited;
  // If in DesignTime then Exit
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  if (csDesigning in ComponentState) or (not FioLoaded) then
    Exit;
  // Get the BindSourceAdapter from the ModelPresenter from the ViewModel
  // NB: If the 'CrossViewMasterSource' property is assigned the BindSourceAdapter
  // from it (for cross view with microviews)
  if (not ModelPresenter.IsEmpty) and Assigned(ViewModelBridge) and ViewModelBridge.ViewModelIsAssigned then
  begin
    if Assigned(FCrossView_MasterBindSource) then
    begin
// ----- OLD CODE -----
//      // Get the BSA from the MasterModelPresenter
//      LActiveBSA := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(Name, Self,
//        FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil) as IioActiveBindSourceAdapter;
//      // Set the retrieved BSA as adapter for this Presenter
//      GetModelPresenterInstance.SetActiveBindSourceAdapter(LActiveBSA);
// ----- OLD CODE -----

      // If here it means that it's a detail (crossview detail)
      if GetModelPresenterInstance.IsDetailBS then
        LActiveBSA := TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil)
      else
        LActiveBSA := TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance);
      // Set the retrieved BSA as adapter for this Presenter
      GetModelPresenterInstance.SetActiveBindSourceAdapter(LActiveBSA);
    end
    else
      // Get the BSA from the presenter
      LActiveBSA := GetModelPresenterInstance.GetActiveBindSourceAdapter;
    // Assign the BindSourceAdapter
    ADataObject := LActiveBSA as TBindSourceAdapter;
  end;
end;

function TioModelBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if CheckAdapter and Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result) then
end;

function TioModelBindSource.GetModelPresenterInstance: TioModelPresenterCustom;
begin
  Result := ViewModelBridge.Presenter[ModelPresenter];
end;

function TioModelBindSource.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelBindSource.Loaded;
var
  LAdapter: TBindSourceAdapter;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not(csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // VIEWMODELBRIDGE - CHECK FOR VIEWMODEL IF NOT ALREADY EXECUTED
  // (ALWAYS BEFORE DOCREATEADAPTER CALL)
  // ===========================================================================
  if Assigned(ViewModelBridge) and not(csDesigning in ComponentState) then
  begin
    ViewModelBridge.CheckForViewModel;
    // Register itself as ModelDataSet/ModelBindSource (IioVMBridgeClientComponent)
    //  connected to a ModelPresenter for remoted open/close by ModelPresenter
    ViewModelBridge.Presenter[ModelPresenter].RegisterViewBindSource(Self);
  end;
  // ===========================================================================

  // DOCREATEADAPTER CALL MUST BE BEFORE THE INHERITED LINE !!!!!!
  // ===========================================================================
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  // ---------------------------------------------------------------------------
  FioLoaded := True;
  if not Assigned(Self.OnCreateAdapter) then
  begin
    Self.DoCreateAdapter(LAdapter);
    if LAdapter <> nil then
      SetRuntimeAdapter(LAdapter);
  end;
  // ===========================================================================

  // INHERITED MUST BE AFTER THE DOCREATEADAPTER CALL !!!!!!
  inherited;
end;

procedure TioModelBindSource.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FViewModelBridge) then
    FViewModelBridge := nil;
end;

procedure TioModelBindSource.Open;
begin
  if not Active then
    Active := True;
end;

procedure TioModelBindSource.PosChanging(ABindComp: TBasicBindComponent);
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.NotifyBeforeScroll;
end;

procedure TioModelBindSource.PreventBindSourceAdapterDestruction;
var
  LInstanceType: TRttiInstanceType;
  LField: TRttiField;
begin
  LInstanceType := TioRttiFactory.GetRttiContext.GetType(Self.ClassInfo).AsInstance;
  LField := LInstanceType.GetField('FRuntimeAdapter');
  LField.SetValue(Self, TValue.Empty);
end;

procedure TioModelBindSource.SetActive(const Value: Boolean);
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);
end;

procedure TioModelBindSource.SetViewModelBridge(const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then
    AVMBridge.FreeNotification(Self);
end;

end.
