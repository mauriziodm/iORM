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
unit iORM.DependencyInjection.Interfaces;

interface

uses
  iORM.DependencyInjection.Implementers, System.Rtti, iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces, iORM.CommonTypes, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.ModelPresenter.Custom, iORM.Where.Interfaces, System.Classes, System.SysUtils,
  iORM.StdActions.Interfaces;

type

  IioDependencyInjectionLocator = interface;

  TioDILocatorDestination = class
  strict private
    FLocator: IioDependencyInjectionLocator;   // TObject to avoid circular receference
  public
    constructor Create(const ALocator:IioDependencyInjectionLocator);
    function OfType<TRESULT>: TRESULT;
  end;

  TioConstructorParams = array of TValue;
  PioConstructorParams = ^TioConstructorParams;
  IioDependencyInjectionLocator = interface
    ['{51289FD7-AA55-43D9-BF5B-EDA5BF27D301}']
    function Exist: Boolean;
    function Get: TObject;
    function GetAsGeneric: TioDILocatorDestination;
    function Show: TComponent;
    function GetItem: TioDIContainerImplementersItem;
    function Alias(const AAlias:String): IioDependencyInjectionLocator;
    function ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    function ShowCurrent: TComponent;
    procedure ShowEach;
    procedure _SetForEachModelPresenter(const AModelPresenter:IioNotifiableBindSource; const ALocateViewModel:Boolean);
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator;
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const AName:String; const ADataObject:TObject): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName:String; const AInterfacedObj:IInterface): IioDependencyInjectionLocator; overload;
//    function SetBindSource(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName:String; const AMasterBindSource:IioNotifiableBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName:String; const AWhere:IioWhere): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName:String; const AOrderBy:String): IioDependencyInjectionLocator; overload;
    function SetBindSourceAsSelectorFor(const ASourceBSName:String; const ASelectionDest:IioNotifiableBindSource): IioDependencyInjectionLocator; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject:TObject): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AInterfacedObj:IInterface): IioDependencyInjectionLocator; overload;
//    function SetBindSource(const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AMasterBindSource:IioNotifiableBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AWhere:IioWhere): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AOrderBy:String): IioDependencyInjectionLocator; overload;
    function SetBindSourceAsSelectorFor(const ASelectionDest:IioNotifiableBindSource): IioDependencyInjectionLocator; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider:TioViewContextProvider): IioDependencyInjectionLocator;
    function SetViewContext(const AViewContext:TComponent; const AViewContextFreeMethod:TProc=nil): IioDependencyInjectionLocator;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): IioDependencyInjectionLocator;
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
  end;

  IioDependencyInjectionLocator<TI> = interface(IioDependencyInjectionLocator)
    ['{EA9F3CAD-B9A2-4607-8D80-881EF4C36EDE}']
    function Get: TI; overload;
    function Alias(const AAlias:String): IioDependencyInjectionLocator<TI>;
    function ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator<TI>;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>;
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel:IioViewModel; const AMarker:String=''): IioDependencyInjectionLocator<TI>;
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const AName:String; const ADataObject:TObject): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName:String; const AInterfacedObj:IInterface): IioDependencyInjectionLocator<TI>; overload;
//    function SetBindSource(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName:String; const AMasterPresenter:IioNotifiableBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName:String; const AWhere:IioWhere): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName:String; const AOrderBy:String): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASourcePresenterName:String; const ASelectionDest:IioNotifiableBindSource): IioDependencyInjectionLocator<TI>; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject:TObject): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AInterfacedObj:IInterface): IioDependencyInjectionLocator<TI>; overload;
//    function SetBindSource(const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AMasterPresenter:IioNotifiableBindSource; const AMasterPropertyName:String=''): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AWhere:IioWhere): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AOrderBy:String): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectionDest:IioNotifiableBindSource): IioDependencyInjectionLocator<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider:TioViewContextProvider): IioDependencyInjectionLocator<TI>;
    function SetViewContext(const AViewContext:TComponent; const AViewContextFreeMethod:TProc=nil): IioDependencyInjectionLocator<TI>;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): IioDependencyInjectionLocator<TI>;
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
  end;

implementation

uses
  iORM.Utilities;

{ TioDILocatorDestination }

constructor TioDILocatorDestination.Create(const ALocator: IioDependencyInjectionLocator);
begin
  inherited Create;
  FLocator := ALocator;
end;

function TioDILocatorDestination.OfType<TRESULT>: TRESULT;
var
  LObj: TObject;
begin
  try
    // Get the rest as TObject
    LObj := FLocator.Get;
    // Cast the obtained object to the desired type
    Result := TioUtilities.CastObjectToGeneric<TRESULT>(LObj);
  finally
    Self.Free;
  end;
end;

end.
