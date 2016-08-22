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

unit iORM.Expert.CodeGen.NewProject;
// This is done to Warnings that I can't control, as Embarcadero has
// deprecated the functions, but due to design you are still required to
// to implement.
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  ToolsAPI;

type
   TIORMDMVCNewProject = class abstract(TNotifierObject,IOTACreator, IOTAProjectCreator,IOTAProjectCreator80)
   protected
    //IOTACreator
    function GetCreatorType: string; virtual;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAProjectCreator
    function GetFileName: string;
    function GetOptionFileName: string; deprecated;
    function GetShowSource: Boolean;
    procedure NewDefaultModule; deprecated;
    function NewOptionSource(const ProjectName: string): IOTAFile; deprecated;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile; virtual; abstract;  // MUST OVERRIDE!
    // IOTAProjectCreator80
    function GetProjectPersonality: string;virtual;
    procedure NewDefaultProjectModule(const Project: IOTAProject);
  private
    procedure SetFileName(const Value: String);
  protected
    FFileName : String;
  public
     property FileName : String read GetFileName write SetFileName;
  end;

  TIORMDMVCNewProjectEx = class(TIORMDMVCNewProject, IOTAProjectCreator160)
  private
   FPersonality: string;
  protected
    function GetProjectPersonality: string;override;

    // IOTAProjectCreator160
    function GetPlatforms: TArray<string>;
    function GetFrameworkType: string; virtual;
    function GetPreferredPlatform: string;
    procedure SetInitialOptions(const NewProject: IOTAProject);
  public
    property Personality : string read FPersonality write FPersonality;
  end;

implementation

uses
  System.SysUtils, PlatformAPI;


{ TNewProject }

function TIORMDMVCNewProject.GetCreatorType: string;
begin
  Result := sConsole; // May want to change this in the future, at least making method virtual
end;

function TIORMDMVCNewProject.GetExisting: Boolean;
begin
  Result := False;
end;

function TIORMDMVCNewProject.GetFileName: string;
begin
  Result := FFileName;
end;

function TIORMDMVCNewProject.GetFileSystem: string;
begin
  Result := '';
end;

function TIORMDMVCNewProject.GetOptionFileName: string;
begin
  Result := '';
end;

function TIORMDMVCNewProject.GetOwner: IOTAModule;
begin
  Result := (BorlandIDEServices as IOTAModuleServices).MainProjectGroup;
end;

function TIORMDMVCNewProject.GetProjectPersonality: string;
begin
  Result := sDelphiPersonality;
end;

function TIORMDMVCNewProject.GetShowSource: Boolean;
begin
  Result := False;
end;

function TIORMDMVCNewProject.GetUnnamed: Boolean;
begin
  Result := True;
end;

procedure TIORMDMVCNewProject.NewDefaultModule;
begin
end;

procedure TIORMDMVCNewProject.NewDefaultProjectModule(const Project: IOTAProject);
begin
end;

function TIORMDMVCNewProject.NewOptionSource(const ProjectName: string): IOTAFile;
begin
  Result := nil;
end;

procedure TIORMDMVCNewProject.NewProjectResource(const Project: IOTAProject);
begin
end;


procedure TIORMDMVCNewProject.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

function TIORMDMVCNewProjectEx.GetFrameworkType: string;
begin
  Result := '';
end;

function TIORMDMVCNewProjectEx.GetPlatforms: TArray<string>;
begin
  Result := TArray<string>.Create(cWin32Platform, cWin64Platform);
end;

function TIORMDMVCNewProjectEx.GetPreferredPlatform: string;
begin
  Result := '';
end;

function TIORMDMVCNewProjectEx.GetProjectPersonality: string;
begin
  Result := sDelphiPersonality
end;

procedure TIORMDMVCNewProjectEx.SetInitialOptions(const NewProject: IOTAProject);
var
  LBuildConf: IOTAProjectOptionsConfigurations;
begin
  if Supports(NewProject.ProjectOptions, IOTAProjectOptionsConfigurations, LBuildConf) then
  begin
    LBuildConf.BaseConfiguration.AsBoolean['UsingDelphiRTL'] := True;
  end;

end;

end.
