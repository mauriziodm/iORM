unit FormStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.MVVM.Components.ViewContextProvider,
  Vcl.StdCtrls, iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.VCL;

type
  TStartForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    VCProvider: TioViewContextProvider;
    SQLiteConn: TioSQLiteConnectionDef;
    ioVCL1: TioVCL;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure VCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
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
  io.di.LocateViewVM<TLiveBindingsView, IioViewModel>.Get;
end;

procedure TStartForm.Button2Click(Sender: TObject);
begin
  io.di.LocateViewVM<TDataSetView, IioViewModel>.Get;
end;

procedure TStartForm.VCProviderioOnRelease(const Sender: TObject; const AView,
  AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.VCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

end.
