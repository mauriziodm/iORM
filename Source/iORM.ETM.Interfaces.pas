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
unit iORM.ETM.Interfaces;

interface

uses
  System.JSON;

const
  ETM_LABEL_OLD_PROP_TYPE = '$etm_old_property_type';
  ETM_LABEL_NEW_PROP_TYPE = '$etm_new_property_type';

  ETM_LABEL_CLASS = '$etm_class';
  ETM_LABEL_OLD_CLASS = '$etm_old_instance_class';
  ETM_LABEL_NEW_CLASS = '$etm_new_instance_class';

  ETM_LABEL_ID = '$etm_id';

  ETM_OLD_VALUE = '$etm_old_value';
  ETM_NEW_VALUE = '$etm_new_value';
  ETM_ITEMS = '$etm_items';

  ETM_DIFF_STATUS = '$etm_status';
  ETM_DIFF_STATUS_ADDED = 'added';
  ETM_DIFF_STATUS_UPDATED = 'updated';
  ETM_DIFF_STATUS_REMOVED = 'removed';

type

  //Diff mode
  TioEtmDiffMode = (dmOneway, dmTwoway);

  // Class reference for diff
  TioEtmDiffRef = class of TioEtmCustomDiff;

  // Base class for ETM diff builder
  TioEtmCustomDiff = class abstract
  public
    class function Diff(const AOldObj, ANewObj: TObject; const AIncludeInfo: Boolean): TJSONObject; virtual; abstract;
  end;

implementation

end.
