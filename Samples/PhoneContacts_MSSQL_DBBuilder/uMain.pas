unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  iORM, FireDAC.Phys.MSSQLDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, iORM.AbstractionLayer.Framework.VCL, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Comp.Client,
  iORM.DB.Components.ConnectionDef, iORM.DB.Components.ConnectionDef.MSSQLServer;

type
  TBuilderForm = class(TForm)
    CreateDBButton: TButton;
    Memo1: TMemo;
    ioVCL1: TioVCL;
    procedure CreateDBButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuilderForm: TBuilderForm;

implementation

{$R *.dfm}

procedure TBuilderForm.CreateDBButtonClick(Sender: TObject);
begin
  // Default Connection
  io.Connections.NewSQLServerConnectionDef('VWMARMOTTA\SQLEXPRESS','PIPPO','sa','Daniela73',True,False,False);
  // Master Connection to access metadata and create database
  io.Connections.NewSQLServerConnectionDef('VWMARMOTTA\SQLEXPRESS','MASTER','sa','Daniela73',False,False,False,'MSSQL_MASTER');

  Memo1.Lines.Clear;
  Memo1.Lines.Add(io.GlobalFactory.DBBuilderFactory.NewBuilder.GenerateDBScript('PIPPO'));
end;

end.
