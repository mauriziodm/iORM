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
unit iORM.SynchroStrategy.Interfaces;

interface

type

//  TioCustomSynchroLogItem

  // Base class for all synchro strategies
  TioCustomSynchroStrategy = class abstract
  public
    // This method return a name for this synchro strategy, by default it returns the type name of the class itself but you can override it
    //  and return a more readable name. It is used for logging purposes or similar.
    class function Name: String; virtual;
    // Synchro strategy methods to be override on descendant classes
    function Step1_Client_LoadEntitiesToSend: String; virtual; abstract;
    procedure Step2_Server_PersistReceivedEntities(const AReceived: String); virtual; abstract;
    function Step3_Server_LoadEntitiesToSendBack: String; virtual; abstract;
    procedure Step4_Client_PersistReceivedBackEntities(const AReceived: String); virtual; abstract;
  end;

  // Class reference for synchro strategies
  TioCustomSynchroStrategyRef = class of TioCustomSynchroStrategy;

implementation

{ TioCustomSynchroStrategy }

class function TioCustomSynchroStrategy.Name: String;
begin
  Result := Self.Name;
end;

end.
