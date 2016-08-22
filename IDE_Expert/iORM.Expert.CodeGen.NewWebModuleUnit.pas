{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{***************************************************************************}
{                                                                           }
{                      Delphi MVC Framework                                 }
{                                                                           }
{     Copyright (c) 2010-2015 Daniele Teti and the DMVCFramework Team       }
{                                                                           }
{           https://github.com/danieleteti/delphimvcframework               }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{  This IDE expert is based off of the one included with the DUnitX         }
{  project.  Original source by Robert Love.  Adapted by Nick Hodges.       }
{                                                                           }
{  The DUnitX project is run by Vincent Parrett and can be found at:        }
{                                                                           }
{            https://github.com/VSoftTechnologies/DUnitX                    }
{***************************************************************************}

unit iORM.Expert.CodeGen.NewWebModuleUnit;

interface

uses
  ToolsApi,
  iORM.Expert.CodeGen.NewUnit;

type
  TIORMDMVCNewWebModuleUnitEx = class(TIORMDMVCNewUnit)
  private
    FUnitIdent, FFormName, FFileName : String;
  protected
    FWebModuleClassName : string;
    function GetCreatorType: string; override;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile; override;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; override;
  public
    constructor Create(const aWebModuleClassName: string; const APersonality : String = '' );
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  VCL.Dialogs,
  iORM.Expert.CodeGen.Templates,
  iORM.Expert.CodeGen.SourceFile;

constructor TIORMDMVCNewWebModuleUnitEx.Create(const aWebModuleClassName : string; const APersonality : String = '' );
begin
  Assert(Length(aWebModuleClassName) > 0);
  FAncestorName := '';
  FFormName := '';
  FImplFileName := '';
  FIntfFileName := '';
  FWebModuleClassName := aWebModuleClassName;
  Personality := APersonality;
  (BorlandIDEServices as IOTAModuleServices).GetNewModuleAndClassName( '', FUnitIdent, FFormName, FFileName);
end;

function TIORMDMVCNewWebModuleUnitEx.GetCreatorType: string;
begin
  Result := sForm;
end;

function TIORMDMVCNewWebModuleUnitEx.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TIORMDMVCSourceFile.Create(sIORMDMVCWebModuleDFM, [FormIdent, FWebModuleClassName]);
end;

function TIORMDMVCNewWebModuleUnitEx.NewImplSource(const ModuleIdent, FormIdent,  AncestorIdent: string): IOTAFile;
begin
  //ModuleIdent is blank for some reason.
  // http://stackoverflow.com/questions/4196412/how-do-you-retrieve-a-new-unit-name-from-delphis-open-tools-api
  // So using method mentioned by Marco Cantu.
  Result := TIORMDMVCSourceFile.Create(sIORMDMVCWebModuleUnit, [FUnitIdent, FWebModuleClassName]);
end;



end.
