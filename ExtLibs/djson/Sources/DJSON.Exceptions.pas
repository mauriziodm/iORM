{
  ****************************************************************************
  *                                                                          *
  *           DJSON - (Delphi JSON library)                                  *
  *                                                                          *
  *           Copyright (C) 2016-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/DSON.git                         *
  *                                                                          *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of DJSON (Delphi JSON library).                        *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  * you may not use this file except in compliance with the License.         *
  *                                                                          *
  * DJSON is free software: you can redistribute it and/or modify            *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * DJSON is distributed in the hope that it will be useful,                 *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           *
  *                                                                          *
  ****************************************************************************
}
unit DJSON.Exceptions;

interface

uses
  System.SysUtils;

type

  // Generic DJSON exception
  EdjException = class(Exception)
  end;

  // Engine exception
  EdjEngineError = class(EdjException)
  end;

  // DuckTyping exception
  EdsonDuckException = class(EdjException)
  end;

implementation

end.
