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
unit iORM.Exceptions;

interface

uses
  System.SysUtils, iORM.Context.Interfaces,
  iORM.LiveBindings.BSPersistence;

type

  // Base class for all iORM exceptions ------------------------------------------------------------
  EioCustomException = class(Exception)
  public
    constructor Create(const AClassName, AMethodName, AMsg: string); overload;
    constructor Create(const AClassName, AMsg: string); overload;
  end;
  // -----------------------------------------------------------------------------------------------

  // Generic iORM exceptions -----------------------------------------------------------------------
  EioGenericException = class(EioCustomException)
  end;
  // -----------------------------------------------------------------------------------------------

  // Dependency Injection exceptions --------------------------------------------------------------------
  EioDependencyInjectionException = class(EioCustomException)
  end;
  // -----------------------------------------------------------------------------------------------

  // Persistence concurrency conflict exceptions ---------------------------------------------------
  EioConcurrencyConflictException = class(EioCustomException)
  public
    constructor Create(const AClassName, AMethodName: string; const AContext: IioContext); overload;
  end;

  EioDeleteConflictException = class(EioConcurrencyConflictException)
  end;

  EioUpdateConflictException = class(EioConcurrencyConflictException)
  end;

  EioInsertConflictException = class(EioConcurrencyConflictException)
  end;
  // -----------------------------------------------------------------------------------------------

  // BindSource ObjState exceptions ----------------------------------------------------------------
  EioBindSourceObjStateException = class(EioCustomException)
  end;
  // -----------------------------------------------------------------------------------------------

  // ETM exceptions --------------------------------------------------------------------------------
  EioEtmException = class(EioCustomException)
  end;
  // -----------------------------------------------------------------------------------------------

  // SynchroStrategy exceptions --------------------------------------------------------------------
  EioSynchroStrategyException = class(EioCustomException)
  end;
  // -----------------------------------------------------------------------------------------------

  // Http exceptions -------------------------------------------------------------------------------
  EioHttpLocalException = class(EioCustomException)
  end;

  EioHttpRemoteException = class(EioCustomException)
  public
    constructor Create(const AClassName, AMethodName, ARemoteExceptionClassName, ARemoteExceptionMessage: string); overload;
  end;
  // -----------------------------------------------------------------------------------------------

  // Auth exceptions -------------------------------------------------------------------------------
  EioAuthException = class(Exception)
  end;

  EioAuthInvalidCredentialsException_401 = class(EioAuthException)
  end;

  EioAuthInactiveUserException_401 = class(EioAuthException)
  end;

  EioAuthUserExpiredException_401 = class(EioAuthException)
  end;

  EioAuthForbiddenException_403 = class(EioAuthException)
  end;

  EioTokenSignatureException_401 = class(EioAuthException)
  end;

  EioTokenAudienceException_401 = class(EioAuthException)
  end;

  EioTokenTypeException_401 = class(EioAuthException)
  end;

  EioTokenIssuerException_401 = class(EioAuthException)
  end;

  EioTokenExpirationException_401 = class(EioAuthException)
  end;

  EioTokenNotYetValidException_401 = class(EioAuthException)
  end;

  EioAuthUserOnlyAuthorizationTokenExpected_401 = class(EioAuthException)
  end;

  EioAuthInvalidAuthorizationToken_401 = class(EioAuthException)
  end;

  EioAuthInvalidRefreshToken_401 = class(EioAuthException)
  end;

  EioAuthServerComponentNotFound_501 = class(EioAuthException)
  end;
  // -----------------------------------------------------------------------------------------------

implementation

{ EioException }

constructor EioCustomException.Create(const AClassName, AMethodName, AMsg: string);
begin
  inherited Create(Format(#13#13'iORM exception on "%s.%s" method:'#13#13'%s', [AClassName, AMethodName, AMsg]));
end;

constructor EioCustomException.Create(const AClassName, AMsg: string);
begin
  inherited Create(Format(#13#13'iORM exception on "%s" class:'#13#13'%s', [AClassName, AMsg]));
end;

{ EioConcurrencyConflictException }

constructor EioConcurrencyConflictException.Create(const AClassName, AMethodName: string; const AContext: IioContext);
var
  LMsg: String;
begin
  if AContext.GetProperties.ObjVersionPropertyExist then
    LMsg := Format('Concurrency conflict persisting a "%s" entity with ID = %d, ObjVersion = %d on table "%s" using "%s" connection.',
      [AContext.GetClassRef.ClassName, AContext.ObjID, Abs(AContext.ObjVersion), AContext.GetTable.TableName, AContext.GetTable.GetConnectionDefName])
  else
    LMsg := Format('Concurrency conflict persisting a "%s" entity with ID = %d on table "%s" using "%s" connection.',
      [AContext.GetClassRef.ClassName, AContext.ObjID, AContext.GetTable.TableName, AContext.GetTable.GetConnectionDefName]);
  inherited Create(AClassName, AMethodName, LMsg);
end;

{ EioHttpRemoteException }

constructor EioHttpRemoteException.Create(const AClassName, AMethodName, ARemoteExceptionClassName, ARemoteExceptionMessage: string);
begin
  inherited Create(Format(#13#13'iORM local exception on "%s.%s" method'#13'RELAYING remote "%s" exception:'#13'%s',
    [AClassName, AMethodName, ARemoteExceptionClassName, ARemoteExceptionMessage]));
end;

end.
