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
unit iORM.LiveBindings.DetailAdaptersContainer;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, Data.Bind.ObjectScope,
  System.Classes, iORM.Where, iORM.Where.Interfaces,
  iORM.LiveBindings.Notification;

type

  TioDetailAdaptersContainer = class (TInterfacedObject, IioDetailBindSourceAdaptersContainer, IioNotifiable)
  strict private
    FMasterAdapter: IioContainedBindSourceAdapter;
    FDetailAdapters: TioDetailAdapters;
    FNaturalAdapters: TioNaturalAdapters;
  public
    constructor Create(const AMasterAdapter:IioContainedBindSourceAdapter); overload;
    destructor Destroy; override;
    procedure SetMasterObject(const AMasterObj: TObject);
    function NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterClassName, AMasterPropertyName: String; const AWhere:IioWhere): IioActiveBindSourceAdapter;
    function NewNaturalBindSourceAdapter(const AOwner: TComponent; const ASourceAdapter:IioNaturalBindSourceAdapterSource): IioActiveBindSourceAdapter;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure RemoveDetailBindSourceAdapter(const ABindSourceAdapter: IioContainedBindSourceAdapter);
    procedure RemoveNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter);
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetBindSourceAdapterByMasterPropertyName(const AMasterPropertyName:String): IioActiveBindSourceAdapter;

    // =========================================================================
    // Part for the support of the IioBindSource interfaces (Added by iORM)
    //  because is not implementing IInterface (NB: RefCount DISABLED)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
{$IFDEF AUTOREFCOUNT}
    function __ObjAddRef: Integer; override;
    function __ObjRelease: Integer; override;
{$ENDIF}
    // =========================================================================
  end;

implementation

uses
  iORM.Attributes, iORM.LiveBindings.ActiveObjectBindSourceAdapter,
  iORM.LiveBindings.ActiveListBindSourceAdapter, System.Generics.Collections,
  iORM.Exceptions, iORM.LiveBindings.Factory, iORM, System.SysUtils,
  iORM.Context.Map.Interfaces, iORM.Context.Container,
  iORM.Context.Properties.Interfaces;

{ TioDetailAdaptersContainer }

{$IFDEF AUTOREFCOUNT}
function TioDetailAdaptersContainer.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;
function TioDetailAdaptersContainer.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

constructor TioDetailAdaptersContainer.Create(const AMasterAdapter:IioContainedBindSourceAdapter);
begin
  inherited Create;
  FMasterAdapter := AMasterAdapter;
  FDetailAdapters := TioDetailAdapters.Create;
  FNaturalAdapters := TioNaturalAdapters.Create;
end;

destructor TioDetailAdaptersContainer.Destroy;
begin
  FDetailAdapters.Free;
  FNaturalAdapters.Free;
  inherited;
end;

function TioDetailAdaptersContainer.NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterClassName, AMasterPropertyName: String; const AWhere:IioWhere): IioActiveBindSourceAdapter;
var
  LMap: IioMap;
  LMasterProperty: IioProperty;
  LNewAdapter: IioContainedBindSourceAdapter;
begin
  // Retrieve MasterContext and MasterProperty
  LMap := TioMapContainer.GetMap(AMasterClassName);
  LMasterProperty := LMap.GetProperties.GetPropertyByName(AMasterPropertyName);
  // Create the Adapter
  case LMasterProperty.GetRelationType of
    rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
      LNewAdapter := TioLiveBindingsFactory.ContainedObjectBindSourceAdapter(AOwner, LMasterProperty, AWhere);
    rtHasMany, rtEmbeddedHasMany:
      LNewAdapter := TioLiveBindingsFactory.ContainedListBindSourceAdapter(AOwner, LMasterProperty, AWhere);
    else
      raise EioGenericException.Create(Self.ClassName + ': Relation not found');
  end;
  // Set the MasterAdapterConatainer reference (Self)
  LNewAdapter.SetMasterAdaptersContainer(Self);
  // Add the new adapter to the contained adapters
{ TODO : NB: BISOGNEREBBE AGGIUNGERE IL NOME DEL MODELPRESENTER O DEL PROTOTYPEBINDSOURCE ALLA CHIAVE DEL DICTIONARY IN MODO DA RISOLVERE UN POSSIBILE PROBLEMA SE DUE MODEL PRESENTER PRESENTANO LA STESSA CLASSE/INTERFACCIA COME DETTAGLI DI UNO STESSO MASTER E DELLA STESSA MASTERPROPERTYNAME }
  FDetailAdapters.Add(AMasterPropertyName, LNewAdapter);
  // Return the new adapter
  Result := LNewAdapter.AsActiveBindSourceAdapter;
end;

function TioDetailAdaptersContainer.NewNaturalBindSourceAdapter(const AOwner: TComponent;
  const ASourceAdapter: IioNaturalBindSourceAdapterSource): IioActiveBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, ASourceAdapter);
  FNaturalAdapters.Add(Result as IioNaturalActiveBindSourceAdapter);
end;

function TioDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(
  const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  if FDetailAdapters.ContainsKey(AMasterPropertyName) then
    Result := FDetailAdapters.Items[AMasterPropertyName] as IioActiveBindSourceAdapter
  else
    Result := nil;
end;

function TioDetailAdaptersContainer.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Supports(Self.FMasterAdapter, IioActiveBindSourceAdapter, Result);
end;

procedure TioDetailAdaptersContainer.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
var
  AContainedBSA: IioContainedBindSourceAdapter;
  ANaturalBSA: IioNaturalActiveBindSourceAdapter;
begin
  // Replicate notification to MasterBindSourceAdapter
  if Assigned(FMasterAdapter) and (Sender <> TObject(FMasterAdapter)) then
    FMasterAdapter.Notify(Self, ANotification);
  // Replicate notification to DetailBindSourceAdapters
  for AContainedBSA in FDetailAdapters.Values do
    if Sender <> TObject(AContainedBSA) then
      AContainedBSA.Notify(Self, ANotification);
  // Replicate notification to NaturalBindSourceAdapters
  for ANaturalBSA in FNaturalAdapters do
    if Sender <> TObject(ANaturalBSA) then
      ANaturalBSA.NotifyButDontForwardNotificationToSourceAdapter(Self, ANotification);
end;

function TioDetailAdaptersContainer.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioDetailAdaptersContainer.RemoveDetailBindSourceAdapter(
  const ABindSourceAdapter: IioContainedBindSourceAdapter);
begin
//  FDetailAdapters.Extract(ABindSourceAdapter);  // Questo era prima quando il container era una TList
  FDetailAdapters.Remove(ABindSourceAdapter.GetMasterPropertyName);
end;

procedure TioDetailAdaptersContainer.RemoveNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter);
begin
  FNaturalAdapters.Remove(ANaturalBindSourceAdapter);
end;

procedure TioDetailAdaptersContainer.SetMasterObject(const AMasterObj: TObject);
var
  ABindSourceAdapter: IioContainedBindSourceAdapter;
begin
  for ABindSourceAdapter in FDetailAdapters.Values do
    ABindSourceAdapter.ExtractDetailObject(AMasterObj);
end;

function TioDetailAdaptersContainer._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioDetailAdaptersContainer._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
