unit iORM.DT.ViewModel.Wizard.Creator;

interface

uses
  ToolsAPI, iORM.DT.Wizard.Utils;

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

  TioViewModelPasFile = class(TioOTASourceFile)
  public
    function GetSource: string; override;
  end;

  TioViewModelDfmFile = class(TioOTASourceFile)
  public
    function GetSource: string; override;
  end;

implementation

uses
  System.SysUtils, System.IOUtils;

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
  Result := TPath.Combine(ActiveProjectDirectory, SImplFileName + '.pas');
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
  Result := ActiveProject;
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
  Result := TioViewModelDfmFile.Create('iORM_Wizard_ViewModel_DFM');
end;

function TioViewModelWizardCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TioViewModelPasFile.Create('iORM_Wizard_ViewModel_PAS');
end;

function TioViewModelWizardCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

{ TioViewModelPasFile }

function TioViewModelPasFile.GetSource: string;
begin
//  Result := inherited GetSource;
  // Enter any code here that applies changes

  // Template
  Result :=
    'unit ViewModel;' + sLineBreak +
    sLineBreak +
    'interface' + sLineBreak +
    sLineBreak +
    'uses' + sLineBreak +
    '  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase;' + sLineBreak +
    sLineBreak +
    'type' + sLineBreak +
    sLineBreak +
    'TioViewModel1 = class(TioViewModel)' + sLineBreak +
    'private' + sLineBreak +
    '  { Private declarations }' + sLineBreak +
    'public' + sLineBreak +
    '  { Public declarations }' + sLineBreak +
    'end;' + sLineBreak +
    sLineBreak +
    'implementation' + sLineBreak +
    sLineBreak +
    '{%CLASSGROUP ''System.Classes.TPersistent''}' + sLineBreak +
    sLineBreak +
    '{$R *.dfm}' + sLineBreak +
    sLineBreak +
    'end.';
end;

{ TioViewModelDfmFile }

function TioViewModelDfmFile.GetSource: string;
begin
//  Result := inherited GetSource;
  // Enter any code here that applies changes

  // Template
  Result :=
//    'inherited ioViewModel1: TioViewModel1' + sLineBreak +
    'inherited ioViewModel1: TioViewModel1' + sLineBreak +
    '  PixelsPerInch = 96' + sLineBreak +
    'end';
end;

end.
