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





unit iORM.DB.ConnectionContainer;

interface

uses
{$IFDEF MSWINDOWS}
  FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient,
  FireDAC.Moni.FlatFile,
{$ENDIF}
  System.Generics.Collections,
  FireDAC.Comp.Client,
  iORM.DB.Interfaces,
  iORM.CommonTypes;

type
{$IFDEF MSWINDOWS}
  // Il TioConnectionMonitor incapsula la funzionalità di tracing e monitoring di quanto avviene sulle connessioni
  TioConnectionMonitorRef = class of TioConnectionMonitor;
  TioConnectionMonitor = class
  private
    class var FMoniRemoteClientLink: TFDMoniRemoteClientLink;  // Not to use directly (use function "RemoteClientLink"
    class var FMoniFlatFileClientLink: TFDMoniFlatFileClientLink;  // Not to use directly (use function "RemoteFlatFileLink"
    class var FMode: TioMonitorMode;
    class function GetMode: TioMonitorMode; static;
    class procedure SetMode(const Value: TioMonitorMode); static;
  protected
    class procedure FreeFDMoniClientLinks;
  public
    class function RemoteClientLink: TFDMoniRemoteClientLink;
    class function RemoteFlatFileLink: TFDMoniFlatFileClientLink;
    class property Mode: TioMonitorMode read GetMode write SetMode;
  end;
{$ENDIF}

  // IL connection manager ha il compito di mantenere i parametri delle connessioni impostate all'avvio
  //  dell'applicazione per una loro successiva istanziazione e di gestione del connection pooling
  //  se richiesto.
  //  In realtà questa classe utilizza il TFDManager fornito da FireDAC e non fa molto altro
  //  se non aggiungere un campo per mantenere un riferimento al nome della ConnectionDef
  //  di default. Una gestione di una connessione di default mi serviva perchè volevo fare in modo che
  //  fosse necessario specificare esplicitamente una ConnectionDef (con un attribute) per ogni classe/entità
  //  e quindi ho deciso di mantenere un riferimento al nome della connectionDef di dafault in modo che per tutte le classi
  //  che non indicano una connection esplicitamente utilizzino quella di default e quindi anche che normalmente nelle applicazioni
  //  che utilizzano una sola ConnectionDef non è necessario specificare nulla nella dichiarazione delle classi perchè
  //  tanto utilizzano automaticamente la ConnectionDef di default (l'unica).
  TioConnectionManagerContainer = TDictionary<String, TioConnectionInfo>;
  TioConnectionManagerRef = class of TioConnectionManager;
  TioConnectionManager = class
  strict private
    class var FDefaultConnectionName: String;
    class var FConnectionManagerContainer: TioConnectionManagerContainer;  // NB: Questo container in realtà contiene solo il tipo di DB (cdtFirebird, cdtSQLite ecc.ecc.) in modo da poter fare dei confronti veloci nelle factory e per non dipendere direttamente dal DriverID delle connectionDef di FireDAC
    class function NewCustomConnectionDef(const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME; const AsDefault:Boolean=False): IIoConnectionDef;
  protected
    class procedure CreateInternalContainer;
    class procedure FreeInternalContainer;
  public
    class function NewSQLiteConnectionDef(const ADatabase: String; const APersistent:Boolean=False; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const APersistent:Boolean=False; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword: String; const APersistent:Boolean=False; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const APersistent:Boolean=False; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class procedure NewRESTConnection(const ABaseURL:String; const APersistent:Boolean=True; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME);
    class function GetConnectionDefByName(AConnectionName:String=''): IIoConnectionDef;
    class function GetDefaultConnectionName: String;
    class function GetConnectionInfo(AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): TioConnectionInfo;
    class procedure SetDefaultConnectionName(const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME);
{$IFDEF MSWINDOWS}
    class function Monitor: TioConnectionMonitorRef;
{$ENDIF}
  end;

  // Il ConnectionContainer contiene le connessioni attive in un dato momento, cioè quelle
  //  connections che sono effettivamente in uso al momento; il loro ciclo di vita (delle connessioni)
  //  coincide con il ciclo della transazion in essere sulla connessione stessa, quando la transazione
  //  termina (con un commit/rollback) anche la connessione viene elimimata.
  //  Le connessioni sono separate per thread in modo da predisporeìle fin da subito ad eventuali sviluppi in
  //  senso multithreading.
  //  NB: Questa classe non gestisce l'eventuale connection pooling e non contiene i parametri della/e connesioni
  //       da creare ma è semplicemente un repository delle sole connessioni in uso in modo che chiamate ricorsive
  //       all'ORM all'interno di una singola operazione (ad esempio quando carichiamo una classe che ha al suo interno
  //       proprietà con relazioni il caricamento degli oggetti dettaglio avviene con una chiamata ricorsiva all'ORM
  //       e questa chicìamata deve svolgersi all'interno della stessa transazione del master e quindi con la stessa connection)
  //       possano accedere allo stesso oggetto connection (via factory).
  TioInternalContainerType = TDictionary<String, IioConnection>;
  TioConnectionContainerRef = class of TioConnectionContainer;
  TioConnectionContainer = class
  strict private
    class var FContainer: TioInternalContainerType;
    class function GetCurrentThreadID: TThreadID;
    class function ConnectionNameToContainerKey(AConnectionName:String): String;
  protected
    class procedure CreateInternalContainer;
    class procedure FreeInternalContainer;
  public
    class procedure AddConnection(const AConnection:IioConnection);
    class procedure FreeConnection(const AConnection:IioConnection);
    class function GetConnection(const AConnectionName:String): IioConnection;
    class function ConnectionExist(const AConnectionName:String): Boolean;
  end;

implementation

uses
  System.Classes, System.SysUtils, iORM.Exceptions;

{ TioConnectionContainer }

class procedure TioConnectionContainer.AddConnection(const AConnection: IioConnection);
begin
  FContainer.Add(   Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName), AConnection   );
end;

class function TioConnectionContainer.ConnectionExist(const AConnectionName:String): Boolean;
begin
  Result := FContainer.ContainsKey(   Self.ConnectionNameToContainerKey(AConnectionName)   );
end;

class function TioConnectionContainer.ConnectionNameToContainerKey(AConnectionName: String): String;
begin
  Result := AConnectionName + '-' + Self.GetCurrentThreadID.ToString;
end;

class procedure TioConnectionContainer.CreateInternalContainer;
begin
  Self.FContainer := TioInternalContainerType.Create;
end;

class procedure TioConnectionContainer.FreeConnection(const AConnection:IioConnection);
begin
  // Remove the reference to the connection
  //  NB: Viene richiamato alla distruzione di una connessione perchè altrimenti avrei un riferimento incrociato
  //       tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
  //       che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
  //       questo causava molti memory leaks perchè questi oggetti rimanevano in vita perenne in quanto si sostenevano
  //       a vicenda e rendevano inefficace il Reference Count
  if AConnection.IsDBConnection then
    AConnection.AsDBConnection.QueryContainer.CleanQueryConnectionsRef;
  // RImuove la connessione causandone anche la distruzione perchè a questo punto non c'è
  //  più alcun riferimento ad essa.
  FContainer.Remove(   Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName)   );
end;

class procedure TioConnectionContainer.FreeInternalContainer;
var
  AConnection: IioConnection;
begin
  // Remove the reference to the connection
  //  NB: Viene richiamato alla distruzione di una connessione perchè altrimenti avrei un riferimento incrociato
  //       tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
  //       che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
  //       questo causava molti memory leaks perchè questi oggetti rimanevano in vita perenne in quanto si sostenevano
  //       a vicenda e rendevano inefficace il Reference Count
  for AConnection in Self.FContainer.Values
  do Self.FreeConnection(AConnection);
  // Free the Container
  Self.FContainer.Free;
end;

class function TioConnectionContainer.GetConnection(const AConnectionName:String): IioConnection;
begin
  Result := FContainer.Items[   Self.ConnectionNameToContainerKey(AConnectionName)   ];
end;

class function TioConnectionContainer.GetCurrentThreadID: TThreadID;
begin
  Result := System.Classes.TThread.CurrentThread.ThreadID;
end;

{ TioConnectionManager }

class procedure TioConnectionManager.CreateInternalContainer;
begin
  FConnectionManagerContainer := TioConnectionManagerContainer.Create;
end;

class procedure TioConnectionManager.FreeInternalContainer;
begin
  Self.FConnectionManagerContainer.Free;
end;

class function TioConnectionManager.GetConnectionDefByName(AConnectionName: String): IIoConnectionDef;
begin
  Result := nil;
  // If desired ConnectionName is empty then get then Default one.
  if AConnectionName = '' then Self.GetDefaultConnectionName;
  // Get the ConnectionDef info's
  Result := FDManager.ConnectionDefs.FindConnectionDef(AConnectionName);
  // Connection not found
  if not Assigned(Result) then
    raise EioException.Create(Self.ClassName + ': ConnectionDef not found.');
end;

class function TioConnectionManager.GetConnectionInfo(
  AConnectionName: String): TioConnectionInfo;
begin
  // If desired ConnectionName is empty then get then Default one.
  if AConnectionName = '' then AConnectionName := Self.GetDefaultConnectionName;
  // Return the desired connection type
  Result := FConnectionManagerContainer.Items[AConnectionName];
end;

class function TioConnectionManager.GetDefaultConnectionName: String;
begin
  Result := Self.FDefaultConnectionName;
end;

{$IFDEF MSWINDOWS}
class function TioConnectionManager.Monitor: TioConnectionMonitorRef;
begin
  Result := TioConnectionMonitor;
end;
{$ENDIF}

class function TioConnectionManager.NewCustomConnectionDef(const AConnectionName: String; const AsDefault: Boolean): IIoConnectionDef;
begin
   // Create the ConnectionDef object and set his name
  //  NB: The name of the connectionDef should never be changed after
  Result := FDManager.ConnectionDefs.AddConnectionDef;
  Result.Name := AConnectionName;
  // If the AsDefault param is True or this is the first ConnectionDef of the application
  //  then set it as default
  if AsDefault or (Self.FDefaultConnectionName = '') then
    Self.FDefaultConnectionName := AConnectionName;
end;

class function TioConnectionManager.NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String;
  const APersistent:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName);
  Result.Params.Values['DriverID'] := 'FB';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Values['Database'] := ADatabase;
  Result.Params.Values['User_Name'] := AUserName;
  Result.Params.Values['Password'] := APassword;
  Result.Params.Values['Protocol'] := 'TCPIP';
  if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.Add(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtFirebird, APersistent));
end;

class function TioConnectionManager.NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet:String;
  const APersistent:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName);
  Result.Params.Values['DriverID'] := 'MySQL';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Values['Database'] := ADatabase;
  Result.Params.Values['User_Name'] := AUserName;
  Result.Params.Values['Password'] := APassword;
  if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.Add(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtMySQL, APersistent));
end;

class procedure TioConnectionManager.NewRESTConnection(const ABaseURL: String;
  const APersistent: Boolean; const AConnectionName: String);
var
  LConnectionInfo: TioConnectionInfo;
begin
  // If the AsDefault param is True or this is the first ConnectionDef of the application
  //  then set it as default
//  if AsDefault or (Self.FDefaultConnectionName = '') then
  if (Self.FDefaultConnectionName = '') then
    Self.FDefaultConnectionName := AConnectionName;
  // Setup the connection info
  LConnectionInfo := TioConnectionInfo.Create(AConnectionName, cdtREST, APersistent);
  LConnectionInfo.BaseURL := ABaseURL;
  // Add the connection type to the internal container
  FConnectionManagerContainer.Add(AConnectionName, LConnectionInfo);
end;

class function TioConnectionManager.NewSQLiteConnectionDef(const ADatabase:String; const APersistent:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName);
  Result.Params.Values['DriverID'] := 'SQLite';
//  Result.Params.Values['Server'] := 'localhost';
  Result.Params.Values['Database'] := ADatabase;
  Result.Params.Values['FailIfMissing'] := 'False';
  // Add the connection type to the internal container
  FConnectionManagerContainer.Add(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtSQLite, APersistent));
end;

class function TioConnectionManager.NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword:String;
  const APersistent:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName);
  Result.Params.Values['DriverID'] := 'MSSQL';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Values['Database'] := ADatabase;
  Result.Params.Values['User_Name'] := AUserName;
  Result.Params.Values['Password'] := APassword;
  // Add the connection type to the internal container
  FConnectionManagerContainer.Add(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtSQLServer, APersistent));
end;

class procedure TioConnectionManager.SetDefaultConnectionName(const AConnectionName: String);
begin
  // If a connectionDef with this name is not founded then raise an exception
  if not Assigned(FDManager.FindConnection(AConnectionName)) then
    raise EioException.Create(Self.ClassName + ': Connection params definition "' + AConnectionName + '" not found!');
  // Set the connection as default
  Self.FDefaultConnectionName := AConnectionName;
end;

{ TioConnectionMonitor }

{$IFDEF MSWINDOWS}
class procedure TioConnectionMonitor.FreeFDMoniClientLinks;
begin
  // Destroy existing FDMoniClientLinks
  if Assigned(FMoniRemoteClientLink) then
    FreeAndNil(FMoniRemoteClientLink);
  if Assigned(FMoniFlatFileClientLink) then
    FreeAndNil(FMoniFlatFileClientLink);
end;

class function TioConnectionMonitor.GetMode: TioMonitorMode;
begin
  Result := FMode;
end;

class function TioConnectionMonitor.RemoteClientLink: TFDMoniRemoteClientLink;
begin
  if not Assigned (FMoniRemoteClientLink) then
    FMoniRemoteClientLink := TFDMoniRemoteClientLink.Create(nil);
  Result := FMoniRemoteClientLink;
end;

class function TioConnectionMonitor.RemoteFlatFileLink: TFDMoniFlatFileClientLink;
begin
  if not Assigned (FMoniFlatFileClientLink) then
    FMoniFlatFileClientLink := TFDMoniFlatFileClientLink.Create(nil);
  Result := FMoniFlatFileClientLink;
end;

class procedure TioConnectionMonitor.SetMode(const Value: TioMonitorMode);
begin
  // Only if the new value is different
  if Value = FMode then
    Exit;
  // Set the value
  FMode := Value;
  // Disable tracing for all client link
  if Assigned(FMoniRemoteClientLink) then
    FMoniRemoteClientLink.Tracing := False;
  if Assigned(FMoniFlatFileClientLink) then
    FMoniFlatFileClientLink.Tracing := False;
  // Enable the proper client link depending by Mode
  case FMode of
    mmRemote:   RemoteClientLink.Tracing   := True;
    mmFlatFile: RemoteFlatFileLink.Tracing := True;
  end;
end;
{$ENDIF}

initialization

  TioConnectionContainer.CreateInternalContainer;
  TioConnectionManager.CreateInternalContainer;

finalization

  TioConnectionContainer.FreeInternalContainer;
  TioConnectionManager.FreeInternalContainer;
{$IFDEF MSWINDOWS}
  TioConnectionMonitor.FreeFDMoniClientLinks;
{$ENDIF}

end.
                              {***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}




