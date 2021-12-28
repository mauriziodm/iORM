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
  iORM.LiveBindings.Interfaces, System.Classes, iORM.LiveBindings.Notification;

type

  TioNaturalActiveObjectBindSourceAdapter = class(TioActiveObjectBindSourceAdapter)
  strict private
    FSourceAdapter: IioNaturalBindSourceAdapterSource;
  strict protected
    procedure DoBeforeDelete; override;
    procedure DoAfterDelete; override;
  public
    constructor Create(AOwner:TComponent; ASourceAdapter:IioNaturalBindSourceAdapterSource); overload;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification); override;
  end;

implementation

uses
  Data.Bind.ObjectScope;





{ TioNaturalActiveObjectBindSourceAdapter }

constructor TioNaturalActiveObjectBindSourceAdapter.Create(AOwner:TComponent;
  ASourceAdapter:IioNaturalBindSourceAdapterSource);
begin
  inherited Create(
                   ASourceAdapter.GetCurrent.ClassType,
                   nil,  // Where
                   AOwner,
                   ASourceAdapter.GetCurrent,
                   False,
                   False
                  );
  FSourceAdapter := ASourceAdapter;
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
     TBindSourceAdapter(FSourceAdapter).Delete;
end;

procedure TioNaturalActiveObjectBindSourceAdapter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  inherited;
  if Assigned(FSourceAdapter)
    then FSourceAdapter.Notify(Self, ANotification);
end;

end.
