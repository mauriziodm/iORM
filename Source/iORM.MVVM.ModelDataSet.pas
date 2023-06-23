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
unit iORM.MVVM.ModelDataSet;

interface

uses
  iORM.DB.DataSet.Base, iORM.MVVM.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.MVVM.ModelPresenter.Custom;

type

  TioModelDataSet = class(TioBSABaseDataSet, IioVMBridgeClientComponent, IioCrossViewMasterSource)
  private
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
    FCrossView_MasterBindSource: IioCrossViewMasterSource;
    FCrossView_MasterPropertyName: String;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetModelPresenterInstance: TioModelPresenterCustom;
    // These methods handle the "Persistence" property which is actually located on the ModelPresenter
    procedure DoBeforeOpen; override;
    procedure DoBeforeScroll; override;
    // dataset virtual methods
    procedure InternalPreOpen; override;
    // ModelPresenter property
    procedure SetModelPresenter(Value: String);
    function GetModelPresenter: String;
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge: TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
  published
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property ModelPresenter: String read GetModelPresenter write SetModelPresenter;
    property CrossView_MasterBindSource: IioCrossViewMasterSource read FCrossView_MasterBindSource write FCrossView_MasterBindSource;
    property CrossView_MasterPropertyName: String read FCrossView_MasterPropertyName write FCrossView_MasterPropertyName;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Components.Common,
  Data.Bind.ObjectScope, iORM.LiveBindings.Factory,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.BSPersistence;

{ TioModelDataSet }

constructor TioModelDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FViewModelBridge := nil;
  FCrossView_MasterBindSource := nil;
  FCrossView_MasterPropertyName := '';
  if (csDesigning in ComponentState) and not Assigned(FViewModelBridge) then
    TioComponentsCommon.ViewModelBridgeAutosetting(Self, Owner);
end;

procedure TioModelDataSet.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  GetModelPresenterInstance.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioModelDataSet.Destroy;
begin
  // UNREGISTER ITSELF AS MODELDATASET/MODELBINDSOURCE CONNECTED TO A MODELPRESENTER
  //  FOR REMOTED OPEN/CLOSE  BY MODELPRESETER
  // ===========================================================================
  if Assigned(ViewModelBridge) and not(csDesigning in ComponentState) then
  begin
    ViewModelBridge.CheckForViewModel;
    // Register itself as ModelDataSet/ModelBindSource (IioVMBridgeClientComponent)
    //  connected to a ModelPresenter for remoted open/close by ModelPresenter
    GetModelPresenterInstance.UnregisterViewBindSource(Self);
  end;
  // ===========================================================================

  inherited;
end;

procedure TioModelDataSet.DoBeforeOpen;
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);
end;

procedure TioModelDataSet.DoBeforeScroll;
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.NotifyBeforeScroll;
end;

function TioModelDataSet.GetModelPresenter: String;
begin
  if FModelPresenter.IsEmpty then
    Result := Name
  else
    Result := FModelPresenter;
end;

function TioModelDataSet.GetModelPresenterInstance: TioModelPresenterCustom;
var
  LBindSource: IioNotifiableBindSource;
begin
  Result := nil;
  LBindSource := ViewModelBridge.Presenter[ModelPresenter];
  if LBindSource is TioModelPresenterCustom then
    Result := LBindSource as TioModelPresenterCustom
  else
    EioException.Create(ClassName, 'GetModelPresenterInstance', 'The requested BindSource is not a ModelPresenter');
end;

function TioModelDataSet.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelDataSet.InternalPreOpen;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Checks
  if not Assigned(FViewModelBridge) then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModelBridge not assigned.');
  if not FViewModelBridge.ViewModelIsAssigned then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModel not assigned.');
  if ModelPresenter.IsEmpty then // Note: Do not use FModelPresenter here
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'Model presenter not specified.');
  // Get the BindSourceAdapter from ViewModel and open it
  // Note: If the 'CrossViewMasterSource' property is assigned then get the BindSourceAdapter
  // from it (for cross view with microviews)
  if Assigned(FCrossView_MasterBindSource) then
  begin
    // If here it means that it's a detail (crossview detail)
    if GetModelPresenterInstance.IsDetailBS then
      LActiveBSA := TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil)
    else
      LActiveBSA := TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance);
    // Set the retrieved BSA as adapter in the connected ModelPresenter
    GetModelPresenterInstance.SetActiveBindSourceAdapter(LActiveBSA);
  end;
  // Get the BSA for this ModelDataSet from the connected ModelPresenter
  SetActiveBindSourceAdapter(  GetModelPresenterInstance.GetActiveBindSourceAdapter  );

  // Inherit
  inherited;
end;

procedure TioModelDataSet.Loaded;
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
    GetModelPresenterInstance.RegisterViewBindSource(Self);
    // open itself if the ModelPresenter is already active
    Active := ViewModelBridge.Presenter[ModelPresenter].IsActive;
  end;
  // ===========================================================================

  inherited;

  // Se è stata impostata la proprietà "CrossView_MasterBindSource" allora significa che siamo
  //  in una MicroEmbededView e l'accoppiamento con il MasterBS deve avvenire sulla vista e non
  //  tra VM. La riga qui sotto registra il BS attuale come slave del MasterBS presente sulla
  //  MasterView+MasterVM in modo che anchesso venga aperto.
  if Assigned(FCrossView_MasterBindSource) and not(csDesigning in ComponentState) then
    FCrossView_MasterBindSource.GetModelPresenterInstance.RegisterViewBindSource(Self);
end;

procedure TioModelDataSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FViewModelBridge) then
    FViewModelBridge := nil;
end;

procedure TioModelDataSet.SetModelPresenter(Value: String);
begin
  if UpperCase(Value.Trim) = UpperCase(Name) then
    FModelPresenter := ''
  else
    FModelPresenter := Value.Trim;
end;

procedure TioModelDataSet.SetViewModelBridge(const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then
    AVMBridge.FreeNotification(Self);
end;

end.
