unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Clipbrd,
  iORM, FireDAC.Phys.MSSQLDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, iORM.AbstractionLayer.Framework.VCL, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Comp.Client,
  iORM.DB.Components.ConnectionDef, iORM.DB.Components.ConnectionDef.MSSQLServer;

type
  TBuilderForm = class(TForm)
    Memo1: TMemo;
    ioVCL1: TioVCL;
    GenerateSQLiteScriptButton: TButton;
    DatabaseSQLiteEdit: TEdit;
    Label2: TLabel;
    MessageLabel: TLabel;
    CopyScriptButton: TButton;
    CreateDBSQLiteButton: TButton;
    CreateDBMSSQLButton: TButton;
    GenerateMSSQLScriptButton: TButton;
    PasswordMSSQLEdit: TEdit;
    Label4: TLabel;
    UserNameMSSQLEdit: TEdit;
    Label3: TLabel;
    DatabaseMSSQLEdit: TEdit;
    Label1: TLabel;
    ServerMSSQLEdit: TEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CreateDBFBButton: TButton;
    GeneraFBScriptButton: TButton;
    DatabaseFBEdit: TEdit;
    PasswordFBEdit: TEdit;
    UserNameFBEdit: TEdit;
    ServerFBEdit: TEdit;
    Label9: TLabel;
    procedure CreateDBSQLiteButtonClick(Sender: TObject);
    procedure GenerateSQLiteOnlyScriptButtonClick(Sender: TObject);
    procedure CopyScriptButtonClick(Sender: TObject);
    procedure CreateDBMSSQLButtonClick(Sender: TObject);
    procedure GenerateMSSQLScriptButtonClick(Sender: TObject);
    procedure GeneraFBScriptButtonClick(Sender: TObject);
    procedure CreateDBFBButtonClick(Sender: TObject);
  private
    procedure GenerateDB(AOnlyScript: boolean);
  public
    { Public declarations }
  end;

var
  BuilderForm: TBuilderForm;

implementation

{$R *.dfm}

procedure TBuilderForm.CreateDBFBButtonClick(Sender: TObject);
var
  LOutputScript: string;
  LErrorMessage: string;
  LButtonSelected: Integer;
begin
  LButtonSelected := MessageDlg('Confirm DB FB Update', mtConfirmation, mbOKCancel, 0);

  if LButtonSelected = mrOK then
  begin

    // Default Connection
    io.Connections.NewFirebirdConnectionDef(ServerFBEdit.Text,DatabaseFBEdit.Text,UserNameFBEdit.Text,PasswordFBEdit.Text,'UTF8');

    GenerateDB(False);
  end;
end;

procedure TBuilderForm.CreateDBMSSQLButtonClick(Sender: TObject);
var
  LOutputScript: string;
  LErrorMessage: string;
  LButtonSelected: Integer;
begin
  LButtonSelected := MessageDlg('Confirm DB MSSQL Update', mtConfirmation, mbOKCancel, 0);

  if LButtonSelected = mrOK then
  begin

    // Default Connection
    io.Connections.NewSQLServerConnectionDef(ServerMSSQLEdit.Text,DatabaseMSSQLEdit.Text,UserNameMSSQLEdit.Text,PasswordMSSQLEdit.Text);

    GenerateDB(False);
  end;
end;

procedure TBuilderForm.CopyScriptButtonClick(Sender: TObject);
begin
  Clipboard.AsText := Memo1.Lines.Text;
end;

procedure TBuilderForm.CreateDBSQLiteButtonClick(Sender: TObject);
var
  LButtonSelected: Integer;
begin
  LButtonSelected := MessageDlg('Confirm DB Update', mtConfirmation, mbOKCancel, 0);

  if LButtonSelected = mrOK then
  begin

    // Default Connection
    io.Connections.NewSQLiteConnectionDef(DatabaseSQLiteEdit.Text);

    GenerateDB(False);
  end;
end;

procedure TBuilderForm.GeneraFBScriptButtonClick(Sender: TObject);
begin
  // Default Connection
  io.Connections.NewFirebirdConnectionDef(ServerFBEdit.Text,DatabaseFBEdit.Text,UserNameFBEdit.Text,PasswordFBEdit.Text, 'UTF8');
  //

  Memo1.Lines.Clear;

  GenerateDB(True);
end;

procedure TBuilderForm.GenerateDB(AOnlyScript: boolean);
var
  LOutputScript: string;
  LErrorMessage: string;
begin
  // SOLO GENERAZIONE SCRIPT DI CREATE PER TUTTI GLI ELEMENTI DEL DB DA UTILIZZARE PER LA GENERAZIONE INIZIALE
  if io.GlobalFactory.DBBuilderFactory.NewBuilder.GenerateDB(AOnlyScript, LOutputScript, LErrorMessage) then
  begin
    MessageLabel.Caption := 'Script Creation Successful';
    Memo1.Lines.Add(LOutputScript);
  end
  else
  begin
    MessageLabel.Caption := 'Script Creation terminated with errors';
    Memo1.Lines.Add(LErrorMessage);
  end;
end;

procedure TBuilderForm.GenerateMSSQLScriptButtonClick(Sender: TObject);
begin
  // Default Connection
  io.Connections.NewSQLServerConnectionDef(ServerMSSQLEdit.Text,DatabaseMSSQLEdit.Text,UserNameMSSQLEdit.Text,PasswordMSSQLEdit.Text);

  Memo1.Lines.Clear;

  GenerateDB(True);
end;

procedure TBuilderForm.GenerateSQLiteOnlyScriptButtonClick(Sender: TObject);
var
  LOutputScript: string;
  LErrorMessage: string;
begin
  // Default Connection
  io.Connections.NewSQLiteConnectionDef(DatabaseSQLiteEdit.Text);

  Memo1.Lines.Clear;

  GenerateDB(True);
end;

end.
