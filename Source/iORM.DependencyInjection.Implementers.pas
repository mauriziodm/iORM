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
unit iORM.DependencyInjection.Implementers;

interface

uses
  System.Rtti, iORM.CommonTypes, iORM.DependencyInjection.Types;

type

  // Dependency Injection Container Implementers Item (SubContainer value)
  TioDIContainerImplementersItemCreationMode = (cmByObjectForge, cmByFactoryMethod);
  TioDIContainerImplementersItem = class
  private
    FClazzRef: TioClassRef;
    FClazzName: String;
    FRttiType: TRttiInstanceType;
    FInterfaceGUID: TGUID;
    // Nome della classe antenata più lontana (più vicina a TObject possibile) che implementa la stessa interfaccia.
    // Questo serve a impostare correttamente la query select in modo che filtri correttamente in base anche
    //  ai vincoli di ereditarietà.
    FFarAncestorClazzSameInterfaceAndTableAndConnection: String;
    FIsEntity: Boolean;
    FIsSingleton: Boolean;
    // Constructor params
    FConstructorParams: TioConstructorParams;
    // Injections
    FFieldInjections: TioInjectionCollection;
    FPropertyInjections: TioInjectionCollection;
    // TValue che contiene l'eventuale factory method per la creazione dell'istanza
    FFactoryMethod: TValue;
    function GetCreationMode: TioDIContainerImplementersItemCreationMode;
    function GetConstructorParamsPointer: PioConstructorParams;
    function GetFactoryMethodPointer: PValue;
    function GetFieldInjectionsPointer: PioInjectionCollection;
    function GetPropertyInjectionsPointer: PioInjectionCollection;
  public
    constructor Create(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID);
    function CreateInstanceByFactoryMethodIfNotAlreadyDone(const AAlreadyCreatedInstance: TObject): TObject;
    procedure InjectPropField(const AObj: TObject);
    property ClazzRef: TioClassRef read FClazzRef;
    property ClazzName: String read FClazzName;
    property ConstructorParamsPointer: PioConstructorParams read GetConstructorParamsPointer;
    property CreationMode: TioDIContainerImplementersItemCreationMode read GetCreationMode;
    property FieldInjectionsPointer: PioInjectionCollection read GetFieldInjectionsPointer;
    property RttiType: TRttiInstanceType read FRttiType;
    property InterfaceGUID: TGUID read FInterfaceGUID;
    property FactoryMethodPointer: PValue read GetFactoryMethodPointer;
    property FarAncestorClazzSameInterfaceAndTableAndConnection: String read FFarAncestorClazzSameInterfaceAndTableAndConnection write FFarAncestorClazzSameInterfaceAndTableAndConnection;
    property IsEntity: Boolean read FIsEntity write FIsEntity;
    property IsSingleton: Boolean read FIsSingleton write FIsSingleton;
    property PropertyInjectionsPointer: PioInjectionCollection read GetPropertyInjectionsPointer;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions;

{ TioDIContainerImplementersItem }

constructor TioDIContainerImplementersItem.Create(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID);
begin
  FClazzRef := AClassRttiType.MetaclassType;
  FClazzName := AClassRttiType.MetaclassType.ClassName;
  FRttiType := AClassRttiType;
  FInterfaceGUID := AImplementsIID;
  FIsSingleton := False;
  FIsEntity := False;
  FFarAncestorClazzSameInterfaceAndTableAndConnection := String.Empty;
end;

function TioDIContainerImplementersItem.GetConstructorParamsPointer: PioConstructorParams;
begin
  Result := @FConstructorParams;
end;

function TioDIContainerImplementersItem.GetCreationMode: TioDIContainerImplementersItemCreationMode;
begin
  if FFactoryMethod.IsEmpty then
    Result := cmByObjectForge
  else
    Result := cmByFactoryMethod;
end;

function TioDIContainerImplementersItem.GetFactoryMethodPointer: PValue;
begin
  Result := @FFactoryMethod;
end;

function TioDIContainerImplementersItem.GetFieldInjectionsPointer: PioInjectionCollection;
begin
  Result := @FFieldInjections;
end;

function TioDIContainerImplementersItem.GetPropertyInjectionsPointer: PioInjectionCollection;
begin
  Result := @FPropertyInjections;
end;

procedure TioDIContainerImplementersItem.InjectPropField(const AObj: TObject);
var
  I: Integer;
  LRttiField: TRttiField;
  LRttiProperty: TRttiProperty;
begin
  // Inject fields
  for I := Low(FFieldInjections) to High(FFieldInjections) do
  begin
    LRttiField := FRttiType.GetField(FFieldInjections[I].Name);
    if Assigned(LRttiField) then
      LRttiField.SetValue(AObj, FFieldInjections[I].Value)
    else
      raise EioDependencyInjectionException.Create(ClassName, 'InjectPropField',
        Format('Field named "%s" not found on instance of "%s" class.', [LRttiField.Name, AObj.ClassName]));
  end;
  // Inject properties
  for I := Low(FPropertyInjections) to High(FPropertyInjections) do
  begin
    LRttiProperty := FRttiType.GetProperty(FPropertyInjections[I].Name);
    if Assigned(LRttiProperty) then
      LRttiProperty.SetValue(AObj, FPropertyInjections[I].Value)
    else
      raise EioDependencyInjectionException.Create(ClassName, 'InjectPropField',
        Format('Property named "%s" not found on instance of "%s" class.', [LRttiProperty.Name, AObj.ClassName]));
  end;
end;

function TioDIContainerImplementersItem.CreateInstanceByFactoryMethodIfNotAlreadyDone(const AAlreadyCreatedInstance: TObject): TObject;
begin
  // Se è stato impostato un FactoryMethod allora l'istanza viene creata alla chiamata del metodo
  //  "FactoryMethod<T1, T2, TX>" quindi prima della chiamata finale ai metodi Get/Show/ShowCurrent/ShowEach;
  //  in questo caso l'istanza viene parcheggiata nel campo privato "FAlreadyCreatedInstance" del locator
  //  e infine utilizzato dal metodo "_InternalGet", se però il FactoryMethod è senza parametri allora
  //  la creazione avviene alla chiamata sempre del metodo "_InternalGet" perchè non dovendo passare
  //  parametro non ci sarà nessuna chiamata al metodo "FactoryMethod" che senza parametri infatti
  //  non esiste perchè sarebbe inutile.
  if not Assigned(AAlreadyCreatedInstance) then
    Result := FFactoryMethod.Cast<TioFactoryMethod>.AsType<TioFactoryMethod>()()
  else
    Result := AAlreadyCreatedInstance;
end;

end.
