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
