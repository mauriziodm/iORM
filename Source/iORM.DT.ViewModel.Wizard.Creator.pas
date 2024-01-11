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
unit iORM.DT.ViewModel.Wizard.Creator;

interface

uses
  ToolsAPI;

resourcestring
  SImplFileName = 'ioViewModel1';

type

  TioViewModelWizardCreator = class(TNotifierObject, IOTACreator, IOTAModuleCreator)
  private
    FAncestorName: String;
    FUnitName: String;
    FClassName: String;
    FFileName: String;
  public
    constructor Create(AAncestorName: String);
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAModuleCreator
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

  TioViewModelPasFile = class(TInterfacedObject, IOTAFile)
  private
    FAncestorName: String;
    FUnitName: String;
    FClassName: String;
  public
    constructor Create(const AUnitName, AAncestorName, AClassName: String);
    function GetAge: TDateTime;
    function GetSource: string;
  end;

implementation

uses
  System.SysUtils, System.IOUtils, iORM.DT.Wizard.Utils;

{ TioViewModelWizardCreator }

constructor TioViewModelWizardCreator.Create(AAncestorName: String);
begin
  FAncestorName := AAncestorName;
  TioOTAUtils.GetNewUnitAndClassName('', AAncestorName, FUnitName, FClassName, FFileName);
end;

procedure TioViewModelWizardCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function TioViewModelWizardCreator.GetAncestorName: string;
begin
  // If the name starts with "T" character (class) then skip the first char
  if FAncestorName.StartsWith('T') then
    Result := Copy(FAncestorName, 2, Length(FAncestorName))
  else
    Result := FAncestorName;
end;

function TioViewModelWizardCreator.GetCreatorType: string;
begin
  Result := sForm;
end;

function TioViewModelWizardCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TioViewModelWizardCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TioViewModelWizardCreator.GetFormName: string;
begin
  // If the name starts with "T" character (class) then skip the first char
  if FClassName.StartsWith('T') then
    Result := Copy(FClassName, 2, Length(FClassName))
  else
    Result := FClassName;
end;

function TioViewModelWizardCreator.GetImplFileName: string;
begin
  // Should return the name of the implementation file (*.pas).
  // This must be fully qualified (ex: "drive:\path\filename.pas").
  // You can leave this blank to have the IDE create a new unique one for you.
  Result := FFileName;
end;

function TioViewModelWizardCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TioViewModelWizardCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TioViewModelWizardCreator.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function TioViewModelWizardCreator.GetShowForm: Boolean;
begin
  Result := True;
end;

function TioViewModelWizardCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TioViewModelWizardCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

function TioViewModelWizardCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TioViewModelWizardCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TioViewModelPasFile.Create(FUnitName, FAncestorName, FClassName);
end;

function TioViewModelWizardCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

{ TioViewModelPasFile }

constructor TioViewModelPasFile.Create(const AUnitName, AAncestorName, AClassName: String);
begin
  inherited Create;
  FUnitName := AUnitName;
  FClassName := AClassName;
  FAncestorName := AAncestorName;
end;

function TioViewModelPasFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TioViewModelPasFile.GetSource: string;
begin
  // Template
  Result :=
    'unit $UNITNAME$;' + sLineBreak +
    sLineBreak +
    'interface' + sLineBreak +
    sLineBreak +
    'uses' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  System.Classes,' + sLineBreak +
    '  iORM,' + sLineBreak +
    '  iORM.Attributes,' + sLineBreak +
    '  iORM.CommonTypes,' + sLineBreak +
    '  iORM.Where.Interfaces,' + sLineBreak +
    '  iORM.MVVM.Interfaces,' + sLineBreak +
    '  iORM.MVVM.ViewModel;' + sLineBreak +
    sLineBreak +
    'type' + sLineBreak +
    sLineBreak +
    '  $CLASSNAME$ = class($ANCESTORNAME$)' + sLineBreak +
    '  private' + sLineBreak +
    '    { Private declarations }' + sLineBreak +
    '  public' + sLineBreak +
    '    { Public declarations }' + sLineBreak +
    '  end;' + sLineBreak +
    sLineBreak +
    'implementation' + sLineBreak +
    sLineBreak +
    '{%CLASSGROUP ''System.Classes.TPersistent''}' + sLineBreak +
    sLineBreak +
    '{$R *.dfm}' + sLineBreak +
    sLineBreak +
    'end.';
  // Replace tags with real data
  Result := StringReplace(Result, '$UNITNAME$', FUnitName, [rfIgnoreCase, rfReplaceAll]);
  Result := StringReplace(Result, '$CLASSNAME$', FClassName, [rfIgnoreCase, rfReplaceAll]);
  Result := StringReplace(Result, '$ANCESTORNAME$', FAncestorName, [rfIgnoreCase, rfReplaceAll]);
end;

end.
