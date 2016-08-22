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

unit iORM.DMVC.Expert.Forms.NewProjectWizard;

interface

uses
  WinAPI.Windows,
  WinAPI.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  VCL.Graphics,
  VCL.Controls,
  VCL.Forms,
  VCL.Dialogs,
  VCL.StdCtrls;

type
  TfrmDMVCNewProject = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    chkAddToProjectGroup: TCheckBox;
    edtWebModuleName: TEdit;
    lblWbModule: TLabel;
    edtServerPort: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetAddToProjectGroup: boolean;
    function GetWebModuleClassName: string;
    function GetServerPort: Integer;
  public
    { Public declarations }
    // Read Only Properties to extract values without having to know control values.
    property AddToProjectGroup: boolean read GetAddToProjectGroup;
    property WebModuleClassName: string read GetWebModuleClassName;
    property ServerPort: Integer read GetServerPort;
  end;

var
  frmDMVCNewProject: TfrmDMVCNewProject;

implementation

uses
  iORM.DMVC.Expert.CodeGen.Templates;

{$R *.dfm}

procedure TfrmDMVCNewProject.FormCreate(Sender: TObject);
begin
  edtWebModuleName.TextHint := sDefaultWebModuleName;
  edtServerPort.TextHint := sDefaultServerPort;
end;

function TfrmDMVCNewProject.GetAddToProjectGroup: boolean;
begin
  Result := chkAddToProjectGroup.Checked;
end;

function TfrmDMVCNewProject.GetServerPort: Integer;
var
  lServerPort: Integer;
begin
  Result := StrToInt(sDefaultServerPort);
  if (Trim(edtServerPort.Text) <> '') and TryStrToInt(edtServerPort.Text,
    lServerPort) then
  begin
    if (lServerPort > 0) and (lServerPort < 65535) then
      Result := lServerPort;
  end;
end;

function TfrmDMVCNewProject.GetWebModuleClassName: string;
begin
  if Trim(edtWebModuleName.Text) = '' then
  begin
    Result := sDefaultWebModuleName
  end
  else
  begin
    Result := Trim(edtWebModuleName.Text);
  end;
end;

end.
