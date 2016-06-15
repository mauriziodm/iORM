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



unit iORM.LiveBindings.InterfaceObjectBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Rtti, System.Classes;

type

  /// <summary>Adapter to provide an arbitrary object to TAdapterBindSource</summary>
  TInterfaceObjectBindSourceAdapter<T:IInterface> = class(TBaseObjectBindSourceAdapter)
  private
    FTypeName, FTypeAlias: String;
    FBaseObjectRttiType: TRttiType;
    FDataObject: T;
    FOwnsObject: Boolean;
    FOnBeforeSetDataObject: TSetObjectEvent;
    FOnAfterSetDataObject: TAdapterNotifyEvent;
  protected
    function GetObjectType: TRttiType; override;
    function GetCanActivate: Boolean; override;
    function GetCurrent: TObject; override;
    function GetCount: Integer; override;
    function DeleteAt(AIndex: Integer): Boolean;  override;
    function AppendAt: Integer; override;
    function InsertAt(AIndex: Integer): Integer; override;
    function SupportsNestedFields: Boolean; override;
    function GetCanModify: Boolean; override;
    function GetCanApplyUpdates: Boolean; override;
    function GetCanCancelUpdates: Boolean; override;
    procedure AddFields; virtual;
    procedure InternalApplyUpdates; override;
    procedure InternalCancelUpdates; override;
    procedure DoOnBeforeSetDataObject(ADataObject: T); virtual;
    procedure DoOnAfterSetDataObject; virtual;
    property BaseObjectRttiType:TRttiType read FBaseObjectRttiType;
  public
    constructor Create(const AOwner: TComponent; const AObject: T; const ATypeAlias:String=''; const ATypeName:String=''); reintroduce; overload; virtual;
    destructor Destroy; override;
    procedure SetDataObject(ADataObject: T; AOwnsObject: Boolean = False);
    property DataObject: T read FDataObject;
    property OnBeforeSetDataObject: TSetObjectEvent read FOnBeforeSetDataObject write FOnBeforeSetDataObject;
    property OnAfterSetDataObject: TAdapterNotifyEvent read FOnAfterSetDataObject write FOnAfterSetDataObject;
  end;

  TInterfaceObjectBindSourceAdapter = class(TInterfaceObjectBindSourceAdapter<IInterface>)
  public
    constructor Create(const AOwner: TComponent; const AObject: TObject; const ATypeAlias:String=''; const ATypeName:String=''); reintroduce; overload; virtual;
    procedure SetDataObject(ADataObject: TObject; AOwnsObject: Boolean = True);
  end;

implementation


uses SysUtils, iORM.Rtti.Utilities, iORM, iORM.Exceptions;

{ TInterfaceObjectBindSourceAdapter<T> }

procedure TInterfaceObjectBindSourceAdapter<T>.AddFields;
var
  LType: TRttiType;
  LIntf: IGetMemberObject;
begin
  LType := GetObjectType;
  LIntf := TBindSourceAdapterGetMemberObject.Create(Self);
  AddFieldsToList(LType, Self, Self.Fields, LIntf);
  AddPropertiesToList(LType, Self, Self.Fields, LIntf);
end;

function TInterfaceObjectBindSourceAdapter<T>.AppendAt: Integer;
begin
  Assert(False);
end;

constructor TInterfaceObjectBindSourceAdapter<T>.Create(const AOwner: TComponent; const AObject: T; const ATypeAlias:String; const ATypeName:String);
begin
  inherited Create(AOwner);
  // Set the BaseObjectType
  FTypeName := ATypeName;
  if FTypeName.IsEmpty then
    FTypeName := TioRttiUtilities.GenericToString<T>;
  FTypeAlias := ATypeAlias;
  FBaseObjectRttiType := io.di.Locate(FTypeName).Alias(FTypeAlias).GetItem.RttiType;
  // Set the data object
  //  NB: Force FOwnsObject := False because this BindSourceAdapter is for interface and his AutoRefCount
  FOwnsObject := False;
  SetDataObject(AObject, FOwnsObject);
end;

function TInterfaceObjectBindSourceAdapter<T>.DeleteAt(AIndex: Integer): Boolean;
begin
  Assert(False);
end;

destructor TInterfaceObjectBindSourceAdapter<T>.Destroy;
begin
  if FOwnsObject then
    FreeAndNil(FDataObject);
  inherited;
end;

procedure TInterfaceObjectBindSourceAdapter<T>.DoOnAfterSetDataObject;
begin
  if Assigned(FOnAfterSetDataObject) then
    FOnAfterSetDataObject(Self);
end;

procedure TInterfaceObjectBindSourceAdapter<T>.DoOnBeforeSetDataObject(ADataObject: T);
begin
  if Assigned(FOnBeforeSetDataObject) then
    FOnBeforeSetDataObject(Self, ADataObject as TObject);
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCanActivate: Boolean;
begin
  Result := FDataObject <> nil;
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCanApplyUpdates: Boolean;
begin
  Result := optAllowApplyUpdates in Options;
  if Result then
    Result := Assigned(OnApplyUpdates)
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCanCancelUpdates: Boolean;
begin
  Result := optAllowCancelUpdates in Options;
  if Result then
    Result := Assigned(OnCancelUpdates);
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCanModify: Boolean;
begin
  Result := optAllowModify in Options;
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCount: Integer;
begin
  if Assigned(FDataObject) then
    Result := 1
  else
    Result := 0;
end;

function TInterfaceObjectBindSourceAdapter<T>.GetCurrent: TObject;
begin
  Result := nil;
  if Assigned(FDataObject) then
    Result := FDataObject as TObject;
end;

function TInterfaceObjectBindSourceAdapter<T>.GetObjectType: TRttiType;
begin
  Result := FBaseObjectRttiType;
end;

function TInterfaceObjectBindSourceAdapter<T>.InsertAt(AIndex: Integer): Integer;
begin
  Assert(False);
end;

procedure TInterfaceObjectBindSourceAdapter<T>.InternalApplyUpdates;
begin
  if Assigned(OnApplyUpdates) then
    OnApplyUpdates(Self);
end;

procedure TInterfaceObjectBindSourceAdapter<T>.InternalCancelUpdates;
begin
  if Assigned(OnCancelUpdates) then
    OnCancelUpdates(Self);
end;

procedure TInterfaceObjectBindSourceAdapter<T>.SetDataObject(ADataObject: T; AOwnsObject: Boolean);
begin
  // Force the  AOwnsObject to False because this is a BindSourceAdapter
  //  for an interfaced object (AutoRefCount)
  AOwnsObject := False;

  DoOnBeforeSetDataObject(ADataObject);
  Active := False;
  if FDataObject <> nil then
  begin
    ClearFields;
    if FOwnsObject then
      FreeAndNil(FDataObject);
  end;
  FOwnsObject := AOwnsObject;
  FDataObject := ADataObject;
  if FDataObject <> nil then
  begin
    AddFields;
  end;
  DoOnAfterSetDataObject;
end;

function TInterfaceObjectBindSourceAdapter<T>.SupportsNestedFields: Boolean;
begin
  Result := True;
end;

{ TObjectBindSourceAdapter }

constructor TInterfaceObjectBindSourceAdapter.Create(const AOwner: TComponent; const AObject: TObject; const ATypeAlias, ATypeName: String);
var
  AObjectInternal: IInterface;
begin
  // Init
  AObjectInternal := nil;
  // Note: if AObject = nil then assign the object as is (nil) else verify if the
  //  object supports IInterface
  if Assigned(AObject) and not Supports(AObject, IInterface, AObjectInternal) then
    raise EioException.Create(Self.ClassName + ': AObject does not supports IInterface.');
  // Call the inherited
  inherited Create(AOwner, AObjectInternal, ATypeAlias, ATypeName);
end;

procedure TInterfaceObjectBindSourceAdapter.SetDataObject(ADataObject: TObject; AOwnsObject: Boolean);
var
  AObjectInternal: IInterface;
begin
  // Init
  AObjectInternal := nil;
  // Note: if AObject = nil then assign the object as is (nil) else verify if the
  //  object supports IInterface
  if Assigned(ADataObject) and not Supports(ADataObject, IInterface, AObjectInternal) then
    raise EioException.Create(Self.ClassName + ': AObject does not supports IInterface.');
  // Call the inherited
  inherited SetDataObject(AObjectInternal, AOwnsObject);
end;

end.
