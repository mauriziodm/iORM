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
unit iORM.DB.ConnectionContainer;

interface

uses
  {$I ioFireDAC_uses.inc}
  System.Generics.Collections,
  iORM.DB.Interfaces,
  iORM.CommonTypes, System.SysUtils, iORM.SynchroStrategy.Interfaces;

type
{$IFDEF MSWINDOWS}
  // Il TioConnectionMonitor incapsula la funzionalit� di tracing e monitoring di quanto avviene sulle connessioni
  TioConnectionMonitorRef = class of TioConnectionMonitor;

  TioConnectionMonitor = class
  private
    class var FMoniRemoteClientLink: TFDMoniRemoteClientLink; // Not to use directly (use function "RemoteClientLink"
    class var FMoniFlatFileClientLink: TFDMoniFlatFileClientLink; // Not to use directly (use function "RemoteFlatFileLink"
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
  // dell'applicazione per una loro successiva istanziazione e di gestione del connection pooling
  // se richiesto.
  // In realt� questa classe utilizza il TFDManager fornito da FireDAC e non fa molto altro
  // se non aggiungere un campo per mantenere un riferimento al nome della ConnectionDef
  // di default (ora in TioApplication.SessionDataStore).
  // Una gestione di una connessione di default mi serviva perch� volevo fare in modo che NON
  // fosse necessario specificare esplicitamente una ConnectionDef (con un attribute) per ogni classe/entit�
  // e quindi ho deciso di mantenere un riferimento al nome della connectionDef di dafault in modo che per tutte le classi
  // che non indicano una connection esplicitamente utilizzino quella di default e quindi anche che normalmente nelle applicazioni
  // che utilizzano una sola ConnectionDef non � necessario specificare nulla nella dichiarazione delle classi perch�
  // tanto utilizzano automaticamente la ConnectionDef di default (l'unica).

  TioConnectionManagerContainer = TObjectDictionary<String, TioConnectionInfo>;
  TioConnectionManagerRef = class of TioConnectionManager;

  TioConnectionManager = class // NB: Is thread-safe
  strict private
// TODO: Spostare FConnectionManagerContainer oppure proprio tutto TioConnectionManager all'interno del SessionDataStore???
// TODO: Considerare di sostituire TioConnectionInfo direttamente con i componenti ConnectionDef, in questo modo eliminiamo una istanza e altri vantaggi
    class var FConnectionManagerContainer: TioConnectionManagerContainer;
    // NB: Questo container in realt� contiene solo il tipo di DB (cdtFirebird, cdtSQLite ecc.ecc.) in modo da poter fare dei confronti veloci nelle factory e per non dipendere direttamente dal DriverID delle connectionDef di FireDAC
    class function NewCustomConnectionDef(const AConnectionName: String; const APooled: Boolean; const AAsDefault: Boolean): IIoStanConnectionDef; inline;
    class procedure _Lock; inline;
    class procedure _Unlock; inline;
  protected
    class procedure CreateInternalContainer; inline;
    class procedure FreeInternalContainer; inline;
  public
    // ---------- Start of connectionDef creation methods ----------
    class function NewSQLiteConnectionDef(const ADatabase: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil; const APersistent: Boolean = False;
      const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
    class function NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
    class function NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
    class function NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
    class procedure NewHttpConnection(const ABaseURL: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil; const APersistent: Boolean = True;
      const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
    // ---------- END of connectionDef creation methods ----------
    class function GetCurrentConnectionDef: IIoStanConnectionDef;
    class function GetConnectionDefByName(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
    class function GetDatabaseFileName(const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): String;

    class function GetConnectionInfo(AConnectionName: String): TioConnectionInfo;
    class procedure ClearConnectionInfoSynchroStrategy(AConnectionName: String);

    class function GetSynchroStrategy_Client(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IioSynchroStrategy_Client;

{$IFDEF MSWINDOWS}
    class function Monitor: TioConnectionMonitorRef;
{$ENDIF}
  end;

  // Il ConnectionContainer contiene le connessioni attive in un dato momento, cio� quelle
  // connections che sono effettivamente in uso al momento; il loro ciclo di vita (delle connessioni)
  // coincide con il ciclo della transazione in essere sulla connessione stessa, quando la transazione
  // termina (con un commit/rollback) anche la connessione viene elimimata.
  // Le connessioni sono separate per thread in modo da predispore�le fin da subito ad eventuali sviluppi in
  // senso multithreading.
  // NB: Questa classe non gestisce l'eventuale connection pooling e non contiene i parametri della/e connesioni
  // da creare ma � semplicemente un repository delle sole connessioni in uso in modo che chiamate ricorsive
  // all'ORM all'interno di una singola operazione (ad esempio quando carichiamo una classe che ha al suo interno
  // propriet� con relazioni il caricamento degli oggetti dettaglio avviene con una chiamata ricorsiva all'ORM
  // e questa chiamata deve svolgersi all'interno della stessa transazione del master e quindi con la stessa connection)
  // possano accedere allo stesso oggetto connection (via factory).
  TioInternalContainerType = TDictionary<String, IioConnection>;
  TioConnectionContainerRef = class of TioConnectionContainer;

  TioConnectionContainer = class
  strict private
    class var FContainer: TioInternalContainerType;
    class function ConnectionNameToContainerKey(AConnectionName: String): String;
    class procedure _Lock; inline;
    class procedure _Unlock; inline;
  protected
    class procedure CreateInternalContainer;
    class procedure FreeInternalContainer;
  public
    class procedure AddConnection(const AConnection: IioConnection);
    class procedure FreeConnection(const AConnection: IioConnection);
    class function GetConnection(const AConnectionName: String): IioConnection;
    class function ConnectionExist(const AConnectionName: String): Boolean;
  end;

implementation

uses
  System.Classes, iORM.Exceptions, iORM.Utilities,
  iORM.Abstraction;

{ TioConnectionContainer }

class procedure TioConnectionContainer.AddConnection(const AConnection: IioConnection);
begin
  _Lock;
  try
    FContainer.Add(Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName), AConnection);
  finally
    _Unlock;
  end;
end;

class function TioConnectionContainer.ConnectionExist(const AConnectionName: String): Boolean;
begin
  _Lock;
  try
    Result := FContainer.ContainsKey(Self.ConnectionNameToContainerKey(AConnectionName));
  finally
    _Unlock;
  end;
end;

class function TioConnectionContainer.ConnectionNameToContainerKey(AConnectionName: String): String;
begin
  Result := AConnectionName + '-' + TioUtilities.GetThreadID.ToString;
end;

class procedure TioConnectionContainer.CreateInternalContainer;
begin
  Self.FContainer := TioInternalContainerType.Create;
end;

class procedure TioConnectionContainer.FreeConnection(const AConnection: IioConnection);
begin
  _Lock;
  try
    // Remove the reference to the connection
    // NB: Viene richiamato alla distruzione di una connessione perch� altrimenti avrei un riferimento incrociato
    // tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
    // che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
    // questo causava molti memory leaks perch� questi oggetti rimanevano in vita perenne in quanto si sostenevano
    // a vicenda e rendevano inefficace il Reference Count
    if AConnection.IsDBConnection then
      AConnection.AsDBConnection.QueryContainer.CleanQueryConnectionsRef;
    // RImuove la connessione causandone anche la distruzione perch� a questo punto non c'�
    // pi� alcun riferimento ad essa.
    FContainer.Remove(Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName));
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionContainer.FreeInternalContainer;
var
  AConnection: IioConnection;
begin
  // Remove the reference to the connection
  // NB: Viene richiamato alla distruzione di una connessione perch� altrimenti avrei un riferimento incrociato
  // tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
  // che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
  // questo causava molti memory leaks perch� questi oggetti rimanevano in vita perenne in quanto si sostenevano
  // a vicenda e rendevano inefficace il Reference Count
  for AConnection in Self.FContainer.Values do
    Self.FreeConnection(AConnection);
  // Free the Container
  Self.FContainer.Free;
end;

class function TioConnectionContainer.GetConnection(const AConnectionName: String): IioConnection;
begin
  _Lock;
  try
    Result := FContainer.Items[Self.ConnectionNameToContainerKey(AConnectionName)];
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionContainer._Lock;
begin
  TMonitor.Enter(FContainer);
end;

class procedure TioConnectionContainer._Unlock;
begin
  TMonitor.Exit(FContainer);
end;

{ TioConnectionManager }

class procedure TioConnectionManager.ClearConnectionInfoSynchroStrategy(AConnectionName: String);
begin
  _Lock;
  try
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := TioApplication.SessionDataStore.GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Reset the ConnectionInfo.SynchroStrategy property
    if FConnectionManagerContainer.ContainsKey(AConnectionName) then
      FConnectionManagerContainer[AConnectionName].SynchroStrategy := nil;
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.CreateInternalContainer;
begin
  FConnectionManagerContainer := TioConnectionManagerContainer.Create([doOwnsValues]);
end;

class procedure TioConnectionManager.FreeInternalContainer;
begin
  FConnectionManagerContainer.Free;
end;

class function TioConnectionManager.GetConnectionDefByName(AConnectionName: String): IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := nil;
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := TioApplication.SessionDataStore.GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Get the ConnectionDef info's
    Result := FDManager.ConnectionDefs.FindConnectionDef(AConnectionName);
    // Connection not found
    if not Assigned(Result) then
      raise EioGenericException.Create(Self.ClassName + ': ConnectionDef not found.');
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetConnectionInfo(AConnectionName: String): TioConnectionInfo;
begin
  _Lock;
  try
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := TioApplication.SessionDataStore.GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Return the desired connection type
    if not FConnectionManagerContainer.TryGetValue(AConnectionName, Result) then
      raise EioGenericException.Create(Self.ClassName, 'GetConnectionInfo',
        Format('Connection named "%s" not found.'#13#13'It could be that It has not been defined or that its registration in the "connection manager" has not yet taken place (sequence problem, you are trying to use the connection before this has registered).',
        [AConnectionName]));
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetSynchroStrategy_Client(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IioSynchroStrategy_Client;
begin
  _Lock;
  try
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := TioApplication.SessionDataStore.GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Return the desired info or raise an exception if the connection name was not found
    if FConnectionManagerContainer.ContainsKey(AConnectionName) then
      Result := FConnectionManagerContainer.Items[AConnectionName].SynchroStrategy
    else
      raise EioGenericException.Create(Self.ClassName, 'GetSynchroStrategy_Client',
        Format('Connection named "%s" not found.'#13#13'It could be that It has not been defined or that its registration in the "connection manager" has not yet taken place (sequence problem, you are trying to use the connection before this has registered).',
        [AConnectionName]));
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetDatabaseFileName(const AConnectionName: String): String;
begin
  _Lock;
  try
    Result := GetConnectionDefByName(AConnectionName).Params.Database;
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetCurrentConnectionDef: IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := GetConnectionDefByName(TioApplication.SessionDataStore.GetCurrentConnectionName);
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager._Lock;
begin
// TODO: Leggi le note qui sotto
  // NB: Ho pensato di usare il lock del SessionDataStore in modo da avere un solo
  //      _Lock per evitare possibili deadlock.
  //      Si potrebbe pensare anche di spostare il "FConnectionManagerContainer" nel
  //      SessionDataStore e quindi sotto a TioApplication e togliere del tutto i  metodi
  //      _Lock e _Unlock da questa classe
  TioApplication.SessionDataStore._Lock;
//  TMonitor.Enter(FConnectionManagerContainer);
end;

class procedure TioConnectionManager._Unlock;
begin
// TODO: Leggi le note qui sotto
  // NB: Ho pensato di usare il lock del SessionDataStore in modo da avere un solo
  //      _Lock per evitare possibili deadlock.
  //      Si potrebbe pensare anche di spostare il "FConnectionManagerContainer" nel
  //      SessionDataStore e quindi sotto a TioApplication e togliere del tutto i  metodi
  //      _Lock e _Unlock da questa classe
  TioApplication.SessionDataStore._UnLock;
//  TMonitor.Exit(FConnectionManagerContainer);
end;

{$IFDEF MSWINDOWS}

class function TioConnectionManager.Monitor: TioConnectionMonitorRef;
begin
  Result := TioConnectionMonitor;
end;
{$ENDIF}

class function TioConnectionManager.NewCustomConnectionDef(const AConnectionName: String; const APooled: Boolean; const AAsDefault: Boolean): IIoStanConnectionDef;
begin
  // Create the ConnectionDef object and set his name
  // NB: The name of the connectionDef should never be changed after
  Result := FDManager.ConnectionDefs.FindConnectionDef(AConnectionName);
  if not Assigned(Result) then
    Result := FDManager.ConnectionDefs.AddConnectionDef;
  Result.Name := AConnectionName;
  Result.Params.Pooled := APooled;
  // If the AsDefault param is True or this is the first ConnectionDef of the application
  // then set it as default
  if AAsDefault then
    TioApplication.SessionDataStore.SetDefaultConnectionIfEmpty(AConnectionName);
end;

class function TioConnectionManager.NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'FB';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    Result.Params.Values['Protocol'] := 'TCPIP';
    if ACharSet <> '' then
      Result.Params.Values['CharacterSet'] := ACharSet;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, ctFirebird, APersistent, ASynchroStrategy_Client));
  finally
    _Unlock
  end;
end;

class function TioConnectionManager.NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'MySQL';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    if ACharSet <> '' then
      Result.Params.Values['CharacterSet'] := ACharSet;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, ctMySQL, APersistent, ASynchroStrategy_Client));
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.NewHttpConnection(const ABaseURL: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil; const APersistent: Boolean = True;
      const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
var
  LConnectionInfo: TioConnectionInfo;
begin
  _Lock;
  try
    // Setup the connection info
    LConnectionInfo := TioConnectionInfo.Create(AConnectionName, ctHTTP, APersistent, ASynchroStrategy_Client);
    LConnectionInfo.BaseURL := ABaseURL;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, LConnectionInfo);
    // If the AsDefault param is True or this is the first ConnectionDef of the application
    // then set it as default
    if AAsDefault then
      TioApplication.SessionDataStore.SetDefaultConnectionIfEmpty(AConnectionName);
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.NewSQLiteConnectionDef(const ADatabase: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil; const APersistent: Boolean = False;
      const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'SQLite';
    Result.Params.Database := ADatabase;
    Result.Params.Values['FailIfMissing'] := 'False';
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, ctSQLite, APersistent, ASynchroStrategy_Client));
  finally
    _Unlock;
  end;
end;


class function TioConnectionManager.NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword: String; const AAsDefault: Boolean = True; const ASynchroStrategy_Client: IioSynchroStrategy_Client = nil;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoStanConnectionDef;
begin
  _Lock;
  try
    Result := NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'MSSQL';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, ctSQLServer, APersistent, ASynchroStrategy_Client));
  finally
    _Unlock;
  end;
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
  if not Assigned(FMoniRemoteClientLink) then
    FMoniRemoteClientLink := TFDMoniRemoteClientLink.Create(nil);
  Result := FMoniRemoteClientLink;
end;

class function TioConnectionMonitor.RemoteFlatFileLink: TFDMoniFlatFileClientLink;
begin
  if not Assigned(FMoniFlatFileClientLink) then
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
    mmRemote:
      RemoteClientLink.Tracing := True;
    mmFlatFile:
      RemoteFlatFileLink.Tracing := True;
  end;
end;
{$ENDIF}

initialization

FDManager.Active := True; // For thread safe enable FDManager before any db connection start
FDManager.SilentMode := True; // NB: Per evitare l'errore di FireDAC sul WaitCursor

TioConnectionContainer.CreateInternalContainer;
TioConnectionManager.CreateInternalContainer;

finalization

TioConnectionContainer.FreeInternalContainer;
TioConnectionManager.FreeInternalContainer;
{$IFDEF MSWINDOWS}
TioConnectionMonitor.FreeFDMoniClientLinks;
{$ENDIF}

end.
