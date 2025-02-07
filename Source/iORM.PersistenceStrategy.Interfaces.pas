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
unit iORM.PersistenceStrategy.Interfaces;

interface

const

  // persistence strategy request json properties constants
  PSR_METHOD = 'Method';
  PSR_SESSION_APP = 'App';
  PSR_SESSION_APPOID = 'AppID';
  PSR_SESSION_CONNECTION = 'Conn';
  PSR_SESSION_CONNECTIONREMOTE = 'ConnRem';
  PSR_SESSION_USER = 'Usr';
  PSR_SESSION_USEROID = 'UsrID';
  PSR_AUTH_GRANT = 'AuthGrant';
  PSR_AUTH_INTENTION = 'AuthIntent';
  PSR_AUTH_SCOPE = 'AuthScope';
  PSR_AUTH_TOKEN = 'AuthToken';
  PSR_INSTANCES_INTF1 = 'Intf1';
  PSR_INSTANCES_INTF2 = 'Intf2';
  PSR_INSTANCES_OBJ1 = 'Obj1';
  PSR_INSTANCES_OBJ2 = 'Obj2';
  PSR_BLINDLEVEL = 'BlindLevel';
  PSR_INTENTTYPE = 'Intent';
  PSR_MASTERPROPERTYNAME = 'MasterProp';
  PSR_MASTERPROPERTYPATH = 'MasterPropPath';
  PSR_PROPERTYNAME = 'PropName';
  PSR_RELATIONID = 'RelPropID';
  PSR_RELATIONPROPERTYNAME = 'RelPropName';

type

  // ***************************************************************************
  // * NB: Interfaces declared here are moved into iORM.DB.Interfaces to avoid *
  // *      circular unit reference error                                      *
  // ***************************************************************************

  TioPersistenceStrategyMethod = (
    psmAuthApp,
    psmAuthUser,
    psmAuthNewAccessToken,
    psmAuthRefreshAccessToken,
    psmCount,
    psmDelete,
    psmDeleteList,
    psmDeleteObject,
    psmDoSynchronization,
    psmLoadDataSet,
    psmLoadList,
    psmLoadObject,
    psmMax,
    psmMin,
    psmPersistList,
    psmPersistObject,
    psmSQLDestExecute,
    psmSQLDestLoadDataSet,
    psmTest
  );

implementation

end.
