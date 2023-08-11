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
unit iORM.MVVM.ModelBindSource;

interface

uses
  Data.Bind.ObjectScope, iORM.MVVM.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.MVVM.ModelPresenter.Custom, Data.Bind.Components;

type

  TioModelBindSource = class(TPrototypeBindSource, IioVMBridgeClientComponent, IioCrossViewMasterSource)
  private
    FAutoPost: Boolean;
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
    FCrossView_MasterBindSource: IioCrossViewMasterSource;
    FCrossView_MasterPropertyName: String;
    FPreview: Boolean;
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FioLoaded: Boolean;
    function Get_Version: String;
    procedure _CreateAdapter;
    procedure PreventBindSourceAdapterDestruction;
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // ModelPresenter property
    procedure SetModelPresenter(Value: String);
    function GetModelPresenter: String;
    // Preview
    procedure SetPreview(const Value: Boolean);
  protected
    procedure Open;
    procedure Close;
    function CheckActiveAdapter: Boolean;
    procedure Loaded; override;
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
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    property CrossView_MasterBindSource: IioCrossViewMasterSource read FCrossView_MasterBindSource write FCrossView_MasterBindSource;
    property CrossView_MasterPropertyName: String read FCrossView_MasterPropertyName write FCrossView_MasterPropertyName;
    property ModelPresenter: String read GetModelPresenter write SetModelPresenter;
    property Preview: Boolean read FPreview write SetPreview default False;
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property _Version: String read Get_Version;
  end;

implementation

uses
  System.SysUtils, iORM.Components.Common,
  iORM.LiveBindings.ActiveListBindSourceAdapter, iORM.LiveBindings.Factory,
  iORM.Exceptions, System.Rtti, iORM.RttiContext.Factory,
  iORM.LiveBindings.BSPersistence, iORM;

{ TioModelBindSource }

function TioModelBindSource.CheckActiveAdapter: Boolean;
begin
  Result := Assigned(FBindSourceAdapter);
end;

procedure TioModelBindSource.Close;
begin
  if Active then
    Active := False;
end;

constructor TioModelBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FBindSourceAdapter := nil;
  FioLoaded := False;
  FPreview := False;
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
    GetModelPresenterInstance.UnregisterViewBindSource(Self);
  end;

  // ===========================================================================
  inherited;
end;

function TioModelBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if CheckAdapter and Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result) then
end;

function TioModelBindSource.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.InternalAdapter.AutoPost
  else
    Result := FAutoPost;
end;

function TioModelBindSource.GetModelPresenter: String;
begin
  if FModelPresenter.IsEmpty then
    Result := Name
  else
    Result := FModelPresenter;
end;

function TioModelBindSource.GetModelPresenterInstance: TioModelPresenterCustom;
var
  LBindSource: IioBindSource;
begin
  Result := nil;
  LBindSource := ViewModelBridge.Presenter[ModelPresenter];
  if LBindSource is TioModelPresenterCustom then
    Result := LBindSource as TioModelPresenterCustom
  else
    EioException.Create(ClassName, 'GetModelPresenterInstance', 'The requested BindSource is not a ModelPresenter');
end;

function TioModelBindSource.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

function TioModelBindSource.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioModelBindSource.Loaded;
begin
  // Qui forzo l'AutoPost a True perchè ridichiarare la proprietà con default = True
  //  non è stato sufficiente anche perchè il getter e setter sono privati e statici nell'antenato.
  AutoPost := True;
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
  end;
  // ===========================================================================

  // Qui siamo subito dopo il caricamento dei valori delle proprietà dal file DFM
  //  e se la proprietà Preview = True scatena il relativo metodo set per far si
  //  che venga posta a true anche la proprietà AutoActivate e rendere visibile
  //  i dati a desig-time
  SetPreview(Preview);

  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  FioLoaded := True;

  // INHERITED MUST BE AFTER THE DOCREATEADAPTER CALL !!!!!!
  inherited;


  // Se è stata impostata la proprietà "CrossView_MasterBindSource" allora significa che siamo
  //  in una MicroEmbededView e l'accoppiamento con il MasterBS deve avvenire sulla vista e non
  //  tra VM. La riga qui sotto registra il BS attuale come slave del MasterBS presente sulla
  //  MasterView+MasterVM in modo che anchesso venga aperto.
  if Assigned(FCrossView_MasterBindSource) and not(csDesigning in ComponentState) then
    FCrossView_MasterBindSource.GetModelPresenterInstance.RegisterViewBindSource(Self);
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
  LBSPersistenceClient: IioMasterBindSource;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioMasterBindSource, LBSPersistenceClient) then
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
  LBSPersistenceClient: IioMasterBindSource;
begin
  // If we are in the opening of the bind source and we aren't at design-time then
  //  create the active bind source adapter
  if Value and (not Assigned(FBindSourceAdapter)) and (not(csDesigning in ComponentState)) then
    _CreateAdapter;

  inherited;

  // If the ModelPresenter is a master model presenter then clear the
  //  relative Persistence layer
  if (not (csDesigning in ComponentState)) and Supports(GetModelPresenterInstance, IioMasterBindSource, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);

// ----- OLD CODE -----
//  inherited;
//  if not (csDesigning in ComponentState) then
//  begin
//    if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
//      LBSPersistenceClient.Persistence.Clear(False);
//  end;
// ----- OLD CODE -----
end;

procedure TioModelBindSource.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    Self.InternalAdapter.AutoPost := Value;
end;

procedure TioModelBindSource.SetModelPresenter(Value: String);
begin
  if UpperCase(Value.Trim) = UpperCase(Name) then
    FModelPresenter := ''
  else
    FModelPresenter := Value.Trim;
end;

procedure TioModelBindSource.SetPreview(const Value: Boolean);
begin
  // Se stiamo abilitando la preview e siamo a design time attiva
  //  la proprietà "AutoActivate" per mostrare i dati anche a design-time
  FPreview := Value;
  AutoActivate := FPreview and (csDesigning in ComponentState);
end;

procedure TioModelBindSource.SetViewModelBridge(const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then
    AVMBridge.FreeNotification(Self);
end;

procedure TioModelBindSource._CreateAdapter;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // If in DesignTime then Exit
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  if (csDesigning in ComponentState) or (not FioLoaded) then
    Exit;
  // If an adapter already exists then raise an exception
  if Assigned(FBindSourceAdapter) then
    raise EioException.Create(ClassName, '_CreateAdapter', Format('ActiveBindSourceAdapter already exists in component "%s".', [Name]));
  // Get the BindSourceAdapter from the ModelPresenter from the ViewModel
  // NB: If the 'CrossViewMasterSource' property is assigned the take the BindSourceAdapter
  // from it (for cross view with microviews)
  if (not ModelPresenter.IsEmpty) and Assigned(ViewModelBridge) and ViewModelBridge.ViewModelIsAssigned then
  begin
    if Assigned(FCrossView_MasterBindSource) then
    begin
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
    if Assigned(LActiveBSA) then
    begin
      LActiveBSA.ioAutoPost := FAutoPost;
      SetRuntimeAdapter(LActiveBSA.AsTBindSourceAdapter);
      FBindSourceAdapter := LActiveBSA;
    end;
  end;
end;

end.
