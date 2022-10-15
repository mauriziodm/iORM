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



unit iORM.LiveBindings.NaturalActiveObjectBindSourceAdapter;

interface

uses
  iORM.LiveBindings.ActiveObjectBindSourceAdapter,
  iORM.LiveBindings.Interfaces, System.Classes, iORM.LiveBindings.Notification,
  iORM.CommonTypes;

type

  TioNaturalActiveObjectBindSourceAdapter = class(TioActiveObjectBindSourceAdapter, IioNaturalActiveBindSourceAdapter)
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
  iORM.DuckTyped.Factory;

{ TioNaturalActiveObjectBindSourceAdapter }

constructor TioNaturalActiveObjectBindSourceAdapter.Create(const AOwner:TComponent; const ASourceAdapter:IioNaturalBindSourceAdapterSource);
begin
  inherited Create(
                   ASourceAdapter.GetCurrent.ClassType,
                   nil,  // Where
                   AOwner,
                   ASourceAdapter.GetCurrent,
                   False
                  );
  FSourceAdapter := ASourceAdapter;
end;

destructor TioNaturalActiveObjectBindSourceAdapter.Destroy;
var
  FLoadType: TioLoadType;
begin
  // Unregister itself from the SourceBS.DetailAdaptersContainer
  FSourceAdapter.DetailAdaptersContainer.RemoveNaturalBindSourceAdapter(Self);
  // If the LoadType is ltFromBSReloadNewInstance and it is inherited from TioActiveObjectBindSourceAdapter
  //  (it is'n an interfaced bind source) then free che DataObject (owns it)
  FLoadType := (Self as IioActiveBindSourceAdapter).LoadType;
  if (FLoadType = ltFromBSReloadNewInstance) and (Self is TioActiveObjectBindSourceAdapter) then
    DataObject.Free;
  inherited;
end;

procedure TioNaturalActiveObjectBindSourceAdapter.DoAfterDelete;
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

procedure TioNaturalActiveObjectBindSourceAdapter.DoBeforeDelete;
var
  LActiveBSA: IioActiveBindSourceAdapter;
  LMasterBS: IioBSPersistenceClient;
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
    if LActiveBSA.HasBindSource and LActiveBSA.GetBindSource.IsMasterBS and Supports(LActiveBSA.GetBindSource, IioBSPersistenceClient, LMasterBS) then
      LMasterBS.Persistence.Delete
    else
      LActiveBSA.Delete;
    // Abort to prevent an AVerror
    Abort;
  end;
end;

procedure TioNaturalActiveObjectBindSourceAdapter.SynchronizeSourceAdapter;
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

procedure TioNaturalActiveObjectBindSourceAdapter.DoBeforeOpen;
var
  FLoadType: TioLoadType;
begin
  // If it's to be realoaded then reload che DataObject
  FLoadType := (Self as IioActiveBindSourceAdapter).LoadType;
  if (FLoadType = ltFromBSReload)  or (FLoadType = ltFromBSReloadNewInstance) then
    Reload;
end;

procedure TioNaturalActiveObjectBindSourceAdapter.ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  if Assigned(FSourceAdapter) then
    FSourceAdapter.Notify(Self, ANotification);
end;

function TioNaturalActiveObjectBindSourceAdapter.GetAutoLoad: Boolean;
begin
  // NaturalBindSourceAdapter is always a not AutoLoad adapter by definition
  Result := False;
end;

function TioNaturalActiveObjectBindSourceAdapter.NotifyButDontForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification, False);
  Result := ANotification.Response;
end;

procedure TioNaturalActiveObjectBindSourceAdapter.Reload;
begin
  // Do not inherit
  TioCommonBSAPersistence.ReloadNaturalBindSourceAdapter(Self);
end;

end.
