unit FormStart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  iORM.MVVM.Components.ViewContextProvider, iORM.AbstractionLayer.Framework.VCL;

type
  TStartForm = class(TUnimForm)
    FormsVCProvider: TioViewContextProvider;
    ioVCL1: TioVCL;
    procedure FormsVCProviderRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure FormsVCProviderRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure UnimFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function StartForm: TStartForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, FormVC, iORM, V.Interfaces;

function StartForm: TStartForm;
begin
  Result := TStartForm(UniMainModule.GetFormInstance(TStartForm));
end;

procedure TStartForm.FormsVCProviderRelease(const Sender: TObject; const AView,
  AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.FormsVCProviderRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TVCForm.Create(uniGUIApplication.UniApplication);
end;

procedure TStartForm.UnimFormCreate(Sender: TObject);
begin
  // Get the main view
  io.di.LocateView<IMainView>.SetViewContext(Self).Show;
end;

initialization
  RegisterAppFormClass(TStartForm);

end.
