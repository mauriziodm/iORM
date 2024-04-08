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
unit iORM.Http.Interfaces;

interface

const

  HTTP_METHOD_NAME_COUNT = 'Count';
  HTTP_METHOD_NAME_DELETE = 'Delete';
  HTTP_METHOD_NAME_DELETELIST = 'DeleteList';
  HTTP_METHOD_NAME_DELETEOBJECT = 'DeleteObject';
  HTTP_METHOD_NAME_LOADDATASET = 'LoadDataSet';
  HTTP_METHOD_NAME_LOADLIST = 'LoadList';
  HTTP_METHOD_NAME_LOADOBJECT = 'LoadObject';
  HTTP_METHOD_NAME_PERSISTLIST = 'PersistList';
  HTTP_METHOD_NAME_PERSISTOBJECT = 'PersistObject';
  HTTP_METHOD_NAME_SQLDESTEXECUTE = 'SQLDestExecute';
  HTTP_METHOD_NAME_SQLDESTLOADDATASET = 'SQLDestLoadDataSet';
  HTTP_METHOD_NAME_TEST = 'Test';

  // All the interfaces declared here are moved on iORM.DB.Interfacex to avoi
  //  a circular reference error (IioHttpRequestBody, IioHttpResponseBody)

implementation

end.
