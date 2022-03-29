unit iORM.DT.ViewModel.Wizard;

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
  WinApi.Windows, iORM.DT.ViewModel.Wizard.Creator, System.SysUtils;

{ TioViewModelWizard }

constructor TioViewModelWizard.Create;
var
  LCategoryServices: IOTAGalleryCategoryManager;
  LCategoryRoot: IOTAGalleryCategory;
  LCategory: IOTAGalleryCategory;
begin
  inherited Create;

  LCategoryServices := (BorlandIDEServices as IOTAGalleryCategoryManager);
  Assert(Assigned(LCategoryServices), 'LCategoryServices is not assigned!!!');

  LCategoryRoot := LCategoryServices.FindCategory(sCategoryDelphiNew);
  Assert(Assigned(LCategoryRoot), 'LCategoryRoot is not assigned!!!');

  LCategory := LCategoryServices.AddCategory(LCategoryRoot, SIDString, SGalleryCategory);
  Assert(Assigned(LCategory), 'LCategory is not assigned!!!');

  Exit;



  if Supports(BorlandIDEServices, IOTAGalleryCategoryManager, LCategoryServices) then
  begin
    LCategoryServices.AddCategory(LCategoryServices.FindCategory(sCategoryRoot), SIDString, SGalleryCategory);
  end;
end;

function TioViewModelWizard.GetGalleryCategory: IOTAGalleryCategory;
var
  LCategory: IOTAGalleryCategory;
  LCatManager: IOTAGalleryCategoryManager;
begin
  LCatManager := (BorlandIDEServices as IOTAGalleryCategoryManager);
  Assert(Assigned(LCatManager));

  LCategory := LCatManager.FindCategory(SIDString);
  Assert(Assigned(LCategory));

  Result := LCategory;

  // OLD CODE: Result := (BorlandIDEServices as IOTAGalleryCategoryManager).FindCategory(SIDString);
end;

procedure TioViewModelWizard.Execute;
var
  LModuleServices: IOTAModuleServices;
  LProject: IOTAProject;
begin
  if Assigned(BorlandIDEServices) and Supports(BorlandIDEServices, IOTAModuleServices, LModuleServices) then
  begin
    // Check if there is an active project
    LProject := LModuleServices.GetActiveProject;
    if Assigned(LProject) then
    begin
      { Given the Creator, create a new module of the implied type }
      LModuleServices.CreateModule(TioViewModelWizardCreator.Create);
    end;
  end;
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
