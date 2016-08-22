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

unit iORM.Expert.ProjectWizardEx;

interface

uses
  ToolsApi,
  VCL.Graphics,
  PlatformAPI;

type
  TIORMDMVCNewProjectWizard = class
  private
    class function GetUnitName(aFilename: string): string;
  public
    class procedure RegisterIORMDMVCProjectWizard(const APersonality: string);
  end;

implementation

uses
  DccStrs,
  System.IOUtils,
  Vcl.Controls,
  Vcl.Forms,
  WinApi.Windows,
  System.SysUtils,
  iORM.Expert.Forms.NewProjectWizard,
  iORM.Expert.CodeGen.NewDMVCProject,
  iORM.Expert.CodeGen.NewWebModuleUnit,
  ExpertsRepository;

resourcestring
  sNewDMVCProjectCaption = 'iORM Server Project';
  sNewDMVCProjectHint = 'Create New iORM Server Project';

{ TDUnitXNewProjectWizard }

class function TIORMDMVCNewProjectWizard.GetUnitName(aFilename: string): string;
begin
  Result := TPath.GetFileNameWithoutExtension(aFilename);
end;

class procedure TIORMDMVCNewProjectWizard.RegisterIORMDMVCProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality,
                        sNewDMVCProjectHint, sNewDMVCProjectCaption, 'iORM.Wizard.NewProjectWizard',  // do not localize
                        'iORM', 'Maurizio Del Magno - https://github.com/mauriziodm/iORM', // do not localize
    procedure
    var
      WizardForm        : TfrmIORMDMVCNewProject;
      ModuleServices    : IOTAModuleServices;
      Project           : IOTAProject;
      Config            : IOTABuildConfiguration;
      ControllerUnit    : IOTAModule;
      WebModuleUnit     : IOTAModule;
      ControllerCreator : IOTACreator;
      WebModuleCreator  : IOTAModuleCreator;
    lProjectSourceCreator: IOTACreator;
    begin
      WizardForm := TfrmIORMDMVCNewProject.Create(Application);
      try
        if WizardForm.ShowModal = mrOk then
        begin
          if not WizardForm.AddToProjectGroup then
          begin
            (BorlandIDEServices as IOTAModuleServices).CloseAll;
          end;
          ModuleServices := (BorlandIDEServices as IOTAModuleServices);

          // Create Project Source
          lProjectSourceCreator := TIORMDMVCProjectFile.Create(APersonality);
          TIORMDMVCProjectFile(lProjectSourceCreator).DefaultPort := WizardForm.ServerPort;
          ModuleServices.CreateModule(lProjectSourceCreator);
          Project :=  GetActiveProject;

          Config := (Project.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
          Config.SetValue(sUnitSearchPath,'$(iORM)');
          Config.SetValue(sFramework, 'VCL');

          // Create Webmodule Unit
          WebModuleCreator := TIORMDMVCNewWebModuleUnitEx.Create(WizardForm.WebModuleClassName, APersonality);
          WebModuleUnit := ModuleServices.CreateModule(WebModuleCreator);
          if Project <> nil then
          begin
            Project.AddFile(WebModuleUnit.FileName, True);
          end;
        end;
      finally
        WizardForm.Free;
      end;
    end,
            function: Cardinal
            begin
              Result := LoadIcon(HInstance,'DMVCNewProjectIcon');
            end,
            TArray<string>.Create(cWin32Platform, cWin64Platform),
            nil));
end;

end.
