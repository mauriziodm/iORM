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



unit iORM.MVVM.ViewModel.ViewData;

interface

uses
  iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource,
  iORM.Where.Interfaces;

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
{
  // Create the BindSourceAdapter
  Self.Create(
    (ADataIntf as TObject).ClassName,  // TypeName
    '',  // TypeAlias
    '',  // Where
    AViewDataType,  // ViewDataType
    False  // AutoLoadData
  );
  // Set the DataObject
  FBindSourceAdapter.SetDataObject(ADataIntf as TObject, False);  // OwnsObject = False for externally received objects
}
end;

constructor TioViewData.Create(const ADataObj: TObject; const AViewDataType:TioViewDataType);
var
  LRealClassName : String;
  LDuckList : IioDuckTypedList;
begin
  lRealClassName := ADataObj.ClassName;
  if AViewDataType = TioViewDataType.dtList then begin
    lDuckList := TioDuckTypedFactory.DuckTypedList(ADataObj);
    lRealClassName := lDuckList.GetGenericTypeName;
  end;
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
  Result := FBindSourceAdapter.GetDataObject;
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
