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



unit iORM.LiveBindings.InterfaceListBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Classes, System.Rtti,
  System.Generics.Collections;

type

  /// <summary>Adapter to provide a generic TList to TAdapterBindSource</summary>
  TInterfaceListBindSourceAdapter<T:IInterface> = class(TBaseListBindSourceAdapter)
  private
    FTypeName, FTypeAlias: String;
    FBaseObjectRttiType: TRttiType;
    FList: TList<T>;
    FInstanceFactory: TBindSourceAdapterInstanceFactory;
    FOwnsList: Boolean;
    FOnBeforeSetList: TSetObjectEvent;
    FOnAfterSetList: TAdapterNotifyEvent;
    function GetItemInstanceFactory: TBindSourceAdapterInstanceFactory;
  protected
    procedure CheckList;
    function GetObjectType: TRttiType; override;
    function CreateItemInstance: T; virtual;
    procedure InitItemInstance(AInstance: T); virtual;
    function GetCurrent: TObject; override;
    function GetCount: Integer; override;
    function DeleteAt(AIndex: Integer): Boolean;  override;
    function AppendAt: Integer; override;
    function InsertAt(AIndex: Integer): Integer; override;
    function GetCanActivate: Boolean; override;
    function SupportsNestedFields: Boolean; override;
    function GetCanDelete: Boolean; override;
    function GetCanInsert: Boolean; override;
    function GetCanModify: Boolean; override;
    function GetCanApplyUpdates: Boolean; override;
    function GetCanCancelUpdates: Boolean; override;
    procedure AddFields; virtual;
    procedure InternalCancelUpdates; override;
    procedure InternalApplyUpdates; override;
    procedure DoOnBeforeSetList(AList: TList<T>); virtual;
    procedure DoOnAfterSetList; virtual;
    property BaseObjectRttiType:TRttiType read FBaseObjectRttiType;
  public
    constructor Create(const AOwner: TComponent; const AList: TList<T>; const ATypeAlias:String=''; const ATypeName:String=''; const AOwnsObject: Boolean = True); reintroduce; overload; virtual;
    destructor Destroy; override;
    procedure SetList(AList: TList<T>; AOwnsObject: Boolean = True);
    property List: TList<T> read FList;
    property OnBeforeSetList: TSetObjectEvent read FOnBeforeSetList write FOnBeforeSetList;
    property OnAfterSetList: TAdapterNotifyEvent read FOnAfterSetList write FOnAfterSetList;
  end;

  TInterfaceListBindSourceAdapter =  class(TInterfaceListBindSourceAdapter<IInterface>)
  public
    constructor Create(const AOwner: TComponent; const AList:TObject; const ATypeAlias:String=''; const ATypeName:String=''; const AOwnsObject: Boolean = True); reintroduce; overload; virtual;
  end;


implementation

uses Data.Bind.Consts, System.SysUtils, iORM.Rtti.Utilities, System.TypInfo, iORM;

{ TListBindSourceAdapter<T> }

procedure TInterfaceListBindSourceAdapter<T>.AddFields;
var
  LType: TRttiType;
  LGetMemberObject: IGetMemberObject;
begin
  LType := GetObjectType;
  LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
  AddFieldsToList(LType, Self, Self.Fields, LGetMemberObject);
  AddPropertiesToList(LType, Self, Self.Fields, LGetMemberObject);
end;

function TInterfaceListBindSourceAdapter<T>.AppendAt: Integer;
var
  ANewItem: T;
  LIndex: Integer;
  LHandled: Boolean;
  LAppended: Boolean;
begin
  DoListAppend(LHandled, LAppended);
  if LHandled then
    if LAppended then
    begin
      CheckList;
      Exit(FList.Count - 1)
    end
    else
      Exit(-1);

  Result := -1;
  ANewItem := CreateItemInstance;
  if ANewItem <> nil then
  begin
    InitItemInstance(ANewItem);
    FList.Add(ANewItem);
    Result := FList.Count - 1;
  end;
end;

procedure TInterfaceListBindSourceAdapter<T>.CheckList;
begin
  if FList = nil then
    BindSourceAdapterError(sNilList);
end;

constructor TInterfaceListBindSourceAdapter<T>.Create(const AOwner: TComponent; const AList: TList<T>; const ATypeAlias, ATypeName:String; const AOwnsObject: Boolean);
begin
  Create(AOwner);
  // Set the BaseObjectType
  FTypeName := ATypeName;
  if FTypeName.IsEmpty then
    FTypeName := TioRttiUtilities.GenericToString<T>;
  FTypeAlias := ATypeAlias;
  FBaseObjectRttiType := io.di.Locate(FTypeName).Alias(FTypeAlias).GetItem.RttiType;
  // Set the list
  SetList(AList, AOwnsObject);
end;

function TInterfaceListBindSourceAdapter<T>.CreateItemInstance: T;
var
  LObject: TObject;
begin
  CheckList;
  Result := nil;
  Assert(GetItemInstanceFactory.CanConstructInstance);
  if GetItemInstanceFactory.CanConstructInstance then
  begin
    LObject := GetItemInstanceFactory.ConstructInstance;
    try
      Result := TioRttiUtilities.CastObjectToGeneric<T>(LObject);
    except
      LObject.Free;
      raise;
    end;
  end;
end;

function TInterfaceListBindSourceAdapter<T>.DeleteAt(AIndex: Integer): Boolean;
var
  LHandled: Boolean;
  LRemoved: Boolean;
begin
  DoListDelete(AIndex, LHandled, LRemoved);
  if LHandled then
    Exit(LRemoved);
  if (AIndex >= 0) and (AIndex < FList.Count) then
  begin
    CheckList;
    FList.Delete(AIndex);
    Result := True;
  end
  else
    Result := False;
end;

destructor TInterfaceListBindSourceAdapter<T>.Destroy;
begin
  if FOwnsList then
    FreeAndNil(FList);
  FInstanceFactory.Free;
  inherited;
end;

procedure TInterfaceListBindSourceAdapter<T>.DoOnAfterSetList;
begin
  if Assigned(FOnAfterSetList) then
    FOnAfterSetList(Self);
end;

procedure TInterfaceListBindSourceAdapter<T>.DoOnBeforeSetList(AList: TList<T>);
begin
  if Assigned(FOnBeforeSetList) then
    FOnBeforeSetList(Self, AList);
end;

function TInterfaceListBindSourceAdapter<T>.GetCanActivate: Boolean;
begin
  Result := FList <> nil;
end;

function TInterfaceListBindSourceAdapter<T>.GetCanApplyUpdates: Boolean;
var
  LHasUpdates: Boolean;
begin
  Result := loptAllowApplyUpdates in Options;
  if Result then
  begin
    Result := Assigned(OnApplyUpdates);
    if Result then
      if Assigned(OnHasUpdates) then
      begin
        LHasUpdates := False;
        OnHasUpdates(Self, LHasUpdates);
        Result := LHasUpdates;
      end;
  end;
end;

function TInterfaceListBindSourceAdapter<T>.GetCanCancelUpdates: Boolean;
var
  LHasUpdates: Boolean;
begin
  Result := loptAllowCancelUpdates in Options;
  if Result then
  begin
    Result := Assigned(OnCancelUpdates);
    if Result then
      if Assigned(OnHasUpdates) then
      begin
        LHasUpdates := False;
        OnHasUpdates(Self, LHasUpdates);
        Result := LHasUpdates;
      end;
  end;
end;

function TInterfaceListBindSourceAdapter<T>.GetCanDelete: Boolean;
begin
  Result := loptAllowDelete in Options;
end;

function TInterfaceListBindSourceAdapter<T>.GetCanInsert: Boolean;
begin
  Result := (loptAllowInsert in Options);
  if Result then
  begin
    Result := Assigned(OnCreateItemInstance) or
      GetItemInstanceFactory.CheckConstructor;
  end;
end;

function TInterfaceListBindSourceAdapter<T>.GetCanModify: Boolean;
begin
  Result := (loptAllowModify in Options);
end;

function TInterfaceListBindSourceAdapter<T>.GetCount: Integer;
begin
  if FList <> nil then
    Result := FList.Count
  else
    Result := 0;
end;

function TInterfaceListBindSourceAdapter<T>.GetCurrent: TObject;
var
  LIndex: Integer;
begin
  LIndex := ItemIndex + ItemIndexOffset;
  if (FList <> nil) and (LIndex >= 0) and (LIndex < FList.Count) then
    Result := FList.Items[ItemIndex +  ItemIndexOffset] as TObject
  else
    Result := nil;
end;

function TInterfaceListBindSourceAdapter<T>.GetItemInstanceFactory: TBindSourceAdapterInstanceFactory;
begin
  if FInstanceFactory = nil then
    FInstanceFactory := TBindSourceAdapterInstanceFactory.Create(GetObjectType);
  Result := FInstanceFactory;
end;

function TInterfaceListBindSourceAdapter<T>.GetObjectType: TRttiType;
begin
  Result := FBaseObjectRttiType;
end;

procedure TInterfaceListBindSourceAdapter<T>.InitItemInstance(AInstance: T);
begin
  DoInitItemInstance(AInstance as TObject);
end;

function TInterfaceListBindSourceAdapter<T>.InsertAt(AIndex: Integer): Integer;
var
  ANewItem: T;
  AHandled: Boolean;
begin
  DoListInsert(AIndex, AHandled, Result);
  if AHandled then
    Exit;
  Result := -1;
  ANewItem := CreateItemInstance;
  if ANewItem <> nil then
  begin
    InitItemInstance(ANewItem);
    FList.Insert(AIndex, ANewItem);
    Result := AIndex;
  end;
end;

procedure TInterfaceListBindSourceAdapter<T>.InternalApplyUpdates;
begin
  if Assigned(OnApplyUpdates) then
    OnApplyUpdates(Self);
end;

procedure TInterfaceListBindSourceAdapter<T>.InternalCancelUpdates;
begin
  if Assigned(OnCancelUpdates) then
    OnCancelUpdates(Self);
end;

procedure TInterfaceListBindSourceAdapter<T>.SetList(AList: TList<T>; AOwnsObject: Boolean);
begin
  DoOnBeforeSetList(AList);
  Active := False;
  if FList <> nil then
  begin
    ClearFields;
    if FOwnsList then
      FreeAndNil(FList);
  end;
  FOwnsList := AOwnsObject;
  FList := AList;
  if FList <> nil then
  begin
    AddFields;
  end;
  DoOnAfterSetList;
end;

function TInterfaceListBindSourceAdapter<T>.SupportsNestedFields: Boolean;
begin
  Result := True;
end;

{ TInterfaceListBindSourceAdapter }

constructor TInterfaceListBindSourceAdapter.Create(const AOwner: TComponent; const AList: TObject; const ATypeAlias,
  ATypeName: String; const AOwnsObject: Boolean);
var
  AListInternal: TList<IInterface>;
begin
  AListInternal := TList<IInterface>(AList);
  Create(AOwner, AListInternal, ATypeAlias, ATypeName, AOwnsObject);
end;

end.
