unit FormStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.MVVM.Components.ViewContextProvider,
  Vcl.StdCtrls;

type
  TStartForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  FormViewContext, UViewLiveBindings, iORM, System.Rtti, iORM.MVVM.Interfaces,
  UViewDataSet;

{$R *.dfm}

procedure TStartForm.Button1Click(Sender: TObject);
begin
  io.di.LocateView<TLiveBindingsView, IioViewModel>.Get;
end;

procedure TStartForm.Button2Click(Sender: TObject);
begin
  io.di.LocateView<TDataSetView, IioViewModel>.Get;
end;

end.
