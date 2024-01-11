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
unit iORM.DT.ViewModel.Wizard;

interface

uses
  Classes, ToolsAPI;

resourcestring
  SioGalleryCategoryName = 'iORM';  // the visible name of the category/page in the gallery in the File->New->Other form
  SioGalleryCategoryID = 'iORM.Wizard'; // the unique ID (not visible) of the category/page of the gallery in the File->New->Other form
  SioWizardID = 'iORM.Wizard.ViewModel'; // the unique ID of the wizard into the category/page of the gallery in File->New->Other->iORM
  SioWizardName = 'iORM ViewModel'; // the visible name of the wizard into the category/page of the gallery in the File->New->Other->iORM
  SioWizardComment = 'Create a new ViewModel in the project'; // the comment of the wizard into the category/page of the gallery in the File->New->Other->iORM
  SioWizardAuthor = 'Maurizio Del Magno'; // the author of the wizard into the category/page of the gallery in the File->New->Other->iORM
  SioAncestorClassName = 'TioViewModel'; // the name of the ancestor class

type

  TioViewModelWizard = class(TNotifierObject, IOTAWizard, IOTARepositoryWizard, IOTARepositoryWizard60, IOTARepositoryWizard80, IOTAFormWizard)
  public
    constructor Create;
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;
    // IOTARepositoryWizard80
    function GetGalleryCategory: IOTAGalleryCategory;
    function GetPersonality: string;
    function GetDesigner: string;
  end;

implementation

uses
  WinApi.Windows, iORM.DT.ViewModel.Wizard.Creator, System.SysUtils,
  iORM.DT.Wizard.Utils;

{ TioViewModelWizard }

constructor TioViewModelWizard.Create;
begin
  inherited Create;
  // Add the wizard gallery category
  TioOTAUtils.AddGalleryCategory(SioGalleryCategoryID, SioGalleryCategoryName);
end;

function TioViewModelWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  // Get the wizard gallery category
  Result := TioOTAUtils.GetGalleryCategory(SioGalleryCategoryID);
end;

procedure TioViewModelWizard.Execute;
begin
  // Given the Creator, create a new module of the implied type
  TioOTAUtils.CreateWizardModule(TioViewModelWizardCreator.Create(SioAncestorClassName));
end;

function TioViewModelWizard.GetAuthor: string;
begin
  Result := SioWizardAuthor;
end;

function TioViewModelWizard.GetComment: string;
begin
  Result := SioWizardComment;
end;

function TioViewModelWizard.GetDesigner: string;
begin
  Result := dAny;
end;

function TioViewModelWizard.GetGlyph: Cardinal;
begin
  Result := 0 // 0 = use standard icon;
end;

function TioViewModelWizard.GetIDString: string;
begin
  Result := SioWizardID;
end;

function TioViewModelWizard.GetName: string;
begin
  Result := SioWizardName;
end;

function TioViewModelWizard.GetPage: string;
begin
  Result := SioGalleryCategoryName;
end;

function TioViewModelWizard.GetPersonality: string;
begin
  Result := sDelphiPersonality;
end;

function TioViewModelWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

end.
