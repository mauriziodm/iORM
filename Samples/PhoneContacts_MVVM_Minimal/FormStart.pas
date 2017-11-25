unit FormStart;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  iORM.DB.Components.ConnectionDef;

type
  TStartForm = class(TForm)
    SQLiteConn: TioSQLiteConnectionDef;
    procedure FormCreate(Sender: TObject);
    procedure SQLiteConnAfterRegister(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  iORM, Interfaces, SampleData;

{$R *.fmx}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  io.di.LocateView<IPersonsView>.SetViewContext(Self).Show;
end;

procedure TStartForm.SQLiteConnAfterRegister(Sender: TObject);
begin
  TSampleData.CheckForSampleDataCreation;
end;

end.
