unit iORM.MVVM.ViewModel.Wizard;

interface

uses
  Classes, ToolsAPI;

  
resourcestring
  SName = 'iORM ViewModel Wizard';
  SComment = 'Create a new ViewModel in the project';
  SAuthor = 'Maurizio Del Magno';
  SGalleryCategory = 'iORM';
  SIDString = 'iORM.Wizards';

type

  TioViewModelWizard = class(TNotifierObject, IOTAWizard, IOTARepositoryWizard80)
  public
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
  WinApi.Windows;

// register with the IDE:
procedure Register;
begin
  RegisterPackageWizard(TioViewModelWizard.Create);
end;

{ TioViewModelWizard }

procedure TioViewModelWizard.Execute;
var
  LModuleServices: IOTAModuleServices;
  LUnitIdent, LClassName, LFileName: String;
begin
  if not Assigned(BorlandIDEServices) then
    Exit;
  LModuleServices := BorlandIDEServices as IOTAModuleServices;
  { Given the Prefix, create a new unique Module name and class name }
  LModuleServices.GetNewModuleAndClassName('ViewModel', LUnitIdent, LClassName, LFileName);



end;

function TioViewModelWizard.GetAuthor: string;
begin
  Result := SAuthor;
end;

function TioViewModelWizard.GetComment: string;
begin
  Result := SComment;
end;

function TioViewModelWizard.GetDesigner: string;
begin
  Result := dAny;
end;

function TioViewModelWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := (BorlandIDEServices as IOTAGalleryCategoryManager).FindCategory(SIDString);
end;

function TioViewModelWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(HInstance, 'iORM_ViewModel_Wizard_Icon');
end;

function TioViewModelWizard.GetIDString: string;
begin
  Result := SIDString + '.ViewModel';
end;

function TioViewModelWizard.GetName: string;
begin
  Result := SName;
end;

function TioViewModelWizard.GetPage: string;
begin
  Result := SGalleryCategory;
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
