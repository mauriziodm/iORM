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
unit iORM.LiveBindings.NaturalActiveInterfaceObjectBindSourceAdapter;

interface

uses
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter,
  iORM.LiveBindings.Interfaces, System.Classes, iORM.LiveBindings.Notification,
  iORM.CommonTypes;


type

  TioNaturalActiveInterfaceObjectBindSourceAdapter = class(TioActiveInterfaceObjectBindSourceAdapter, IioNaturalActiveBindSourceAdapter)
  private
    FSourceAdapter: IioNaturalBindSourceAdapterSource;
    procedure SynchronizeSourceAdapter;
  protected
    procedure DoBeforeOpen; override;
    procedure DoBeforeDelete; override;
    procedure DoAfterDelete; override;
    // AutoLoad
    function GetAutoLoad: Boolean; override;
  public
    constructor Create(const AOwner:TComponent; const ASourceAdapter:IioNaturalBindSourceAdapterSource); overload;
    destructor Destroy; override;
    procedure ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure Reload; override;
    function NotifyButDontForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
  end;


implementation

uses
  Data.Bind.ObjectScope, iORM.LiveBindings.CommonBSAPersistence,
  System.SysUtils, iORM.LiveBindings.CommonBSABehavior,
  iORM.LiveBindings.BSPersistence, iORM.Utilities, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.Exceptions;

{ TioNaturalActiveInterfaceObjectBindSourceAdapter }

constructor TioNaturalActiveInterfaceObjectBindSourceAdapter.Create(const AOwner: TComponent; const ASourceAdapter: IioNaturalBindSourceAdapterSource);
var
  LCurrentAsInterface: IInterface;
begin
  if not Supports(ASourceAdapter.GetCurrent, IInterface, LCurrentAsInterface) then
    raise EioGenericException.Create(ClassName, 'Create', '"ASourceAdapter" object parameter does not implements "IInterface".');
  inherited Create(
                   ASourceAdapter.GetTypeName,
                   ASourceAdapter.GetTypeAlias,
                   nil,  // Where
                   AOwner,
                   LCurrentAsInterface
                  );
  FSourceAdapter := ASourceAdapter;
end;

destructor TioNaturalActiveInterfaceObjectBindSourceAdapter.Destroy;
begin
  // Unregister itself from the SourceBS.DetailAdaptersContainer
  if Assigned(FSourceAdapter) and Assigned(FSourceAdapter.DetailAdaptersContainer) then
    FSourceAdapter.DetailAdaptersContainer.RemoveNaturalBindSourceAdapter(Self);
  inherited;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.DoAfterDelete;
begin
  // Questo è un NaturalBindSourceAdapter quindi in realtà nella quasi totalità dei casi
  //  sta esponendo ad una form anagrafica l'oggetto selezionato in un altro BindSourceAdapter
  //  (probabilmente un TioActiveListBindSourceAdapter) e questo, in caso di eliminazione
  //  dell'oggetto, causava il fatto che su quest'ultimo BSA sorgente (FSourceAdapter) in realtà
  //  l'oggetto non viene eliminato.
  //  Per risolvere questo problema senza obbligare l'utente a generare un gestore per l'evento OnNotify
  //  faccio eseguire il Delete alFSourceAdapter se presente (sempre).
  //  Questo però causa una doppia notifica di eliminazione (su questo stesso BSA e sul FSourceAdapter) e
  //  per questo e sempre se è presente l'FSourceAdapter inibisco anche il DoAfterDelete (oltre quindi al DoBeforeDelete).
  // ---------------------------------------------------------------------------
  // NB: Nessun inherited perchè altrimenti cmq avrei una doppia notifica e
  //      addirittura anche una doppia query delete sul database
  //      però in questo modo in pratica disabilito l'eventuale event handler
  //inherited;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.DoBeforeDelete;
var
  LActiveBSA: IioActiveBindSourceAdapter;
  LMasterBS: IioMasterBindSource;
begin
  // Questo è un NaturalBindSourceAdapter quindi in realtà nella quasi totalità dei casi
  //  sta esponendo ad una form anagrafica l'oggetto selezionato in un altro BindSourceAdapter
  //  (probabilmente un TioActiveListBindSourceAdapter) e questo, in caso di eliminazione
  //  dell'oggetto, causava il fatto che su quest'ultimo BSA sorgente (FSourceAdapter) in realtà
  //  l'oggetto non viene eliminato.
  //  Per risolvere questo problema senza obbligare l'utente a generare un gestore per l'evento OnNotify
  //  faccio eseguire il Delete alFSourceAdapter se presente (sempre).
  //  Questo però causa una doppia notifica di eliminazione (su questo stesso BSA e sul FSourceAdapter) e
  //  per questo e sempre se è presente l'FSourceAdapter inibisco anche il DoAfterDelete (oltre quindi al DoBeforeDelete).
  // ---------------------------------------------------------------------------
  // NB: Nessun inherited perchè altrimenti cmq avrei una doppia notifica e
  //      addirittura anche una doppia query delete sul database
  //      però in questo modo in pratica disabilito l'eventuale event handler
  //inherited;
  if Assigned(FSourceAdapter) then
  begin
    // Chiude il BindSource per evitare errori AV
    if HasBindSource then
      GetBindSource.Close;
    // Se il SourceAdapter è un ListBindSourceAdapter allora lo sposta (ItemIndex)
    //  sullo stesso oggetto a cui si riferisce il presente NaturalBSA in modo da
    //  poter poi delegare al SourceAdapter stesso l'operazione di Delete
    SynchronizeSourceAdapter;
    // Riferimento al SourceAdapter come IioNaturalBindSourceAdapter
    LActiveBSA := (FSourceAdapter as IioActiveBindSourceAdapter);
    // Se il SourceAdapter ha un BindSource e se questo è un MasterBS e implementa quindi l'interfaccia
    //   "IioBSPersistenceClient" estrae un riferimento di questo tipo (l'interfaccia) del suo
    //   BindSouce (relativo a SourceAdapter) fa fare a lui un vero e proprio Persistence.Delete.
    //   Se invece queste condizioni non sono soddisfatte procedete con il normale Delete del SourceAdapter (no persistence)
    if LActiveBSA.HasBindSource and LActiveBSA.GetBindSource.IsMasterBS and Supports(LActiveBSA.GetBindSource, IioMasterBindSource, LMasterBS) then
      LMasterBS.Persistence.Delete
    else
      LActiveBSA.Delete;
    // Abort to prevent an AVerror
    Abort;
  end;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.DoBeforeOpen;
var
  FLoadType: TioLoadType;
begin
  // If it's to be realoaded then reload che DataObject
  FLoadType := (Self as IioActiveBindSourceAdapter).LoadType;
  if (FLoadType = ltFromBSReload)  or (FLoadType = ltFromBSReloadNewInstance) then
    Reload;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  if Assigned(FSourceAdapter) then
    FSourceAdapter.Notify(Self, ANotification);
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
function TioNaturalActiveInterfaceObjectBindSourceAdapter.GetAutoLoad: Boolean;
begin
  // NaturalBindSourceAdapter is always a not AutoLoad adapter by definition
  Result := False;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
function TioNaturalActiveInterfaceObjectBindSourceAdapter.NotifyButDontForwardNotificationToSourceAdapter(const Sender: TObject;
  const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification, False);
  Result := ANotification.Response;
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.Reload;
begin
  // Do not inherit
  TioCommonBSAPersistence.ReloadNaturalBindSourceAdapter(Self);
end;

// Copiato tale e quale dal NaturalActiveObjectBindSourceAdapters
procedure TioNaturalActiveInterfaceObjectBindSourceAdapter.SynchronizeSourceAdapter;
var
  LDataObject: TObject;
  LActiveBSA: IioActiveBindSourceAdapter;
  LDuckList: IioDuckTypedList;
  LItemIndex: Integer;
begin
  // Estrazione di un pò di riferimenti per comodità
  LActiveBSA := (FSourceAdapter as IioActiveBindSourceAdapter);
  LDataObject := LActiveBSA.DataObject;
  // Se il SourceAdapter è un ListBindSourceAdapter allora lo sposta (ItemIndex)
  //  sullo stesso oggetto a cui si riferisce il presente NaturalBSA in modo da
  //  poter poi delegare al SourceAdapter stesso l'operazione di Delete
  if TioDuckTypedFactory.IsList( LDataObject ) then
  begin
    LDuckList := TioDuckTypedFactory.DuckTypedList(LDataObject);
    LItemIndex := LDuckList.IndexOf(Self.Current);
    LActiveBSA.ItemIndex := LItemIndex;
  end;
end;

end.
