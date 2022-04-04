unit iORM.DT.ViewModel.Wizard.Creator;

interface

uses
  ToolsAPI;

resourcestring
  SImplFileName = 'ioViewModel1';

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

  TioViewModelPasFile = class(TInterfacedObject, IOTAFile)
  public
    function GetAge: TDateTime;
    function GetSource: string;
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
  Result := 'ioViewModel';
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
  Result := 'ioViewModel1';
//  Result := SImplFileName;
end;

function TioViewModelWizardCreator.GetImplFileName: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(GetActiveProject.FileName), 'Unit2.pas');
//  Result := TPath.Combine(ActiveProjectDirectory, SImplFileName + '.pas');
//  Result := SImplFileName;
//  Result := '';
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
  Result := TioViewModelPasFile.Create;
end;

function TioViewModelWizardCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

{ TioViewModelPasFile }

function TioViewModelPasFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TioViewModelPasFile.GetSource: string;
begin
  // Template
  Result :=
    'unit Unit2;' + sLineBreak +
    sLineBreak +
    'interface' + sLineBreak +
    sLineBreak +
    'uses' + sLineBreak +
    '  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase;' + sLineBreak +
    sLineBreak +
    'type' + sLineBreak +
    sLineBreak +
    '  TioViewModel1 = class(TioViewModel)' + sLineBreak +
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
end;

end.
