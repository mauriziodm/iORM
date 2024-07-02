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
unit iORM.MVVM.ModelPresenter.Detail;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.Interfaces;

type

  TioModelPresenterDetail = class(TioModelPresenterCustom)
  public
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    property Active;
    property ItemCount;
  published
    // Published properties
    property AsDefault; // non mettere default
    property MasterBindSource; // published: Detail
    property MasterPropertyName; // published: Detail
    property AutoRefreshOnNotification default True; // published: Master+Detail
    // Published properties: selectors
    property SelectorFor;
    // Published Events: selectors
    property BeforeSelectionObject;
    property OnSelectionObject;
    property AfterSelectionObject;
    property BeforeSelectionInterface;
    property OnSelectionInterface;
    property AfterSelectionInterface;
    // Published properties: selectors
    property OnReceiveSelectionCloneObject;
    property OnReceiveSelectionFreeObject;
    // Events
    property AfterClose;
    property AfterOpen;
    property BeforeClose;
    property BeforeOpen;
  end;


implementation

{ TioModelPresenterDetail }

function TioModelPresenterDetail.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

function TioModelPresenterDetail.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

end.
