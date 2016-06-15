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



unit iORM.LazyLoad.Generics.List;

interface

uses
  iORM.CommonTypes, System.Types,
  System.Generics.Defaults, System.Generics.Collections,
  iORM.LazyLoad.Interfaces, iORM.Containers.Interfaces,
  iORM.Where.Interfaces;

type

  TioList<T> = class(TList<T>, IioList<T>, IioLazyLoadable, IInterface)
  // ===========================================================================
  // PARTE AGGIUNTA/MODIFICATA DA IORM PER LA GESTIONE DEL LAZY LOAD
  // ---------------------------------------------------------------------------
  strict private type
    TInternalObjType = TList<T>;
    arrayofT = array of T;  // Già presente nell'antenato
  strict private
    FioLazyLoader: IioLazyLoader<TInternalObjType>;
    function GetCapacity: Integer;
    function GetCount: Integer;
    function GetItem(Index: Integer): T;
    function GetItems: arrayofT;
    procedure SetCapacity(const Value: Integer);
    procedure SetCount(const Value: Integer);
    procedure SetItem(Index: Integer; const Value: T);
  protected
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    [Volatile] FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
// ---------------- End: section added for IInterface support ---------------
    function ioLazyLoader: IioLazyLoader<TInternalObjType>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere);
    function GetInternalObject: TObject;
  // ===========================================================================



// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property RefCount: Integer read FRefCount;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------

    class procedure Error(const Msg: string; Data: NativeInt); overload; virtual;
{$IFNDEF NEXTGEN}
    class procedure Error(Msg: PResStringRec; Data: NativeInt); overload;
{$ENDIF  NEXTGEN}

    function Add(const Value: T): Integer;

    procedure AddRange(const Values: array of T); overload;
    procedure AddRange(const Collection: IEnumerable<T>); overload;
    procedure AddRange(const Collection: TEnumerable<T>); overload;

    procedure Insert(Index: Integer; const Value: T);

    procedure InsertRange(Index: Integer; const Values: array of T); overload;
    procedure InsertRange(Index: Integer; const Collection: IEnumerable<T>); overload;
    procedure InsertRange(Index: Integer; const Collection: TEnumerable<T>); overload;

    procedure Pack; overload;
//    procedure Pack(const IsEmpty: TEmptyFunc); overload;

    function Remove(const Value: T): Integer;
    function RemoveItem(const Value: T; Direction: TDirection): Integer;
    procedure Delete(Index: Integer);
    procedure DeleteRange(AIndex, ACount: Integer);
    function Extract(const Value: T): T;
    function ExtractItem(const Value: T; Direction: TDirection): T;

    procedure Exchange(Index1, Index2: Integer);
    procedure Move(CurIndex, NewIndex: Integer);

    function First: T;
    function Last: T;

    procedure Clear;

    function Expand: TInternalObjType;

    function Contains(const Value: T): Boolean;
    function IndexOf(const Value: T): Integer;
    function IndexOfItem(const Value: T; Direction: TDirection): Integer;
    function LastIndexOf(const Value: T): Integer;

    procedure Reverse;

    procedure Sort; overload;
    procedure Sort(const AComparer: IComparer<T>); overload;
    function BinarySearch(const Item: T; out Index: Integer): Boolean; overload;
    function BinarySearch(const Item: T; out Index: Integer; const AComparer: IComparer<T>): Boolean; overload;

    procedure TrimExcess;

    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: T read GetItem write SetItem; default;
    property List: arrayofT read GetItems;

    function GetEnumerator: TList<T>.TEnumerator;
  end;
// ---------------- Start: section added for IInterface support ---------------
  {$IFNDEF SYSTEM_HPP_DEFINES_OBJECTS}
//  {$NODEFINE TInterfacedObject}         { defined in systobj.h }
  {$ENDIF}
// ---------------- End: section added for IInterface support ---------------

implementation

uses
  iORM, iORM.LazyLoad.Factory;

{ TioList<T> }

// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
procedure TioList<T>.AfterConstruction;
begin
// Release the constructor's implicit refcount
  AtomicDecrement(FRefCount);
end;

procedure TioList<T>.BeforeDestruction;
begin
  if RefCount <> 0 then
    System.Error(reInvalidPtr);
end;

class function TioList<T>.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TioList<T>(Result).FRefCount := 1;
end;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------



function TioList<T>.Add(const Value: T): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.Add(Value);
end;

procedure TioList<T>.AddRange(const Collection: IEnumerable<T>);
begin
  ioLazyLoader.GetInternalObj.AddRange(Collection);
end;

procedure TioList<T>.AddRange(const Values: array of T);
begin
  ioLazyLoader.GetInternalObj.AddRange(Values);
end;

procedure TioList<T>.AddRange(const Collection: TEnumerable<T>);
begin
  ioLazyLoader.GetInternalObj.AddRange(Collection);
end;

function TioList<T>.BinarySearch(const Item: T; out Index: Integer): Boolean;
begin
  Result := ioLazyLoader.GetInternalObj.BinarySearch(Item, Index);
end;

function TioList<T>.BinarySearch(const Item: T; out Index: Integer;
  const AComparer: IComparer<T>): Boolean;
begin
  Result := ioLazyLoader.GetInternalObj.BinarySearch(Item, Index, AComparer);
end;

procedure TioList<T>.Clear;
begin
  ioLazyLoader.GetInternalObj.Clear;
end;

function TioList<T>.Contains(const Value: T): Boolean;
begin
  Result := ioLazyLoader.GetInternalObj.Contains(Value);
end;

constructor TioList<T>.Create;
begin
  inherited Create;
  FioLazyLoader := TioLazyLoadFactory.LazyLoader<TInternalObjType>;
end;

procedure TioList<T>.Delete(Index: Integer);
begin
  ioLazyLoader.GetInternalObj.Delete(Index);
end;

procedure TioList<T>.DeleteRange(AIndex, ACount: Integer);
begin
  ioLazyLoader.GetInternalObj.DeleteRange(AIndex, ACount);
end;

destructor TioList<T>.Destroy;
begin

  inherited;
end;

class procedure TioList<T>.Error(const Msg: string; Data: NativeInt);
begin
  TInternalObjType.Error(Msg, Data);
end;

{$IFNDEF NEXTGEN}
class procedure TioList<T>.Error(Msg: PResStringRec; Data: NativeInt);
begin
  TInternalObjType.Error(Msg, Data);
end;
{$ENDIF  NEXTGEN}

procedure TioList<T>.Exchange(Index1, Index2: Integer);
begin
  ioLazyLoader.GetInternalObj.Exchange(Index1, Index2);
end;

function TioList<T>.Expand: TInternalObjType;
begin
  Result := ioLazyLoader.GetInternalObj.Expand;
end;

function TioList<T>.Extract(const Value: T): T;
begin
  Result := ioLazyLoader.GetInternalObj.Extract(Value);
end;

function TioList<T>.ExtractItem(const Value: T; Direction: TDirection): T;
begin
  Result := ioLazyLoader.GetInternalObj.ExtractItem(Value, Direction);
end;

function TioList<T>.First: T;
begin
  Result := ioLazyLoader.GetInternalObj.First;
end;

function TioList<T>.GetCapacity: Integer;
begin
  Result := ioLazyLoader.GetInternalObj.Capacity;
end;

function TioList<T>.GetCount: Integer;
begin
  Result := ioLazyLoader.GetInternalObj.Count;
end;

function TioList<T>.GetEnumerator: TList<T>.TEnumerator;
begin
  Result := ioLazyLoader.GetInternalObj.GetEnumerator;
end;

function TioList<T>.GetInternalObject: TObject;
begin
  Result := ioLazyLoader.GetInternalObj;
end;

function TioList<T>.GetItem(Index: Integer): T;
begin
  Result := ioLazyLoader.GetInternalObj.Items[Index];
end;

function TioList<T>.GetItems: arrayofT;
begin
  Result := ioLazyLoader.GetInternalObj.List;
end;

function TioList<T>.IndexOf(const Value: T): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.IndexOf(Value);
end;

function TioList<T>.IndexOfItem(const Value: T; Direction: TDirection): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.IndexOfItem(Value, Direction);
end;

procedure TioList<T>.Insert(Index: Integer; const Value: T);
begin
  ioLazyLoader.GetInternalObj.Insert(Index, Value);
end;

procedure TioList<T>.InsertRange(Index: Integer;
  const Collection: TEnumerable<T>);
begin
  ioLazyLoader.GetInternalObj.InsertRange(Index, Collection);
end;

function TioList<T>.ioLazyLoader: IioLazyLoader<TInternalObjType>;
begin
  Result := FioLazyLoader;
end;

procedure TioList<T>.InsertRange(Index: Integer;
  const Collection: IEnumerable<T>);
begin
  ioLazyLoader.GetInternalObj.InsertRange(Index, Collection);
end;

procedure TioList<T>.InsertRange(Index: Integer; const Values: array of T);
begin
  ioLazyLoader.GetInternalObj.InsertRange(Index, Values);
end;

function TioList<T>.Last: T;
begin
  Result := ioLazyLoader.GetInternalObj.Last;
end;

function TioList<T>.LastIndexOf(const Value: T): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.LastIndexOf(Value);
end;

procedure TioList<T>.Move(CurIndex, NewIndex: Integer);
begin
  ioLazyLoader.GetInternalObj.Move(CurIndex, NewIndex);
end;

procedure TioList<T>.Pack;
begin
  ioLazyLoader.GetInternalObj.Pack;
end;

function TioList<T>.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TioList<T>.Remove(const Value: T): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.Remove(Value);
end;

function TioList<T>.RemoveItem(const Value: T; Direction: TDirection): Integer;
begin
  Result := ioLazyLoader.GetInternalObj.RemoveItem(Value, Direction);
end;

procedure TioList<T>.Reverse;
begin
  ioLazyLoader.GetInternalObj.Reverse;
end;

procedure TioList<T>.SetCapacity(const Value: Integer);
begin
  ioLazyLoader.GetInternalObj.Capacity := Value;
end;

procedure TioList<T>.SetCount(const Value: Integer);
begin
  ioLazyLoader.GetInternalObj.Count := Value;
end;

procedure TioList<T>.SetItem(Index: Integer; const Value: T);
begin
  ioLazyLoader.GetInternalObj.Items[Index] := Value;
end;

procedure TioList<T>.SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationChildID: Integer; const ARelationChildWhere:IioWhere);
begin
  ioLazyLoader.SetRelationInfo(ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationChildID, ARelationChildWhere);
end;

procedure TioList<T>.Sort(const AComparer: IComparer<T>);
begin
  ioLazyLoader.GetInternalObj.Sort(AComparer);
end;

procedure TioList<T>.Sort;
begin
  ioLazyLoader.GetInternalObj.Sort;
end;

procedure TioList<T>.TrimExcess;
begin
  ioLazyLoader.GetInternalObj.TrimExcess;
end;


function TioList<T>._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TioList<T>._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

end.
