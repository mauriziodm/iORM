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
unit iORM.SynchroStrategy.EtmBased;

interface

uses
  iORM.SynchroStrategy.Custom, iORM.Context.Interfaces, iORM.Attributes,
  iORM.SynchroStrategy.Interfaces;

type

  [ioEntity('SYNCHRO_LOG')]
  TioEtmBasetSynchroStrategy_LogItem = class(TioCustomSynchroStrategy_LogItem)
  strict private
    FTimeSlotID_First: Integer;
    FTimeSlotID_Last: Integer;
  public
    constructor Create; override;
    property TimeSlotID_First: Integer read FTimeSlotID_First write FTimeSlotID_First;
    property TimeSlotID_Last: Integer read FTimeSlotID_Last write FTimeSlotID_Last;
  end;

  TioEtmBasedSynchroStrategy_Payload = class(TioCustomSynchroStrategy_Payload)
  strict protected
    // SynchroLogItem
    procedure _DoLastSynchroLogItem_LoadFromClient; override;
  public
  end;

implementation

uses
  iORM.CommonTypes, iORM;

{ TioEtmBasetSynchroStrategy_LogItem }

constructor TioEtmBasetSynchroStrategy_LogItem.Create;
begin
  inherited;
  FTimeSlotID_First := IO_INTEGER_NULL_VALUE;
  FTimeSlotID_Last := IO_INTEGER_NULL_VALUE;
end;

{ TioEtmBasedSynchroStrategy_Payload }

procedure TioEtmBasedSynchroStrategy_Payload._DoLastSynchroLogItem_LoadFromClient;
var
  LWhere: IioWhere;
begin
  // inherited; // Do not inherit here
  // Load last SynchroLogItem from the local client connection
  LWhere := io.Where('ID = SELECT MAX(SUB.ID) FROM [TioCustomSynchroStrategy_LogItem] SUB WHERE SUB.SYNCHRONAME = SYNCHRONAME');
  SynchroLogItem_Last := io.LoadObject<TioCustomSynchroStrategy_LogItem>(LWhere);
end;

end.
