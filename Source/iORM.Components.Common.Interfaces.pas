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
unit iORM.Components.Common.Interfaces;

interface

uses
  iORM.MVVM.ViewModelBridge, iORM.LiveBindings.Interfaces, iORM.MVVM.ModelPresenter.Custom;

type

  IioVMBridgeClientComponent = interface
    ['{A9A526A3-D6D1-4E9D-B7D6-E2E7AB117325}']
    procedure Open;
    procedure Close;
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge:TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
    property ViewModelBridge:TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
  end;

  IioCrossViewMasterSource = interface
    ['{5A2614C8-088E-4642-A2C0-A671EE62B517}']
    function GetModelPresenterInstance: TioModelPresenterCustom;
    // InternalActiveAdapter
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  end;

implementation

end.

