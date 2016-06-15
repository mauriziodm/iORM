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



unit iORM.DependencyInjection.Singletons;

interface

uses
  System.Generics.Collections, System.SyncObjs;

type

  // Singleton item (SubContainer item)
  TioSingletonItem = class
  strict private
    FObjInstance: TObject;
    FIntfInstance: IInterface;
  public
    constructor Create(const AObj:TObject); overload;
    function GetObjInstance: TObject;
  end;

  // Singleton instances container (SubContainer)
  TioSingletonInstancesContainer = class
  strict private
    FContainer: TObjectDictionary<String, TioSingletonItem>;
    function ComposeKey(const ATypeName, ATypeAlias: String): String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const ATypeName, ATypeAlias: String; const AObj:TObject);
    procedure Remove(const ATypeName, ATypeAlias: String);
    function TryGet(const ATypeName, ATypeAlias:String; var AResult:TObject): Boolean;
  end;

  // Singleton keys container (MasterContainer)
  TioSingletonKeysContainerInstance = TObjectDictionary<String, TioSingletonInstancesContainer>;
  TioSingletonsContainer = class abstract
  strict private
    class var FContainer: TioSingletonKeysContainerInstance;
    class var FCriticalSection: TCriticalSection;
    class var FLevel: Integer;
  strict protected
    class function Container: TioSingletonKeysContainerInstance;
    class function CriticalSection: TCriticalSection;
    class procedure KeyCheck(var AKey:String);
    class procedure InternalResetKey(AKey:String);
  public
    class procedure CleanUp;
    class procedure Add(AKey:String; const ATypeName, ATypeAlias: String; const AObj:TObject);
    class procedure ResetKey(AKey:String);
    class procedure ResetAll;
    class procedure ReleaseLevel;
    class procedure NextLevel;
    class procedure ResetInstance(AKey:String; const ATypeName, ATypeAlias: String);
    class function TryGet(AKey:String; const ATypeName, ATypeAlias: String; var AResultObject:TObject): boolean;
  end;

  // Singletons external interface class
  TioSingletonsFacadeRef = class of TioSingletonsFacade;
  TioSingletonsFacade = class abstract
  public
    class procedure ResetAll;
    class procedure ResetKey(AKey:String);
    class procedure ResetInstance(AKey:String; const ATypeName, ATypeAlias: String);
    class procedure ReleaseLevel;
    class procedure NextLevel;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions;

{ TioSingletonItem }

constructor TioSingletonItem.Create(const AObj:TObject);
var
  AInterfacedObject: IInterface;
begin
  inherited Create;
  // Set the ObjInstance reference for the singleton item
  Self.FObjInstance := AObj;
  // If it is an interfaced object then set a reference (IInterface) to prevent someone else destroy it by RefCount
  if Supports(AObj, IInterface, AInterfacedObject) then
    Self.FIntfInstance := AInterfacedObject
  else
    Self.FIntfInstance := nil;
end;

function TioSingletonItem.GetObjInstance: TObject;
begin
  Result := Self.FObjInstance;
end;

{ TioSingletonInstancesContainer }

procedure TioSingletonInstancesContainer.Add(const ATypeName, ATypeAlias: String; const AObj: TObject);
begin
  FContainer.Add(
    Self.ComposeKey(ATypeName, ATypeAlias),
    TioSingletonItem.Create(AObj)
  );
end;

function TioSingletonInstancesContainer.ComposeKey(const ATypeName, ATypeAlias: String): String;
begin
  Result := ATypeName + ' as ' + ATypeAlias;
end;

constructor TioSingletonInstancesContainer.Create;
begin
  inherited;
  FContainer := TObjectDictionary<String, TioSingletonItem>.Create([doOwnsValues]);
end;

destructor TioSingletonInstancesContainer.Destroy;
begin
  FContainer.Free;
  inherited;
end;

procedure TioSingletonInstancesContainer.Remove(const ATypeName, ATypeAlias: String);
begin
  FContainer.Remove(  Self.ComposeKey(ATypeName, ATypeAlias)   );
end;

function TioSingletonInstancesContainer.TryGet(const ATypeName, ATypeAlias: String; var AResult: TObject): Boolean;
var
  AKey: String;
begin
  AKey := Self.ComposeKey(ATypeName, ATypeAlias);
  Result := FContainer.ContainsKey(AKey);
  if Result then
    AResult := FContainer.Items[AKey].GetObjInstance;
end;

{ TioSingletonKeysContainer }

class procedure TioSingletonsContainer.Add(AKey: String; const ATypeName, ATypeAlias: String; const AObj: TObject);
var
  AInstanceContainer: TioSingletonInstancesContainer;
begin
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // If the key is empty then return the actual level value as key
    KeyCheck(AKey);
    // Get the InstanceContainer (SubContainer) if not exists then create it
    if not Self.Container.TryGetValue(AKey, AInstanceContainer) then
    begin
      AInstanceContainer := TioSingletonInstancesContainer.Create;
      Self.Container.Add(AKey, AInstanceContainer);
    end;
    // Add the object in the SingletonInstanceContainer
    AInstanceContainer.Add(ATypeName, ATypeAlias, AObj);
  finally
    // Release the critical section
    Self.CriticalSection.Release;
  end;
end;

class procedure TioSingletonsContainer.CleanUp;
begin
  if Assigned(FCriticalSection) then FCriticalSection.Free;
  if Assigned(FContainer) then FContainer.Free;
end;

class function TioSingletonsContainer.Container: TioSingletonKeysContainerInstance;
begin
  if not Assigned(FContainer) then
    FContainer := TioSingletonKeysContainerInstance.Create([doOwnsValues]);
  Result := FContainer;
end;

class function TioSingletonsContainer.CriticalSection: TCriticalSection;
begin
  if not Assigned(FCriticalSection) then
    FCriticalSection := TCriticalSection.Create;
  Result := FCriticalSection;
end;

class procedure TioSingletonsContainer.InternalResetKey(AKey: String);
begin
  // For this procedure the AKey parameter must be passed (<>'')
  if AKey.IsEmpty then raise EioException.Create(Self.ClassName + ': AKey parameter not valid!');
  // Remove the key
  Self.Container.Remove(AKey);
end;

class procedure TioSingletonsContainer.KeyCheck(var AKey: String);
begin
  if AKey.IsEmpty then AKey := FLevel.ToString;
end;

class procedure TioSingletonsContainer.NextLevel;
begin
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // Increment the current level
    inc(Self.FLevel);
  finally
    // Release the critical section
    Self.CriticalSection.Release;
  end;
end;

class procedure TioSingletonsContainer.ReleaseLevel;
var
  AKey: String;
begin
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // Get the key for the current level
    //  (If the key is empty then return the actual level value as key)
    KeyCheck(AKey);
    // Reset the current level
    Self.InternalResetKey(AKey);
    // Decrement the level counter
    Dec(Self.FLevel);
  finally
    // Release the critical section
    Self.CriticalSection.Release;
  end;
end;

class procedure TioSingletonsContainer.ResetAll;
var
  AKey: String;
begin
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // Loop for all keys and remove each one
    for AKey in Self.Container.Keys do
      Self.InternalResetKey(AKey);
    // Reset level counter
    Self.FLevel := 0;
  finally
    // Release the critical section
    Self.CriticalSection.Release;
  end;
end;

class procedure TioSingletonsContainer.ResetKey(AKey: String);
begin
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // Remove the key
    Self.InternalResetKey(AKey);
  finally
    // Releazse the critical section
    Self.CriticalSection.Release;
  end;
end;

class procedure TioSingletonsContainer.ResetInstance(AKey: String; const ATypeName, ATypeAlias: String);
var
  AInstanceContainer: TioSingletonInstancesContainer;
begin
  // If the container is non instantiated then exit for optimization
  if not Assigned(FContainer) then Exit;
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // If the key is empty then return the actual level value as key
    KeyCheck(AKey);
    // Reset the singleton instance if exists
    if Self.Container.TryGetValue(AKey, AInstanceContainer) then
      AInstanceContainer.Remove(ATypeName, ATypeAlias);
  finally
    // Releazse the critical section
    Self.CriticalSection.Release;
  end;
end;

class function TioSingletonsContainer.TryGet(AKey:String; const ATypeName, ATypeAlias: String; var AResultObject: TObject): boolean;
var
  AInstanceContainer: TioSingletonInstancesContainer;
begin
  // Init
  Result := False;
  // If the container is non instantiated then exit for optimization
  if not Assigned(FContainer) then Exit;
  // Acquire the critical section
  Self.CriticalSection.Acquire;
  try
    // If the key is empty then return the actual level value as key
    KeyCheck(AKey);
    // Get the singleton instance if exists
    Result := Self.Container.TryGetValue(AKey, AInstanceContainer) and AInstanceContainer.TryGet(ATypeName, ATypeAlias, AResultObject);
  finally
    // Releazse the critical section
    Self.CriticalSection.Release;
  end;
end;

{ TioSingletonsExternal }

class procedure TioSingletonsFacade.NextLevel;
begin
  TioSingletonsContainer.NextLevel;
end;

class procedure TioSingletonsFacade.ReleaseLevel;
begin
  TioSingletonsContainer.ReleaseLevel;
end;

class procedure TioSingletonsFacade.ResetAll;
begin
  TioSingletonsContainer.ResetAll;
end;

class procedure TioSingletonsFacade.ResetKey(AKey: String);
begin
  TioSingletonsContainer.ResetKey(Akey);
end;

class procedure TioSingletonsFacade.ResetInstance(AKey: String; const ATypeName, ATypeAlias: String);
begin
  TioSingletonsContainer.ResetInstance(AKey, ATypeName, ATypeAlias);
end;

initialization

finalization

  TioSingletonsContainer.CleanUp;

end.
