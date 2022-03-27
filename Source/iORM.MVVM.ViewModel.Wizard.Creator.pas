unit iORM.MVVM.ViewModel.Wizard.Creator;

interface

uses
  ToolsAPI;

resourcestring
  SImplFileName = 'ViewModel';

type

  TioViewModelWizardCreator = class(TNotifierObject, IOTACreator, IOTAModuleCreator)
  public
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

implementation

uses
  System.SysUtils;

{ TioViewModelWizardCreator }

procedure TioViewModelWizardCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function TioViewModelWizardCreator.GetAncestorName: string;
begin
  Result := 'TioViewModel';
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
  Result := SImplFileName;
end;

function TioViewModelWizardCreator.GetImplFileName: string;
begin
  Result := GetCurrentDir + '\' + SImplFileName + '.pas';
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
//  Result := ActiveProject;
end;

function TioViewModelWizardCreator.GetShowForm: Boolean;
begin
  Result := False;
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

end;

function TioViewModelWizardCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin

end;

function TioViewModelWizardCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin

end;

end.
