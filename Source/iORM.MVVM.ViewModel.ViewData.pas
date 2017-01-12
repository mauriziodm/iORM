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





unit iORM.MVVM.ViewModel.ViewData;

interface

uses
  iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource,
  iORM.Where.Interfaces, iORM.CommonTypes;

type

  TioViewData = class(TInterfacedObject, IioViewData)
  private
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    // Questo è un riferimento di tipo interfaccia e serve solo per
    //  mantenere in vita l'oggetto
    FDummyInterfaceRef: IInterface;
  protected
  public
    constructor Create; overload;
    constructor Create(const ADataObj:TObject; const AViewDataType:TioViewDataType); overload;
    constructor Create(const ADataIntf:IInterface; const AViewDataType:TioViewDataType); overload;
    constructor Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean=True); overload;
    constructor Create(const ABindSourceAdapter:IioActiveBindSourceAdapter); overload;
    constructor Create(const AMasterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''); overload;
    constructor Create(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String); overload;
    procedure SetDataObj(AObj:TObject); overload;
    procedure SetDataObj(AIntf:IInterface); overload;
    function DataObj: TObject;
    function BindSourceAdapter: TBindSourceAdapter;
    function ActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  end;

implementation

uses
  iORM.LiveBindings.ActiveListBindSourceAdapter, System.Generics.Collections,
  iORM.Context.Container,
  iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter,
  iORM.LiveBindings.ActiveObjectBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter, iORM,
  System.SysUtils, iORM.LiveBindings.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory;

{ TViewData }

function TioViewData.ActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := FBindSourceAdapter;
end;

function TioViewData.BindSourceAdapter: TBindSourceAdapter;
begin
  Result := FBindSourceAdapter as TBindSourceAdapter;
end;

constructor TioViewData.Create(const ADataIntf: IInterface; const AViewDataType:TioViewDataType);
begin
  Create(ADataIntf as TObject, AViewDataType);
  // Questo è un riferimento di tipo interfaccia e serve solo per
  //  mantenere in vita l'oggetto
  FDummyInterfaceRef := ADataIntf;
end;

constructor TioViewData.Create(const ADataObj: TObject; const AViewDataType:TioViewDataType);
begin
  // Create the BindSourceAdapter
  Self.Create(
    ADataObj.ClassName,  // TypeName
    '',  // TypeAlias
    nil,  // Where
    AViewDataType,  // ViewDataType
    False  // AutoLoadData
  );
  // Set the DataObject
  FBindSourceAdapter.SetDataObject(ADataObj, False);  // OwnsObject = False for externally received objects
end;

constructor TioViewData.Create(const ABindSourceAdapter: IioActiveBindSourceAdapter);
begin
  inherited Create;
  FBindSourceAdapter := ABindSourceAdapter;
end;

function TioViewData.DataObj: TObject;
begin
  Result := FBindSourceAdapter.DataObject;
end;

procedure TioViewData.SetDataObj(AObj: TObject);
begin
  FBindSourceAdapter.SetDataObject(Aobj);
end;

procedure TioViewData.SetDataObj(AIntf: IInterface);
begin
  FBindSourceAdapter.SetDataObject(AIntf as TObject);
end;

constructor TioViewData.Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean=True);
var
  LocalBSA: TBindSourceAdapter;
begin
  inherited Create;
  // Get the BindSourceAdapter
  case AViewDataType of
    // Single type BSA
    dtSingle:
      LocalBSA := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToActiveObjectBindSourceAdapter(nil, AAutoLoadData);
    // List type BSA
    dtList:
      LocalBSA := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToActiveListBindSourceAdapter(nil, AAutoLoadData);
  end;
  // Assign the BSA
  Supports(LocalBSA, IioActiveBindSourceAdapter, FBindSourceAdapter);
end;

constructor TioViewData.Create(const AMasterBindSource: TioMasterBindSource; const AMasterPropertyName: String);
var
  LocalBSA: TBindSourceAdapter;
begin
  inherited Create;
  // Get the BindSourceAdapter
  LocalBSA := TioLiveBindingsFactory.GetBSAfromMasterBindSource(nil, AMasterBindSource, AMasterPropertyName);
  // Assign the BSA
  Supports(LocalBSA, IioActiveBindSourceAdapter, FBindSourceAdapter);
end;

constructor TioViewData.Create;
begin
  FBindSourceAdapter := nil;
end;

constructor TioViewData.Create(const AMasterBindSourceAdapter: IioActiveBindSourceAdapter; const AMasterPropertyName: String);
var
  LocalBSA: TBindSourceAdapter;
begin
  inherited Create;
  // Get the BindSourceAdapter from the MasterBindSourceAdapter
  LocalBSA := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(nil, AMasterBindSourceAdapter, AMasterPropertyName);  // NB; Owner := nil
  // Assign the BSA
  Supports(LocalBSA, IioActiveBindSourceAdapter, FBindSourceAdapter);
end;

end.
