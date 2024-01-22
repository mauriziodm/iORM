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
    // This method return a name for this conflict strategy, by default it returns the type name of the class itself but you can override it
    //  and return a more readable name. It is used for logging purposes or similar.
    class function Name: String; virtual;
    // Check/detect (or prepare the "query") if there is a conflict persisting the DataObject contained into the context
    class procedure CheckDeleteConflict(const AContext: IioContext); virtual;
    class procedure CheckUpdateConflict(const AContext: IioContext); virtual;
    // If a conflict is detected then this method is called from the persistence strategy to try to resolve the conflict
    // Note: the conflict strategy MUST RESOLVE the conflict or raise an exception
    class procedure ResolveDeleteConflict(const AContext: IioContext); virtual;
    class procedure ResolveUpdateConflict(const AContext: IioContext); virtual;
  end;

  // Class reference for conflict strategies
  TioCustomConflictStrategyRef = class of TioCustomConflictStrategy;

  // NOTE: THESE ATTRIBUTES IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE
  // NOTE: THESE ATTRIBUTES IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE
  // NOTE: THESE ATTRIBUTES IS DECLARED HERE (not in iORM.Attributes unit) TO AVOID CIRCULAR REFERENCE

  // ioDeleteConflictStrategy attribute
  ioDeleteConflictStrategy = class(TCustomAttribute)
  strict private
    FStrategy: TioCustomConflictStrategyRef;
    FRaiseOnConflict: Boolean;
  public
    constructor Create(const AStrategy: TioCustomConflictStrategyRef; const ARaiseOnConflict: Boolean = False); overload;
    property RaiseOnConflict: Boolean read FRaiseOnConflict;
    property Strategy: TioCustomConflictStrategyRef read FStrategy;
  end;

  // ioUpdateConflictStrategy attribute
  ioUpdateConflictStrategy = type ioDeleteConflictStrategy;

implementation

uses
  iORM.Exceptions;

{ TioCustomConflictStrategy }

class procedure TioCustomConflictStrategy.CheckDeleteConflict(const AContext: IioContext);
begin
  // To be implemented on derived classes if necessary
end;

class procedure TioCustomConflictStrategy.CheckUpdateConflict(const AContext: IioContext);
begin
  // To be implemented on derived classes if necessary
end;

class function TioCustomConflictStrategy.Name: String;
begin
  Result := Self.Name;
end;

class procedure TioCustomConflictStrategy.ResolveDeleteConflict(const AContext: IioContext);
begin
  // Note: if you derive your own ConflictStrategy class and override this method then
  //        I suggest you to put the inherited at the bottom of the method
  if AContext.PersistenceConflictDetected and AContext.Map.GetTable.DeleteConflictStrategy_RaiseOnConflict then
    raise EioConcurrencyConflictException.Create(ClassName, 'ResolveDeleteConflict', AContext);
end;

class procedure TioCustomConflictStrategy.ResolveUpdateConflict(const AContext: IioContext);
begin
  // Note: if you derive your own ConflictStrategy class and override this method then
  //        I suggest you to put the inherited at the bottom of the method
  if AContext.PersistenceConflictDetected and AContext.Map.GetTable.UpdateConflictStrategy_RaiseOnConflict then
    raise EioConcurrencyConflictException.Create(ClassName, 'ResolveUpdateConflict', AContext);
end;

{ ioDeleteConflictStrategy }

constructor ioDeleteConflictStrategy.Create(const AStrategy: TioCustomConflictStrategyRef; const ARaiseOnConflict: Boolean);
begin
  FRaiseOnConflict := ARaiseOnConflict;
  FStrategy := AStrategy;
end;

end.
