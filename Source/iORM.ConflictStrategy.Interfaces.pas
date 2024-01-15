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
unit iORM.ConflictStrategy.Interfaces;

interface

uses
  iORM.Context.Interfaces;

type

  // Base class for all ConflictStrategies
  TioCustomConflictStrategy = class abstract
  public
    // Check/detect (or prepare the "query") if there is a conflict persisting the DataObject contained into the context
    class procedure CheckDeleteConflict(const AContext: IioContext); virtual; abstract;
    class procedure CheckUpdateConflict(const AContext: IioContext); virtual; abstract;
    // If a conflict is detected then this method is called from the persistence strategy to try to resolve the conflict
    // Note: the conflict strategy MUST RESOLVE the conflict or raise an exception
    class procedure ResolveDeleteConflict(const AContext: IioContext); virtual; abstract;
    class procedure ResolveUpdateConflict(const AContext: IioContext); virtual; abstract;
  end;

  // Class reference for conflict strategies
  TioCustomConflictStrategyRef = class of TioCustomConflictStrategy;

  // NOTE: THIS ATTRIBUTE IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE
  // NOTE: THIS ATTRIBUTE IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE
  // NOTE: THIS ATTRIBUTE IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE
  // Base String attribute
  ioConflictStrategy = class(TCustomAttribute)
  strict private
    FDeleteStrategy: TioCustomConflictStrategyRef;
    FUpdateStrategy: TioCustomConflictStrategyRef;
  public
    constructor Create(const AUpdateAndDeleteStrategy: TioCustomConflictStrategyRef); overload;
    constructor Create(const AUpdateStrategy, ADeleteStrategy: TioCustomConflictStrategyRef); overload;
    property DeleteStrategy: TioCustomConflictStrategyRef read FDeleteStrategy;
    property UpdateStrategy: TioCustomConflictStrategyRef read FUpdateStrategy;
  end;

implementation

{ ioConflictStrategy }

constructor ioConflictStrategy.Create(const AUpdateStrategy, ADeleteStrategy: TioCustomConflictStrategyRef);
begin
  FDeleteStrategy := ADeleteStrategy;
  FUpdateStrategy := AUpdateStrategy;
end;

constructor ioConflictStrategy.Create(const AUpdateAndDeleteStrategy: TioCustomConflictStrategyRef);
begin
  FDeleteStrategy := AUpdateAndDeleteStrategy;
  FUpdateStrategy := AUpdateAndDeleteStrategy;
end;

end.
