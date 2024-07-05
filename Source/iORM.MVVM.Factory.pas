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
unit iORM.MVVM.Factory;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Classes, iORM.MVVM.Interfaces;

type

  TioMVVMFactory = class
  public
    class function NewViewRegisterBase: IioViewRegisterBase; static;
    class function NewViewRegisterMVVM: IioViewRegisterMVVM; static;
    class function NewVMActionContainer(const AViewModel: IioViewModelInternal): IioVMActionContainer; static;
    class function NewLocalVCProviderRegister: IioLocalVCProviderRegister; static;
  end;

implementation

uses
  iORM.MVVM.ViewRegister, iORM.MVVM.VMActionContainer,
  iORM.MVVM.ViewContextProviderContainer;

{ TioMVVMFactory }

class function TioMVVMFactory.NewLocalVCProviderRegister: IioLocalVCProviderRegister;
begin
  Result := TioLocalVCProviderRegister.Create;
end;

class function TioMVVMFactory.NewViewRegisterBase: IioViewRegisterBase;
begin
  Result := TioViewRegisterBase.Create;
end;

class function TioMVVMFactory.NewViewRegisterMVVM: IioViewRegisterMVVM;
begin
  Result := TioViewRegisterMVVM.Create;
end;

class function TioMVVMFactory.NewVMActionContainer(const AViewModel: IioViewModelInternal): IioVMActionContainer;
begin
  Result := TioVMActionContainer.Create(AViewModel);
end;

end.


